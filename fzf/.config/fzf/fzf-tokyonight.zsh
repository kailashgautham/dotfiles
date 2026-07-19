# ============================================================
#  fzf — Tokyo Night theme
#  Add to ~/.zshrc:   source ~/.config/fzf/fzf-tokyonight.zsh
#  (place it AFTER the line that sources ~/.fzf.zsh)
# ============================================================

# ---- Global look: applies to every fzf invocation (Ctrl-R, Ctrl-T, **<Tab>) ----
export FZF_DEFAULT_OPTS="
  --height=65%
  --layout=reverse
  --border=rounded
  --margin=1
  --padding=1
  --info=inline-right
  --prompt='   '
  --pointer='▌'
  --marker='✚'
  --separator='─'
  --scrollbar='│'
  --color=bg+:#283457,bg:#1a1b26,spinner:#bb9af7,hl:#7aa2f7
  --color=fg:#a9b1d6,header:#7aa2f7,info:#7dcfff,pointer:#bb9af7
  --color=marker:#9ece6a,fg+:#c0caf5,prompt:#7aa2f7,hl+:#7dcfff
  --color=border:#414868,label:#7aa2f7,query:#c0caf5
"

# ---- Ctrl-R: history search, with a preview of the full command ----
# C-/ toggles the preview (handy for long/multi-line commands)
# C-y copies the highlighted command to the clipboard
export FZF_CTRL_R_OPTS="
  --border-label='  Command History  '
  --border-label-pos=3
  --preview 'echo {2..}'
  --preview-window 'down:3:hidden:wrap:border-top'
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | (wl-copy 2>/dev/null || xclip -selection clipboard 2>/dev/null || pbcopy 2>/dev/null))+abort'
  --color header:italic
  --header '  ↵ run   ·   C-y copy   ·   C-/ preview  '
"

# ---- Ctrl-T (file search) & Alt-C (cd) previews — nice to have ----
export FZF_CTRL_T_OPTS="
  --preview '(bat --color=always --style=numbers {} 2>/dev/null || cat {}) 2>/dev/null | head -300'
  --preview-window 'right:55%:border-left'
  --border-label='  Files  '
"
export FZF_ALT_C_OPTS="
  --preview '(eza --tree --color=always {} 2>/dev/null || ls -la {}) | head -200'
  --preview-window 'right:55%:border-left'
  --border-label='  Directories  '
"

# ============================================================
#  OPTIONAL — fancier "panelled" look (needs fzf >= 0.57)
#  Separates input / list / preview into their own bordered
#  boxes. To use it, run `fzf --version`; if it's 0.57+,
#  swap FZF_DEFAULT_OPTS above for this block.
# ============================================================
# export FZF_DEFAULT_OPTS="
#   --style=full
#   --height=70% --layout=reverse --padding=1 --margin=1
#   --input-border=rounded --list-border=rounded --preview-border=rounded
#   --input-label='  Search  ' --list-label='  Results  '
#   --info=inline-right --prompt='   ' --pointer='▌' --marker='✚'
#   --color=bg+:#283457,bg:#1a1b26,fg:#a9b1d6,fg+:#c0caf5
#   --color=hl:#7aa2f7,hl+:#7dcfff,info:#7dcfff,prompt:#7aa2f7
#   --color=pointer:#bb9af7,marker:#9ece6a,spinner:#bb9af7
#   --color=border:#414868,label:#7aa2f7,preview-border:#bb9af7,input-border:#9ece6a
# "
