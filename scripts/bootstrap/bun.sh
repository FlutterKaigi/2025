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
##  bun
##
##############################################################################
if type bun >/dev/null 2>&1; then
  if bun install; then
    print_result 0 "bun install"
  else
    print_result $? "bun install"
  fi
else
  echo -e "${YELLOW}[!] bun install: Skip because it could not be found.${NC}"
  echo -e "${YELLOW}[!] This may be due to mise installation not completed.${NC}"
fi

exit "$bootstrap_result"
