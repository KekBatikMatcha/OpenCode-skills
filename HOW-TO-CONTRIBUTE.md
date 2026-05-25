# How to Contribute

Thank you for wanting to add to OpenCode Skills! This guide walks you through everything — from picking an idea to getting your skill merged.

All domains are welcome: security, development, data, writing, DevOps, education, creative work, or anything else that would be genuinely useful to someone using OpenCode.

---

## Before You Start

**Check if the skill already exists:**
Browse the [Skills Directory in README.md](./README.md#-skills-directory) or run:
```bash
ls skills/
```

**Check if someone is already working on it:**
Look through [open issues](https://github.com/yourusername/opencode-skills/issues) and [open PRs](https://github.com/yourusername/opencode-skills/pulls) for your topic.

**Claim your skill (optional but recommended):**
[Open an issue](https://github.com/yourusername/opencode-skills/issues/new) with the title `[New Skill] your-skill-name` so others know it's in progress. This avoids duplicate work.

---

## Step 1 — Fork & Clone

```bash
# Fork the repo on GitHub first, then:
git clone https://github.com/YOUR-USERNAME/opencode-skills.git
cd opencode-skills

# Create a branch for your skill
git checkout -b skill/your-skill-name
```

Use the naming convention `skill/[skill-name]` for your branch (e.g. `skill/python-assistant`, `skill/docker-guide`).

---

## Step 2 — Create Your Skill Folder

Each skill lives in its own folder under `skills/`:

```bash
mkdir skills/your-skill-name
```

**Required files:**

```
skills/your-skill-name/
├── skill.md          ← The actual skill content (required)
├── README.md         ← Skill documentation page (required)
├── EXAMPLES.md       ← Usage examples (required)
└── CHANGELOG.md      ← Version history (required)
```

---

## Step 3 — Write the Skill (`skill.md`)

This is the core file — the knowledge base that OpenCode loads when someone uses your skill. Quality here matters most.

### Minimum Structure

```markdown
---
name: your-skill-name
description: One-sentence description of what this skill does
version: 1.0.0
category: Development        # Security / Development / Data & Analysis / Writing & Content / Automation & DevOps / Learning & Education
author: your-github-username
---

# Your Skill Name

Brief intro paragraph — what this skill is for and when to use it.

---

## Overview
High-level summary of the domain this skill covers.

## Core Concepts
Foundational knowledge someone needs to use this skill effectively.

## [Domain-Specific Sections]
The bulk of your skill's content — tools, techniques, patterns, references, etc.
Organize these sections however makes sense for your domain.

## Common Tasks
Step-by-step walkthroughs of the most frequent use cases.

## Examples
Concrete, copy-paste-ready examples with context.

## Tips & Best Practices
Hard-won advice, gotchas, and things to avoid.

## References
Links to official docs, specs, or further reading.
```

### Content Guidelines

**Be specific, not generic.** A skill should give OpenCode knowledge it wouldn't otherwise have — not just a Wikipedia summary. Include real examples, real commands, real payloads or code snippets.

**Depth over breadth.** It's better to cover 10 things thoroughly than 50 things superficially. If your domain is huge, consider scoping to a sub-domain (e.g. `pandas-assistant` instead of `data-science`).

**Use real examples throughout.** Every technique or concept should have a working example attached to it. Don't just describe — show.

**Structure for scanning.** People will search within the skill mid-task. Use clear headings, consistent formatting, and short sections. Avoid walls of prose.

**No fluff.** Cut introductory filler, redundant disclaimers, and anything that doesn't add actionable value.

---

## Step 4 — Write the README (`README.md`)

This is the skill's documentation page shown on GitHub. It should cover:

```markdown
# Skill Name

One-sentence tagline.

## What's Inside
- Key area 1
- Key area 2
- Key area 3

## Quick Usage
\```bash
opencode "by using your-skill-name, [example request]"
\```

## Example Prompts
A few realistic prompts someone would actually use.

## Coverage
What topics, tools, or techniques the skill covers.

## Version
Current version and what changed.
```

---

## Step 5 — Write Examples (`EXAMPLES.md`)

Provide at least **5 real usage examples** showing different types of requests. Make these varied — simple questions, complex tasks, piped input, combined skills.

```markdown
# Examples — your-skill-name

## Basic Usage

\```bash
opencode "by using your-skill-name, [simple request]"
\```

## Intermediate Usage

\```bash
opencode --model claude-sonnet-4 "by using your-skill-name, [moderate request]"
\```

## Advanced Usage

\```bash
opencode --model claude-opus-4.6 --agent [agent] \
  "by using your-skill-name, [complex multi-step request]"
\```

## With File Input

\```bash
opencode "by using your-skill-name, [task]" < input-file.txt
\```

## Combined with Another Skill

\```bash
opencode "by using your-skill-name and technical-writer, [task]"
\```
```

---

## Step 6 — Write CHANGELOG (`CHANGELOG.md`)

Start simple for a first release:

```markdown
# Changelog — your-skill-name

## [1.0.0] — YYYY-MM-DD

### Added
- Initial release
- [List major sections or features you included]
```

---

## Step 7 — Test Your Skill Locally

Install your skill and verify it works before submitting:

```bash
# Copy your skill to OpenCode
cp skills/your-skill-name/skill.md ~/.opencode/skills/your-skill-name.md
opencode reload-skills

# Test it with a few prompts
opencode "by using your-skill-name, [test request 1]"
opencode "by using your-skill-name, [test request 2]"
opencode "by using your-skill-name, [test request 3]"
```

**Check for:**
- Does OpenCode recognize and load the skill?
- Are responses noticeably better / more accurate than without the skill?
- Do the examples in `EXAMPLES.md` actually work?
- Are there obvious gaps or errors in the content?

---

## Step 8 — Update the Skills Directory

Add your skill to the main `README.md` Skills Directory table:

```markdown
| 💻 Development | `your-skill-name` | Your one-line description | ✅ Available |
```

Match the category emoji and label to one of the existing categories, or propose a new one if your skill genuinely doesn't fit.

---

## Step 9 — Submit a Pull Request

```bash
# Stage your changes
git add skills/your-skill-name/
git add README.md   # for the Skills Directory update

# Commit
git commit -m "feat: add your-skill-name skill"

# Push
git push origin skill/your-skill-name
```

Then open a Pull Request on GitHub. Use this template for your PR description:

```
## New Skill: your-skill-name

**Category:** Development / Security / Data / etc.

**What it covers:**
- [key area 1]
- [key area 2]
- [key area 3]

**Example prompts:**
- `opencode "by using your-skill-name, ..."`

**Tested on:** [OpenCode version, OS]

**Notes:**
Any context reviewers should know.
```

---

## Skill Quality Checklist

Before submitting, run through this:

| Check | Done? |
|-------|-------|
| `skill.md` has a valid frontmatter block | ☐ |
| Skill name uses `kebab-case` | ☐ |
| All 4 files present (`skill.md`, `README.md`, `EXAMPLES.md`, `CHANGELOG.md`) | ☐ |
| At least 5 examples in `EXAMPLES.md` | ☐ |
| Skill tested locally with `opencode` | ☐ |
| README Skills Directory table updated | ☐ |
| No placeholder or lorem ipsum text left in | ☐ |
| No sensitive data (API keys, passwords, personal info) included | ☐ |

---

## Updating an Existing Skill

Found outdated content, a bug, or something to improve? Contributions to existing skills are just as valuable as new ones.

```bash
git checkout -b fix/skill-name-description-of-change
# make your edits
git commit -m "fix: [skill-name] describe what you changed"
git push origin fix/skill-name-description-of-change
```

Update `CHANGELOG.md` in the skill folder with what changed and bump the version number if it's a meaningful update.

---

## Contribution Tips

**Scope tightly.** A focused, complete skill beats a broad, shallow one. If your domain is large, start with the most useful slice.

**Write for a user mid-task.** Assume the person using this skill is already working — they need to find the right answer fast. Structure accordingly.

**Use the format that fits your domain.** Security skills may have lots of payload examples. DevOps skills may have lots of config snippets. Writing skills may have lots of templates. There's no single right format beyond the required sections.

**Iterate.** Submit v1.0.0, then improve. A merged imperfect skill is more useful than a perfect skill in draft.

---

## Getting Help

- **Questions about the format?** See [docs/SKILL-FORMAT.md](./docs/SKILL-FORMAT.md)
- **Not sure if your skill idea fits?** [Open a discussion](https://github.com/yourusername/opencode-skills/discussions/new)
- **Found a bug in an existing skill?** [Open an issue](https://github.com/yourusername/opencode-skills/issues/new)
- **General questions?** [GitHub Discussions](https://github.com/yourusername/opencode-skills/discussions)

---

## Code of Conduct

Be respectful. Skills submitted here are used by real people — keep content accurate, useful, and free of harmful material. Submissions that include malicious payloads intended for real attacks (rather than education/research), hate speech, or deliberately misleading information will be rejected.

---

## What Happens After You Submit

1. A maintainer reviews your PR, usually within a few days
2. You may get feedback requesting changes — that's normal and expected
3. Once approved, your skill is merged and added to the Skills Directory
4. Future contributors can build on and improve your skill

---

<div align="center">

**[← Back to README](./README.md)** · **[Browse Skills](./SKILLS-GUIDE.md)** · **[Skill Format Reference](./docs/SKILL-FORMAT.md)**

</div>
