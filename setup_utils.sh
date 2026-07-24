#!/usr/bin/env bash

DIR="$(cd "$(dirname "$0")"; pwd -P)"

# Ensure that file $1 contains line $2
# Creates file/appends line as necessary
function ensure_line {
  grep -qxFs "$2" "$1" || echo "$2" >> "$1"
}

# Ensure that profile $1 is sourced
# Assumes non-existence of ~/.bash_profile and ~/.bash_login
function ensure_profile {
  ensure_line ~/.profile "source $DIR/$1"
}

# Download file from url $2 to location $1
# Assumes file correct if it already exists
function download_file {
  if [ -f "$1" ]; then
    echo "$1 already exists"
  else
    curl -fLo "$1" --create-dirs "$2"
    echo "$1 downloaded"
  fi
}
