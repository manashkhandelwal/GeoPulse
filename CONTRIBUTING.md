# Contributing to GeoPulse

Thank you for your interest in contributing to GeoPulse! This document provides guidelines and instructions for contributing to the project.

## Getting Started

Before you begin contributing, make sure you have:

1. Followed the setup instructions in [SETUP.md](SETUP.md) or [QUICKSTART.md](QUICKSTART.md)
2. Successfully run the project on your local system
3. Familiarized yourself with the codebase

## Development Workflow

### 1. Fork and Clone

1. Fork the repository on GitHub
2. Clone your fork locally:
   ```bash
   git clone https://github.com/YOUR_USERNAME/GeoPulse.git
   cd GeoPulse
   ```
3. Add the upstream repository:
   ```bash
   git remote add upstream https://github.com/group-geopulse/GeoPulse.git
   ```

### 2. Create a Branch

Create a new branch for your feature or bugfix:

```bash
git checkout -b feature/your-feature-name
# or
git checkout -b fix/your-bugfix-name
```

### 3. Make Changes

- Follow the existing code style and conventions
- Write clear, descriptive commit messages
- Test your changes thoroughly
- Update documentation if needed

### 4. Test Your Changes

#### Backend Testing

```bash
cd backend
source venv/bin/activate  # On Windows: venv\Scripts\activate
# Run your backend scripts to verify functionality
python upload_price.py
python upload_news.py
```

#### Frontend Testing

```bash
cd frontend
npm run dev
# Visit http://localhost:3000 and test your changes
```

### 5. Commit Your Changes

```bash
git add .
git commit -m "Brief description of your changes"
```

**Commit Message Guidelines:**
- Use present tense ("Add feature" not "Added feature")
- Use imperative mood ("Move cursor to..." not "Moves cursor to...")
- Limit the first line to 72 characters or less
- Reference issues and pull requests when relevant

### 6. Push and Create Pull Request

```bash
git push origin feature/your-feature-name
```

Then create a Pull Request on GitHub.

## Code Style Guidelines

### Python (Backend)

- Follow [PEP 8](https://www.python.org/dev/peps/pep-0008/) style guide
- Use meaningful variable and function names
- Add docstrings to functions and classes
- Keep functions focused and small

Example:
```python
def process_news_data(news_items):
    """
    Process raw news items and extract relevant information.
    
    Args:
        news_items (list): List of raw news items
        
    Returns:
        list: Processed news items with extracted features
    """
    # Implementation here
    pass
```

### JavaScript/TypeScript (Frontend)

- Follow existing code formatting
- Use meaningful component and variable names
- Add comments for complex logic
- Prefer functional components with hooks

Example:
```typescript
interface NewsItemProps {
  title: string;
  date: string;
  content: string;
}

const NewsItem: React.FC<NewsItemProps> = ({ title, date, content }) => {
  // Component implementation
  return (
    <div className="news-item">
      {/* JSX here */}
    </div>
  );
};
```

## Project Structure

```
GeoPulse/
├── backend/               # Python backend
│   ├── *.py              # Backend scripts
│   ├── requirements.txt  # Python dependencies
│   └── .env.example      # Environment variables template
├── frontend/             # Next.js frontend
│   ├── app/             # Next.js app directory
│   ├── public/          # Static assets
│   └── package.json     # Node.js dependencies
├── datasets/            # Data files
├── scripts/            # Utility scripts
└── docs/               # Documentation
```

## Adding New Features

When adding new features:

1. **Backend Features:**
   - Add new scripts in the `backend/` directory
   - Update `requirements.txt` if you add new dependencies
   - Document the purpose and usage in code comments
   - Consider logging for debugging

2. **Frontend Features:**
   - Create new components in appropriate directories
   - Update dependencies in `package.json` if needed
   - Ensure responsive design
   - Follow existing UI/UX patterns

3. **Documentation:**
   - Update relevant README files
   - Add examples of usage
   - Update SETUP.md if installation steps change

## Dependencies

### Adding Python Dependencies

1. Add the package to `backend/requirements.txt`
2. Install and test: `pip install -r requirements.txt`
3. Document why the dependency is needed in your PR

### Adding Node.js Dependencies

1. Install using npm: `npm install package-name`
2. Verify it's added to `package.json`
3. Document why the dependency is needed in your PR

## Testing

### Manual Testing Checklist

- [ ] Backend scripts run without errors
- [ ] Frontend builds successfully (`npm run build`)
- [ ] No console errors or warnings
- [ ] Features work as expected in the browser
- [ ] Responsive design works on different screen sizes
- [ ] Changes don't break existing functionality

## Pull Request Process

1. **Update Documentation:** Ensure all documentation is up-to-date
2. **Self-Review:** Review your own code before submitting
3. **Descriptive PR:** Write a clear PR description explaining:
   - What changes were made
   - Why the changes were needed
   - How to test the changes
4. **Link Issues:** Reference any related issues
5. **Wait for Review:** Be responsive to feedback

### PR Template

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Performance improvement

## Testing
How to test these changes

## Screenshots (if applicable)
Add screenshots for UI changes

## Checklist
- [ ] Code follows project style guidelines
- [ ] Documentation updated
- [ ] Changes tested locally
- [ ] No breaking changes
```

## Reporting Bugs

When reporting bugs, include:

1. **Description:** Clear description of the issue
2. **Steps to Reproduce:** Detailed steps to recreate the bug
3. **Expected Behavior:** What should happen
4. **Actual Behavior:** What actually happens
5. **Environment:**
   - OS (Windows/macOS/Linux)
   - Python version
   - Node.js version
6. **Screenshots/Logs:** If applicable

## Suggesting Enhancements

When suggesting new features:

1. **Clear Description:** Explain the feature clearly
2. **Use Case:** Describe why it would be useful
3. **Examples:** Provide examples if possible
4. **Implementation Ideas:** Suggest how it could be implemented

## Code Review Process

- All submissions require review before merging
- Reviewers may request changes
- Be responsive to feedback
- Address review comments promptly

## Community Guidelines

- Be respectful and constructive
- Help others when you can
- Ask questions if you're unsure
- Give credit where credit is due

## Questions?

If you have questions:

1. Check existing [Issues](https://github.com/group-geopulse/GeoPulse/issues)
2. Review documentation (SETUP.md, README.md)
3. Create a new issue with the "question" label

## License

By contributing, you agree that your contributions will be licensed under the same license as the project.

---

Thank you for contributing to GeoPulse! 🎉
