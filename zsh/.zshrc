# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnosterzak"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

[ -f $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh

# Display Pokemon-colorscripts (commented — desktop-only)
#pokemon-colorscripts --no-title -s -r
#pokemon-colorscripts --no-title -s -r | fastfetch -c $HOME/.config/fastfetch/config-pokemon.jsonc --logo-type file-raw --logo-height 10 --logo-width 5 --logo -

# fastfetch — only if installed
command -v fastfetch >/dev/null && fastfetch -c $HOME/.config/fastfetch/config-compact.jsonc 2>/dev/null

# lsd aliases — only if lsd installed
if command -v lsd >/dev/null; then
    alias ls='lsd'
    alias l='ls -l'
    alias la='ls -a'
    alias lla='ls -la'
    alias lt='ls --tree'
fi

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.config/fzf/fzf-tokyonight.zsh ] && source ~/.config/fzf/fzf-tokyonight.zsh

# Watcom (desktop-only, harmless if paths don't exist)
export WATCOM=/opt/watcom
export EDPATH=$WATCOM/eddat
export WIPFC=$WATCOM/wipfc
export PATH=$PATH:$WATCOM/binl64

# uv / other pip-installed tools env
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"
