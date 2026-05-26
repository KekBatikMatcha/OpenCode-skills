# Common Workflows

Real end-to-end workflows showing how to combine OpenCode Skills with models, agents, and shell patterns to get actual work done.

This isn't a format reference or a setup guide — it's a cookbook. Each workflow is a complete scenario you can follow step by step or adapt to your own situation.

---

## Table of Contents

1. [Security Assessment Workflow](#1-security-assessment-workflow)
2. [Code Review Workflow](#2-code-review-workflow)
3. [Writing & Documentation Workflow](#3-writing--documentation-workflow)
4. [Data Analysis Workflow](#4-data-analysis-workflow)
5. [Learning & Study Workflow](#5-learning--study-workflow)
6. [DevOps & Automation Workflow](#6-devops--automation-workflow)
7. [Multi-Skill Workflow](#7-multi-skill-workflow)
8. [Batch Processing Workflow](#8-batch-processing-workflow)
9. [Shell Integration Patterns](#9-shell-integration-patterns)

---

## 1. Security Assessment Workflow

**Goal:** Systematically assess a web application for vulnerabilities.

**Skills:** `web-pentest-tools`  
**Model:** `claude-opus-4.6` or `groq/llama-3.1-70b` (free)  
**Agent:** `penetration-testing`

### Step 1 — Build a testing plan

Start by generating a structured plan before touching anything:

```bash
opencode --model claude-opus-4.6 --agent penetration-testing \
  "by using web-pentest-tools, create a full penetration testing plan for a SaaS
   web application with login, dashboard, REST API, and file upload features"
```

Save the output for reference:

```bash
opencode --model claude-opus-4.6 --agent penetration-testing \
  "by using web-pentest-tools, create a full penetration testing plan for a SaaS
   web application with login, dashboard, REST API, and file upload features" \
  > pentest-plan.md
```

### Step 2 — Enumerate attack surface

```bash
opencode --model claude-opus-4.6 --agent reconnaissance \
  "by using web-pentest-tools, list all attack vectors I should test for a
   login form that accepts email and password, with rate limiting and CAPTCHA"
```

### Step 3 — Generate payloads for a specific vulnerability

```bash
# SQL Injection payloads
opencode --model claude-sonnet-4 --agent penetration-testing \
  "by using web-pentest-tools, give me SQL injection payloads for a login form
   that uses PostgreSQL, including blind injection and error-based techniques"

# XSS payloads
opencode --model claude-sonnet-4 --agent penetration-testing \
  "by using web-pentest-tools, give me XSS payloads to test a comment field
   that filters <script> tags — include filter bypass techniques"
```

### Step 4 — Analyze findings

Pipe your tool output directly into OpenCode for analysis:

```bash
# Analyze Nmap scan results
nmap -sV -sC target.example.com | opencode --agent penetration-testing \
  "by using web-pentest-tools, analyze this Nmap output and identify
   the most critical vulnerabilities to investigate first"

# Analyze Burp Suite export
opencode --model claude-opus-4.6 --agent penetration-testing \
  "by using web-pentest-tools, analyze these Burp Suite findings and
   prioritize them by severity" < burp-export.xml
```

### Step 5 — Write the report

```bash
opencode --model claude-opus-4.6 --agent penetration-testing \
  "by using web-pentest-tools, write a professional penetration testing
   report executive summary based on these findings:" < findings.md \
  > report-executive-summary.md
```

---

## 2. Code Review Workflow

**Goal:** Thoroughly review a codebase or PR for bugs, style issues, and security problems.

**Skills:** `code-reviewer`, `python-assistant` (or relevant language skill)  
**Model:** `claude-sonnet-4` or `ollama/codellama` (free)  
**Agent:** `code-review`

### Step 1 — Review a single file

```bash
opencode --model claude-sonnet-4 --agent code-review \
  "by using code-reviewer, review this file for bugs, anti-patterns,
   and security issues" < src/auth.py
```

### Step 2 — Review a git diff (PR review)

```bash
# Review the current staged changes
git diff --staged | opencode --model claude-sonnet-4 --agent code-review \
  "by using code-reviewer, review this diff as a senior engineer.
   Flag bugs, logic errors, and anything that would fail code review"

# Review a specific PR branch vs main
git diff main..feature/new-auth | opencode --model claude-opus-4.6 --agent code-review \
  "by using code-reviewer, do a thorough review of this PR diff.
   Separate findings into: bugs, style issues, and suggestions"
```

### Step 3 — Review multiple files in sequence

```bash
for file in src/*.py; do
  echo "=== Reviewing: $file ===" >> review-output.md
  opencode --model claude-sonnet-4 --agent code-review \
    "by using code-reviewer, briefly review this file and list any issues" \
    < "$file" >> review-output.md
  echo "" >> review-output.md
done
```

### Step 4 — Targeted reviews

```bash
# Security-focused review
opencode --model claude-opus-4.6 --agent code-review \
  "by using code-reviewer, focus only on security vulnerabilities in this file —
   check for injection, auth issues, insecure data handling" < api/routes.py

# Performance review
opencode --model claude-sonnet-4 --agent code-review \
  "by using code-reviewer, identify performance bottlenecks and inefficient
   patterns in this file" < db/queries.py

# Test coverage review
opencode --model claude-sonnet-4 --agent code-review \
  "by using code-reviewer, identify which cases are not covered by these tests
   and suggest what should be added" < tests/test_auth.py
```

### Step 5 — Generate a review summary

```bash
opencode --model claude-sonnet-4 --agent code-review \
  "by using code-reviewer, write a concise PR review comment summarizing
   these findings, suitable for posting on GitHub" < review-output.md
```

---

## 3. Writing & Documentation Workflow

**Goal:** Write, improve, or restructure technical documentation.

**Skills:** `technical-writer`  
**Model:** `claude-sonnet-4` or `gemini-2.0-flash` (free)  
**Agent:** `technical-writing`

### Step 1 — Write a README from scratch

```bash
# Describe your project and get a full README
opencode --model claude-sonnet-4 --agent technical-writing \
  "by using technical-writer, write a complete README.md for a CLI tool called
   'csvkit' that converts, filters, and joins CSV files. It's written in Python,
   open source (MIT), and targets data engineers"
```

### Step 2 — Improve an existing document

```bash
# Rewrite for clarity
opencode --model claude-sonnet-4 --agent technical-writing \
  "by using technical-writer, rewrite this README to be clearer and more
   scannable without changing the information" < README.md

# Fix tone and consistency
opencode --model claude-sonnet-4 --agent technical-writing \
  "by using technical-writer, review this document for tone inconsistencies,
   passive voice, and unclear sentences. Suggest rewrites for each" < docs/guide.md
```

### Step 3 — Generate API documentation

```bash
# From an OpenAPI spec
opencode --model claude-sonnet-4 --agent technical-writing \
  "by using technical-writer, write clear human-readable API reference docs
   for each endpoint in this spec. Include usage examples" < openapi.yaml

# From source code
opencode --model claude-sonnet-4 --agent technical-writing \
  "by using technical-writer, write API reference documentation for all
   public functions in this file. Use a consistent format with parameters,
   return values, and examples" < src/client.py
```

### Step 4 — Write a changelog entry

```bash
git log --oneline v1.2.0..HEAD | opencode --model claude-sonnet-4 \
  "by using technical-writer, write a CHANGELOG entry in Keep a Changelog
   format for these git commits"
```

### Step 5 — Generate docstrings in bulk

```bash
for file in src/**/*.py; do
  opencode --model claude-sonnet-4 \
    "by using technical-writer and python-assistant, add Google-style
     docstrings to all public functions and classes in this file
     that are missing them. Output the full updated file" \
    < "$file" > "docs-updated/$(basename $file)"
done
```

---

## 4. Data Analysis Workflow

**Goal:** Clean, explore, and extract insights from a dataset.

**Skills:** `data-analyzer`, `sql-assistant`  
**Model:** `claude-sonnet-4` or `groq/mixtral-8x7b` (free)  
**Agent:** `data-analysis`

### Step 1 — Understand your data

```bash
# Get a summary of a CSV file's structure
head -5 data.csv | opencode --model claude-sonnet-4 --agent data-analysis \
  "by using data-analyzer, describe the structure of this CSV data.
   Identify column types, likely data quality issues, and what analysis
   is possible with it"
```

### Step 2 — Write analysis queries

```bash
# Generate SQL for a specific question
opencode --model claude-sonnet-4 --agent data-analysis \
  "by using sql-assistant, write a SQL query to find the top 10 customers
   by total revenue in the last 90 days. Tables: orders(id, customer_id,
   created_at, total), customers(id, name, email)"

# Optimize an existing query
opencode --model claude-sonnet-4 --agent data-analysis \
  "by using sql-assistant, optimize this query for performance and
   explain what you changed and why" < slow-query.sql
```

### Step 3 — Generate analysis scripts

```bash
opencode --model claude-sonnet-4 --agent data-analysis \
  "by using data-analyzer, write a Python script using pandas to:
   1. Load this CSV
   2. Remove duplicates and null values
   3. Generate a summary statistics table
   4. Plot revenue by month as a bar chart
   Column names: date, product_id, revenue, region" \
  > analyze.py
```

### Step 4 — Interpret results

```bash
# Pipe analysis output back for interpretation
python analyze.py | opencode --model claude-sonnet-4 --agent data-analysis \
  "by using data-analyzer, interpret these results and highlight the
   three most actionable insights for a business audience"
```

### Step 5 — Write a summary report

```bash
opencode --model claude-sonnet-4 --agent data-analysis \
  "by using data-analyzer and technical-writer, write a one-page executive
   summary of these findings in plain language for a non-technical audience" \
  < findings.txt > executive-summary.md
```

---

## 5. Learning & Study Workflow

**Goal:** Understand a new concept, prepare for an exam, or work through a problem.

**Skills:** `coding-tutor`, `interview-prep`  
**Model:** `claude-sonnet-4` or `ollama/mistral` (free)  
**Agent:** `educator`

### Step 1 — Explain a concept from scratch

```bash
opencode --model claude-sonnet-4 --agent educator \
  "by using coding-tutor, explain how hash tables work to someone who
   understands arrays but has never seen a hash table before.
   Use a real-world analogy, then show it in Python"
```

### Step 2 — Go deeper on a specific area

```bash
opencode --model claude-sonnet-4 --agent educator \
  "by using coding-tutor, I understand hash tables now. Explain collision
   resolution — specifically chaining vs open addressing — with examples
   showing when each performs better"
```

### Step 3 — Generate practice problems

```bash
opencode --model claude-sonnet-4 --agent educator \
  "by using interview-prep, give me 5 LeetCode-style problems on hash tables
   ranging from easy to hard. For each: the problem statement, expected input/
   output, hints, and the optimal solution with explanation"
```

### Step 4 — Get feedback on your solution

```bash
opencode --model claude-sonnet-4 --agent educator \
  "by using interview-prep, review my solution to this problem and tell me:
   1) does it work correctly, 2) what's the time and space complexity,
   3) how would an interviewer respond to it, 4) how could it be improved" \
  < my-solution.py
```

### Step 5 — Simulate an interview

```bash
opencode --model claude-opus-4.6 --agent educator \
  "by using interview-prep, act as a technical interviewer at a top tech company.
   Give me a medium-difficulty algorithm problem, wait for my answer, then
   give feedback. Start with the problem now."
```

---

## 6. DevOps & Automation Workflow

**Goal:** Build, debug, or improve infrastructure and automation scripts.

**Skills:** `workflow-automation`, `docker-guide`, `ci-cd-helper`  
**Model:** `claude-sonnet-4` or `ollama/llama3.2` (free)  
**Agent:** `devops`

### Step 1 — Write a shell automation script

```bash
opencode --model claude-sonnet-4 --agent devops \
  "by using workflow-automation, write a Bash script that:
   1. Backs up a PostgreSQL database to S3 with a timestamp
   2. Keeps only the last 7 daily backups in S3
   3. Sends a Slack notification on success or failure
   4. Runs safely with set -euo pipefail" \
  > backup.sh
```

### Step 2 — Dockerize an application

```bash
opencode --model claude-sonnet-4 --agent devops \
  "by using docker-guide, write an optimized multi-stage Dockerfile for a
   Python FastAPI application. Requirements: Python 3.12, poetry for dependencies,
   non-root user, health check, minimal final image size" \
  > Dockerfile

# Also generate the compose file
opencode --model claude-sonnet-4 --agent devops \
  "by using docker-guide, write a docker-compose.yml for this FastAPI app
   with PostgreSQL and Redis. Include volumes, health checks, and a .env
   file reference" \
  > docker-compose.yml
```

### Step 3 — Debug a failing pipeline

```bash
# Pipe CI logs into OpenCode for diagnosis
cat ci-failure.log | opencode --model claude-sonnet-4 --agent devops \
  "by using ci-cd-helper, analyze this CI failure log and identify the root
   cause. Suggest the exact fix needed"
```

### Step 4 — Generate a GitHub Actions workflow

```bash
opencode --model claude-sonnet-4 --agent devops \
  "by using ci-cd-helper, write a GitHub Actions workflow that:
   - Runs on push to main and on PRs
   - Tests a Python project with pytest across Python 3.10, 3.11, 3.12
   - Builds and pushes a Docker image on merge to main
   - Deploys to a server via SSH on successful build" \
  > .github/workflows/ci.yml
```

### Step 5 — Audit existing infrastructure config

```bash
opencode --model claude-opus-4.6 --agent devops \
  "by using docker-guide and ci-cd-helper, review this docker-compose file
   and CI config for security issues, inefficiencies, and missing best
   practices" < docker-compose.yml
```

---

## 7. Multi-Skill Workflow

**Goal:** Combine two or more skills in a single prompt for cross-domain tasks.

You can reference multiple skills in one command by listing them with "and":

```bash
opencode "by using skill-one and skill-two, [request]"
```

### Examples

**Secure and document an API:**
```bash
opencode --model claude-opus-4.6 \
  "by using web-pentest-tools and technical-writer, review this API spec for
   security vulnerabilities AND write a security considerations section for
   the documentation" < openapi.yaml
```

**Write and test a script:**
```bash
opencode --model claude-sonnet-4 \
  "by using workflow-automation and code-reviewer, write a Bash script to
   rotate log files, then immediately review it for correctness and edge cases"
```

**Analyze data and document findings:**
```bash
opencode --model claude-sonnet-4 \
  "by using data-analyzer and technical-writer, analyze this CSV for trends
   and write the findings as a professional report with an executive summary" \
  < sales-q4.csv > q4-report.md
```

**Teach with working code:**
```bash
opencode --model claude-sonnet-4 --agent educator \
  "by using coding-tutor and python-assistant, explain Python generators with
   clear analogies, then show 3 real production use cases with full working code"
```

**Audit and fix code:**
```bash
opencode --model claude-opus-4.6 --agent code-review \
  "by using code-reviewer and python-assistant, find all bugs in this file
   and rewrite it with all issues fixed. Show a before/after diff" < app.py
```

---

## 8. Batch Processing Workflow

**Goal:** Run OpenCode across many files or inputs automatically.

### Process all files in a directory

```bash
#!/usr/bin/env bash
# review-all.sh — run code review on every Python file

INPUT_DIR="./src"
OUTPUT_DIR="./reviews"
mkdir -p "$OUTPUT_DIR"

for file in "$INPUT_DIR"/**/*.py; do
  name=$(basename "$file" .py)
  echo "Reviewing: $file"
  opencode --model claude-sonnet-4 --agent code-review \
    "by using code-reviewer, review this file and list issues by severity" \
    < "$file" > "$OUTPUT_DIR/$name-review.md"
done

echo "Done. Reviews saved to $OUTPUT_DIR/"
```

### Process a list of inputs from a file

```bash
#!/usr/bin/env bash
# explain-errors.sh — explain each error in a log file

while IFS= read -r error; do
  echo "## $error" >> explanations.md
  echo "$error" | opencode --model claude-haiku-3.5 \
    "by using workflow-automation, briefly explain this error and how to fix it" \
    >> explanations.md
  echo "" >> explanations.md
done < error-list.txt
```

### Generate docs for a whole codebase

```bash
#!/usr/bin/env bash
# generate-docs.sh

find ./src -name "*.py" | while read -r file; do
  outfile="./docs/$(basename "$file" .py).md"
  opencode --model claude-sonnet-4 --agent technical-writing \
    "by using technical-writer and python-assistant, write API reference docs
     for all public functions and classes in this file" \
    < "$file" > "$outfile"
  echo "Generated: $outfile"
done
```

### Rate limiting for large batches

If you're processing many files with a paid API, add a small delay to avoid rate limits:

```bash
for file in src/*.py; do
  opencode --model claude-sonnet-4 \
    "by using code-reviewer, briefly summarize what this file does" < "$file"
  sleep 1   # 1 second between requests
done
```

---

## 9. Shell Integration Patterns

Practical shell patterns for getting more out of OpenCode Skills.

### Pipe output from a command

```bash
# Explain a command's output
ls -la /etc/ | opencode "by using workflow-automation, explain what these files are"

# Diagnose a process
ps aux | grep python | opencode "by using workflow-automation, which of these Python processes look abnormal?"

# Interpret a log file
tail -100 /var/log/nginx/error.log | opencode "by using workflow-automation, summarize the errors and their frequency"
```

### Save output to a file

```bash
opencode --model claude-sonnet-4 \
  "by using technical-writer, write a CONTRIBUTING.md for an open source Python library" \
  > CONTRIBUTING.md
```

### Use heredoc for multiline input

```bash
opencode --model claude-sonnet-4 "by using sql-assistant, optimize this query:" << 'EOF'
SELECT u.name, COUNT(o.id) as order_count, SUM(o.total) as revenue
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
WHERE o.created_at > NOW() - INTERVAL '30 days'
GROUP BY u.name
ORDER BY revenue DESC;
EOF
```

### Chain with other tools

```bash
# Translate jq output into plain English
curl -s https://api.example.com/stats | jq '.metrics' | \
  opencode "by using data-analyzer, explain these metrics in plain language"

# Summarize git history
git log --since="1 week ago" --format="%s" | \
  opencode "by using technical-writer, write a weekly engineering update based on these commits"

# Check configs before deploying
cat docker-compose.yml | \
  opencode --agent devops "by using docker-guide, check this compose file for issues before I deploy"
```

### Create a shell alias for frequent workflows

Add to your `.bashrc` or `.zshrc`:

```bash
# Quick code review alias
alias review='opencode --model claude-sonnet-4 --agent code-review "by using code-reviewer, review this file for bugs and issues" <'

# Usage:
review src/auth.py

# Quick explain alias
alias explain='opencode --model claude-haiku-3.5 "by using coding-tutor, explain this briefly:" <'

# Usage:
explain confusing-script.sh
```

### Save frequently used workflows as scripts

```bash
#!/usr/bin/env bash
# ~/bin/pentest-plan — generate a pentest plan quickly

TARGET="${1:?Usage: pentest-plan <description>}"

opencode --model claude-opus-4.6 --agent penetration-testing \
  "by using web-pentest-tools, create a penetration testing plan for: $TARGET"
```

```bash
chmod +x ~/bin/pentest-plan
pentest-plan "a React SPA with a Node.js REST API and PostgreSQL backend"
```

---

## Quick Reference

| Workflow | Key Skill(s) | Recommended Model | Agent |
|----------|-------------|-------------------|-------|
| Security assessment | `web-pentest-tools` | `claude-opus-4.6` | `penetration-testing` |
| Code review | `code-reviewer` | `claude-sonnet-4` | `code-review` |
| Write documentation | `technical-writer` | `claude-sonnet-4` | `technical-writing` |
| Data analysis | `data-analyzer`, `sql-assistant` | `claude-sonnet-4` | `data-analysis` |
| Study / learning | `coding-tutor`, `interview-prep` | `claude-sonnet-4` | `educator` |
| DevOps / automation | `workflow-automation`, `docker-guide` | `claude-sonnet-4` | `devops` |
| Multi-domain tasks | any combination | `claude-opus-4.6` | context-dependent |
| Batch processing | any | `claude-haiku-3.5` | `default` |

---

<div align="center">

**[← Back to README](../README.md)** · **[Skill Format Reference](./SKILL-FORMAT.md)** · **[Agents & Models](../AGENTS-MODELS.md)**

</div>
