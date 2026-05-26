# Skill Format Reference

The definitive reference for writing a `skill.md` file. Read this before writing your first skill, and keep it open while you write.

If you're looking for the step-by-step contribution process, see [HOW-TO-CONTRIBUTE.md](../HOW-TO-CONTRIBUTE.md). This document focuses entirely on format and content quality.

---

## File Overview

Every skill is a single Markdown file (`skill.md`) structured in two parts:

1. **Frontmatter** — machine-readable metadata at the top of the file
2. **Body** — human and AI-readable knowledge base content

```
skill.md
│
├── --- frontmatter ---
│     name, description, version, category, author, tags
│
└── body
      Title, Overview, Core Concepts,
      Domain-Specific Sections,
      Common Tasks, Examples,
      Tips & Best Practices, References
```

---

## Part 1 — Frontmatter

The frontmatter block sits at the very top of the file, wrapped in `---` delimiters. It must be valid YAML.

### Full Frontmatter Spec

```yaml
---
name: your-skill-name
description: One-sentence summary of what this skill does and who it's for
version: 1.0.0
category: Development
author: your-github-username
tags: [python, scripting, debugging]
---
```

### Field Reference

| Field | Required | Format | Description |
|-------|----------|--------|-------------|
| `name` | Yes | `kebab-case` | Unique skill identifier. Must match the folder name exactly |
| `description` | Yes | Plain text, max 120 chars | One sentence. What the skill does and what it's best for |
| `version` | Yes | `MAJOR.MINOR.PATCH` | Start at `1.0.0`. Increment on every meaningful update |
| `category` | Yes | See valid values below | The category this skill belongs to |
| `author` | Yes | GitHub username | Your GitHub handle, no `@` prefix |
| `tags` | Optional | YAML list of strings | Keywords that help with discovery. 3–8 tags recommended |

### Valid Category Values

```
Security
Development
Data & Analysis
Writing & Content
Automation & DevOps
Learning & Education
```

If your skill genuinely doesn't fit any of these, propose a new category in your PR.

### Naming Rules

The `name` field must:
- Use `kebab-case` only (lowercase letters and hyphens)
- Match the folder name exactly (`skills/your-skill-name/skill.md` → `name: your-skill-name`)
- Be unique across the repository
- Be descriptive but concise — 2 to 4 words is the sweet spot

```yaml
# Good names
name: python-assistant
name: web-pentest-tools
name: docker-guide
name: sql-query-optimizer

# Bad names
name: Python Assistant       # not kebab-case
name: tool                   # too generic
name: my-awesome-super-duper-skill-for-doing-things  # too long
name: pythonassistant        # no separator
```

### Version Conventions

