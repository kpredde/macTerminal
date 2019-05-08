export PS1='[\@][\u] [\W]$(git_branch) $(highlightExitCode)\$ '

git_branch() 
{
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

highlightExitCode()
{
  exit_code=$?
  if [ $exit_code -ne 0 ]
    then
      echo -en '\xf0\x9f\x98\xb1 '
  else
    echo -en '\xf0\x9f\x98\x80 '
  fi
}


# or

# highlightExitCode ()  { 
#   if [ $? -ne 0 ]; then
#     echo -n '😱 ';
#   else
#     echo -n '😀 ';
#   fi 
# }
