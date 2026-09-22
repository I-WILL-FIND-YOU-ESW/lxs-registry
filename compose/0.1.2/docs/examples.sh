#!/usr/bin/env bash
# compose LXS smoke test — assumes the LXS is listening on $PORT.
set -euo pipefail
PORT="${PORT:-4202}"
base="http://127.0.0.1:${PORT}"

for p in /compose /compose-app/static/composer.css /compose-app/static/composer.js; do
  code=$(curl -s -o /dev/null -w '%{http_code}' "$base$p")
  printf '%-34s %s\n' "$p" "$code"
  [ "$code" = "200" ] || exit 1
done

curl -s "$base/compose" | grep -q 'id="compose-canvas"' && echo "canvas present"
echo "ok"
