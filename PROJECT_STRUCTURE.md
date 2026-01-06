# git-aic Project Structure 📁

Complete overview of all files and their purposes.

## 📂 File Structure

```
git-aic/
├── 📜 Core Scripts
│   ├── git-aic                    # Main commit message generator
│   └── git-aic-changelog          # GitHub release generator
│
├── 🔧 Installation
│   ├── install.sh                 # Automated installer
│   └── uninstall.sh              # Uninstaller
│
├── 📚 Documentation
│   ├── README.md                  # Main documentation
│   ├── QUICKSTART.md             # Quick reference guide
│   ├── EXAMPLES.md               # Real-world usage examples
│   ├── WORKFLOWS.md              # Complete workflow examples
│   ├── GITHUB_CHANGELOG.md       # GitHub release documentation
│   └── PROJECT_STRUCTURE.md      # This file
│
├── ⚙️ Configuration
│   └── template.txt              # Example custom prompt template
│
├── 🤖 CI/CD
│   └── .github/
│       └── workflows/
│           └── ci.yml            # GitHub Actions workflow
│
└── 📄 Optional
    └── LICENSE                    # MIT License
```

## 📜 Core Scripts

### git-aic (Main Script)

**Purpose**: AI-powered git commit message generator

**Features**:

- Multi-AI provider support (Gemini, OpenAI, Anthropic)
- Smart scope detection
- Breaking change detection
- Auto CHANGELOG.md updates
- Dry-run and interactive modes
- Global configuration via git config

**Usage**:

```bash
git-aic                 # Auto commit
git-aic -d              # Preview only
git-aic -i              # Interactive mode
git-aic --release       # Create GitHub release after commit
```

**File Size**: ~15KB
**Dependencies**: bash, git, curl, jq

-----

### git-aic-changelog (GitHub Release Generator)

**Purpose**: Generate beautiful GitHub releases from git commits

**Features**:

- Automatic changelog generation
- Categorized commit groups
- Breaking change highlights
- AI enhancement option
- Draft and pre-release support
- Commit range support

**Usage**:

```bash
git-aic-changelog --latest --ai              # Latest tag with AI
git-aic-changelog v1.0.0 --ai               # Specific tag
git-aic-changelog --range v1.0.0..v1.5.0    # Commit range
git-aic-changelog v2.0.0 --draft            # Draft release
```

**File Size**: ~12KB
**Dependencies**: bash, git, curl, jq

## 🔧 Installation Scripts

### install.sh

**Purpose**: Automated installation of git-aic tools

**What it does**:

1. Checks dependencies (git, curl, jq)
1. Creates `~/.local/bin` directory
1. Downloads or copies scripts
1. Makes scripts executable
1. Checks PATH configuration
1. Offers to add to PATH if needed

**Usage**:

```bash
./install.sh
# Or:
curl -fsSL https://raw.githubusercontent.com/ardelagi/git-aic/main/install.sh | bash
```

-----

### uninstall.sh

**Purpose**: Clean removal of git-aic

**What it removes**:

- Scripts from `~/.local/bin`
- Git configuration (optional)
- Custom templates (optional)
- Git aliases (optional)

**Usage**:

```bash
./uninstall.sh
```

## 📚 Documentation Files

### README.md (Main Documentation)

**Sections**:

- Features overview
- Installation guide
- Configuration options
- Usage examples
- Troubleshooting
- FAQ

**Target audience**: All users
**Length**: ~500 lines

-----

### QUICKSTART.md

**Purpose**: Get users up and running in 2 minutes

**Sections**:

- Installation (30 seconds)
- Setup (1 minute)
- Usage (5 seconds)
- Common commands
- Quick tips

**Target audience**: New users
**Length**: ~150 lines

-----

### EXAMPLES.md

**Purpose**: Real-world usage scenarios

**Sections**:

- 15 practical scenarios
- Frontend, backend, testing examples
- Different project types
- Pro tips

**Target audience**: Developers learning the tool
**Length**: ~400 lines

-----

### WORKFLOWS.md

**Purpose**: Complete end-to-end workflows

**Sections**:

- Feature development workflow
- Hotfix workflow
- CI/CD automation
- Team collaboration
- Release strategies

**Target audience**: Teams and advanced users
**Length**: ~600 lines

-----

### GITHUB_CHANGELOG.md

**Purpose**: GitHub release documentation

**Sections**:

- Release generation guide
- AI enhancement
- Configuration
- Workflow integration
- Best practices

**Target audience**: Users creating releases
**Length**: ~500 lines

-----

### PROJECT_STRUCTURE.md (This File)

**Purpose**: Project overview and file reference

**Sections**:

- File structure
- File descriptions
- Quick links
- Maintenance guide

**Target audience**: Contributors and maintainers

## ⚙️ Configuration Files

### template.txt

**Purpose**: Example custom prompt template

**Usage**:

```bash
mkdir -p ~/.config/git-ai-commit
cp template.txt ~/.config/git-ai-commit/
git config --global commit-ai.template "$HOME/.config/git-ai-commit/template.txt"
```

**Customization**: Users can modify to change AI behavior

## 🤖 CI/CD Files

### .github/workflows/ci.yml

**Purpose**: Automated testing and releases

