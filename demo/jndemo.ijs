
18!:4 <'base'
18!:55 <'jndemo'
coclass 'jndemo'

showevents_jnet_=: 0:
sububar=: I. @(e.&'_')@]}
maketitle=: ' '&sububar each @ cutopen ;._2
fexist=: 1:@(1!:4)@boxopen ::0:

rundemo=: 1 : 0
load bind ('~addons/ide/jnet/demo/','.ijs',~m)
)

SOH=: 1{a.
toSOH=: [:;(SOH,~":)each

TITLES=: maketitle 0 : 0
cities dcities
coins dcoins
controls dcontrols
datetime ddatetime
edit dedit
events devents
form dform
gl2 dgl2
grid dgrid
image dimage
isigraph... disigraph
life dlife
mbox dmbox
mbdialog dmbdialog
menu dmenu
msgs dmsgs
pen_styles dpenstyles
plot dplot
pousse dpousse
progress dprogress
regular_expressions dregex
rtf drtf
spinbox dspinbox
timer dtimer
trackbar dtrackbar
unicode_simple dunisimple
viewmat dviewmat
wdplot dwdplot
webd3 dwebd3
webview dwebview
)

NB. =========================================================
JNDEMO=: 0 : 0
pc6j jndemo closeok;pn "Demos Select";
xywh 114 38 42 12;cc ok button leftmove rightmove;cn "OK";
xywh 114 55 42 12;cc cancel button leftmove rightmove;cn "Cancel";
xywh 6 36 100 200;cc listbox listbox ws_border ws_vscroll rightmove bottommove;
xywh 114 200 42 26;cc addons button leftmove rightmove topmove bottommove;cn "Install addons";
xywh 7 9 150 26;cc static1 static;cn "static1";
pas 4 2;pcenter;
rem form end;
)

NB. =========================================================
jndemo_run=: 3 : 0
wd JNDEMO
t=. 'Select a JNet demo from the list below. '
t=. t,'Click "install addons" to install the addons '
t=. t,'needed for the demos.'
wd 'set static1 *',t
wd 'set listbox ',;DEL,each ({."1 TITLES),each DEL
wd 'setselect listbox 0'
wd 'setfocus listbox'
wd 'pshow;'
)

NB. =========================================================
jndemo_close=: 3 : 0
wd 'pclose'
)

NB. =========================================================
jndemo_listbox_button=: 3 : 0
fn=. > {: (".listbox_select) { TITLES
fn~0
)

NB. =========================================================
jndemo_enter=: jndemo_ok_button=: jndemo_listbox_button
jndemo_cancel_button=: jndemo_close

NB. =========================================================
dcities=: 'citydemo' rundemo
dcoins=: 'coins' rundemo
dcontrols=: 'controls' rundemo
ddatetime=: 'datetime' rundemo
dedit=: 'edit' rundemo
devents=: 'events' rundemo
dform=: 'form' rundemo
dgl2=: 'gl2' rundemo
dgrid=: 'grid' rundemo
dimage=: 'image' rundemo
dlife=: 'life' rundemo
dmbox=: 'mbox' rundemo
dmbdialog=: 'mbdialog' rundemo
dmenu=: 'menu' rundemo
dmsgs=: 'msgs' rundemo
dpenstyles=: 'penstyles' rundemo
dplot=: 'plot' rundemo
dpousse=: 'pousse' rundemo
dprogress=: 'progress' rundemo
dspinbox=: 'spinbox' rundemo
drtf=: 'rtf' rundemo
dregex=: 'regdemo' rundemo
dtimer=: 'timer' rundemo
dtrackbar=: 'trackbar' rundemo
dunisimple=: 'unisimple' rundemo
dviewmat=: 'viewmat' rundemo
dwebd3=: 'webd3' rundemo
dwebview=: 'webview' rundemo

NB. =========================================================
disigraph=: load bind ('~addons/demos/isigraph/isdemo.ijs')

NB. =========================================================
dwdplot=: load bind ('~addons/demos/wdplot/plotdemo.ijs')

NB. =========================================================
jndemo_view_button=: 3 : 0
f=. }. > {: (".listbox_select) { TITLES
textview f;1!:1 <jpath '~addons/ide/jnet/demo/',f,'.ijs'
)

NB. =========================================================
jndemo_addons_button=: 3 : 0
require 'pacman'
'update' jpkg ''
'install' jpkg 'graphics/bmp graphics/gl2 graphics/grid graphics/plot graphics/viewmat demos/isigraph demos/wdplot'
smoutput 'All JNet demo addons installed.'
)

NB. =========================================================
checkrequire=: 3 : 0
'req install'=. y
if. *./fexist getscripts_j_ req do. 1 return. end.
wdinfo 'To run this demo, first install: ',install
0
)

NB. =========================================================
notsupport=: 3 : 0
wdinfo 'This demo is not supported on ', UNAME, ' ', wd 'version'
)

NB. =========================================================
jndemo_run''