# git-aic Usage Examples

Real-world scenarios and examples for using git-aic.

## 📱 Scenario 1: Frontend Development

```bash
# You're building a React component
cd ~/projects/my-app

# Create new component
cat > src/components/UserProfile.jsx << 'EOF'
import React from 'react';

export default function UserProfile({ user }) {
  return (
    <div className="profile">
      <h2>{user.name}</h2>
      <p>{user.email}</p>
    </div>
  );
}
EOF

# Auto commit
git-aic

# Output:
# feat(ui): add user profile component
# 
# - Create UserProfile component for displaying user info
# - Implement basic layout with name and email fields
# - Add className for styling integration
```

## 🔧 Scenario 2: Backend API Development

```bash
# Adding authentication endpoint
cat > api/auth.js << 'EOF'
const jwt = require('jsonwebtoken');

exports.login = async (req, res) => {
  const { email, password } = req.body;
  // Authentication logic
  const token = jwt.sign({ email }, process.env.JWT_SECRET);
  res.json({ token });
};
EOF

git-aic -d  # Preview first

# Output:
# feat(api): implement JWT authentication endpoint
# 
# - Add login endpoint with JWT token generation
# - Integrate jsonwebtoken library for token signing
# - Use environment variable for JWT secret
# - Return token in JSON response
```

## 🐛 Scenario 3: Bug Fix

```bash
# Fix a race condition
git diff  # Review your changes

git-aic -i  # Interactive mode

# Output preview:
# fix(core): resolve race condition in user creation
# 
# - Add mutex lock to prevent concurrent user creation
# - Implement proper error handling for duplicate emails
# - Add database transaction for atomic operations

# Accept? (y/n/e to edit): y
```

## 📚 Scenario 4: Documentation Update

```bash
# Update README
echo "## New Feature" >> README.md
echo "We now support dark mode!" >> README.md

git-aic

# Output:
# docs: add dark mode feature documentation
# 
# - Document new dark mode feature
# - Update README with feature description
```

## 🎨 Scenario 5: CSS/Styling Changes

```bash
# Improve button styles
cat > styles/button.css << 'EOF'
.btn-primary {
  background: linear-gradient(45deg, #667eea 0%, #764ba2 100%);
  border: none;
  border-radius: 8px;
  padding: 12px 24px;
}
EOF

git-aic

# Output:
# style: enhance primary button with gradient design
# 
# - Apply gradient background to primary buttons
# - Increase border radius for modern look
# - Adjust padding for better touch targets
```

## 🏗️ Scenario 6: Refactoring

```bash
# Refactor database queries
# (After making optimization changes)

git-aic

# Output:
# refactor(db): optimize user query performance
# 
# - Add database indexes for frequently queried fields
# - Replace N+1 queries with single JOIN operation
# - Reduce query time from 500ms to 50ms
```

## 🔬 Scenario 7: Adding Tests

```bash
# Write tests for auth module
cat > test/auth.test.js << 'EOF'
describe('Authentication', () => {
  it('should generate valid JWT token', () => {
    // Test code
  });
});
EOF

git-aic

# Output:
# test(api): add authentication unit tests
# 
# - Create test suite for JWT token generation
# - Add test case for valid token structure
# - Implement describe block for authentication module
```

## ⚙️ Scenario 8: Configuration Changes

```bash
# Update environment config
cat > .env.example << 'EOF'
DATABASE_URL=postgresql://localhost:5432/mydb
JWT_SECRET=your-secret-here
API_KEY=your-api-key
EOF

git-aic

# Output:
# config: add environment variables template
# 
# - Create .env.example with required variables
# - Document database connection string format
# - Add placeholders for JWT secret and API key
```

## 🚀 Scenario 9: Deployment Changes

```bash
# Add Docker configuration
cat > Dockerfile << 'EOF'
FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["npm", "start"]
EOF

git-aic

# Output:
# ci(infra): add Docker containerization support
# 
# - Create Dockerfile with Node 18 Alpine base
# - Configure working directory and dependency installation
# - Expose port 3000 for application access
# - Set npm start as container entry point
```

## 🔥 Scenario 10: Breaking Changes

