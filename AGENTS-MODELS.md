# Agents & Models

A reference guide for configuring models and agents when using OpenCode Skills.

---

## Overview

Every OpenCode command can be customized with two optional flags:

```bash
opencode --model [model-name] --agent [agent-name] "by using [skill], [request]"
```

- **Model** — controls which AI model processes your request (speed, depth, cost)
- **Agent** — controls the role and behavior context OpenCode adopts for the task

Both are optional. If omitted, OpenCode uses your configured defaults.

OpenCode supports models from many providers — not just Claude. You can use free and open-source models locally via Ollama, free-tier models from Google, Groq, and others, or paid models from Anthropic, OpenAI, and more. All skills in this library are model-agnostic and work regardless of which model you choose.

---

## Models

### Model Providers

OpenCode works with a wide range of models across different providers. Here's an overview of what's available:

#### Free Options

| Provider | Model | Notes |
|----------|-------|-------|
| **Ollama** (local) | `llama3.2`, `mistral`, `codellama`, `phi3`, `gemma2`, and more | Fully free, runs offline, no API key needed |
| **Google AI Studio** | `gemini-1.5-flash`, `gemini-2.0-flash` | Free tier with generous limits |
| **Groq** | `llama-3.1-70b`, `mixtral-8x7b`, `gemma2-9b` | Free tier, very fast inference |
| **Mistral** | `mistral-small` | Free tier available |
| **Cohere** | `command-r` | Free tier available |
| **OpenRouter** | Various open-source models | Free tier with access to many models |

#### Paid Options

| Provider | Model | Notes |
|----------|-------|-------|
| **Anthropic**  | `claude-haiku-3.5`, `claude-sonnet-4`, `claude-opus-4.6` | Recommended for best results |
| **OpenAI** | `gpt-4o-mini`, `gpt-4o`, `gpt-4-turbo` | Widely used, strong general performance |
| **Google** | `gemini-1.5-pro`, `gemini-2.0-pro` | Strong at long-context tasks |
| **Mistral** | `mistral-large`, `mistral-medium` | Good at code and structured tasks |

> **Why Claude is recommended:** Anthropic's Claude models tend to perform best at following complex skill instructions, maintaining context across long prompts, and producing structured, accurate output. That said, the skills here are written to work well with any capable model — use what fits your budget and needs.

---

### Free Model Setup

**Ollama (local, fully free):**
```bash
# Install Ollama
curl -fsSL https://ollama.ai/install.sh | bash

# Pull a model
ollama pull llama3.2
ollama pull codellama    # good for coding skills
ollama pull mistral      # good general purpose

# Use with OpenCode
opencode --model ollama/llama3.2 "by using python-assistant, explain list comprehensions"
opencode --model ollama/codellama "by using code-reviewer, review this file" < main.py
```

**Google AI Studio (free tier):**
```bash
# Set your API key (get one free at aistudio.google.com)
export GOOGLE_API_KEY=your_key_here

opencode --model gemini-2.0-flash "by using technical-writer, write a README for this project"
```

**Groq (free tier, very fast):**
```bash
# Set your API key (get one free at console.groq.com)
export GROQ_API_KEY=your_key_here

opencode --model groq/llama-3.1-70b "by using sql-assistant, optimize this query"
```

**OpenRouter (free tier, many models):**
```bash
# Set your API key (get one free at openrouter.ai)
export OPENROUTER_API_KEY=your_key_here

opencode --model openrouter/meta-llama/llama-3.2-90b "by using web-pentest-tools, explain XSS"
```

---

### Claude Models (Recommended)

If you have an Anthropic API key, Claude models generally give the best results with these skills:

| Model | Speed | Best For | Pricing |
|-------|-------|----------|---------|
| `claude-haiku-3.5` | Fast | Quick lookups, simple Q&A, high-volume tasks | Lowest cost |
| `claude-sonnet-4` | alanced | General use — recommended default | Mid-range |
| `claude-opus-4.6` | Thorough | Complex analysis, long documents, multi-step tasks | Highest cost |

```bash
# Set your Anthropic API key
export ANTHROPIC_API_KEY=your_key_here

opencode --model claude-haiku-3.5 "by using sql-assistant, what is a LEFT JOIN?"
opencode --model claude-sonnet-4 "by using python-assistant, refactor this function for readability"
opencode --model claude-opus-4.6 "by using web-pentest-tools, create a full security audit plan"
```

