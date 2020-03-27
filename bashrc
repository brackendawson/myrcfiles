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

function parse_kube_cluster {
  OUTPUT=$(kubectl config current-context | cut -d '/' -f 1)
  if [ "$OUTPUT" ]; then
    printf " <$OUTPUT>"
  fi
}

function parse_bluemix_account {
  OUTPUT=$(jq '"\(.Account.Name)"' ~/.bluemix/config.json 2>/dev/null | tr -d '"')
  if [ "$(sed -e 's/.*:\(.*\)/\1/' <<< "$OUTPUT")" ]; then
    printf " {$OUTPUT}"
  fi
}

if [ "$USER" = root ]; then
   PS1='\[\033[01;31m\]$(statstring)\[\033[00m\]${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\] \[\033[${PS1_LOC_COL}\]\w\[\033[00m\]\[\033[0m\]\[\033[0;35m\]$(parse_kube_cluster)\[\033[0m\]\[\033[0;36m\]$(parse_bluemix_account)\[\033[0m\]\[\033[0;37m\]$(parse_git_branch)\[\033[0m\] \$ '
 else
   PS1='\[\033[01;31m\]$(statstring)\[\033[00m\]${debian_chroot:+($debian_chroot)}\[\033[${PS1_NAME_COL}\]\u@\h\[\033[00m\] \[\033[${PS1_LOC_COL}\]\w\[\033[00m\]\[\033[0m\]\[\033[0;35m\]$(parse_kube_cluster)\[\033[0m\]\[\033[0;36m\]$(parse_bluemix_account)\[\033[0m\]\[\033[0;37m\]$(parse_git_branch) \$ '
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
alias wk='watch -n 30 kubectl'
alias kp='kubectl get po -o wide'
alias wkp='watch -n 30 kubectl get po -o wide'
alias ks='kubectl -n kube-system'
alias wks='watch -n 30 kubectl -n kube-system'
alias ksp='kubectl -n kube-system get po -o wide'
alias wksp='watch -n 30 kubectl -n kube-system get po -o wide'
alias kr='kubectl -n registry'
alias wkr='watch -n 30 kubectl -n registry'
alias krp='kubectl -n registry get po -o wide'
alias wkrp='watch -n 30 kubectl -n registry get po -o wide'
alias km='kubectl -n monitoring'
alias wkm='watch -n 30 kubectl -n monitoring'
alias kmp='kubectl -n monitoring get po -o wide'
alias wkmp='watch -n 30 kubectl -n monitoring get po -o wide'
alias kb='kubectl -n ibm-system'
alias wkb='watch -n 30 kubectl -n ibm-system'
alias kbp='kubectl -n ibm-system get po -o wide'
alias wkbp='watch -n 30 kubectl -n ibm-system get po -o wide'
alias ki='kubectl -n istio-system'
alias wki='watch -n 30 kubectl -n istio-system'
alias kip='kubectl -n istio-system get po -o wide'
alias wkip='watch -n 30 kubectl -n istio-system get po -o wide'

alias iks='ibmcloud ks'
alias wiks='watch -n 30 ibmcloud ks'
alias icr='ibmcloud cr'
alias wicr='watch -n 30 ibmcloud cr'

alias code='code -r'

export KUBE_EDITOR='code -w'

#color that works on mac
export CLICOLOR=1
