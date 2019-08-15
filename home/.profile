# aliases
if [[ `uname` == 'Darwin' ]]; then
	alias ls='ls -G'
	alias l='ls -lGh'
	alias la='ls -Ga'

	alias grep='grep --colour=auto'

	alias diff='colordiff'
else
	alias ls='ls --colo=auto'
	alias l='ls --color=auto -lh'
	alias la='ls --colo=auto -a'

	alias grep='grep --color=auto'

	alias diff='diff --color'
fi


alias lynx='lynx -vikeys'

# git

alias add='git add'
alias commit='git commit'
alias brach='git branch'
alias status='git status'
alias push='git push'

# curl download

alias dl='curl -LO'

# easy cd

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias shutdown='sudo shutdown'

alias clang-format='clang-format -style=file -i'
alias javafmt='java -jar ~/bin/javafmt.jar'

alias python='python3'
alias pip='pip3'

alias clear='echo "======"; clear'


# interactive
# let it do dumb stuff (gdb or special syscalls)
# remove when done
# mount the current dir in /home
# pwd to /home
# run the devenv image
alias devenv='docker run -it --privileged --rm -v "$(pwd)"/:/home -w /home dev:latest'

# go

alias gow='GOOS=js GOARCH=wasm go' # wasm
export GOROOT=/usr/local/go
export GOPATH=$HOME/lib/go

export PATH=$GOPATH/bin:$GOROOT/misc/wasm:$PATH

# user paths
export PATH=~/bin:$PATH

# java
export CLASSPATH=$HOME/lib/java/

alias tilde="ssh tilde -t tmux a"
