# LLM Agent

LLM Agent 是基于大语言模型构建的智能代理系统，能够自主规划、推理、使用工具并执行任务。与传统的 LLM 对话不同，Agent 具备感知环境、调用外部工具、维护记忆和持续反思的能力，是实现通用人工智能的重要方向之一。核心架构通常包含规划（Planning）、记忆（Memory）、工具使用（Tool Use）三个关键模块。

- [[artificial-intelligence]]
  - [[machine-learning]]
    - [[llm]]

## Learn
- [ReAct: Synergizing Reasoning and Acting in Language Models](https://arxiv.org/abs/2210.03629) — 交替执行推理与行动，奠定了 Agent 的基本范式（ICLR 2023）
- [Toolformer: Language Models Can Teach Themselves to Use Tools](https://arxiv.org/abs/2302.04761) — 展示 LLM 可通过自监督学习自主使用外部工具 API
- [Generative Agents: Interactive Simulacra of Human Behavior](https://arxiv.org/abs/2304.03442) — 提出观察、规划、反思三模块架构，Agent 可模拟可信的人类行为
- [Reflexion: Language Agents with Verbal Reinforcement Learning](https://arxiv.org/abs/2303.11366) — 通过语言反思实现无权重更新的强化学习，显著提升任务表现
- [Voyager: An Open-Ended Embodied Agent with Large Language Models](https://arxiv.org/abs/2305.16291) — Minecraft 中的终身学习 Agent，自动课程 + 技能库 + 迭代提示
- [AutoGen: Enabling Next-Gen LLM Applications via Multi-Agent Conversation](https://arxiv.org/abs/2308.08155) — 微软多 Agent 对话框架，支持可定制 Agent 协作（Microsoft Research）
- [A Survey on Large Language Model based Autonomous Agents](https://arxiv.org/abs/2308.11432) — 最全面的 LLM Agent 综述，涵盖架构、应用与评估（人大，持续更新）
- [The Rise and Potential of Large Language Model Based Agents](https://arxiv.org/abs/2309.07864) — 从大脑/感知/行动框架分析 LLM Agent（复旦）
- [LLM based Multi-Agents: A Survey of Progress and Challenges](https://arxiv.org/abs/2402.01680) — 多 Agent 系统综述，覆盖通信机制与协作模式
- [A Survey on the Memory Mechanism of LLM based Agents](https://arxiv.org/abs/2404.13501) — Agent 记忆机制专题综述：短期/长期记忆、读写与反思

### Blog Posts & Guides
- [Building Effective Agents](https://www.anthropic.com/engineering/building-effective-agents) — Anthropic 官方 Agent 设计模式指南：Prompt Chaining / Routing / Parallelization / Orchestrator-Workers / Evaluator-Optimizer
- [OpenAI Agents Guide](https://platform.openai.com/docs/guides/agents) — OpenAI 官方 Agent 构建指南与 Agents SDK 文档
- [LLM Powered Autonomous Agents](https://lilianweng.github.io/posts/2023-06-23-agent/) — Lilian Weng（OpenAI）经典博文，系统梳理规划/记忆/工具使用三大模块
- [Andrew Ng's Agentic Design Patterns](https://www.deeplearning.ai/the-batch/) — Andrew Ng 的 Agent 设计模式系列：Reflection / Tool Use / Planning / Multi-Agent

### Engineering Practices
- [Harness Engineering](https://openai.com/index/harness-engineering/) — OpenAI 分享零手写代码、完全由 Codex Agent 生成并交付软件的实践：AGENTS.md 作为目录、自定义 linter 强制不变量、GAN 式自审循环、持续 doc-gardening
- [Harness Design for Long-Running App Development](https://www.anthropic.com/engineering/harness-design-long-running-apps) — Anthropic 三 Agent 架构（Planner/Generator/Evaluator）构建全栈应用，分离生成与评估对抗自我宽容偏见，用 context reset 解决上下文焦虑
- [How I Use Claude Code](https://boristane.com/blog/how-i-use-claude-code/) — 核心原则：不让 Claude 写代码直到审批通过书面计划。三阶段工作流：research.md → plan.md（多轮批注）→ 一次性实现
- [How To Be A World-Class Agentic Engineer](https://x.com/systematicls/status/2028814227004395561) — 少即是多：精简依赖、最小化 CLAUDE.md、分离研究与实现、中立提示避免迎合、编码任务完成契约

### Courses
- [AI Agents in LangGraph](https://www.deeplearning.ai/short-courses/ai-agents-in-langgraph/) — Harrison Chase 主讲，从零构建 Agent（DeepLearning.AI）
- [Hugging Face Agents Course](https://huggingface.co/learn/agents-course) — 免费综合课程，涵盖 Agent 基础与 smolagents 实战
- [AI Agentic Design Patterns with CrewAI](https://www.deeplearning.ai/short-courses/ai-agentic-design-patterns-with-crewai/) — Andrew Ng + CrewAI 实战课程


## Frameworks

### LangGraph (LangChain)
- [LangGraph](https://github.com/langchain-ai/langgraph) — 基于图的 Agent 框架，支持循环、分支、持久状态与 Human-in-the-Loop。含 LangGraph Studio 可视化 IDE

### CrewAI
- [CrewAI](https://github.com/crewAIInc/crewAI) — 角色扮演式多 Agent 协作框架，独立于 LangChain。提供 Crews（自主团队）和 Flows（事件驱动工作流）两种范式

### AutoGen (Microsoft)
- [AutoGen](https://github.com/microsoft/autogen) — 微软分层架构 Agent 框架（Core API / AgentChat API / Extensions API），支持多 Agent 对话与 MCP 集成，含 Magentic-One 多 Agent 团队

### OpenAI Agents SDK
- [OpenAI Agents SDK](https://github.com/openai/openai-agents-python) — 轻量多 Agent 框架，支持 100+ LLM、Handoffs、MCP 工具、Guardrails、Tracing

### Claude Agent SDK (Anthropic)
- [Claude Agent SDK](https://github.com/anthropics/claude-agent-sdk-python) — Anthropic 官方 Python SDK，集成工具使用与 Computer Use 能力

### Google ADK
- [Google ADK](https://github.com/google/adk-python) — Google 开源 Agent 开发框架，面向 Gemini 模型，支持 A2A 协议

### Others
- [Pydantic AI](https://ai.pydantic.dev/) — Pydantic 团队的类型安全 Agent 框架，支持依赖注入与模型无关
- [smolagents](https://github.com/huggingface/smolagents) — Hugging Face 轻量框架，Agent 通过编写和执行 Python 代码完成任务
- [Semantic Kernel](https://github.com/microsoft/semantic-kernel) — 微软企业级 SDK，支持 C#/Python/Java，含 Process Framework 状态化工作流
- [Agno](https://github.com/agno-agi/agno) — 全栈 Agent 平台（前身 Phidata），支持主流 LLM 与多 Agent 系统
- [Bee Agent Framework](https://github.com/i-am-bee/bee-agent-framework) — IBM 出品的 TypeScript Agent 框架，面向开源模型（Granite、Llama）优化

### Agent Skills & Workflows
- [superpowers](https://github.com/obra/superpowers) — Agentic Skills 框架，为 Claude Code/Cursor/Codex 等提供可组合技能（头脑风暴、TDD、代码审查、子 Agent 驱动开发等），自动触发结构化工作流
- [gstack](https://github.com/garrytan/gstack) — Garry Tan 的 Claude Code 配置：28 个斜杠命令模拟虚拟工程团队（CEO/设计师/工程经理/QA/安全官等），覆盖从思考到发布的完整冲刺周期
- [BMAD-METHOD](https://github.com/bmad-code-org/BMAD-METHOD) — "Breakthrough Method for Agile AI-Driven Development"，12+ 专业 Agent 角色 + 34+ 结构化工作流，覆盖从头脑风暴到部署的完整软件生命周期
- [gastown](https://github.com/steveyegge/gastown) — 多 Agent 编排系统，协调 20-30+ AI 编程 Agent（Claude Code/Copilot/Codex/Gemini 等），层级架构含 Mayor 协调器、git 持久化工作追踪、合并队列与看板
- [get-shit-done](https://github.com/gsd-build/get-shit-done) — 轻量级 meta-prompting + context engineering + spec-driven 开发系统，支持 Claude Code/Codex/Gemini CLI/Cursor 等 12 个运行时，子 Agent 编排 + 波次并行执行 + 自动验证


## Notable Projects

### Autonomous Agents
- [AutoGPT](https://github.com/Significant-Gravitas/AutoGPT) — 最早的自主 AI Agent 平台之一，~170k+ stars，支持网页浏览、文件系统与记忆管理。开创了"给 AI 一个目标，让它自主完成"的范式
- [MetaGPT](https://github.com/geekan/MetaGPT) — 多 Agent 软件开发框架，分配 PM/架构师/工程师/QA 角色协作（ICLR 2024），~50k+ stars。独特之处在于用 SOP（标准操作流程）结构化多 Agent 协作，能从一句话生成完整项目
- [OpenHands](https://github.com/All-Hands-AI/OpenHands) — 开源自主软件工程 Agent 平台（前身 OpenDevin），~50k+ stars。Devin 的最强开源替代，支持多 LLM 后端，Web 界面，可浏览网页/编辑文件/运行命令，在 SWE-bench 上竞争力强
- [SWE-agent](https://github.com/princeton-nlp/SWE-agent) — Princeton NLP 出品，~15k+ stars。与 SWE-bench 同团队开发，使用专用 Agent-Computer Interface (ACI) 提供仓库导航/代码编辑/文件管理命令，在 SWE-bench 上达到 SOTA
- [Manus](https://github.com/manulsgroup) — 通用 AI Agent，能自主完成多步骤复杂任务（网页浏览/编程/数据分析/旅行规划/股票分析），2025 年初引发巨大关注并开源部分框架。采用多 Agent 编排：规划/工具使用/执行分阶段进行
- [Devika](https://github.com/stitionai/devika) — AI 软件工程师 Agent，~20k+ stars。能理解高层指令、研究主题、编写代码实现目标，Devin 的早期开源替代
- [Open Interpreter](https://github.com/OpenInterpreter/open-interpreter) — ~58k+ stars。让 LLM 在本地运行代码（Python/JS/Shell），完成计算机上的任务。自然语言到计算机操作的桥梁，许多 Agent 系统的核心构建块
- [ChatDev](https://github.com/OpenBMB/ChatDev) — ~26k+ stars。虚拟软件公司，AI Agent 扮演 CEO/CTO/程序员/测试等角色协作开发软件（清华）

### Development Platforms
- [Dify](https://github.com/langgenius/dify) — 开源 LLM 应用开发平台，~60k+ stars。可视化拖拽工作流编辑器，支持 100+ LLM 提供商，自部署。最强低代码/无代码 Agent 构建器，在亚洲企业部署中广泛使用
- [n8n](https://n8n.io/) — 工作流自动化平台，~60k+ stars。AI Agent 节点支持函数调用/RAG/Agent 循环，400+ 连接器生态，自部署。将工作流自动化与 AI Agent 桥接
- [Flowise](https://github.com/FlowiseAI/Flowise) — ~35k+ stars。基于 LangChain 的拖拽式 LLM 流程构建器，最易上手的可视化 Agent 构建工具
- [LangFlow](https://github.com/langflow-ai/langflow) — LangChain 组件的可视化编排工具，~50k+ stars
- [LlamaIndex](https://github.com/run-llama/llama_index) — ~40k+ stars。从数据连接器发展为完整 Agent 框架，在数据摄取和 RAG 方面业界领先

### Coding Agents
- [Claude Code](https://github.com/anthropics/claude-code) — Anthropic 官方 CLI 编程 Agent，~84k+ stars。基于 Claude Agent SDK 构建，支持多步推理/文件编辑/命令执行/代码搜索
- [Cline](https://github.com/cline/cline) — VS Code 自主编程 Agent（前身 Claude Dev），~40k+ stars。支持 Claude/GPT/Gemini/DeepSeek 等多模型，终端访问/文件系统操作/浏览器集成/MCP 支持，人类审批机制
- [Aider](https://github.com/paul-gauthier/aider) — ~30k+ stars。终端 AI 结对编程工具，卓越的 Git 集成（每次变更自动提交），支持多文件上下文编辑，开发者喜爱的终端原生工作流
- [Continue](https://github.com/continuedev/continue) — ~25k+ stars。VS Code/JetBrains 开源 AI 编程助手，GitHub Copilot 的领先开源替代，高度可定制，支持本地模型
- [SWE-agent](https://github.com/princeton-nlp/SWE-agent) — 见上方自主 Agent 部分

### Agent Coding Enhancement
- [everything-claude-code](https://github.com/affaan-m/everything-claude-code) — Agent harness 性能优化系统：skills/instincts/memory/security/research-first 开发，支持 Claude Code/Codex/Cursor/OpenCode 等多 harness，含 38 个 Agent、156 个 skill、72 个命令
- [oh-my-claudecode](https://github.com/Yeachan-Heo/oh-my-claudecode) — Claude Code 多 Agent 编排插件，Teams-first 架构（plan→PRD→exec→verify→fix），魔法关键词触发、HUD 状态栏、技能学习、智能模型路由节省 30-50% token
- [oh-my-codex](https://github.com/Yeachan-Heo/oh-my-codex) — OpenAI Codex CLI 工作流层，提供 deep-interview→ralplan→team/ralph 标准工作流，专业 Agent 角色与技能系统，`.omx/` 持久化状态管理
- [oh-my-openagent](https://github.com/code-yeongyu/oh-my-openagent) — OpenCode 最强 Agent harness（前身 oh-my-opencode），多模型编排（Claude/Kimi/GLM/GPT），Sisyphus 纪律 Agent 系统 + Hash-Anchored 编辑工具 + LSP/AST-Grep 集成
- [oh-my-opencode-slim](https://github.com/alvinunreal/oh-my-opencode-slim) — oh-my-opencode 精简分支，大幅降低 token 消耗，7 个神话 Agent 角色（Orchestrator/Explorer/Oracle/Librarian/Designer/Fixer/Council），支持多 LLM 提供商混合

### Browser / GUI Agents
- [browser-use](https://github.com/browser-use/browser-use) — ~60k+ stars。Python 库让 AI Agent 控制浏览器，支持多标签/表单填写/数据提取，Manus 等平台的底层构建块
- [Anthropic Computer Use](https://docs.anthropic.com/en/docs/agents-and-tools/computer-use) — 首个主流 LLM 提供商原生 Computer Use。通过截图理解 GUI 并执行鼠标/键盘操作，Docker 沙箱环境
- [UFO](https://github.com/microsoft/UFO) — 微软 Windows UI 自动化 Agent，~15k+ stars。使用 GPT-4V 理解和交互 Windows 应用界面，支持多应用工作流
- [OmniParser](https://github.com/microsoft/OmniParser) — 微软，~15k+ stars。将截图解析为结构化可操作元素，使任何视觉模型都能成为 Computer Use Agent 的关键基础设施
- [OS-Copilot](https://github.com/OS-Copilot/OS-Copilot) — 通用 OS 交互框架，结合 GUI 理解与终端访问
- [LaVague](https://github.com/lavague-ai/LaVague) — Web Agent 框架，将自然语言指令转化为 Web 操作，适合 Web 测试/数据提取/任务自动化

### Multi-Agent Systems
- [CrewAI](https://github.com/crewAIInc/crewAI) — ~30k+ stars。最直观的多 Agent 框架，角色扮演式设计（角色/目标/背景故事），支持顺序/层次/并行任务执行，内置记忆系统
- [AutoGen](https://github.com/microsoft/autogen) — ~45k+ stars。最功能丰富的多 Agent 框架，结构化对话协作，0.4 版本重大架构重构，社区 fork 为 AG2
- [LangGraph](https://github.com/langchain-ai/langgraph) — ~10k+ stars。最灵活的多 Agent 编排，有向图控制流支持循环/分支/持久状态，与 LangChain 生态深度集成
- [Swarm](https://github.com/openai/swarm) — ~15k+ stars。OpenAI 实验性轻量多 Agent 框架，核心概念：routines（指令+工具）和 handoffs（Agent 间转移），是 Agents SDK 的前身
- [Agency Swarm](https://github.com/VRSEN/agency-swarm) — 基于 OpenAI API 的多 Agent 框架，预配置 Agent 角色和层次结构，面向企业实际用例
- [multica](https://github.com/multica-ai/multica) — 开源平台，将编程 Agent 变为真正的队友：分配 Issue、追踪进度、积累可复用技能，统一管理人类+Agent 团队，支持 Claude Code 和 Codex
- [open-multi-agent](https://github.com/JackChen-me/open-multi-agent) — TypeScript 多 Agent 框架，一次 `runTeam()` 调用从目标到结果，自动任务分解与并行执行，仅 3 个运行时依赖
- [PraisonAI](https://github.com/MervinPraison/PraisonAI) — 低代码多 Agent 框架，支持 handoffs/guardrails/memory/RAG/100+ LLM，可部署到 Telegram/Discord/WhatsApp 24/7 运行
- [Ruflo](https://github.com/ruvnet/ruflo) — 企业级 AI Agent 编排平台（前身 Claude Flow），100+ 专业 Agent 协调群体，自学习能力 + 拜占庭容错共识 + 智能路由，原生 Claude Code MCP 集成


## Protocols

### MCP (Model Context Protocol)
- [MCP](https://github.com/modelcontextprotocol) — Anthropic 开放协议，~30k+ stars（整个 org）。"AI 的 USB-C"：通用连接器标准，让任何 AI 模型通过标准化接口连接任何工具/数据源。已被 OpenAI、Google 等广泛采纳
- [MCP TypeScript SDK](https://github.com/modelcontextprotocol/typescript-sdk) / [Python SDK](https://github.com/modelcontextprotocol/python-sdk) — 构建 MCP 服务器和客户端的官方 SDK
- [MCP Servers](https://github.com/modelcontextprotocol/servers) — 官方服务器集合：filesystem / github / postgres / puppeteer / brave-search / google-maps / slack / memory 等
- [Awesome MCP Servers](https://github.com/punkpeye/awesome-mcp-servers) — 社区 MCP 服务器精选列表

### Google A2A (Agent-to-Agent Protocol)
- [A2A](https://github.com/google/A2A) — Google 开放协议（2025.4 发布），实现跨平台 Agent 互操作。50+ 公司支持（Atlassian/Salesforce/SAP 等）。基于 HTTP + JSON-RPC
  - Agent Cards：JSON 格式描述 Agent 能力/认证/输入输出模式
  - Task Lifecycle：结构化任务流程，Agent 间创建/更新/完成任务
  - Streaming & Push Notifications：实时任务进度流 + Webhook 通知
  - **MCP 连接 Agent 与工具，A2A 连接 Agent 与 Agent，互补而非竞争**


## Benchmarks
- [SWE-bench](https://www.swebench.com/) — 评估 AI 解决真实软件工程任务的业界标准。每个任务是真实 GitHub Issue + 对应 PR，通过单元测试通过率评估。有 Full/Lite/Verified（人工验证）三个变体。Devin/OpenHands/Cursor/SWE-agent 等均在此排名
- [WebArena](https://webarena.dev/) — 真实 Web 环境下 Agent 评估的金标准。使用真实自托管 Web 应用（非模拟 API），任务需多步交互：导航/表单填写/搜索/内容编辑，评估端到端任务完成率
- [AgentBench](https://github.com/THUNLP-MT/AgentBench) — 最全面的多域 Agent 评估基准，覆盖 OS/文件系统/Web 浏览/购物/数据库/卡牌游戏/谜题/家居管理 8 类环境，评估推理/决策/工具使用（清华）
- [OSWorld](https://os-world.github.io/) — GUI Agent 评估基准，将评估从 Web 扩展到完整 OS 交互。需要 GUI 理解、多应用协调和真实世界任务完成
- [The Agent Company](https://github.com/TheAgentCompany/the-agent-company) — Agent 在模拟软件公司中完成真实工作任务，评估多工具协作和职业任务完成能力
- [BFCL (Berkeley Function Calling Leaderboard)](https://github.com/ShishirPatil/gorilla) — 评估 LLM 函数/工具调用准确性：函数选择、参数提取、多工具编排


## Design Patterns
- **Prompt Chaining** — 将任务分解为顺序 LLM 调用，步骤间做程序化转换
- **Routing** — 分类输入并路由到专门处理器
- **Parallelization** — 并行执行独立任务（分段或投票）
- **Orchestrator-Workers** — 中央 LLM 动态分解任务并委派给 Worker LLM
- **Evaluator-Optimizer** — 一个 LLM 生成，另一个评估并反馈

> 何时使用 Agent：先用最简方案，仅在简单方法不够时才增加 Agent 复杂度。如果能完全枚举决策树，用工作流；需要 LLM 做判断，用 Agent。


## Memory
- [Mem0](https://github.com/mem0ai/mem0) — ~25k+ stars。Agent 记忆层，解决跨会话持久记忆的核心痛点。支持短期/长期/实体记忆，兼容任何 LLM 和向量数据库，可自部署或托管服务
- [Letta (前身 MemGPT)](https://github.com/letta-ai/letta) — ~15k+ stars。虚拟上下文管理框架，借鉴 OS 内存层次结构在主记忆和外部记忆间交换数据，使 Agent 能处理无限上下文
- [Zep](https://github.com/getzep/zep) — ~3k+ stars。从对话历史自动提取事实/摘要/结构化数据，提供知识图谱/事实记忆/时间感知，生产就绪

### Tool Execution & Sandboxing
- [E2B](https://github.com/e2b-dev/e2b) — ~8k+ stars。安全的云端沙箱环境，让 Agent 安全运行代码/执行命令。隔离微虚拟机，启动 < 150ms，OpenHands/Cursor 等在使用
- [Daytona](https://github.com/daytonaio/daytona) — ~15k+ stars。安全开发环境管理器，E2B 的开源替代，提供一致可复现的开发环境

### Reasoning & Optimization
- [DSPy](https://github.com/stanfordnlp/dspy) — ~22k+ stars。用算法优化 LM 提示和权重，声明式编程范式替代手动提示工程（Stanford NLP）
- [Tree of Thoughts](https://github.com/princeton-nlp/tree-of-thought-llm) — Agent 规划的基础技术，LLM 探索多条推理路径并评估进展，广泛用于 Agent 架构


## Tools

### Agent Building Platforms (Low-Code)
- [Dify](https://github.com/langgenius/dify) — 见上方 Development Platforms
- [n8n](https://n8n.io/) — 见上方 Development Platforms
- [Flowise](https://github.com/FlowiseAI/Flowise) — 见上方 Development Platforms
- [LangFlow](https://github.com/langflow-ai/langflow) — LangChain 组件的可视化编排工具，~50k+ stars

### Browser Automation
- [Playwright](https://github.com/microsoft/playwright) — ~70k+ stars。微软浏览器自动化框架，browser-use/OpenHands 等的底层引擎，支持 Chromium/Firefox/WebKit


## Resources
- [Building Effective Agents — Anthropic](https://www.anthropic.com/engineering/building-effective-agents)
- [LangGraph Documentation](https://langchain-ai.github.io/langgraph/) — 官方文档、教程与 How-to 指南
- [Awesome LLM Agents](https://github.com/kaushikb11/awesome-llm-agents) — LLM Agent 资源精选列表
- [LLM Agent Paper List](https://github.com/AGI-Edgerunners/LLM-Agents-Papers) — LLM Agent 论文合集

