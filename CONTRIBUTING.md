# 🤝 Contributing to Student Study Habits Analysis

Thank you for your interest in contributing to this project! We welcome contributions from the community.

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Development Setup](#development-setup)
- [Contribution Workflow](#contribution-workflow)
- [Style Guidelines](#style-guidelines)
- [Commit Guidelines](#commit-guidelines)

## 📜 Code of Conduct

This project follows a simple code of conduct:

- Be respectful and inclusive
- Provide constructive feedback
- Focus on what is best for the community
- Show empathy towards other community members

## 🎯 How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check existing issues. When you create a bug report, include:

- **Clear title and description**
- **Steps to reproduce** the problem
- **Expected behavior** vs actual behavior
- **Screenshots** if applicable
- **Environment details** (R version, OS, package versions)

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When suggesting an enhancement:

- Use a **clear and descriptive title**
- Provide a **detailed description** of the suggested enhancement
- Explain **why this enhancement would be useful**
- Include **code examples** if applicable

### Pull Requests

We actively welcome your pull requests:

1. Fork the repo and create your branch from `main`
2. If you've added code that should be tested, add tests
3. Ensure the test suite passes
4. Update documentation as needed
5. Issue that pull request!

## 🛠️ Development Setup

### Prerequisites

- R (≥ 4.4.1)
- Git
- A GitHub account

### Setup Steps

1. **Fork and clone the repository**

```bash
git clone https://github.com/YOUR_USERNAME/Study_habits_vs_performance_in_R_project.git
cd Study_habits_vs_performance_in_R_project
```

2. **Install dependencies**

```powershell
& "C:\Program Files\R\R-4.4.1\bin\x64\Rscript.exe" packages.R
& "C:\Program Files\R\R-4.4.1\bin\x64\Rscript.exe" install_ml_packages.R
& "C:\Program Files\R\R-4.4.1\bin\x64\Rscript.exe" install_shiny.R
```

3. **Set up renv (optional but recommended)**

```r
install.packages("renv")
renv::init()
```

4. **Run tests to verify setup**

```powershell
.\run_pipeline.bat
```

## 🔄 Contribution Workflow

### 1. Create a Feature Branch

```bash
git checkout -b feature/your-feature-name
# or
git checkout -b fix/your-bug-fix
```

Branch naming conventions:
- `feature/` - New features
- `fix/` - Bug fixes
- `docs/` - Documentation changes
- `refactor/` - Code refactoring
- `test/` - Adding tests

### 2. Make Your Changes

- Keep changes **focused and atomic**
- One feature or fix per PR
- Write clear, commented code
- Follow the style guidelines below

### 3. Test Your Changes

```powershell
# Run ML pipeline
.\run_pipeline.bat

# Test dashboard
.\run_improved_app.bat

# Run unit tests (if available)
& "C:\Program Files\R\R-4.4.1\bin\x64\Rscript.exe" test_simple.R
```

### 4. Commit Your Changes

```bash
git add .
git commit -m "feat: add amazing new feature"
```

See [Commit Guidelines](#commit-guidelines) below.

### 5. Push and Create PR

```bash
git push origin feature/your-feature-name
```

Then create a Pull Request on GitHub with:
- Clear title describing the change
- Detailed description of what and why
- Reference any related issues
- Screenshots for UI changes

## 📝 Style Guidelines

### R Code Style

Follow the [Tidyverse Style Guide](https://style.tidyverse.org/):

**Good:**
```r
# Use <- for assignment
x <- 5

# Use spaces around operators
result <- x + y

# Use descriptive names
calculate_student_average <- function(scores) {
  mean(scores, na.rm = TRUE)
}

# Use pipes for readability
df %>%
  filter(score > 50) %>%
  select(name, score) %>%
  arrange(desc(score))
```

**Bad:**
```r
# Avoid
x = 5  # Use <- not =
result<-x+y  # No spaces
f <- function(s) mean(s, na.rm=T)  # Unclear names
```

### File Organization

- **Scripts** - Place in `scripts/` directory
- **Data** - Raw data in `data/raw/`, processed in `data/processed/`
- **Models** - Save model artifacts in `models/`
- **Reports** - Output reports to `reports/`
- **Documentation** - Update relevant `.md` files

### Documentation

- **Functions** - Use roxygen2 style comments
- **README** - Update if your change affects usage
- **Comments** - Explain *why*, not *what*

Example:
```r
#' Calculate student performance metrics
#'
#' @param scores Numeric vector of student scores
#' @param weights Optional weights for each score
#' @return Named list with mean, median, and weighted average
#' @examples
#' calculate_metrics(c(85, 90, 78))
calculate_metrics <- function(scores, weights = NULL) {
  # Implementation
}
```

## 📋 Commit Guidelines

We follow [Conventional Commits](https://www.conventionalcommits.org/):

### Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types

- `feat:` - New feature
- `fix:` - Bug fix
- `docs:` - Documentation changes
- `style:` - Code style changes (formatting, no code change)
- `refactor:` - Code refactoring
- `test:` - Adding or updating tests
- `chore:` - Maintenance tasks

### Examples

```bash
feat(dashboard): add correlation matrix visualization

Added interactive correlation heatmap with multiple method options
(Pearson, Spearman, Kendall). Users can now visualize relationships
between all numeric variables.

Closes #123
```

```bash
fix(pipeline): resolve missing package error

Fixed issue where rsample package was not installed, causing
train/test split script to fail.

Fixes #456
```

```bash
docs(readme): update installation instructions

Clarified R version requirements and added troubleshooting section
for common installation issues.
```

## 🧪 Testing

- Add tests for new features
- Ensure existing tests pass
- Test on Windows (primary platform)
- Verify dashboard UI changes in browser

## 📚 Additional Resources

- [R Style Guide](https://style.tidyverse.org/)
- [Shiny Development](https://shiny.rstudio.com/)
- [Tidymodels](https://www.tidymodels.org/)
- [Git Workflow](https://guides.github.com/introduction/flow/)

## ❓ Questions?

- Open an issue for questions
- Check existing issues and PRs first
- Be patient - maintainers respond as time allows

## 🎉 Recognition

Contributors will be acknowledged in:
- GitHub contributors page
- Project documentation
- Release notes (for significant contributions)

---

**Thank you for contributing! Your efforts help make this project better for everyone.** 🙏
