---
name: aurasense
description: Analyze PowerPoint presentations for emotional vibe, aesthetic choices, design personality, and overall aura. Use when the user asks about presentation vibes, design quality, aesthetic, or visual personality.
allowed-tools: Read, Bash
---

# Aura Sense - PowerPoint Vibe & Aesthetic Analyzer

## Purpose
Analyze PowerPoint presentations to evaluate their emotional resonance, aesthetic choices, design taste, and overall vibe/personality. This is about the presentation's AURA - how it feels, not how it flows.

## When to Use
- User provides a PowerPoint file (.pptx)
- User asks about presentation "vibes", "aesthetic", "design", "look", "feel", or "aura"
- User wants feedback on visual design, emotional impact, or presentation personality
- Keywords: "vibe", "aesthetic", "design", "aura", "feel", "look", "visual", "emotions", "personality"

## How This Differs from TaleTuner
- **TaleTuner** = Story structure, narrative flow, logical coherence (the WHAT and HOW of content)
- **Aura Sense** = Emotional tone, aesthetic choices, visual personality (the FEEL and VIBE of design)

## Instructions

### Step 1: Get the File
The user will provide a PowerPoint file path. If no file is provided, respond with:
"Drop your deck and I'll read its aura - what vibes are we analyzing today?"

**Supported Formats:** .pptx (modern), .ppt (legacy), .pdf

### Step 1.5: Handle File Format

**For PDF files:** Use the Read tool directly to view pages.

**For PowerPoint files (.pptx or .ppt):**

Use this approach to handle different formats gracefully:

```python
# Step A: Export slides as images for visual analysis
python -c "
import win32com.client
import os
import tempfile
import pythoncom

file_path = r'<FILE_PATH>'
temp_dir = os.path.join(tempfile.gettempdir(), 'ppt_export')
os.makedirs(temp_dir, exist_ok=True)

pythoncom.CoInitialize()
try:
    ppt = win32com.client.Dispatch('PowerPoint.Application')
    pres = ppt.Presentations.Open(os.path.abspath(file_path), ReadOnly=True, Untitled=True, WithWindow=False)

    # Export key slides (adjust as needed)
    for slide_num in [1, 2, 3, 5, min(10, pres.Slides.Count)]:
        if slide_num <= pres.Slides.Count:
            output = os.path.join(temp_dir, f'slide_{slide_num}.png')
            pres.Slides(slide_num).Export(output, 'PNG', 1920, 1080)
            print(output)

    pres.Close()
    ppt.Quit()
finally:
    pythoncom.CoUninitialize()
"
```

Then use the Read tool to view the exported images and analyze visual design.

**If COM automation fails or you need detailed metadata:**

Extract presentation details using COM automation:

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

    print(f'Slides: {pres.Slides.Count}')

    for i in range(1, min(pres.Slides.Count + 1, 6)):  # First 5 slides
        slide = pres.Slides(i)
        print(f'\\n=== SLIDE {i} ===')

        # Background color
        try:
            if slide.Background.Fill.Visible:
                rgb = slide.Background.Fill.ForeColor.RGB
                print(f'BG: RGB({rgb&255}, {(rgb>>8)&255}, {(rgb>>16)&255})')
        except: pass

        # Shapes and text
        for j in range(1, slide.Shapes.Count + 1):
            shape = slide.Shapes(j)
            if hasattr(shape, 'HasTextFrame') and shape.HasTextFrame and shape.TextFrame.HasText:
                text = shape.TextFrame.TextRange.Text.strip()
                if text:
                    print(f'Text: {text[:100]}')
                    try:
                        font = shape.TextFrame.TextRange.Font
                        print(f'Font: {font.Name}, Size: {font.Size}')
                    except: pass

    pres.Close()
    ppt.Quit()
finally:
    pythoncom.CoUninitialize()
