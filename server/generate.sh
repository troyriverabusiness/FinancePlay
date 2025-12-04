#!/bin/bash
# FinancePlay API Code Generation Script
# Generates Pydantic models from openapi.yaml into the generated/ folder
# Run this script when you update openapi.yaml
# Can be run from any directory

set -e

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# The openapi.yaml is in the parent directory (root of the project)
OPENAPI_YAML="${SCRIPT_DIR}/../openapi.yaml"
# The generated folder is in the same directory as this script
GENERATED_DIR="${SCRIPT_DIR}/generated"
# The config directory where pyproject.toml is located
CONFIG_DIR="${SCRIPT_DIR}/config"

# Verify openapi.yaml exists
if [ ! -f "$OPENAPI_YAML" ]; then
    echo "Error: openapi.yaml not found at $OPENAPI_YAML"
    exit 1
fi

# Verify pyproject.toml exists
if [ ! -f "$CONFIG_DIR/pyproject.toml" ]; then
    echo "Error: pyproject.toml not found at $CONFIG_DIR/pyproject.toml"
    exit 1
fi

echo "Generating FastAPI models from $OPENAPI_YAML..."
echo "Output directory: $GENERATED_DIR"

# Change to config directory and use uv to run fastapi-codegen
cd "$CONFIG_DIR"
uv run fastapi-codegen --input "$OPENAPI_YAML" --output "$GENERATED_DIR" --model-file models.py

# Verify the output file was created
if [ -f "$GENERATED_DIR/models.py" ]; then
    echo "✓ Generation complete!"
    echo "Models generated in: $GENERATED_DIR/models.py"
else
    echo "✗ Error: models.py was not generated in expected location: $GENERATED_DIR/models.py"
    exit 1
fi
echo ""

