---
name: gx10-orchestrator
description: Manage local AI runtimes (Ollama, ComfyUI, Stable Diffusion WebUI) on the ASUS GX10 workstation. Use when starting, stopping, or checking status of local LLMs and image generators.
---

# GX10 AI Runtime Orchestration

## Hardware
| Item | Value |
|------|-------|
| SoC | NVIDIA Grace Blackwell GB10 (ARM aarch64) |
| RAM | 128 GB LPDDR5x Coherent Unified Memory (CPU+GPU shared) |
| OS | Ubuntu 24.04.4 LTS, CUDA 13.0 |
| Storage | 916 GB NVMe, ~598 GB free |
| Tailscale | `100.108.147.12` |
| Domains | `ai.hjs.space` → ComfyUI :8188 |

## Ollama
| Item | Value |
|------|-------|
| Binary | `/home/hjs/bin/ollama` |
| API | `http://127.0.0.1:11434` |
| Restart | `systemctl --user restart ollama` |

### Models
| Model | Size | Role |
|-------|------|------|
| `qwen3.5-queen-27b` | 28 GB | Primary (drafts, review, char gen) |
| `gemma-4-31b-uncensored` | 32 GB | Creative fallback, uncensored |
| `golddiamondgold-70b` | 42 GB | High-quality heavy fallback |
| `glm-4-9b-abliterated` | 10 GB | Fast lightweight tasks |
| `hermes3` | 4.7 GB | Tool-use / function calling |
| `nemotron-mini` | 2.7 GB | Ultra-fast triage |

### Ollama Python API
```python
import urllib.request, json

def ollama_generate(model: str, prompt: str) -> str:
    payload = json.dumps({"model": model, "prompt": prompt, "stream": False}).encode()
    req = urllib.request.Request("http://127.0.0.1:11434/api/generate",
                                  data=payload, headers={"Content-Type": "application/json"})
    with urllib.request.urlopen(req, timeout=120) as r:
        return json.loads(r.read())["response"].strip()
```

## ComfyUI
| Item | Value |
|------|-------|
| Location | `/home/hjs/ComfyUI` |
| Venv | `/home/hjs/comfyui_env` |
| Port | `8188` |
| Model | `animagine-xl-3.1.safetensors` (symlink) |
| Speed | ~67s/image |

```bash
# Start
source /home/hjs/comfyui_env/bin/activate
nohup python3 /home/hjs/ComfyUI/main.py --listen 127.0.0.1 --port 8188 > /tmp/comfyui.log 2>&1 &

# Health check
curl -s http://127.0.0.1:8188/system_stats | python3 -c "import sys,json; d=json.load(sys.stdin); print('OK v'+d['system']['comfyui_version'])"
```

## SD WebUI (A1111)
- Location: `/home/hjs/stable-diffusion-webui` | Port: `7860`
- Start: `cd ~/stable-diffusion-webui && ./webui.sh`

## Model Symlinking (save disk space)
```bash
# Symlink SD WebUI checkpoints → ComfyUI (already done for animagine)
ln -sf ~/stable-diffusion-webui/models/Stable-diffusion/animagine-xl-3.1.safetensors \
       ~/ComfyUI/models/checkpoints/animagine-xl-3.1.safetensors
```

## Memory Budget
- qwen3.5-queen-27b: 28 GB
- animagine-xl-3.1 SDXL: ~7 GB VRAM
- Both run simultaneously in 128 GB unified pool
- Free at runtime: ~83 GB

## Fallback Chain (LLM)
1. `qwen3.5-queen-27b` (local primary)
2. Gemini CLI (cloud, rate-limited)
3. `gemma-4-31b-uncensored` (local fallback)
4. Claude CLI (cloud escalation)
5. `golddiamondgold-70b` (heavy local last resort)
