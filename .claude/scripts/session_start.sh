#!/usr/bin/env bash
# SessionStart hook —— 展示学习进度与课程
# 由 .claude/settings.local.json 的 SessionStart 钩子调用
# 输出内容会作为 additionalContext 注入到会话开头

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
PROGRESS="$PROJECT_DIR/.claude/progress.md"

if [ -f "$PROGRESS" ]; then
  echo "══════════════════════════════════════════════"
  echo "📚 AI Agent 学习进度（SessionStart 自动加载）"
  echo "══════════════════════════════════════════════"
  echo ""
  cat "$PROGRESS"
  echo ""
  echo "══════════════════════════════════════════════"
  echo "开始学习前请阅读上方「📅 今日课程」。"
  echo "══════════════════════════════════════════════"
else
  echo "尚未创建 .claude/progress.md，请先初始化学习进度文件。"
fi