See [Anthropic's pricing page](https://anthropic.com/pricing) for current rates.

---

### Choosing the Right Model

Regardless of provider, think about your choice along these axes:

| Priority | Go for |
|----------|--------|
| Free / no budget | Ollama (local) or free-tier cloud models |
| Speed | Groq, `claude-haiku-3.5`, `gemini-2.0-flash` |
| Code tasks | `codellama` (Ollama), `claude-sonnet-4`, `gpt-4o` |
| Long documents | Claude or Gemini (large context windows) |
| Privacy / offline | Ollama — nothing leaves your machine |
| Best overall quality | `claude-sonnet-4` or `claude-opus-4.6` |

---

### Setting a Default Model

Avoid typing `--model` every time by setting a default:

```bash
# Free option
opencode config set default-model ollama/llama3.2

# Paid option
opencode config set default-model claude-sonnet-4
```

Check your current default:

```bash
opencode config get default-model
```

List all available models on your setup:

```bash
opencode list-models
```

---

## Agents

Agents give OpenCode a specific role and behavioral context. They shape how responses are framed, what level of detail is expected, and what conventions to follow — without changing the underlying model.

### Available Agents

| Agent | Role | Best Paired With |
|-------|------|-----------------|
| `default` | General-purpose assistant | Any skill |
| `penetration-testing` | Security researcher and ethical hacker | `web-pentest-tools`, `api-security`, `osint` |
| `reconnaissance` | Information gathering specialist | `web-pentest-tools`, `osint` |
| `exploit-development` | Vulnerability researcher | `web-pentest-tools`, `api-security` |
| `code-review` | Senior engineer focused on quality and correctness | `code-reviewer`, `python-assistant`, `web-dev-helper` |
| `automation` | Systems engineer focused on scripting and pipelines | `workflow-automation`, `ci-cd-helper`, `docker-guide` |
| `data-analysis` | Data analyst focused on insight extraction | `data-analyzer`, `sql-assistant`, `log-processor` |
| `technical-writing` | Documentation specialist | `technical-writer`, `blog-generator` |
| `devops` | Infrastructure and deployment engineer | `docker-guide`, `ci-cd-helper`, `workflow-automation` |
| `educator` | Patient, example-driven teacher | `coding-tutor`, `interview-prep`, `ctf-solver` |

### When to Use an Agent

Most skills work fine with the `default` agent. Use a specialized agent when:

- You want responses framed from a specific professional perspective
- The task has domain-specific conventions (e.g. a security report vs a code review)
- You're doing a complex, multi-turn workflow in one domain

```bash
# Default agent — works for most tasks
opencode "by using python-assistant, explain decorators"

# Specialized agent — adds professional framing
opencode --agent educator "by using python-assistant, explain decorators to a beginner"
opencode --agent code-review "by using python-assistant, review this module for anti-patterns"
```

### Setting a Default Agent

```bash
opencode config set default-agent default
```

---

## Combining Models, Agents & Skills

### Reference Table

| Task Type | Free Model Option | Paid Model Option | Agent | Example Skill |
|-----------|------------------|-------------------|-------|---------------|
| Quick question | `ollama/llama3.2` | `claude-haiku-3.5` | `default` | Any |
| Code refactor | `ollama/codellama` | `claude-sonnet-4` | `code-review` | `python-assistant` |
| Security audit | `groq/llama-3.1-70b` | `claude-opus-4.6` | `penetration-testing` | `web-pentest-tools` |
| Writing docs | `gemini-2.0-flash` | `claude-sonnet-4` | `technical-writing` | `technical-writer` |
| Learning a concept | `ollama/mistral` | `claude-sonnet-4` | `educator` | `coding-tutor` |
| Data pipeline | `groq/mixtral-8x7b` | `claude-sonnet-4` | `data-analysis` | `data-analyzer` |
| CI/CD setup | `ollama/llama3.2` | `claude-opus-4.6` | `devops` | `ci-cd-helper` |
| Batch scripting | `gemini-2.0-flash` | `claude-haiku-3.5` | `automation` | `workflow-automation` |
| CTF challenge | `groq/llama-3.1-70b` | `claude-opus-4.6` | `penetration-testing` | `ctf-solver` |
| API design review | `ollama/codellama` | `claude-opus-4.6` | `code-review` | `api-security` |

### Examples

**Free (Ollama, local):**
```bash
opencode --model ollama/llama3.2 \
  "by using sql-assistant, what is the difference between WHERE and HAVING?"
```

**Free (Groq cloud):**
```bash
opencode --model groq/llama-3.1-70b --agent code-review \
  "by using code-reviewer, review this PR diff for bugs and style issues" < diff.txt
```

**Free (Google Gemini):**
```bash
opencode --model gemini-2.0-flash --agent technical-writing \
  "by using technical-writer, write API reference docs for these endpoints" < openapi.yaml
```

**Paid (Claude — best results):**
```bash
opencode --model claude-opus-4.6 --agent penetration-testing \
  "by using web-pentest-tools, create a full testing methodology for a SaaS login flow"
```

**Multi-skill task (any capable model):**
```bash
opencode --model ollama/codellama --agent technical-writing \
  "by using python-assistant and technical-writer, document this module with docstrings and a README"
```

---

## Configuration Reference

### View All Config

```bash
opencode config list
```

### Set Defaults

```bash
opencode config set default-model ollama/llama3.2   # free local option
opencode config set default-model claude-sonnet-4   # paid recommended option
opencode config set default-agent default
```

### Reset to Defaults

```bash
opencode config reset
```

### Config File Location

OpenCode stores config at:

| Platform | Path |
|----------|------|
| Linux / macOS | `~/.opencode/config.yaml` |
| Windows | `%APPDATA%\opencode\config.yaml` |

Example `config.yaml` using a free local model:

```yaml
default-model: ollama/llama3.2
default-agent: default
skills-dir: ~/.opencode/skills/
```

Example `config.yaml` using Claude:

```yaml
default-model: claude-sonnet-4
default-agent: default
skills-dir: ~/.opencode/skills/
```

---

## Troubleshooting

**`--model` flag not recognized:**
Make sure you're on the latest version of OpenCode:
```bash
opencode --version
# update if needed
curl -fsSL https://opencode.sh/install.sh | bash
```

**Ollama model not found:**
Make sure Ollama is running and the model is pulled:
```bash
ollama serve          # start Ollama if not running
ollama pull llama3.2  # pull the model first
ollama list           # see what's available locally
```

**API key errors:**
Each provider needs its own environment variable:
```bash
export ANTHROPIC_API_KEY=...    # Claude
export OPENAI_API_KEY=...       # OpenAI
export GOOGLE_API_KEY=...       # Gemini
export GROQ_API_KEY=...         # Groq
export OPENROUTER_API_KEY=...   # OpenRouter
```

**Model not available:**
List what's available on your installation:
```bash
opencode list-models
```

**Agent not behaving as expected:**
Agents shape tone and framing — they don't guarantee specific output formats. If you need a specific output structure, include that in your prompt directly:
```bash
opencode --agent code-review "by using code-reviewer, review this file and respond as a numbered list of issues" < file.py
```

**Slower or weaker responses with free models:**
Free and local models vary in capability. For complex tasks, try a larger model or switch to a paid option. For Ollama, larger parameter models (e.g. `llama3.2:70b`) give better results but need more RAM.

**Inconsistent results across runs:**
LLMs are non-deterministic by default. For tasks requiring reproducibility (e.g. batch processing), keep prompts as specific and constrained as possible, and consider scripting the calls.

---

## Further Reading

- [QUICK-START.md](./QUICK-START.md) — get up and running
- [SKILLS-GUIDE.md](./SKILLS-GUIDE.md) — browse all available skills
- [HOW-TO-CONTRIBUTE.md](./HOW-TO-CONTRIBUTE.md) — add your own skill
- [OpenCode Docs](https://opencode.sh/docs) — official OpenCode documentation
- [Ollama Models](https://ollama.ai/library) — browse available local models
- [OpenRouter Models](https://openrouter.ai/models) — browse free and paid cloud models

---

<div align="center">

**[← Back to README](./README.md)** · **[Browse Skills](./SKILLS-GUIDE.md)** · **[Quick Start](./QUICK-START.md)**

</div>
