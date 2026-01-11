# Story Alchemist - PowerPoint Presentation Analyzer

Transform your PowerPoint presentations with **two powerful AI-powered analysis tools**: story structure evaluation and aesthetic design critique.

## 🎭 Two Complementary Skills

Story Alchemist includes **two distinct analysis skills** that work together to help you create presentations that captivate and convince:

### 📖 **TaleTuner** - Story Structure Analysis

**What it does:**
Evaluates your presentation's narrative flow, structure, and storytelling effectiveness.

**What you get:**
- 🎭 Creative presentation name with story score (e.g., "The Phoenix Rising 8/10")
- 💡 One-line story assessment
- 📝 Actionable tips to enhance narrative flow
- 🎯 Slide structure and ordering recommendations
- 👥 Audience appropriateness feedback

**Perfect for:**
- Refining pitch deck stories
- Improving training material flow
- Ensuring executive presentations land
- Getting feedback before big presentations

### 🎨 **Aura Sense** - Aesthetic & Vibe Analysis

**What it does:**
Analyzes your presentation's emotional resonance, design choices, and visual personality.

**What you get:**
- ✨ Creative aura name (e.g., "Cyberpunk Neon Authority Vibes")
- 🎨 Design DNA breakdown (colors, typography, visual energy, taste level)
- ⭐ Aura rating out of 10
- 🚀 Specific aesthetic enhancement suggestions
- 💬 Honest feedback with supportive humor

**Perfect for:**
- Understanding emotional impact
- Elevating visual design
- Ensuring aesthetic matches message
- Getting expert design feedback

## 📦 Installation

### Requirements
- **Python 3.8+**
- **Windows:** PowerPoint installed (for .ppt and .pptx support)
- **All platforms:** Python packages

```bash
pip install pywin32 python-pptx
```

### For VSCode Extension Users (Recommended)
1. Copy this folder to your workspace
2. Both TaleTuner and Aura Sense skills will be auto-discovered from `.claude/skills/`
3. Reload VSCode window if needed (Ctrl+Shift+P → "Developer: Reload Window")

### For Claude Code CLI Users
```bash
# Copy skills to your Claude directory
cp -r .claude/skills/* ~/.claude/skills/

# Or keep project-specific
# Just ensure .claude/skills/ is in your working directory
```

## 🚀 Usage

### Option 1: Natural Language (Automatic Detection)

**For Story Analysis (TaleTuner):**
```
"Analyze this presentation: path/to/your-pitch.pptx"
"Review my deck for storytelling: quarterly-review.pptx"
"Evaluate the narrative flow in training-deck.pptx"
```

**For Aesthetic Analysis (Aura Sense):**
```
"What's the vibe of this presentation: path/to/deck.pptx"
"Analyze the aesthetic of sales-deck.pptx"
"Check the aura on my pitch deck"
"What's the design personality of quarterly-review.pptx?"
```

### Option 2: Slash Commands (Direct)

**TaleTuner - Story Analysis:**
```bash
/taletuner path/to/presentation.pptx
```

**Aura Sense - Aesthetic Analysis:**
```bash
/aurasense path/to/presentation.pptx
```

## 📁 Supported File Formats

Both skills support multiple PowerPoint formats:

| Format | Extension | Support Level |
|--------|-----------|---------------|
| Modern PowerPoint | .pptx | ✅ Full (all platforms) |
| Legacy PowerPoint | .ppt | ✅ Full (Windows) / ⚠️ Limited (other) |
| PDF Export | .pdf | ✅ Visual analysis |

## 📊 Sample Outputs

### TaleTuner Example Output:
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
- Audience vibe: This feels right for executives, but might be
  too high-level for technical teams
```

### Aura Sense Example Output:
```
╔═══════════════════════════════════════════════════════════════╗
║                    YOUR DECK AURA IS:                         ║
║      ✨ **Cyberpunk Neon Authority Vibes** ✨               ║
║                                                               ║
║              🎯 Aura Rating: 8/10 🔐                          ║
╚═══════════════════════════════════════════════════════════════╝

