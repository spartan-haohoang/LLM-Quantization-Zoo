# Complete Setup Guide

This comprehensive guide covers all setup scenarios for the LLM Quantization Zoo.

## Table of Contents

1. [System Requirements](#system-requirements)
2. [Installation Methods](#installation-methods)
3. [Docker Setup (Detailed)](#docker-setup-detailed)
4. [Local Python Setup](#local-python-setup)
5. [GPU Configuration](#gpu-configuration)
6. [Troubleshooting](#troubleshooting)
7. [Performance Optimization](#performance-optimization)

---

## System Requirements

### Minimum Requirements
- **OS**: Linux (Ubuntu 20.04+), macOS (10.15+), Windows 10/11 with WSL2
- **CPU**: 4+ cores
- **RAM**: 16GB
- **Storage**: 50GB free space
- **Python**: 3.10 or higher

### Recommended Requirements
- **OS**: Linux (Ubuntu 22.04)
- **CPU**: 8+ cores
- **RAM**: 32GB
- **GPU**: NVIDIA GPU with 8GB+ VRAM
- **Storage**: 100GB+ free space (SSD preferred)
- **Python**: 3.10 or 3.11

### GPU Requirements (Optional but Recommended)

For GPU acceleration:
- NVIDIA GPU with Compute Capability 7.0+ (RTX 2000 series or newer)
- CUDA 11.8 or 12.1
- cuDNN 8.x
- 8GB+ VRAM (16GB+ for larger models)

---

## Installation Methods

### Quick Comparison

| Method | Difficulty | Setup Time | Best For |
|--------|-----------|------------|----------|
| Docker | ⭐ Easy | 10-15 min | Everyone, Production |
| Virtual Env | ⭐⭐ Medium | 5-10 min | Development |
| Poetry | ⭐⭐ Medium | 5-10 min | Python developers |
| Manual | ⭐⭐⭐ Hard | 15-30 min | Custom setups |

---

## Docker Setup (Detailed)

### Prerequisites

1. **Install Docker**
   ```bash
   # Ubuntu/Debian
   curl -fsSL https://get.docker.com -o get-docker.sh
   sudo sh get-docker.sh
   
   # Add user to docker group
   sudo usermod -aG docker $USER
   newgrp docker
   ```

2. **Install Docker Compose**
   ```bash
   sudo apt-get update
   sudo apt-get install docker-compose-plugin
   ```

3. **Install NVIDIA Docker (for GPU support)**
   ```bash
   # Add NVIDIA package repository
   distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
   curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
   curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
       sudo tee /etc/apt/sources.list.d/nvidia-docker.list
   
   # Install nvidia-docker2
   sudo apt-get update
   sudo apt-get install -y nvidia-docker2
   sudo systemctl restart docker
   
   # Test GPU access
   docker run --rm --gpus all nvidia/cuda:12.1.0-base-ubuntu22.04 nvidia-smi
   ```

### Build and Run

```bash
# 1. Clone repository
git clone https://github.com/your-username/LLM-Quantization-Zoo.git
cd LLM-Quantization-Zoo

# 2. Build Docker image
make docker-build
# Or manually:
# docker-compose build

# 3. Start container
make docker-up
# Or manually:
# docker-compose up -d

# 4. Access Jupyter
# Open browser to: http://localhost:8888

# 5. View logs
make docker-logs

# 6. Stop container
make docker-down
```

### Docker Management

```bash
# Enter container shell
docker-compose exec llm-quantization-zoo bash

# Restart container
docker-compose restart

# View resource usage
docker stats llm-quantization-zoo

# Remove everything and rebuild
docker-compose down -v
docker-compose build --no-cache
docker-compose up -d
```

---

## Local Python Setup

### Option 1: Automated Setup Script

```bash
# 1. Clone repository
git clone https://github.com/your-username/LLM-Quantization-Zoo.git
cd LLM-Quantization-Zoo

# 2. Run setup script
chmod +x scripts/setup.sh
./scripts/setup.sh

# 3. Activate environment
source venv/bin/activate

# 4. Start Jupyter
./scripts/run_notebooks.sh
```

### Option 2: Manual Virtual Environment

```bash
# 1. Clone repository
git clone https://github.com/your-username/LLM-Quantization-Zoo.git
cd LLM-Quantization-Zoo

# 2. Create virtual environment
python3 -m venv venv

# 3. Activate virtual environment
source venv/bin/activate  # Linux/Mac
# venv\Scripts\activate   # Windows

# 4. Upgrade pip
pip install --upgrade pip setuptools wheel

# 5. Install dependencies
pip install -r requirements.txt

# 6. Install optional dependencies
# For GPTQ:
# pip install auto-gptq

# For ExLlamaV2:
# git clone https://github.com/turboderp/exllamav2
# pip install -e exllamav2

# 7. Start Jupyter
jupyter notebook
```

### Option 3: Poetry Installation

```bash
# 1. Install Poetry (if not installed)
curl -sSL https://install.python-poetry.org | python3 -

# 2. Clone repository
git clone https://github.com/your-username/LLM-Quantization-Zoo.git
cd LLM-Quantization-Zoo

# 3. Install dependencies
poetry install

# 4. Activate Poetry shell
poetry shell

# 5. Start Jupyter
poetry run jupyter notebook
```

---

## GPU Configuration

### Verify CUDA Installation

```bash
# Check NVIDIA driver
nvidia-smi

# Check CUDA version
nvcc --version

# Check PyTorch CUDA
python -c "import torch; print(f'CUDA Available: {torch.cuda.is_available()}'); print(f'CUDA Version: {torch.version.cuda}')"
```

### Install CUDA (if not installed)

```bash
# Ubuntu 22.04 with CUDA 12.1
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/12.1.0/local_installers/cuda-repo-ubuntu2204-12-1-local_12.1.0-530.30.02-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu2204-12-1-local_12.1.0-530.30.02-1_amd64.deb
sudo cp /var/cuda-repo-ubuntu2204-12-1-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get -y install cuda
```

### Configure Environment Variables

Add to `~/.bashrc` or `~/.zshrc`:

```bash
export CUDA_HOME=/usr/local/cuda
export PATH=$CUDA_HOME/bin:$PATH
export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH
```

---

## Troubleshooting

### Common Issues

#### 1. CUDA Out of Memory

**Symptoms:** `RuntimeError: CUDA out of memory`

**Solutions:**
```python
# In notebook, add at the beginning:
import torch
torch.cuda.empty_cache()

# Reduce batch size
# Use gradient checkpointing
# Use smaller models for testing
```

#### 2. Import Errors

**Symptoms:** `ModuleNotFoundError: No module named 'transformers'`

**Solutions:**
```bash
# Reinstall dependencies
pip install -r requirements.txt

# Or specific package
pip install transformers --upgrade
```

#### 3. Permission Denied

**Symptoms:** `Permission denied` when running scripts

**Solutions:**
```bash
# Make scripts executable
chmod +x scripts/*.sh

# Or run with bash
bash scripts/setup.sh
```

#### 4. Docker GPU Not Working

**Symptoms:** `nvidia-smi` not working in container

**Solutions:**
```bash
# Verify nvidia-docker2 is installed
docker run --rm --gpus all nvidia/cuda:12.1.0-base-ubuntu22.04 nvidia-smi

# Check docker-compose.yml has proper GPU configuration
# Restart Docker daemon
sudo systemctl restart docker
```

#### 5. Port Already in Use

**Symptoms:** `Port 8888 is already in use`

**Solutions:**
```bash
# Find and kill process
lsof -ti:8888 | xargs kill -9

# Or use different port
jupyter notebook --port=8889
```

---

## Performance Optimization

### 1. Optimize PyTorch

```python
# At the start of notebooks
import torch

# Use TF32 for better performance on Ampere GPUs
torch.backends.cuda.matmul.allow_tf32 = True
torch.backends.cudnn.allow_tf32 = True

# Enable cuDNN autotuner
torch.backends.cudnn.benchmark = True
```

### 2. Optimize System

```bash
# Increase shared memory for Docker
# Edit docker-compose.yml: shm_size: '32gb'

# Monitor GPU usage
watch -n 1 nvidia-smi

# Monitor system resources
htop
```

### 3. Optimize Storage

```bash
# Use SSD for model cache
export HF_HOME=/path/to/ssd/.cache/huggingface

# Clean cache periodically
huggingface-cli cache clear

# Or manually
rm -rf ~/.cache/huggingface/hub/*
```

---

## Verification

After setup, verify everything works:

```bash
# Test Python
python --version

# Test packages
python -c "import torch; import transformers; print('Success!')"

# Test CUDA (if available)
python -c "import torch; print(f'CUDA: {torch.cuda.is_available()}')"

# Test Jupyter
jupyter --version

# Test make commands
make help
```

---

## Next Steps

1. ✅ Read [Quick Start Guide](QUICKSTART.md)
2. ✅ Try the [Introduction Notebook](../notebooks/weight-quantization-basics/)
3. ✅ Explore other notebooks
4. ✅ Join discussions and contribute

---

## Getting Help

If you encounter issues not covered here:

1. Check [GitHub Issues](https://github.com/your-username/LLM-Quantization-Zoo/issues)
2. Review [CONTRIBUTING.md](../CONTRIBUTING.md)
3. Create a new issue with details
4. Email: your.email@example.com

---

## Useful Commands Reference

```bash
# Setup
make install              # Install with pip
make install-poetry       # Install with Poetry
./scripts/setup.sh        # Automated setup

# Docker
make docker-build         # Build image
make docker-up            # Start container
make docker-down          # Stop container
make docker-logs          # View logs
make docker-shell         # Enter shell

# Development
make clean                # Clean cache
make format               # Format code
make lint                 # Run linters

# Jupyter
jupyter notebook          # Start Jupyter
jupyter lab              # Start JupyterLab
```

Good luck with your quantization journey! 🚀

