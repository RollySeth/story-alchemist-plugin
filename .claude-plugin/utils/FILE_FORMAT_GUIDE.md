# PowerPoint File Format Handling Guide

## Overview
This plugin supports multiple PowerPoint formats:
- Modern PPTX (.pptx) - ZIP-based Office Open XML format
- Legacy PPT (.ppt) - OLE/Compound Document format
- PDF exports of presentations (.pdf)

## Recommended Approach for Skills

### Step 1: Accept Multiple Formats
When a user provides a file path, handle these formats gracefully:

```bash
# Determine file extension
file_extension="${file_path##*.}"

case "$file_extension" in
  pptx|PPTX)
    # Modern format
    ;;
  ppt|PPT)
    # Legacy format - needs conversion or COM automation
    ;;
  pdf|PDF)
    # PDF format - needs special handling
    ;;
  *)
    echo "Unsupported format. Please provide .ppt, .pptx, or .pdf file"
    exit 1
    ;;
esac
```

### Step 2: Use the Converter Utility

For maximum compatibility, use the provided Python converter:

```bash
# Extract content and optionally export images
python .claude-plugin/utils/ppt_converter.py "$file_path" --export-images
```

Or use the shell wrapper:

```bash
bash .claude-plugin/utils/read_ppt.sh "$file_path" true
```

### Step 3: Handle Legacy PPT Files

Legacy .ppt files require special handling on Windows:

**Option A: Direct COM Automation (Recommended for Windows)**
```python
import win32com.client
import pythoncom

pythoncom.CoInitialize()
ppt_app = win32com.client.Dispatch('PowerPoint.Application')
presentation = ppt_app.Presentations.Open(file_path, ReadOnly=True, Untitled=True, WithWindow=False)
# Extract content...
presentation.Close()
ppt_app.Quit()
pythoncom.CoUninitialize()
```

**Option B: Convert to PPTX First**
```bash
python .claude-plugin/utils/ppt_converter.py "$file_path"
# This will auto-detect and convert if needed
```

### Step 4: Export Slides as Images

For visual analysis (especially for Aura Sense), export slides as images:

```python
from utils.ppt_converter import export_slides_as_images

# Export first 5 slides
image_paths = export_slides_as_images(
    ppt_path=file_path,
    slide_numbers=[1, 2, 3, 5, 10]  # Select key slides
)

# Then use Read tool to view the images
for image_path in image_paths:
    # Use Read tool to analyze visual design
    pass
```

## Error Handling

Always handle these common errors:

1. **File Not Found**
```python
if not os.path.exists(file_path):
    return "File not found. Please check the path."
```

2. **Unsupported Format**
```python
if not file_path.lower().endswith(('.ppt', '.pptx', '.pdf')):
    return "Unsupported format. Please provide a .ppt, .pptx, or .pdf file."
```

3. **Missing Dependencies**
```python
try:
    import win32com.client
except ImportError:
    return "PowerPoint COM automation requires pywin32. Install with: pip install pywin32"
```

4. **Corrupted Files**
```python
try:
    # Attempt to open file
except Exception as e:
    return f"Unable to read file. It may be corrupted: {str(e)}"
```

## Best Practices

1. **Always use absolute paths**
```python
import os
file_path = os.path.abspath(file_path)
```

2. **Detect format before processing**
```python
from utils.ppt_converter import is_modern_pptx, is_legacy_ppt

if is_modern_pptx(file_path):
    # Use python-pptx library
elif is_legacy_ppt(file_path):
    # Use COM automation
```

3. **Clean up temporary files**
```python
import tempfile
import shutil

temp_dir = tempfile.mkdtemp()
try:
    # Process files...
finally:
    shutil.rmtree(temp_dir, ignore_errors=True)
```

4. **Provide helpful error messages**
```python
if error:
    return """
    Unable to read the PowerPoint file. This might help:
    - Ensure PowerPoint is installed (required for .ppt files)
    - Check the file isn't corrupted
    - Verify the file path is correct
    """
```

## Platform Considerations

### Windows
- COM automation available (best option for all formats)
- python-pptx works for modern PPTX
- Legacy PPT fully supported via COM

### macOS/Linux
- python-pptx works for modern PPTX
- Legacy PPT support limited (requires LibreOffice or conversion)
- Consider asking users to convert to PPTX first

## Dependencies

Required Python packages:
```bash
pip install python-pptx pywin32
```

Optional (for PDF support):
```bash
pip install pdf2image pypdf2
```
