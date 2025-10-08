# 🦁 LLM Quantization Zoo

<div align="center">

[![Python 3.10+](https://img.shields.io/badge/python-3.10+-blue.svg)](https://www.python.org/downloads/)
[![PyTorch](https://img.shields.io/badge/PyTorch-2.0+-ee4c2c.svg)](https://pytorch.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Docker](https://img.shields.io/badge/Docker-Ready-blue.svg)](https://www.docker.com/)

**A comprehensive, production-ready collection of Large Language Model quantization techniques and implementations.**

[Documentation](#documentation) • [Quick Start](#-quick-start) • [Notebooks](#-notebooks) • [Docker](#-docker-support) • [Contributing](#contributing)

</div>

---

## 📖 Overview

The **LLM Quantization Zoo** is a curated collection of state-of-the-art quantization techniques for Large Language Models. This repository provides:

- ✅ **4 comprehensive Jupyter notebooks** covering different quantization methods
- ✅ **Production-ready Docker setup** with CUDA support
- ✅ **Poetry & pip dependency management**
- ✅ **Organized project structure** for easy navigation
- ✅ **Detailed documentation** for each method
- ✅ **Helper scripts** for automation

## 🎯 Why Quantization?

Quantization reduces model size and inference time by representing weights with lower precision:

| Method | Precision | Size (7B) | Speed | Quality |
|--------|-----------|-----------|-------|---------|
| Original | FP32 | ~28GB | 1x | 100% |
| FP16 | 16-bit | ~14GB | 1.5x | ~100% |
| INT8 | 8-bit | ~7GB | 2-3x | ~99% |
| INT4 | 4-bit | ~3.5GB | 3-4x | ~95-98% |

## 📚 Notebooks

### 1. 🚀 [Introduction to Weight Quantization](./notebooks/weight-quantization-basics/)
**Perfect for beginners** - Learn fundamental concepts with hands-on implementations.

- **Concepts**: Absmax, Zero-point, LLM.int8()
- **Visualization**: Weight distributions, quantization impact
- **Evaluation**: Perplexity metrics, quality comparison
- **Duration**: ~15 minutes

[→ Open Notebook](./notebooks/weight-quantization-basics/Introduction-to-Weight-Quantization.ipynb)

---

### 2. 📊 [4-bit Quantization with GPTQ](./notebooks/gptq/)
**Production-ready** - Gradient-aware quantization for minimal accuracy loss.

- **Method**: GPTQ (Gradient Post-Training Quantization)
- **Precision**: 4-bit with group quantization
- **Size Reduction**: ~75% (7B → 1.75GB)
- **Best For**: Production deployments, HuggingFace ecosystem
- **Duration**: ~60-90 minutes

[→ Open Notebook](./notebooks/gptq/4-bit-LLM-Quantization-with-GPTQ.ipynb)

---

### 3. 💻 [GGUF with llama.cpp](./notebooks/gguf-llama-cpp/)
**Most versatile** - Cross-platform quantization for CPU/GPU/Metal inference.

- **Format**: GGUF (GPT-Generated Unified Format)
- **Methods**: Q2_K, Q3_K, Q4_K_M, Q5_K_M, Q6_K, Q8_0
- **Platforms**: CPU, CUDA, Metal (Mac), OpenCL
- **Best For**: Desktop deployment, edge devices, Ollama
- **Duration**: ~30-45 minutes

**Recommended**: Q5_K_M for best quality/size balance

[→ Open Notebook](./notebooks/gguf-llama-cpp/Quantize-Llama-2-models-using-GGUF-and-llama.cpp.ipynb)

---

### 4. ⚡ [ExLlamaV2 Quantization](./notebooks/exllamav2/)
**Fastest inference** - Optimized for NVIDIA GPUs with maximum speed.

- **Method**: ExLlamaV2 format
- **Performance**: Fastest inference library available
- **Bits Per Weight**: Configurable (3.0-6.0 BPW)
- **Best For**: NVIDIA GPUs, speed-critical applications
- **Duration**: ~30-60 minutes

[→ Open Notebook](./notebooks/exllamav2/Quantize-models-with-ExLlamaV2.ipynb)

---

## 🚀 Quick Start

### Option 1: Docker (Recommended)

```bash
# Clone repository
git clone https://github.com/your-username/LLM-Quantization-Zoo.git
cd LLM-Quantization-Zoo

# Build and start containers
make docker-build
make docker-up

# Access Jupyter at http://localhost:8888
```

### Option 2: Local Installation with Poetry

```bash
# Clone repository
git clone https://github.com/your-username/LLM-Quantization-Zoo.git
cd LLM-Quantization-Zoo

# Install Poetry (if not installed)
curl -sSL https://install.python-poetry.org | python3 -

# Install dependencies
poetry install

# Start Jupyter
poetry run jupyter notebook
```

### Option 3: Local Installation with pip

```bash
# Clone repository
git clone https://github.com/your-username/LLM-Quantization-Zoo.git
cd LLM-Quantization-Zoo

# Create virtual environment
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Start Jupyter
jupyter notebook
```

### Option 4: Automated Setup

```bash
# Run setup script
./scripts/setup.sh

# Activate virtual environment
source venv/bin/activate

# Start Jupyter
./scripts/run_notebooks.sh
```

## 🐳 Docker Support

Full Docker support with NVIDIA GPU acceleration:

```bash
# Build image
docker-compose build

# Start container
docker-compose up -d

# View logs
docker-compose logs -f

# Access shell
docker-compose exec llm-quantization-zoo bash

# Stop container
docker-compose down
```

**Features:**
- ✅ NVIDIA CUDA 12.1 support
- ✅ Pre-configured Jupyter environment
- ✅ Persistent volumes for data
- ✅ HuggingFace model cache
- ✅ 16GB shared memory

## 📁 Project Structure

```
LLM-Quantization-Zoo/
│
├── notebooks/                          # All Jupyter notebooks
│   ├── exllamav2/                     # ExLlamaV2 quantization
│   │   ├── README.md
│   │   └── Quantize-models-with-ExLlamaV2.ipynb
│   │
│   ├── gguf-llama-cpp/                # GGUF & llama.cpp
│   │   ├── README.md
│   │   └── Quantize-Llama-2-models-using-GGUF-and-llama.cpp.ipynb
│   │
│   ├── gptq/                          # GPTQ quantization
│   │   ├── README.md
│   │   └── 4-bit-LLM-Quantization-with-GPTQ.ipynb
│   │
│   └── weight-quantization-basics/    # Fundamentals
│       ├── README.md
│       └── Introduction-to-Weight-Quantization.ipynb
│
├── scripts/                           # Helper scripts
│   ├── setup.sh                       # Environment setup
│   └── run_notebooks.sh               # Start Jupyter
│
├── docs/                              # Additional documentation
│
├── data/                              # Data directory (git-ignored)
│   ├── models/                        # Downloaded models
│   ├── datasets/                      # Calibration datasets
│   └── outputs/                       # Quantized models
│
├── Dockerfile                         # Docker configuration
├── docker-compose.yml                 # Docker Compose setup
├── pyproject.toml                     # Poetry configuration
├── requirements.txt                   # Pip requirements
├── Makefile                          # Convenience commands
├── .gitignore                        # Git ignore rules
├── LICENSE                           # MIT License
└── README.md                         # This file
```

## 🛠️ Makefile Commands

```bash
make help              # Show all available commands
make install           # Install dependencies with pip
make install-poetry    # Install dependencies with Poetry
make docker-build      # Build Docker image
make docker-up         # Start Docker containers
make docker-down       # Stop Docker containers
make docker-logs       # View container logs
make clean             # Clean cache and temporary files
make format            # Format code with black
make lint              # Run linting checks
```

## 📋 Requirements

### System Requirements
- **Python**: 3.10 or higher
- **RAM**: 16GB minimum (32GB recommended)
- **GPU**: NVIDIA GPU with 8GB+ VRAM (optional but recommended)
- **Storage**: 50GB+ free space

### Core Dependencies
- PyTorch >= 2.0.0
- Transformers >= 4.35.0
- Accelerate >= 0.25.0
- bitsandbytes >= 0.41.0
- Jupyter Notebook

### Optional Dependencies
- `auto-gptq`: For GPTQ quantization
- `exllamav2`: For ExLlamaV2 (install from GitHub)
- `llama.cpp`: For GGUF quantization (requires compilation)

## 🎓 Learning Path

**Recommended order for learning:**

1. **Start here**: [Weight Quantization Basics](./notebooks/weight-quantization-basics/) - Understand fundamentals
2. **Next**: [GPTQ](./notebooks/gptq/) - Learn gradient-aware quantization
3. **Then**: [GGUF/llama.cpp](./notebooks/gguf-llama-cpp/) - Explore cross-platform deployment
4. **Finally**: [ExLlamaV2](./notebooks/exllamav2/) - Master high-performance inference

## 📊 Comparison Matrix

| Feature | GPTQ | GGUF | ExLlamaV2 | INT8 |
|---------|------|------|-----------|------|
| **Precision** | 4-bit | 2-8 bit | 3-6 bit | 8-bit |
| **Quality** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Speed** | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |
| **CPU Support** | ✅ | ✅✅✅ | ❌ | ✅ |
| **GPU Support** | ✅ | ✅ | ✅✅✅ | ✅ |
| **Easy to Use** | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Size Reduction** | 75% | 60-85% | 65-80% | 50% |

## 🤝 Contributing

Contributions are welcome! Please feel free to:

- 🐛 Report bugs
- 💡 Suggest new quantization methods
- 📝 Improve documentation
- ✨ Add new features

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🌟 Acknowledgments

This project builds upon excellent work from the open-source community:

- [HuggingFace Transformers](https://github.com/huggingface/transformers)
- [llama.cpp](https://github.com/ggerganov/llama.cpp) by Georgi Gerganov
- [ExLlamaV2](https://github.com/turboderp/exllamav2) by turboderp
- [AutoGPTQ](https://github.com/PanQiWei/AutoGPTQ)
- [bitsandbytes](https://github.com/TimDettmers/bitsandbytes) by Tim Dettmers

## 📧 Contact

**Author**: Hao Hoang  
**GitHub**: [@your-username](https://github.com/your-username)  
**Email**: your.email@example.com

---

<div align="center">

**If this repository helped you, please consider giving it a ⭐!**

Made with ❤️ for the ML community

</div>
