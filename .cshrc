###############for csh/tcsh####HuangJS############
unset echo 
umask 022 
limit coredumpsize 0

set cdpath=(~) 
#set cdpath=(~ /.automount/montage2/root/work/montage2_work/josh.huang/montage2/SIM/sim01/sim_rtl) 
if ( $?prompt ) then
    set history=320
endif

set recexact 
set autolist
set matchbeep = never 
set autoexpand
set ignoreeof ; # prevents the shell from accidentally being  killed
set noclobber
set noding   
#set hardpaths

set COLORS =    $HOME/.DIR_COLORS.xterm
set history =   3000
if ( $?prompt ) then
#if ($shell:t == tcsh) set prompt = '%{\033[00;33m%}\! %{\033[01;34m%}%n%{\033[00;35m%}@%{\033[00;36m%}%m%{\033[01;34m%}:%{\033[00;35m%}%~%{\033[01;34m%}%#%{\033[00;37m%} ' 
if ($shell:t == tcsh) set prompt="%{\033[00;33m%}\!\%%{^[[0;35m%}%n%{^[[1;36;0m%}@%{^[[0;32m%}%m%{^[[1;32m%}-%{^[[0;32m%}%l%{^[[1;30m%}{%{^[[0;33m%}%P%{^[[0;00m%}%{^[[1;30m%}}%{^[[0;34m%}#[%{^[[0;36m%}%~%{^[[0;34m%}]%$ %{^[[00m%} \n%{\033[01;30m%}tcsh>%{\033[00m%} "
#if ($shell:t == tcsh) set prompt="%{\033[00;33m%}\!\%%{^[[0;35m%}%n%{^[[1;36;0m%}@%{^[[0;32m%}%m%{^[[1;32m%}-%{^[[0;32m%}%l%{^[[1;30m%}{%{^[[1;33;44m%}%P%{^[[0;00m%}%{^[[1;30m%}}%{^[[0;34m%}#[%{^[[0;36m%}%~%{^[[0;34m%}]%$ %{^[[0;37;40m%} \n✍ "
#if ($shell:t == tcsh) set prompt = '%{\033[00;33m%}151 %{\033[01;34m%}%n%{\033[00;35m%}@%{\033[00;36m%}%m%{\033[01;34m%}:%{\033[00;35m%}%~%{\033[01;34m%}%#%{\033[00;37m%} ' 
#if ($shell:t == tcsh) set prompt="%{^[[1;33m%}%n%{^[[1;36;0m%}@%{^[[1;32m%}%m%{^[[1;30m%}{%{^[[1;33;44m%}%P%{^[[0;00m%}%{^[[1;30m%}}%{^[[0;34m%}#[%{^[[1;33m%}%.%{^[[0;34m%}]%$ %{^[[0;37;40m%} "
#prompt2        %R? 
#prompt3        CORRECT>%R (y|n|e|a)? 
endif
setenv MANPATH /users/sgeadmin/man:/usr/share/man/en:/usr/share/man:/usr/man:/usr/local/share/man:/usr/local/man:/usr/X11R6/man
setenv NOVAS      /tools/NOVAS/Verdi/Verdi60v2
setenv NOVAS_HOME /tools/NOVAS/Verdi/Verdi60v2
setenv SVN_EDITOR vim
setenv EDITOR vim
setenv VISUAL vim
setenv PKG_CONFIG /usr/local/bin/pkg-config
setenv PKG_CONFIG_PATH /usr/local/lib/pkgconfig/:/usr/local/lib64/pkgconfig/:/usr/lib/pkgconfig:/usr/lib64/pkgconfig:/usr/share/pkgconfig
#setenv STATIC_IP_ADDRESS 172.16.18.108
setenv STATIC_IP_ADDRESS 172.16.19.150

if ($OSTYPE == "FreeBSD") then
        alias ls 'ls -G'
else
        alias ls 'ls --color=auto'
endif

setenv LESS "-IE"
setenv DEFAULT_IM cj
setenv XMODIFIERS "@im=SCIM"
setenv GTK_IM_MODULE  "scim"
setenv QT_IM_MODULE   "scim"
setenv BROWSER /usr/bin/firefox
setenv SUPPORTED "zh_TW.Big5:zh_TW.UTF-8:zh_TW:zh:en_US.UTF-8:en_US:en"
setenv MGC_CALIBRE_LAYOUT_SERVER localhost:9189

