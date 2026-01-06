# GitHub Changelog Generator 📋

Automatically generate beautiful GitHub releases from your git commits.

## 🌟 Features

- 🤖 **AI-Enhanced**: Optional AI summarization of changes
- 📊 **Categorized**: Automatically groups by commit type
- 🔗 **Linked**: Direct links to commits
- 💥 **Breaking Changes**: Highlights breaking changes
- 📈 **Statistics**: Shows commit counts and ranges
- 🎨 **Beautiful**: Professional markdown formatting
- ⚡ **Fast**: Parses commits efficiently

## 🚀 Quick Start

### 1. Install

```bash
# Download the changelog generator
curl -fsSL https://raw.githubusercontent.com/ardelagi/git-aic/main/git-aic-changelog -o ~/.local/bin/git-aic-changelog
chmod +x ~/.local/bin/git-aic-changelog
```

### 2. Get GitHub Token

1. Visit: https://github.com/settings/tokens
1. Click “Generate new token (classic)”
1. Give it a name: “git-aic-changelog”
1. Select scope: `repo` (Full control of private repositories)
1. Click “Generate token”
1. Copy the token

### 3. Configure

```bash
# Interactive setup
git-aic-changelog --setup

# Or manual
git config --global commit-ai.github-token "ghp_xxxxxxxxxxxxx"
```

### 4. Use

```bash
# Generate release for latest tag
git-aic-changelog --latest

# Generate for specific tag
git-aic-changelog v1.2.0

# With AI enhancement
git-aic-changelog v1.2.0 --ai
```

## 📖 Usage Examples

### Example 1: Create Release for Latest Tag

```bash
# Tag your current commit
git tag v1.0.0

# Generate and publish release
git-aic-changelog --latest --ai
```

**Output:**

```
Repository: yourname/yourproject

📋 Generating changelog for: v1.0.0
📊 Commit range: v0.9.0..v1.0.0

🔍 Analyzing commits...
🤖 Enhancing changelog with AI...

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Release v1.0.0

This release introduces major new features including user authentication,
performance improvements, and comprehensive test coverage. We've also
resolved several critical bugs and enhanced the documentation.

**Full Changelog**: https://github.com/yourname/yourproject/compare/v0.9.0...v1.0.0

## 🚀 Features

- Add JWT authentication system ([a1b2c3d](../../commit/a1b2c3d))
- Implement user profile dashboard ([e4f5g6h](../../commit/e4f5g6h))
- Add real-time notifications ([i7j8k9l](../../commit/i7j8k9l))

## 🐛 Bug Fixes

- Fix memory leak in websocket connections ([m1n2o3p](../../commit/m1n2o3p))
- Resolve race condition in user creation ([q4r5s6t](../../commit/q4r5s6t))

## ⚡ Performance

- Optimize database queries with indexing ([u7v8w9x](../../commit/u7v8w9x))
- Reduce bundle size by 40% ([y1z2a3b](../../commit/y1z2a3b))

---

**15 commits** in this release
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Create GitHub release? (y/n): y
📤 Creating GitHub release...
✅ Release created successfully!
🔗 https://github.com/yourname/yourproject/releases/tag/v1.0.0
```

### Example 2: Preview Without Publishing

```bash
git-aic-changelog v1.0.0 --dry-run
```

Shows the changelog without creating a GitHub release.

### Example 3: Create Draft Release

```bash
git-aic-changelog v2.0.0 --draft --ai
```

Creates a draft release that you can review and edit before publishing.

### Example 4: Pre-release

```bash
git tag v2.0.0-beta.1
git-aic-changelog v2.0.0-beta.1 --prerelease --ai
```

Marks the release as a pre-release (not ready for production).

### Example 5: Custom Commit Range

```bash
git-aic-changelog --range v1.0.0..v1.5.0 --ai
```

Generate changelog for a specific range of commits.

### Example 6: Integrated with git-aic

```bash
# Make changes
echo "new feature" > feature.js

# Commit with AI
git-aic

# Tag the release
git tag v1.0.0

# Create GitHub release
git-aic --changelog-only v1.0.0
```

Or all in one:

