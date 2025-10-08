.PHONY: help install install-dev docker-build docker-up docker-down clean lint format test

# Variables
PYTHON := python3
PIP := pip3
POETRY := poetry
DOCKER_COMPOSE := docker-compose

help: ## Show this help message
	@echo "LLM Quantization Zoo - Available Commands:"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'

install: ## Install dependencies using pip
	$(PIP) install --upgrade pip setuptools wheel
	$(PIP) install -r requirements.txt

install-poetry: ## Install dependencies using Poetry
	$(POETRY) install

install-dev: ## Install development dependencies
	$(PIP) install black isort flake8 pytest pre-commit
	pre-commit install

docker-build: ## Build Docker image
	$(DOCKER_COMPOSE) build

docker-up: ## Start Docker containers
	$(DOCKER_COMPOSE) up -d
	@echo ""
	@echo "Jupyter Notebook is running at: http://localhost:8888"
	@echo "To view logs: make docker-logs"

docker-down: ## Stop Docker containers
	$(DOCKER_COMPOSE) down

docker-logs: ## View Docker container logs
	$(DOCKER_COMPOSE) logs -f

docker-shell: ## Open shell in Docker container
	$(DOCKER_COMPOSE) exec llm-quantization-zoo bash

docker-restart: docker-down docker-up ## Restart Docker containers

setup-dirs: ## Create necessary directories
	mkdir -p data notebooks scripts docs

clean: ## Clean up generated files and caches
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
	find . -type d -name ".ipynb_checkpoints" -exec rm -rf {} +
	find . -type d -name "*.egg-info" -exec rm -rf {} +
	rm -rf build/ dist/ .pytest_cache/

clean-models: ## Remove downloaded models (WARNING: large files)
	@echo "This will delete all downloaded models. Continue? [y/N]"
	@read ans && [ $${ans:-N} = y ] && rm -rf data/models/* base_model/ quant/ *-GPTQ/ *-GGUF/

lint: ## Run linting checks
	$(PYTHON) -m flake8 scripts/
	$(PYTHON) -m black --check scripts/
	$(PYTHON) -m isort --check-only scripts/

format: ## Format code with black and isort
	$(PYTHON) -m black scripts/
	$(PYTHON) -m isort scripts/

test: ## Run tests (if any)
	$(PYTHON) -m pytest tests/ -v

jupyter: ## Start Jupyter Notebook locally
	jupyter notebook --port=8888

update-deps: ## Update dependencies
	$(PIP) install --upgrade -r requirements.txt

freeze-deps: ## Freeze current dependencies
	$(PIP) freeze > requirements-frozen.txt

info: ## Display environment information
	@echo "Python version:"
	@$(PYTHON) --version
	@echo ""
	@echo "Pip version:"
	@$(PIP) --version
	@echo ""
	@echo "Installed packages:"
	@$(PIP) list | grep -E "(torch|transformers|accelerate|bitsandbytes)"

