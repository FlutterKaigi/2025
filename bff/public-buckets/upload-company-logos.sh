#!/bin/bash

# =============================================================================
# FlutterKaigi 2025 企業ロゴ一括アップロードスクリプト
# =============================================================================
# 
# 概要: companiesディレクトリ内の企業ロゴ画像を
#       Cloudflare R2 バケットに一括アップロード
# 
# 使用方法: 
# - プロジェクトルートから: ./bff/public-buckets/upload-company-logos.sh
# - スクリプトディレクトリから: ./upload-company-logos.sh
# 
# 前提条件:
# - rclone がインストール済み（miseで管理）
# - Cloudflare R2 の認証が設定済み
# - companies/ ディレクトリが存在
# =============================================================================

# スクリプトの場所を取得（プロジェクトルートからの相対パス対応）
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

# 設定
BUCKET_NAME="2025-public-staging"
SOURCE_DIR="$PROJECT_ROOT/bff/public-buckets/companies"
LOG_FILE="upload-company-logos-$(date +%Y%m%d-%H%M%S).log"
LOG_DIR="$PROJECT_ROOT/bff/public-buckets/logs"
RCLONE_REMOTE="r2"  # rclone設定のリモート名

# 色付き出力用の関数
print_info() {
    echo -e "\033[1;34mℹ️  $1\033[0m"
}

print_success() {
    echo -e "\033[1;32m✅ $1\033[0m"
}

print_error() {
    echo -e "\033[1;31m❌ $1\033[0m"
}

print_warning() {
    echo -e "\033[1;33m⚠️  $1\033[0m"
}

print_progress() {
    echo -e "\033[1;36m📊 $1\033[0m"
}

# ログディレクトリの作成
mkdir -p "$LOG_DIR"

# ヘッダー表示
echo "============================================================================="
echo "🚀 FlutterKaigi 2025 ステージング環境 企業ロゴ一括アップロード"
echo "============================================================================="
print_info "プロジェクトルート: $PROJECT_ROOT"
print_info "バケット: $BUCKET_NAME"
print_info "ソースディレクトリ: $SOURCE_DIR"
print_info "rcloneリモート: $RCLONE_REMOTE"
print_info "ログファイル: $LOG_DIR/$LOG_FILE"
print_info "開始時刻: $(date '+%Y-%m-%d %H:%M:%S')"
echo "============================================================================="

# 前提条件チェック
if ! command -v rclone &> /dev/null; then
    print_error "rclone がインストールされていません"
    print_info "mise bs を実行してください"
    exit 1
fi

# rclone設定の確認
if ! rclone listremotes | grep -q "^$RCLONE_REMOTE:"; then
    print_error "rcloneリモート '$RCLONE_REMOTE' が設定されていません"
    print_info "以下のコマンドで設定してください："
    print_info "rclone config"
    print_info "または既存のリモート名を確認してください："
    print_info "rclone listremotes"
    exit 1
fi

if [ ! -d "$SOURCE_DIR" ]; then
    print_error "ソースディレクトリ '$SOURCE_DIR' が存在しません"
    print_info "プロジェクトルート: $PROJECT_ROOT"
    print_info "期待されるパス: $SOURCE_DIR"
    exit 1
fi

# ログファイルの初期化
{
    echo "============================================================================="
    echo "FlutterKaigi 2025 ステージング環境 企業ロゴ一括アップロードログ"
    echo "============================================================================="
    echo "開始時刻: $(date '+%Y-%m-%d %H:%M:%S')"
    echo "プロジェクトルート: $PROJECT_ROOT"
    echo "バケット: $BUCKET_NAME"
    echo "ソースディレクトリ: $SOURCE_DIR"
    echo "rcloneリモート: $RCLONE_REMOTE"
    echo "============================================================================="
} > "$LOG_DIR/$LOG_FILE"

