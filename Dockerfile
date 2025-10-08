# LLM Quantization Zoo - Docker Image
# Multi-stage build for optimized image size

FROM nvidia/cuda:12.1.0-cudnn8-devel-ubuntu22.04 AS base

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    python3-dev \
    git \
    wget \
    curl \
    build-essential \
    cmake \
    libssl-dev \
    rsync \
    git-lfs \
    && rm -rf /var/lib/apt/lists/*

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 - \
    && ln -s /root/.local/bin/poetry /usr/local/bin/poetry

# Set working directory
WORKDIR /workspace

# Copy dependency files
COPY pyproject.toml requirements.txt ./

# Install Python dependencies
RUN pip3 install --upgrade pip setuptools wheel && \
    pip3 install -r requirements.txt

# Optional: Install Poetry dependencies (uncomment if using Poetry)
# RUN poetry config virtualenvs.create false && \
#     poetry install --no-interaction --no-ansi

# Copy project files
COPY . .

# Expose Jupyter port
EXPOSE 8888

# Set up entrypoint
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]

