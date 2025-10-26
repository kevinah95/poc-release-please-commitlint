#!/bin/bash
#
# Setup script for Git hooks
# This script configures Git to use the custom hooks directory
#

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOOKS_DIR="$SCRIPT_DIR/.githooks"

echo "Setting up Git hooks..."

# Check if .githooks directory exists
if [ ! -d "$HOOKS_DIR" ]; then
    echo "Error: .githooks directory not found at $HOOKS_DIR"
    exit 1
fi

# Make hooks executable
chmod +x "$HOOKS_DIR"/*

# Configure Git to use the custom hooks directory
git config core.hooksPath "$HOOKS_DIR"

echo "✓ Git hooks configured successfully!"
echo "✓ Hooks directory: $HOOKS_DIR"
echo ""
echo "The following hooks are now active:"
for hook in "$HOOKS_DIR"/*; do
    if [ -f "$hook" ] && [ -x "$hook" ]; then
        echo "  - $(basename "$hook")"
    fi
done
echo ""
echo "To disable these hooks, run:"
echo "  git config --unset core.hooksPath"
