#!/opt/homebrew/bin/fish

if type -q brew
  echo "Homebrew already installed"
else
  echo "Installing Homebrew..."
  /bin/bash -c "\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
end

echo "Installing setup packages..."
brew install stow

echo "Installing general packages..."
brew install \
  diff-so-fancy \
  fzf \
  gnupg \
  jq \
  ncdu \
  ripgrep \
  tree

brew install --cask \
  homebrew/cask-fonts/font-fira-code

echo "Stowing dotfiles..."
stow --no-folding -vt $HOME \
  fish \
  vim \
  git \
  vscode \
  gpg \
  karabiner \
  starship
