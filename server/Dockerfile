FROM python:3.9-slim

WORKDIR /app

# Install uv for faster dependency management
COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

# Copy dependency files first (for better Docker layer caching)
COPY server/config/pyproject.toml ./
COPY server/config/uv.lock* ./

# Install dependencies (this layer will be cached unless dependencies change)
RUN uv pip install --system .

# Copy application code
COPY server/ .

# Expose port (adjust if needed)
EXPOSE 8000

# Use uvicorn for FastAPI (install if not already in dependencies)
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
