---
name: taletuner
description: Analyze PowerPoint presentations for story cohesion and structure. Use when the user asks to review, analyze, or evaluate a PowerPoint presentation, deck, slides, or .pptx file for storytelling quality.
allowed-tools: Read, Bash
---

# TaleTuner - PowerPoint Story Analyzer

## Purpose
Analyze PowerPoint presentations to evaluate their story cohesion, structure, and effectiveness in meeting their intended goal.

## When to Use
- User provides a PowerPoint file (.pptx)
- User asks to review, analyze, or evaluate a presentation
- User wants feedback on their deck's storytelling
- Keywords: "presentation", "deck", "slides", "PowerPoint", "story", "cohesion"

## Instructions

### Step 1: Get the File
The user will provide a PowerPoint file path. If no file is provided, respond with:
"Please provide a PowerPoint file for me to evaluate the story."

**Supported Formats:** .pptx (modern), .ppt (legacy), .pdf

### Step 1.5: Handle File Format

**For PDF files:** Use the Read tool directly to view pages and extract text.

**For PowerPoint files (.pptx or .ppt):**

Use COM automation to extract content reliably from both formats:

```python
python -c "
import win32com.client
import pythoncom
import os

file_path = r'<FILE_PATH>'

pythoncom.CoInitialize()
try:
    ppt = win32com.client.Dispatch('PowerPoint.Application')
    pres = ppt.Presentations.Open(os.path.abspath(file_path), ReadOnly=True, Untitled=True, WithWindow=False)

    print(f'Total slides: {pres.Slides.Count}')

    for i in range(1, pres.Slides.Count + 1):
        slide = pres.Slides(i)
        print(f'\\n=== SLIDE {i} ===')

        # Extract all text from the slide
        for j in range(1, slide.Shapes.Count + 1):
            shape = slide.Shapes(j)
            if hasattr(shape, 'HasTextFrame') and shape.HasTextFrame:
                if shape.TextFrame.HasText:
                    text = shape.TextFrame.TextRange.Text.strip()
                    if text:
                        print(text)

    pres.Close()
    ppt.Quit()
finally:
    pythoncom.CoUninitialize()
"
```

**Error Handling:**
- If file not found: Ask user to verify the path
- If COM automation unavailable: Ask user to ensure PowerPoint is installed (Windows) or provide a .pdf export
- If file is corrupted: Inform user and suggest re-exporting from PowerPoint

### Step 2: Analyze the Presentation
Read and analyze the PowerPoint file to understand:
- The overall narrative and story flow
- Slide structure and organization
- Intended goal or purpose of the presentation
- Coherence between slides
- Audience appropriateness

### Step 3: Provide Feedback

Your response must include:

**a. Creative Name with Emoji**
- Give the presentation a fun, creative name that reflects its overall story score or vibe
- Include an appropriate emoji
- Start with the sentence - 'Your presentation is:' then add the overall presentation name, score & emoji.
- Follow "The Vibe Test" guidelines below

**b. One-Line Summary**
- Provide a playful but professional one-line summary of the deck's story
- Should be fun and memorable

**c. Enhancement Tips**
- Provide actionable tips to enhance the story
- Consider:
  - Slide structure and flow
  - Optimal slide length
  - Slide or section ordering
  - Heading effectiveness
  - Readability for the target audience
  - Overall vibe and tone alignment

Format the entire output in fun and organized way with playful emoji, keeping it exciting & engaging. 

## The Vibe Test for Naming

When creating the name and summary:
- ✅ Default to playful and creative names - push the boundaries of fun while staying tasteful
- ✅ Smart but not academic
- ✅ Playful but not childish (lean more playful!)
- ✅ Confident but not robotic
- ✅ Modern but not forced-cool
- ✅ Memorable and distinct from generic tech names
- ✅ **Fun enough to make you smile** - if it feels too safe, push harder

**One-liner test:** "Name like an intelligent, creative friend is helping you—not a machine."

If names feel too corporate or generic, regenerate with more personality.

## Example Output Format

```
🎭 **The Phoenix Rising** (Story Score: 8/10)

Your deck tells a compelling transformation story that builds momentum beautifully through Act 1 and 2, though the ending could use a stronger call-to-action punch.

**Tips to Level Up:**
- Consider moving your success metrics (slides 12-14) earlier to build credibility upfront
- Your slide 7 has 3 different ideas competing - split it into 2 slides for clarity
- The transition from problem (slides 3-5) to solution (slides 6-8) is abrupt - add a bridge slide
- Audience vibe: This feels right for executives, but might be too high-level for technical teams
```

## Notes
- Always be encouraging while providing honest feedback
- Balance playfulness with professionalism
- Focus on actionable improvements
- Consider the presenter's likely goals and audience
