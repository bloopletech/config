#!/bin/bash

function brew_use () {
  function dir_nonempty () {
    if (shopt -s nullglob dotglob; f=("$1/*"); ((${#f[@]})))
    then
      return 0
    else 
      return 1
    fi
  }
  
  function prefix_if_missing () {
    prefix="$1"
    variable="$2"
    if [[ "${!variable}" != *"$prefix"* ]]; then
      export $variable="$prefix${!variable}"
    fi
  }

  declare package_prefix
  package_prefix=$(brew --prefix --installed 2>/dev/null "$1")
  if [ $? -ne 0 ]; then
    echo "$1 isn't installed."
    return
  fi

  bindir="$package_prefix/bin"
  if dir_nonempty "$bindir"; then
    prefix_if_missing "$bindir:" PATH
  fi

  libdir="$package_prefix/lib"
  if dir_nonempty "$libdir"; then
    prefix_if_missing "-L$libdir " LDFLAGS
  fi

  includedir="$package_prefix/include"
  if dir_nonempty "$includedir"; then
    prefix_if_missing "-I$includedir " CPPFLAGS
  fi
}

brew() {
  if [[ $# -eq 2 && "$1" == "use" ]]; then
    brew_use "$2"
  else
    command brew "$@"
  fi
}