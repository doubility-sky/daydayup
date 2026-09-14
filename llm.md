# 大语言模型 (LLM)

大语言模型（Large Language Model, LLM）是一种基于深度学习的自然语言处理技术。它通过训练大量的文本数据，能够理解和生成自然语言文本。以下是 LLM 的一些关键特点：

1. **大规模数据训练**：LLM 通常在海量的文本数据上进行训练，能够捕捉语言中的复杂模式和结构。
2. **多任务能力**：LLM 可以执行多种自然语言处理任务，如文本生成、翻译、问答、摘要等。
3. **上下文理解**：LLM 能够理解上下文信息，从而生成连贯且有意义的文本。
4. **迁移学习**：通过预训练和微调，LLM 可以适应不同的应用场景和任务需求。

LLM 的代表性模型包括 OpenAI 的 GPT 系列、Google 的 BERT 和 T5 等。这些模型在各类自然语言处理任务中表现出色，推动了人工智能技术的发展。


- [[artificial-intelligence]]
  - [[machine-learning]]
- Chat Now
  - [ChatGPT](https://chat.openai.com)
  - [Gemini](https://gemini.google.com/)
  - [Microsoft Copilot](https://copilot.microsoft.com/) is your digital companion designed to inform, entertain, and inspire. Using advanced AI, Copilot understands your questions and requests, provides direct answers, assists with writing, and even creates images. It's like having a smart, helpful friend at your fingertips!
  - [Grok](https://x.com/i/grok?focus=1) is an AI developed by xAI, designed to provide helpful and truthful answers to a wide range of questions. 
  - [Duck.ai](https://duck.ai/): Anonymous access to popular AI models, including GPT-4o mini, Claude 3, and open-source Llama 3.3 and Mistral.
  - [Poe](https://poe.com/): The best AI, all in one place


## Learn
- [Build a Large Language Model (From Scratch)](https://github.com/rasbt/LLMs-from-scratch), Implement a ChatGPT-like LLM in PyTorch from scratch, step by step
- [Hugging Face](https://huggingface.co/): Transformers, Datasets, Tokenizers, and more

### Ranks
- [🦁 WildBench: Benchmarking LLMs with Challenging Tasks from Real Users in the Wild](https://huggingface.co/spaces/allenai/WildBench)
- [🏆 Chatbot Arena LLM Leaderboard: Community-driven Evaluation for Best LLM and AI chatbots](https://lmarena.ai/?leaderboard)
- [LLM Pricing](https://llmpricecheck.com/): Compare and calculate the latest prices for LLM (Large Language Models) APIs from leading providers such as OpenAI GPT-4, Anthropic Claude, Google Gemini, Mate Llama 3, and more. Use our streamlined LLM Price Check tool to start optimizing your AI budget efficiently today!


## Development

### Frameworks
- [LangChain](https://github.com/langchain-ai/langchain) is a framework for developing applications powered by large language models (LLMs).
- [LlamaIndex](https://github.com/run-llama/llama_index) is the leading framework for building LLM-powered agents over your data.
- [Dify](https://github.com/langgenius/dify) is an open-source LLM app development platform. Its intuitive interface combines agentic AI workflow, RAG pipeline, agent capabilities, model management, observability features and more, letting you quickly go from prototype to production.

### Engines
- [FastChat](https://github.com/lm-sys/FastChat) is an open platform for training, serving, and evaluating large language model based chatbots.
- [vLLM](https://github.com/vllm-project/vllm): A high-throughput and memory-efficient inference and serving engine for LLMs
- [Text Generation Inference](https://github.com/huggingface/text-generation-inference): A Rust, Python and gRPC server for text generation inference. Used in production at Hugging Face to power Hugging Chat, the Inference API and Inference Endpoint. :warning: 仓库已 archived（2026-03 起只读）

### Local Deployment
- [LM Studio](https://lmstudio.ai/): Discover, download, and run local LLMs
- [ollama](https://github.com/ollama/ollama): Get up and running with Kimi-K2.6, GLM-5.2, MiniMax, DeepSeek, gpt-oss, Qwen, Gemma and other models.
   - Ollama is a simple, easy-to-use tool for running large language models on your own machine. Running a model locally requires downloadable weights — Llama, Qwen, DeepSeek, Mistral, Gemma, Phi, and OpenAI's open-weight `gpt-oss`. The GPT-3/GPT-4 weights were never released, so those models cannot run under Ollama at all; some newer models are offered only as Ollama cloud models, which execute on Ollama's servers rather than on your machine.


## GPT
GPT (Generative Pre-trained Transformer) 是由 OpenAI 开发的大语言模型系列。从 GPT-1 到 GPT-4，每一代模型都带来了显著的性能提升。以下是 GPT 系列的主要特点：

1. **自回归语言模型**：GPT 使用 Transformer 架构的解码器部分，通过预测下一个词来生成文本。
2. **大规模预训练**：在海量文本数据上进行无监督学习，掌握语言的基本规律。
3. **强大的生成能力**：能够生成连贯、流畅、符合上下文的文本内容。
4. **零样本学习**：无需特定任务的训练数据，就能完成各种自然语言任务。

相关资源：
- [OpenAI GPT-4](https://openai.com/gpt-4)
- [GPT-3 论文](https://arxiv.org/abs/2005.14165)
- [ChatGPT](https://chat.openai.com)
- [OpenAI Platform](https://platform.openai.com/)：API 服务


## [Claude](https://claude.ai/)
- Developed by Anthropic, focusing on safer AI interactions  
- Provides context-aware responses for multi-turn conversations  
- Offers a user-friendly API for seamless integration  
- Continuously enhanced with iterative feedback mechanisms  


## Gemini
Gemini 是 Google 在 2023 年推出的多模态大语言模型，被认为是 Google 对 GPT-4 的直接竞争产品。主要特点包括：

1. **多模态理解**：能够同时处理文本、图像、音频和视频等多种形式的输入。
2. **原生多模态**：从训练开始就采用多模态架构，而非后期组合。
3. **三种规格**：Ultra、Pro 和 Nano，适应不同场景需求。
4. **实时推理**：具备强大的实时分析和推理能力。

相关资源：
- [Google Gemini](https://blog.google/technology/ai/google-gemini-ai/)
- [Google AI Studio](https://makersuite.google.com/)
- [Gemini API](https://ai.google.dev/)


## LLaMA
LLaMA（Large Language Model Meta AI）是由 Meta（前 Facebook）开发的大语言模型。
LLaMA 旨在通过更高效的训练和更少的计算资源，提供与其他大型语言模型相媲美的性能。以下是 LLaMA 的一些关键特点：

1. **高效训练**：LLaMA 采用了优化的训练方法，使其在相对较少的计算资源下，仍能达到高性能。
2. **模块化设计**：LLaMA 的架构设计模块化，便于在不同任务和应用场景中进行调整和优化。
3. **开放研究**：Meta 提供了 LLaMA 的开源版本，促进了学术界和工业界的研究和合作。
4. **多语言支持**：LLaMA 支持多种语言，能够处理跨语言的自然语言处理任务。

LLaMA 的推出为自然语言处理领域提供了新的工具和方法，进一步推动了大语言模型技术的发展和应用。LLaMA

- [LLaMA 论文页](https://ai.meta.com/research/publications/llama-open-and-efficient-foundation-language-models/)
- [LLaMA 论文](https://arxiv.org/abs/2302.13971)
- [LLaMA 模型下载](https://github.com/meta-llama/llama-models) —— 原 [meta-llama/llama](https://github.com/meta-llama/llama) 自 Llama 3.1 起官方标记为 deprecated，只保留 Llama 2
- [llama.cpp](https://github.com/ggml-org/llama.cpp): Inference of Meta's [LLaMA](https://arxiv.org/abs/2302.13971) model (and others) in pure C/C++


## [Grok](https://x.ai/grok)
Grok is a fresh creation by x.ai, designed with a playful spirit and a knack for keen language insights. 
It delivers engaging text outputs with surprising originality, making it a smart choice for anyone looking to elevate their content generation process.


## [DeepSeek](https://www.deepseek.com/)
DeepSeek, unravel the mystery of AGI with curiosity. Answer the essential question with long-termism.

- [通用对话](https://chat.deepseek.com/)
- [开放平台](https://platform.deepseek.com)
- [github deepseek-ai](https://github.com/deepseek-ai)
- [Awesome DeepSeek Integrations](https://github.com/deepseek-ai/awesome-deepseek-integration)


## API 
- [One API](https://github.com/songquanpeng/one-api), LLM API management & key redistribution system, unifying multiple providers under a single API. Single binary, Docker-ready, with an English UI.

### Providers
- [OpenRouter](https://openrouter.ai/), Discover and use the latest LLMs. 300+ models, explorable data, private chat, & a unified API.
- [SiliconFlow](https://siliconflow.cn/), SiliconCloud 基于优秀的开源基础模型，提供高性价比的 GenAI 服务。
   - [使用手册](https://docs.siliconflow.cn)


## AI for Programming

### GitHub Copilot
Copilot 是由 GitHub 开发的 AI 编程助手，旨在提高开发者的生产力和代码质量。以下是 Copilot 的一些主要特点：

1. **代码补全**：基于上下文提供智能代码补全建议，帮助开发者快速编写代码。
2. **多语言支持**：支持多种编程语言，包括 Python、JavaScript、TypeScript、Ruby 等。
3. **学习和适应**：通过分析开发者的编码风格和项目上下文，提供个性化的建议。
4. **集成开发环境**：与 Visual Studio Code 等主流 IDE 无缝集成，提升开发体验。

相关资源：
- [GitHub Copilot](https://github.com/features/copilot)
- [Copilot 文档](https://docs.github.com/en/copilot)
- [Copilot 常见问题](https://github.com/orgs/community/discussions/categories/copilot)


## Tools
- [AnythingLLM](https://github.com/Mintplex-Labs/anything-llm): The all-in-one AI app you were looking for. Chat with your docs, use AI Agents, hyper-configurable, multi-user, & no frustrating set up required.

### Desktop Client
- [Chatbox](https://github.com/chatboxai/chatbox) is a desktop client for ChatGPT, Claude and other LLMs, available on Windows, Mac, Linux
- [🍒 Cherry Studio](https://github.com/CherryHQ/cherry-studio) is a desktop client that supports for multiple LLM providers. Support deepseek-r1

### Web Client
- [Open WebUI](https://github.com/open-webui/open-webui) is an extensible, feature-rich, and user-friendly self-hosted AI platform designed to operate entirely offline. 
It supports various LLM runners like Ollama and OpenAI-compatible APIs, with built-in inference engine for RAG, making it a powerful AI deployment solution.
- [Page Assist](https://github.com/n4ze3m/page-assist) is an open-source browser extension that provides a sidebar and web UI for your local AI model. It allows you to interact with your model from any webpage.

### Others
- [DeepAI](https://deepai.org)
- [AI Dungeon](https://play.aidungeon.io)


## FAQs
1. **如何选择合适的 LLM？**
   - 考虑因素：计算资源、隐私需求、特定任务性能、成本等
   
2. **如何微调 LLM？**
   - 常用方法：LoRA、P-Tuning、Prompt-tuning 等
   
3. **开源模型与闭源模型如何选择？**
   - 开源优势：可定制、本地部署、成本可控
   - 闭源优势：性能稳定、维护成本低、即用即得


## Resources
- [🤗 Transformers](https://github.com/huggingface/transformers) provides thousands of pretrained models to perform tasks on different modalities such as text, vision, and audio.
- [awesome-LLM](https://github.com/Hannibal046/Awesome-LLM): A curated list of large language model resources and tools
- [awesome-ChatGPT-repositories](https://github.com/taishi-i/awesome-ChatGPT-repositories)
- [prompts.chat](https://github.com/f/prompts.chat)（原 awesome-chatgpt-prompts）: Share, discover, and collect prompts from the community. Free and open source — self-host for your organization with complete privacy.
- [Awesome ChatGPT API](https://github.com/reorx/awesome-chatgpt-api): Curated list of apps and tools that not only use the new ChatGPT API, but also allow users to configure their own API keys, enabling free and on-demand usage of their own quota.
