# aliases
if [[ `uname` == 'Darwin' ]]; then
	alias ls='ls -G'
	alias l='ls -lGh'

	alias grep='grep --colour=auto'
else
	alias ls='ls --colo=auto'
	alias l='ls --color=auto -lh'

	alias grep='grep --color=auto'
fi

alias add='git add'
alias commit='git commit'
alias brach='git branch'
alias status='git status'
alias push='git push'
alias diff='git diff'

alias curl='curl -LO'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias shutdown='sudo shutdown'

alias clang-format='clang-format -style=~/.clang-format'
alias javafmt='java -jar ~/bin/javafmt.jar'

alias python='python3'
alias pip='pip3'

# go
export GOROOT=/usr/local/go
export GOPATH=$HOME/lib/go
export GOCACHE=off

export PATH=$PATH:$GOPATH/bin

# user paths
export PATH=$PATH:~/bin

# java
export CLASSPATH=$HOME/lib/java/
