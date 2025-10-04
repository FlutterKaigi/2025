#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
# shellcheck source=../lib/common.sh
source "${SCRIPT_DIR}/../lib/common.sh"

bootstrap_result=0

print_result() {
  local code=$1; shift
  if [ "$code" -eq 0 ]; then
    echo -e "${GREEN}[✔] $*${NC}"
  else
    echo -e "${RED}[✖] $* (exit ${code})${NC}"
    bootstrap_result=1
  fi
}

trap 'echo -e "${RED}[✖] Aborted${NC}"; exit 1' ERR INT

##############################################################################
##
##  mise
##
##############################################################################
if type mise >/dev/null 2>&1; then
  if mise install; then
    print_result 0 "mise install"
  else
    print_result $? "mise install"
  fi
else
  echo -e "${YELLOW}[!] mise install: Skip because it could not be found.${NC}"
  echo -e "${YELLOW}[!] See https://mise.jdx.dev/getting-started.html for installation.${NC}"
fi

exit "$bootstrap_result"
