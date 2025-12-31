# What Is AI?

Before we get started learning how to code with AI, let's first define what it is exactly. I won't get into too much theory here, but it's important to know what we're dealing with and there's some important terms you should know.

AI, or Artificial Intelligence, is a broad term for machines that can perform tasks that typically require human intelligence.

There are different categories of AI.

**Computer Vision**: Facial recognition, self-driving cars, medical imaging, exactly
**Predictive AI**: Netflix/Spotify recommendations, fraud detection, stock market forecasting
**Generative AI**: Text generation (ChatGPT, Claude), Image generation (Midjourney, DALL-E), code generation (CoPilot, Cursor), audio/voice generation (ElevenLabs), music generation (Suno, Runway), video generation (Sora, Udio)

When most people say "AI" today, they're usually talking about **generative AI**. That's the stuff that can create new content - write text, generate images, produce code. Tools like ChatGPT, Claude, Midjourney - that's all generative AI.

## LARGE LANGUAGE MODELS (LLMs)

The AI tools we'll be using in this course are powered by something called **Large Language Models**

At its core, an LLM is a prediction machine. It's been trained on massive amounts of text. It's been trained on billions of web pages, books, articles, code repositories, and it learned patterns in that text. When you give it a prompt, it's predicting what text should come next based on everything it learned.

People think of AI as some conscious entity, but it's not. It's sophisticated pattern matching. Very useful, but not alive. At least yet 😐 Let's move on.

## HOW LLMs ARE TRAINED

Here's a simplified version of how these models get built:

**Step 1: Pre-training**
The model ingests a massive dataset of text from the internet, books, code, articles - everything. It learns language patterns, facts, reasoning structures, coding syntax. This is the expensive part that costs millions of dollars in compute.

**Step 2: Fine-tuning**
The base model gets refined for specific tasks. This is where it learns to be helpful, to follow instructions, to format responses nicely.

**Step 3: RLHF (Reinforcement Learning from Human Feedback)**
Humans rate the model's responses. "This answer was helpful, this one wasn't." The model learns from that feedback to produce better outputs. This is a big part of why Claude and ChatGPT feel helpful rather than just spitting out random text.

## WHAT LLMs ARE GOOD AT

- Explaining concepts in plain language
- Writing and editing text
- Generating code in pretty much any language
- Answering questions and providing information
- Brainstorming and ideation
- Translating between languages
- Summarizing long documents
- Following complex instructions

## WHAT LLMs ARE NOT GOOD AT

Let's be real about the limitations:

**They hallucinate.** LLMs can confidently make up information that sounds correct but isn't. They'll invent API methods that don't exist, cite papers that were never written, or give you code that looks right but has subtle bugs.

**They don't actually "know" anything.** There's no database of facts in there. It's all patterns. Sometimes those patterns produce accurate information, sometimes they don't.

**They can't learn during a conversation.** If you correct an LLM, it might adjust in that conversation, but it doesn't actually learn. Next conversation, same mistakes are possible.

**They have knowledge cutoffs.** The model was trained on data up to a certain date. Anything after that, it doesn't know unless it has access to search.

**They're not reasoning the way you think.** When an LLM "thinks through" a problem, it's still doing pattern matching. It's not logic in the way humans do logic. Sometimes this produces great results, sometimes it fails in weird ways.

## KEY PLAYERS YOU SHOULD KNOW

**OpenAI** - Created ChatGPT and the GPT model series. They kicked off this whole era with ChatGPT in late 2022.

**Anthropic** - Created Claude (what we'll be using a lot in this course). Founded by former OpenAI researchers with a focus on AI safety.

**Google** - Has Gemini (formerly Bard). Also does a lot of foundational AI research.

**Meta** - Released LLaMA, which is open source. A lot of other tools are built on top of it.

**Smaller Players** - Mistral, Cohere, and others making solid models, especially in the open source space.

## WHY THIS MATTERS FOR DEVELOPERS

Here's the bottom line: LLMs are a tool. A really powerful tool, but still a tool.

They're not going to replace developers. But developers who know how to use these tools effectively will absolutely outpace developers who don't.

Think about it like this: calculators didn't replace mathematicians. IDEs didn't replace programmers. But imagine trying to compete today without those tools.

That's where we're headed with AI. It's not about letting the AI do your job. It's about leveraging it to do your job faster, better, and with less friction.

In this course, you're going to learn how to use AI the right way - not as a crutch, but as a force multiplier. You'll understand when to use it, when not to use it, and how to get the best results when you do.

Let's get into it.
