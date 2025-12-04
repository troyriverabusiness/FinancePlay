# FinancePlay Server

FastAPI server for serving financial market data.

## Development

### First Time Setup

Build the Docker image (only needed once or when dependencies change):

```bash
docker-compose build
```

### Running the Server

Start the server with hot-reload (code changes are reflected immediately):

```bash
docker-compose up
```

The server will be available at `http://localhost:8000`

### Making Code Changes

With `docker-compose up` running, any changes to your Python files will automatically reload thanks to:
- Volume mounts (code is mounted from your local directory)
- Uvicorn's `--reload` flag

**No need to rebuild the image** unless you change `pyproject.toml` dependencies!

### Rebuilding

Only rebuild when:
- Dependencies in `pyproject.toml` change
- Dockerfile changes
- You want to update the base image

```bash
docker-compose build
```

### Stopping the Server

Press `Ctrl+C` or run:

```bash
docker-compose down
```

