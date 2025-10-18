# tokens: this file will be ignored by git
source ~/.config/zsh/tokens.zsh

# PATH
export TERM='xterm-256color'
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export JAVA_HOME=/Library/Java/JavaVirtualMachines/microsoft-17.jdk/Contents/Home

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/liwenwu/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/liwenwu/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/liwenwu/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/liwenwu/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# >>> virtualenv >>>
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3.10  # python3.10
source /usr/local/bin/virtualenvwrapper.sh
# <<< virtualenv <<< 

# >>> mysql setup >>> 
PATH=$PATH:/usr/local/mysql/bin
# <<< mysql setup <<<

# homebrew
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles

# GO
export GOPATH="$HOME/go/"
export PATH=$PATH:$GOPATH/bin

# docker
export PATH=$PATH:/Applications/Docker.app/Contents/Resources/bin

# trash-cli
export PATH=$PATH:/usr/local/opt/trash-cli/bin

# yazi
export YAZI_CONFIG_HOME="$HOME/.config/yazi"
