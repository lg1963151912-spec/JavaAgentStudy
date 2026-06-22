# 学习进度跟踪 📊

> 本文件由 Claude Code hooks 自动读取与更新。
> - **SessionStart hook**：每次打开会话自动展示下方内容。
> - **Stop hook**：每天 20:00 后若今日未更新，会提示写当日总结。

- **学员**：Java 开发工程师
- **开始日期**：2026-06-15
- **当前进度**：第 1 周 · Day 1 概念已学完，准备进入 Day 2
- **最后更新**：2026-06-22

---

## 📅 今日课程（Day 2 · Prompt Engineering）

**主题**：Prompt Engineering（提示词工程）

学习目标：
- [ ] 提示词编写原则（清晰、具体、结构化）
- [ ] Zero-shot / Few-shot / Role-play
- [ ] CoT（思维链）
- [ ] 常见反模式与调试技巧

参考：`CURRICULUM.md` 第一阶段 · Day 2

> 💡 可选：先做 Day 1 的小测验巩固 LLM 基础概念，再进入 Day 2。

---

## 📝 每日学习记录

### Day 1 · 2026-06-22（放假后恢复学习）
**主题**：LLM 基础概念
- ✅ **核心心智模型**：LLM 本质 = 下一词预测器（不断 predict next token 的循环）—— 一切技巧都是影响这个预测过程
- ✅ **训练 vs 推理**：训练 = 编译（一次性、AI 公司做）；推理 = 运行（每次调 API，开发者做）
- ✅ **Token**：模型最小处理单位；中文比英文"贵"（1 汉字≈1~2 token）；API 按 token 计费
- ✅ **上下文窗口**：模型一次能看到的最大 token 数（固定缓冲区，超出丢最早内容）；Memory/RAG 的核心约束
- ✅ **采样参数**：Temperature（低温稳准 / 高温发散）、Top-P、Max Tokens；工程默认 temperature=0
- ✅ **主流模型**：GPT / Claude / Qwen / DeepSeek；国内用 Qwen/DeepSeek 更稳更便宜
- 🔲 测验未做（可选，用于验证理解）

---

## ⚠️ 薄弱待加强

- **Day 1 理解尚未测验验证**：核心概念（下一词预测、Temperature、上下文窗口）建议下次先用 3 道小测验确认扎实，再深入 Day 2
- 暂无其它薄弱点

---

## 📌 明日课程（Day 3）

**主题**：API 调用入门（用 Java 调用 LLM）
- OpenAI / Claude API 的请求与响应结构
- 用 Java HttpClient / OkHttp 直接调用 LLM API
- 流式输出（Streaming）原理
- 详见 `CURRICULUM.md` 第一阶段 · Day 3
