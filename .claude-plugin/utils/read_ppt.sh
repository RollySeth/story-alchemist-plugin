#!/bin/bash
# PowerPoint Reader Utility
# Handles .ppt, .pptx, and .pdf files with automatic format detection

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PPT_FILE="$1"
EXPORT_IMAGES="${2:-false}"

if [ -z "$PPT_FILE" ]; then
    echo "Usage: $0 <ppt_file> [export_images]"
    exit 1
fi

# Check if file exists
if [ ! -f "$PPT_FILE" ]; then
    echo "ERROR: File not found: $PPT_FILE" >&2
    exit 1
fi

# Run the Python converter
if [ "$EXPORT_IMAGES" = "true" ]; then
    python "$SCRIPT_DIR/ppt_converter.py" "$PPT_FILE" --export-images
else
    python "$SCRIPT_DIR/ppt_converter.py" "$PPT_FILE"
fi
