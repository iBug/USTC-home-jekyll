#!/bin/bash

# USTC-home-jekyll deploy script

# Copyright (c) 2019 iBug (ibugone.com)
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

error() {
  echo "$@" >&2
}

check_env() {
  MISSING=()
  while [ $# -ne 0 ]; do
    if [ -z "${!1}" ]; then
      MISSING=("${MISSING[@]}" "$1")
    fi
    shift
  done
  if [ ${#MISSING} -ne 0 ]; then
    error -e "The following environment variables are missing:\n${MISSING[@]}"
    exit 1
  fi
}

parse_env() {
  USERNAME="${EMAIL%@*}"
  MAILHOST="${EMAIL##*@}"

  case "$MAILHOST" in
    mail.ustc.edu.cn)
      FTPHOST=home.ustc.edu.cn;;
    ustc.edu.cn)
      FTPHOST=staff.ustc.edu.cn;;
    *)
      error "Unknown email host: $MAILHOST"
      error -e "Only \e[1m@mail.ustc.edu.cn\e[0m and \e[1m@ustc.edu.cn\e[0m are recognized."
      exit 1;;
  esac
}

deploy() {
  lftp -c "
  set dns:order \"inet inet6\"
  set ftp:list-options -a
  open $1
  user $2 $3
  mirror --reverse --delete --verbose \"$4\" \"$5\"
  bye
  "
}

check_env EMAIL PASSWORD
parse_env
deploy "$FTPHOST" "$USERNAME" "$PASSWORD" "_site" "/public_html"
