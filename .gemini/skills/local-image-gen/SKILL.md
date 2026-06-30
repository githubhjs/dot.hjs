---
name: local-image-gen
description: Generate images locally using ComfyUI (port 8188) on the ASUS GX10. Use when creating illustrations for books, character art, ACG content, or any image generation task. Includes batch generation, theme packs, and upload to catbox.moe.
---

# Local Image Generation via ComfyUI

## Infrastructure
- **ComfyUI:** `/home/hjs/ComfyUI` | Port: `8188` | Venv: `/home/hjs/comfyui_env`
- **Primary Model:** `animagine-xl-3.1.safetensors` (SDXL, anime-optimized, symlinked from SD WebUI)
- **Pending model:** Pony Diffusion XL (ProteusV0.4) — not yet downloaded
- **Output Dir:** `/home/hjs/ComfyUI/output/`
- **Generation Speed:** ~67s per image on GB10 unified memory

## Start ComfyUI
```bash
source /home/hjs/comfyui_env/bin/activate
nohup python3 /home/hjs/ComfyUI/main.py --listen 127.0.0.1 --port 8188 > /tmp/comfyui.log 2>&1 &
# Wait: curl -s http://127.0.0.1:8188/system_stats | python3 -m json.tool | head -3
```

## Health Check
```bash
curl -s http://127.0.0.1:8188/system_stats | python3 -c "import sys,json; d=json.load(sys.stdin); print('ComfyUI OK v'+d['system']['comfyui_version'])"
```

## Single Image Generation
```bash
source /home/hjs/comfyui_env/bin/activate
python3 /home/hjs/gx10-book-factory/scripts/gen_image.py \
  --prompt "fantasy sorceress, adult, anime style, masterpiece, best quality, 8k" \
  --negative "nsfw, blurry, deformed, low quality, worst quality, child, loli" \
  --output "/home/hjs/gx10-book-factory/images/output.png" \
  --upload   # prints: PUBLIC URL: https://files.catbox.moe/xxxxx.png
```

## Theme Pack / Batch Generation
```bash
source /home/hjs/comfyui_env/bin/activate
python3 /home/hjs/gx10-book-factory/scripts/batch_gen.py \
  --theme "fantasy sorceress" \
  --count 20 \
  --output-dir ./packs/sorceress \
  --upload --zip
# Qwen 27B auto-generates character spec, then 20 variations across outfits/settings/moods
# Creates ZIP pack ready for Gumroad upload
```

## Download Pony Diffusion XL (when needed)
```bash
nohup wget -c --progress=dot:giga \
  'https://huggingface.co/dataautogpt3/ProteusV0.4/resolve/main/ProteusV0.4.safetensors' \
  -O /home/hjs/ComfyUI/models/checkpoints/ProteusV0.4.safetensors \
  > /tmp/pony_download.log 2>&1 &
tail -f /tmp/pony_download.log
```

## Prompt Engineering (animagine-xl-3.1)

### Positive Template
```
1girl, solo, <appearance>, wearing <outfit>, in <setting>, <mood> expression,
anime style, anime key visual, masterpiece, best quality, highly detailed, 8k,
adult, 18+, mature woman
```

### Negative (always include)
```
nsfw, worst quality, low quality, blurry, deformed, extra limbs, bad anatomy,
watermark, signature, username, text, child, loli, young girl
```

### KSampler Settings
- Steps: 28 | CFG: 7 | Sampler: euler_ancestral | Scheduler: normal
- Portrait: 832×1216 | Landscape: 1216×832 | Square: 1024×1024

## catbox.moe Upload
- Free, no account required, permanent links
- API: `https://catbox.moe/user/api.php`
- **CRITICAL:** Must include `reqtype=fileupload` field or get 412 error
- Built into both `gen_image.py` and `batch_gen.py`

## ComfyUI API — Known Bugs Fixed
| Bug | Fix |
|-----|-----|
| `ckpt_name: 'checkpoints/model.safetensors' not in list` | Use filename only, no subdirectory prefix |
| catbox 412 No request type given | Add `data={"reqtype": "fileupload"}` with requests.post |

## Aider Integration
```bash
cd /home/hjs/gx10-book-factory
aider --read /home/hjs/AIDER_CONSULTANT_GUIDE.md scripts/gen_image.py scripts/batch_gen.py
# Then inside Aider:
# /run source /home/hjs/comfyui_env/bin/activate && python3 gen_image.py --prompt "..." --upload
```
