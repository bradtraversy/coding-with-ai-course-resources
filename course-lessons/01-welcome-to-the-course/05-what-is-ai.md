# What Is AI?

Before getting into the workflow side of this course, it's worth taking a moment to define what we're actually working with. I won't go deep into theory, but there are a few concepts and terms that will come up constantly — and understanding them will make everything else click faster.

## The Broad Definition

Artificial Intelligence is a broad term for machines that can perform tasks that typically require human intelligence. Within that, there are several categories:

**Computer Vision** — AI that processes and interprets visual information from images and video. Think facial recognition, self-driving cars, and medical imaging.

**Predictive AI** — Analyzes historical data to identify patterns and forecast outcomes. Netflix and Spotify recommendations, fraud detection, and stock market forecasting all fall here.

**Generative AI** — Creates new content that didn't previously exist. Rather than analyzing or predicting, it produces original outputs: text (ChatGPT, Claude), images (Midjourney, DALL-E), code (Copilot, Cursor), audio (ElevenLabs), music (Suno), video (Sora).

When most people say "AI" today, they mean generative AI. That's what we're using in this course.

## Large Language Models

The tools we'll be working with are powered by **Large Language Models**, or LLMs. At their core, LLMs are prediction machines. They've been trained on billions of web pages, books, articles, and code repositories, and through that training they learned patterns in language and text. When you give one a prompt, it's predicting what text should come next based on everything it absorbed during training.

It's tempting to think of AI as some kind of conscious entity — it's not. It's sophisticated pattern matching. Extremely useful, but not alive. At least not yet.

## How LLMs Are Trained

**Pre-training** — The model ingests a massive dataset of text: the internet, books, code, articles, all of it. It learns language patterns, facts, reasoning structures, and syntax. This is the expensive part, costing millions of dollars in compute.

**Fine-tuning** — The base model gets refined for specific tasks, learning to be helpful, follow instructions, and format responses clearly.

**RLHF (Reinforcement Learning from Human Feedback)** — Humans rate the model's responses. The model learns from that feedback over time. This is a big reason why tools like Claude and ChatGPT feel genuinely useful rather than just producing raw text.

## What LLMs Are Good At

- Explaining concepts in plain language
- Writing and editing text
- Generating code in virtually any language
- Answering questions and providing context
- Brainstorming and ideation
- Translating between languages
- Summarizing long documents
- Following complex, multi-step instructions

## What LLMs Are Not Good At

**They hallucinate.** LLMs can confidently produce information that sounds correct but isn't. They'll invent API methods that don't exist, cite papers that were never written, or generate code that looks right but has subtle bugs. This is one of the biggest reasons you can't just accept AI output at face value.

**They don't actually "know" anything.** There's no database of facts inside an LLM — it's all patterns. Sometimes those patterns produce accurate information. Sometimes they don't.

**They don't learn during a conversation.** You can correct an LLM mid-session and it will adjust, but it doesn't actually retain that learning. Start a new conversation and the same mistakes are possible.

**They have knowledge cutoffs.** Models are trained on data up to a certain point in time. Anything after that date is unknown to them unless they have access to search tools.

**Their "reasoning" isn't what you think.** When an LLM works through a problem, it's still doing pattern matching — not logic in the way humans do logic. This produces impressive results a lot of the time, but it also fails in unexpected ways.

## Key Players

**OpenAI** — Created ChatGPT and the GPT model series. They kicked off this era with ChatGPT's release in late 2022.

**Anthropic** — Created Claude, which we'll be using heavily in this course. Founded by former OpenAI researchers with a strong focus on AI safety.

**Google** — Has Gemini (formerly Bard), and does significant foundational AI research.

**Meta** — Released LLaMA as open source. A large number of other tools are built on top of it.

**Others** — Mistral, Cohere, and a growing number of smaller players, particularly in the open-source space.