PROMPT_COMMAND=build_prompt

git_branch() 
{
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

highlightExitCode()
{
  if [ "$1" -ne 0 ]; then
    echo -en '\xf0\x9f\x98\xb1 '
  else
    echo -en '\xf0\x9f\x98\x80 '
  fi
}

build_prompt () {
  last_exit=$?
  PS1='\[\e[1;35m\][\@]\[\e[1;32m\][\u] \[\e[1;31m\][\W]'
  PS1+='\[\e[1;36m\]'$(git_branch)
  PS1+=" $(highlightExitCode "$last_exit")"
  PS1+='\[\033[00m\]\$: '
}
