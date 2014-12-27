export EDITOR=vim
export LESS="-iMSx4 -FX -R"
export PATH=~/.local/bin:$PATH
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
export VAGRANT_DEFAULT_PROVIDER=lxc


# deb packaging
DEBUILD_DPKG_BUILDPACKAGE_OPTS="-us -uc -I -i"
DEBUILD_LINTIAN_OPTS="-i -I --show-overrides"

alias dquilt="quilt --quiltrc=${HOME}/.quiltrc-dpkg"
complete -F _quilt_completion $_quilt_complete_opt dquilt

# aliaseso
alias grep-corosync='egrep --color=always -e "(crmd|corosync|pacemaker)"'
