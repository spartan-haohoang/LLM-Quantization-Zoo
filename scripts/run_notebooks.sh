#!/bin/bash
# Run Jupyter notebooks for LLM Quantization Zoo

set -e

# Default values
PORT=8888
HOST="localhost"

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -p|--port)
            PORT="$2"
            shift 2
            ;;
        -h|--host)
            HOST="$2"
            shift 2
            ;;
        --help)
            echo "Usage: $0 [-p|--port PORT] [-h|--host HOST]"
            echo ""
            echo "Options:"
            echo "  -p, --port PORT    Port to run Jupyter on (default: 8888)"
            echo "  -h, --host HOST    Host to bind to (default: localhost)"
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

echo "========================================="
echo "Starting Jupyter Notebook Server"
echo "========================================="
echo "Host: $HOST"
echo "Port: $PORT"
echo ""

# Check if virtual environment is activated
if [ -z "$VIRTUAL_ENV" ]; then
    echo "Warning: Virtual environment not activated"
    echo "Attempting to activate..."
    if [ -d "venv" ]; then
        source venv/bin/activate
        echo "✓ Virtual environment activated"
    else
        echo "❌ No virtual environment found. Run setup.sh first."
        exit 1
    fi
fi

# Start Jupyter Notebook
jupyter notebook \
    --ip="$HOST" \
    --port="$PORT" \
    --no-browser \
    --notebook-dir=./notebooks

echo ""
echo "Jupyter Notebook stopped."

