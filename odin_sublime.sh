# Install Sublime Text if not installed
sudo apt update && sudo apt install -y wget gnupg software-properties-common apt-transport-https && \
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo gpg --dearmor -o /usr/share/keyrings/sublimehq-archive.gpg && \
echo "deb [signed-by=/usr/share/keyrings/sublimehq-archive.gpg] https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list && \
sudo apt update && sudo apt install -y sublime-text && \

# Create Odin build system in Sublime's User packages
mkdir -p ~/.config/sublime-text/Packages/User && \
cat > ~/.config/sublime-text/Packages/User/odin.sublime-build <<'EOF'
{
    "shell_cmd": "odin build \"$file_path\"",
    "working_dir": "$file_path",
    "selector": "source.odin",
    "variants":
    [
        {
            "name": "Run",
            "shell_cmd": "odin run \"$file_path\""
        }
    ]
}
EOF

# Add basic Odin syntax highlighting (plain text fallback)
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

# Make Sublime use Odin build as default for .odin files
cat > ~/.config/sublime-text/Packages/User/Odin.sublime-settings <<'EOF'
{
    "build_system": "Packages/User/odin.sublime-build"
}
EOF

# Create a .desktop launcher if it doesn't exist
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
