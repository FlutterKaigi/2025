#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
# shellcheck source=lib/common.sh
source "${SCRIPT_DIR}/lib/common.sh"

START_TIME=$(date +%s)
bootstrap_result=0
step=0

print_step() {
  echo -e "${BLUE}Step $((++step)): $1${NC}"
}

trap 'echo -e "${RED}[✖] Aborted at step ${step}${NC}"; exit 1' ERR INT

# Move to project root
cd "${SCRIPT_DIR}/../" || { echo -e "${RED}[✖] Failed to cd to project root${NC}"; exit 1; }
echo -e "${BLUE}[INFO] Working directory: $(pwd)${NC}"

##############################################################################
##
##  Run bootstrap steps
##
##############################################################################

echo ""
print_step "mise install"
"${SCRIPT_DIR}/bootstrap/mise.sh" || bootstrap_result=1

echo ""
print_step "bun install"
"${SCRIPT_DIR}/bootstrap/bun.sh" || bootstrap_result=1

echo ""
print_step "melos bootstrap"
"${SCRIPT_DIR}/bootstrap/melos.sh" || bootstrap_result=1

##############################################################################
##
##  Finish
##
##############################################################################
echo ""
ELAPSED=$(( $(date +%s) - START_TIME ))
echo -e "${BLUE}[INFO] Total elapsed time: ${ELAPSED}s${NC}"
echo -e "${BLUE}[END] Bootstrap finished${NC}"
exit "$bootstrap_result"
