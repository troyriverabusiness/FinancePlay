"""
FinancePlay API Server

FastAPI server providing historical timeseries data for financial instruments.
The API is defined in openapi.yaml and uses a modular architecture:
- generated/models.py: Pydantic models generated from OpenAPI spec
- services/: Business logic layer (database queries, processing, etc.)
- routers/: API route handlers that call the service layer
"""

from fastapi import FastAPI

from routers import instruments, timeseries

# Create FastAPI application
app = FastAPI(
    title="FinancePlay API",
    description="Historical timeseries data API for financial instruments",
    version="0.1.0",
    docs_url="/docs",
    openapi_url="/openapi.json",
)

# Register routers
app.include_router(instruments.router)
app.include_router(timeseries.router)


@app.get("/")
def root() -> dict:
    """Root endpoint - API status"""
    return {
        "status": "ok",
        "message": "FinancePlay API is running",
        "docs": "/docs",
        "openapi": "/openapi.json",
    }


if __name__ == "__main__":
    import uvicorn

    uvicorn.run(
        "main:app",
        host="0.0.0.0",
        port=8000,
        reload=True,
        reload_dirs=["routers", "services"],
    )
