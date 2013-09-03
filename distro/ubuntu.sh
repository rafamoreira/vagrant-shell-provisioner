#!/usr/bin/env bash

set -e

# Log an operation
log-operation() {
  local function_name
  local function_values
  local arg
  function_name="$1"
  shift
for arg in "$@"; do
function_values="$function_values ""'$( echo "$arg" | sed -e 's#\s\+# #g' )'"
  done
  [ -z "$QUIET" ] && echo -e "${DEBUG_BOLD}$function_name${DEBUG_NORMAL}(""$( echo "$function_values" | sed -e 's#^ ##' -e "s#\s\+''\$##g" )"")...${RESET}"
}

apt-mirror-pick() {
  log-operation "$FUNCNAME" "$@"
  sudo sed -i \
    -e "s#\w\+\.archive\.ubuntu\.com#$1.archive.ubuntu.com#g" \
    -e "s#security\.ubuntu\.com#$1.archive.ubuntu.com#g" \
    '/etc/apt/sources.list'
}