# if ($?DISPLAY && !($?SSH_CONNECTION)) setenv DISPLAY 172.16.18.108:0.0

# sothat's .tcshrc
# enjoy it
# $Id: .tcshrc,v 1.34 2004/06/19 06:53:04 sothat Exp $

#stty -g             # checks terminal status
#if ($status == 0) then  # succeeds if a
if ( $?TERM && $?prompt ) then
    stty erase 
    #stty erase 
    stty cs8 -istrip
    stty pass8
    if ( $OSTYPE == "FreeBSD" ) then
        msgs -f
        biff n
        if ( ! $?COLORTERM) mesg y
    endif

    bindkey "\e[1~" beginning-of-line # Home
    bindkey "\e[7~" beginning-of-line # Home rxvt
    bindkey "\e[2~" overwrite-mode    # Ins
    bindkey "\e[3~" delete-char       # Delete
    bindkey "\e[4~" end-of-line       # End
    bindkey "\e[8~" end-of-line       # End rxvt
    bindkey "\eOM"  newline

endif
#endif

setenv BLOCKSIZE k
setenv DIFF_OPTIONS -u # may break vimdiff
setenv EDITOR vim
setenv LC_ALL en_US.UTF-8
if (! $?ENCODING_UTF8 && $OSTYPE == "FreeBSD") then
    setenv LC_CTYPE "zh_TW.Big5"
    set dspmbyte="big5"
    set tenc="big5"
    setenv LESSCHARSET iso8859
else
    setenv LC_CTYPE "en_US.UTF-8"
    set dspmbyte="utf8"
    set tenc="utf-8"
    setenv LESSCHARSET utf-8
endif
setenv LESS "-R -i"
setenv GREP_OPTIONS '--color=auto   --binary-files=without-match'
if (-X "lesspipe.sh") setenv LESSOPEN "|lesspipe.sh %s"
setenv PACKAGEROOT "ftp://ftp6.tw.freebsd.org"
setenv PAGER less
setenv FTP_PASSIVE_MORE no
setenv BLOCKSIZE K
setenv QT_XFT "true"

alias h         history 25
alias j         jobs -l
alias l         ls
alias la        ls -a
alias lf        ls -FA
alias ll        ls -lA
alias lc        ls -1hrsS
alias lc2       ls -1lhrc
alias lt        ls -latrh
alias c         clear
alias pls       'ls --color=always \!* | less'
alias plc       'ls -1hrsS --color=always \!* | less'
alias plc2      'ls -1lhrc --color=always \!* | less'
alias cd..      cd ..
alias r         'sudo su \!*'

set path = ( /sbin /bin /usr/sbin /usr/bin /usr/games /usr/local/sbin /usr/local/bin /usr/X11R6/bin \
        $HOME/bin $HOME/Programs \
        /users/domain/scripts /users/domain /users/domain/bin/ \
        /users/josh.huang/bin/ \
        /usr/ports/Tools/scripts \
        /opt/ActiveTcl-8.5/bin   \
        /net/wspc7715/home/opt/iozone/bin/ \
        /users/john-cc.chen/work/r2_tools/aeon_new_amac/bin/ /users/josh.huang/work/r2_tools/aeon_new_amac/bin/ /users/john-cc.chen/work/r2/trunk/aeon_vrp/bin \
        /users/sgeadmin/bin/lx24-amd64 /tools/Adobe/Reader8/bin/ /usr/java/default/bin )

if ($?prompt && $?term ) then
    # An interactive shell -- set some stuff up
    set filec # from .cshrc only 
    alias helpcommand '\!:1 --help'
    #if ( -X devtodo ) alias cwdcmd devtodo --timeout 10 --summary
    # set mail = (/var/mail/$USER `echo ~/Mail/*` )
    # devtodo --timeout --summary
    # set tperiod = 1
    if ( $TERM =~ screen* ) then
        if (! $?WINDOW) then
            set WINDOW=""
        endif
        #set prompt = '%{\ek\e\\%}%{\e[1;31m%}%n@%{\e[0;1;31m%}%m.'$WINDOW' %{\e[1;33m%}%c2%#%{\e[0m%} '
    else
        if ( $TERM =~ xterm* ) then
            # print hostname on xterm*'s title
            #set prompt = "%{\e]2;%m:%~\007%}%{\e[1;31m%}%n@%{\e[0;1;31m%}%m %{\e[1;33m%}%c2%#%{\e[0m%} "
            setenv TERM xterm-color
        else
                #set prompt = "%{\e[1;31m%}%n@%{\e[0;1;31m%}%m %{\e[1;33m%}%c2%#%{\e[0m%} "
        endif
    endif
