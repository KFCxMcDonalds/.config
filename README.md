# I USE
- zsh (with [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) & spaceship)
- tmux (with oh-my-tmux)
- nvim (with lazyVim)
- ranger


# Brief Introduction

## zsh
<font color='orange'>zsh</font> is a command-line interpreter shell for Unix-based systems such as Linux and macOS, it's an alternative to default shell-Bash, provide powerful plugins. 

<font color="orange">oh-my-zsh</font> is an out-of-the-box configuration of zsh, including some plugins and shortcuts, details can be check on bellow link:

[oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) 

<font color="orange">spaceship-prompt</font> is a customizable Zsh prompt, with this I can see useful infos when working with terminal.

[spaceship-prompt](https://github.com/spaceship-prompt/spaceship-prompt)

## tmux

<font color='78D64B'>tmux</font> is a terminal multiplexer that enables multiple terminals on a single screen. It's great power lies on it's vim-like style, it's powerful shortcuts allow users work on multiple terminals without moving their fingers away from keyboard.

<font color='78D64B'>oh-my-tmux</font> is a pretty&versatile tmux configuration.

[oh-my-tmux](https://github.com/gpakosz/.tmux)

## nvim

<font color="#02B1D2">nvim(neovim)</font> is a vim-fork editor. 

<font color="#02B1D2">lazyVim</font> is a configuration of nvim with lazy.nvim as the package manager.

[lazyvim](https://github.com/LazyVim/LazyVim)


## ranger

not much to say about ranger, cuz I just use the defaults.

/divider
### other infos

this repository is located at `$HOME`

bellow is my `.zshrc` file at `$HOME`, it is a sibling dir of .config, so I put it in README.
``` shell
# $HOME/.zshrc

# Path to oh-my-zsh installation.
export ZSH="/Users/liwenwu/.oh-my-zsh"

# ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
ZSH_THEME="spaceship"
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="---"

# plugins
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    autojump
)

source $ZSH/oh-my-zsh.sh
source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# User configuration
DEFAULT_USER=$USER

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

# proxy
export no_proxy=localhost,127.0.0.1,localaddress,.localdomain
export http_proxy=http://127.0.0.1:7890
export https_proxy=$http_proxy
export all_proxy=socks5://127.0.0.1:7890

source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/env.zsh
source ~/.config/zsh/spaceship.zsh
```

