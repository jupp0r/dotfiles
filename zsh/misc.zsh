# Customize to your needs...
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

if [ -d ~/lib ] ; then
    LD_LIBRARY_PATH=~/lib:"${LD_LIBRARY_PATH}"
    MONO_PATH=~/lib:"${MONO_PATH}"
    PERL5LIB=~/lib/perl5:"${PERL5LIB}"
    PKG_CONFIG_PATH=$HOME/lib/pkgconfig:"${PKG_CONFIG_PATH}"
fi

if [ -d ~/share ] ; then
    PERL5LIB=~/share/perl5:"${PERL5LIB}"
    MANPATH=~/share/man:"${MANPATH}"
fi

# local manpages
if [ -d /opt/local/man ] ; then
    MANPATH=$MANPATH:/opt/local/man
fi

#homebrew stuff
if [ -d /usr/local/bin ] ; then
    PATH=/usr/local/bin:$PATH
fi
if [ -d /usr/local/sbin ] ; then
    PATH=/usr/local/sbin:$PATH
fi

#ruby gems bin dir
if [ -d /usr/local/Cellar/ruby/1.9.3-p0/bin ] ; then
    PATH=/usr/local/Cellar/ruby/1.9.3-p0/bin:$PATH
fi

# use emacs server if found running, otherwise standard emacs
if [ -d /Applications/Emacs.app/Contents/MacOS ] ; then
    export EDITOR="/Applications/Emacs.app/Contents/MacOS/Emacs"
else
    export EDITOR="emacs -nw"
fi

# use cmline emacs by default
alias emacs='emacs -nw'

# hashes
hash -d beleg=~/projects/systemmodel

# rvm
if [ -f $HOME/rvm/scripts/rvm ]; then
    source $HOME/.rvm/scripts/rvm
fi

#pythonbrew
[[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc

#tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

export TERM="xterm-256color"

export PATH MANPATH MONO_PATH PERL5LIB PKG_CONFIG_PATH

setopt complete_in_word       # ~/Dev/pro -> <Tab> -> ~/Development/project
setopt dvorak                 # use spelling correction for dv keyboards
setopt hist_ignore_dups     # when I run a command several times, only store one
setopt hist_no_functions    # don't show function definitions in history
setopt hist_reduce_blanks   # reduce whitespace in history
setopt hist_verify          # ask me before running a command line with history sub
setopt interactive_comments # why not?
setopt list_types           # show ls -F style marks in file completion
setopt no_beep              # don't beep on error
setopt numeric_glob_sort    # when globbing numbered files, use real counting

# enable ssh keychain lookup for osx
zstyle :omz:plugins:ssh-agent agent-forwarding on

bindkey -e # use emacs keymap

export LANG="C"
# this is for svn
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
