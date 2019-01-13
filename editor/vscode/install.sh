brew cask install "visual-studio-code"
code --install-extension EditorConfig.EditorConfig
code --install-extension alexdima.copy-relative-path
code --install-extension dbaeumer.vscode-eslint
code --install-extension  robertohuertasm.vscode-icons
code --install-extension  ms-vscode.Go
code --install-extension  octref.vetur
code --install-extension  formulahendry.auto-close-tag
code --install-extension  DavidAnson.vscode-markdownlint
code --install-extension  rebornix.Ruby
ln -s editor/vscode/settings.json '~/Library/Application Support/Code/User/settings.json'
echo "VS Code installed"