endif

# set colorp to use colorful prompt
if ( $uid != 0 ) set colorp
if ( ! $?colorp && $?prompt ) then
# use buildin replacement
#    set prompt = "$prompt:as/%{\e[1;31m%}//:as/%{\e[0;1;31m%}//:as/%{\e[1;33m%}//:as/%{\e[0m%}//"
## or use sed
# set noglob
# set prompt = `echo "$prompt" | sed -e 's,%{\\\e\[[^m]*m%},,g'`
# unset noglob
endif

set autolist
#set cdpath = ( ~  /var/db/ /usr/local /var /usr/local/etc )
set color
set colorcat
#set complete = enhance
set complete
unset cwdcmd
set fignore = (.o \~)
#set implicitcd=verbose
set histdup = prev
set history = 2000
set nobeep
set noclobber
set notify
#alias precmd date
set rmstar
#set tperiod=3
#alias periodic date
#set savehist = ( 2000 merge )
set symlinks = expand #chase, ignore, unset
set watch = ('[aefghs]*' any any )

#for dirs begins
set dunique
set pushdsilent
set pushdtohome
#for dirs ends  

complete acroread 'p/*/f:*.[pP][dD][fF]/'
complete unzip 'p/*/f:*.[zZ][iI][pP]/'
complete acroread8 'p/*/f:*.pdf/'
complete alias 'p/1/a/'
complete cc 'c/-I/d/'
complete cd 'p/1/d/'
complete find 'n/-name/f/' 'n/-newer/f/' 'n/-{,n}cpio/f/' 'n/-exec/c/' 'n/-ok/c/' 'n/-user/u/' 'n/-group/g/' 'n/-fstype/(nfs 4.2)/' 'n/-type/(b c d f l p s)/' 'c/-/(name newer cpio ncpio exec ok user group fstype type atime ctime depth inum ls mtime nogroup nouser perm print prune size xdev)/' 'p/*/d/'
complete finger 'p/1/u/'
complete last   'n/-f/f/' 'p/*/u/'
# complete gdb  'p/2/(core|*.core)/' 'p/*/c/'
# complete gv   'p/*/f:*.{ps,eps}/'
complete man 'p/*/c/'
complete qr  'p/1/c/'
complete which 'p/*/c/'
complete sudo 'p/1/c/'
complete tsocks 'p/1/c/'
complete mutt c@=@F:$HOME/Mail/@
complete set 'p/1/s/'
complete true 'p/1/x:True has no options./'
complete unalias 'p/1/a/'
# complete unlink  'p/*/f:^*.{c,h,cc,cpp,C,tex,1,man,l,y}/'
complete xdvi 'p/*/f:*.dvi/'
complete qrun     'p/1/c/'
complete qrun.hc  'p/1/c/'
complete qrun.2hc 'p/1/c/'

alias mand      groff -mandoc -Tascii
alias tt        telnet
if ( -X zh-telnet ) alias telnet        zh-telnet
alias tl        telnet localhost
alias le        less
alias les       less
alias lss       less
alias lses      less
alias elss      less
alias Less      less
alias vmi       vim
alias lm        less Makefile
#alias ls       gnuls --color=auto --show-control-chars -F -B

if ( $OSTYPE == "FreeBSD" ) then
    alias ls    gnuls --color=auto --show-control-chars -F
else if ($OSTYPE == "linux") then
    alias ls    ls --color=auto --show-control-chars -F
else if ($OSTYPE == "solaris") then
    if (-x /usr/local/bin/ls) alias ls  /usr/local/bin/ls --color=auto --show-control-chars -F
endif

alias sc        screen
alias sl        screen -ls
alias sr        screen -R
alias sd        screen -d
alias sx        screen -x
alias vi        vim
if ($OSTYPE == "FreeBSD" ) then
    alias listen        'sockstat | grep "\*:[0-9 ]*\*:\*" | cut -c10-18,30-34,39-45| sort -n -u +2'
else
    alias listen        netstat -t -l
