#!/usr/bin/env bash
# Bootstrap a fresh machine to match my dotfiles setup.
# Idempotent — safe to re-run.

set -euo pipefail

DOTFILES="${HOME}/dotfiles"

# --- Ensure we're in the right place ---
if [[ ! -d "$DOTFILES" ]]; then
    echo "ERROR: $DOTFILES doesn't exist. Clone your dotfiles repo first:"
    echo "    git clone <repo-url> ~/dotfiles"
    exit 1
fi

# --- Prompt for profile ---
echo ""
echo "=== Dotfiles Bootstrap ==="
echo ""
echo "Choose profile:"
echo "  1) full     — desktop with GUI (alacritty etc.)"
echo "  2) headless — server/CLI only"
echo ""
read -rp "Profile [1/2]: " profile_choice

case "$profile_choice" in
    1|full)  PROFILE="full" ;;
    2|headless) PROFILE="headless" ;;
    *) echo "Invalid choice."; exit 1 ;;
esac

echo ""
echo "Running $PROFILE bootstrap..."
echo ""

# --- Common apt packages ---
common_pkgs=(
    stow git zsh tmux
    build-essential curl wget
    lsd fastfetch btop
)

# --- Full-profile extras ---
full_pkgs=(
    alacritty
)

echo "==> Updating apt..."
sudo apt update

echo "==> Installing common packages..."
sudo apt install -y "${common_pkgs[@]}"

if [[ "$PROFILE" == "full" ]]; then
    echo "==> Installing full-profile packages..."
    sudo apt install -y "${full_pkgs[@]}"
fi

# --- Neovim via snap (Ubuntu apt version is too old) ---
if ! command -v nvim >/dev/null 2>&1 || [[ "$(nvim --version | head -1 | awk '{print $2}')" < "v0.10" ]]; then
    echo "==> Installing/upgrading neovim (snap)..."
    sudo snap install nvim --classic
fi

# --- Oh My Zsh ---
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    echo "==> Installing Oh My Zsh..."
    ZSH= sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    # OMZ installer creates a default .zshrc; remove it so we can stow ours
    [[ -f "$HOME/.zshrc" && ! -L "$HOME/.zshrc" ]] && rm "$HOME/.zshrc"
fi

# --- OMZ plugins ---
declare -A omz_plugins=(
    ["zsh-autosuggestions"]="https://github.com/zsh-users/zsh-autosuggestions"
    ["zsh-syntax-highlighting"]="https://github.com/zsh-users/zsh-syntax-highlighting.git"
)
for plugin in "${!omz_plugins[@]}"; do
    dir="$HOME/.oh-my-zsh/custom/plugins/$plugin"
    if [[ ! -d "$dir" ]]; then
        echo "==> Cloning omz plugin: $plugin"
        git clone --depth=1 "${omz_plugins[$plugin]}" "$dir"
    fi
done

# --- fzf (from official installer, gets binary + ~/.fzf.zsh) ---
if [[ ! -d "$HOME/.fzf" ]]; then
    echo "==> Installing fzf..."
    git clone --depth=1 https://github.com/junegunn/fzf.git "$HOME/.fzf"
    "$HOME/.fzf/install" --key-bindings --completion --no-update-rc
fi

# --- Change default shell to zsh ---
if [[ "$SHELL" != *zsh ]]; then
    echo "==> Changing default shell to zsh..."
    sudo chsh -s "$(which zsh)" "$USER"
    echo "    (log out and back in for shell change to take effect)"
fi

# --- Stow packages ---
common_stow=(nvim zsh fzf tmux git btop fastfetch)
full_stow=(alacritty)

# Remove conflicting default files that block stow
for f in "$HOME/.zshrc" "$HOME/.gitconfig"; do
    if [[ -e "$f" && ! -L "$f" ]]; then
        echo "==> Removing conflicting file: $f"
        rm "$f"
    fi
done

cd "$DOTFILES"
for pkg in "${common_stow[@]}"; do
    if [[ -d "$pkg" ]]; then
        echo "==> Stowing $pkg..."
        stow -R "$pkg" || echo "    (conflict — resolve manually)"
    fi
done

if [[ "$PROFILE" == "full" ]]; then
    for pkg in "${full_stow[@]}"; do
        if [[ -d "$pkg" ]]; then
            echo "==> Stowing $pkg..."
            stow -R "$pkg" || echo "    (conflict — resolve manually)"
        fi
    done
fi

echo ""
echo "==> Bootstrap complete."
echo ""
echo "Next steps:"
echo "  - Log out and back in for zsh to take effect"
echo "  - Install language toolchains (rust, node, python) as needed"
echo "  - Machine-specific: alacritty needs Nerd Font (install manually)"
echo ""
