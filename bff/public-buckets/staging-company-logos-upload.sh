#!/bin/bash

# =============================================================================
# FlutterKaigi 2025 ステージング環境 企業ロゴ一括アップロードスクリプト
# =============================================================================
# 
# 概要: companiesディレクトリ内の企業ロゴ画像を
#       Cloudflare R2 ステージングバケットに一括アップロード
# 
# 使用方法: ./staging-company-logos-upload.sh
# 
# 前提条件:
# - bunx wrangler がインストール済み
# - Cloudflare R2 の認証が設定済み
# - companies/ ディレクトリが存在
# =============================================================================

# 設定
BUCKET_NAME="2025-public-staging"
SOURCE_DIR="companies"
LOG_FILE="staging-company-logos-upload-$(date +%Y%m%d-%H%M%S).log"
LOG_DIR="logs"

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
print_info "バケット: $BUCKET_NAME"
print_info "ソースディレクトリ: $SOURCE_DIR"
print_info "ログファイル: $LOG_DIR/$LOG_FILE"
print_info "開始時刻: $(date '+%Y-%m-%d %H:%M:%S')"
echo "============================================================================="

# 前提条件チェック
if ! command -v bunx &> /dev/null; then
    print_error "bunx がインストールされていません"
    exit 1
fi

if ! bunx wrangler --version &> /dev/null; then
    print_error "wrangler がインストールされていません"
    exit 1
fi

if [ ! -d "$SOURCE_DIR" ]; then
    print_error "ソースディレクトリ '$SOURCE_DIR' が存在しません"
    exit 1
fi

# ログファイルの初期化
{
    echo "============================================================================="
    echo "FlutterKaigi 2025 ステージング環境 企業ロゴ一括アップロードログ"
    echo "============================================================================="
    echo "開始時刻: $(date '+%Y-%m-%d %H:%M:%S')"
    echo "バケット: $BUCKET_NAME"
    echo "ソースディレクトリ: $SOURCE_DIR"
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

# 画像ファイルを配列に格納（macOS対応）
FILES=()
while IFS= read -r file; do
    FILES+=("$file")
done < <(find "$SOURCE_DIR" -name "*.webp" -o -name "*.png" -o -name "*.jpg" -o -name "*.jpeg")

# カウンター初期化
SUCCESS_COUNT=0
ERROR_COUNT=0
START_TIME=$(date +%s)

# アップロード処理
print_info "アップロード開始..."
echo "アップロード開始..." >> "$LOG_DIR/$LOG_FILE"

for ((i=0; i<${#FILES[@]}; i++)); do
    file="${FILES[i]}"
    key="$file"  # companies/プレフィックスを保持
    
    # 進捗計算
    progress=$((i + 1))
    percentage=$((progress * 100 / ${#FILES[@]}))
    elapsed=$(( $(date +%s) - START_TIME ))
    
    if [ $elapsed -gt 0 ] && [ $progress -gt 1 ]; then
        remaining_files=$(( ${#FILES[@]} - progress ))
        avg_time_per_file=$(( elapsed / (progress - 1) ))
        eta=$(( remaining_files * avg_time_per_file ))
        eta_min=$(( eta / 60 ))
        eta_sec=$(( eta % 60 ))
        eta_str="${eta_min}分${eta_sec}秒"
    else
        eta_str="計算中..."
    fi
    
    # 進捗表示
    print_progress "アップロード中 ($progress/${#FILES[@]}) - ${percentage}% - 残り時間: $eta_str"
    print_info "ファイル: $file"
    
    # ファイル拡張子からMIMEタイプを判定
    case "${file##*.}" in
        "webp") MIME_TYPE="image/webp" ;;
        "png")  MIME_TYPE="image/png" ;;
        "jpg")  MIME_TYPE="image/jpeg" ;;
        "jpeg") MIME_TYPE="image/jpeg" ;;
        *)      MIME_TYPE="image/webp" ;;
    esac
    
    print_info "MIMEタイプ: $MIME_TYPE"
    
    # アップロード実行
    {
        echo "============================================================================="
        echo "アップロード処理: $file"
        echo "時刻: $(date '+%Y-%m-%d %H:%M:%S')"
        echo "MIMEタイプ: $MIME_TYPE"
        echo "============================================================================="
    } >> "$LOG_DIR/$LOG_FILE"
    
    if bunx wrangler r2 object put "$BUCKET_NAME/$key" \
        --file "$file" \
        --remote \
        --content-type "$MIME_TYPE" \
        --cache-control "public, max-age=86400" \
        --content-disposition "inline; filename=\"$(basename "$file")\"" >> "$LOG_DIR/$LOG_FILE" 2>&1; then
        
        print_success "アップロード成功: $key"
        SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
        
        # 成功ログ
        echo "結果: 成功" >> "$LOG_DIR/$LOG_FILE"
    else
        print_error "アップロード失敗: $key"
        ERROR_COUNT=$((ERROR_COUNT + 1))
        
        # 失敗ログ
        echo "結果: 失敗" >> "$LOG_DIR/$LOG_FILE"
        
        # エラー詳細を取得
        if [ -f "$LOG_DIR/$LOG_FILE" ]; then
            echo "エラー詳細:" >> "$LOG_DIR/$LOG_FILE"
            tail -n 10 "$LOG_DIR/$LOG_FILE" | grep -E "(error|Error|ERROR|failed|Failed|FAILED)" >> "$LOG_DIR/$LOG_FILE" 2>/dev/null || true
        fi
    fi
    
    echo "" >> "$LOG_DIR/$LOG_FILE"
    
    # 進捗区切り
    if [ $i -lt $(( ${#FILES[@]} - 1 )) ]; then
        echo "----------------------------------------"
    fi
done

# 完了処理
END_TIME=$(date +%s)
TOTAL_TIME=$((END_TIME - START_TIME))
TOTAL_TIME_MIN=$((TOTAL_TIME / 60))
TOTAL_TIME_SEC=$((TOTAL_TIME % 60))

echo "============================================================================="
print_success "企業ロゴ一括アップロード完了！"
echo "============================================================================="
print_info "✅ 成功: $SUCCESS_COUNT"
print_info "❌ 失敗: $ERROR_COUNT"
print_info "📊 合計: $TOTAL_FILES"
print_info "⏱️ 所要時間: ${TOTAL_TIME_MIN}分${TOTAL_TIME_SEC}秒"
print_info "📝 詳細ログ: $LOG_DIR/$LOG_FILE"

# 結果サマリーをログファイルに記録
{
    echo "============================================================================="
    echo "アップロード完了サマリー"
    echo "============================================================================="
    echo "完了時刻: $(date '+%Y-%m-%d %H:%M:%S')"
    echo "成功: $SUCCESS_COUNT"
    echo "失敗: $ERROR_COUNT"
    echo "合計: $TOTAL_FILES"
    echo "所要時間: ${TOTAL_TIME_MIN}分${TOTAL_TIME_SEC}秒"
    
    if [ $ERROR_COUNT -gt 0 ]; then
        echo ""
        echo "⚠️  注意: $ERROR_COUNT 件のアップロードに失敗しました"
        echo "詳細はログファイルを確認してください"
    else
        echo ""
        echo "🎉 全ての企業ロゴが正常にアップロードされました！"
    fi
    
    echo "============================================================================="
} >> "$LOG_DIR/$LOG_FILE"

# 終了コード
if [ $ERROR_COUNT -eq 0 ]; then
    exit 0
else
    exit 1
fi