```bash
# Remove deprecated API endpoint
git rm api/v1/old-endpoint.js

# Update API version
sed -i 's/v1/v2/g' api/routes.js

git-aic

# Output:
# feat(api)!: migrate to API v2 with breaking changes
# 
# - Remove deprecated v1 endpoint
# - Update all routes to v2 specification
# - This requires clients to update their API calls

# Note the '!' indicating breaking change
```

## 🔄 Scenario 11: Multiple File Types

```bash
# Update across multiple areas
mkdir -p components api docs
echo "Component" > components/Header.jsx
echo "Route" > api/users.js
echo "# Guide" > docs/setup.md

git-aic

# Output:
# feat: add user management foundation
# 
# - Create Header component for navigation
# - Add users API route for CRUD operations
# - Write setup documentation for new developers
```

## 🎯 Scenario 12: Using Custom Template

```bash
# Create custom template
mkdir -p ~/.config/git-ai-commit
cat > ~/.config/git-ai-commit/template.txt << 'EOF'
Focus on business value and user impact.
Use JIRA ticket format: [PROJ-123]
Keep technical details minimal.
EOF

# Configure
git config commit-ai.template "$HOME/.config/git-ai-commit/template.txt"

# Make changes and commit
echo "feature" > feature.js
git-aic

# Output:
# feat: [PROJ-123] enable real-time notifications
# 
# - Users can now receive instant updates
# - Improves user engagement by 40%
```

## 🤝 Scenario 13: Team Collaboration

```bash
# Different developers, same workflow

# Developer 1 (Frontend)
cd frontend
# ... make UI changes
git-aic
# Output: feat(ui): implement responsive navigation menu

# Developer 2 (Backend)
cd backend
# ... make API changes
git-aic
# Output: feat(api): add pagination to user list endpoint

# Developer 3 (DevOps)
cd infrastructure
# ... update configs
git-aic
# Output: ci(infra): optimize Docker build caching
```

## 📊 Scenario 14: Data Migration

```bash
# Create migration file
cat > migrations/001_add_users_table.sql << 'EOF'
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);
EOF

git-aic

# Output:
# feat(db): add users table migration
# 
# - Create users table with email and timestamps
# - Add unique constraint on email field
# - Set default timestamp for record creation
# - Use serial type for auto-incrementing ID
```

## 🔒 Scenario 15: Security Update

```bash
# Update dependencies for security
npm update express helmet cors

git-aic

# Output:
# fix(deps): update security-critical dependencies
# 
# - Update express to patch CVE-2024-xxxxx
# - Upgrade helmet for improved security headers
# - Update cors to latest stable version
```

## 💡 Pro Tips

### Tip 1: Preview Important Changes

```bash
# For production releases
git-aic -d  # Check message first
git-aic -i  # Edit if needed
git push origin main
```

### Tip 2: Batch Related Changes

```bash
# Instead of:
echo "1" > file1.js && git-aic
echo "2" > file2.js && git-aic

# Do:
echo "1" > file1.js
echo "2" > file2.js
git-aic  # Single logical commit
```

### Tip 3: Use with Git Hooks

```bash
# .git/hooks/post-commit
#!/bin/bash
echo "✅ Committed: $(git log -1 --pretty=%s)"
```

### Tip 4: Repository-Specific Config

```bash
# For work projects
cd ~/work/project
git config commit-ai.provider "openai"
git config commit-ai.changelog "true"

# For personal projects
cd ~/personal/project
git config commit-ai.provider "gemini"
git config commit-ai.changelog "false"
```

### Tip 5: Emergency Fallback

```bash
# If AI fails, still have a commit ready
git-aic || git commit -m "chore: manual commit (AI unavailable)"
```

-----

## 🎓 Learning Exercise

Try these scenarios to master git-aic:

1. **Day 1**: Simple file additions
1. **Day 2**: Bug fixes with multiple files
1. **Day 3**: Refactoring existing code
1. **Day 4**: Adding tests
1. **Day 5**: Breaking changes
1. **Day 6**: Custom templates
1. **Day 7**: Team workflow integration

-----

**Remember**: The AI learns from your diff, so make meaningful, focused changes for the best commit messages! 🎯
