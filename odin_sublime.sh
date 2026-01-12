#!/bin/bash
set -e

# Update and install prerequisites
sudo apt update && sudo apt install -y wget gnupg software-properties-common apt-transport-https

# Add Sublime Text GPG key and repo
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo gpg --dearmor -o /usr/share/keyrings/sublimehq-archive.gpg
echo "deb [signed-by=/usr/share/keyrings/sublimehq-archive.gpg] https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# Install Sublime Text
sudo apt update && sudo apt install -y sublime-text

# Create User package folder if missing
mkdir -p ~/.config/sublime-text/Packages/User

# Write Odin build system config — Ctrl-B compiles and runs current Odin file with output shown in build panel
cat > ~/.config/sublime-text/Packages/User/odin.sublime-build <<'EOF'
{
    "shell_cmd": "odin run \"$file\" -file",
    "working_dir": "$file_path",
    "selector": "source.odin",
    "quiet": false,
    "variants": [
        {
            "name": "Build Only",
            "shell_cmd": "odin build \"$file\" -file",
            "working_dir": "$file_path"
        }
    ]
}
EOF

# Minimal Odin syntax highlighting for Sublime Text
cat > ~/.config/sublime-text/Packages/User/Odin.sublime-syntax <<'EOF'
%YAML 1.2
---
name: Odin
file_extensions: [odin]
scope: source.odin
contexts:
  main:
    - match: '\b(import|package|struct|proc|return|if|else|for|in|when|switch|case|break|continue)\b'
      scope: keyword.control.odin
    - match: '\b(true|false|nil)\b'
      scope: constant.language.odin
    - match: '"'
      push: double_quoted_string
  double_quoted_string:
    - meta_scope: string.quoted.double.odin
    - match: '"'
      pop: true
    - match: '\\.'
      scope: constant.character.escape.odin
EOF

# Set Odin build system as default for .odin files
cat > ~/.config/sublime-text/Packages/User/Odin.sublime-settings <<'EOF'
{
    "build_system": "Packages/User/odin.sublime-build"
}
EOF

# Create .desktop launcher if missing
if [ ! -f ~/.local/share/applications/sublime_text.desktop ]; then
    cat > ~/.local/share/applications/sublime_text.desktop <<'EOF'
[Desktop Entry]
Version=1.0
Type=Application
Name=Sublime Text
GenericName=Text Editor
Comment=Sophisticated text editor for code, markup and prose
Exec=subl %F
Icon=sublime-text
Terminal=false
Categories=Development;TextEditor;
MimeType=text/plain;
StartupNotify=true
EOF
    chmod +x ~/.local/share/applications/sublime_text.desktop
    update-desktop-database ~/.local/share/applications
fi

echo "Setup complete. Use Ctrl-B in Sublime Text to build and run Odin files."
