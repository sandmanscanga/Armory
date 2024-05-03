: '

    Before starting, ensure the following commands are executed so that
    the lsd package is installed and that oh-my-zsh gets installed properly.

'

## Amazon Linux 2023 / Cent OS 7
# sudo yum install -y alsa-lib amazon-linux-repo-s3 annobin-docs annobin-plugin-gcc ant ant-lib bzip2-devel cairo cpp cronie cronie-anacron curl-minimal dejavu-sans-fonts dejavu-sans-mono-fonts dejavu-serif-fonts expat fontconfig fonts-filesystem freetype gc gcc giflib git git-core git-core-doc glibc glibc-all-langpacks glibc-common glibc-devel glibc-gconv-extra glibc-headers-x86 glibc-locale-source gnupg2 gnupg2-smime google-noto-fonts-common google-noto-sans-vf-fonts graphite2 grub2-common grub2-efi-x64-ec2 grub2-pc-modules grub2-tools grub2-tools-minimal guile22 harfbuzz htop java-17-amazon-corretto-headless java-22-amazon-corretto java-22-amazon-corretto-devel java-22-amazon-corretto-headless javapackages-filesystem javapackages-tools kernel kernel-headers kernel-livepatch-repo-s3 kernel-tools krb5-libs langpacks-core-font-en libICE libSM libX11 libX11-common libXau libXext libXi libXinerama libXrandr libXrender libXt libXtst libblkid libbrotli libcurl-minimal libfdisk libffi-devel libjpeg-turbo libksba libmount libmpc libnsl libpng libsecret libsmartcols libtool-ltdl libusbx libuuid libxcb libxcrypt-compat libxcrypt-devel make mpdecimal ncurses-c++-libs ncurses-devel openssl-devel pcsc-lite pcsc-lite-ccid pcsc-lite-libs perl-Error perl-File-Find perl-Git perl-TermReadKey perl-lib pinentry pinentry-tty pixman polkit polkit-libs polkit-pkla-compat python-unversioned-command python3-pip python3.11 python3.11-libs python3.11-pip python3.11-pip-wheel python3.11-setuptools python3.11-setuptools-wheel readline-devel selinux-policy selinux-policy-targeted sqlite sqlite-devel system-release tmux util-linux util-linux-core xml-common xz-devel zlib-devel zsh

## Ubuntu 22.04
# sudo apt -y install zsh zsh-syntax-highlighting zsh-autosuggestions chroma vim-syntastic sparse splint cppcheck libxml2-utils hlint tidy checkstyle libperl-critic-perl puppet-lint pep8 pylint shellcheck flake8 pyflakes3 pylama python3-flake8 python3-pyflakes python3-pylama python3-stemmer cl-closure-common python3-pygments python3-sphinx golang-chroma golang-github-alecthomas-chroma-dev python-django-debug-toolbar-doc python-pygments-doc python3-colored-traceback python3-django-debug-toolbar python3-jupyterlab-pygments python3-typeshed rubber ruby-github-linguist ruby-pygments.rb ruby-rouge ruby-rugments texlive-latex-extra colorize git dotenv pylint python3-pip python3-virtualenv virtualenv libsqlite3-dev libssl-dev zlib1g-dev libbz2-dev libreadline-dev tk-dev liblzma-dev ant screenfetch jq htop tree vim curl wget git tmux

# git clone https://github.com/tmux-plugins/tmux-logging.git /opt/tmux-logging

# mkdir "$HOME/.lscolors"
# curl -s 'https://raw.githubusercontent.com/trapd00r/LS_COLORS/master/lscolors.sh' > $HOME/.lscolors/lscolors.sh

# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# source "$HOME/.cargo/env"
# rustup update
# cargo install lsd

# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# curl https://pyenv.run | bash

#~ export PYENV_ROOT="$HOME/.pyenv"
#~ [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
#~ eval "$(pyenv init -)"
#~ eval "$(pyenv virtualenv-init -)"

# pyenv install 3.11.9
# pyenv global 3.11.9

: '

    This is the start of the automatically generated configuration set
    by oh-my-zsh.  All settings and comments are still present,
    if anything was altered then the original setting should still
    be commented right above it.

'

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="fino"
#ZSH_THEME="jnrowe"
#ZSH_THEME="amuse"
ZSH_THEME="random"
export ZSH_THEME_RANDOM_QUIET=true

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
#ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "fino" "jnrowe" "amuse" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 7

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
plugins=(colored-man-pages colorize command-not-found dotenv git pep8 pylint python rand-quote sudo virtualenv vscode z)

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

: '

    This is the start of the manually added customizations that are loaded
    on top of the oh-my-zsh configuration.

'

# override default virtualenv indicator in prompt
VIRTUAL_ENV_DISABLE_PROMPT=1

# enable syntax-highlighting
if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    . /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
    ZSH_HIGHLIGHT_STYLES[default]=none
    ZSH_HIGHLIGHT_STYLES[unknown-token]=underline
    ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
    ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
    ZSH_HIGHLIGHT_STYLES[global-alias]=fg=green,bold
    ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
    ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
    ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=green,underline
    ZSH_HIGHLIGHT_STYLES[path]=bold
    ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
    ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
    ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
    ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
    ZSH_HIGHLIGHT_STYLES[command-substitution]=none
    ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta,bold
    ZSH_HIGHLIGHT_STYLES[process-substitution]=none
    ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta,bold
    ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=green
    ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=green
    ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
    ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
    ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
    ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
    ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
    ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
    ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta,bold
    ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta,bold
    ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta,bold
    ZSH_HIGHLIGHT_STYLES[assign]=none
    ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
    ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
    ZSH_HIGHLIGHT_STYLES[named-fd]=none
    ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
    ZSH_HIGHLIGHT_STYLES[arg0]=fg=cyan
    ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
    ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
    ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
    ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
    ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
    ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
    ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout
fi

# enable auto-suggestions based on the history
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    . /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    # change suggestion color
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
fi

# enable command-not-found if installed
if [ -f /etc/zsh_command_not_found ]; then
    . /etc/zsh_command_not_found
fi

: '

    This section of code filters out blacklisted themes in oh-my-zsh.
    It checks if a blacklist file exists and then removes any blacklisted
    themes from the list of available themes. The filtered list is then
    used to select a random theme to load. If a theme is blacklisted, it
    will not be loaded. Additionally, there is an alias provided to easily
    add the current random theme to the blacklist.

'

# Check for Oh My Zsh installation and Zsh availability
if [ -z "$ZSH" ] || [ ! -d "$ZSH" ]; then
    echo "Oh My Zsh is not installed or ZSH variable is not set. Please install Oh My Zsh and retry." >&2
else
    source ~/bin/swap-theme/runner.sh
fi

# Custom Alias Overrides
alias ls='lsd --color always --icon always --icon-theme fancy'
alias l='ls -F'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree -I .git -I __pycache__ -I venv -I .venv -I Venvs'

# Add $HOME/bin to PATH if it's not already included
if [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
    export PATH="$HOME/bin:$PATH"
fi

# Check if ipython is in PATH
if command -v ipython &>/dev/null; then
    # Check if ipdb is importable in Python
    python -c "import ipdb" &>/dev/null
    if [ $? -eq 0 ]; then
        export PYTHONBREAKPOINT='ipdb.set_trace'
    fi
fi

# Set Umask
umask 022

# Pyenv Configuration
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Custom LS_COLORS
source $HOME/.lscolors/lscolors.sh

# Custom Greeting
screenfetch
