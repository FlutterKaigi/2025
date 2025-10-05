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
##  melos
##
##############################################################################
if type melos >/dev/null 2>&1; then
  if melos bootstrap; then
    print_result 0 "melos bootstrap"
  else
    print_result $? "melos bootstrap"
  fi
else
  echo -e "${YELLOW}[!] melos bootstrap: melosが見つからないためスキップします。${NC}"
  echo -e "${YELLOW}[!] インストール方法は https://melos.invertase.dev/getting-started を参照してください。${NC}"
fi

exit "$bootstrap_result"
