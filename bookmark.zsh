#!/usr/bin/env zsh

_pr_cwd_bookmark_icon="%{$c[blue]$c_dim%}%{$c_reset%} "

_pr_cwd_is_bookmark_dir(){
  
  rpath=${1:P}
  
  if [[ "$rpath" =~ ^"$HOME"(/|$) ]]; then
    cwd="\$HOME${rpath#$HOME}"
  else
    cwd="$rpath"
  fi
  
  if [[ ! -z "$BOOKMARKS_FILE" ]]; then
    if grep -q -e "^$cwd|" "$BOOKMARKS_FILE"; then
      return 0
    fi
    
  fi
  
  return 1
}

_pr_cwd_get_bookmark(){
  
  rpath=${1:P}
  
  if [[ "$rpath" =~ ^"$HOME"(/|$) ]]; then
    cwd="\$HOME${rpath#$HOME}"
  else
    cwd="$rpath"
  fi
  
  echo -n "%{$c[cyan]$c_bold%}"
  echo -n $(grep "$cwd" "$BOOKMARKS_FILE" | awk -F'|' '{print $2}')
  echo -n "%{$c[reset]%}"
  
}
