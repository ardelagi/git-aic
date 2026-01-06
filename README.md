# git-aic 🤖

AI-powered git commit message generator that works globally across all your repositories.

## ✨ Features

- 🌍 **Global**: Works in any git repository
- 🤖 **Multi-AI**: Support for Gemini, OpenAI, and Anthropic
- 🎯 **Smart Scope Detection**: Automatically detects project structure
- 💥 **Breaking Change Detection**: Identifies breaking changes
- 📋 **Auto Changelog**: Maintains CHANGELOG.md automatically
- 🚀 **GitHub Releases**: Generate beautiful GitHub releases
- 🎨 **Conventional Commits**: Follows industry standards
- 🔍 **Preview Mode**: Review before committing
- ⚙️ **Highly Configurable**: Customize to your workflow

## 🚀 Quick Start

### Installation

```bash
# Download installer
curl -fsSL https://raw.githubusercontent.com/yourusername/git-aic/main/install.sh | bash

# Or manual install
curl -fsSL https://raw.githubusercontent.com/yourusername/git-aic/main/git-aic -o ~/.local/bin/git-aic
chmod +x ~/.local/bin/git-aic
```

### Setup

```bash
# Interactive setup wizard
git-aic --setup

# Or manual configuration
git config --global commit-ai.api-key "YOUR_GEMINI_API_KEY"
git config --global commit-ai.provider "gemini"

# For GitHub releases (optional)
git config --global commit-ai.github-token "YOUR_GITHUB_TOKEN"
```

### Usage

```bash
# Auto commit with AI-generated message
git-aic

# Preview message without committing
git-aic -d

# Interactive mode (review before commit)
git-aic -i

# Create GitHub release after commit
git tag v1.0.0
git-aic --release

# Or generate GitHub release separately
git-aic-changelog --latest --ai
git-aic-changelog v1.0.0 --ai
```

## 📖 Configuration

### Get API Keys

**Gemini (Google)** - Free tier available

```bash
# Get key from: https://makersuite.google.com/app/apikey
git config --global commit-ai.api-key "YOUR_GEMINI_KEY"
git config --global commit-ai.provider "gemini"
git config --global commit-ai.model "gemini-2.0-flash-exp"
```

**OpenAI (GPT)**

```bash
# Get key from: https://platform.openai.com/api-keys
git config --global commit-ai.api-key "YOUR_OPENAI_KEY"
git config --global commit-ai.provider "openai"
```

**Anthropic (Claude)**

```bash
# Get key from: https://console.anthropic.com/
git config --global commit-ai.api-key "YOUR_ANTHROPIC_KEY"
git config --global commit-ai.provider "anthropic"
```

### All Configuration Options

```bash
# Provider (gemini, openai, anthropic)
git config --global commit-ai.provider "gemini"

# API Key for AI
git config --global commit-ai.api-key "YOUR_KEY"

# GitHub Token for releases (optional)
git config --global commit-ai.github-token "ghp_xxxxx"

# Model name
git config --global commit-ai.model "gemini-2.0-flash-exp"

# Enable/disable changelog
git config --global commit-ai.changelog "true"

# Max diff size (characters)
git config --global commit-ai.max-diff-size "12000"

# Custom prompt template
git config --global commit-ai.template "$HOME/.config/git-ai-commit/template.txt"
```

## 🎯 Scope Detection

The tool automatically detects project scope based on file paths:

|Scope   |Detected Paths                       |
|--------|-------------------------------------|
|`ui`    |`components/`, `src/components/`     |
|`pages` |`pages/`, `views/`                   |
|`api`   |`api/`, `routes/`, `controllers/`    |
|`core`  |`services/`, `lib/`, `utils/`        |
|`db`    |`migrations/`, `database/`, `prisma/`|
|`infra` |`docker/`, `.github/`, `deploy/`     |
|`test`  |`test/`, `__tests__/`, `spec/`       |
|`config`|`.env`, `.yml`, `.json`, `.toml`     |
|`docs`  |`.md`, `.rst`, `.adoc`               |
|`style` |`.css`, `.scss`, `.sass`             |

## 💥 Breaking Change Detection

Automatically detects breaking changes from:

- Deleted files
- Removed exports/functions
- Major version bumps (x.0.0)
- “BREAKING CHANGE” in commit body

## 📋 CHANGELOG.md

Automatically maintains a changelog with format:

```markdown
# Changelog

## 2026-01-06
- feat(api): add user authentication endpoint
- fix(ui): resolve button alignment issue

## 2026-01-05
- refactor(core): optimize database queries
```

