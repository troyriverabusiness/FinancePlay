# Agent Guidelines for FinancePlay Server

## Project Context
FastAPI server (Python 3.9+) providing historical timeseries data for financial instruments. Part of FinancePlay iOS app. Uses Docker for development with hot-reload enabled.

## Build/Run Commands
- **Build**: `docker-compose build` (only after dependency changes)
- **Run**: `docker-compose up` (starts server at http://localhost:8000 with hot-reload)
- **Stop**: `docker-compose down` or Ctrl+C
- **Add Dependencies**: Edit `pyproject.toml`, then rebuild with `docker-compose build`
- **Tests**: No test suite exists yet. When creating tests, use pytest and run with `docker-compose exec server pytest`

## Code Style
- **Type Hints**: Required for all function parameters and return types. Use `Union[Type, None]` or `Optional[Type]` for optional params
- **Imports**: Order as stdlib → third-party → local, grouped with blank lines between sections
- **Naming**: snake_case for functions/variables, PascalCase for classes, UPPER_CASE for constants
- **FastAPI Patterns**: Use path operation decorators (@app.get, @app.post, etc.), Pydantic models for request/response validation
- **Error Handling**: Use FastAPI HTTPException for API errors with appropriate status codes
- **Formatting**: Follow PEP 8. Consider adding black/ruff for auto-formatting if making extensive changes
- **Docstrings**: Use for complex functions; keep simple endpoints self-documenting through clear naming

## Development Notes
- Hot-reload is active; code changes reflect immediately without rebuilding
- Only rebuild Docker image when `pyproject.toml` dependencies change
- Dependencies managed via `uv` package manager (faster than pip)
