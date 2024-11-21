# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

# SSHFS mount (https://github.com/macfuse/macfuse/wiki/Getting-Started)
alias mntma="sshfs lane:/work/magroup /Users/renmingliu/mnt/magroup -ovolname=sftp"  # Ma space on the Lane cluster at CMU
alias mntmas="sshfs slane:/work/magroup /Users/renmingliu/mnt/magroup -ovolname=sftp"  # Ma space, proxy jump through SCS
alias mntpj="sshfs psc:/jet/home/rliu9 /Users/renmingliu/mnt/psc-jet -ovolname=sftp"
alias mntpb="sshfs psc:/ocean/projects/bio240015p /Users/renmingliu/mnt/psc-bio -ovolname=sftp"
alias mntpc="sshfs psc:/ocean/projects/cis240134p /Users/renmingliu/mnt/psc-cis -ovolname=sftp"
alias unmnt="umount -f /Users/renmingliu/mnt/*"

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

export PATH="/Users/renmingliu/.local/bin:$PATH"
export KMP_DUPLICATE_LIB_OK=TRUE  # OMP: Error #15: Initializing libiomp5.dylib, but found libomp.dylib already initialized

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/renmingliu/Applications/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/renmingliu/Applications/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/renmingliu/Applications/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/renmingliu/Applications/google-cloud-sdk/completion.zsh.inc'; fi


# >>> Tools (need to install first)
### fzf (https://github.com/junegunn/fzf)
source <(fzf --zsh)
# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --walker-skip .git,.tox,__pycache__,.nox,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

### eza (https://github.com/eza-community/eza)
alias l='eza -s type --icons'
alias ls='eza -s type --icons -1'
alias lt='eza -s type --icons -T'
alias lr='eza -s type --icons -R'
alias ll='eza -s type --icons -l'
alias llt='eza -s type --icons -l -T'
alias llr='eza -s type --icons -l -R'

### zoxide (https://github.com/ajeetdsouza/zoxide)
eval "$(zoxide init zsh)"

### thefuck (https://github.com/nvbn/thefuck)
# eval $(thefuck --alias fk)

### powerlevel10k status line (https://github.com/romkatv/powerlevel10k)
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/software/powerlevel10k
source ~/software/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# <<< Tools
