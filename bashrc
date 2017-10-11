#my prompt
#=========
#You can set PS1_NAME_COL and PS1_LOC_COL to something like "01;31m" and "01;34m"

if [ -z "$PS1_NAME_COL" ]; then
  PS1_NAME_COL='01;32m'
fi

if [ -z "$PS1_LOC_COL" ]; then
  PS1_LOC_COL='01;34m'
fi

function statstring {
RC=$?
  if [ "0" != $RC ]; then
    printf "[$RC] "
  fi
}

function parse_git_branch {
  OUTPUT=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')
  if [ "$OUTPUT" ]; then
    printf " $OUTPUT"
  fi
}

function kube_cluster {
  OUTPUT=$(env | grep KUBECONFIG | tr '/' '\n' | grep va- | grep -v yml)
  if [ "$OUTPUT" ]; then
    printf " <$OUTPUT>"
  fi
}

if [ "$USER" = root ]; then
   PS1='\[\033[01;31m\]$(statstring)\[\033[00m\]${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\] \[\033[${PS1_LOC_COL}\]\w\[\033[00m\]\[\033[0m\]\[\033[0;35m\]$(kube_cluster)\[\033[0m\]\[\033[0;37m\]$(parse_git_branch)\[\033[0m\] \$ '
 else
   PS1='\[\033[01;31m\]$(statstring)\[\033[00m\]${debian_chroot:+($debian_chroot)}\[\033[${PS1_NAME_COL}\]\u@\h\[\033[00m\] \[\033[${PS1_LOC_COL}\]\w\[\033[00m\]\[\033[0m\]\[\033[0;35m\]$(kube_cluster)\[\033[0m\]\[\033[0;37m\]$(parse_git_branch) \$ '
fi

#git bits
#========

alias gitlog='git log --graph --pretty'

#other
#=====

#not forget what this stupid program is called
alias disk-usage-analyzer='baobab'

#quickly restart xbmc from my phone
if [ `hostname` == "tellybox" ]; then
  alias rx="sudo service lightdm restart"
fi

alias fucking='sudo'
alias please='sudo'
alias ffs='sudo !!'

alias k='kubectl'
alias kp='kubectl get pods -o wide'
alias kk='kubectl exec -ti kafkabroker-1 bash vakcoc'

#color that works on mac
export CLICOLOR=1
