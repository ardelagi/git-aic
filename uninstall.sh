#!/bin/bash

# =============================================================================
# git-aic Uninstaller
# =============================================================================

set -e

INSTALL_DIR="$HOME/.local/bin"
SCRIPT_NAME="git-aic"
CONFIG_DIR="$HOME/.config/git-ai-commit"

echo "==================================="
echo "   git-aic Uninstaller"
echo "==================================="
echo ""

# Confirm uninstall
read -p "Are you sure you want to uninstall git-aic? (y/n): " confirm

if [ "$confirm" != "y" ]; then
  echo "❌ Uninstall cancelled"
  exit 0
fi

echo ""
echo "🗑️  Removing git-aic..."

# Remove script
if [ -f "$INSTALL_DIR/$SCRIPT_NAME" ]; then
  rm "$INSTALL_DIR/$SCRIPT_NAME"
  echo "✓ Removed $INSTALL_DIR/$SCRIPT_NAME"
else
  echo "⚠️  Script not found at $INSTALL_DIR/$SCRIPT_NAME"
fi

# Ask about configuration
echo ""
read -p "Remove git config settings? (y/n): " remove_config

if [ "$remove_config" = "y" ]; then
  # Remove global git configs
  git config --global --unset commit-ai.api-key 2>/dev/null || true
  git config --global --unset commit-ai.provider 2>/dev/null || true
  git config --global --unset commit-ai.model 2>/dev/null || true
  git config --global --unset commit-ai.changelog 2>/dev/null || true
  git config --global --unset commit-ai.max-diff-size 2>/dev/null || true
  git config --global --unset commit-ai.template 2>/dev/null || true
  
  echo "✓ Removed git configuration"
fi

# Ask about custom templates
echo ""
read -p "Remove custom templates at $CONFIG_DIR? (y/n): " remove_templates

if [ "$remove_templates" = "y" ] && [ -d "$CONFIG_DIR" ]; then
  rm -rf "$CONFIG_DIR"
  echo "✓ Removed $CONFIG_DIR"
fi

# Ask about git alias
echo ""
read -p "Remove git alias 'git aic'? (y/n): " remove_alias

if [ "$remove_alias" = "y" ]; then
  git config --global --unset alias.aic 2>/dev/null || true
  echo "✓ Removed git alias"
fi

echo ""
echo "✅ Uninstall complete!"
echo ""
echo "If you added ~/.local/bin to your PATH in .bashrc or .zshrc,"
echo "you may want to remove that line manually."
echo ""