# 画像ファイルの検索とカウント
print_info "画像ファイルを検索中..."
TOTAL_FILES=$(find "$SOURCE_DIR" -name "*.webp" -o -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" | wc -l)

if [ "$TOTAL_FILES" -eq 0 ]; then
    print_warning "アップロード対象の画像ファイルが見つかりません"
    echo "アップロード対象の画像ファイルが見つかりません" >> "$LOG_DIR/$LOG_FILE"
    exit 0
fi

print_success "アップロード対象ファイル数: $TOTAL_FILES"
echo "アップロード対象ファイル数: $TOTAL_FILES" >> "$LOG_DIR/$LOG_FILE"

# アップロード処理
print_info "アップロード開始..."
echo "アップロード開始..." >> "$LOG_DIR/$LOG_FILE"

# 開始時刻を記録
START_TIME=$(date +%s)

# rcloneでディレクトリ全体をアップロード
print_progress "rclone copy でディレクトリ全体をアップロード中..."
print_info "コマンド: rclone copy $SOURCE_DIR $RCLONE_REMOTE:$BUCKET_NAME/companies/"

{
    echo "============================================================================="
    echo "アップロード処理開始"
    echo "時刻: $(date '+%Y-%m-%d %H:%M:%S')"
    echo "コマンド: rclone copy $SOURCE_DIR $RCLONE_REMOTE:$BUCKET_NAME/companies/"
    echo "============================================================================="
} >> "$LOG_DIR/$LOG_FILE"

# rclone copyでディレクトリ全体をアップロード
if rclone copy "$SOURCE_DIR" "$RCLONE_REMOTE:$BUCKET_NAME/companies/" \
    --progress \
    --stats 1s \
    --log-level INFO \
    --header "Cache-Control: public, max-age=86400" >> "$LOG_DIR/$LOG_FILE" 2>&1; then
    
    print_success "アップロード成功！"
    echo "結果: 成功" >> "$LOG_DIR/$LOG_FILE"
    
    # 完了処理
    END_TIME=$(date +%s)
    TOTAL_TIME=$((END_TIME - START_TIME))
    TOTAL_TIME_MIN=$((TOTAL_TIME / 60))
    TOTAL_TIME_SEC=$((TOTAL_TIME % 60))
    
    echo "============================================================================="
    print_success "企業ロゴ一括アップロード完了！"
    echo "============================================================================="
    print_info "📊 合計: $TOTAL_FILES"
    print_info "⏱️ 所要時間: ${TOTAL_TIME_MIN}分${TOTAL_TIME_SEC}秒"
    print_info "📝 詳細ログ: $LOG_DIR/$LOG_FILE"
    
    # 結果サマリーをログファイルに記録
    {
        echo "============================================================================="
        echo "アップロード完了サマリー"
        echo "============================================================================="
        echo "完了時刻: $(date '+%Y-%m-%d %H:%M:%S')"
        echo "合計: $TOTAL_FILES"
        echo "所要時間: ${TOTAL_TIME_MIN}分${TOTAL_TIME_SEC}秒"
        echo ""
        echo "🎉 全ての企業ロゴが正常にアップロードされました！"
        echo "============================================================================="
    } >> "$LOG_DIR/$LOG_FILE"
    
    exit 0
else
    print_error "アップロード失敗"
    echo "結果: 失敗" >> "$LOG_DIR/$LOG_FILE"
    
    # エラー詳細を取得
    if [ -f "$LOG_DIR/$LOG_FILE" ]; then
        echo "エラー詳細:" >> "$LOG_DIR/$LOG_FILE"
        tail -n 20 "$LOG_DIR/$LOG_FILE" | grep -E "(error|Error|ERROR|failed|Failed|FAILED)" >> "$LOG_DIR/$LOG_FILE" 2>/dev/null || true
    fi
    
    # 完了処理（エラー時）
    END_TIME=$(date +%s)
    TOTAL_TIME=$((END_TIME - START_TIME))
    TOTAL_TIME_MIN=$((TOTAL_TIME / 60))
    TOTAL_TIME_SEC=$((TOTAL_TIME % 60))
    
    echo "============================================================================="
    print_error "企業ロゴ一括アップロード失敗"
    echo "============================================================================="
    print_info "📊 合計: $TOTAL_FILES"
    print_info "⏱️ 所要時間: ${TOTAL_TIME_MIN}分${TOTAL_TIME_SEC}秒"
    print_info "📝 詳細ログ: $LOG_DIR/$LOG_FILE"
    print_warning "ログファイルを確認してエラーの詳細を確認してください"
    
    # 結果サマリーをログファイルに記録
    {
        echo "============================================================================="
        echo "アップロード失敗サマリー"
        echo "============================================================================="
        echo "完了時刻: $(date '+%Y-%m-%d %H:%M:%S')"
        echo "合計: $TOTAL_FILES"
        echo "所要時間: ${TOTAL_TIME_MIN}分${TOTAL_TIME_SEC}秒"
        echo ""
        echo "⚠️  アップロードに失敗しました"
        echo "詳細はログファイルを確認してください"
        echo "============================================================================="
    } >> "$LOG_DIR/$LOG_FILE"
    
    exit 1
fi
