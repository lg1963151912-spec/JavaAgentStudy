#!/usr/bin/env bash
# Stop hook —— 每日学习结束时确保更新学习进度
# 规则：当本地时间 >= CUTOFF_HOUR 且 progress.md 今日未更新时，
#       阻止结束并提示 Claude 写入当日学习总结与薄弱点。
# 调整：修改下方 CUTOFF_HOUR 即可改变每日总结的触发时间。

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
PROGRESS="$PROJECT_DIR/.claude/progress.md"

CUTOFF_HOUR=20                 # 20:00 之后开始强制每日总结，可自行调整
TODAY="$(date +%Y-%m-%d)"
NOW_HOUR="$(date +%H)"

# 进度文件不存在，无需更新
[ -f "$PROGRESS" ] || exit 0

# 今日已更新过（通过文件修改时间判断），放行
LAST_MODIFIED="$(stat -c %y "$PROGRESS" 2>/dev/null | cut -d' ' -f1)"
[ "$LAST_MODIFIED" = "$TODAY" ] && exit 0

# 未到总结时间，放行（白天学习过程中正常结束不强制）
[ "$NOW_HOUR" -ge "$CUTOFF_HOUR" ] || exit 0

# 需要写今日总结 -> 阻止结束，把要求反馈给 Claude
cat <<EOF
{
  "decision": "block",
  "reason": "今日学习即将结束（当前 ${NOW_HOUR}:00 ≥ ${CUTOFF_HOUR}:00），但 .claude/progress.md 今日尚未更新。请在结束前更新该文件：1) 在「每日学习记录」追加 Day N 的关键知识点与实践内容；2) 更新「薄弱待加强」列出需要复习的点；3) 把「明日课程」推进到下一天；4) 更新顶部 last_updated 日期与当前进度。完成后再结束。"
}
EOF
