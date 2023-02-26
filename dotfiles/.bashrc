test -f /etc/profile.dos && . /etc/profile.dos

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
#export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# add aliases if there is a .aliases file
test -s ~/.alias && . ~/.alias
alias rm="rm -i"
alias qwatch="watch squeue -u liurenmi -o '%.18i\ %.9P\ %.50j\ %.8u\ %.12T\ %.10M\ %.9l\ %.6D\ %R'"
alias nwatch="watch nvidia-smi"
alias gwatch="watch -n 1 nvidia-smi"
alias n2vp="python /mnt/home/liurenmi/repo/BioGrid_emd/src/node2vec/main.py"
alias n2v="python /mnt/home/liurenmi/repo/GraphUtil/n2v.py"
alias d2d="/mnt/home/liurenmi/software/sleipnir/sleipnir_build/bin/Dat2Dab"
alias n2vc="/mnt/home/liurenmi/software/snap/examples/node2vec/node2vec"
alias n2vv="/mnt/home/liurenmi/software/tmp/snap/examples/veles/veles"

#alias moduleslp="module load Boost log4cpp gengetopt GSL && module swap GNU GNU/6.2"
alias moduleslp="module load Boost log4cpp gengetopt GSL"
alias modulegro="module load CUDA/10 GROMACS/2019.3"
alias activate-pygeom-ogb="conda activate pygeom-ogb"
#alias activate-pygeom-ogb="module load GCC/10.2.0; module load CUDA/11.1.1; conda activate gtaxogym"
#alias activate-pygeom-ogb="module load GCC/10.2.0; module load CUDA/11.1.1; conda activate node2vecplus-bench"
alias cu102="module load GCC/8.3.0 CUDA/10.2.89"
alias cu110="module load GCC/9.3.0 CUDA/11.0.2"
alias cu111="module load GCC/10.2.0 CUDA/11.1.1"
alias cu114="module load GCC/11.1.0 CUDA/11.4.0"

alias gitgraph="git log --all --decorate --oneline --graph"
alias gitlfs="\~/.local/bin/git-lfs"

alias nvim="~/software/nvim/nvim.appimage"

# tmux clipboard and reattach
alias tcp="cat ~/.tmux.clipboard"
alias ta="tmux attach"

alias poetry="~/.local/bin/poetry"

# group access
umask g+rw

# added by Anaconda3 installer
#export PATH="/mnt/home/liurenmi/software/anaconda3/bin:$PATH"

# Disable unnecessary multithreading by numpy
#export OPENBLAS_NUM_THREADS=1
#export MKL_NUM_THREADS=1
#export NUMEXPR_NUM_THREADS=1
#export OMP_NUM_THREADS=1

# . /mnt/home/liurenmi/software/anaconda3/etc/profile.d/conda.sh  # commented out by conda initialize
# conda activate  # commented out by conda initialize

module use /mnt/research/compbio/krishnanlab/modules/

# CUDA 11.1.1
#module swap GNU GCC/10.2.0
#module load CUDA/11.1.1

# CUDA 11.6
module swap GNU GCCcore/11.2.0
module load CUDA/11.6.0

module load git nodejs

#module swap GNU GCC/8.3.0
#module load CUDA/10
#module swap GNU GNU/8
#module load GNU/8
#module load GNU/7
#module load OpenMPI/3

# GLIBC
# module load GCCcore/6.4.0 glibc/2.28

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/mnt/home/liurenmi/software/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/mnt/home/liurenmi/software/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/mnt/home/liurenmi/software/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/mnt/home/liurenmi/software/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

