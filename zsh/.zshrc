

# Go binaries
export PATH="$HOME/go/bin:$PATH"
export PATH="/home/sneax/.local/bin:$PATH"


# Set the directory to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit if not there yet 
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# source/load zinit
source "${ZINIT_HOME}/zinit.zsh"


# Add plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab


# Load completions
autoload -U compinit && compinit
zinit cdreplay -q

# Generate kubectl completions
if (( $+commands[kubectl] )); then
    source <(kubectl completion zsh)

    # Enable completion for 'k' alias
    alias k=kubectl
    compdef __start_kubectl k
fi


# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# complition stylinig
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'


# Aliases
# alias ls='ls --color'
# alias c='clear'
alias vim='nvim'
alias v='nvim'
alias gnome-settings="env XDG_CURRENT_DESKTOP=GNOME gnome-control-center"
alias t='tmux'
# alias fuzzy='fzf --preview="cat {}" | xargs -r nvim'
# alias supercd='cd "$(fzf --preview="if [ -d {} ]; then ls -la {}; else cat {}; fi" | xargs -r dirname)"'

# shell integrations

# Obsidian setup 
export VAULT_DIR="$HOME/Obsidian/The Second Begining"

# Quick jump to vault
alias vault="cd '$VAULT_DIR'"

alias og="~/dotfiles/scripts/obsidian_organize.sh"
# 'on' command: Create a new note and open it in Neovim
alias on="~/dotfiles/scripts/on"

# source omarch alias
source ~/.local/share/omarchy/default/bash/aliases

# Remove omarchy theme from applying to brave
alias brm="sudo rm /etc/brave/policies/managed/color.json"

# Kubectl aliases
alias k="kubectl"

# oh-my-posh
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/newline-robyrussel.json)"
