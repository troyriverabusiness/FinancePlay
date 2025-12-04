#!/bin/bash
# FinancePlay API Code Generation Script
# Generates Pydantic models from openapi.yaml into the generated/ folder
# Run this script when you update openapi.yaml

set -e

echo "Generating FastAPI models from openapi.yaml..."
fastapi-codegen --input openapi.yaml --output generated --model-file models.py

echo "✓ Generation complete!"
echo "Models generated in: generated/models.py"
echo ""
echo "Next steps:"
echo "1. Implement business logic in services/"
echo "2. Implement route handlers in routers/"
echo "3. Run: docker-compose up"