endif
alias view      vim -R
alias cp        cp -i
#alias rm       del
alias del       'mv \!* ~/.trashcan'
alias rmcan     'rm ~/.trashcan/*'
alias dc    cd
alias psg   'ps auwx|grep \!*'
alias msk   'make search key=\!* | egrep "^(Info|Path|Port)"'
alias msn   'make search name=\!* | egrep "^(Info|Path|Port)"'
alias td    todo -A
alias lrpm  "rpm -U --ignoreos --root /compat/linux --dbpath /var/lib/rpm --nodeps --replacepkgs --ignorearch "
alias r     'sudo su \!*'
#alias w3m   w3m -I big5 -O big5
#alias w3m   w3m -O big5
alias rdoc  'wvWare -c $tenc \!* | w3m -I $tenc -O $tenc -T text/html'
alias makev 'make \!* |& grep -v warning'
alias makel 'make \!* |& less'
alias luit  env LC_CTYPE=zh_TW.Big5 luit
alias findn find . -name 

if ( -z ~/postponed ) unlink ~/postponed
if ( ! -d ~/.trashcan ) mkdir ~/.trashcan
if ( -f ~/.tcshrc.local ) source ~/.tcshrc.local

alias wfcmgr /usr/lib/ICAClient/wfcmgr
alias a alias
a  l 'ls -sF'
a ll 'ls -ltr'
a le  'less -i'
a  m  more
a fn "find . -name '*'\!:1'*' -print \!:2*"
a fnn "find . -name '*'\!:1 -print \!:2*"
#a cd 'cd \!*; set prompt = "<`hostname`$cwd \! > "';
#a   dir     'ls -lg'
a   h       history
a   ^L      clear
a   e       '\emacs -nw'
a   emacs   '\emacs -fn fixed -fg White -bg Maroon -ms White -cr White '
a   rxterm  randomxterm.pl
#a chinese 'xset +fp /usr/local/X11R5/lib/X11/fonts/cxterm_fonts; \
        #           xset +fp /usr/local/X11R5/lib/X11/fonts/chinese'
        #a source_verilog 'source /tools/verilog/cshrc.verilog'
        a lprint    'atp -r -T A4 -postscript \!* | lp -d lj'
        a work  'cd $PROJ_WORK_DIR/`whoami`'
        a qhost '\qhost | grep ^hc | sort -g +3'
        a myip  '/sbin/ifconfig'
        a so source
        a lessn 'less --LINE-NUMBER '
        a sorc 'source ~/.cshrc'
        unalias cd
        alias cd 'cd '
        alias xtermj 'xterm -bg black -fg white'
        #if (  $?SSH_CLIENT  ) then
                if (-e "$HOME/.ssh-agent"  )  then
                        #43200 sec = 12 hours
                        alias keyon   "ssh-add -t 43200" 
                        alias keyoff  'ssh-add -D'
                        alias keylist 'ssh-add -l'
                endif
        #endif

        alias cd cd
        setenv NOVAS_RC "$HOME/.novas.rc"
        setenv NLINTRC  "$HOME/.nLint.rc"
        if !(  $?SSH_CONNECTION  ) then
                #alias svn  /opt/CollabNet_Subversion/bin/svn
        endif
alias rxvt 'rxvt -bg black -fg white'
setenv TSOCKS_PASSWORD none
setenv AUTOSSH_GATETIME 0
setenv AUTOSSH_POLL 60
if (-f ~/.cmdalias) source ~/.cmdalias
if (-f ~/.diralias) source ~/.diralias
#setenv CDS_AUTO_64BIT ALL

if ($USER == josh.huang) then
    if (-f $HOME/.mdp) then
        set mdp=`cat $HOME/.mdp`
        if (! $?http_proxy) setenv http_proxy "http://josh.huang:$mdp@proxy-gear.domain.com.tw:3128/"
        if (! $?https_proxy) setenv https_proxy "http://josh.huang:$mdp@proxy-gear.domain.com.tw:3128/"
    endif
endif
setenv no_proxy domain.com,domain.com.tw,172.16.18.108/24

#source /tools/CAD/cshrc.verdi0707.64bitF
setenv TZ "Asia/Taipei"
#setenv VCS_ARCH_OVERRIDE redhat72
#setenv VCS_ARCH_OVERRIDE amd64   

set echo_style=both
#if ( $TERM =~ xterm* ) then
#        alias  jobcmd echo -n '"\e]0;"\!#:q  "($cwd)\a"'
#endif

