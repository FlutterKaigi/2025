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

trap 'echo -e "${RED}[✖] 中断されました${NC}"; exit 1' ERR INT

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
  echo -e "${YELLOW}[!] bun install: bunが見つからないためスキップします。${NC}"
  echo -e "${YELLOW}[!] mise のインストールが完了していない可能性があります。${NC}"
fi

exit "$bootstrap_result"
