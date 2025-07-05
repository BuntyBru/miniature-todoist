.PHONY: help dev dev-local dev-backend dev-frontend build build-backend build-frontend test test-backend test-frontend lint lint-backend lint-frontend clean install setup

# Default target
help:
	@echo "Available commands:"
	@echo "  dev          - Start development environment with Docker Compose"
	@echo "  dev-local    - Start development environment locally (no Docker)"
	@echo "  dev-backend  - Start backend development server"
	@echo "  dev-frontend - Start frontend development server"
	@echo "  build        - Build both backend and frontend"
	@echo "  test         - Run all tests"
	@echo "  lint         - Run linting for both projects"
	@echo "  clean        - Clean up Docker containers and volumes"
	@echo "  install      - Install all dependencies"
	@echo "  setup        - Initial setup for development"

# Development
dev:
	docker-compose up --build

dev-local:
	@echo "Starting backend and frontend locally..."
	@make dev-backend & make dev-frontend

dev-backend:
	@echo "Starting FastAPI backend..."
	cd backend && uvicorn main:app --reload --host 0.0.0.0 --port 8000

dev-frontend:
	@echo "Starting React frontend..."
	cd frontend && npm run dev

# Building
build:
	@echo "Building backend and frontend..."
	@make build-backend && make build-frontend

build-backend:
	@echo "Building backend Docker image..."
	docker build -f Dockerfile.backend -t todoist-backend .

build-frontend:
	@echo "Building frontend..."
	cd frontend && npm run build

# Testing
test:
	@echo "Running all tests..."
	@make test-backend && make test-frontend

test-backend:
	@echo "Running backend tests..."
	cd backend && python -m pytest

test-frontend:
	@echo "Running frontend tests..."
	cd frontend && npm test

# Linting
lint:
	@echo "Running linting for all projects..."
	@make lint-backend && make lint-frontend

lint-backend:
	@echo "Linting backend..."
	cd backend && flake8 . && black --check .

lint-frontend:
	@echo "Linting frontend..."
	cd frontend && eslint . --ext ts,tsx && prettier --check .

# Database
db-migrate:
	@echo "Running database migrations..."
	cd backend && alembic upgrade head

db-reset:
	@echo "Resetting database..."
	docker-compose down -v
	docker-compose up -d postgres
	sleep 5
	@make db-migrate

# Installation
install:
	@echo "Installing all dependencies..."
	@make install-backend && make install-frontend

install-backend:
	@echo "Installing backend dependencies..."
	cd backend && pip install -r requirements.txt

install-frontend:
	@echo "Installing frontend dependencies..."
	cd frontend && npm install

# Setup
setup:
	@echo "Setting up development environment..."
	@make install
	@cp .env.example .env
	@echo "Setup complete! Run 'make dev' to start development."

# Cleanup
clean:
	@echo "Cleaning up Docker containers and volumes..."
	docker-compose down -v
	docker system prune -f

# Production
prod-build:
	@echo "Building for production..."
	docker-compose -f docker-compose.prod.yml build

prod-deploy:
	@echo "Deploying to production..."
	docker-compose -f docker-compose.prod.yml up -d 