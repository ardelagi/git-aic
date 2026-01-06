# git-aic Quick Start Guide ⚡

## 1️⃣ Install (30 seconds)

```bash
curl -fsSL https://raw.githubusercontent.com/yourusername/git-aic/main/install.sh | bash
```

## 2️⃣ Setup (1 minute)

### Get API Keys (Choose one):

**🟢 Gemini (Recommended - Free)**

1. Visit: https://makersuite.google.com/app/apikey
1. Click “Create API Key”
1. Copy the key

**🔵 OpenAI**

1. Visit: https://platform.openai.com/api-keys
1. Create new secret key
1. Copy the key

**🟣 Anthropic**

1. Visit: https://console.anthropic.com/
1. Create API key
1. Copy the key

### Get GitHub Token (Optional - for releases):

1. Visit: https://github.com/settings/tokens
1. Generate new token (classic)
1. Select scope: `repo`
1. Copy the token

### Configure:

```bash
git-aic --setup
# Or manual:
git config --global commit-ai.api-key "YOUR_AI_KEY_HERE"
git config --global commit-ai.provider "gemini"

# For GitHub releases (optional):
git config --global commit-ai.github-token "ghp_YOUR_TOKEN"
```

## 3️⃣ Use (5 seconds)

```bash
# In any git repository:
git-aic

# Create GitHub release:
git tag v1.0.0
git-aic-changelog --latest --ai
```

That’s it! 🎉

-----

## Common Commands

|Command                          |Description                |
|---------------------------------|---------------------------|
|`git-aic`                        |Auto commit with AI message|
|`git-aic -d`                     |Preview message only       |
|`git-aic -i`                     |Interactive mode           |
|`git-aic --help`                 |Show help                  |
|`git-aic --setup`                |Run setup wizard           |
|`git-aic-changelog --latest --ai`|Create GitHub release      |
|`git-aic-changelog v1.0.0 --ai`  |Release for specific tag   |
|`git-aic-changelog --setup`      |Setup GitHub token         |

## Example Workflow

```bash
# 1. Make changes
echo "console.log('hello')" > app.js

# 2. Let AI commit
git-aic

# 3. Tag release
git tag v1.0.0

# 4. Create GitHub release
git-aic-changelog v1.0.0 --ai

# 5. Push
git push origin main --tags

# Done! ✅
```

## Tips & Tricks

### 🎯 Better Messages

Make meaningful changes with clear purpose:

```bash
# ❌ Bad: Random changes
echo "test" > file.txt

# ✅ Good: Purpose-driven changes
# Add user authentication to API endpoint
```

### 🔍 Preview First

Always preview for important commits:

```bash
git-aic -d  # Review message
git-aic -i  # Review and edit if needed
```

### 📋 Disable Changelog

For personal projects:

```bash
git config commit-ai.changelog false
```

### 🎨 Custom Style

Create `~/.config/git-ai-commit/template.txt`:

```
Keep titles under 50 characters
Use present tense
Be specific about user impact
```

Then:

```bash
git config --global commit-ai.template "$HOME/.config/git-ai-commit/template.txt"
```

## Troubleshooting (30 seconds)

### “Not in a git repository”

```bash
git init
```

### “API key not configured”

```bash
git config --global commit-ai.api-key "YOUR_KEY"
```

### “Command not found”

```bash
# Add to PATH
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

### “jq not found”

```bash
# Ubuntu/Debian
sudo apt install jq

# macOS
brew install jq
```

## Git Alias (Optional)

```bash
git config --global alias.aic '!git-aic'

# Now use:
git aic
git aic -d
git aic -i
```

## Uninstall

```bash
curl -fsSL https://raw.githubusercontent.com/yourusername/git-aic/main/uninstall.sh | bash
```

-----

## Cost Estimate

**Gemini**: Free (60 requests/minute)
**OpenAI**: ~$0.001 per commit
**Anthropic**: ~$0.003 per commit

For 100 commits/month:

- Gemini: **$0** ✅
- OpenAI: ~$0.10
- Anthropic: ~$0.30

-----

## Need Help?

- 📖 Full docs: `git-aic --help`
- 🐛 Issues: https://github.com/ardelagi/git-aic/issues
- 💬 Discussions: https://github.com/ardelagi/git-aic/discussions

**Happy committing! 🚀**
