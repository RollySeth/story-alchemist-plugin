#!/bin/bash
# Story Alchemist - Package for Marketplace Submission
# Creates a distribution-ready ZIP file with both TaleTuner and Aura Sense skills

VERSION="1.0.0"
PACKAGE_NAME="story-alchemist-v${VERSION}"
DIST_DIR="dist"

echo "📦 Packaging Story Alchemist v${VERSION}"
echo "   🎭 Including TWO skills: TaleTuner + Aura Sense"
echo ""

# Clean previous builds
rm -rf "$DIST_DIR"
mkdir -p "$DIST_DIR/$PACKAGE_NAME"

echo "✅ Copying plugin files..."
# Copy .claude-plugin directory (CLI plugin)
cp -r .claude-plugin "$DIST_DIR/$PACKAGE_NAME/"

echo "✅ Copying skills..."
# Copy .claude directory (VSCode extension skills)
cp -r .claude "$DIST_DIR/$PACKAGE_NAME/"

echo "✅ Copying documentation..."
# Copy documentation
cp README.md "$DIST_DIR/$PACKAGE_NAME/"
cp MARKETPLACE_README.md "$DIST_DIR/$PACKAGE_NAME/"
cp PACKAGING_GUIDE.md "$DIST_DIR/$PACKAGE_NAME/"
cp MARKETPLACE_SUBMISSION_SUMMARY.md "$DIST_DIR/$PACKAGE_NAME/"
cp TROUBLESHOOTING.md "$DIST_DIR/$PACKAGE_NAME/" 2>/dev/null || echo "Note: TROUBLESHOOTING.md not found, skipping"
cp LICENSE "$DIST_DIR/$PACKAGE_NAME/"

echo "✅ Creating distribution archive..."
# Create ZIP
cd "$DIST_DIR"
zip -r "${PACKAGE_NAME}.zip" "$PACKAGE_NAME"
cd ..

echo ""
echo "🎉 Package created successfully!"
echo ""
echo "📦 Output: ${DIST_DIR}/${PACKAGE_NAME}.zip"
echo ""
echo "📋 Package includes:"
echo "   📖 TaleTuner skill (story structure analysis)"
echo "   🎨 Aura Sense skill (aesthetic & vibe analysis)"
echo "   📁 File format support for .pptx, .ppt, .pdf"
echo "   📝 Complete documentation"
echo "   🛠️ Utility scripts for file handling"
echo ""
echo "🚀 Next steps:"
echo "   1. Test the package: unzip and install to ~/.claude/skills/"
echo "   2. Create GitHub repository"
echo "   3. Tag release v${VERSION}"
echo "   4. Submit to Claude marketplace"
echo ""
echo "✨ Ready to transform presentations!"
