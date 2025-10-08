# GGUF & llama.cpp Quantization

This directory contains notebooks for quantizing models into GGUF format using llama.cpp, the most popular format for CPU and cross-platform inference.

## Contents

- `Quantize-Llama-2-models-using-GGUF-and-llama.cpp.ipynb` - Comprehensive guide to GGUF quantization

## Key Features

- **Cross-platform**: Works on CPU, GPU, Metal (Mac), and more
- **Multiple quantization methods**: Q2_K through Q8_0
- **Highly optimized**: C++ implementation for maximum performance
- **Portable**: Single binary with minimal dependencies

## Requirements

```bash
# Clone and build llama.cpp
git clone https://github.com/ggerganov/llama.cpp
cd llama.cpp
make
# For CUDA support:
# LLAMA_CUBLAS=1 make
```

## Quantization Methods Comparison

| Method | Size | Quality | Use Case |
|--------|------|---------|----------|
| Q8_0 | ~8GB (7B) | Excellent | Best quality, slowest |
| Q6_K | ~6GB | Excellent | High quality |
| **Q5_K_M** | ~5GB | Very Good | **Recommended** |
| **Q4_K_M** | ~4GB | Good | **Best balance** |
| Q3_K_M | ~3GB | Acceptable | Small devices |
| Q2_K | ~2GB | Poor | Not recommended |

## Usage

1. Download model from HuggingFace
2. Convert to FP16
3. Quantize with chosen method(s)
4. Run inference and test

## Performance Tips

- Use `-ngl 35` flag to offload layers to GPU
- Adjust context size with `-c` parameter
- Use `--mlock` to prevent swapping on systems with enough RAM

