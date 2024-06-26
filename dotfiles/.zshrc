# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/renmingliu/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/renmingliu/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/renmingliu/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/renmingliu/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# add color
export CLICOLOR=1

# remap brew
alias brew='arch -x86_64 brew'

# ls shortcuts
alias ll='ls -lath'

# remove with warning
alias rm='rm -i'

# profiling temperatures
alias tempwatch='sudo powermetrics --samplers smc | grep -i "CPU die temperature"'

# load zcalc
autoload -Uz zcalc

# auto/tab completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

# ssh shortcut
alias dev20='ssh liurenmi@hpcc.msu.edu -t "ssh dev-amd20"'
alias dev20v='ssh liurenmi@hpcc.msu.edu -t "ssh dev-amd20-v100"'
alias dev20l='ssh -L 45684:localhost:45684 liurenmi@hpcc.msu.edu -t "ssh -L 45684:localhost:45684 dev-amd20"'
alias rsub='ssh -R 52698:localhost:52698 liurenmi@hpcc.msu.edu'
# DSE servers
alias gr='ssh liurenmi@scully.egr.msu.edu -t "ssh liurenmi@grandriver.egr.msu.edu -t bash"'
alias grl='ssh -L 45684:localhost:45684 liurenmi@scully.egr.msu.edu -t "ssh -L 45684:localhost:45684 liurenmi@grandriver.egr.msu.edu -t bash"'
alias awsec='ssh -i .dse_aws_remy.pem remy@ec2-3-238-218-110.compute-1.amazonaws.com'
alias chatdse='ssh liurenmi@scully.egr.msu.edu -t "ssh liurenmi@chatdse.egr.msu.edu -t bash"'
alias pm='ssh liurenmi@scully.egr.msu.edu -t "ssh liurenmi@papermachine.egr.msu.edu -t bash"'

# sshfs mount (https://github.com/macfuse/macfuse/wiki/Getting-Started)
alias mntma="sshfs renmingl@lanec1.compbio.cs.cmu.edu:/work/magroup /Users/renmingliu/mnt -ovolname=sftp"  # Ma space on the Lane cluster at CMU
alias unmnt="unmount -f /Users/renmingliu/mnt"

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

export PATH="/Users/renmingliu/.local/bin:$PATH"
export KMP_DUPLICATE_LIB_OK=TRUE  # OMP: Error #15: Initializing libiomp5.dylib, but found libomp.dylib already initialized

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/renmingliu/Applications/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/renmingliu/Applications/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/renmingliu/Applications/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/renmingliu/Applications/google-cloud-sdk/completion.zsh.inc'; fi
