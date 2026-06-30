---
name: book-factory-manager
description: Manage the Children's Book Factory pipeline. Use when generating story drafts, running peer reviews, assembling PDFs, or orchestrating the automated book production workflow.
---

# Children's Book Factory Management

## Production Workspace
- **Root:** `/home/hjs/gx10-book-factory`
- **Scripts:** `scripts/`
- **Drafts:** `books/drafts/`
- **Reviewed:** `books/reviewed/`
- **Rejected:** `books/rejected/`
- **Images:** `images/`
- **GitHub:** `https://github.com/githubhjs/gx10-book-factory` (private)

## Scripts Reference
| Script | Purpose | Command |
|--------|---------|--------|
| `draft_generator.py` | Generate book JSON via Qwen | `python3 scripts/draft_generator.py --theme "brave turtle"` |
| `peer_review.py` | 4-tier AI review | `python3 scripts/peer_review.py --book path/to.json` |
| `pipeline_runner.py` | Full auto pipeline | `python3 scripts/pipeline_runner.py --theme "brave turtle"` |
| `book_assembler.py` | JSON → PDF/EPUB | `python3 scripts/book_assembler.py --input draft.json` |
| `gen_image.py` | Single image + upload | `python3 scripts/gen_image.py --prompt "..." --upload` |
| `batch_gen.py` | Theme pack (20-50 imgs) | `python3 scripts/batch_gen.py --theme "..." --count 20 --upload --zip` |
| `git_auto_push.py` | Auto commit + push | `python3 scripts/git_auto_push.py` |

## Full Pipeline (One Command)
```bash
python3 /home/hjs/gx10-book-factory/scripts/pipeline_runner.py --theme "a brave little turtle"
# Runs: draft → peer_review → assemble → git push
```

## Peer Review Fallback Chain
1. **Tier 1 (Local):** `qwen3.5-queen-27b` via Ollama — infinite, zero cost
2. **Tier 2 (Cloud):** Gemini CLI — rate-limited (~20% quota typical)
3. **Tier 3 (Local Fallback):** `gemma-4-31b-uncensored` — when Gemini exhausted
4. **Tier 4 (Escalation):** Claude CLI — final resort

## Publishing Platforms (USD pricing)
| Platform | Market | Royalty | Priority |
|----------|--------|---------|----------|
| Amazon KDP | Global EN | 35-70% | ⭐⭐⭐⭐⭐ |
| Gumroad | Direct global | 91% | ⭐⭐⭐⭐⭐ |
| Apple Books | Global | 70% | ⭐⭐⭐⭐ |
| Google Play Books | Global | 52% | ⭐⭐⭐⭐ |
| Readmoo | Taiwan TW | 60-70% | ⭐⭐⭐⭐ |

## Book Revenue Math
- Price: USD $3.99 × 65% royalty = **$2.59/sale**
- Month 3 target: 90 books × 5 sales = 450 sales = **$1,165/mo**
- Month 6 target: 240 books × 12 sales = 2,880 = **$7,459/mo**

## Aider Usage
```bash
cd /home/hjs/gx10-book-factory
aider --read /home/hjs/AIDER_CONSULTANT_GUIDE.md scripts/peer_review.py
# Use /run for execution — never ask Aider to "describe" running commands
```