Disable with:

```bash
git config --global commit-ai.changelog "false"
```

## 🎨 Custom Templates

Create custom prompt templates:

```bash
# Create template file
mkdir -p ~/.config/git-ai-commit
cat > ~/.config/git-ai-commit/template.txt << 'EOF'
Additional instructions:
- Use present tense
- Maximum 50 characters for title
- Focus on user-facing changes
EOF

# Configure
git config --global commit-ai.template "$HOME/.config/git-ai-commit/template.txt"
```

## 🔧 Advanced Usage

### Per-Repository Configuration

Override global settings for specific repos:

```bash
cd your-repo
git config commit-ai.provider "openai"
git config commit-ai.changelog "false"
```

### Git Alias

Add as git subcommand:

```bash
git config --global alias.aic '!git-aic'

# Now use:
git aic
git aic -d
git aic -i
```

### Pre-commit Hook

```bash
# .git/hooks/pre-commit
#!/bin/bash
git-aic -i
```

## 📝 Command Line Options

```
git-aic [OPTIONS]

OPTIONS:
  -h, --help              Show help message
  -v, --version           Show version
  -d, --dry-run           Preview message without committing
  -i, --interactive       Review and edit before committing
  --setup                 Run interactive setup wizard
  --release               Create GitHub release after commit
  --changelog-only TAG    Generate GitHub release for existing tag

git-aic-changelog [OPTIONS] [TAG]

OPTIONS:
  -h, --help              Show help message
  -v, --version           Show version
  -d, --dry-run           Preview without creating release
  -l, --latest            Generate from latest tag
  -r, --range START..END  Generate from commit range
  --draft                 Create as draft release
  --prerelease            Mark as pre-release
  --ai                    Use AI to enhance changelog
  --setup                 Setup GitHub token
```

## 🤝 Examples

### Basic Usage

```bash
# Make changes
echo "console.log('hello')" > app.js

# Auto commit
git-aic
# Output:
# 🔍 Analyzing changes...
# 🤖 Generating commit message...
# 
# 📝 Generated commit message:
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# feat: add hello world logging
# 
# - Implement console logging for hello message
# - Add new JavaScript file for application entry
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# 
# ✅ Commit created successfully
```

### Preview Mode

```bash
git-aic -d
# Shows message but doesn't commit
```

### Interactive Mode

```bash
git-aic -i
# Accept this message? (y/n/e to edit): e
# [Opens editor]
```

## 🛠️ Troubleshooting

### “Not a git repository” error

```bash
# Make sure you're in a git repo
git init
```

### “API key not configured” error

```bash
# Run setup
git-aic --setup

# Or set manually
git config --global commit-ai.api-key "YOUR_KEY"
```

### “Failed to generate commit message” error

```bash
# Check API key is valid
git config --get commit-ai.api-key

# Check internet connection
curl -I https://generativelanguage.googleapis.com

# Try different provider
git config --global commit-ai.provider "openai"
```

### Empty or poor quality messages

```bash
# Increase diff size
git config --global commit-ai.max-diff-size "20000"

# Use custom template for better instructions
git config --global commit-ai.template "$HOME/.config/git-ai-commit/template.txt"
```

## 🔒 Security

- API keys are stored in git config (local to your machine)
- Never commit `.gitconfig` with API keys
- Use environment variables for CI/CD:

```bash
export COMMIT_AI_API_KEY="your-key"
```

## 🤔 FAQ

**Q: Does this work with GitHub Actions?**
A: Yes! Set API key as GitHub secret and run in workflow.

**Q: Can I use different providers per repo?**
A: Yes! Use local config: `git config commit-ai.provider "openai"`

**Q: How much does it cost?**
A: Gemini has free tier. OpenAI ~$0.001 per commit. Anthropic ~$0.003 per commit.

**Q: Can I customize commit format?**
A: Yes! Use custom template file for specific instructions.

**Q: Does it work offline?**
A: No, requires internet for AI API calls.

## 📄 License

MIT License - feel free to use and modify!

## 🙏 Credits

- Conventional Commits: https://www.conventionalcommits.org/
- Gemini API: https://ai.google.dev/
- OpenAI API: https://openai.com/api/
- Anthropic API: https://anthropic.com/

## 🚀 Roadmap

- [ ] Support for local LLMs (Ollama)
- [ ] Commit message templates per project type
- [ ] Multi-language support
- [ ] VSCode extension
- [ ] Commit history analysis
- [ ] Team conventions learning

-----

**Star ⭐ this repo if you find it useful!**
