#!/bin/csh
#
# Default .xsession login created 30/5/91 by WBH
#
# This file will only be consulted when logging in from the NCD X terminals
# or at least while we don't use xdm from any other devices.
#
# Define DEAP environment
#
source .login

# Framemaker 
#setenv FMHOME /home/exes02/framemaker/bin

# XDesigner
#setenv XDHOME /home/exes02/XDesigner

# Ansi C Compiler
#setenv CCHOME /home/exes02/ansic

#setenv PATH ~:.:/bin:/usr/bin:/usr/etc:/usr/ucb:/usr/lang:/usr/bin/X11:${FMHOME}:${XDHOME}:${CCHOME}
#setenv MANPATH /home/exes02/man

#
# You can put anything you like after this comment, clocks, xterms etc but
# LEAVE mwm on the end
#
rm $HOME/.num
echo "0" > $HOME/.num
stty erase ''

xterm -g 90x40+0+0 -j  -sb -s -sl 2000 -ms Green -bg white +si -n "xterm" &
xterm -g 80x40+50+0 -j  -sb -s  -sl 2000 -fg Yellow -bg MidnightBlue -ms Red +si -n "Window2" -iconic &
xterm -g 80x40+100+0 -j  -sb -s  -sl 2000 -fg Yellow -bg MidnightBlue -ms Red +si -n "Window3" -iconic &
#oclock -g 100x100-0+0 -bw 0&
xclock -g -0+0 -digital -fg black -bg red -update 3 &
#xclock -g -0+0 -digital -fg black -bg red -update 3 -font 7x13bold &
xload -bg NavyBlue -fg DarkGreen -geom 222x30-149+0 -nolabel &
#xmail -iconic &
xbiff -bg NavyBlue -fg goldenrod -g -372+0 &
xsetroot -solid NavyBlue &
#xsetroot -fg black -bg yellow -cursor acid.bit acid.msk
#xsetroot -cursor dvp.bit backer -fg blue -bg green
xmodmap .bck
#$HOME/bin/run xrun -iconic &

mwm 
