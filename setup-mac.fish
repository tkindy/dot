#!/opt/homebrew/bin/fish

set TEMP_DIR "temp"
rm -rf $TEMP_DIR
mkdir $TEMP_DIR

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

# Oh My Fish
if type -q omf
  echo "Oh My Fish is already installed"
else
  echo "Installing Oh My Fish..."
  set installFile "$TEMP_DIR/install-omf"

  curl -fLo $installFile https://get.oh-my.fish
  fish $installFile --noninteractive --yes
end

# Clean up
echo "Deleting temp directory..."
rm -rf $TEMP_DIR
