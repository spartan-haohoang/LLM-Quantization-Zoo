# Contributing to LLM Quantization Zoo

Thank you for your interest in contributing to the LLM Quantization Zoo! This document provides guidelines and instructions for contributing.

## 🤝 How to Contribute

### Reporting Bugs

If you find a bug, please create an issue with:
- Clear description of the problem
- Steps to reproduce
- Expected vs actual behavior
- Environment details (OS, Python version, GPU, etc.)
- Error messages and logs

### Suggesting Features

We welcome feature suggestions! Please create an issue with:
- Clear description of the feature
- Use case and benefits
- Potential implementation approach
- Any relevant examples or references

### Pull Requests

1. **Fork the repository**
   ```bash
   git clone https://github.com/your-username/LLM-Quantization-Zoo.git
   cd LLM-Quantization-Zoo
   ```

2. **Create a branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make your changes**
   - Follow the coding style
   - Add tests if applicable
   - Update documentation

4. **Test your changes**
   ```bash
   make test
   make lint
   ```

5. **Commit your changes**
   ```bash
   git add .
   git commit -m "Add: clear description of changes"
   ```

6. **Push and create PR**
   ```bash
   git push origin feature/your-feature-name
   ```

## 📝 Coding Standards

### Python Style
- Follow PEP 8
- Use type hints where appropriate
- Maximum line length: 100 characters
- Use Black for formatting: `make format`

### Notebook Guidelines
- Clear markdown explanations for each section
- Include output cells (when reasonable)
- Add timing information for long-running cells
- Keep cells focused and modular

### Documentation
- Update README.md for new features
- Add docstrings to functions
- Include examples in documentation
- Keep comments clear and concise

## 🧪 Testing

- Test notebooks end-to-end before submitting
- Verify Docker builds successfully
- Check all scripts are executable
- Test on different Python versions if possible

## 📋 Commit Message Format

Use conventional commit format:
```
type: subject

body (optional)

footer (optional)
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting)
- `refactor`: Code refactoring
- `test`: Adding tests
- `chore`: Maintenance tasks

**Examples:**
```
feat: add AWQ quantization notebook

Add new notebook demonstrating AWQ (Activation-aware Weight Quantization)
including comparison with GPTQ and performance benchmarks.

Closes #123
```

## 🎯 Areas for Contribution

We especially welcome contributions in:

- **New quantization methods**: AWQ, SmoothQuant, GGML variants
- **Performance benchmarks**: Comparing methods systematically
- **Model support**: Testing with different model architectures
- **Hardware testing**: Results on different GPUs/CPUs
- **Documentation**: Tutorials, guides, explanations
- **Tools**: Helper scripts, utilities, automation
- **Testing**: Unit tests, integration tests

## 📚 Resources

- [PyTorch Quantization](https://pytorch.org/docs/stable/quantization.html)
- [HuggingFace Transformers](https://huggingface.co/docs/transformers)
- [Quantization Survey Paper](https://arxiv.org/abs/2103.13630)

## 🙏 Recognition

Contributors will be:
- Listed in the README
- Mentioned in release notes
- Credited in relevant documentation

## ❓ Questions

If you have questions:
- Check existing issues
- Create a new issue with the "question" label
- Join discussions in issue comments

Thank you for contributing to making LLM quantization more accessible! 🚀

