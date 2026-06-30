---
name: workstation-expert
description: Specialized knowledge of the ASUS GX10 workstation architecture, environment constraints, development workflows, and business operations. Use when troubleshooting environment issues or architecting new integrations.
---

# ASUS GX10 Workstation Expertise

## Hardware & OS
| Item | Value |
|------|-------|
| CPU | 20-Core ARM aarch64 (Grace Blackwell GB10) |
| RAM | 128 GB LPDDR5x Unified (CPU+GPU coherent) |
| OS | Ubuntu 24.04.4 LTS |
| CUDA | 13.0 |
| Cost | USD $3,800 (NTD $122,665) |

## Environment Constraints (Ubuntu 24.04 PEP 668)
- **DO NOT** use `pip install` globally — environment is "Externally Managed"
- **USE** virtual environments or `pipx`
- ComfyUI venv: `/home/hjs/comfyui_env`
- SD WebUI venv: `/home/hjs/stable-diffusion-webui/venv`
- Always `source <venv>/bin/activate` before running Python AI scripts

## Key Paths
| Resource | Path |
|----------|------|
| Book Factory | `/home/hjs/gx10-book-factory/` |
| Scripts | `/home/hjs/gx10-book-factory/scripts/` |
| ACG Test Repo | `/home/hjs/test-nfsw-acg/` |
| Setup Repo | `/home/hjs/asus-gx10-ai-setup/` |
| ComfyUI | `/home/hjs/ComfyUI/` |
| SD WebUI | `/home/hjs/stable-diffusion-webui/` |
| Ollama binary | `/home/hjs/bin/ollama` |
| Aider binary | `/home/hjs/.local/bin/aider` |
| Gemini skills | `/home/hjs/.gemini/skills/` |
| Codex skills | `/home/hjs/.codex/skills/` |
| Aider guide | `/home/hjs/AIDER_CONSULTANT_GUIDE.md` |

## Aider Configuration
- Config: `~/.aider.conf.yml` (auto-commits: true, nord theme)
- Consultant guide: `/home/hjs/AIDER_CONSULTANT_GUIDE.md`
- Cross-repo limit: Aider cannot edit outside its Git root — symlink files in if needed
- `/run` command: executes shell commands inside Aider session (critical — Aider often forgets this)

## Networking
| Service | Access |
|---------|--------|
| Tailscale | `100.108.147.12` (direct LAN-like) |
| ComfyUI public | `http://ai.hjs.space` (Cloudflare Tunnel) |
| SD WebUI public | `http://sd.hjs.space` |
| Ollama public | `http://ollama.hjs.space` |
| DDNS | `h.hjs.space` updated by `~/asus-gx10-ai-setup/cf_ddns.py` |

## GitHub Repos
| Repo | Remote | Privacy |
|------|--------|---------|
| `gx10-book-factory` | `github.com/githubhjs/gx10-book-factory` | Private |
| `asus-gx10-ai-setup` | `github.com/githubhjs/asus-gx10-ai-setup` | Private |
| `test-nfsw-acg` | No remote — local only | Local |

## Business Operations (ACG + Book Factory)
- **Hardware ROI target:** USD $3,800 recovered in ~4.5 months
- **Monthly costs:** ~$125 (depreciation + electricity + internet)
- **Revenue pillars:** Children's Books / ACG Content / B2B LoRA services
- **ACG platforms:** Pixiv Fanbox, SubscribeStar, Gumroad, itch.io
- **Compliance:** 18+ fictional characters only, no real people, no specific IP names

## Tmux Multi-Agent Setup
| Pane | Repo | Agent |
|------|------|-------|
| `0:4.0` | `gx10-book-factory` | Aider |
| `0:5.0` | `test-nfsw-acg` | Aider |
| `0:6.0` | `/home/hjs` | Round-robin babysitter |
| `0:0.0` | `/home/hjs` | Codex CLI |
| `1:0.0` | `/home/hjs` | Claude CLI |
| `2:0.0` | `/home/hjs` | Gemini CLI |

Babysitter script: `/home/hjs/aider-round-robin.py` — enforces turn-based Ollama access between both Aider panes.