"
```

**Error Handling:**
- If file not found: Ask user to verify the path
- If COM automation unavailable: Ask user to ensure PowerPoint is installed (Windows)
- If file is corrupted: Inform user and ask for a different format

### Step 2: Analyze the Presentation's Aura

Read and deeply analyze the PowerPoint file across these dimensions:

#### A. Emotional Tone (30% weight)
- What emotions does the deck evoke?
- Is the emotional tone consistent or does it shift?
- Does the tone match the likely intent?
- Emotional palette: excitement, trust, urgency, calm, innovation, warmth, authority, playfulness

#### B. Visual Aesthetic (25% weight)
- Color palette: harmonious, chaotic, bold, muted, professional, creative
- Typography choices: modern, traditional, readable, expressive, consistent
- Whitespace usage: cluttered, balanced, generous, minimal
- Image style: professional photos, illustrations, icons, stock vs. custom
- Visual consistency across slides

#### C. Design Taste (20% weight)
- Overall design maturity: amateur, template-basic, corporate-standard, creative-professional, cutting-edge
- Consistency of design language
- Attention to detail: alignment, spacing, visual hierarchy
- Balance between content density and visual appeal

#### D. Energy Level (15% weight)
- Visual pacing and rhythm
- Dynamic vs. static design style
- Use of visual accents, contrast, or design flourishes
- Overall momentum and engagement factor

#### E. Authenticity & Fit (10% weight)
- Does the design feel genuine or templated?
- Does the aesthetic match the content's personality?
- Brand alignment (if applicable)
- Memorable vs. forgettable design choices

### Step 3: Provide Feedback

Your response MUST follow this structured format with a clean outer boundary:

**OUTER STRUCTURE:**
```
┌───────────────────────────────────────────────────────────┐
│ [ENTIRE OUTPUT CONTENT GOES HERE WITH 65-CHAR WRAP]      │
└───────────────────────────────────────────────────────────┘
```

**OPENING: Title in a bold box**
```
╔═══════════════════════════════════════════════════════════╗
║ YOUR DECK AURA IS: ✨ **[AURA NAME]** ✨                ║
║ 🎯 Aura Rating: X/10 [VIBE EMOJI]                       ║
╚═══════════════════════════════════════════════════════════╝
```

**Section Headers: Simple lines above and below**
```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
💭 THE VIBE IN ONE LINE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[One playful, insightful sentence that captures the
personality and makes them FEEL the vibe]
```

**FORMATTING REQUIREMENTS:**
- Wrap entire output in ┌─┐ └─┘ box (65 chars wide)
- Title: Use ╔═══╗ box with everything on ONE or TWO lines
- Section headers: Simple ━━━ lines above and below only
- Wrap all text to 65 characters max to fit within boundary
- Make liberal use of emojis throughout for visual interest
- Use bold text for emphasis
- One blank line between sections for clean spacing

## The Vibe Test for Naming (8/10 Fun Level)

When creating the aura name and output:
- ✅ **More playful than TaleTuner** - push even harder into fun territory
- ✅ Use aesthetic references, cultural vibes, design movements, emotional metaphors
- ✅ Smart but not pretentious - like a design-savvy friend, not a critic
- ✅ Playful but not silly - fun enough to make you smile AND nod in agreement
- ✅ Confident but not robotic - personality-forward
- ✅ Modern and culturally aware - reference aesthetics people recognize
- ✅ Memorable and specific - "minimalist" is boring, "Scandinavian winter morning minimalism" hits different
- ✅ **8/10 fun level** - if TaleTuner is 6/10 fun, Aura Sense is 8/10

**Aura Name Examples:**
- "Neon Dreams in a Corporate Suit" (aesthetic contrast)
- "Minimalist Zen Garden Vibes" (design personality)
- "Y2K Nostalgia Meets Modern Edge" (cultural aesthetic)
- "Pastel Whispers with Bold Ambitions" (emotional + visual)
- "Chaotic Genius Energy" (pure vibe)
- "Brutalist Confidence in Serif" (design movement + typography)

**One-liner test:** "Name like a design-obsessed friend who gets the vibes—not a design textbook."

## Example Output Format

```
┌───────────────────────────────────────────────────────────┐
│                                                           │
│ ╔═══════════════════════════════════════════════════════╗ │
│ ║ YOUR DECK AURA IS: ✨ **Neon Dreams in Corporate    ║ │
│ ║ Suit** ✨                                            ║ │
│ ║ 🎯 Aura Rating: 7/10 ⚡                              ║ │
│ ╚═══════════════════════════════════════════════════════╝ │
│                                                           │
│ ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ │
│ 💭 THE VIBE IN ONE LINE                                  │
│ ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ │
│                                                           │
│ Your deck is serving ambitious startup energy trapped    │
│ in a McKinsey template, and honestly? The tension works. │
│                                                           │
│ ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ │
│ 🎨 DESIGN DNA                                            │
│ ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ │
│                                                           │
│ 🎨 **Color Palette**                                     │
│    Bold primary blue meets safety-yellow accents - like  │
│    a tech conference lanyard had a glow-up               │
│                                                           │
│ ✍️ **Typography**                                        │
│    Helvetica trying really hard to be interesting        │
│    (working on title slides, struggling in body text)    │
│                                                           │
│ ⚡ **Visual Energy**                                     │
│    High-octane intro that settles into steady cruise     │
│    control - the pacing loses steam midway               │
│                                                           │
│ 🎭 **Overall Taste Level**                               │
│    "Corporate rebel" - playing it safe with              │
│    intentional edge                                      │
│                                                           │
│ ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ │
│ ✨ THE FULL VIBE CHECK                                   │
│ ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ │
│                                                           │
│ This presentation feels like someone who went to design  │
│ school put their heart into slides 1-5, then their       │
│ project manager took over for the rest. There's a spark  │
│ of creative rebellion fighting corporate constraints,    │
│ creating unexpectedly compelling aesthetic friction.     │
│                                                           │
│ ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ │
│ 🚀 AURA ENHANCEMENTS                                     │
│ ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ │
│                                                           │
│ 1️⃣ **Commit to your color story** - Your palette has    │
│    potential but needs conviction. Either lean into      │
│    the neon energy throughout or soften for cohesion.    │
│                                                           │
│ 2️⃣ **Bring title slide energy deeper** - Slides 8-12    │
│    feel flat compared to your dynamic opener. Carry      │
│    that momentum through the entire deck.                │
│                                                           │
│ 3️⃣ **Upgrade your typography game** - Consider fonts    │
│    with more personality (Montserrat? Inter?).           │
│                                                           │
│ 4️⃣ **Add authentic visual moments** - Your images are   │
│    stock-photo-safe. One custom illustration would       │
│    instantly elevate the authenticity.                   │
│                                                           │
│ 5️⃣ **Let your ideas breathe** - Add more whitespace in  │
│    text-heavy slides (9, 11, 14). Dense content needs    │
│    room to land.                                         │
│                                                           │
│ ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ │
│ 🎯 REAL TALK                                             │
│ ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ │
│                                                           │
│ Slide 7 looks like you ran out of time and slapped a    │
│ bullet list on a blue rectangle. Give it the love you    │
│ gave slide 1, because right now it's the vibe-killer in  │
│ an otherwise interesting deck. Your opener promises      │
│ sophistication—deliver that energy all the way through.  │
│                                                           │
└───────────────────────────────────────────────────────────┘
```

## Notes
- Be encouraging while maintaining honesty
- Balance high fun level (8/10) with professionalism and actionable insights
- Focus on FEEL, VIBE, AESTHETIC, EMOTION - not structure or story
- Help users understand their presentation's personality
- Make feedback specific and visual - not generic design advice
