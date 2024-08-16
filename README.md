``` shell
# ~/.zshrc

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

