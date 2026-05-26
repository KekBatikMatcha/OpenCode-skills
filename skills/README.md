# Skills Library

Welcome to the **OpenCode Skills** library — a collection of specialized knowledge modules designed to extend your capabilities across any domain.

---

## What Are Skills?

A **skill** is a specialized knowledge module that teaches you how to do something. Each skill contains:

- **Overview** — What the skill does and when to use it
- **Core Concepts** — Key ideas and terminology
- **Common Tasks** — Step-by-step how-to guides
- **Examples** — Real-world code, prompts, and workflows
- **Tips & Best Practices** — Pro tips and advanced techniques
- **References** — Links to docs, tutorials, and tools

Skills are **domain-agnostic** — they cover Security, Development, Writing, Data, DevOps, Learning, and more.

---

## Directory Structure

```
skills/
├── README.md (this file)
├── security/
│   ├── penetration-testing/
│   │   ├── SKILL.md           # Main skill content
│   │   ├── README.md          # Overview
│   │   ├── EXAMPLES.md        # Real-world examples
│   │   └── CHANGELOG.md       # Version history
│   ├── threat-analysis/
│   ├── access-control/
│   ├── vulnerability-scanner/
│   └── ... (more security skills)
├── development/
│   ├── code-review/
│   ├── debugging/
│   ├── refactoring/
│   ├── api-design/
│   ├── testing-strategy/
│   └── ... (more development skills)
├── writing/
│   ├── readme-writer/
│   ├── technical-writing/
│   ├── editing/
│   ├── changelog-generator/
│   ├── docstring-writer/
│   └── ... (more writing skills)
├── data/
│   ├── data-explorer/
│   ├── sql-optimizer/
│   ├── visualization/
│   ├── data-cleaning/
│   ├── statistical-analysis/
│   └── ... (more data skills)
├── devops/
│   ├── docker-maestro/
│   ├── kubernetes-config/
│   ├── ci-cd-pipeline/
│   ├── system-hardening/
│   ├── monitoring-setup/
│   └── ... (more devops skills)
└── learning/
    ├── explain-concept/
    ├── quiz-generator/
    ├── interview-prep/
    ├── research-synthesis/
    └── ... (more learning skills)
```

---

## Quick Start: Using a Skill

### 1. Find a Skill
Browse this directory or check the [Skills Guide](../SKILLS-GUIDE.md) for recommendations by task, role, or complexity.

### 2. Open the Skill
Each skill folder contains:
- **README.md** — Quick overview and navigation
- **SKILL.md** — Full technical content
- **EXAMPLES.md** — Real-world examples and use cases
- **CHANGELOG.md** — Version history and updates

### 3. Read the Overview
Start with **README.md** to understand:
- What the skill does
- When to use it
- Prerequisites or dependencies
- Basic concepts

### 4. Learn Core Concepts
In **SKILL.md**, the "Core Concepts" section explains:
- Key terminology
- Foundational ideas
- Mental models
- Best practices

### 5. Follow Common Tasks
Most skills have 3–5 "Common Tasks" sections with:
- Step-by-step instructions
- Code/command examples
- Expected output
- Troubleshooting tips

### 6. Run an Example
Pick an example from **EXAMPLES.md** and:
- Copy the code or prompt
- Customize for your situation
- Run it on your data/project
- Iterate and learn

