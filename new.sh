#!/bin/bash
set -e

LINKS_DIR="$(dirname "$0")/content"

read -p "标题: " title
read -p "网址: " url
read -p "描述 (可为空): " desc

date=$(date +%Y-%m-%d)
isodate=$(date '+%Y-%m-%dT%H:%M:%S+08:00')
slug=$(echo "$title" | tr ' ' '-' | tr '[:upper:]' '[:lower:]')
file="$LINKS_DIR/$date-$slug.md"

if [ -f "$file" ]; then
    echo "错误: $file 已存在"
    exit 1
fi

cat > "$file" <<EOF
+++
title = "$title"
date = $isodate

[extra]
url = "$url"
+++

$desc
EOF

echo "已创建: $file"
