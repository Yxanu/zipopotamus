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

Create a `.zipopotamus.config` file in your project root:

```bash
# Project name (defaults to directory name)
PROJECT_NAME="my-awesome-project"

# Output directory for deployment package (defaults to current directory)
OUTPUT_DIR="/path/to/deployments"

# Custom deployignore file (defaults to .zipopotamus.ignore)
DEPLOYIGNORE_FILE=".zipopotamus.ignore"

# Custom exclude patterns (overrides defaults if set)
CUSTOM_EXCLUDES=(
  "*.log"
  "node_modules/*"
  "vendor/*"
  "storage/logs/*"
)

# Dependency directories to check (space-separated)
DEPENDENCY_DIRS="vendor node_modules"

# Custom upload message
UPLOAD_MESSAGE="🦛 Zipopotamus says: Deploy away!"
```

## 📝 Ignore Files

Create a `.zipopotamus.ignore` file to exclude specific files/directories:

```
# Version control
.git/
.gitignore

# Dependencies
node_modules/
vendor/

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

# Temporary files (common patterns)
zi*
tmp*
*.tmp
*.temp
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

## 🌟 Examples

### Craft CMS Project
```bash
zipopotamus -n "my-craft-site" -o "./deployments"
```

### Laravel Project
```bash
# With custom config
echo 'DEPENDENCY_DIRS="vendor"' > .zipopotamus.config
echo 'CUSTOM_EXCLUDES=("storage/logs/*" "storage/framework/cache/*")' >> .zipopotamus.config
zipopotamus
```

### Node.js Project
```bash
# Check for node_modules
echo 'DEPENDENCY_DIRS="node_modules"' > .zipopotamus.config
zipopotamus
```

### WordPress Project
```bash
# Exclude wp-config and uploads
echo 'wp-config.php' > .zipopotamus.ignore
echo 'wp-content/uploads/*' >> .zipopotamus.ignore
zipopotamus -n "wordpress-site"
```

### Handling Large Projects
If you have a large project with temporary files:
```bash
# Create comprehensive ignore file
cp .zipopotamus.ignore.example .zipopotamus.ignore
# Edit to add project-specific patterns like zi*, tmp*, etc.
zipopotamus -n "optimized-package"
```

## 🏗️ Framework-Specific Examples

<details>
<summary>🎯 Craft CMS</summary>

```bash
# .zipopotamus.config
PROJECT_NAME="my-craft-site"
DEPENDENCY_DIRS="vendor"
CUSTOM_EXCLUDES=(
  "storage/runtime/*"
  "storage/logs/*"
  "web/cpresources/*"
  ".env"
)

# .zipopotamus.ignore
storage/backups/
config/license.key
```
</details>

<details>
<summary>🚀 Laravel</summary>

```bash
# .zipopotamus.config
PROJECT_NAME="laravel-app"
DEPENDENCY_DIRS="vendor node_modules"
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
DEPENDENCY_DIRS="node_modules"
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

