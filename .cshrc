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
setenv DEAP_HOME /deap/today/deap3.0
setenv SYBASE /usr/local3/sybase10.0.2.4ebf5589
setenv XDESIGNER_HOME /usr/local3/XDesigner4.5

unalias *
alias c          clear
alias cls        clear
alias h          history
alias setdef	 cd
alias ls         "ls -F"
alias ll	 "ls -lag"
alias dir	 "ls -F"
alias laser      lpr
alias print	 lpr
alias mine       "ps -u"
alias since      "ls -lc | more"
alias procs	 "ps -aux"
alias users	 who
alias xdb	 "xdbx !\* &"
alias frame	 maker
alias a          alias
a m "more"
#
# Interactive shell only section, exit if there is no prompt
#
if (${?prompt} == 0) exit
#
# Detect which machine we're on and alter any settings as nesc.
#
stty sane
#
# Turn on auto-indent in vi, turn on file completion with ESC, turn off beep?
# limit command saving to 40 commands, set the prompt
#
##setenv EXINIT "set ai"
set filec
set fignore=(.o)
set nobeep
set history = 40
set savehist = $history
set prompt  = "`hostname`:$cwd:t[7m{\!}[0m "
set pr_s="\!`hostname`:"
alias prompt_s 'set prompt  = "`hostname`:$cwd:t[7m{\!}[0m "'
alias hme 'if ($cwd == '$HOME') echo 'Home Directory''
alias cd 'set old=$cwd;chdir \!* ;prompt_s; echo "Entering "$cwd'
#alias cd 'set old=$cwd;chdir \!* ;prompt_s; hme; echo "Entering "$cwd'
alias dc 'set dc=$old; cd $dc; unset dc'
alias win_nme	'echo -n "Window $win_num"; set win_num=$wim_num + 1'

setenv MANPATH /usr/lang/man:/usr/man:/usr/share/man:/usr/openwin/man/:/usr/share/man:/usr/local/man:${XDESIGNER_HOME}/bin/man:

# go to any directory aliases
a mkdir '/bin/mkdir \!*; addir \!*; echo "Made directory \!*"'
a addir 'set old=$cwd;chdir \!*;echo $cwd >> $HOME/.dirs; sort <$HOME/.dirs >$HOME/.dirs2; mv -f $HOME/.dirs2 $HOME/.dirs; chdir $old'
a rmdir 'dedir \!*;/bin/rmdir \!*;echo "Removed directory"'
a dedir 'set old=$cwd;chdir \!*;grep -v $cwd <$HOME/.dirs >$HOME/.dirs2; mv -f $HOME/.dirs2 $HOME/.dirs; chdir $old'
a lidir 'more $HOME/.dirs'
a go 'cd `get \!*`'
a get 'grep \!* $HOME/.dirs| head -1'

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
setenv SQRDIR 	/usr/local/sqr
setenv GS_LIB   $DEAP_HOME/bin/ghost/fonts:$DEAP_HOME/bin/ghost
setenv LOGNAME  amckechn
setenv DB_PASSWORD amckechn
setenv XDH_TOPIC_PATH ./%N%S:~/deap3.0/help/%N%S:~/deap3.0/help/%N:$DEAP_HOME/help/%N%S:~/deap3.0/help/%N:$DEAP_HOME/help/%N:/usr/lib/X11/xdeskhelp/%N%S:/usr/lib/X11/xdeskhelp/%N:./%N%S:.%N
a sab	"sablime.xterm"
a isql	"$SYBASE/bin/isql -U$USER -P$DB_PASSWORD \!*"
a sql	"$SYBASE/bin/isql \!*"
a select "set noglob; $HOME/bin/select \!*; unset noglob"
a sysobj "set noglob;$HOME/bin/select distinct name from sysobjects | grep \!*; unset noglob"
a / "grep \!* *"


a v 'vi $HOME/akm/time'
a p 'vi $HOME/akm/whathappened'
setenv GDT_DATA_PATH /usr/local/GDT/gdt20jan
setenv ASALMHOST	sdab9
setenv ASAKEYPATH	/usr/local/hindsight
setenv TMPDIR		$HOME
setenv DEAP_HOME_BPX	$DEAP_HOME

if (`env|grep win_num` == "") setenv win_num		0
setenv GKS_HME /usr/local2/SGKS3_1_8
setenv TZ GMT

biff y

set time = 100
set cdpath = ~/dvp0.1/src/applic/dvp:~dvp0.1/dbase/applic/dvp:~/dvp
setenv DSQUERY DEAP_ABDEV
#setenv DSQUERY ABDEV_COLOMBIA
setenv XLIBI18N_PATH /usr/local/IXImd12x/lib/X11
setenv DEAP_MAKE_SETUP $DEAP_HOME/src/make.deapset
setenv DEAP_MAKE_TARGETS $DEAP_HOME/src/make.deaptgt

a may "vi $HOME/akm/year/May"
setenv SYBGEN_HOME /deap/today/deap3.0/src/api/dhgen

setenv GDT_HOME /usr/local/GDT/gdt_5_4/
a sybgen '$DEAP_HOME/src/api/sybgen/sybgen'
a sybgengen '$DEAP_HOME/src/api/sybgen/sybgengen'
a dhgen '$DEAP_HOME/src/api/dhgen/dhgen'
a dhgengen '$DEAP_HOME/src/api/sybgen/sybgengen'
a col "setenv DSQUERY ABDEV_COLOMBIA"
a abn "setenv DSQUERY DEAP_ABDEV"
a test2 "setenv DSQUERY ABDEV_TEST2"
a test1 "setenv DSQUERY ABDEV_TEST1"
a usa "setenv DSQUERY SIAMSBKB; setenv USER dbauser; setenv DB_PASSWORD dbauser"
a sane "source $HOME/bin/sane"
a adc "source $HOME/bin/adc"
a adcdbo "source $HOME/bin/adcdbo"
a anc "setenv DSQUERY ANC_4TEST; setenv SYBASE /usr/local2/sybase.ebf4659"
a syb11 "setenv SYBASE /export/home/sybase11.5; setenv PATH /export/home/sybase11.5/bin:${PATH}"
a dyce "setenv DSQUERY ABDEV_DYCE2"
a subset "setenv DSQUERY ABDEV_SUBSET1"
#setenv PURIFYOPTIONS -logfile=/tmp/pure
#setenv PURIFYOPTIONS "-windows=no"

# Settings for bourne shell
setenv PS2 ' '

# xnews stuff
setenv NNTPSERVER exlogcorp
setenv ORGANIZATION "Baker Hughes INTEQ, Inc."
setenv DOMAIN "inteq.com"

setenv XBMLANGPATH %B:/usr/local/IXImd12x/include/X11/bitmaps/%B:/usr/local/XDesigner/bitmaps/%B:/deap/today/deap3.0/xres/bitmaps/%B:

setenv MERCURY_ELMHOST appshou1
a runner "source $HOME/bin/runner \!*"
echo "Done .cshrc"

# Settings for korn shell
setenv ENV	.profile

