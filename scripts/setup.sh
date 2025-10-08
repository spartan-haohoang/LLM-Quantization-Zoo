#!/bin/bash
# Setup script for LLM Quantization Zoo
# This script sets up the development environment

set -e

echo "========================================="
echo "LLM Quantization Zoo - Setup Script"
echo "========================================="
echo ""

# Check Python version
echo "Checking Python version..."
python_version=$(python3 --version 2>&1 | awk '{print $2}')
echo "Python version: $python_version"

# Check if virtual environment exists
if [ ! -d "venv" ]; then
    echo ""
    echo "Creating virtual environment..."
    python3 -m venv venv
    echo "✓ Virtual environment created"
fi

# Activate virtual environment
echo ""
echo "Activating virtual environment..."
source venv/bin/activate

# Upgrade pip
echo ""
echo "Upgrading pip..."
pip install --upgrade pip setuptools wheel

# Install dependencies
echo ""
echo "Installing dependencies..."
if [ -f "requirements.txt" ]; then
    pip install -r requirements.txt
    echo "✓ Dependencies installed from requirements.txt"
else
    echo "❌ requirements.txt not found"
    exit 1
fi

# Create necessary directories
echo ""
echo "Creating necessary directories..."
mkdir -p data/models data/datasets data/outputs
mkdir -p logs
echo "✓ Directories created"

# Initialize git LFS (if git repo exists)
if [ -d ".git" ]; then
    echo ""
    echo "Initializing Git LFS..."
    git lfs install
    echo "✓ Git LFS initialized"
fi

# Download example models (optional)
read -p "Do you want to download example models? (y/N) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Downloading example models..."
    # Add model download commands here if needed
    echo "Skipping for now - configure in scripts/download_models.sh"
fi

echo ""
echo "========================================="
echo "✓ Setup complete!"
echo "========================================="
echo ""
echo "Next steps:"
echo "1. Activate virtual environment: source venv/bin/activate"
echo "2. Start Jupyter: jupyter notebook"
echo "3. Or use Docker: make docker-up"
echo ""
echo "For more commands, run: make help"

