#!/usr/bin/env bash
# 把项目变更同步到 GitHub（走 Contents API / api.github.com，绕过 github.com git 封锁）
# - 用 git hash-object 与 GitHub 上的 blob sha 对比，只推送内容有变化的文件
# - 每天 只推送一次（靠 .claude/.last_push 标记当天日期）
# - 依赖环境变量 GITHUB_PERSONAL_ACCESS_TOKEN（由 ~/.claude/settings.json 的 env 提供）

set -u
TOKEN="${GITHUB_PERSONAL_ACCESS_TOKEN:-}"
if [ -z "$TOKEN" ]; then
  echo "$(date '+%F %T') 无 GITHUB_PERSONAL_ACCESS_TOKEN，跳过推送" >&2
  exit 0
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
OWNER="lg1963151912-spec"
REPO="JavaAgentStudy"
BRANCH="main"
MARKER="$PROJECT_DIR/.claude/.last_push"
TODAY="$(date +%Y-%m-%d)"

# 今天已推送过则跳过
if [ -f "$MARKER" ] && [ "$(cat "$MARKER")" = "$TODAY" ]; then
  echo "$(date '+%F %T') 今天已推送过，跳过"
  exit 0
fi

cd "$PROJECT_DIR" || exit 1
PUSHED=0; SKIPPED=0; FAILED=0

while IFS= read -r -d '' f; do
  rel="${f#$PROJECT_DIR/}"
  LOCAL_SHA=$(git hash-object "$f")
  # 取 GitHub 上该文件的 blob sha
  GH=$(curl -s -H "Authorization: token $TOKEN" \
    "https://api.github.com/repos/$OWNER/$REPO/contents/$rel?ref=$BRANCH")
  GH_SHA=$(echo "$GH" | grep '"sha"' | head -1 | sed 's/.*"sha": *"\([^"]*\)".*/\1/')

  if [ "$LOCAL_SHA" = "$GH_SHA" ]; then
    SKIPPED=$((SKIPPED+1)); continue
  fi

  CONTENT=$(base64 -w 0 "$f")
  MSG="auto: update $rel"
  if [ -n "$GH_SHA" ]; then
    printf '{"message":"%s","content":"%s","branch":"%s","sha":"%s"}' \
      "$MSG" "$CONTENT" "$BRANCH" "$GH_SHA" > /tmp/gh_pl.json
  else
    printf '{"message":"%s","content":"%s","branch":"%s"}' \
      "$MSG" "$CONTENT" "$BRANCH" > /tmp/gh_pl.json
  fi
  STATUS=$(curl -s -o /tmp/gh_rp.json -w "%{http_code}" -X PUT \
    -H "Authorization: token $TOKEN" -H "Accept: application/vnd.github+json" \
    "https://api.github.com/repos/$OWNER/$REPO/contents/$rel" --data-binary @/tmp/gh_pl.json)
  if [ "$STATUS" = "200" ] || [ "$STATUS" = "201" ]; then
    PUSHED=$((PUSHED+1))
    echo "$(date '+%F %T') ✓ pushed $rel"
  else
    FAILED=$((FAILED+1))
    echo "$(date '+%F %T') ✗ [$STATUS] $rel — $(head -c 150 /tmp/gh_rp.json)" >&2
  fi
  rm -f /tmp/gh_pl.json /tmp/gh_rp.json
done < <(find "$PROJECT_DIR" -type f \
  -not -path '*/.git/*' -not -name '.last_push' -not -name 'push.log' -print0)

echo "$(date '+%F %T') 推送 $PUSHED / 跳过(未变) $SKIPPED / 失败 $FAILED"
echo "$TODAY" > "$MARKER"