┌─────────────────────────────────────────────────────────────┐
│ 💭 THE VIBE IN ONE LINE                                     │
├─────────────────────────────────────────────────────────────┤
│ Your deck is serving serious Blade Runner meets corporate  │
│ training energy—neon-drenched urgency wrapped in pro       │
│ polish that actually makes cybersecurity feel cinematic.   │
└─────────────────────────────────────────────────────────────┘

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🎨 DESIGN DNA
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🎨 **Color Palette**
   Hot magenta pink meets electric blue against deep purple
   gradients—pure cyberpunk aesthetic that screams "digital
   threat" while maintaining corporate credibility.

✍️ **Typography**
   Monospace-inspired headers give hacker-movie vibes while
   body text stays clean and readable.

⚡ **Visual Energy**
   High-voltage throughout. Every slide pulses with neon energy.
```

## 🏗️ Plugin Structure

```
story-alchemist-plugin/
├── .claude-plugin/              # CLI plugin configuration
│   ├── plugin.json             # Metadata for both skills
│   ├── commands/
│   │   ├── TaleTuner.md       # Story analysis skill
│   │   └── AuraSense.md       # Aesthetic analysis skill
│   └── utils/
│       ├── ppt_converter.py   # File format handler
│       └── read_ppt.sh        # Shell wrapper
├── .claude/                    # VSCode extension skills
│   └── skills/
│       ├── taletuner/         # Story analysis
│       │   └── skill.md
│       └── aurasense/         # Aesthetic analysis
│           └── skill.md
├── README.md                   # This file
├── MARKETPLACE_README.md       # Marketplace listing
├── PACKAGING_GUIDE.md         # Publishing guide
└── LICENSE                     # MIT License
```

## 🎯 Use Cases

### For Startup Founders
- **TaleTuner:** Polish pitch deck story and narrative
- **Aura Sense:** Ensure investor deck has the right vibe

### For Corporate Professionals
- **TaleTuner:** Refine quarterly business review flow
- **Aura Sense:** Elevate executive presentation design

### For Designers
- **TaleTuner:** Validate presentation structure
- **Aura Sense:** Get aesthetic feedback and design validation

### For Educators
- **TaleTuner:** Improve lecture slide flow and learning progression
- **Aura Sense:** Create more engaging, visually appealing materials

## 🛠️ Troubleshooting

### Common Issues

**"File not found" error:**
- Ensure the file path is correct and absolute
- Check file exists and isn't open in PowerPoint

**Legacy .ppt files not working:**
- Windows: Ensure PowerPoint is installed
- Other platforms: Convert to .pptx first or use PDF export

**COM automation errors (Windows):**
```bash
pip install --upgrade pywin32
python -m pywin32_postinstall -install
```

See [TROUBLESHOOTING.md](TROUBLESHOOTING.md) for detailed solutions.

## 📝 Development

### File Format Support
Both skills handle multiple formats via `.claude-plugin/utils/ppt_converter.py`:
- Modern PPTX (ZIP-based Office Open XML)
- Legacy PPT (OLE/Compound Document)
- PDF exports (visual analysis)

See [FILE_FORMAT_GUIDE.md](.claude-plugin/utils/FILE_FORMAT_GUIDE.md) for implementation details.

## 🤝 Contributing

Contributions welcome! Please:
1. Fork the repository
2. Create a feature branch
3. Submit a pull request

## 📄 License

MIT License - See [LICENSE](LICENSE) file

## 👤 Author

**RollyOS**
- GitHub: [@rollyos](https://github.com/rollyos)

## 🔗 Links

- **Repository:** https://github.com/rollyos/story-alchemist-plugin
- **Issues:** https://github.com/rollyos/story-alchemist-plugin/issues
- **Marketplace:** [Coming soon]

## ✨ Version

**v1.0.0** - Initial release with two powerful analysis skills:
- 📖 TaleTuner for story structure
- 🎨 Aura Sense for aesthetic design

---

**Transform your presentations from "meh" to memorable with Story Alchemist's dual-skill analysis! 🎭✨**
