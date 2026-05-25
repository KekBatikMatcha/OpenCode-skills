# Quick Start

Get OpenCode Skills up and running in under 3 minutes.

---

## Prerequisites

Before you begin, make sure you have:

- A terminal (Bash, Zsh, or PowerShell)
- An internet connection
- Git (recommended) or the ability to download a ZIP

---

## Step 1 — Install OpenCode

Pick your platform:

**Linux / macOS (curl)**
```bash
curl -fsSL https://opencode.sh/install.sh | bash
```

**macOS (Homebrew)**
```bash
brew install opencode
```

**Windows**
Download the installer from [opencode.sh](https://opencode.sh) and run it as Administrator.
Or use WSL2 and follow the Linux instructions above.

**Verify the install:**
```bash
opencode --version
```

If you see `command not found`, add OpenCode to your PATH:
```bash
export PATH=$PATH:~/.opencode/bin
source ~/.bashrc   # or ~/.zshrc for Zsh users
```

---

## Step 2 — Get the Skills Library

**Option A: Clone with Git (recommended)**
```bash
git clone https://github.com/yourusername/opencode-skills.git
cd opencode-skills
```

**Option B: Download ZIP**

Go to the repository page, click **Code → Download ZIP**, extract it, and `cd` into the folder.

---

## Step 3 — Install Skills

**Install everything at once:**
```bash
cp -r skills/* ~/.opencode/skills/
```

**Or install a single skill:**
```bash
cp skills/web-pentest-tools/skill.md ~/.opencode/skills/web-pentest-tools.md
```

**Reload the skill cache:**
```bash
opencode reload-skills
```

**Verify skills are loaded:**
```bash
opencode list-skills
```

You should see the installed skill names in the output.

---

## Step 4 — Use Your First Skill

The pattern is always the same:

```bash
opencode "by using [skill-name], [your request]"
```

Try one of these to confirm everything works:

```bash
# Security
opencode "by using web-pentest-tools, what are the OWASP Top 10 vulnerabilities?"

# Development (once available)
opencode "by using python-assistant, explain list comprehensions with examples"

# Writing (once available)
opencode "by using technical-writer, write a README introduction for a CLI tool"
```

If the skill responds with relevant, detailed output — you're all set. ✅

---

## Choosing a Model

By default, OpenCode uses your configured model. You can override it per command:

```bash
# Fast — good for quick lookups
opencode --model claude-haiku-3.5 "by using [skill-name], ..."

# Balanced — good for most tasks (recommended default)
opencode --model claude-sonnet-4 "by using [skill-name], ..."

# Thorough — good for complex, multi-step tasks
opencode --model claude-opus-4.6 "by using [skill-name], ..."
```

**Set a default model so you don't have to type it every time:**
```bash
opencode config set default-model claude-sonnet-4
```

---

## Choosing an Agent

Agents give OpenCode a specific role and behavior context. Most skills work fine with the default agent, but some tasks benefit from a specialized one:

```bash
opencode --agent penetration-testing "by using web-pentest-tools, ..."
opencode --agent automation          "by using workflow-automation, ..."
opencode --agent code-review         "by using code-reviewer, ..."
opencode --agent data-analysis       "by using data-analyzer, ..."
```

For the full agents reference, see [AGENTS-MODELS.md](./AGENTS-MODELS.md).

---

## Common Usage Patterns

**Quick question:**
```bash
opencode "by using web-pentest-tools, what is SSRF and how is it exploited?"
```

**File as input:**
```bash
opencode "by using code-reviewer, review this file" < my_script.py
```

**Piping output:**
```bash
cat error.log | opencode "by using log-processor, summarize the errors in this log"
```

**Model + agent + skill combined:**
```bash
opencode --model claude-opus-4.6 --agent penetration-testing \
  "by using web-pentest-tools, create a full security audit plan for a REST API"
```

**Multiple skills in one prompt:**
```bash
opencode "by using technical-writer and python-assistant, document this Python module"
```

---

## Keeping Skills Updated

If you cloned the repo, pull updates regularly to get new and improved skills:

```bash
cd opencode-skills
git pull
cp -r skills/* ~/.opencode/skills/
opencode reload-skills
```

---

## Troubleshooting

| Problem | Fix |
|---------|-----|
| `opencode: command not found` | Add `~/.opencode/bin` to your PATH |
| Skill not recognized in prompt | Run `opencode reload-skills` |
| Skill file not found | Check `ls ~/.opencode/skills/` — filename must match skill name |
| Permission denied | Run `chmod -R 755 ~/.opencode/` |
| Wrong model used | Set default: `opencode config set default-model claude-sonnet-4` |

Still stuck? [Open an issue](https://github.com/yourusername/opencode-skills/issues) or check [AGENTS-MODELS.md](./AGENTS-MODELS.md#troubleshooting).

---

## What's Next?

- **Browse all skills** → [SKILLS-GUIDE.md](./SKILLS-GUIDE.md)
- **Contribute your own skill** → [HOW-TO-CONTRIBUTE.md](./HOW-TO-CONTRIBUTE.md)
- **Configure models & agents** → [AGENTS-MODELS.md](./AGENTS-MODELS.md)
- **Learn the skill format** → [docs/SKILL-FORMAT.md](./docs/SKILL-FORMAT.md)
- **Back to the main README** → [README.md](./README.md)