Follow [Semantic Versioning](https://semver.org):

| Change type | Version bump | Example |
|-------------|-------------|---------|
| Initial release | — | `1.0.0` |
| New section or major content addition | MINOR | `1.0.0` → `1.1.0` |
| Bug fix, correction, small improvement | PATCH | `1.0.0` → `1.0.1` |
| Complete rewrite or structural overhaul | MAJOR | `1.0.0` → `2.0.0` |

---

## Part 2 — Body Structure

The body is what OpenCode actually loads into context. This is where the knowledge lives.

### Required Sections

Every skill must include these sections, in this order:

```markdown
# Skill Title

[Intro paragraph]

---

## Overview

## Core Concepts

## [Your Domain Sections]

## Common Tasks

## Examples

## Tips & Best Practices

## References
```

The domain-specific sections in the middle are flexible — structure them however makes sense for your subject area. Everything else is required.

---

### Section: Title & Intro

```markdown
# Python Assistant

A comprehensive guide to writing, debugging, and optimizing Python code —
covering patterns, idioms, standard library usage, and common pitfalls.
```

**Rules:**
- Title should match the `name` field in title case (hyphens → spaces, capitalize each word)
- Intro paragraph: 2–4 sentences max
- State what the skill covers and what kind of tasks it helps with
- No fluff — get to the point immediately

---

### Section: Overview

A high-level map of what the skill contains. Think of this as the table of contents in prose form — it tells OpenCode (and the user) what to expect.

```markdown
## Overview

This skill covers Python from fundamentals to production patterns. It includes
idiomatic code style, common data structures, file I/O, error handling, testing
approaches, performance tips, and standard library modules. It is focused on
Python 3.10+ and modern best practices.
```

**Rules:**
- 3–6 sentences
- Mention scope boundaries (what's in, what's deliberately out)
- Note any version or platform assumptions

---

### Section: Core Concepts

The foundational knowledge a user needs to make sense of the rest of the skill. This section grounds OpenCode in the domain before diving into specifics.

```markdown
## Core Concepts

**Interpreted and dynamically typed**: Python executes line by line and
determines variable types at runtime, which makes it flexible but requires
careful type handling in production code.

**Everything is an object:** Functions, classes, modules, and even types
themselves are objects in Python. This enables powerful patterns like
decorators and metaclasses.

**The Python data model:** Understanding dunder methods (__init__, __repr__,
__len__, etc.) unlocks how Python's built-in syntax works under the hood.
```

**Rules:**
- Cover the 5–10 concepts that underpin everything else in the skill
- Define domain-specific terms a model might not interpret correctly
- Use short, clear definitions — not textbook prose
- Include a concrete example for each concept where space allows

---

### Section: Domain-Specific Sections

This is the bulk of your skill. Structure these sections however fits your domain. There is no fixed format — what matters is that the content is dense, accurate, and well-organized.

**Examples of domain-specific sections by category:**

| Category | Example Sections |
|----------|-----------------|
| Security | Vulnerability Types, Exploitation Techniques, Tools, Payloads, Mitigation |
| Development | Language Patterns, Standard Library, Frameworks, Testing, Debugging |
| Data & Analysis | Data Structures, Cleaning Techniques, Query Patterns, Visualization |
| Writing & Content | Document Types, Style Guides, Templates, Tone Guidelines |
| Automation & DevOps | Configuration Syntax, Pipeline Patterns, CLI Reference, Troubleshooting |
| Learning & Education | Concept Explanations, Practice Problems, Mental Models, Common Mistakes |

**Formatting guidelines for these sections:**

Use code blocks generously:
````markdown
## String Formatting

Python offers several string formatting approaches:

**f-strings (preferred, Python 3.6+):**
```python
name = "world"
print(f"Hello, {name}!")          # Hello, world!
print(f"{2 + 2}")                 # 4
print(f"{name!r}")                # 'world'
print(f"{3.14159:.2f}")          # 3.14
```

**str.format():**
```python
"{} {}".format("hello", "world")  # hello world
"{0} {1}".format("hello", "world")
"{greeting}".format(greeting="hi")
```
````

Use tables for comparisons and quick references:
```markdown
| Method | Use When | Example |
|--------|----------|---------|
| `list.append()` | Adding one item to end | `lst.append(4)` |
| `list.extend()` | Adding multiple items | `lst.extend([4, 5])` |
| `list.insert()` | Adding at specific index | `lst.insert(0, 'x')` |
```

Use headers to make sections scannable:
```markdown
## Error Handling

### try / except / else / finally

### Raising Exceptions

### Custom Exception Classes

### Common Built-in Exceptions
```

---

### Section: Common Tasks

Step-by-step walkthroughs of the most frequent real-world tasks someone would use this skill for. This is what turns a reference into a practical guide.

```markdown
## Common Tasks

### Read a CSV file and filter rows

```python
import csv

with open('data.csv', newline='') as f:
    reader = csv.DictReader(f)
    results = [row for row in reader if row['status'] == 'active']

print(f"Found {len(results)} active records")
```

### Write a decorated function

```python
import functools

def retry(times=3):
    def decorator(func):
        @functools.wraps(func)
        def wrapper(*args, **kwargs):
            for attempt in range(times):
                try:
                    return func(*args, **kwargs)
                except Exception as e:
                    if attempt == times - 1:
                        raise
        return wrapper
    return decorator

@retry(times=3)
def fetch_data(url):
    ...
```
```

**Rules:**
- Include at least 5 common tasks
- Every task must have working code or commands — no pseudo-code
- Task titles should read like goals ("Read a CSV file", "Set up a virtual environment")
- Keep explanatory prose minimal — let the code speak

---

### Section: Examples

Complete, copy-paste-ready examples showing end-to-end usage. These differ from Common Tasks in that they show realistic full scenarios rather than isolated techniques.

```markdown
## Examples

### Parse a JSON API response and extract fields

```python
import requests

response = requests.get("https://api.example.com/users")
response.raise_for_status()

users = response.json()
active_users = [
    {"name": u["name"], "email": u["email"]}
    for u in users
    if u.get("active") is True
]

for user in active_users:
    print(f"{user['name']} — {user['email']}")
```

**What this does:** Fetches a list of users from a REST API, filters for
active users, and prints their name and email. `raise_for_status()` ensures
HTTP errors are caught early.
```

**Rules:**
- At least 3 full examples
- Each example needs a brief "What this does" explanation after the code
- Examples should be realistic — drawn from actual use cases, not contrived demos
- Include edge cases or error handling where relevant

---

### Section: Tips & Best Practices

Hard-won advice, common mistakes, and things to avoid. This is where experienced practitioners add the most value.

```markdown
## Tips & Best Practices

**Prefer `pathlib` over `os.path` for file operations.**
`pathlib.Path` is more readable and cross-platform:
```python
# ❌ Old way
import os
path = os.path.join(os.path.dirname(__file__), 'data', 'file.csv')

# ✅ Modern way
from pathlib import Path
path = Path(__file__).parent / 'data' / 'file.csv'
```

**Use `enumerate()` instead of `range(len())`.**
```python
# ❌ Avoid
for i in range(len(items)):
    print(i, items[i])

# ✅ Prefer
for i, item in enumerate(items):
    print(i, item)
```

**Never use mutable default arguments.**
```python
# ❌ Bug waiting to happen
def append_to(item, lst=[]):
    lst.append(item)
    return lst

# ✅ Correct
def append_to(item, lst=None):
    if lst is None:
        lst = []
    lst.append(item)
    return lst
```
```

**Rules:**
- At least 5 tips
- Every tip must include a concrete before/after example where applicable
- Frame tips as actionable rules ("Prefer X over Y", "Never do Z")
- Include common gotchas that even experienced users hit

---

### Section: References

Links to authoritative external sources. Keeps the skill maintainable — link out rather than duplicating content that's better maintained elsewhere.

```markdown
## References

- [Python Official Documentation](https://docs.python.org/3/) — language reference and standard library
- [PEP 8 — Style Guide for Python Code](https://peps.python.org/pep-0008/) — official style conventions
- [Real Python](https://realpython.com) — in-depth tutorials and guides
- [Python Cookbook (O'Reilly)](https://www.oreilly.com/library/view/python-cookbook-3rd/9781449357337/) — advanced recipes
- [Awesome Python](https://github.com/vinta/awesome-python) — curated library list
```

**Rules:**
- 5–10 links maximum — quality over quantity
- Prefer official docs, specs, and well-maintained resources
- Avoid linking to content that goes stale quickly (blog posts, tutorials that may become outdated)
- Each link needs a short description of what it's for

---

## Formatting Rules

### Markdown

| Element | Rule |
|---------|------|
| Headings | `##` for top-level sections, `###` for subsections, `####` for sub-subsections. Never skip levels. |
| Code blocks | Always specify the language (` ```python `, ` ```bash `, ` ```yaml `, etc.) |
| Inline code | Use backticks for all file names, commands, function names, values |
| Bold | Use for key terms, important warnings, and tip headers |
| Tables | Use for comparisons, quick references, and option lists |
| Horizontal rules | Use `---` between major sections to aid scanning |

### Code Blocks

Always include the language identifier:
````markdown
```python
# ✅ Correct
x = 1
```

```
# ❌ Wrong — no language
x = 1
```
````

Add comments inside code blocks to explain non-obvious lines:
```python
result = sorted(data, key=lambda x: x['score'], reverse=True)[:10]
#                                                 ^^^^^^^^^^^^ descending
#                                                              ^^^^ top 10 only
```

Show ✅ good and ❌ bad patterns side by side where useful:
```python
# ❌ Don't do this
open('file.txt').read()

# ✅ Do this instead
with open('file.txt') as f:
    content = f.read()
```

### Length Guidelines

| Section | Recommended Length |
|---------|-------------------|
| Frontmatter | 6–10 lines |
| Intro paragraph | 2–4 sentences |
| Overview | 3–6 sentences |
| Core Concepts | 5–10 concepts, 2–5 lines each |
| Domain sections | As long as needed — no artificial limit |
| Common Tasks | At least 5 tasks |
| Examples | At least 3 full examples |
| Tips | At least 5 tips |
| References | 5–10 links |
| **Total skill.md** | **500 lines minimum, no upper limit** |

Depth is a virtue. A 2000-line skill is better than a 400-line skill if the content is genuinely useful.

---

## Common Mistakes to Avoid

**Too generic.** A skill titled `programming-guide` that covers ten languages shallowly is worse than `python-assistant` that covers Python thoroughly. Scope tightly.

**No working code.** Every code example must run. Pseudo-code is acceptable only when illustrating a concept that can't be shown in real code. Mark it clearly as pseudo-code if so.

**Missing frontmatter.** OpenCode uses the frontmatter to identify and load the skill. A missing or malformed frontmatter block will cause the skill to fail silently.

**Walls of prose.** This is a reference, not an essay. Use headers, code blocks, and tables to break content into scannable chunks. If a paragraph is longer than 5 lines, consider restructuring it.

**Stale content.** Don't include tool versions, API endpoints, or feature flags that go stale. Link to official docs for version-specific details instead.

**Duplicating other skills.** If a closely related skill already exists, extend it via a PR rather than creating a separate skill that overlaps.

---

## Full Annotated Example

Below is a minimal but complete `skill.md` showing every required section:

````markdown
---
name: bash-scripting
description: A practical guide to writing robust Bash scripts for automation, file processing, and system administration
version: 1.0.0
category: Automation & DevOps
author: yourname
tags: [bash, shell, scripting, linux, automation]
---

# Bash Scripting

A practical reference for writing reliable Bash scripts — covering syntax,
control flow, file operations, error handling, and common automation patterns
for Linux and macOS environments.

---

## Overview

This skill covers Bash scripting from basic syntax through production-grade
patterns. It focuses on Bash 4.x+ on Linux and macOS, and assumes basic
familiarity with the command line. It does not cover zsh or fish.

## Core Concepts

**Scripts are just commands in a file.** Anything you can type in a terminal
can go in a script. The shebang line (`#!/usr/bin/env bash`) tells the OS
which interpreter to use.

**Exit codes signal success or failure.** `0` means success; any non-zero
value is an error. `$?` holds the exit code of the last command.

**Variables are untyped strings by default.** Bash treats everything as a
string unless you explicitly declare integers with `declare -i`.

**Word splitting happens on whitespace.** Always quote variables (`"$var"`)
to prevent unexpected splitting and globbing.

## Script Structure

### Shebang and Safety Flags

```bash
#!/usr/bin/env bash
set -euo pipefail   # exit on error, unset vars, pipe failures
IFS=$'\n\t'         # safer word splitting
```

### Variables

```bash
name="world"
echo "Hello, $name"         # Hello, world
echo "Hello, ${name}!"      # Hello, world! (brace syntax, safer)

readonly MAX=100             # constant
declare -i count=0           # integer
```

## Common Tasks

### Process a file line by line

```bash
while IFS= read -r line; do
    echo "Processing: $line"
done < input.txt
```

### Check if a command exists

```bash
if ! command -v git &>/dev/null; then
    echo "git is not installed" >&2
    exit 1
fi
```

### Parse command-line arguments

```bash
while [[ "$#" -gt 0 ]]; do
    case "$1" in
        -f|--file) FILE="$2"; shift ;;
        -v|--verbose) VERBOSE=true ;;
        *) echo "Unknown option: $1"; exit 1 ;;
    esac
    shift
done
```

## Examples

### Backup script with timestamp

```bash
#!/usr/bin/env bash
set -euo pipefail

SOURCE="${1:?Usage: backup.sh <source> <dest>}"
DEST="${2:?}"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
ARCHIVE="${DEST}/backup_${TIMESTAMP}.tar.gz"

tar -czf "$ARCHIVE" "$SOURCE"
echo "Backup created: $ARCHIVE"
```

**What this does:** Creates a timestamped compressed archive of a directory.
The `:?` syntax causes the script to exit with an error if arguments are missing.

## Tips & Best Practices

**Always quote variables.**
```bash
# ❌ Breaks on filenames with spaces
for f in $files; do ...

# ✅ Safe
for f in "$files"; do ...
```

**Use `[[ ]]` over `[ ]` for conditionals.**
`[[ ]]` is a Bash built-in with safer string handling and supports `=~` for regex.
```bash
if [[ "$name" =~ ^[A-Z] ]]; then
    echo "Starts with uppercase"
fi
```

**Redirect errors to stderr.**
```bash
echo "Something went wrong" >&2
```

## References

- [Bash Reference Manual](https://www.gnu.org/software/bash/manual/) — official language spec
- [ShellCheck](https://www.shellcheck.net) — static analysis tool for shell scripts
- [Google Shell Style Guide](https://google.github.io/styleguide/shellguide.html)
- [Bash Pitfalls](https://mywiki.wooledge.org/BashPitfalls) — common mistakes with fixes
- [Explain Shell](https://explainshell.com) — interactive command explainer
````

---

## Quick Reference Card

```
skill.md
├── Frontmatter (YAML between --- delimiters)
│   ├── name: kebab-case-name          [required]
│   ├── description: one sentence      [required, max 120 chars]
│   ├── version: 1.0.0                 [required, semver]
│   ├── category: Development          [required, from valid list]
│   ├── author: github-username        [required]
│   └── tags: [tag1, tag2]             [optional, 3-8 tags]
│
└── Body (Markdown)
    ├── # Title + intro paragraph       [required]
    ├── ## Overview                     [required, 3-6 sentences]
    ├── ## Core Concepts                [required, 5-10 concepts]
    ├── ## [Domain Sections]            [flexible, as many as needed]
    ├── ## Common Tasks                 [required, min 5 tasks]
    ├── ## Examples                     [required, min 3 examples]
    ├── ## Tips & Best Practices        [required, min 5 tips]
    └── ## References                   [required, 5-10 links]
```

---

<div align="center">

**[← HOW-TO-CONTRIBUTE](../HOW-TO-CONTRIBUTE.md)** · **[Browse Skills](../SKILLS-GUIDE.md)** · **[Back to README](../README.md)**

</div>
