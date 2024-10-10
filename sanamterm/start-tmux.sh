#!/bin/sh

export HOME=/Users/mac
export SHELL=`which zsh`

TMUX=`which tmux 2>&1`
if [ -x "$TMUX" ]; then
    tmux -S /tmp/mac detach -a -s mac
if [ -f "$HOME/.tmuxp/mac.yaml" ]; then
    tmuxp load ~/.tmuxp/mac.yaml
else
    tmux -2 -S /tmp/mac -f $HOME/.tmux.conf new -A -s mac
fi
else
EXIST=`screen -list | grep mac | awk '{print $2}'`
if [ "$EXIST" = "(Attached)" ]; then
    screen -x mac
else
    screen -e "^Oo" -h 20000 -R mac -c $HOME/.screenrc
fi
fi

export HOME=/root
