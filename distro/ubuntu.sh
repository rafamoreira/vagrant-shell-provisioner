#!/usr/bin/env bash



# Copyright (c) 2011 Stan Angeloff
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


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
