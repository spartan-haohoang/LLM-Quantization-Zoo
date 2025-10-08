# Quick Start Guide

This guide will help you get started with the LLM Quantization Zoo in under 5 minutes.

## Prerequisites

- Python 3.10 or higher
- 16GB RAM minimum (32GB recommended)
- NVIDIA GPU with 8GB+ VRAM (optional but recommended)
- 50GB free disk space

## Installation Methods

### Method 1: Docker (Easiest)

**Best for:** Users who want everything pre-configured

```bash
# 1. Clone the repository
git clone https://github.com/your-username/LLM-Quantization-Zoo.git
cd LLM-Quantization-Zoo

# 2. Start with Docker
make docker-build
make docker-up

# 3. Open browser to http://localhost:8888
```

That's it! Jupyter is now running with all dependencies installed.

---

### Method 2: Virtual Environment (Recommended for Development)

**Best for:** Python developers familiar with virtual environments

```bash
# 1. Clone the repository
git clone https://github.com/your-username/LLM-Quantization-Zoo.git
cd LLM-Quantization-Zoo

# 2. Run setup script
./scripts/setup.sh

# 3. Activate environment
source venv/bin/activate

# 4. Start Jupyter
jupyter notebook
```

---

### Method 3: Poetry (For Python Package Management)

**Best for:** Users familiar with Poetry

```bash
# 1. Clone the repository
git clone https://github.com/your-username/LLM-Quantization-Zoo.git
cd LLM-Quantization-Zoo

# 2. Install with Poetry
poetry install

# 3. Start Jupyter
poetry run jupyter notebook
```

---

### Method 4: Manual pip Installation

**Best for:** Custom setups

```bash
# 1. Clone the repository
git clone https://github.com/your-username/LLM-Quantization-Zoo.git
cd LLM-Quantization-Zoo

# 2. Create virtual environment
python3 -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate

# 3. Install dependencies
pip install -r requirements.txt

# 4. Start Jupyter
jupyter notebook
```

---

## Your First Quantization

### Option A: Learn the Basics First

Start with the Introduction notebook:

1. Navigate to `notebooks/weight-quantization-basics/`
2. Open `Introduction-to-Weight-Quantization.ipynb`
3. Run cells sequentially
4. Estimated time: ~15 minutes

### Option B: Jump into Production Methods

Try GPTQ quantization:

1. Navigate to `notebooks/gptq/`
2. Open `4-bit-LLM-Quantization-with-GPTQ.ipynb`
3. Configure your model in the first cell
4. Run quantization
5. Estimated time: ~60 minutes

### Option C: Cross-Platform GGUF

Create universally compatible models:

1. Navigate to `notebooks/gguf-llama-cpp/`
2. Open `Quantize-Llama-2-models-using-GGUF-and-llama.cpp.ipynb`
3. Choose quantization methods
4. Run and compare results
5. Estimated time: ~45 minutes

---

## Common Commands

### Using Makefile

```bash
make help              # Show all commands
make docker-up         # Start Docker
make docker-down       # Stop Docker
make docker-logs       # View logs
make clean             # Clean cache
make format            # Format code
```

### Using Scripts

```bash
./scripts/setup.sh              # Initial setup
./scripts/run_notebooks.sh      # Start Jupyter
```

### Manual Commands

```bash
# Start Jupyter
jupyter notebook

# Start on specific port
jupyter notebook --port=8889

# Start and allow remote access
jupyter notebook --ip=0.0.0.0
```

---

## Troubleshooting

### Issue: CUDA not available

**Solution:**
```bash
# Check CUDA installation
nvidia-smi

# Verify PyTorch CUDA
python -c "import torch; print(torch.cuda.is_available())"
```

### Issue: Out of memory

**Solutions:**
- Reduce batch size in notebooks
- Use smaller models initially (e.g., GPT-2 instead of LLaMA-7B)
- Close other applications
- Use CPU for initial testing

### Issue: Module not found

**Solution:**
```bash
# Reinstall dependencies
pip install -r requirements.txt

# Or with Poetry
poetry install
```

### Issue: Port 8888 already in use

**Solution:**
```bash
# Use different port
jupyter notebook --port=8889

# Or kill existing process
lsof -ti:8888 | xargs kill -9
```

---

## Next Steps

1. ✅ **Explore Notebooks**: Try each quantization method
2. 📊 **Compare Methods**: Run the same model with different techniques
3. 🎯 **Deploy**: Use quantized models in your applications
4. 📚 **Learn More**: Read method-specific READMEs in each notebook folder
5. 🤝 **Contribute**: Share your results and improvements

---

## Getting Help

- 📖 Read the [full README](../README.md)
- 🐛 [Report issues](https://github.com/your-username/LLM-Quantization-Zoo/issues)
- 💬 [Discussions](https://github.com/your-username/LLM-Quantization-Zoo/discussions)
- 📧 Email: your.email@example.com

---

## Useful Resources

- [PyTorch Quantization Docs](https://pytorch.org/docs/stable/quantization.html)
- [HuggingFace Transformers](https://huggingface.co/docs/transformers)
- [llama.cpp Documentation](https://github.com/ggerganov/llama.cpp)
- [Quantization Research Papers](https://github.com/htqin/awesome-model-quantization)

Happy quantizing! 🚀

