alias info dialog -m info info
on *:load:/info
dialog info {
  Title "Server info",3,
  size -1 -1 400 40
  icon Icona.ico 
  edit "",1, -1 -1 400 20,read autohs
  button "Time",11, 1 20 40 20, default
  button "Online",12, 40 20 40 20, default 
  button "Idle",13, 80 20 40 20, default
  button "Server",14, 120 20 40 20, default
  button "Exit",19, 360 20 40 20,ok 
  check "ping",15, 160 20 40 20
  check "join/part",16, 200 20 60 20
  check "quits",17, 260 20 40 20
  check "modes",18, 305 20 50 20
}

on *:connect://Did -i info 1 3 Tu prisijungei prie serverio $server | /dialog -t info Server info -- connected
on *:join:#:{
  if ( $did(info,16).state == 1 ) { //Did -i info 1 3 $nick prisijunge prie kanalo $chan }
  else halt
}
on *:ban:#:{
  if ( $did(info,18).state == 1 ) { //Did -i info 1 3 $bnick gavo bana kanale $chan nuo $nick }
  else halt 
}
on *:chat:*://Did -i info 1 3 Su tavim nori kalbetis $nick
on *:invite:#://Did -i info 1 3  Tave pakviete i kanala $chan
on *:part:#:{
  if ( $did(info,16).state == 1 ) { //Did -i info 1 3 $nick paliko kanala $chan }
  else halt
}
on *:kick:#:{
  if ( $did(info,18).state == 1 ) { //Did -i info 1 3 $knick buvo isspirtas is $chan ( $nick ) }
  else halt
}
on *:quit:{
  if ( $did(info,17).state == 1 ) { //Did -i info 1 3 $nick paliko irc }
  else halt 
}
on *:ping:{
  if ( $did(info,15).state == 1 ) { //Did -i info 1 3 PING! }
  else halt
}
on *:pong://Did -i info 1 3 PONG!
on *:topic:#:{
  if ( $did(info,18).state == 1 ) { //Did -i info 1 3 $nick pakeite topika kanale $chan }
  else halt
}
on *:dialog:info:init:0:{
  /did -u info 15
  /did -c info 16
  /did -c info 17
  /did -c info 18
  /dialog -t info Server info
}
on *:Nick://Did -i info 1 3 $nick pakejte nika i $newnick
on *:Dialog:info:sclick:11://Did -i info 1 3 $time $Date
on *:Dialog:info:sclick:12://Did -i info 1 3 Tu online $online sekundes
on *:Dialog:info:sclick:13://Did -i info 1 3 Tu nekalbi $idle sekundes 
on *:Dialog:info:sclick:14://Did -i info 1 3 Tu prisijunges prie $network $server , tavo nikas yra $me
on *:Dialog:info:sclick:19:{
  if ( $?!"Isjungti?" == $False ) { dialog -m info info }
} 
on *:op:#:{
  if ( $did(info,18).state == 1 ) { } 
  if ( $nick == Chanserv ) { halt }
  if ( $nick == savas ) { halt }
  if ( $nick == Petras ) { halt }
  else //Did -i info 1 3  $opnick gavo @ kanale $chan  nuo $nick
}
on *:deop:#:{
  if ( $did(info,18).state == 1 )  {}
  if ( $nick == Chanserv ) { $opnick neteko @ kanale $chan (Chanserv) }
  if ( $nick == savas ) { halt }
  if ( $nick == Petras ) { halt }
  else //Did -i info 1 3  $opnick neteko @ kanale $chan ( $nick )
}
on *:voice:#:{
  if ( $did(info,18).state == 1 )  {}
  if ( $nick == Chanserv ) { halt }
  if ( $nick == savas ) { halt }
  if ( $nick == Petras ) { halt }
  else //Did -i info 1 3  $opnick gavo + kanale $chan  nuo $nick
}
on *:devoice:#:{
  if ( $did(info,18).state == 1 ) {}
  if ( $nick == Chanserv ) { halt }
  if ( $nick == savas ) { halt }
  if ( $nick == Petras ) { halt }
  else //Did -i info 1 3  $opnick neteko + kanale $chan  nuo $nick
}
on *:disconnect://Did -i info 1 3 Tu atsijungei nuo $server | /dialog -t info Server info -- not connected
