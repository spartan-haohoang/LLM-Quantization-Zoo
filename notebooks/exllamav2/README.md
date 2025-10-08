# ExLlamaV2 Quantization

This directory contains notebooks demonstrating quantization using ExLlamaV2, a high-performance inference library optimized for NVIDIA GPUs.

## Contents

- `Quantize-models-with-ExLlamaV2.ipynb` - Complete workflow for quantizing models with ExLlamaV2

## Key Features

- **High-speed inference**: Optimized specifically for NVIDIA GPUs
- **Configurable quantization**: Adjust bits per weight (BPW) for size/quality tradeoff
- **Calibration-based**: Uses calibration dataset for accuracy preservation

## Requirements

```bash
# Clone ExLlamaV2 repository
git clone https://github.com/turboderp/exllamav2
pip install -e exllamav2
```

## Usage

1. Configure your model name and BPW settings
2. Download the base model from HuggingFace
3. Download calibration dataset (WikiText)
4. Run quantization
5. Test inference

## Recommended Settings

- **BPW 5.0-6.0**: Best quality, minimal loss
- **BPW 4.0-4.5**: Good balance
- **BPW 3.0-3.5**: Smaller size, some quality loss

## Notes

- Requires NVIDIA GPU with CUDA support
- Quantization time depends on model size (7B models: ~30-60 minutes)
- Final model size: ~40-60% of original (depends on BPW)