**Jobs**:

1. **test**: Run on Ubuntu and macOS
1. **lint**: ShellCheck validation
1. **release**: Create releases on tags
1. **auto-commit-example**: Example workflow

**Triggers**:

- Push to main/develop
- Pull requests
- New releases

## 📊 File Statistics

|File               |Type    |Lines|Purpose          |
|-------------------|--------|-----|-----------------|
|git-aic            |Bash    |~400 |Main script      |
|git-aic-changelog  |Bash    |~350 |Release generator|
|install.sh         |Bash    |~80  |Installer        |
|uninstall.sh       |Bash    |~60  |Uninstaller      |
|README.md          |Markdown|~500 |Main docs        |
|QUICKSTART.md      |Markdown|~150 |Quick guide      |
|EXAMPLES.md        |Markdown|~400 |Examples         |
|WORKFLOWS.md       |Markdown|~600 |Workflows        |
|GITHUB_CHANGELOG.md|Markdown|~500 |Release docs     |
|template.txt       |Text    |~30  |Template         |
|ci.yml             |YAML    |~100 |CI/CD            |

**Total**: ~3,000 lines across 11 files

## 🚀 Quick Links

### For Users

- [Quick Start](QUICKSTART.md) - Get started in 2 minutes
- [Examples](EXAMPLES.md) - See real usage
- [Main Docs](README.md) - Complete documentation

### For Developers

- [Workflows](WORKFLOWS.md) - Development workflows
- [GitHub Releases](GITHUB_CHANGELOG.md) - Release process
- [CI/CD](.github/workflows/ci.yml) - Automation setup

### For Contributors

- Core script: <git-aic>
- Release script: <git-aic-changelog>
- Installation: <install.sh>

## 🔄 Update Workflow

When updating the project:

1. **Update version number** in scripts:
- `git-aic` (VERSION variable)
- `git-aic-changelog` (VERSION variable)
1. **Update documentation**:
- README.md for new features
- EXAMPLES.md for new use cases
- WORKFLOWS.md for new workflows
1. **Test changes**:
   
   ```bash
   bash -n git-aic           # Syntax check
   bash -n git-aic-changelog
   ./install.sh              # Test install
   git-aic --help            # Test help
   git-aic-changelog --help
   ```
1. **Create release**:
   
   ```bash
   git tag v2.1.0
   git push origin v2.1.0
   # GitHub Actions will create release
   ```

## 📦 Distribution

### GitHub Release

Files included in release:

- `git-aic` (standalone executable)
- `git-aic-changelog` (standalone executable)
- `install.sh`
- All documentation as assets

### Installation Methods

1. **Automated** (recommended):
   
   ```bash
   curl -fsSL https://raw.githubusercontent.com/ardelagi/git-aic/main/install.sh | bash
   ```
1. **Manual**:
   
   ```bash
   curl -fsSL https://raw.githubusercontent.com/ardelagi/git-aic/main/git-aic -o ~/.local/bin/git-aic
   curl -fsSL https://raw.githubusercontent.com/ardelagi/git-aic/main/git-aic-changelog -o ~/.local/bin/git-aic-changelog
   chmod +x ~/.local/bin/git-aic*
   ```
1. **From source**:
   
   ```bash
   git clone https://github.com/ardelagi/git-aic
   cd git-aic
   ./install.sh
   ```

## 🛠️ Maintenance

### Dependencies

**Required**:

- bash (4.0+)
- git (2.0+)
- curl
- jq

**Optional**:

- AI API key (Gemini/OpenAI/Anthropic)
- GitHub token (for releases)

### Testing

```bash
# Test scripts
bash -n git-aic
bash -n git-aic-changelog

# Test installation
./install.sh
git-aic --version
git-aic-changelog --version

# Test functionality
cd /tmp/test-repo
git init
echo "test" > test.txt
git-aic -d  # Dry run test
```

### Compatibility

- ✅ Linux (Ubuntu, Debian, Arch, etc.)
- ✅ macOS
- ✅ WSL (Windows Subsystem for Linux)
- ❌ Windows (use WSL or Git Bash)

## 📝 Documentation Standards

### Markdown Style

- Use emoji headers (🚀, 📚, etc.)
- Code blocks with language specification
- Tables for structured data
- Clear section hierarchy

### Code Style

- Bash: Use shellcheck-compliant code
- Comments for complex logic
- Function documentation
- Error handling

### Version Format

- Semantic versioning: vX.Y.Z
- CHANGELOG.md for tracking changes
- Git tags for releases

## 🎯 Goals

### Current (v2.0.0)

- ✅ Multi-AI provider support
- ✅ GitHub release generation
- ✅ Complete documentation
- ✅ CI/CD automation

### Future (v2.1.0+)

- [ ] Local LLM support (Ollama)
- [ ] VSCode extension
- [ ] GUI application
- [ ] Team conventions learning
- [ ] Multi-language support

## 🤝 Contributing

To contribute:

1. Fork the repository
1. Create feature branch
1. Make changes
1. Test thoroughly
1. Submit pull request

See detailed structure above for file locations and purposes.

-----

**Project Status**: ✅ Production Ready
**Last Updated**: January 2026
**Maintainer**: [ardelagi]
**License**: MIT
