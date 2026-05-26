# Skills Guide — Discover & Choose Your Skill

Welcome to the **Skills Guide**. This document helps you find the right skill for your task, understand what each skill does, and see how skills work together.

---

## 📍 Quick Navigation

- **[Browse by Category](#browse-by-category)** — Security, Development, Writing, Data, DevOps, Learning
- **[Find Skills by Task](#find-skills-by-task)** — What do you want to do?
- **[Skill Combinations](#skill-combinations)** — Pair skills for powerful workflows
- **[Learning Paths](#learning-paths)** — Structured guides for common journeys
- **[New to Skills?](#new-to-skills)** — Start here if this is your first time

---

## Browse by Category

### 🔴 **Security**

| Skill | What It Does | Best For | Complexity |
|-------|-----------|----------|-----------|
| **penetration-testing** | Plan, execute, and report on security assessments | Red teams, pentesters, security audits | Medium–High |
| **vulnerability-scanner** | Identify CVEs, misconfigurations, and weak points | Quick security scans, baseline checks | Low–Medium |
| **access-control** | Design and audit IAM, RBAC, and permission models | Authorization policy, least-privilege design | Medium |
| **threat-analysis** | Analyze attack vectors, model threat actors | Security strategy, risk assessment | Medium–High |
| **payload-craft** | [Example] Generate test payloads (education only) | Penetration testing, exploit development | High |

**Getting Started:** Start with **vulnerability-scanner** for a quick win, then level up to **penetration-testing** for full assessments.

---

### 💻 **Development**

| Skill | What It Does | Best For | Complexity |
|-------|-----------|----------|-----------|
| **code-review** | Review code changes, flag issues, suggest improvements | PR reviews, code quality gates | Low–Medium |
| **debugging** | Trace errors, debug logs, find root causes | Troubleshooting production issues | Medium |
| **refactoring** | Modernize legacy code, improve structure | Code cleanup, performance tuning | Medium–High |
| **api-design** | Build and document REST/GraphQL APIs | API planning, spec writing, versioning | Medium |
| **testing-strategy** | Design test suites, coverage plans, test data | QA planning, test automation setup | Medium |

**Getting Started:** Use **code-review** first for immediate feedback, then pair with **testing-strategy** to strengthen your codebase.

---

### ✍️ **Writing & Documentation**

| Skill | What It Does | Best For | Complexity |
|-------|-----------|----------|-----------|
| **readme-writer** | Create engaging, complete README files | Project documentation, getting started | Low |
| **technical-writing** | Write clear technical docs, tutorials, guides | API docs, how-tos, architecture guides | Low–Medium |
| **editing** | Improve clarity, grammar, tone, structure | Polish drafts, prepare for publication | Low |
| **changelog-generator** | Write and format changelogs from commits | Release notes, version history | Low |
| **docstring-writer** | Document code with clear, standard docstrings | Inline code documentation, API autodocs | Low–Medium |

**Getting Started:** Begin with **readme-writer** for your project, then add **docstring-writer** for code documentation.

---

### 📊 **Data & Analysis**

| Skill | What It Does | Best For | Complexity |
|-------|-----------|----------|-----------|
| **data-explorer** | Inspect, summarize, and understand data | Initial data discovery, quick insights | Low |
| **sql-optimizer** | Write and optimize SQL queries | Database performance, complex queries | Medium |
| **visualization** | Create charts, graphs, dashboards | Reporting, presentation, insights | Medium |
| **data-cleaning** | Sanitize, deduplicate, format data | Data prep, preprocessing | Medium |
| **statistical-analysis** | Run stats tests, find correlations, model data | Research, hypothesis testing, ML prep | Medium–High |

**Getting Started:** Use **data-explorer** to understand your data, then **data-cleaning** before analysis.

---

### 🔧 **DevOps & Infrastructure**

| Skill | What It Does | Best For | Complexity |
|-------|-----------|----------|-----------|
| **docker-maestro** | Write, optimize, and troubleshoot Dockerfiles | Containerization, deployment prep | Medium |
| **kubernetes-config** | Design and manage Kubernetes manifests | Orchestration, multi-service deployments | Medium–High |
| **ci-cd-pipeline** | Build GitHub Actions, GitLab CI, Jenkins workflows | Automation, testing pipelines | Medium |
| **system-hardening** | Secure Linux/Windows systems, apply baselines | Security ops, compliance, hardening | Medium–High |
| **monitoring-setup** | Configure alerts, logs, dashboards | Observability, alerting, incident response | Medium |

**Getting Started:** Start with **docker-maestro** to containerize apps, then **ci-cd-pipeline** to automate testing.

---

### 🧠 **Learning & Study**

| Skill | What It Does | Best For | Complexity |
|-------|-----------|----------|-----------|
| **explain-concept** | Break down complex ideas, teach from first principles | Learning new tech, mentoring, teaching | Low |
| **quiz-generator** | Create practice questions and quizzes | Self-study, exam prep | Low–Medium |
| **interview-prep** | Prepare coding problems, system design, behavioral | Interview coaching, mock interviews | Medium–High |
| **research-synthesis** | Summarize papers, find key insights, compare approaches | Literature review, learning trends | Medium |

**Getting Started:** Use **explain-concept** to learn something new, then **quiz-generator** to test yourself.

---

## Find Skills by Task

### ⚡ **Quick Answers** (< 5 minutes)

| Task | Recommended Skills | Why |
|------|-------------------|-----|
| Review a PR | **code-review** | Fast feedback on specific changes |
| Fix a bug | **debugging** | Trace root causes methodically |
| Understand a codebase | **explain-concept** | Break it down section by section |
| Improve documentation | **editing** | Polish existing content |
| Find API issues | **api-design** | Design review catches mismatches |

### 🔄 **Workflow Tasks** (1–2 hours)

| Task | Recommended Skills | Why |
|------|-------------------|-----|
| Audit permissions | **access-control** | Systematic IAM review |
| Explore a dataset | **data-explorer** + **visualization** | Understand shape + communicate findings |
| Set up CI/CD | **ci-cd-pipeline** + **docker-maestro** | Automated testing + containerization |
| Refactor a module | **refactoring** + **testing-strategy** | Improve code + ensure quality |
| Write API docs | **technical-writing** + **docstring-writer** | Complete external + internal docs |

### 📈 **Major Projects** (multi-day)

| Task | Recommended Skills | Why |
|------|-------------------|-----|
| Plan a security assessment | **penetration-testing** + **threat-analysis** | Systematic attack planning + threat model |
| Redesign a system | **api-design** + **system-hardening** + **monitoring-setup** | API contracts + security + observability |
| Launch a new service | **docker-maestro** + **kubernetes-config** + **ci-cd-pipeline** | Container + orchestration + automation |
| Prepare for an interview | **interview-prep** + **explain-concept** + **quiz-generator** | Problems + explanations + self-testing |

---

## Skill Combinations

Combine 2+ skills for powerful workflows. See **docs/WORKFLOW.md** for full end-to-end examples.

### 🔴 Security Assessment Workflow
```
threat-analysis
    ↓
penetration-testing
    ↓
payload-craft (if needed)
    ↓
vulnerability-scanner (verify)
```
**Use Case:** Red team exercise. Map threats → plan attack → execute → verify findings.

---

### 💻 Code Quality Workflow
```
code-review
    ↓
refactoring (if issues found)
    ↓
testing-strategy (before merge)
    ↓
docstring-writer (document changes)
```
**Use Case:** Improve PR quality. Review → improve → test → document.

---

### ✍️ Documentation Overhaul
```
readme-writer
    ↓
technical-writing
    ↓
docstring-writer
    ↓
changelog-generator
```
**Use Case:** Complete documentation refresh. README → guides → code docs → release notes.

---

### 📊 Data Pipeline
```
data-explorer
    ↓
data-cleaning
    ↓
sql-optimizer
    ↓
visualization
    ↓
statistical-analysis
```
**Use Case:** Raw data to insight. Explore → clean → query → visualize → analyze.

---

### 🔧 Deployment Workflow
```
docker-maestro
    ↓
ci-cd-pipeline
    ↓
kubernetes-config (if scaling)
    ↓
monitoring-setup
    ↓
system-hardening
```
**Use Case:** Development to production. Containerize → automate → orchestrate → monitor → secure.

---

### 🧠 Learning & Interview Prep
```
explain-concept
    ↓
research-synthesis (dive deeper)
    ↓
interview-prep
    ↓
quiz-generator (self-test)
```
**Use Case:** Master a new skill. Learn → research → practice problems → quiz yourself.

---

## Learning Paths

Follow these structured journeys based on your role or goal.

### 👨‍💻 **Full-Stack Developer**

1. **Foundation** (Weeks 1–2)
   - `explain-concept` — Understand core concepts
   - `readme-writer` — Document your project
   
2. **Development** (Weeks 3–4)
   - `code-review` — Critique your own code
   - `refactoring` — Clean it up
   - `testing-strategy` — Plan test coverage

3. **Deployment** (Weeks 5–6)
   - `docker-maestro` — Containerize
   - `ci-cd-pipeline` — Automate testing
   - `monitoring-setup` — Observe production

4. **Polish** (Week 7+)
   - `technical-writing` — API docs
   - `docstring-writer` — Code comments
   - `changelog-generator` — Release notes

---

### 🛡️ **Security Professional**

1. **Fundamentals** (Weeks 1–2)
   - `explain-concept` — Learn security principles
   - `access-control` — Understand IAM
   
2. **Assessment** (Weeks 3–4)
   - `threat-analysis` — Model threats
   - `vulnerability-scanner` — Find issues
   - `penetration-testing` — Execute assessments

3. **Infrastructure Security** (Weeks 5–6)
   - `system-hardening` — Secure systems
   - `api-design` — Secure APIs
   - `access-control` — Implement RBAC

4. **Operations** (Week 7+)
   - `monitoring-setup` — Detect incidents
   - `ci-cd-pipeline` — Automated security testing

---

### 📈 **Data Analyst / Scientist**

1. **Foundation** (Weeks 1–2)
   - `explain-concept` — Statistics basics
   - `data-explorer` — Explore datasets

2. **Preparation** (Weeks 3–4)
   - `data-cleaning` — Prepare data
   - `sql-optimizer` — Query databases

3. **Analysis & Insights** (Weeks 5–6)
   - `statistical-analysis` — Run analyses
   - `visualization` — Create charts
   - `research-synthesis` — Find patterns

4. **Communication** (Week 7+)
   - `technical-writing` — Write reports
   - `documentation` — Share findings

---

### 🎓 **Student / Learner**

1. **Build Foundations** (Weeks 1–3)
   - `explain-concept` — Learn new topics
   - `quiz-generator` — Self-test knowledge

2. **Go Deep** (Weeks 4–6)
   - `research-synthesis` — Read papers, find best practices
   - `interview-prep` — Practice problems

3. **Master It** (Week 7+)
   - `code-review` / `technical-writing` — Apply learning
   - Keep using **quiz-generator** for retention

---

## Skill Complexity Map

```
| LOW | MEDIUM | HIGH |
|-----|--------|------|
| readme-writer | code-review | penetration-testing |
| editing | api-design | threat-analysis |
| docstring-writer | testing-strategy | kubernetes-config |
| changelog-generator | data-explorer | interview-prep |
| explain-concept | refactoring | payload-craft |
| | debugging | |
| | docker-maestro | |
| | ci-cd-pipeline | |
| | data-cleaning | |
| | visualization | |
| | access-control | |
| | system-hardening | |

```

**Pick Based on Your Confidence:**
- **Starting out?** Green circle (LOW) — quick wins, build momentum
- **Intermediate?** Yellow circle (MEDIUM) — time to level up
- **Advanced?** Red circle (HIGH) — master the craft

---

## New to Skills?

### What is a Skill?
A **skill** is a specialized knowledge module. It contains:
- **Overview** — What the skill does
- **Core concepts** — Key ideas you need
- **Common tasks** — Step-by-step how-tos
- **Examples** — Real-world code and prompts
- **Tips & best practices** — Pro tips
- **References** — Docs, tutorials, tools

### How Skills Work
1. **Read a skill** to understand the domain
2. **Pick a task** from the skill's "Common Tasks" section
3. **Run the example** with your data/code
4. **Customize** for your specific situation
5. **Combine with other skills** for complex workflows

### First Steps
1. **Choose a category** above that matches your job or interest
2. **Pick a "Low" complexity skill** for your first try
3. **Follow the "Quick Start"** in the skill README
4. **Run an example** from EXAMPLES.md
5. **Apply to your own work** — modify and go!

### Getting Help
- **Questions about a skill?** Check its README and EXAMPLES files
- **Want to contribute a skill?** See [HOW-TO-CONTRIBUTE.md](./HOW-TO-CONTRIBUTE.md)
- **Bug or issue?** Open an [issue on GitHub](https://github.com/opencode-skills/opencode-skills/issues)
- **General docs?** See [README.md](./README.md) and [docs/](./docs/)

---

## FAQ

**Q: How many skills should I learn?**
A: Start with 1–2 aligned to your current role. Skills build on each other—you don't need to learn all of them.

**Q: Can I combine any skills?**
A: Most can, but some combinations are more natural. See "Skill Combinations" above for recommended pairings.

**Q: What if a skill doesn't match my exact use case?**
A: That's normal. Read the skill anyway—the concepts transfer. Adapt examples to your situation.

**Q: Are there skills for [my domain]?**
A: Browse the categories above, then check the full **[README Skills Directory](./README.md#-skills-directory)** table. Not found? Consider [contributing](./HOW-TO-CONTRIBUTE.md)!

**Q: Which skill should I learn first?**
A: Pick one from the LOW complexity tier in your domain. **readme-writer**, **code-review**, and **data-explorer** are universally useful first picks.

**Q: How long does it take to master a skill?**
A: Most people get productive in 1–2 hours. True mastery (combining with others, edge cases) takes weeks of practice.

---

## Skill Reference Card

**Quick lookup: Skill → Category → Complexity**

| 🔴 Security | 💻 Development | ✍️ Writing | 📊 Data |
|---|---|---|---|
| Penetration Testing (M-H) | Code Review (L-M) | README Writer (L) | Data Explorer (L) |
| Threat Analysis (M-H) | Debugging (M) | Technical Writing (L-M) | SQL Optimizer (M) |
| Access Control (M) | Refactoring (M-H) | Editing (L) | Visualization (M) |
| Vulnerability Scanner (L-M) | API Design (M) | Changelog Generator (L) | Data Cleaning (M) |
| | Testing Strategy (M) | Docstring Writer (L-M) | Statistical Analysis (M-H) |

| 🔧 DevOps | 🧠 Learning |
|---|---|
| Docker Maestro (M) | Explain Concept (L) |
| Kubernetes Config (M-H) | Quiz Generator (L-M) |
| CI/CD Pipeline (M) | Interview Prep (M-H) |
| System Hardening (M-H) | Research Synthesis (M) |
| Monitoring Setup (M) | |

---

## Last Updated
This guide is maintained alongside the skill directory. When new skills are added, this guide updates. See [CHANGELOG.md](./CHANGELOG.md) for updates.

---

**Ready?** Pick a skill above and dive in, or explore the full **[README](./README.md)** for repo structure and contributing info.

Happy skilling! 🚀
