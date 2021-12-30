#!/bin/bash

alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias la='ls -alh --color=auto'
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias vim='vim -X -p'
alias vi='vim -X -p'
alias vimdiff='vimdiff -X'
alias make="nice make"
alias mk='nice make'
alias grep='grep --color -I -n -i'
alias rgrep='grep -R --exclude="tags"'
alias indent='indent -gnu -bli0 -i4 -cli4 -nut -nip -npsl -nhnl'
alias df='df -h'
alias cp='cp -rf'
alias jb='jobs'
alias apt-get='sudo apt-get'
alias cscope='cscope -Rbqk'
alias scp='scp -r'
alias cflow='cflow -T'
alias whereis="type"
alias passwd="yppasswd"
alias rsh="ssh"
alias astyle="astyle -S --style=allman"
alias ipython="ipython --colors=\"Linux\""
#w3m setting
alias w3mgoogle='w3m -num http://www.google.com.tw'
alias cmake='/usr/local/bin/cmake'
alias python='python -t'
alias rp='realpath'

#ruby setting
alias gems='gem search -r'

#tmux setting
alias tmux='tmux -2'
alias tmuxls='tmux ls'
alias tmuxat='tmux attach-session -t'

# find -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.h' -o -name '*.py' -o -name '*.S' -o -name '*.cc'
# -type d -name node_modules -prune
