rm $HOME/.num
echo "0" > $HOME/.num
xhost +

# screen/keyboard locking
 
if [ -x /usr/local/bin/xautolock ]
then
        if [ -z "${XLOCKCORNERS}" ]
        then
                XLOCKCORNERS="0000"
        fi
 
        if [ -z "${XLOCKDELAY}" ]
        then
                XLOCKDELAY=30
        fi
 
        if [ -z "${XLOCKMODE}" ]
        then
                XLOCKMODE=random
        fi
fi
 
( /usr/local/bin/xautolock -corners ${XLOCKCORNERS} -time ${XLOCKDELAY} -locker "nice /usr/local/bin/xlock -allowaccess -r -mode ${XLOCKMODE}" &)

xterm -g 90x40+0+0 -j  -sb -s -sl 2000 -C -ms Green -bg white +si -n "Console" &
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

echo "Done with X"
/usr/ucb/clear
