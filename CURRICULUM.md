# Java 工程师的 AI Agent 开发学习路线 🚀

> 面向有 Java 后端基础的开发者，系统掌握 AI Agent 开发。
> 学习周期：**8 周**（可按个人节奏伸缩）；每日建议 **1.5–2 小时**。
> 技术栈：**Java 17+ · Spring Boot · Spring AI · LangChain4j**

---

## 学习目标

完成本路线后，你将能够：
1. 理解 LLM 工作原理，熟练进行 Prompt Engineering
2. 用 Java 框架（Spring AI / LangChain4j）调用大模型
3. 实现 Function Calling、记忆、RAG 等核心能力
4. 从 0 到 1 构建一个完整的、可部署的 AI Agent 应用

---

## 阶段总览

| 阶段 | 周次 | 主题 | 核心产出 |
|------|------|------|----------|
| 一 | 第 1 周 | AI 基础与 LLM 认知 | Hello AI 项目 |
| 二 | 第 2 周 | 工具调用与记忆 | 带工具与记忆的聊天助手 |
| 三 | 第 3 周 | RAG 检索增强生成 | 本地文档问答 Agent |
| 四 | 第 4–5 周 | Agent 架构与 ReAct | 自主任务 Agent |
| 五 | 第 6–7 周 | Multi-Agent / MCP / 编排 | 多智能体协作 Demo |
| 六 | 第 8 周 | 综合实战项目 | 毕业项目 |

---

## 第一阶段：AI 基础与认知（第 1 周）
**目标：理解 LLM 原理，能通过 API 与 Java 框架调用大模型。**

### Day 1 — LLM 基础概念
- [ ] 什么是大语言模型（LLM）、训练与推理的区别
- [ ] Token、上下文窗口（Context Window）
- [ ] 采样参数：Temperature、Top-P、Max Tokens
- [ ] 主流模型对比：GPT / Claude / 开源模型（Qwen、DeepSeek、Llama）

### Day 2 — Prompt Engineering（提示词工程）
- [ ] 提示词编写原则（清晰、具体、结构化）
- [ ] Zero-shot / Few-shot / Role-play
- [ ] CoT（Chain-of-Thought）思维链
- [ ] 常见反模式与调试技巧

### Day 3 — API 调用入门
- [ ] OpenAI / Claude API 的请求与响应结构
- [ ] 用 Java HttpClient / OkHttp 直接调用 LLM API
- [ ] 流式输出（Streaming）原理

### Day 4 — Java AI 框架初探
- [ ] Spring AI 项目结构与快速上手
- [ ] LangChain4j 项目结构与快速上手
- [ ] 两者定位、生态与选型对比

### Day 5 — 阶段实战与总结
- [ ] 搭建第一个 Spring Boot + Spring AI 的 "Hello AI" 项目
- [ ] 整理本周疑问，写入 `.claude/progress.md`

---

## 第二阶段：核心能力——工具调用与记忆（第 2 周）
**目标：让 LLM 能「使用工具」并「记住对话」。**

### Day 6–7 — Function Calling / Tool Use
- [ ] 函数调用原理、Tool / Function Schema（JSON Schema）
- [ ] Spring AI 的 `@Tool` 注解用法
- [ ] LangChain4j 的工具定义（`@Tool` / `ToolSpecification`）
- [ ] 实战：让模型查询数据库 / 调用外部 API

### Day 8–9 — Memory（记忆机制）
- [ ] 短期记忆 vs 长期记忆
- [ ] 对话历史管理、Token 窗口溢出策略
- [ ] Spring AI / LangChain4j 的 Memory 抽象
- [ ] 向量化的长期记忆（预告 RAG）

### Day 10 — 阶段实战
- [ ] 构建一个能调用工具、记住上下文的聊天助手

---

## 第三阶段：RAG 检索增强生成（第 3 周）
**目标：让 Agent 基于私有知识回答问题。**

### Day 11–12 — Embedding 与向量数据库
- [ ] 文本向量化（Embedding）原理
- [ ] 相似度检索（余弦相似度）
- [ ] 向量数据库：PGVector / Chroma / Milvus

### Day 13–14 — RAG 全流程
- [ ] 文档加载、切分（Chunking）、向量化、入库
- [ ] 检索 + 重排（Rerank）+ 生成
- [ ] Spring AI 的 RAG / LangChain4j 的 EasyRag

### Day 15 — 阶段实战
- [ ] 基于本地文档（PDF/Markdown）的问答 Agent

---

## 第四阶段：Agent 架构（第 4–5 周）
**目标：理解并构建能自主规划与执行的 Agent。**

### Day 16–17 — Agent 核心概念
- [ ] 什么是 Agent？Agent vs Chatbot vs Workflow
- [ ] 自主性（Autonomy）、规划（Planning）、工具循环
- [ ] Agent 的核心循环：感知→思考→行动→观察

### Day 18–19 — ReAct 模式
- [ ] ReAct = Reason + Act
- [ ] Thought / Action / Observation 循环
- [ ] 与朴素 Function Calling 的区别

### Day 20–21 — 构建完整 Agent
- [ ] LangChain4j `AiServices` 构建 Agent
- [ ] 多步任务规划与执行、错误重试
- [ ] System Prompt 设计 Agent 人格与边界

### Day 22–25 — Agent 实战项目
- [ ] 构建一个「代码助手 Agent」或「数据分析 Agent」
- [ ] 包含工具、记忆、多轮交互

---

## 第五阶段：高级主题（第 6–7 周）
**目标：掌握多智能体协作、协议与工程化。**

### Day 26–28 — Multi-Agent 多智能体
- [ ] 多 Agent 协作模式（层级、对等、流水线）
- [ ] 角色分工与消息传递
- [ ] 编排框架（如 LangGraph 思想 / 自研）

### Day 29–31 — MCP（Model Context Protocol）
- [ ] MCP 协议原理：Host / Client / Server
- [ ] Resources、Tools、Prompts 三大原语
- [ ] 用 Java 实现一个 MCP Server

### Day 32–35 — 工作流编排与可观测性
- [ ] Agent 工作流设计与状态管理
- [ ] 日志、Trace 追踪、Token 成本控制
- [ ] 输出评估（Eval）与回归测试

---

## 第六阶段：综合实战（第 8 周）
**目标：交付一个完整的 AI Agent 应用。**

### Day 36–40 — 毕业项目
- [ ] 需求设计 → 架构设计 → 编码 → 测试 → 部署
- [ ] 建议选题：智能客服 / 私人知识库助手 / 自动化运维 Agent / 代码审查 Agent

### Day 41–42 — 复盘与拓展
- [ ] 薄弱点回顾与查漏补缺
- [ ] 总结个人知识体系
- [ ] 规划后续进阶方向（Fine-tuning / Agent 评测 / 多模态）

---

## 推荐资源
- **Spring AI 官方文档**：https://docs.spring.io/spring-ai/reference/
- **LangChain4j 官方文档**：https://docs.langchain4j.dev
- **OpenAI API 文档**：https://platform.openai.com/docs
- **Anthropic Claude 文档**：https://docs.anthropic.com
- **MCP 规范**：https://modelcontextprotocol.io

---

## 学习方法建议
1. **先概念后代码**：每天先理解原理，再动手写。
2. **小步快跑**：每个 Day 都有一个可运行的小产出。
3. **记笔记**：把疑问和心得写进 `.claude/progress.md` 的「薄弱待加强」。
4. **善用 Claude Code**：让它解释概念、review 代码、出练习题。
