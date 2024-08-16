# tokens: this file will be ignored by git
source ~/.config/zsh/tokens.zsh

# PATH
export TERM='xterm-256color'

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

# >>> spaceship setup >>> 
export SPACESHIP_CONFIG="$HOME/.config/zsh/spaceship.zsh"
# <<< spaceship setup <<<


