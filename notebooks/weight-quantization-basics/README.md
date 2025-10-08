# Weight Quantization Basics

This directory contains educational notebooks covering fundamental quantization concepts and implementations.

## Contents

- `Introduction-to-Weight-Quantization.ipynb` - Comprehensive introduction to quantization theory and practice

## Topics Covered

### 1. Absmax Quantization
- Symmetric quantization method
- Maps values using absolute maximum
- Simple and fast implementation
- Best for symmetric weight distributions

### 2. Zero-Point Quantization
- Asymmetric quantization with offset
- Handles non-symmetric distributions
- More accurate for biased weights
- Slightly more complex

### 3. LLM.int8()
- Production-ready 8-bit quantization
- Bitsandbytes library implementation
- Minimal quality degradation
- 4x memory reduction

## Learning Objectives

After completing this notebook, you will understand:
- ✅ How quantization reduces model size
- ✅ Different quantization strategies and their tradeoffs
- ✅ Impact on model quality (perplexity)
- ✅ Practical implementation details
- ✅ Visualization of weight distributions

## Requirements

```bash
pip install torch transformers bitsandbytes matplotlib numpy
```

## Concepts Demonstrated

- **Scale factor calculation**: How to map FP32 → INT8
- **Quantization error**: Measuring and visualizing precision loss
- **Dequantization**: Recovering approximate original values
- **Perplexity evaluation**: Quantifying model quality

## Visualizations

The notebook includes:
- Weight distribution histograms
- Before/after quantization comparisons
- Perplexity metrics
- Model size comparisons

## Best For

- Beginners learning about quantization
- Understanding theoretical foundations
- Comparing different quantization methods
- Educational and interview preparation

