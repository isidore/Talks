#!/bin/bash
# Make a QR code (SVG and PNG) for a talk's page in this repo.
#
# Usage: make_qr_code.sh Talk.md [name]
#   Talk.md  the talk page; the QR code links to it on github.com/isidore/Talks
#   name     file name in qrcodes/ (default: qr-<talk-in-kebab-case>)
#
# Needs qrencode: brew install qrencode
set -euo pipefail

cd "$(dirname "$0")"

if [ $# -lt 1 ] || [ $# -gt 2 ]; then
    echo "usage: $(basename "$0") Talk.md [name]" >&2
    exit 2
fi
command -v qrencode >/dev/null || { echo "qrencode is missing; install it with: brew install qrencode" >&2; exit 1; }

page=$1
[ -f "$page" ] || { echo "no such page: $page" >&2; exit 1; }

# AiInLegacyCode.md -> qr-ai-in-legacy-code
default_name="qr-$(basename "$page" .md | sed -E 's/([a-z0-9])([A-Z])/\1-\2/g; s/([A-Z])([A-Z][a-z])/\1-\2/g; s/[^A-Za-z0-9]+/-/g' | tr '[:upper:]' '[:lower:]')"
name=${2:-$default_name}
url="https://github.com/isidore/Talks/blob/master/$page"

qrencode -t SVG -l M -m 2 -o "qrcodes/$name.svg" "$url"
qrencode -t PNG -l M -m 2 -s 20 -o "qrcodes/$name.png" "$url"

echo "$url"
echo "qrcodes/$name.svg"
echo "qrcodes/$name.png"
