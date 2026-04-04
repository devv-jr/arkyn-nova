#!/usr/bin/env bash
set -euo pipefail

# ARKYN NOVA - Debian 12 setup
# - Base minimal
# - i3 + Alacritty
# - Dev tools
# - NVIDIA hybrid support
# - LightDM login manager
# - Basic desktop utilities

SCRIPT_NAME="$(basename "$0")"
TARGET_USER="${SUDO_USER:-}"
INSTALL_NVIDIA=1

usage() {
  cat <<EOF
Usage:
  sudo $SCRIPT_NAME [--user USERNAME] [--no-nvidia]

Options:
  --user USERNAME   User that will receive desktop config files
  --no-nvidia       Skip NVIDIA driver installation
  -h, --help        Show this help

Examples:
  sudo $SCRIPT_NAME --user dev
  sudo $SCRIPT_NAME --user dev --no-nvidia
EOF
}

log() {
  printf '\n[ARKYN NOVA] %s\n' "$*"
}

warn() {
  printf '[WARN] %s\n' "$*" >&2
}

die() {
  printf '[ERROR] %s\n' "$*" >&2
  exit 1
}

require_root() {
  if [[ "${EUID}" -ne 0 ]]; then
    die "Run this script with sudo or as root."
  fi
}

detect_user() {
  if [[ -z "${TARGET_USER}" ]]; then
    warn "No SUDO_USER detected."
    read -r -p "Enter the desktop username: " TARGET_USER
  fi

  if [[ -z "${TARGET_USER}" ]]; then
    die "No target user provided."
  fi

  if ! id "$TARGET_USER" >/dev/null 2>&1; then
    die "User '$TARGET_USER' does not exist."
  fi
}

add_if_available() {
  local pkg="$1"
  if apt-cache show "$pkg" >/dev/null 2>&1; then
    PACKAGES+=("$pkg")
  else
    warn "Package not available in current repos: $pkg"
  fi
}

enable_service() {
  local svc="$1"
  if systemctl list-unit-files | grep -q "^${svc}\.service"; then
    systemctl enable --now "$svc" >/dev/null 2>&1 || warn "Could not enable $svc"
  fi
}

install_base_repo() {
  log "Updating package lists..."
  apt-get update

  log "Upgrading system..."
  DEBIAN_FRONTEND=noninteractive apt-get -y upgrade
}

install_packages() {
  PACKAGES=()

  # Core desktop / X11 / login
  PACKAGES+=(
    xorg
    xinit
    x11-xserver-utils
    x11-utils
    dbus-x11
    lightdm
    lightdm-gtk-greeter
    i3-wm
    i3status
    i3lock
    rofi
    alacritty
    picom
    dunst
    feh
    thunar
    network-manager
    network-manager-gnome
    policykit-1
    policykit-1-gnome
    xdg-user-dirs
    xdg-utils
    mesa-utils
  )

  # Core system / utilities
  PACKAGES+=(
    sudo
    git
    curl
    wget
    unzip
    zip
    tar
    rsync
    gnupg
    ca-certificates
    build-essential
    pkg-config
    htop
    pavucontrol
    pulseaudio-utils
    libnotify-bin
    flameshot
    xclip
    brightnessctl
    btop
    nano
    neovim
    zsh
    bash-completion
    fonts-dejavu-core
    fonts-jetbrains-mono
    fonts-font-awesome
    fonts-noto-color-emoji
  )

  # Dev stack
  PACKAGES+=(
    python3
    python3-pip
    python3-venv
    nodejs
    npm
    ripgrep
    fzf
    jq
    tmux
  )

  # Laptop / power
  PACKAGES+=(
    tlp
    powertop
    acpi
  )

  # Browser
  add_if_available firefox-esr

  # Nice-to-have packages, only if present
  add_if_available starship
  add_if_available bat
  add_if_available fd-find

  # Intel microcode is useful on Intel systems
  add_if_available intel-microcode

  if [[ "$INSTALL_NVIDIA" -eq 1 ]]; then
    # NVIDIA / hybrid graphics
    PACKAGES+=(
      nvidia-driver
      nvidia-settings
      nvidia-prime
      firmware-misc-nonfree
    )
  fi

  log "Installing packages..."
  DEBIAN_FRONTEND=noninteractive apt-get install -y "${PACKAGES[@]}"
}

configure_system() {
  log "Enabling services..."
  enable_service NetworkManager
  enable_service lightdm
  enable_service tlp
  enable_service ufw
  enable_service fail2ban

  log "Setting graphical target as default..."
  systemctl set-default graphical.target || warn "Could not set graphical.target as default"

  log "Creating XDG user dirs..."
  su - "$TARGET_USER" -c 'xdg-user-dirs-update' || warn "Could not initialize XDG user dirs"

  log "Creating fallback X session files..."
  local user_home
  user_home="$(getent passwd "$TARGET_USER" | cut -d: -f6)"

  mkdir -p "$user_home/.config"

  cat > "$user_home/.xinitrc" <<'EOF'
exec i3
EOF

  cat > "$user_home/.xsession" <<'EOF'
exec i3
EOF

  chown "$TARGET_USER:$TARGET_USER" "$user_home/.xinitrc" "$user_home/.xsession"

  log "Adding desktop-related groups to user..."
  usermod -aG video,render,audio,plugdev,netdev,input,scanner,lpadmin "$TARGET_USER" || true
}

configure_firewall() {
  log "Configuring UFW..."
  if command -v ufw >/dev/null 2>&1; then
    ufw allow OpenSSH >/dev/null 2>&1 || true
    ufw --force enable >/dev/null 2>&1 || warn "Could not enable UFW"
  fi
}

post_notes() {
  cat <<EOF

[ARKYN NOVA] Installation completed.

Next steps:
1) Reboot the system.
2) Select the LightDM session if needed.
3) Log in and press:
   - Super + Enter  -> terminal
   - Super + D       -> rofi launcher

Important:
- If NVIDIA packages failed to install, enable Debian repos:
  contrib non-free non-free-firmware
- If you are on secure boot, proprietary NVIDIA drivers may require extra setup.

EOF
}

main() {
  require_root

  while [[ $# -gt 0 ]]; do
    case "$1" in
      --user)
        shift
        [[ $# -gt 0 ]] || die "--user requires a username"
        TARGET_USER="$1"
        ;;
      --no-nvidia)
        INSTALL_NVIDIA=0
        ;;
      -h|--help)
        usage
        exit 0
        ;;
      *)
        die "Unknown option: $1"
        ;;
    esac
    shift
  done

  detect_user
  install_base_repo
  install_packages
  configure_system
  configure_firewall
  post_notes
}

main "$@"