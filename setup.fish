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
brew install gpg nvim
brew install --cask homebrew/cask-fonts/font-fira-code

echo "Stowing dotfiles..."
stow -vt $HOME \
  fish \
  omf \
  nvim \
  git \
  vscode

# Oh My Fish
if type -q omf
  echo "Oh My Fish is already installed"
else
  echo "Installing Oh My Fish..."
  set installFile "$TEMP_DIR/install-omf"

  curl -fLo $installFile https://get.oh-my.fish
  fish $installFile --noninteractive --yes
end

# vim-plug
if test -e $HOME/.local/share/nvim/site/autoload/plug.vim
  echo "vim-plug already installed"
else
  echo "Installing vim-plug..."
  sh -c 'curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
end

echo "Installing and updating nvim plugins..."
nvim +PlugInstall +PlugUpdate +q +q

# Clean up
echo "Deleting temp directory..."
rm -rf $TEMP_DIR