```bash
# Make changes
echo "new feature" > feature.js

# Commit and prepare for release
git-aic

# Tag
git tag v1.0.0

# Push with tags
git push origin main --tags

# Create release
git-aic --release
```

## 📊 Changelog Categories

The tool automatically categorizes commits:

|Emoji|Category     |Commit Types|
|-----|-------------|------------|
|🚀    |Features     |`feat:`     |
|🐛    |Bug Fixes    |`fix:`      |
|⚡    |Performance  |`perf:`     |
|♻️    |Refactoring  |`refactor:` |
|📚    |Documentation|`docs:`     |
|💄    |Styles       |`style:`    |
|✅    |Tests        |`test:`     |
|📦    |Build        |`build:`    |
|👷    |CI/CD        |`ci:`       |
|🔧    |Chores       |`chore:`    |

## 💥 Breaking Changes Detection

Automatically detects and highlights breaking changes:

```markdown
## ⚠️ BREAKING CHANGES

- **BREAKING**: Remove deprecated API v1 endpoints ([abc123](../../commit/abc123))
- **BREAKING**: Change authentication flow to OAuth2 ([def456](../../commit/def456))
```

Breaking changes are detected from:

- `!` in commit type: `feat!:` or `fix!:`
- “BREAKING CHANGE” in commit body

## 🤖 AI Enhancement

When using `--ai` flag, the changelog is enhanced with:

1. **Release Summary**: 2-3 sentence overview
1. **Highlighted Changes**: Most important updates
1. **User-Friendly Language**: Technical but accessible
1. **Professional Tone**: Production-ready release notes

**Before AI:**

```markdown
## 🚀 Features
- Add user authentication ([abc123](../../commit/abc123))
- Add password reset ([def456](../../commit/def456))
```

**After AI:**

```markdown
This release introduces a comprehensive authentication system with secure
JWT tokens and password recovery, significantly improving account security.

## 🚀 Features
- Add user authentication with JWT tokens ([abc123](../../commit/abc123))
- Add password reset via email verification ([def456](../../commit/def456))
```

## ⚙️ Configuration

### GitHub Token

```bash
# Global configuration (recommended)
git config --global commit-ai.github-token "ghp_xxxxx"

# Per-repository
git config commit-ai.github-token "ghp_xxxxx"

# Environment variable
export GITHUB_TOKEN="ghp_xxxxx"
```

### AI Provider (for –ai flag)

```bash
git config --global commit-ai.provider "gemini"  # or openai, anthropic
git config --global commit-ai.api-key "your-ai-api-key"
```

## 🔄 Workflow Integration

### Automated Release Workflow

Create `.github/workflows/release.yml`:

```yaml
name: Create Release

on:
  push:
    tags:
      - 'v*'

jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0
      
      - name: Install git-aic-changelog
        run: |
          curl -fsSL https://raw.githubusercontent.com/yourusername/git-aic/main/git-aic-changelog -o /usr/local/bin/git-aic-changelog
          chmod +x /usr/local/bin/git-aic-changelog
      
      - name: Create Release
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        run: |
          git-aic-changelog --latest --ai
```

### Manual Release Process

```bash
# 1. Make sure you're on main
git checkout main
git pull

# 2. Update version in package.json, etc.
npm version patch  # or minor, major

# 3. Commit changes (optional, if not using git-aic)
git-aic  # or: git commit -m "chore: bump version to 1.2.3"

# 4. Create and push tag
git tag v1.2.3
git push origin main --tags

# 5. Create GitHub release
git-aic-changelog v1.2.3 --ai
```

### Semantic Release Integration

```bash
# After semantic-release creates a tag
npx semantic-release

# Then create the changelog
git fetch --tags
git-aic-changelog --latest --ai
```

## 🎨 Customization

### Custom Release Template

The AI enhancement uses your commit-ai template if configured:

```bash
# Create template
cat > ~/.config/git-ai-commit/release-template.txt << 'EOF'
When creating release notes:
- Focus on user-facing changes
- Highlight performance improvements with metrics
- Explain breaking changes clearly
- Use professional but friendly tone
EOF

# Configure
git config --global commit-ai.template "$HOME/.config/git-ai-commit/release-template.txt"
```

