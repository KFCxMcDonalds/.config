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
alias h="cd ~"
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
alias ld='lazydocker'


# yabai & sketchybar
alias yr='yabai --restart-service'


# services
alias frpc-boot='sudo launchctl bootstrap system /Library/LaunchDaemons/com.frp.frpc.plist'
alias frpc-bootout='sudo launchctl bootout system /Library/LaunchDaemons/com.frp.frpc.plist'
alias frpc-start='sudo launchctl load /Library/LaunchDaemons/com.frp.frpc.plist'
alias frpc-stop='sudo launchctl unload /Library/LaunchDaemons/com.frp.frpc.plist'
alias frpc-restart='sudo launchctl kickstart -k system/com.frp.frpc.plist'
alias frpc-status='sudo launchctl list | grep frpc'

# go
alias gom="go mod"

# k8s
alias kc='kubectl'

# obsidian
alias note='vim ~/Library/Mobile\ Documents/iCloud\~md\~obsidian/Documents/Notes'
