---
name: aider-tmux-babysitter
description: Knowledge about the round-robin babysitter script, /run slash commands, and how Aider should execute local scripts rather than just describing them. Use when orchestrating Aider sessions or teaching Aider to self-execute.
---

# Aider Self-Execution & Tmux Babysitter

## CRITICAL: Aider CAN Execute Scripts

**Never say "I cannot execute scripts directly."**
Aider has `/run` — use it.

```
# Execute any shell command from inside Aider:
/run <command>

# Examples:
/run source /home/hjs/comfyui_env/bin/activate && python3 generate_nsfw_acg.py
/run curl -s http://127.0.0.1:8188/system_stats | python3 -m json.tool | head -5
/run /home/hjs/bin/ollama ps
/run source /home/hjs/comfyui_env/bin/activate && python3 /home/hjs/gx10-book-factory/scripts/gen_image.py --prompt "fantasy sorceress, adult, anime, masterpiece" --output /tmp/out.png --upload
/run python3 /home/hjs/gx10-book-factory/scripts/pipeline_runner.py --theme "brave turtle"
```

When Aider asks "Add command output to chat? (Y)es/(N)o" → answer **N** unless output needed for reasoning.

## Full Slash Command Cheatsheet
| Command | Purpose |
|---------|---------|
| `/run <cmd>` | Execute shell command |
| `/add <file>` | Add to editable context |
| `/read <file>` | Add as read-only |
| `/drop <file>` | Remove from context |
| `/git <cmd>` | Run git command |
| `/undo` | Undo last aider commit |
| `/diff` | Show pending changes |
| `/commit` | Force commit now |
| `/clear` | Clear chat history |
| `/exit` | Quit Aider |

## Round-Robin Babysitter

**Script:** `/home/hjs/aider-round-robin.py`
**Pane:** tmux `0:6.0`

### What it does
- Polls panes `0:4.0` (book-factory) and `0:5.0` (test-nfsw-acg) every 2s
- If both generate simultaneously → sends Ctrl-C to off-turn pane
- Turn passes after on-turn pane returns to `>` prompt
- Idle detection: last non-empty line is `>`

### Commands
```bash
# Check status:
tmux capture-pane -p -S -20 -t 0:6.0
# Look for: heartbeat | turn=... | book-factory=... | test-nfsw-acg=...

# Restart if dead:
tmux send-keys -t 0:6.0 "python3 /home/hjs/aider-round-robin.py" Enter

# Stop:
tmux send-keys -t 0:6.0 "C-c" ""
```

## Agent Handoff Protocol

Before sending ANYTHING to an Aider pane:

```bash
# 1. Verify babysitter alive
tmux capture-pane -p -S -3 -t 0:6.0 | grep heartbeat

# 2. Confirm Aider pane is idle (must end with >)
tmux capture-pane -p -S -5 -t 0:4.0 | tail -3
tmux capture-pane -p -S -5 -t 0:5.0 | tail -3

# 3. Check Ollama not busy
/home/hjs/bin/ollama ps
```

## Aider Behavior Notes
- May timeout generating commit messages via Ollama → interrupt + `git commit -m "..."` manually
- Rejects paths outside its Git repo root
- For unattended loops: `--architect --auto-test --test-cmd --auto-accept-architect`
- Config file: `~/.aider.conf.yml`
