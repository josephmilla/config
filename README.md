# vimrc
Minimalist VIM Configuration

Copying over the Solarized theme:
```
mkdir -p ~/.vim/colors
cp ~/.vim/bundle/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/
```

## Syntax Highlighting
```
git clone https://github.com/hashivim/vim-terraform.git ~/.vim/pack/plugins/start/vim-terraform
```

## ZSH Plugins
https://github.com/zsh-users
```
brew install zsh-autosuggestions
# source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

brew install zsh-syntax-highlighting
# source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

brew install zsh-completions
```

## OpenSSL + OpenSSH
```
export PATH="/opt/homebrew/opt/openssl/bin:$PATH"
export PATH="/opt/homebrew/opt/openssh/bin:$PATH"
```

## Editor
```
export EDITOR="/opt/homebrew/bin/vim"
```

## Others
- Base16 Flat Color Scheme Configuration:
  - https://github.com/chriskempson/base16-shell
  - https://github.com/chriskempson/base16-vim
  - https://github.com/martinlindhe/base16-iterm2
  
