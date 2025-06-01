#
# ~/.bashrc
#
export GOPATH=$HOME/.go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

export VISUAL="/usr/bin/nvim"
export EDITOR="$VISUAL"
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias vi='nvim'
alias vim='nvim'
alias ani='fastanime anilist'
alias yx='yt-x'
alias ex='exit'
PS1='[\u@\h \W]\$ '
eval "$(starship init bash)"
