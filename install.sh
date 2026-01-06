#!/bin/bash

# =============================================================================
# git-aic Installer
# =============================================================================

set -e

INSTALL_DIR="$HOME/.local/bin"
SCRIPT_NAME="git-aic"
CHANGELOG_SCRIPT="git-aic-changelog"
REPO_URL="https://raw.githubusercontent.com/ardelagi/git-aic/main/git-aic"
CHANGELOG_URL="https://raw.githubusercontent.com/ardelagi/git-aic/main/git-aic-changelog"

echo "==================================="
echo "   git-aic Installer"
echo "==================================="
echo ""

# Check dependencies
echo "📦 Checking dependencies..."
MISSING_DEPS=()

for cmd in git curl jq; do
  if ! command -v $cmd &> /dev/null; then
    MISSING_DEPS+=("$cmd")
  fi
done

if [ ${#MISSING_DEPS[@]} -gt 0 ]; then
  echo "❌ Missing dependencies: ${MISSING_DEPS[*]}"
  echo ""
  echo "Install them with:"
  echo "  Ubuntu/Debian: sudo apt install git curl jq"
  echo "  macOS:         brew install git curl jq"
  echo "  Arch:          sudo pacman -S git curl jq"
  exit 1
fi

echo "✓ All dependencies found"
echo ""

# Create install directory
echo "📁 Creating installation directory..."
mkdir -p "$INSTALL_DIR"

# Download or copy script
if [ -f "git-aic" ]; then
  echo "📥 Installing from local files..."
  cp git-aic "$INSTALL_DIR/$SCRIPT_NAME"
  if [ -f "git-aic-changelog" ]; then
    cp git-aic-changelog "$INSTALL_DIR/$CHANGELOG_SCRIPT"
  fi
else
  echo "📥 Downloading latest version..."
  curl -fsSL "$REPO_URL" -o "$INSTALL_DIR/$SCRIPT_NAME"
  curl -fsSL "$CHANGELOG_URL" -o "$INSTALL_DIR/$CHANGELOG_SCRIPT"
fi

# Make executable
chmod +x "$INSTALL_DIR/$SCRIPT_NAME"
chmod +x "$INSTALL_DIR/$CHANGELOG_SCRIPT"

echo "✓ Scripts installed:"
echo "  - $INSTALL_DIR/$SCRIPT_NAME"
echo "  - $INSTALL_DIR/$CHANGELOG_SCRIPT"
echo ""

# Check if directory is in PATH
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
  echo "⚠️  Warning: $INSTALL_DIR is not in your PATH"
  echo ""
  echo "Add this to your ~/.bashrc or ~/.zshrc:"
  echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
  echo ""
  read -p "Add to PATH now? (y/n): " add_path
  
  if [ "$add_path" = "y" ]; then
    SHELL_RC="$HOME/.bashrc"
    if [ -n "$ZSH_VERSION" ]; then
      SHELL_RC="$HOME/.zshrc"
    fi
    
    echo "" >> "$SHELL_RC"
    echo "# git-aic" >> "$SHELL_RC"
    echo "export PATH=\"\$HOME/.local/bin:\$PATH\"" >> "$SHELL_RC"
    
    echo "✓ Added to $SHELL_RC"
    echo "  Run: source $SHELL_RC"
  fi
fi

echo ""
echo "✅ Installation complete!"
echo ""
echo "Next steps:"
echo "  1. Run: git-aic --setup (for commit messages)"
echo "  2. Run: git-aic-changelog --setup (for GitHub releases)"
echo "  3. Or manually configure:"
echo "     git config --global commit-ai.api-key YOUR_KEY"
echo "     git config --global commit-ai.provider gemini"
echo "     git config --global commit-ai.github-token YOUR_GITHUB_TOKEN"
echo ""
echo "Usage:"
echo "  git-aic              # Auto commit with AI"
echo "  git-aic -d           # Preview only"
echo "  git-aic -i           # Interactive"
echo "  git-aic --release    # Create GitHub release after commit"
echo ""
echo "  git-aic-changelog --latest    # Generate GitHub release"
echo "  git-aic-changelog v1.0.0 --ai # With AI enhancement"
echo ""
