# 🦛 Zipopotamus

> The Deployment Hippo That Never Forgets Your Files!

Zipopotamus is a universal deployment packaging tool for web projects. Like a hippo's amazing memory, it remembers all your project files and packages them perfectly for deployment, while intelligently excluding the stuff you don't need.

## 🚀 Quick Start

### One-line Install (Global)
```bash
curl -sSL https://raw.githubusercontent.com/yxanu/zipopotamus/main/install.sh | bash
```
*Note: Requires sudo privileges. Will prompt to use `--project` if not available.*

### Project-only Install
```bash
curl -sSL https://raw.githubusercontent.com/yxanu/zipopotamus/main/install.sh | bash -s -- --project
```

### Manual Install
```bash
git clone https://github.com/yxanu/zipopotamus.git
cd zipopotamus
chmod +x zipopotamus install.sh
./install.sh
```

## 🦛 Usage

### Basic Usage
```bash
# Create deployment package with defaults
zipopotamus

# Custom project name and output directory
zipopotamus -n "my-awesome-app" -o "./deployments"

# Show help
zipopotamus --help
```

### Environment Variables
```bash
PROJECT_NAME="my-app" OUTPUT_DIR="./dist" zipopotamus
```

## ⚙️ Configuration

Create a `.zipopotamus.config` file in your project root. Here are the available options:

```bash
# Project name (defaults to directory name)
PROJECT_NAME="my-awesome-project"

# Output directory for deployment package (defaults to current directory)
OUTPUT_DIR="/path/to/deployments"

# Command to build frontend assets (e.g., "npm run build")
BUILD_COMMAND=""

# Whether to include the vendor directory (true or false)
# Set to "true" if you can't run "composer install" on your server
INCLUDE_VENDOR="true"

# Directory containing frontend source files to exclude
FRONTEND_SRC_DIR="resources"

# Custom deployignore file (defaults to .zipopotamus.ignore)
DEPLOYIGNORE_FILE=".zipopotamus.ignore"

# Custom exclude patterns (overrides defaults if set)
CUSTOM_EXCLUDES=(
  "*.log"
  "node_modules/*"
  "storage/logs/*"
)

# Custom upload message
UPLOAD_MESSAGE="🦛 Zipopotamus says: Deploy away!"
```

See the `.zipopotamus.craft-vite.config.example` file for a real-world example.

## 📝 Ignore Files

Create a `.zipopotamus.ignore` file to exclude specific files/directories:

```
# Version control
.git/
.gitignore

# Dependencies
node_modules/

# Build artifacts
*.map
*.log
*.zip
*.tar.gz

# Runtime/cache directories
storage/runtime/*
storage/logs/*
cache/
tmp/
temp/

# System files
.DS_Store
Thumbs.db

# Environment files
.env
.env.*
!.env.example

# Database files
*.sql
*.sqlite
```

## 🛠️ Command Line Options

```
OPTIONS:
  -h, --help        Show help message
  -v, --version     Show version
  -c, --config FILE Use custom config file
  -o, --output DIR  Output directory for deployment package
  -n, --name NAME   Project name for the package
```

## 🏗️ Framework-Specific Examples

<details>
<summary>🎯 Craft CMS with Vite & Tailwind</summary>

This setup is optimized for deploying a Craft CMS project with a modern frontend build process to a managed hosting provider that accepts a zip file.

**`.zipopotamus.config`:**
```bash
# 🦛 Zipopotamus Configuration for Craft CMS + Vite

# Project name
PROJECT_NAME="my-craft-project"

# Output directory for the zip file
OUTPUT_DIR="./dist"

# Build command for Vite and Tailwind
BUILD_COMMAND="npm run build"

# Include the vendor directory since we can't run composer on the server
INCLUDE_VENDOR="true"

# Exclude the frontend source files
FRONTEND_SRC_DIR="resources"
```

**Explanation:**

*   `BUILD_COMMAND="npm run build"`: This will run your Vite build process to compile your assets before packaging.
*   `INCLUDE_VENDOR="true"`: This is important for managed hosting where you can't run `composer install`. It ensures that your PHP dependencies are included in the zip file.
*   `FRONTEND_SRC_DIR="resources"`: This excludes your frontend source files (like your uncompiled CSS and JS) from the production build, keeping your package small.

With this configuration, `zipopotamus` will:
1.  Run `npm run build` to generate your production assets.
2.  Create a zip file that includes your compiled assets and PHP dependencies (`vendor` directory).
3.  Exclude development files and directories, giving you a clean, optimized package for deployment.

</details>

<details>
<summary>🚀 Laravel</summary>

```bash
# .zipopotamus.config
PROJECT_NAME="laravel-app"
BUILD_COMMAND="npm run prod"
INCLUDE_VENDOR="false" # Assuming you run composer install on the server
FRONTEND_SRC_DIR="resources"

CUSTOM_EXCLUDES=(
  "storage/logs/*"
  "storage/framework/cache/*"
  "storage/framework/sessions/*"
  "storage/framework/views/*"
  ".env"
  "tests/*"
)
```
</details>

<details>
<summary>⚛️ React/Next.js</summary>

```bash
# .zipopotamus.config
PROJECT_NAME="react-app"
BUILD_COMMAND="npm run build"
INCLUDE_VENDOR="false"

CUSTOM_EXCLUDES=(
  ".next/*"
  "build/*"
  ".env.local"
  "coverage/*"
)
```
</details>

## 🔧 Installation Options

### Global Installation
Installs to `/usr/local/bin` - available system-wide
```bash
./install.sh --global
```

### Project Installation
Installs to `./scripts/zipopotamus` - project-specific
```bash
./install.sh --project
```

### Custom Directory
```bash
./install.sh --dir ~/bin
```

### Uninstall
```bash
./install.sh --uninstall
```

## 🦛 Why Zipopotamus?

- **🧠 Smart Memory**: Like hippos, it remembers everything important and ignores the fluff
- **🎯 Framework Agnostic**: Works with any web project structure
- **⚡ Fast & Reliable**: Quick packaging with sensible defaults
- **🛡️ Safe**: Validates configuration and dependencies
- **🎨 Customizable**: Flexible configuration for any workflow
- **🧹 Clean**: Automatically excludes temporary files, logs, and build artifacts
- **📦 Optimized**: Creates minimal deployment packages by excluding unnecessary files
- **😊 Fun**: Because deployment doesn't have to be boring!

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch: `git checkout -b feature/amazing-feature`
3. Commit your changes: `git commit -m 'Add amazing feature'`
4. Push to the branch: `git push origin feature/amazing-feature`
5. Open a Pull Request

## 📜 License

MIT License - see the [LICENSE](LICENSE) file for details.

## 🦛 Fun Facts About Hippos

- Hippos can hold their breath for up to 5 minutes underwater
- They have excellent memory and can remember locations for years
- Despite their size, they're surprisingly fast on land
- They're great at keeping things organized (just like your deployments!)

---