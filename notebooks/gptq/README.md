# GPTQ Quantization

This directory contains notebooks for GPTQ (Gradient Post-Training Quantization), a sophisticated quantization method that maintains accuracy through gradient-aware optimization.

## Contents

- `4-bit-LLM-Quantization-with-GPTQ.ipynb` - Complete GPTQ quantization workflow

## Key Features

- **Gradient-aware**: Uses gradient information to minimize accuracy loss
- **4-bit precision**: Achieves ~75% size reduction
- **Calibration-based**: Uses representative dataset for optimization
- **Group quantization**: Quantizes weights in groups for better accuracy

## Requirements

```bash
pip install auto-gptq transformers datasets
```

## Key Parameters

- **bits**: Quantization precision (typically 4)
- **group_size**: Number of weights per quantization group (128 recommended)
- **damp_percent**: Damping factor (0.01 default)
- **desc_act**: Activation order optimization

## Calibration Dataset

GPTQ requires a calibration dataset to optimize quantization:
- **C4**: General-purpose text (recommended)
- **WikiText**: Encyclopedia articles
- **Custom**: Domain-specific data for specialized models

## Usage

1. Install AutoGPTQ library
2. Configure quantization parameters
3. Load calibration dataset
4. Run quantization (takes 30-90 minutes for 7B models)
5. Save and test quantized model

## Performance

- **Size reduction**: ~75% (7B → ~1.75GB)
- **Speed**: 1.5-2x faster inference
- **Quality**: Minimal perplexity increase (<5%)

## Notes

- Requires GPU with sufficient VRAM for quantization process
- Inference can run on CPU or GPU
- Compatible with HuggingFace Transformers

