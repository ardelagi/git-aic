# Complete Workflow Examples 🔄

Real-world workflows for different development scenarios using git-aic.

## 📦 Workflow 1: Feature Development → Release

Complete workflow from feature to published release.

```bash
# 1. Create feature branch
git checkout -b feature/user-authentication

# 2. Develop feature (make changes)
touch src/auth/jwt.js
touch src/auth/middleware.js
touch test/auth.test.js

# 3. Commit with AI (multiple commits as you work)
git-aic
# Output: feat(auth): add JWT token generation
# ✅ Commit created successfully

git-aic
# Output: feat(auth): add authentication middleware
# ✅ Commit created successfully

git-aic
# Output: test(auth): add JWT token validation tests
# ✅ Commit created successfully

# 4. Merge to main
git checkout main
git merge feature/user-authentication

# 5. Tag the release
git tag v1.0.0

# 6. Push everything
git push origin main --tags

# 7. Create GitHub release
git-aic-changelog v1.0.0 --ai

# Output:
# 📋 Generating changelog for: v1.0.0
# 🤖 Enhancing changelog with AI...
# ✅ Release created successfully!
# 🔗 https://github.com/yourname/project/releases/tag/v1.0.0
```

## 🐛 Workflow 2: Hotfix → Patch Release

Quick bug fix workflow.

```bash
# 1. Current version: v1.0.0
# Bug reported in production!

# 2. Create hotfix branch
git checkout -b hotfix/critical-bug

# 3. Fix the bug
nano src/api/users.js  # Fix the issue

# 4. Commit with AI
git-aic
# Output: fix(api): resolve race condition in user creation
# ✅ Commit created successfully

# 5. Merge to main
git checkout main
git merge hotfix/critical-bug

# 6. Tag patch version
git tag v1.0.1

# 7. Push and release
git push origin main --tags
git-aic-changelog v1.0.1 --ai

# Done! Hotfix released in minutes
```

## 🚀 Workflow 3: Automated CI/CD Release

Fully automated release via GitHub Actions.

### Setup GitHub Actions

Create `.github/workflows/release.yml`:

```yaml
name: Release

on:
  push:
    tags:
      - 'v*'

jobs:
  release:
    runs-on: ubuntu-latest
    permissions:
      contents: write
      
    steps:
      - name: Checkout
        uses: actions/checkout@v4
        with:
          fetch-depth: 0
      
      - name: Install git-aic tools
        run: |
          curl -fsSL https://raw.githubusercontent.com/yourusername/git-aic/main/git-aic-changelog -o /usr/local/bin/git-aic-changelog
          chmod +x /usr/local/bin/git-aic-changelog
      
      - name: Configure git
        run: |
          git config --global commit-ai.provider "gemini"
          git config --global commit-ai.api-key "${{ secrets.GEMINI_API_KEY }}"
      
      - name: Create Release
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        run: |
          git-aic-changelog --latest --ai
      
      - name: Build artifacts (optional)
        run: |
          npm run build
          # Upload build artifacts to release
```

### Usage

```bash
# Just tag and push - CI does the rest!
git tag v1.2.0
git push origin v1.2.0

# GitHub Actions will:
# 1. Generate changelog with AI
# 2. Create release
# 3. Build and upload artifacts
```

## 📊 Workflow 4: Semantic Versioning Strategy

Structured versioning approach.

```bash
# PATCH (v1.0.0 → v1.0.1): Bug fixes only
echo "fix bug" > fix.js
git-aic  # fix: resolve issue
git tag v1.0.1
git-aic-changelog v1.0.1

# MINOR (v1.0.1 → v1.1.0): New features
echo "new feature" > feature.js
git-aic  # feat: add new capability
git tag v1.1.0
git-aic-changelog v1.1.0 --ai

# MAJOR (v1.1.0 → v2.0.0): Breaking changes
git rm old-api.js
echo "new api" > api-v2.js
git-aic  # feat!: migrate to v2 API
git tag v2.0.0
git-aic-changelog v2.0.0 --ai --prerelease  # Test first

# After testing
git-aic-changelog v2.0.0 --ai  # Final release
```