### 7. Combine with Other Skills
Refer to [Skills Guide → Skill Combinations](../SKILLS-GUIDE.md#skill-combinations) for powerful multi-skill workflows.

---

## How to Read a Skill

### Full Skill Structure

```
skill-name/
├── README.md
│   ├── Quick summary
│   ├── Use cases
│   ├── Complexity level
│   ├── Time to learn
│   └── Links to sections
│
├── SKILL.md (Main Content)
│   ├── Title
│   ├── Overview
│   ├── Core Concepts
│   ├── Domain Sections (category-specific)
│   ├── Common Tasks
│   ├── Examples
│   ├── Tips & Best Practices
│   └── References
│
├── EXAMPLES.md
│   ├── Real-world examples
│   ├── Full working code
│   ├── Prompt templates
│   ├── Expected outputs
│   └── Variations & edge cases
│
└── CHANGELOG.md
    ├── Version history
    ├── Major updates
    ├── Bug fixes
    └── Deprecated features
```

### Reading Tips

1. **First time?** Start with README.md (5 min read)
2. **Want basics?** Read "Overview" + "Core Concepts" in SKILL.md (15 min)
3. **Need to do something?** Jump to "Common Tasks" (10–30 min)
4. **Want real examples?** Check EXAMPLES.md for templates (5–15 min)
5. **Going deep?** Read the full SKILL.md (30–60 min)

---

## Skills by Category

### Security (5 skills)

| Skill | Complexity | Best For |
|-------|-----------|----------|
| **[penetration-testing](./security/penetration-testing/)** | Medium–High | Red team assessments, comprehensive testing |
| **[threat-analysis](./security/threat-analysis/)** | Medium–High | Threat modeling, attack surface analysis |
| **[access-control](./security/access-control/)** | Medium | IAM design, permission auditing |
| **[vulnerability-scanner](./security/vulnerability-scanner/)** | Low–Medium | Quick security scans, CVE discovery |
| **[payload-craft](./security/payload-craft/)** | High | Exploit development, security testing |

→ **New to security?** Start with [vulnerability-scanner](./security/vulnerability-scanner/)

---

### Development (5 skills)

| Skill | Complexity | Best For |
|-------|-----------|----------|
| **[code-review](./development/code-review/)** | Low–Medium | PR reviews, code quality gates |
| **[debugging](./development/debugging/)** | Medium | Error investigation, root cause analysis |
| **[refactoring](./development/refactoring/)** | Medium–High | Code cleanup, performance tuning |
| **[api-design](./development/api-design/)** | Medium | API spec writing, contract design |
| **[testing-strategy](./development/testing-strategy/)** | Medium | Test planning, coverage strategy |

→ **New to development?** Start with [code-review](./development/code-review/)

---

### Writing & Documentation (5 skills)

| Skill | Complexity | Best For |
|-------|-----------|----------|
| **[readme-writer](./writing/readme-writer/)** | Low | Project documentation, onboarding |
| **[technical-writing](./writing/technical-writing/)** | Low–Medium | API docs, guides, tutorials |
| **[editing](./writing/editing/)** | Low | Polishing drafts, clarity improvement |
| **[changelog-generator](./writing/changelog-generator/)** | Low | Release notes, version history |
| **[docstring-writer](./writing/docstring-writer/)** | Low–Medium | Code documentation, autodocs |

→ **New to writing?** Start with [readme-writer](./writing/readme-writer/)

---

### Data & Analysis (5 skills)

| Skill | Complexity | Best For |
|-------|-----------|----------|
| **[data-explorer](./data/data-explorer/)** | Low | EDA, data discovery, quick insights |
| **[sql-optimizer](./data/sql-optimizer/)** | Medium | Query optimization, performance tuning |
| **[visualization](./data/visualization/)** | Medium | Charts, dashboards, reporting |
| **[data-cleaning](./data/data-cleaning/)** | Medium | Data prep, validation, deduplication |
| **[statistical-analysis](./data/statistical-analysis/)** | Medium–High | Stats tests, hypothesis testing, modeling |

→ **New to data?** Start with [data-explorer](./data/data-explorer/)

---

### DevOps & Infrastructure (5 skills)

| Skill | Complexity | Best For |
|-------|-----------|----------|
| **[docker-maestro](./devops/docker-maestro/)** | Medium | Containerization, image optimization |
| **[kubernetes-config](./devops/kubernetes-config/)** | Medium–High | Orchestration, multi-service deployments |
| **[ci-cd-pipeline](./devops/ci-cd-pipeline/)** | Medium | Automation, testing pipelines |
| **[system-hardening](./devops/system-hardening/)** | Medium–High | Security ops, compliance, baselines |
| **[monitoring-setup](./devops/monitoring-setup/)** | Medium | Observability, alerting, incident response |

→ **New to DevOps?** Start with [docker-maestro](./devops/docker-maestro/)

---

### Learning & Study (4 skills)

| Skill | Complexity | Best For |
|-------|-----------|----------|
| **[explain-concept](./learning/explain-concept/)** | Low | Learning new topics, teaching others |
| **[quiz-generator](./learning/quiz-generator/)** | Low–Medium | Self-study, exam prep |
| **[interview-prep](./learning/interview-prep/)** | Medium–High | Interview coaching, mock practice |
| **[research-synthesis](./learning/research-synthesis/)** | Medium | Literature review, trend analysis |

→ **New to learning?** Start with [explain-concept](./learning/explain-concept/)

---

## Finding the Right Skill

### By Task

**I need to...** → Use this skill

| Task | Skill | Category |
|------|-------|----------|
| Review a pull request | code-review | Development |
| Understand an idea | explain-concept | Learning |
| Improve a README | readme-writer | Writing |
| Fix a bug | debugging | Development |
| Explore data | data-explorer | Data |
| Plan a test suite | testing-strategy | Development |
| Secure a server | system-hardening | DevOps |
| Write API docs | technical-writing | Writing |
| Optimize queries | sql-optimizer | Data |
| Prepare for an interview | interview-prep | Learning |

### By Complexity Level

**Pick based on your experience:**

| Level | Skills |
|-------|--------|
| **Beginner** (Low) | readme-writer, editing, explain-concept, data-explorer, changelog-generator, docstring-writer, quiz-generator, vulnerability-scanner |
| **Intermediate** (Low–Med–High) | code-review, api-design, testing-strategy, technical-writing, debugging, docker-maestro, ci-cd-pipeline, data-cleaning, visualization, access-control, threat-analysis, research-synthesis |
| **Advanced** (Med–High–High) | refactoring, penetration-testing, kubernetes-config, system-hardening, statistical-analysis, sql-optimizer, monitoring-setup, interview-prep, payload-craft |

### By Role

**Pick based on your job:**

| Role | Recommended Skills |
|------|-------------------|
| **Full-Stack Developer** | code-review, refactoring, testing-strategy, api-design, readme-writer, docker-maestro, ci-cd-pipeline |
| **Security Engineer** | penetration-testing, threat-analysis, access-control, system-hardening, vulnerability-scanner |
| **Data Analyst** | data-explorer, data-cleaning, sql-optimizer, visualization, statistical-analysis |
| **DevOps Engineer** | docker-maestro, kubernetes-config, ci-cd-pipeline, system-hardening, monitoring-setup |
| **Technical Writer** | readme-writer, technical-writing, editing, docstring-writer, changelog-generator |
| **Student / Learner** | explain-concept, quiz-generator, interview-prep, research-synthesis |

---

## Skill Combinations

Combine 2–3 skills for powerful workflows. See [SKILLS-GUIDE.md](../SKILLS-GUIDE.md#skill-combinations) for full examples.

### Example: Code Quality Workflow
```
code-review          ← Review the code
    ↓
refactoring          ← Improve it
    ↓
testing-strategy     ← Plan tests
    ↓
docstring-writer     ← Document it
```

### Example: Data Analysis Workflow
```
data-explorer        ← Understand the data
    ↓
data-cleaning        ← Prepare it
    ↓
sql-optimizer        ← Query it
    ↓
visualization        ← Show it
```

### Example: Security Assessment
```
threat-analysis      ← Plan the attack
    ↓
penetration-testing  ← Execute it
    ↓
vulnerability-scanner ← Verify findings
```

---

## Learning Paths

Follow a structured journey based on your role. See [SKILLS-GUIDE.md → Learning Paths](../SKILLS-GUIDE.md#learning-paths) for 4–7 week plans.

**Quick paths:**

### Full-Stack Dev (2 weeks)
1. code-review (L-M)
2. refactoring (M-H)
3. testing-strategy (M)
4. docker-maestro (M)

### Security Pro (3 weeks)
1. access-control (M)
2. threat-analysis (M-H)
3. penetration-testing (M-H)
4. system-hardening (M-H)

### Data Scientist (2 weeks)
1. data-explorer (L)
2. data-cleaning (M)
3. sql-optimizer (M)
4. visualization (M)

---

## Tips for Using Skills

### Read Actively
- Take notes on new concepts
- Try examples on your own code
- Ask "how would I use this?"
- Revisit when you need it

### Practice
- Pick a real problem to solve
- Find a skill that helps
- Work through an example
- Customize it for your situation
- See the results

### Go Deeper
- Follow the references
- Read linked documentation
- Discuss with others
- Take a related course
- Build something with it

### Combine Skills
- Mix 2–3 skills for complex tasks
- Create your own workflows
- Document your combinations
- Share what you learn

---

## Contributing New Skills

### Interested in Contributing?

The community is always looking for new skills! See [HOW-TO-CONTRIBUTE.md](../HOW-TO-CONTRIBUTE.md) for a step-by-step guide.

**What makes a great skill:**
- ✅ Clear, practical focus
- ✅ Well-structured content
- ✅ Real-world examples
- ✅ Helpful tips & best practices
- ✅ Links to references
- ✅ Community-reviewed

**Skill idea checklist:**
- [ ] Does a similar skill already exist?
- [ ] Is it practical and actionable?
- [ ] Can I write 3–5 common tasks?
- [ ] Do I have real examples to share?
- [ ] Would others find this useful?

→ Ready to contribute? Fork the repo and follow [HOW-TO-CONTRIBUTE.md](../HOW-TO-CONTRIBUTE.md)!

---

## Skill Statistics

| Category | Count | Complexity Range |
|----------|-------|------------------|
| Security | 5 | Medium–High |
| Development | 5 | Low–High |
| Writing | 5 | Low–Medium |
| Data | 5 | Low–High |
| DevOps | 5 | Medium–High |
| Learning | 4 | Low–High |
| **Total** | **29** | **Low–High** |

---

## Troubleshooting

### "I can't find a skill for my use case"
→ Check the [Skills Guide](../SKILLS-GUIDE.md) for task-based search, or browse categories above.

### "A skill is too complex for me"
→ Pick a "Low" complexity skill first to build confidence. The [Learning Paths](../SKILLS-GUIDE.md#learning-paths) section has beginner-friendly progressions.

### "I found an error in a skill"
→ [Open an issue](https://github.com/opencode-skills/opencode-skills/issues) or submit a PR with corrections. See [HOW-TO-CONTRIBUTE.md](../HOW-TO-CONTRIBUTE.md).

### "I want to suggest a new skill"
→ [Open an issue](https://github.com/opencode-skills/opencode-skills/issues) with the tag `[skill-request]`. Include what it should cover and why it's useful.

### "How do I use these with OpenCode CLI?"
→ See [QUICK-START.md](../QUICK-START.md) for CLI examples, or the [Agents & Models guide](../AGENTS-MODELS.md) for configuration.

---

## Navigation

- **[README.md](../README.md)** — Repo overview
- **[SKILLS-GUIDE.md](../SKILLS-GUIDE.md)** — Discover skills by task, role, or complexity
- **[QUICK-START.md](../QUICK-START.md)** — Installation and first use
- **[HOW-TO-CONTRIBUTE.md](../HOW-TO-CONTRIBUTE.md)** — Write a new skill
- **[AGENTS-MODELS.md](../AGENTS-MODELS.md)** — Configure AI models
- **[docs/SKILL-FORMAT.md](../docs/SKILL-FORMAT.md)** — Technical spec for skill writing
- **[docs/WORKFLOW.md](../docs/WORKFLOW.md)** — End-to-end workflow examples

---

## FAQ

**Q: Do I need to read a skill from start to finish?**
A: No! Pick sections relevant to your task. Most people jump to "Common Tasks" or "Examples."

**Q: Can I use skills offline?**
A: Yes! Clone the repo and read the markdown files. Internet access only needed for external links and references.

**Q: Are skills language-specific?**
A: No, they're language-agnostic. Examples may use Python, bash, SQL, etc., but concepts transfer across languages.

**Q: How often are skills updated?**
A: Check the CHANGELOG.md in each skill folder. Major updates are announced in the repo [Releases](https://github.com/opencode-skills/opencode-skills/releases).

**Q: Can I fork and customize skills?**
A: Yes! All skills are open source. Customize them for your needs, or contribute improvements back to the community.

**Q: What's the best way to learn multiple skills?**
A: Follow a [Learning Path](../SKILLS-GUIDE.md#learning-paths) based on your role, or create your own by combining related skills.

---

## 🚀 Ready to Get Started?

1. **Pick a category** above
2. **Choose a skill** that matches your task
3. **Read the README** in that skill folder
4. **Follow a common task** or example
5. **Practice** on your own code/data
6. **Share** what you learn!

**Happy skilling!** 🎓

---

**Last updated:** 2026 | **Community-maintained** | [GitHub](https://github.com/opencode-skills/opencode-skills)
