#!/bin/bash
set -x
CURDIR=$(readlink -f $(dirname $0))

test -e $HOME/.emacs || ln -s $CURDIR/dot_emacs $HOME/.emacs
test -e $HOME/.gitconfig || ln -s $CURDIR/gitconfig $HOME/.gitconfig
test -e $HOME/.hgrc || ln -s $CURDIR/hgrc $HOME/.hgrc
test -e $HOME/.muttrc || ln -s $CURDIR/muttrc $HOME/.muttrc
test -e $HOME/.config/awesome || ln -s $CURDIR/awesome $HOME/.config/awesome
