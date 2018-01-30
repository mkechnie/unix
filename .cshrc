# 
# Default C shell init file.
#
# Created 30th May 91 by WBH
#
# Allow notification of background job completion and prevent accidental
# overwriting of files, set the default file protection to O:RWX G:RX W:
#
set notify
set noclobber
#
# Default protection (VMS Style) OWNER:RW GROUP:R WORLD:NOWT
# Derived by R=4, W=2, X=1, in OGW order, XORed with 666
# Use chmod to change individual files
#
umask 026
#
# Define search paths
#
set lpath = ( )
set lcd   = ( )
#
# Define DEAP environment
#
#
# Set up aliases (symbols in VMS speak)
#

setenv RED "%{\033[01;31m%}"
setenv GREEN "%{\033[01;32m%}"
setenv YELLOW "%{\033[01;33m%}"
setenv BLUE "%{\033[01;34m%}"
setenv MAGNETA "%{\033[01;35m%}"
setenv CYAN "%{\033[01;36m%}"
setenv WHITE "%{\033[01;37m%}"
setenv NORMAL "%{\033[0m%}"
setenv BOLD "%{\033[7m%}"

unalias *
alias title 	"cmd /c title csh: \!*"
alias cls	"cmd /c cls"
alias h          history
alias setdef	 cd
alias ls         "ls -F"
alias ll	 "ls -lag"
alias since      "ls -lc | more"
alias xdb	 "xdbx !\* &"
alias a          alias
a m "more"
#
# Interactive shell only section, exit if there is no prompt
#
#if (${?prompt} == 0) exit
#
# Detect which machine we're on and alter any settings as nesc.
#
stty sane
#
# Turn on auto-indent in vi, turn on file completion with ESC, turn off beep?
# limit command saving to 40 commands, set the prompt
#
set filec
set fignore=(.o)
set nobeep
set history = 40
set savehist = $history
set pr_s="\!`hostname`:"

alias prompt_s 'set prompt  = "`hostname|sed 's/\n//'`:$cwd:t{\!} "'
alias prompt_s 'set prompt  = "${WHITE}${USER}${NORMAL}@`hostname`${BOLD}:${NORMAL}$cwd:t${BOLD}{\!}${NORMAL} "'
alias hme 'if (`pwd` == '$HOME') echo 'Home Directory''
alias cd 'set old=`pwd`;chdir \!* ;prompt_s; echo "Entering "`pwd`; title `pwd`'
#alias cd 'set old=`pwd`;chdir \!* ;prompt_s; hme; echo "Entering "`pwd`; title `pwd`'
alias dc 'set dc=$old; cd $dc; unset dc'
alias win_nme	'echo -n "Window $win_num"; set win_num=$wim_num + 1'


# go to any directory aliases
#a mkdir '/bin/mkdir \!*; addir \!*; echo "Made directory \!*"'
#a addir 'echo \!* >> $HOME/.dirs; sort <$HOME/.dirs >$HOME/.dirs2; mv -f $HOME/.dirs2 $HOME/.dirs'
#a rmdir 'dedir \!*;/bin/rmdir \!*;echo "Removed directory"'
#a dedir 'grep -v \!* <$HOME/.dirs >$HOME/.dirs2; mv -f $HOME/.dirs2 $HOME/.dirs'
#a lidir 'more $HOME/.dirs'
#a go 'cd `get \!*`'
#a get 'grep \!* $HOME/.dirs| head -1'

#a sql		"echo 'amckechn'| $SYBASE/bin/isql -n \!* "
alias rm        "rm -i"
alias delete	"rm -i"
alias del	"rm -i"
alias mv        "mv -i"
alias rename	"mv -i"
alias cp        "cp -i"
alias copy	"cp -i"
a vil 		'vi `ls -tr | tail -1`'
a make 		"/usr/local/bin/make \!*| grep -v 'tokens ignored'; echo -n ''"
a sab	"sablime.xterm"
a / "grep \!* *"


a v 'vi $HOME/akm/time'
a p 'vi $HOME/akm/whathappened'

set time = 100
set cdpath = ~/dvp0.1/src/applic/dvp:~dvp0.1/dbase/applic/dvp:~/dvp

a sane "source $HOME/bin/sane"

a runner 'source $HOME/bin/runner \!*'

alias wcd 'cd `/cygdrive/c/AGit/python/selector.py ~/etc/possible_dirs`'
alias addir 'echo $cwd >> ~/etc/possible_dirs; sort < ~/etc/possible_dirs > ~/etc/possible_dirs2; mv ~/etc/possible_dirs2 ~/etc/possible_dirs;'

# Settings for korn shell
setenv ENV	.profile

#a isql 'echo $DB_SERVER $DB_DB $DB_USER; title $DB_SERVER $DB_DB $DB_USER; $SYBASE/bin/isql -w 132 -S $DB_SERVER -D $DB_DB -U $DB_USER -E vi; title `pwd`'
a select 'set noglob; $HOME/akm/bin/select \!*; unset noglob'
a sysobj 'set noglob; $HOME/akm/bin/select distinct name from sysobjects | grep \!*; unset noglob'
a vi 'title vi \!*; /usr/bin/vi \!*; title `pwd`'

prompt_s; echo "Entering "`pwd`; title `pwd`
ddate
echo " "

fortune
