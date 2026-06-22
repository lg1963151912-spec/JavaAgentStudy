#!/usr/bin/env bash
# Stop hook —— 每日学习结束时确保更新进度，并把变更推送到 GitHub
# 规则（CUTOFF 默认 23:30，可自行调整）：
#   1) >= CUTOFF 且 progress.md 今日未更新 -> block，提示写当日总结
#   2) >= CUTOFF 且今日已更新          -> 调用 push_to_github.sh 推送变更
#   3) < CUTOFF                         -> 放行（白天学习正常结束不干预）

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
PROGRESS="$PROJECT_DIR/.claude/progress.md"

CUTOFF="23:30"                      # 每日总结触发时间（HH:MM），可自行调整
TODAY="$(date +%Y-%m-%d)"
NOW="$(date +%H:%M)"

# 进度文件不存在，无需更新
[ -f "$PROGRESS" ] || exit 0

# 今日是否已更新（按文件修改时间判断）
LAST_MODIFIED="$(stat -c %y "$PROGRESS" 2>/dev/null | cut -d' ' -f1)"
UPDATED_TODAY=false
[ "$LAST_MODIFIED" = "$TODAY" ] && UPDATED_TODAY=true

# 是否过了截止时间（HH:MM 零填充，字典序即时间序）
PAST_CUTOFF=false
if [[ "$NOW" > "$CUTOFF" ]] || [ "$NOW" = "$CUTOFF" ]; then
  PAST_CUTOFF=true
fi

# 过了截止时间但今日未更新 -> block，提示写总结
if [ "$PAST_CUTOFF" = true ] && [ "$UPDATED_TODAY" = false ]; then
  cat <<EOF
{
  "decision": "block",
  "reason": "今日学习即将结束（当前 ${NOW} ≥ ${CUTOFF}），但 .claude/progress.md 今日尚未更新。请更新该文件：1) 「每日学习记录」追加当日关键知识点与实践；2) 更新「薄弱待加强」；3) 把「今日/明日课程」推进到下一天；4) 更新顶部 last_updated。完成后我会在结束前自动把变更推送到 GitHub。"
}
EOF
  exit 0
fi

# 过了截止时间且今日已更新 -> 推送变更到 GitHub（每天一次，幂等）
if [ "$PAST_CUTOFF" = true ]; then
  bash "$SCRIPT_DIR/push_to_github.sh" >> "$PROJECT_DIR/.claude/scripts/push.log" 2>&1
fi

exit 0
