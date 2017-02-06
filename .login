#
# Default .login created 30/5/91 by WBH
#
#
# Define DEAP environment
#
#
#
/usr/local/bin/make .hushlogin >/dev/null
setenv OPENWINHOME /usr/openwin
set path=( ~ . /usr/ucb /bin /usr/bin /usr/etc /usr/lang /usr/bin/X11 $OPENWINHOME/bin $OPENWINHOME/demo )
#
# Allow notification of background job completion and prevent accidental
# overwriting of files, set the default file protection to O:RWX G:RX W:
#
echo ".login"
set myname = `who am i|awk -F\( '{print $2}'|awk -F\: '{print $1}'|awk -F\) '{print $1}'`
#
setenv MCTYPE null
#
if ( $myname == "exew09" ) then
     echo Remote from Magnus
     setenv MCTYPE interactive386
else if ( $myname == "exew08" ) then
     echo Remote from Cleeton
     setenv MCTYPE mac
else if ( $myname == "expu22" ) then
     echo Remote from Tims Mac
     setenv MCTYPE mac
else if ( $myname == "glm010" ) then
     echo Remote from Glasgow Macintosh 10
     setenv MCTYPE mac
else if ( $myname == "glm009" ) then
     echo Remote from Glasgow Macintosh 9
     setenv MCTYPE mac
else if ( $myname == exew10 ) then
     echo Remote from Ula
     setenv MCTYPE ncd
else if ( $myname == exew11 ) then
     echo Remote from Gyda
     setenv MCTYPE ncd
else if ( $myname == "" ) then
     set myname = unix
endif
#
# Resize the first window
#
if ( $myname != "unix" ) then
     /usr/bin/X11/resize >/dev/null
endif
#
# Also ensure X-Windows stuff goes to the right machine
#
setenv DISPLAY ${myname}:0
echo X DISPLAY will go to $DISPLAY
#
if ( `hostname` != $myname ) then
	stty erase 
else
	stty erase 
endif
if ($MCTYPE == "interactive386") then
   if ($TERM != "xterm") then
      setenv TERM vt100
   endif
   stty erase 
   alias apt "smallapt"
endif
if ($MCTYPE == "mac") then
   stty erase 
   setenv TERM vt100
   alias apt "smallapt"
endif
if ($MCTYPE == "ncd") then
   stty erase 
endif
unsetenv MCTYPE
#
# Display the README file once
#
if ( -e README ) then
   cat README
   mv README README_saved
endif

setenv TMPDIR $HOME

setenv OPENWINHOME /usr/openwin
setenv FRAMEHOME /usr/local/frame
setenv XDESIGNER_HOME /usr/local3/XDesigner4.5
setenv SYBASE /usr/local3/sybase10.0.2.4ebf5589
setenv CCHOME /usr/local/lang
setenv SABLIMEHOME /usr/local/sablime4
setenv DEAP_HOME /deap/today/deap3.0
setenv PURIFYHOME /usr/local/purify
setenv PURIFYLOGFILE $HOME/pur.log
setenv HINDSIGHTHOME /usr/local/hindsight
setenv PATH ${HOME}/bin:${PATH}:${FRAMEHOME}/bin:${XDESIGNER_HOME}/bin:${CCHOME}:${SABLIMEHOME}/bin:${SYBASE}/bin:/usr/local/sqr:/usr/sccs:${PURIFYHOME}:${HINDSIGHTHOME}:/usr/local/IXImd12x/bin:/usr/openwin/bin:/usr/local/bin:${HOME}/deap3.0/bin:/deap/today/deap3.0/bin:/usr/local3/acrobat/AcroRead_1.0/bin:/usr/local3/xrunner/bin:/usr/local/games:/usr/local2/xdt/:${HOME}/deap3.0/migration/adco/bin:${DEAP_HOME}/migration/adco/bin:/usr/local2/sablime4/SBCS/bin:/usr/local3/XDesigner4.5/bin:/usr/local4/netscape/netscape-v30bx
setenv LM_LICENSE_FILE $XDESIGNER_HOME/lib/license.dat

#setenv LD_LIBRARY_PATH /usr/local/IXImd12x/lib:/usr/lib:/usr5/lib:/usr/openwin/lib
setenv LD_LIBRARY_PATH /usr/local3/SCOAutumn96/scomd12x/lib:/usr/lib:/usr5/lib:/usr/openwin/lib

#source $SABLIMEHOME/deapsablime deap3.0

#
if ("`tty`" == "/dev/console") then
        while (1)
           echo -n "Run under X windows y/n [n] ? "
           setenv x $<
           if ($x == "") then
              break
           endif
           if ($x =~ Y* || $x =~ y*) then
              	setenv x "startx -noauth -defeateventsecurity"
#              	setenv x "openwin -noauth -defeateventsecurity"
              break
	   else
	      unsetenv x
	      break
           endif
        end
        if (${?x} == 1) then
          eval $x
	  unsetenv x
        endif
endif

setenv X11 $OPENWINHOME/lib
# setenv TZ GMT
