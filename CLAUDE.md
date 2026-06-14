# CLAUDE.md — 项目指南

## 项目性质
这是一个 **AI Agent 开发学习项目**。作者是一名 Java 后端工程师，正在系统学习 AI Agent 开发。

## 关键文件
- `CURRICULUM.md` — 完整课程大纲（8 周），是所有学习内容的索引
- `.claude/progress.md` — 每日学习进度、薄弱点、明日课程（由 hooks 读写）
- `.claude/scripts/session_start.sh` — 会话开始时展示进度
- `.claude/scripts/session_stop.sh` — 每日结束时提示更新进度
- `.claude/settings.local.json` — hooks 与权限配置

## 工作约定
- 使用 **中文** 交流、写注释与文档
- 技术栈优先 **Java + Spring AI / LangChain4j**
- 学习代码按阶段组织目录（如 `phase1-fundamentals/`、`phase4-agent/`）
- 涉及学习内容时，先参考 `CURRICULUM.md` 与 `.claude/progress.md` 确认当前进度

## Hooks 行为
- **SessionStart**：自动输出 `.claude/progress.md` 内容作为会话上下文
- **Stop**：每天 20:00 后若 `progress.md` 今日未更新则 block，要求写当日总结

## 更新进度的规范
当需要更新 `.claude/progress.md` 时：
1. 在「每日学习记录」追加当天的关键知识点与动手实践
2. 更新「薄弱待加强」列出需要复习的点
3. 把「明日课程」推进到下一天
4. 更新顶部的 `最后更新` 日期与 `当前进度`
