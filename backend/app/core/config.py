from typing import List
import os

class Settings:
    PROJECT_NAME: str = "Todoist API"
    BACKEND_CORS_ORIGINS: List[str] = ["http://localhost:3000"]
    
    # You can still read from environment variables if needed
    DATABASE_URL: str = os.getenv("DATABASE_URL", "sqlite:///./test.db")

settings = Settings()
