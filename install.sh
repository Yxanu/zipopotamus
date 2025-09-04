#!/usr/bin/env bash
set -euo pipefail

# 🦛 Zipopotamus Installer
# Installs Zipopotamus to your project or globally

VERSION="1.0.0"
INSTALL_DIR="${INSTALL_DIR:-/usr/local/bin}"
PROJECT_INSTALL="${PROJECT_INSTALL:-false}"

show_help() {
  cat << 'EOF'
🦛 Zipopotamus Installer v1.0.0

USAGE:
  curl -sSL https://raw.githubusercontent.com/YOUR_USERNAME/zipopotamus/main/install.sh | bash
  
  # Or download and run locally:
  bash install.sh [OPTIONS]

OPTIONS:
  -h, --help           Show this help message
  -p, --project        Install to current project only (creates scripts/zipopotamus)
  -g, --global         Install globally to /usr/local/bin (default)
  -d, --dir DIR        Custom installation directory
  --uninstall          Remove zipopotamus

EXAMPLES:
  bash install.sh                    # Install globally
  bash install.sh --project          # Install to current project
  bash install.sh --dir ~/bin        # Install to custom directory

🦛 The hippo is ready to help with your deployments!
EOF
}

install_zipopotamus() {
  local install_path="$1"
  local script_dir="$(dirname "$install_path")"
  
  # Create directory if it doesn't exist
  if [[ ! -d "$script_dir" ]]; then
    echo "🦛 Creating directory: $script_dir"
    mkdir -p "$script_dir"
  fi
  
  # Download or copy zipopotamus
  if [[ -f "zipopotamus" ]]; then
    echo "🦛 Installing from local file..."
    cp zipopotamus "$install_path"
  else
    echo "🦛 Downloading zipopotamus from GitHub..."
    curl -sSL "https://raw.githubusercontent.com/YOUR_USERNAME/zipopotamus/main/zipopotamus" -o "$install_path"
  fi
  
  chmod +x "$install_path"
  
  echo "🦛 Zipopotamus installed to: $install_path"
  
  # Add to PATH message if needed
  if [[ "$install_path" == *"/usr/local/bin/"* ]]; then
    echo "🦛 You can now run 'zipopotamus' from anywhere!"
  elif [[ "$PROJECT_INSTALL" == "true" ]]; then
    echo "🦛 You can now run './scripts/zipopotamus' in this project!"
  else
    echo "🦛 Make sure $script_dir is in your PATH to use 'zipopotamus' globally"
  fi
}

uninstall_zipopotamus() {
  local locations=(
    "/usr/local/bin/zipopotamus"
    "./scripts/zipopotamus"
    "$HOME/bin/zipopotamus"
  )
  
  echo "🦛 Removing zipopotamus..."
  
  for location in "${locations[@]}"; do
    if [[ -f "$location" ]]; then
      rm "$location"
      echo "🦛 Removed: $location"
    fi
  done
  
  echo "🦛 Zipopotamus has been uninstalled. The hippo will miss you!"
}

# Parse arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    -h|--help)
      show_help
      exit 0
      ;;
    -p|--project)
      PROJECT_INSTALL="true"
      INSTALL_DIR="./scripts"
      shift
      ;;
    -g|--global)
      PROJECT_INSTALL="false"
      INSTALL_DIR="/usr/local/bin"
      shift
      ;;
    -d|--dir)
      INSTALL_DIR="$2"
      PROJECT_INSTALL="false"
      shift 2
      ;;
    --uninstall)
      uninstall_zipopotamus
      exit 0
      ;;
    *)
      echo "Unknown option: $1"
      show_help
      exit 1
      ;;
  esac
done

# Check permissions for global install
if [[ "$INSTALL_DIR" == "/usr/local/bin" && ! -w "/usr/local/bin" ]]; then
  echo "🦛 Global installation requires sudo privileges"
  echo "🦛 Run with sudo or use --project for local installation"
  exit 1
fi

install_zipopotamus "$INSTALL_DIR/zipopotamus"

echo ""
echo "🦛 Installation complete! Try running:"
if [[ "$PROJECT_INSTALL" == "true" ]]; then
  echo "   ./scripts/zipopotamus --help"
else
  echo "   zipopotamus --help"
fi
echo ""
echo "🦛 Happy deploying!"