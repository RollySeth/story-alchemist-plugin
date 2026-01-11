# Story Alchemist - PowerPoint Presentation Analyzer

Transform your PowerPoint presentations with AI-powered analysis. Story Alchemist combines storytelling evaluation with aesthetic design critique to help you create presentations that captivate and convince.

## 🎯 What It Does

Story Alchemist provides two complementary AI analysis tools:

### 📖 **TaleTuner** - Story Structure Analysis
Evaluates your presentation's narrative flow, structure, and storytelling effectiveness.

**Perfect for:**
- Refining your pitch deck story
- Improving training material flow
- Ensuring executive presentations land
- Getting feedback before the big presentation

**You'll get:**
- Creative presentation name with score (e.g., "The Phoenix Rising 8/10")
- One-line story assessment
- Actionable tips to enhance narrative flow
- Slide structure and ordering recommendations

### 🎨 **Aura Sense** - Aesthetic & Vibe Analysis
Analyzes your presentation's emotional resonance, design choices, and visual personality.

**Perfect for:**
- Understanding your deck's emotional impact
- Elevating your visual design
- Ensuring aesthetic matches your message
- Getting design feedback from an expert eye

**You'll get:**
- Creative aura name (e.g., "Cyberpunk Neon Authority Vibes")
- Design DNA breakdown (colors, typography, visual energy)
- Aura rating out of 10
- Specific aesthetic enhancements
- Honest feedback with supportive humor

## 🚀 Quick Start

### Installation

1. **For Claude Code CLI:**
```bash
# Clone or copy the plugin to your .claude/skills directory
cp -r story-alchemist-plugin ~/.claude/skills/
```

2. **For VSCode Extension:**
- The plugin auto-discovers from `.claude/skills/` in your workspace
- Reload window if needed (Ctrl+Shift+P → "Developer: Reload Window")

### Requirements

- **Windows:** PowerPoint installed (for .ppt and .pptx support)
- **macOS/Linux:** Modern .pptx files supported, legacy .ppt limited
- **Python packages:** `pywin32` (Windows), `python-pptx` (all platforms)

```bash
pip install pywin32 python-pptx
```

## 📝 Usage Examples

### Story Analysis

```
Analyze my pitch deck: ~/Documents/startup-pitch.pptx
Review the story in quarterly-review.pptx
Can you evaluate the narrative flow in my training deck?
```

### Aesthetic Analysis

```
What's the vibe of my presentation: ~/Documents/pitch.pptx
Analyze the aesthetic of sales-deck.pptx
Check the aura on my quarterly review
What's the design personality of this deck?
```

### Using Slash Commands

```
/taletuner path/to/presentation.pptx
/aurasense path/to/presentation.pptx
```

## 📁 Supported Formats

- ✅ **Modern PPTX** (.pptx) - Full support on all platforms
- ✅ **Legacy PPT** (.ppt) - Full support on Windows, limited elsewhere
- ✅ **PDF** (.pdf) - Visual analysis supported

## 🎨 Sample Output

### TaleTuner Example:
```
🎭 The Phoenix Rising (Story Score: 8/10)

Your deck tells a compelling transformation story that builds
momentum beautifully through Act 1 and 2, though the ending
could use a stronger call-to-action punch.

**Tips to Level Up:**
- Consider moving your success metrics (slides 12-14) earlier
  to build credibility upfront
- Your slide 7 has 3 different ideas competing - split it into
  2 slides for clarity
- Add a bridge slide between problem (3-5) and solution (6-8)
```

### Aura Sense Example:
```
╔═══════════════════════════════════════════════════════╗
║           YOUR DECK AURA IS:                          ║
║   ✨ **Cyberpunk Neon Authority Vibes** ✨           ║
║                                                       ║
║           🎯 Aura Rating: 8/10 🔐                     ║
╚═══════════════════════════════════════════════════════╝

🎨 DESIGN DNA

🎨 Color Palette
Hot magenta pink meets electric blue against deep purple
gradients—pure cyberpunk aesthetic that screams "digital
threat" while maintaining corporate credibility.

✍️ Typography
Monospace-inspired headers give hacker-movie vibes while
body text stays clean and readable.

⚡ Visual Energy
High-voltage throughout. Every slide pulses with neon
energy, lock icons glow like they're protecting the Matrix.
```

## 🛠️ Technical Details

### File Format Handling

The plugin intelligently handles different PowerPoint formats:

1. **Modern PPTX**: Uses python-pptx library for fast parsing
2. **Legacy PPT**: Uses PowerPoint COM automation (Windows)
3. **Corrupted/Unknown**: Graceful fallback with helpful error messages

### Platform Support

| Platform | PPTX | PPT | PDF |
|----------|------|-----|-----|
| Windows  | ✅   | ✅  | ✅  |
| macOS    | ✅   | ⚠️  | ✅  |
| Linux    | ✅   | ⚠️  | ✅  |

⚠️ = Limited support (requires conversion or LibreOffice)

## 🎯 Use Cases

### For Startup Founders
- Polish your pitch deck story
- Ensure your investor deck has the right vibe
- Get feedback before demo day

### For Corporate Professionals
- Elevate quarterly business reviews
- Refine executive presentations
- Improve training material engagement

### For Designers
- Get aesthetic feedback on presentation design
- Understand emotional impact of color choices
- Validate design decisions

### For Educators
- Improve lecture slide flow
- Enhance educational material design
- Create more engaging presentations

## 🤝 Contributing

Found a bug or have a feature request? We'd love to hear from you!

## 📄 License

MIT License - feel free to use, modify, and distribute

## 🙏 Credits

Created by RollyOS

Powered by Claude AI

## 📮 Support

Having issues? Check our troubleshooting guide:
- Ensure PowerPoint is installed (Windows, for .ppt files)
- Verify Python packages are installed: `pip install pywin32 python-pptx`
- Try converting legacy .ppt to .pptx format
- Check file isn't corrupted

## 🔮 What's Next

We're constantly improving Story Alchemist:
- [ ] Enhanced PDF support with OCR
- [ ] Batch analysis for multiple presentations
- [ ] Export reports as markdown/PDF
- [ ] Template recommendations based on analysis
- [ ] Integration with presentation tools

---

**Made with ❤️ for better presentations**

Transform your decks from "meh" to memorable with Story Alchemist.
