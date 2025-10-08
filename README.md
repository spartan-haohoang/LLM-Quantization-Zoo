# LLM Quantization Zoo 🐘

Welcome to the LLM Quantization Zoo! This repository is a practical collection of notebooks designed to demonstrate various techniques for quantizing Large Language Models (LLMs). Quantization is the process of reducing the precision of a model's weights, which significantly decreases its size and memory footprint, making it faster and more accessible for deployment.

Each notebook is a self-contained example that walks you through a specific quantization framework or method.

---

## 📚 Table of Contents

This collection covers several popular and effective quantization methods. Each section corresponds to a specific notebook in the repository.

1.  [**Introduction to Weight Quantization**](./Introduction-to-Weight-Quantization.ipynb): A foundational notebook explaining the core concepts of quantization, including `absmax` and `zero-point` methods.
2.  [**GPTQ: 4-bit Quantization**](./4-bit-LLM-Quantization-with-GPTQ.ipynb): A popular post-training quantization (PTQ) method that offers a great balance between performance and model size.
3.  [**GGUF with `llama.cpp`**](./Quantize-Llama-2-models-using-GGUF-and-llama.cpp.ipynb): The go-to format for running models efficiently on CPUs and various hardware, powered by the highly optimized `llama.cpp` library.
4.  [**ExLlamaV2: The Fastest Quantization**](./Quantize-models-with-ExLlamaV2.ipynb): An extremely fast inference engine that uses its own quantization format for maximum speed on NVIDIA GPUs.

---

### **1. Introduction to Weight Quantization**

This notebook provides a gentle introduction to the fundamental principles of model quantization. It's the perfect starting point if you're new to the topic.

-   **Key Concepts**:
    -   **Absmax Quantization**: A symmetric quantization method that maps the absolute maximum value to the edge of the quantization range.
    -   **Zero-Point Quantization**: An asymmetric method that uses a "zero-point" to map the original zero value, which is useful for non-symmetric weight distributions.
    -   **Impact on Performance**: We'll visualize the effect of quantization on weight distributions and measure the impact on text generation quality and perplexity.
-   **Libraries Used**: `PyTorch`, `transformers`, `bitsandbytes`, `matplotlib`.
-   **Code**: [`./Introduction-to-Weight-Quantization.ipynb`](./Introduction-to-Weight-Quantization.ipynb)



---

### **2. 4-bit LLM Quantization with GPTQ**

GPTQ (Generative Pre-trained Transformer Quantization) is a powerful post-training quantization method that allows for accurate 4-bit quantization with minimal performance degradation.

-   **Key Concepts**:
    -   **Post-Training Quantization (PTQ)**: Quantizing a model after it has already been trained.
    -   **Calibration Dataset**: Using a small, representative dataset to help the model maintain accuracy during quantization.
-   **Libraries Used**: `auto-gptq`, `transformers`, `datasets`.
-   **Code**: [`./4-bit-LLM-Quantization-with-GPTQ.ipynb`](./4-bit-LLM-Quantization-with-GPTQ.ipynb)

---

### **3. Quantizing with GGUF and `llama.cpp`**

GGUF is a file format designed for `llama.cpp`, a highly efficient inference engine that runs LLMs on a wide range of hardware, including CPUs and Macs. This is one of the most popular methods for creating portable, high-performance models.

-   **Key Concepts**:
    -   **GGUF Format**: A versatile binary format for storing quantized models.
    -   **`llama.cpp`**: A C++ library for running LLMs with minimal dependencies and maximum performance.
    -   **Quantization Methods**: Explore various GGUF quantization types like `Q4_K_M` and `Q5_K_M` to find the right balance between size and performance.
-   **Libraries Used**: `llama.cpp`, `huggingface_hub`.
-   **Code**: [`./Quantize-Llama-2-models-using-GGUF-and-llama.cpp.ipynb`](./Quantize-Llama-2-models-using-GGUF-and-llama.cpp.ipynb)

---

### **4. Quantizing with ExLlamaV2**

ExLlamaV2 is renowned for being one of the fastest inference libraries available, specifically optimized for NVIDIA GPUs. It uses its own quantization format to achieve state-of-the-art inference speeds.

-   **Key Concepts**:
    -   **High-Speed Inference**: Learn how to use a library built from the ground up for speed.
    -   **ExLlamaV2 Format**: Convert a standard Hugging Face model into the `.exl2` format.
    -   **Bits Per Weight (BPW)**: Configure the level of quantization to balance speed and accuracy.
-   **Libraries Used**: `exllamav2`, `huggingface_hub`.
-   **Code**: [`./Quantize-models-with-ExLlamaV2.ipynb`](./Quantize-models-with-ExLlamaV2.ipynb)

---

## 🚀 How to Use

1.  **Clone the repository**:
    ```sh
    git clone [https://github.com/your-username/LLM-Quantization-Zoo.git](https://github.com/your-username/LLM-Quantization-Zoo.git)
    cd LLM-Quantization-Zoo
    ```

2.  **Open a notebook**:
    Choose any notebook from the repository and run it in an environment like Google Colab or a local Jupyter instance.

3.  **Install dependencies**:
    Each notebook contains the necessary `pip install` commands at the beginning to set up the required environment.

---

## 🙏 Acknowledgements

A special thanks to **Maxime Labonne** for creating the original notebooks and tutorials that form the basis of this collection. Please check out his work:

-   **GitHub**: [mlabonne/llm-course](https://github.com/mlabonne/llm-course)
-   **Blog**: [Maxime Labonne's Blog](https://mlabonne.github.io/blog/)

---

## 📜 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
