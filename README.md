# JavaAgentStudy 🤖

> 一名 Java 工程师的 AI Agent 开发学习笔记与实战项目。

## 项目简介

本项目记录从 Java 后端开发转向 **AI Agent 开发** 的完整学习路径，包含：
- 📖 系统化课程大纲（见 [`CURRICULUM.md`](CURRICULUM.md)）
- 📊 每日学习进度跟踪（见 [`.claude/progress.md`](.claude/progress.md)）
- 💻 各阶段实战代码
- 🔄 Claude Code 自动化学习 hooks

## 课程概览（8 周）

| 阶段 | 周次 | 主题 |
|------|------|------|
| 一 | 第 1 周 | AI 基础与 LLM 认知 |
| 二 | 第 2 周 | 工具调用与记忆 |
| 三 | 第 3 周 | RAG 检索增强生成 |
| 四 | 第 4–5 周 | Agent 架构与 ReAct |
| 五 | 第 6–7 周 | Multi-Agent / MCP / 编排 |
| 六 | 第 8 周 | 综合实战项目 |

详见 [`CURRICULUM.md`](CURRICULUM.md)。

## 自动化 Hooks

本项目配置了两个 Claude Code hooks（`.claude/settings.local.json`）：

- **SessionStart**：每次打开会话自动展示当前学习进度与明日课程。
- **Stop**：每天 20:00 后，若当日进度未更新，会提示总结今日所学与薄弱点。

## 技术栈

- Java 17+
- Spring Boot + Spring AI
- LangChain4j

## 开始学习

1. 阅读 [`CURRICULUM.md`](CURRICULUM.md) 了解完整路线
2. 打开 Claude Code，SessionStart hook 会自动展示当日进度
3. 按 `.claude/progress.md` 中的「今日课程」开始学习
