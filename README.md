# dot.hjs

Personal dotfiles — primarily from **GX10** (ASUS GB10 Superchip, `192.168.2.93`, Ubuntu).

---

## Active machine: GX10

| File / Dir | Purpose |
|------------|---------|
| `.bashrc` | Bash config |
| `.zshrc` / `.zshenv` / `.zshrc.backup` | Zsh config (oh-my-zsh, NVM, PATH, aliases) |
| `.profile` | Login shell env |
| `.gitconfig` | Git aliases, signing key, core settings |
| `.tmux.conf` | Tmux prefix, pane splits, status bar |
| `.aider.conf.yml` | Aider AI: dark nord theme, qwen3 model, no auto-commit |
| `.claude/settings.json` | Claude Code: fullscreen TUI, dark theme, sonnet-4-6 |
| `.gemini/settings.json` | Gemini CLI: OAuth personal auth |
| `.gemini/projects.json` | Gemini project directory mappings |
| `.gemini/trustedFolders.json` | Gemini trusted directory settings |
| `.gemini/skills/` | 6 Gemini CLI skills (see below) |

### Gemini Skills

| Skill | Description |
|-------|-------------|
| `acg-factory-gumroad` | ACG content factory + Gumroad integration |
| `aider-tmux-babysitter` | Monitor and manage aider sessions in tmux |
| `book-factory-manager` | Book generation pipeline manager |
| `gx10-orchestrator` | GX10 workstation orchestration |
| `local-image-gen` | Local image generation workflows |
| `workstation-expert` | GX10 system knowledge and ops |

---

## Vim config (.vimrc)

Configured but **not yet deployed on GX10** — kept here as reference and for future setup.

Plugin manager: [vim-plug](https://github.com/junegunn/vim-plug)

| Plugin | Purpose |
|--------|---------|
| `vim-airline` + themes | Status/tabline |
| `nerdtree` | File explorer (`Ctrl+N`) |
| `vim-devicons` | Icons (requires Nerd Font in terminal) |
| `gruvbox` | Colorscheme |

To activate on a new machine:

```bash
# Install vim-plug (already in .vim/autoload/plug.vim in this repo)
# Then in vim:
:PlugInstall

# Recommended terminal font: JetBrainsMono Nerd Font
```

Settings: relative line numbers, 4-space tabs, `termguicolors`, mouse enabled, gruvbox dark.

---

## Legacy / archive

Older files left intact for history:

| File / Dir | Origin |
|------------|--------|
| `.alias` / `.cshrc` / `.conformal_lec` | Old EDA workstation (csh era) |
| `.screenrc` / `.screenrc.nocap` | Pre-tmux screen config |
| `.zsh_functions` | Old zsh function snippets |
| `keepRemoteAlive.sh` | Old SSH keepalive script |
| `.config/git/gitk` | gitk color config |
| `ie9hackathon/` | IE9 hackathon demos (2011) |
| `Application Data/Rovio/` | Angry Birds save from Windows era |
| `choco.install.list.bat` | Old Windows Chocolatey package list |
| `.temp/` | Old temp/scratch |

---

## Excluded (in .gitignore)

Secrets and runtime state are never committed:
- Credentials: `.git-credentials`, `.youtube-creds.json`, `.ssh/`, `.acme.sh/`, `.oci/`, `.cloudflared/`
- Claude runtime: sessions, projects, history, daemon logs, cache
- Gemini runtime: `oauth_creds.json`, `google_accounts.json`, history, tmp
- Shell history, completions, vim undo files

---

## Syncing from GX10

```bash
cd /tmp/dot.hjs   # or wherever you cloned this
rsync -a /home/hjs/.claude/settings.json          .claude/
rsync -a /home/hjs/.gemini/skills/                .gemini/skills/
rsync -a /home/hjs/.gemini/settings.json          .gemini/
cp /home/hjs/.zshrc /home/hjs/.bashrc /home/hjs/.vimrc /home/hjs/.tmux.conf /home/hjs/.gitconfig .
git add -A && git commit -m "sync $(date +%Y-%m-%d)" && git push origin master
```
