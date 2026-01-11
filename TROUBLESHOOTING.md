# Troubleshooting Guide

## Plugin Not Recognized

### Checklist:
- [ ] Plugin structure is correct (`.claude-plugin/plugin.json` exists)
- [ ] `plugin.json` is valid JSON (no syntax errors)
- [ ] Command instructions file exists at the path specified in `plugin.json`
- [ ] You've reloaded/restarted Claude Code after creating the plugin
- [ ] You're in the correct directory when running Claude Code

### Verify Plugin Structure:
```bash
# Check if all files exist
ls -la .claude-plugin/
ls -la .claude-plugin/commands/

# Validate JSON syntax
python -m json.tool .claude-plugin/plugin.json
```

### Common Issues:

#### 1. Command not appearing in autocomplete
**Solution:** Reload the window (VSCode) or restart the CLI

#### 2. "Command not found" error
**Possible causes:**
- Plugin not in the correct directory
- JSON syntax error in plugin.json
- Instructions file path is incorrect

**Check:**
```bash
cat .claude-plugin/plugin.json
cat .claude-plugin/commands/TaleTuner.md
```

#### 3. Plugin loads but command doesn't work
**Solution:** Check the instructions file format. It should be a markdown file with clear instructions.

## How to Test

1. Type `/` in Claude Code chat
2. Look for `taletuner` in the autocomplete list
3. Try the command: `/taletuner test.pptx`

## Getting Help

If the plugin still doesn't work:
1. Check Claude Code documentation
2. Verify you're using the latest version of Claude Code
3. Check console/logs for error messages

## Debug Mode

To see detailed plugin loading information:
1. In VSCode: Help → Toggle Developer Tools → Console tab
2. Look for plugin-related messages
