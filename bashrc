#!/bin/bash

set -o noclobber
set -o ignoreeof
set -o notify
umask 022

unset LANG

if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi

# set a fancy prompt
# If not running interactively, don't do anything
[ -z "$PS1" ] && return
C_REVERSE="\[\e[1;7m\]"
C_NC="\[\e[0m\]" # No Color
C_BLACK="\[\e[0;30m\]"
C_GRAY="\[\e[1;30m\]"
C_RED="\[\e[0;31m\]"
C_L_RED="\[\e[1;31m\]"
C_GREEN="\[\e[0;32m\]"
C_L_GREEN="\[\e[1;32m\]"
C_BROWN="\[\e[0;33m\]"
C_YELLOW="\[\e[1;33m\]"
C_BLUE="\[\e[0;34m\]"
C_L_BLUE="\[\e[1;34m\]"
C_PURPLE="\[\e[4;35m\]"
C_L_PURPLE="\[\e[1;35m\]"
C_CYAN="\[\e[0;36m\]"
C_L_CYAN="\[\e[1;36m\]"
C_L_GRAY="\[\e[0;37m\]"
C_WHITE="\[\e[1;37m\]"
s_triangle=$'\uE0B0'

gitps1='$(__git_ps1 "⚓%s")'
PS1="\[\e[0;30;104m\]PATH$C_NC $C_PURPLE\w$C_NC\n$C_L_GREEN\u$C_NC☯$C_L_RED\h$C_YELLOW$gitps1$C_L_CYAN$ $C_NC"

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

export LANG=C
#export LANGUAGE=zh_TW.UTF-8
#export LANG=zh_TW.UTF-8
export LC_ALL=en_US.UTF-8
#export LC_CTYPE=zh_TW.UTF-8
#export LC_MESSAGES=zh_TW.UTF-8

#export X11=/usr/share/X11
#export PATH=/bin:/usr/bin:$X11/bin
#export MANPATH=/usr/share/man:$X11/man

#export PATH=/home/bshen/:/home/bshen/bin/elf_toolchain:/home/bshen/bin/linux_toolchain:/home/bshen/bin/qemu_bin:"$PATH"

##risc-v tool-chain path
#export RISCV=/home/bshen/RISC-V/toolchain
#export PATH=$RISCV/bin:"$PATH"

#export SYSTEMC=/home/binno/bin/systemc_2_2_0/lib-linux

##ld prepare path
#export LD_LIBRARY_PATH=/home/bshen/bin/gtest_lib:/home/bshen/boost/build/lib:$LD_LIBRARY_PATH
#
##boost build path
#export BOOST_BUILD_PATH=/home/bshen/boost/boost-build
#
##RVDS license file location
#export ARMLMD_LICENSE_FILE=/usr/local/flexlm/licenses/license.dat

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

#export LM_LICENSE_FILE=1717@lscic3
#export MODELSIM_HOME=/usr/cad/mentor/modelsim/cur

bind '"\ep":history-search-backward'
bind '"\en":history-search-forward'

export PATH=/home/bshen/.vim/bundle/gj/bin:"$PATH"

# For colourful man pages (CLUG-Wiki style)
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

source ~/.git-prompt.sh
