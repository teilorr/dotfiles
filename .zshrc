# Path
PATH=$PATH:/home/teilorr/.local/bin

# Exports
export FZF_DEFAULT_OPTS="--height=60% --border --margin=1 --padding=0 --border-label=fzf --preview='bat --style=numbers --color=always {}'"
export XDG_CONFIG_HOME="$HOME/.config"

export VISUAL=/sbin/nvim
export EDITOR="$VISUAL"

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit
autoload -Uz tetriscurses

zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^p'      history-search-backward
bindkey '^n'      history-search-forward
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[3~'   delete-char
bindkey '^[w'     kill-region

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
setopt autocd

# Completion styling
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'exa -1 --color --color=always $realpath'
zstyle ':fzf-tab:complete:cd:*'         fzf-preview 'exa -1 --color=always $realpath'

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

nvfzf() {
  if [[ $# -eq 0 ]]; then
    fzf --bind 'enter:become(nvim {+})' --border-label=Neovim;
  else
    nvim "$@"
  fi
}

# Aliases
alias ll='exa --color --icons --long'
alias lt='exa --color --icons --tree'
alias la='exa --color --icons --all'
alias ls='exa --color --icons'
alias ff='fastfetch'
alias c='clear'

# Utilities
eval "$(oh-my-posh init zsh --config "https://raw.githubusercontent.com/dreamsofautonomy/zen-omp/refs/heads/main/zen.toml")"
eval "$(zoxide init --cmd cd zsh)"
eval "$(fzf --zsh)"

ff --config ~/.config/fastfetch/default.jsonc
