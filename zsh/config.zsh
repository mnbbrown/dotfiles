HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

autoload -Uz compinit && compinit
autoload colors && colors
autoload -Uz vcs_info
source ~/.dotfiles/zsh/spectrum.zsh

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

zstyle ':vcs_info:*' enable git svn
precmd() {
    vcs_info
}

local name="$FG[114]%n$FX[reset]"
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    local host="$FG[117]%m$FX[reset] $FG[196](SSH)$FX[reset]"
else
    local host="$FG[117]%m$FX[reset]"
fi
local time="$FG[215]%*$FX[reset]"
local dir="$FG[105]%~$FX[reset]"

local last="%(?..$FX[reset]$FG[203]%??:)"
local hist="$FG[220]%!!$FX[reset]"
local priv="$FG[245]%#$FX[reset]"

# Use zshcontrib's vcs_info to get information about any current version control systems.
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "$FG[082]$FX[reset]"
zstyle ':vcs_info:*' unstagedstr "$FG[160]$FX[reset]"
zstyle ':vcs_info:*' formats ":$FG[222]%c%u%b$FX[reset]"

# Use unaliased VCS commands.
zstyle ':vcs_info:git:*:-all-' command =git

local vcsi='${vcs_info_msg_0_}'

PROMPT="
${name} on ${host} ${dir}${vcsi}
$FX[reset]"

gitignore () {
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) != 'true' ]]; then
        printf "Not in a git repository\n"
        return 1
    fi

    local root_path=$(git rev-parse --show-toplevel)
    local gitignore_url="https://raw.githubusercontent.com/github/gitignore/master/$1.gitignore"
    curl $gitignore_url -o $root_path/.gitignore
}
