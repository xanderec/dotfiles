# ======= zinit plugins =======
source $(brew --prefix)/opt/zinit/zinit.zsh

autoload -U compinit && compinit  # bootstraps native zsh completion system so plugins can register more completions
eval "$(fzf --zsh)"               # only eval that comes before since fzf-tab requires it to be loaded

zinit light zsh-users/zsh-syntax-highlighting  # detects valid/invalid tool calls
zinit light zsh-users/zsh-completions          # more powerful in zsh completion scripts
zinit light zsh-users/zsh-autosuggestions      # auto-complete features
zinit light Aloxaf/fzf-tab                     # adds fzf picker for completions

zinit snippet OMZP::sudo                       # press esc twice to prepend sudo to current cmd

# ======= startship =======
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# ======= aliases =======
alias cd="z"
alias yy="yazi"
alias cl=clear
alias ssh-mcgill="ssh aliu45@mimi.cs.mcgill.ca"
alias dotf="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"  # track dotfiles
alias mkdir='mkdir -pv'                                       # creates parent dirs automatically in verbose mode (shows what was created)
alias cp='cp -iv'                                             # prompts before overwriting, shows what's being copied
alias mv='mv -iv'                                             # prompts before overwriting, shows what's being moved
alias rm='trash'                                              # trash, so we can recover mistakes
alias grep='grep --color=auto'                                # coloured output for grep matches
alias ll='ls -l'

# ======= exports =======
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"
export GOPATH="$HOME/.local/go"
export PATH=$PATH:$GOPATH/bin

# ======= zsh options =======
setopt interactivecomments  # allows for pasting code with comments into interactive terminal
setopt magicequalsubst      # enable filename expansion for argument of the form `smth=expr`

# ======= global env vars =======
export EDITOR=zed

# ======= completion styling =======
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'              # case-insensitive matching
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"             # colours completion results using same colours as `ls`
zstyle ':completion:*' menu no                                      # disable completion menu
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'  # preview directory contents with fzf

# ======= evals =======
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"
