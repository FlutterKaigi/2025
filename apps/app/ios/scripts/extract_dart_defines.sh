#!/bin/bash

# Dart defineを書き出すファイルパスを指定します。
OUTPUT_FILE="${SRCROOT}/Flutter/Environment.xcconfig"
cp /dev/null $OUTPUT_FILE

function decode_base64() {
  echo "${*}" | base64 --decode
}

IFS=',' read -r -a define_items <<<"$DART_DEFINES"

for line in "${define_items[@]}"; do
  decoded_line=$(decode_base64 "$line")
  lowercase_line=$(echo "$decoded_line" | tr '[:upper:]' '[:lower:]')
  if [[ $lowercase_line != flutter* ]]; then
    echo "$decoded_line" >> "$OUTPUT_FILE"
  fi
done

# environmentに応じて、GoogleService-Info.plist をコピーする
if [ "$ENVIRONMENT" = "production" ]; then
  cp "${SRCROOT}/../environments/ios/production.plist" "${SRCROOT}/Runner/GoogleService-Info.plist"
else
  cp "${SRCROOT}/../environments/ios/staging.plist" "${SRCROOT}/Runner/GoogleService-Info.plist"
fi