## 🔄 Workflow 5: Multiple Developers

Team collaboration workflow.

```bash
# Developer A: Frontend
cd ~/projects/myapp
git checkout -b feat/ui-dashboard
# ... make UI changes
git-aic  # feat(ui): add user dashboard
git push origin feat/ui-dashboard

# Developer B: Backend
cd ~/projects/myapp
git checkout -b feat/api-analytics
# ... make API changes
git-aic  # feat(api): add analytics endpoints
git push origin feat/api-analytics

# Lead: Review and merge
git checkout main
git merge feat/ui-dashboard
git merge feat/api-analytics

# Create release with all changes
git tag v1.3.0
git-aic-changelog v1.3.0 --ai

# Output includes both developer's work:
# ## 🚀 Features
# - feat(ui): add user dashboard
# - feat(api): add analytics endpoints
```

## 🧪 Workflow 6: Pre-release Testing

Beta/RC release workflow.

```bash
# 1. Finish features
git checkout develop
# ... commits ...

# 2. Create beta
git tag v2.0.0-beta.1
git-aic-changelog v2.0.0-beta.1 --prerelease --ai

# 3. Test with users
# ... feedback ...

# 4. Fix issues
git-aic  # fix: resolve beta feedback
git tag v2.0.0-beta.2
git-aic-changelog v2.0.0-beta.2 --prerelease

# 5. Release candidate
git tag v2.0.0-rc.1
git-aic-changelog v2.0.0-rc.1 --prerelease --ai

# 6. Final release
git tag v2.0.0
git-aic-changelog v2.0.0 --ai

# Clean up pre-releases on GitHub UI
```

## 📝 Workflow 7: Documentation Updates

Documentation-focused release.

```bash
# Major docs update
git checkout -b docs/api-guide
nano docs/api-guide.md
nano docs/authentication.md
nano README.md

# Commit changes
git-aic
# Output: docs: add comprehensive API guide
# 
# - Create detailed API documentation
# - Add authentication examples
# - Update README with new features

# Merge and tag
git checkout main
git merge docs/api-guide
git tag v1.2.1
git-aic-changelog v1.2.1

# Changelog will categorize under:
# ## 📚 Documentation
```

## 🏗️ Workflow 8: Monorepo with Multiple Packages

Managing multiple packages.

```bash
# Structure:
# /packages
#   /api
#   /web
#   /mobile

# Update API package
cd packages/api
# ... changes ...
git-aic  # feat(api): add GraphQL support

# Update Web package
cd ../web
# ... changes ...
git-aic  # feat(ui): add dark mode

# Release all together
cd ../..
git tag v1.4.0
git-aic-changelog v1.4.0 --ai

# Changelog groups by scope:
# ## 🚀 Features
# - feat(api): add GraphQL support
# - feat(ui): add dark mode
```

## 🔥 Workflow 9: Emergency Rollback

When things go wrong.

```bash
# Current: v1.5.0 (broken in production!)

# 1. Revert to working version
git revert HEAD~3..HEAD

# 2. Commit revert
git-aic
# Output: revert: rollback to v1.4.0

# 3. Tag rollback release
git tag v1.5.1
git-aic-changelog v1.5.1

# 4. Quick release
git push origin main --tags

# Or create hotfix from previous tag
git checkout v1.4.0
git checkout -b hotfix/rollback
# ... apply fix ...
git-aic
git tag v1.5.1
git-aic-changelog v1.5.1
```

## 📅 Workflow 10: Scheduled Releases

Weekly/monthly release cadence.

```bash
# Monday: Start sprint
git checkout develop
# ... week of development ...

# Friday: Create release
git checkout main
git merge develop

# Generate changelog from date range
LAST_FRIDAY=$(date -d "7 days ago" +%Y-%m-%d)
git log --since="$LAST_FRIDAY" --pretty=format:"%s" | head

# Tag weekly release
WEEK=$(date +%U)
git tag v1.$WEEK.0
git-aic-changelog v1.$WEEK.0 --ai

# Push
git push origin main --tags
```

