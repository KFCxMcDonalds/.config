# configurations
alias zshconfig="vim ~/.zshrc"
alias aliasconfig="vim ~/.config/zsh/aliases.zsh"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias spaceshipconfig="vim ~/.config/zsh/spaceship.zsh"

# python
# alias python="/usr/bin/python3"  # default python
# alias python3="/usr/local/bin/python3.10"  # python2.10

# commonds
alias ls='lsd'
alias t='tmux'
alias l='lsd -a'
alias c='clear'
alias ss='source ~/.zshrc'
# c++
alias g++='g++ -std=c++11'
alias clang++='clang++ -std=c++11'

# nvim
alias vim="nvim"

# proxy
alias proxy_on="export no_proxy=localhost,127.0.0.1,localaddress,.localdomain.com;export http_proxy=http://127.0.0.1:7890;export https_proxy=$http_proxy;export all_proxy=socks5://127.0.0.1:7890;"
alias proxy_off="unset http_proxy https_proxy all_proxy"

# git
alias lg='lazygit'


# yabai & sketchybar
alias yr='yabai --restart-service'