#for qhost begin
setenv SGE_ROOT /users/sgeadmin
set ARCH = lx24-amd64
setenv SGE_CELL MStarTW
setenv SGE_CLUSTER_NAME p6444
unsetenv SGE_QMASTER_PORT
unsetenv SGE_EXECD_PORT 
#for qhost end

#for p4v start
setenv QTDIR /users/domain/bin/p4v-2008.1.164135/lib/p4v/qt4
setenv P4VRES /users/domain/bin/p4v-2008.1.164135/lib/p4v/P4VResources
setenv P4PORT 172.16.64.166:1666
setenv P4CLIENT josh.huang--asic-work-t1_work002
setenv P4USER mst_asic
#setenv P4CHARSET "utf8"
setenv P4CHARSET        
setenv P4DIFF        "gvimdiff -f"
setenv P4DIFFUNICODE "gvimdiff -f"
setenv PERL5LIB /tools/script/CPAN_lib
#for p4v end
source /users/josh.huang/.ads.cshrc

# only differ in di (directory)
setenv LS_COLORS "no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;32:*.cmd=00;32:*.exe=00;32:*.com=00;32:*.btm=00;32:*.bat=00;32:*.sh=00;32:*.csh=00;32:*.tar=00;31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tz=00;31:*.rpm=00;31:*.cpio=00;31:*.jpg=00;35:*.gif=00;35:*.bmp=00;35:*.xbm=00;35:*.xpm=00;35:*.png=00;35:*.tif=00;35:"
#Fixed by $HOME/.Xresources
#if ($?COLORTERM) then                                                   
#if ($COLORTERM == "rxvt") then
#setenv LS_COLORS "no=00:fi=00:di=100;01;34:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;32:*.cmd=00;32:*.exe=00;32:*.com=00;32:*.btm=00;32:*.bat=00;32:*.sh=00;32:*.csh=00;32:*.tar=00;31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tz=00;31:*.rpm=00;31:*.cpio=00;31:*.jpg=00;35:*.gif=00;35:*.bmp=00;35:*.xbm=00;35:*.xpm=00;35:*.png=00;35:*.tif=00;35:"          
#endif
#endif

setenv LD_LIBRARY_PATH .:/usr/lib64:/usr/X11R6/lib64:/lib:/usr/local/lib:/usr/NX/lib:/usr/local/ssl/lib:/opt/firefox/lib:/usr/lib64/frysk:/usr/lib64/libglade/2.0:/usr/lib64/qt-3.3/lib/

unset correct
if ($?prompt) set echo #make alias visible, must be the last line



# # New environment setting added by Winpower on Tue Feb 09 11:40:26 CST 2010 1.
# # The unmodified version of this file is saved in /users/josh.huang/.cshrc1866872619.
# # Do NOT modify these lines; they are used to uninstall.
# if ( ! $?LD_LIBRARY_PATH ) then
# 	setenv LD_LIBRARY_PATH ""	
# endif
# setenv LD_LIBRARY_PATH "${LD_LIBRARY_PATH}:/net/hcsf003/work/josh.huang/big3/opt/winpower/lib"
# # End comments by InstallAnywhere on Tue Feb 09 11:40:26 CST 2010 1.
# 
# # New environment setting added by Winpower on Tue Feb 09 11:40:26 CST 2010 3.
# # The unmodified version of this file is saved in /users/josh.huang/.cshrc1866872619.
# # Do NOT modify these lines; they are used to uninstall.
# if ( ! $?LIBPATH ) then
# 	setenv LIBPATH ""	
# endif
# setenv LIBPATH "${LIBPATH}:/net/hcsf003/work/josh.huang/big3/opt/winpower/lib"
# # End comments by InstallAnywhere on Tue Feb 09 11:40:26 CST 2010 3.
# 
# # New environment setting added by Winpower on Tue Feb 09 11:40:26 CST 2010 5.
# # The unmodified version of this file is saved in /users/josh.huang/.cshrc1866872619.
# # Do NOT modify these lines; they are used to uninstall.
# if ( ! $?SHLIB_PATH ) then
# 	setenv SHLIB_PATH ""	
# endif
# setenv SHLIB_PATH "${SHLIB_PATH}:/net/hcsf003/work/josh.huang/big3/opt/winpower/lib"
# # End comments by InstallAnywhere on Tue Feb 09 11:40:26 CST 2010 5.
