# Todoist - Full Stack Application

A modern full-stack todo application built with **FastAPI** (Python) backend and **React** (TypeScript) frontend in a monorepo structure.

## 🏗️ Architecture

```
todoist/
├── backend/          # FastAPI + PostgreSQL
├── frontend/         # React + TypeScript
├── shared/           # Shared utilities and types
├── infrastructure/   # Deployment configs
└── docs/            # Documentation
```

## 🚀 Quick Start

### Prerequisites

- **Docker** and **Docker Compose** (recommended)
- **Node.js** 18+ (for local development)
- **Python** 3.11+ (for local development)
- **PostgreSQL** 15+ (for local development)

### Development Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/todoist.git
   cd todoist
   ```

2. **Initial setup**
   ```bash
   make setup
   ```

3. **Start development environment**
   ```bash
   # Using Docker (recommended)
   make dev

   # Or locally without Docker
   make dev-local
   ```

4. **Access the application**
   - Frontend: http://localhost:3000
   - Backend API: http://localhost:8000
   - API Documentation: http://localhost:8000/docs

## 📋 Available Commands

### Development
```bash
make dev          # Start with Docker Compose
make dev-local    # Start locally (no Docker)
make dev-backend  # Start only backend
make dev-frontend # Start only frontend
```

### Building
```bash
make build             # Build all services
make build-backend     # Build backend Docker image
make build-frontend    # Build frontend
```

### Testing
```bash
make test              # Run all tests
make test-backend      # Run backend tests
make test-frontend     # Run frontend tests
```

### Linting
```bash
make lint              # Lint all projects
make lint-backend      # Lint backend
make lint-frontend     # Lint frontend
```

### Database
```bash
make db-migrate        # Run database migrations
make db-reset          # Reset database
```

### Utilities
```bash
make clean            # Clean Docker containers
make install          # Install all dependencies
make help             # Show available commands
```

## 🛠️ Tech Stack

### Backend
- **FastAPI** - Modern Python web framework
- **PostgreSQL** - Primary database
- **SQLAlchemy** - ORM with async support
- **Alembic** - Database migrations
- **Redis** - Caching and session storage
- **Celery** - Background task processing
- **Pydantic** - Data validation
- **Python-JOSE** - JWT handling
- **pytest** - Testing framework

### Frontend
- **React 18** - UI library
- **TypeScript** - Type safety
- **Vite** - Build tool
- **Tailwind CSS** - Utility-first CSS
- **React Router** - Client-side routing
- **Zustand** - State management
- **React Query** - Server state management
- **React Hook Form** - Form handling
- **Zod** - Schema validation
- **Vitest** - Testing framework

### Infrastructure
- **Docker** - Containerization
- **Docker Compose** - Multi-container orchestration
- **Nginx** - Reverse proxy and static file serving
- **GitHub Actions** - CI/CD pipeline

## 📁 Project Structure

```
todoist/
├── backend/
│   ├── app/
│   │   ├── api/          # API routes
│   │   ├── core/         # Core configurations
│   │   ├── models/       # Database models
│   │   ├── schemas/      # Pydantic schemas
│   │   └── services/     # Business logic
│   ├── tests/            # Backend tests
│   ├── alembic/          # Database migrations
│   ├── requirements.txt  # Python dependencies
│   └── main.py          # FastAPI app entry point
├── frontend/
│   ├── src/
│   │   ├── components/   # Reusable components
│   │   ├── pages/        # Page components
│   │   ├── hooks/        # Custom hooks
│   │   ├── services/     # API services
│   │   ├── stores/       # Zustand stores
│   │   ├── types/        # TypeScript types
│   │   └── utils/        # Utility functions
│   ├── public/           # Static assets
│   ├── tests/            # Frontend tests
│   └── package.json      # Node.js dependencies
├── shared/               # Shared code
├── infrastructure/       # Deployment configs
├── docker-compose.yml    # Development environment
├── docker-compose.prod.yml # Production environment
├── Makefile             # Task automation
└── README.md            # This file
```

## 🔧 Environment Variables

Copy `.env.example` to `.env` and configure:

```env
# Database
DATABASE_URL=postgresql://postgres:postgres@localhost:5432/todoist_dev
POSTGRES_PASSWORD=postgres

# Backend
SECRET_KEY=your-secret-key
JWT_SECRET=your-jwt-secret
CORS_ORIGINS=http://localhost:3000

# Frontend
REACT_APP_API_URL=http://localhost:8000

# Redis
REDIS_URL=redis://localhost:6379
```

## 🚢 Deployment

### Production Build

```bash
make prod-build
make prod-deploy
```

### Deployment Options

#### 1. Docker Compose (Simple)
```bash
# On your server
docker-compose -f docker-compose.prod.yml up -d
```

#### 2. Container Orchestration
- **Kubernetes** with provided Helm charts
- **Docker Swarm** with stack files
- **AWS ECS** or **Google Cloud Run**

#### 3. Platform-as-a-Service
- **Railway**: Deploy with one click
- **Render**: Automatic deployments
- **Fly.io**: Global edge deployment

#### 4. Cloud Providers
- **AWS**: ECS + RDS + ElastiCache
- **Google Cloud**: Cloud Run + Cloud SQL
- **Azure**: Container Apps + PostgreSQL

### Production Checklist

- [ ] Set secure environment variables
- [ ] Configure SSL certificates
- [ ] Set up database backups
- [ ] Configure monitoring and logging
- [ ] Set up CI/CD pipeline
- [ ] Configure CDN for static assets
- [ ] Set up error tracking (Sentry)
- [ ] Configure health checks
- [ ] Set up metrics collection
- [ ] Configure auto-scaling

## 🧪 Testing

### Backend Tests
```bash
cd backend
pytest
pytest --cov=app --cov-report=html
```

### Frontend Tests
```bash
cd frontend
npm test
npm run test:coverage
```

### Integration Tests
```bash
make test
```

## 📊 Monitoring

### Health Checks
- Backend: `GET /health`
- Frontend: `GET /health`
- Database: Automatic health checks in Docker

### Metrics
- Application metrics via FastAPI middleware
- Database performance monitoring
- Frontend performance tracking

## 🔐 Security

### Backend Security
- JWT authentication
- Password hashing with bcrypt
- SQL injection prevention
- CORS configuration
- Rate limiting
- Input validation

### Frontend Security
- XSS protection
- CSRF protection
- Secure authentication flow
- Input sanitization
- Content Security Policy

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for your changes
5. Run the test suite
6. Submit a pull request

### Development Workflow

```bash
# Create feature branch
git checkout -b feature/your-feature

# Make changes and test
make test
make lint

# Commit changes
git commit -m "feat: add your feature"

# Push and create PR
git push origin feature/your-feature
```

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

- **Documentation**: [docs/](docs/)
- **Issues**: [GitHub Issues](https://github.com/yourusername/todoist/issues)
- **Discussions**: [GitHub Discussions](https://github.com/yourusername/todoist/discussions)

## 🚀 Roadmap

- [ ] User authentication and authorization
- [ ] Task management (CRUD operations)
- [ ] Categories and tags
- [ ] Due dates and reminders
- [ ] File attachments
- [ ] Team collaboration
- [ ] Mobile app (React Native)
- [ ] Real-time notifications
- [ ] Dark mode support
- [ ] Internationalization (i18n)

---

Made with ❤️ by [buntybru](https://github.com/buntybru) 