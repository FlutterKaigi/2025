#!/bin/bash

set -euxo pipefail

# Dart defineを書き出すファイルパスを指定します。
OUTPUT_FILE="${SRCROOT}/Flutter/Environment.xcconfig"
cp /dev/null $OUTPUT_FILE

function decode_base64() {
  echo "${*}" | base64 --decode
}

IFS=',' read -r -a define_items <<<"$DART_DEFINES"

flavor=

for line in "${define_items[@]}"; do
  decoded_line=$(decode_base64 "$line")
  lowercase_line=$(echo "$decoded_line" | tr '[:upper:]' '[:lower:]')
  if [[ $lowercase_line != flutter* ]]; then
    echo "$decoded_line" >> "$OUTPUT_FILE"
  fi
  if [[ $lowercase_line == flavor* ]]; then
    flavor=$(echo "$lowercase_line" | sed 's/flavor=//')
  fi
done

# environmentに応じて、GoogleService-Info.plist をコピーする
if [ "$flavor" = "prod" ]; then
  cp "${SRCROOT}/../environments/apple/production.plist" "${SRCROOT}/Runner/GoogleService-Info.plist"
elif [ "$flavor" = "stg" ] || [ "$flavor" = "dev" ]; then
  cp "${SRCROOT}/../environments/apple/staging.plist" "${SRCROOT}/Runner/GoogleService-Info.plist"
else
  echo "Invalid flavor: $flavor"
  exit 1
fi
