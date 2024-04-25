# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# base config
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd no_beep extendedglob nomatch

# completion config
autoload -U compinit; compinit
zstyle ':completion:*' completer _extensions _complete _approximate
# zstyle ':completion:*' use-cache on
# zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %d --%f'
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*' file-list all
zstyle ':completion:*' file-sort change reverse
zstyle ':completion:*' complete-options true
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# bind key
bindkey -v
bindkey '^[[Z' reverse-menu-complete

# alias
alias ls="ls -lh --color=auto"
alias codeshot="silicon --from-clipboard --to-clipboard --font 'FiraCode Nerd Font; Noto Sans'"
alias defaultpy="$PYVENV/default/bin/python"

usepy() {
    local venv=""
    if [ $# -eq 0 ]; then
        venv=".venv/bin/activate"
    else
        venv="$PYVENV/$1/bin/activate"
    fi
    if [ -f "$venv" ]; then
        command -v deactivate > /dev/null && deactivate
        source "$venv"
    else
        echo "$venv not exists"
    fi
}

try_source() {
    test -f "$1" && source "$1"
}

usepy default

# load plugins
try_source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
try_source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
try_source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# >>> xmake >>>
try_source $HOME/.xmake/profile
# <<< xmake <<<

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
