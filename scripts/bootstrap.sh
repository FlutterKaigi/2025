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

trap 'echo -e "${RED}[✖] ステップ ${step} で中断されました${NC}"; exit 1' ERR INT

# Move to project root
cd "${SCRIPT_DIR}/../" || { echo -e "${RED}[✖] プロジェクトルートへの移動に失敗しました${NC}"; exit 1; }
echo -e "${BLUE}[INFO] 作業ディレクトリ: $(pwd)${NC}"

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
echo -e "${BLUE}[INFO] 合計経過時間: ${ELAPSED}秒${NC}"
echo -e "${BLUE}[END] ブートストラップが完了しました${NC}"

echo ""
echo -e "${GREEN}次のステップ:${NC}"
echo -e "  ${BLUE}アプリケーションを実行する場合（Webビルド）:${NC}"
echo -e "    - Visual Studio Code: \`app-staging-debug\` を実行"
echo -e "    - IntelliJ IDEA/Android Studio: \`Flutter Run -> 'app staging debug'\` を実行"

exit "$bootstrap_result"
