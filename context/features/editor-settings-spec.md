# Editor Preferences Settings

## Overview

Add editor preferences section to settings page with auto-save to database.

## Requirements

- Font size dropdown
- Tab size dropdown
- Word wrap toggle (default: on)
- Minimap toggle (default: off)
- Theme dropdown: vs-dark, monokai, github-dark (default: vs-dark)
- Store in JSON column `editorPreferences` on User model
- Create and run a migration for the database (Never db push)
- Create server action to update preferences
- Apply settings to Monaco editor component
- Auto-save on change (no save button)
- Show success toast on save
- Create EditorPreferencesContext for client components

