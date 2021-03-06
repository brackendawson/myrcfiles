if [ -z ${ZSH_THEME_NAME_COLOR+x} ]; then
  ZSH_THEME_NAME_COLOR=002
fi
if [ -z ${ZSH_THEME_LOC_COLOR+x} ]; then
  ZSH_THEME_LOC_COLOR=039
fi

PROMPT='%(!.%{%B$FG[001]%}.%{%B$FG[$ZSH_THEME_NAME_COLOR]%})%n@%m %{$FG[$ZSH_THEME_LOC_COLOR]%}%(!.%1~.%~)%{$FG[008]%}$(git_prompt_info)$(git_remote_status)$(parse_kube_cluster)$(parse_ibm_account)%{$reset_color%}
%# '
RPROMPT='%{%B%}%(?..%{$FG[001]%}%? )%*%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=' ('
ZSH_THEME_GIT_PROMPT_SUFFIX=')'
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[136]%}*%{$FG[008]%}"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%{$FG[002]%}+%{$FG[008]%}"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%{$FG[001]%}-%{$FG[008]%}"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="%{$FG[202]%}±%{$FG[008]%}"

if [ -z ${ZSH_THEME_KUBE_PROMPT_COLOR+x} ]; then
  ZSH_THEME_KUBE_PROMPT_COLOR=202
fi
if [ -z ${ZSH_THEME_KUBE_PROMPT_BRANCH+x} ]; then
  ZSH_THEME_KUBE_PROMPT_BRANCH=015
fi
function parse_kube_cluster {
  OUTPUT=$(kubectl config current-context 2>/dev/null | cut -d '/' -f 1)
  if [ "$OUTPUT" ]; then
    echo -n " %{$FG[$ZSH_THEME_KUBE_PROMPT_COLOR]%}<$OUTPUT${ns:+%{$FG[$ZSH_THEME_KUBE_PROMPT_BRANCH]%\}:$ns%{$FG[$ZSH_THEME_KUBE_PROMPT_COLOR]%\}}>"
  fi
}

if [ -z ${ZSH_THEME_IBM_PROMPT_COLOR+x} ]; then
  ZSH_THEME_IBM_PROMPT_COLOR=004
fi
function parse_ibm_account {
  OUTPUT=$(jq -r '"\(.Account.Name)"' ~/.bluemix/config.json 2>/dev/null)
  if [ "$(sed -e 's/.*:\(.*\)/\1/' <<< "$OUTPUT")" ]; then
    echo -n " %{$FG[$ZSH_THEME_IBM_PROMPT_COLOR]%}{$OUTPUT}"
  fi
}
