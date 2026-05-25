# OpenCode Skills

**A community-driven skills library for [OpenCode](https://opencode.sh)**

> Extend OpenCode with specialized SKILL.md files across any domain — security, development, data, writing, automation, and more.

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Contributions Welcome](https://img.shields.io/badge/contributions-welcome-brightgreen)

---

## What is This?

**OpenCode Skills** is a community-maintained library of SKILL.md files that extend [OpenCode](https://opencode.sh)'s capabilities. Each skill is a focused knowledge base in Markdown format — covering a specific tool, workflow, or domain — that you reference directly in your prompts.

Think of it as a **plugin system for AI-powered workflows**. Pick the skills you need, drop them into OpenCode, and get expert-level assistance without switching tools.

---

## Quick Start (3 Minutes)

### Step 1: Install OpenCode
```bash
# Linux/macOS
curl -fsSL https://opencode.sh/install.sh | bash

# macOS (Homebrew)
brew install opencode

# Windows (PowerShell as Admin)
# Download from https://opencode.sh
```

### Step 2: Install Skills
```bash
# Clone this repository
git clone https://github.com/yourusername/opencode-skills.git
cd opencode-skills

# Copy all skills to OpenCode
cp -r skills/* ~/.opencode/skills/
```

### Step 3: Use a Skill
```bash
opencode "by using [skill-name], [your request]"
```

**Done!** You now have access to all skills.

---

## How to Use Skills

Every skill follows the same simple pattern:

```bash
opencode "by using [SKILL-NAME], [your request]"
```

**With model selection:**
```bash
opencode --model claude-sonnet-4 "by using python-assistant, refactor this function"
```

**With agent selection:**
```bash
opencode --agent automation "by using workflow-automation, schedule this task"
```

**Combined:**
```bash
opencode --model claude-opus-4.6 --agent penetration-testing \
  "by using web-pentest-tools, audit this API for security vulnerabilities"
```

---

## Skills Directory

| Category | Skill | Description | Status |
|----------|-------|-------------|--------|
| Security | `web-pentest-tools` | Web application penetration testing — OWASP Top 10, 50+ tools, 600+ payloads | ✅ Available |
| Security | `api-security` | REST and GraphQL API security testing | 🔄 Planned |
| Security | `cloud-security` | AWS, Azure, and GCP penetration testing | 🔄 Planned |
| Security | `osint` | Open-source intelligence gathering techniques | 🔄 Planned |
| Development | `python-assistant` | Python patterns, best practices, and debugging | 🔄 Planned |
| Development | `web-dev-helper` | HTML, CSS, JS, and modern framework guidance | 🔄 Planned |
| Development | `code-reviewer` | Code review methodology and quality checklist | 🔄 Planned |
| Development | `git-workflows` | Git branching strategies, history management | 🔄 Planned |
| Data & Analysis | `data-analyzer` | Data cleaning, EDA, and visualization | 🔄 Planned |
| Data & Analysis | `sql-assistant` | Query writing, optimization, and schema design | 🔄 Planned |
| Data & Analysis | `log-processor` | Log parsing, aggregation, and analysis | 🔄 Planned |
| Writing & Content | `technical-writer` | Docs, READMEs, specs, and API references | 🔄 Planned |
| Writing & Content | `blog-generator` | Blog post structure, tone, and SEO | 🔄 Planned |
| Writing & Content | `prompt-engineer` | Crafting effective LLM prompts | 🔄 Planned |
| Automation & DevOps | `workflow-automation` | Shell scripts, cron jobs, and task pipelines | 🔄 Planned |
| Automation & DevOps | `docker-guide` | Containerization, Compose, and image optimization | 🔄 Planned |
| Automation & DevOps | `ci-cd-helper` | GitHub Actions, GitLab CI, Jenkins workflows | 🔄 Planned |
| Learning & Education | `ctf-solver` | CTF challenge methodology and common patterns | 🔄 Planned |
| Learning & Education | `coding-tutor` | Beginner-friendly programming explanations | 🔄 Planned |
| Learning & Education | `interview-prep` | Technical interview patterns and practice | 🔄 Planned |

> 💡 **Don't see what you need?** [Contribute a skill](#-contributing-your-own-skill)!

---

## What is a Skill?

A **SKILL.md file** is a specialized Markdown knowledge base that teaches OpenCode about a specific domain. It's loaded into context when you reference it in a prompt, giving the AI focused, structured expertise.

### Example Skill Structure

```markdown
---
name: python-assistant
description: Python patterns, best practices, and debugging guide
---

# Python Assistant

## Core Concepts
...

## Common Patterns
...

## Debugging Techniques
...

## Libraries & Tools
...
```

### Why Skills Work Well

- **Focused expertise** — each skill covers one domain deeply
- **Prompt-native** — referenced directly in your query
- **Composable** — combine multiple skills for complex tasks
- **Easy to share** — just a Markdown file
- **Community-maintained** — anyone can contribute or improve

---

## Models & Agents

### Recommended Models

| Model | Best For |
|-------|----------|
| `claude-haiku-3.5` | Quick lookups, simple tasks |
| `claude-sonnet-4` | General use, balanced speed/quality |
| `claude-opus-4.6` | Complex analysis, multi-step tasks |

### Suggested Agents

| Agent | Purpose |
|-------|---------|
| `default` | General purpose |
| `penetration-testing` | Security assessments |
| `automation` | Scripting and batch tasks |
| `code-review` | Code quality analysis |
| `data-analysis` | Data processing workflows |

For detailed configuration, see [AGENTS-MODELS.md](./AGENTS-MODELS.md).

---

## Repository Structure

```
opencode-skills/
├── README.md                    ← You are here
├── QUICK-START.md               3-minute setup guide
├── SKILLS-GUIDE.md              Browse and discover skills
├── HOW-TO-CONTRIBUTE.md         Add your own skill
├── AGENTS-MODELS.md             AI configuration reference
│
├── skills/                      ← All skills live here
│   ├── README.md                Skills index
│   ├── web-pentest-tools/       Example: security skill
│   │   ├── README.md
│   │   ├── skill.md
│   │   ├── EXAMPLES.md
│   │   └── CHANGELOG.md
│   └── [your-skill]/            Your future contribution!
│
├── docs/                        ← Extended documentation
│   ├── SKILL-FORMAT.md          How to write a skill
│   └── WORKFLOW.md              Common workflow guides
│
└── setup-scripts/               ← Platform install helpers
    ├── install-linux.sh
    ├── install-windows.ps1
    └── install-macos.sh
```

---

## 🤝 Contributing Your Own Skill

Skills are the heart of this project — contributions in any domain are welcome.

### How to Contribute

1. **Read** [HOW-TO-CONTRIBUTE.md](./HOW-TO-CONTRIBUTE.md) and [docs/SKILL-FORMAT.md](./docs/SKILL-FORMAT.md)
2. **Create** your `skill.md` file under `skills/[your-skill-name]/`
3. **Test** it with OpenCode locally
4. **Submit** a Pull Request

### What Makes a Good Skill

- **Comprehensive** — covers the topic thoroughly with real examples
- **Organized** — clear sections that are easy to scan
- **Practical** — focused on tasks people actually want to do
- **Maintained** — updated as the domain evolves

### Skill Ideas

Some domains we'd love to see covered:

- Security: mobile pentesting, malware analysis, network security
- Dev: TypeScript, Rust, Go, system design patterns
- Data: pandas, dbt, Apache Spark, ML workflows
- Ops: Kubernetes, Terraform, Ansible, monitoring
- Writing: academic writing, email templates, changelog writing
- Creative: game design, worldbuilding, screenwriting

Have an idea not listed here? Go for it — all domains are welcome.

---

## ⚙️ System Requirements

| Requirement | Minimum | Recommended |
|-------------|---------|-------------|
| OS | Linux, macOS, Windows (WSL2) | Any |
| OpenCode | Latest | Latest |
| RAM | 4 GB | 8 GB |
| Disk | 2 GB | 5 GB |

Optional: Python 3.8+, Node.js 14+, Docker, Git

---

## 🔧 Troubleshooting

**Skill not recognized:**
```bash
opencode reload-skills
ls ~/.opencode/skills/  # verify file is present
```

**`opencode` not found:**
```bash
export PATH=$PATH:~/.opencode/bin
source ~/.bashrc  # or ~/.zshrc
```

**Permission errors:**
```bash
chmod -R 755 ~/.opencode/
sudo chown -R $USER:$USER ~/.opencode/
```

For more help, see the [Troubleshooting section in AGENTS-MODELS.md](./AGENTS-MODELS.md#troubleshooting) or [open an issue](https://github.com/yourusername/opencode-skills/issues).

---

## Documentation

| Document | Purpose |
|----------|---------|
| [QUICK-START.md](./QUICK-START.md) | 3-minute setup |
| [SKILLS-GUIDE.md](./SKILLS-GUIDE.md) | Browse all skills |
| [HOW-TO-CONTRIBUTE.md](./HOW-TO-CONTRIBUTE.md) | Add your skill |
| [AGENTS-MODELS.md](./AGENTS-MODELS.md) | Model & agent config |
| [docs/SKILL-FORMAT.md](./docs/SKILL-FORMAT.md) | Skill writing guide |

---

## License

MIT License — free to use, modify, and distribute. See [LICENSE](./LICENSE) for details.

---

## Acknowledgments

- [OpenCode](https://opencode.sh) for the platform
- [Anthropic](https://anthropic.com) for Claude AI
- All contributors who've shared their knowledge as skills

---

<div align="center">

**[⭐ Star this repo](https://github.com/yourusername/opencode-skills)** · **[🤝 Contribute a skill](./HOW-TO-CONTRIBUTE.md)** · **[💬 Join the discussion](https://github.com/yourusername/opencode-skills/discussions)**

v1.0.0 · MIT License

</div>