### Release Types

```bash
# Stable release
git-aic-changelog v1.0.0

# Pre-release
git-aic-changelog v1.0.0-rc.1 --prerelease

# Draft (review before publishing)
git-aic-changelog v1.0.0 --draft

# With AI enhancement
git-aic-changelog v1.0.0 --draft --ai
```

## 🔒 Security

### Token Permissions

Required GitHub token scopes:

- ✅ `repo` - Full control of private repositories

The token is used to:

- Create releases
- Upload release notes
- Link to commits

### Best Practices

1. **Use Fine-Grained Tokens**: When available, prefer fine-grained tokens
1. **Limit Scope**: Only grant `repo` access to necessary repositories
1. **Store Securely**: Use git config, not environment files
1. **Rotate Regularly**: Generate new tokens periodically
1. **CI/CD**: Use GitHub Actions secrets for automation

## 🐛 Troubleshooting

### “GitHub token not configured”

```bash
# Check current configuration
git config --get commit-ai.github-token

# Set token
git-aic-changelog --setup
```

### “Cannot parse GitHub repository”

Make sure you have a GitHub remote:

```bash
git remote -v
# Should show: origin  https://github.com/user/repo.git

# Add remote if missing
git remote add origin https://github.com/yourname/yourrepo.git
```

### “No commits found in range”

```bash
# Check your tags
git tag -l

# Make sure tags exist and have commits between them
git log v1.0.0..v1.1.0
```

### “Release already exists”

The tag already has a release. Options:

1. Delete the existing release on GitHub
1. Use a different tag
1. Edit the existing release manually

### AI Enhancement Not Working

```bash
# Check AI provider configuration
git config --get commit-ai.provider
git config --get commit-ai.api-key

# Set if missing
git config --global commit-ai.provider "gemini"
git config --global commit-ai.api-key "your-key"
```

## 📈 Best Practices

### 1. Semantic Versioning

```bash
# Patch: v1.0.0 -> v1.0.1 (bug fixes)
git tag v1.0.1

# Minor: v1.0.0 -> v1.1.0 (new features)
git tag v1.1.0

# Major: v1.0.0 -> v2.0.0 (breaking changes)
git tag v2.0.0
```

### 2. Meaningful Commits

Good commit messages = good changelogs:

```bash
# ❌ Bad
git commit -m "fix stuff"

# ✅ Good (use git-aic!)
git-aic
# Output: fix(auth): resolve token expiration issue
```

### 3. Regular Releases

```bash
# Weekly releases for active projects
git-aic-changelog --latest --ai

# Tag naming: v1.0.0, v1.1.0, v1.2.0
```

### 4. Breaking Changes

Always document breaking changes:

```bash
# In commit message
git commit -m "feat!: change API response format

BREAKING CHANGE: All API responses now use camelCase instead of snake_case"
```

### 5. Pre-releases for Testing

```bash
# Beta release
git tag v2.0.0-beta.1
git-aic-changelog v2.0.0-beta.1 --prerelease

# Release candidate
git tag v2.0.0-rc.1
git-aic-changelog v2.0.0-rc.1 --prerelease
```

## 🆚 Comparison

|Feature             |git-aic-changelog|standard-version|semantic-release|
|--------------------|-----------------|----------------|----------------|
|AI Enhancement      |✅                |❌               |❌               |
|GitHub Integration  |✅                |❌               |✅               |
|Conventional Commits|✅                |✅               |✅               |
|Breaking Changes    |✅                |✅               |✅               |
|Commit Links        |✅                |❌               |✅               |
|Manual Control      |✅                |✅               |❌               |
|Zero Config         |✅                |❌               |❌               |

## 📚 Resources

- [Conventional Commits](https://www.conventionalcommits.org/)
- [Semantic Versioning](https://semver.org/)
- [GitHub Releases](https://docs.github.com/en/repositories/releasing-projects-on-github)
- [Keep a Changelog](https://keepachangelog.com/)

## 🤝 Contributing

Found a bug or have a feature request? Open an issue!

## 📄 License

MIT License - Use freely!

-----

**Happy releasing! 🚀**