## 🎯 Workflow 11: Integrated Development

Single command workflow.

Create alias in `~/.bashrc` or `~/.zshrc`:

```bash
# Ship it! (commit + tag + release)
alias shipit='
  git-aic && \
  read -p "Tag (e.g., v1.0.0): " tag && \
  git tag $tag && \
  git push origin main --tags && \
  git-aic-changelog $tag --ai
'

# Usage:
# 1. Make changes
# 2. Run: shipit
# 3. Enter tag
# 4. Done!
```

## 🚢 Workflow 12: npm Package Release

Complete npm publish workflow.

```bash
# 1. Update package version
npm version patch  # or minor, major

# 2. Auto-commit version bump
git-aic
# Output: chore: bump version to 1.2.3

# 3. Build package
npm run build

# 4. Tag release
VERSION=$(node -p "require('./package.json').version")
git tag v$VERSION

# 5. Create GitHub release
git-aic-changelog v$VERSION --ai

# 6. Publish to npm
npm publish

# 7. Push everything
git push origin main --tags

# All done!
```

## 🔐 Workflow 13: Security Updates

Handling security patches.

```bash
# 1. Update dependencies
npm audit fix
# or
npm update express helmet cors

# 2. Commit security update
git-aic
# Output: fix(deps): update security-critical dependencies
# 
# - Update express to patch CVE-2024-xxxxx
# - Upgrade helmet for improved security headers
# - Update cors to latest stable version

# 3. Tag patch
git tag v1.0.5

# 4. Create release with security notice
git-aic-changelog v1.0.5 --ai

# 5. Notify users immediately
git push origin main --tags
```

## 🎨 Workflow 14: Design System Updates

Frontend design updates.

```bash
# Update design system
cd packages/design-system

# Modify components
nano src/components/Button.tsx
nano src/components/Input.tsx
nano src/styles/tokens.ts

# Commit with scope
git-aic
# Output: feat(ui): update design system tokens
# 
# - Modernize color palette
# - Update button variants
# - Add new input styles

# Document changes
nano CHANGELOG.md  # Auto-updated by git-aic

# Release design system version
git tag design-system-v2.0.0
git-aic-changelog design-system-v2.0.0
```

## 🧹 Workflow 15: Maintenance Release

Cleanup and maintenance.

```bash
# Cleanup tasks
rm -rf old-unused-files/
npm run lint:fix
npm run format
npm update

# Commit maintenance
git-aic
# Output: chore: maintenance and dependency updates
# 
# - Remove unused legacy code
# - Update all dependencies
# - Fix linting issues
# - Format code consistently

# Tag maintenance release
git tag v1.3.5
git-aic-changelog v1.3.5

# Optional: mark as maintenance release in description
```

## 💡 Pro Tips

### Tip 1: Daily Commit Routine

```bash
# End of day routine
alias eod='git-aic && git push'

# Just run: eod
```

### Tip 2: Preview Before Every Release

```bash
# Always preview first
git-aic-changelog --latest --dry-run --ai

# Then create if looks good
git-aic-changelog --latest --ai
```

### Tip 3: Use Draft Releases for Review

```bash
# Create draft for team review
git-aic-changelog v2.0.0 --draft --ai

# Review on GitHub
# Edit if needed
# Publish when ready
```

### Tip 4: Automate Everything

Create `Makefile`:

```makefile
.PHONY: commit release patch minor major

commit:
	git-aic

release:
	@read -p "Version (patch/minor/major): " version; \
	npm version $$version && \
	git-aic && \
	git push origin main --tags && \
	git-aic-changelog --latest --ai

patch:
	$(MAKE) release version=patch

minor:
	$(MAKE) release version=minor

major:
	$(MAKE) release version=major
```

Usage:

```bash
make commit  # Smart commit
make patch   # 1.0.0 → 1.0.1
make minor   # 1.0.0 → 1.1.0
make major   # 1.0.0 → 2.0.0
```

-----

**Choose the workflow that fits your team’s process! 🚀**
