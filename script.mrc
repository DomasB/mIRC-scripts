dialog darnzn {
  title "Nu dialogas"
  size -1 -2 200 200
  icon icona.ico  
  button ":)",3, 0 60 50 20,multi
  Button "Refresh",1,50 60 50 20
  button "Nick",4,100 60 50 20
  button "time",5,150 60 50 20  
  Edit "Jusu textas",8, 0 90 100 20  
  Box "textas",11, 5 -1 110 60  
  text "",2, 15 20 90 30,
  icon 100, 20 120 100 50,c:/My Documents/domo/paveiksliukai/etiopia.bmp,top
}
on *:dialog:darnzn:mouse:1://did -a darnzn 2 Refresh button 
on *:dialog:darnzn:mouse:11://did -a darnzn 2 Text box
on *:dialog:darnzn:mouse:3://did -a darnzn 2 :))))))))))))
on *:dialog:darnzn:mouse:4://did -a darnzn 2 %nick1
on *:dialog:darnzn:mouse:5://did -a darnzn 2  $time
on *:dialog:darnzn:edit:8://did -a darnzn 2 $did(8)
dialog pp {
  title "Perform"
  size -1 -2 150 80
  icon icona.ico  
  text "Vykdyti perform?",1, 1 1 150 20,center
  check "Groti intro",2, 40 20 90 20
  button "Taip",3, 4 45 70 30,ok
  button "Ne",4, 77 45 70 30,cancel
}
on *:dialog:pp:sclick:3:{  
  /server irc2.omnitel.net
  if ( $did(pp,2).state == 1 ) { //splay $mircdir\Sounds\intro.wav }
}
on *:dialog:pp:init:0:/did -c pp 2

dialog quit { 
  title "Quitin' so soon?"
  icon icona.ico
  size -1 -1 600 200
  box "Quit reason",1, 2 2 596 40
  edit "",2, 6 16 587 20
  radio "No reason",3, 4 50 100 20
  radio "Connection reset...",4, 100 50 120 20
  radio "Rsatafari is callin' me",5, 240 50 120 20
  radio "Reggae",6, 400 50 100 20
  radio "Restart",7, 500 50 100 20
  radio "Be back soon",8, 4 80 100 20
  radio "One love",9, 100 80 100 20
  radio "Redemption",10, 240 80 100 20
  radio "Kaya",11, 400 80 100 20
  radio "",12, 500 80 100 20
  box "Quitin' reason(extended)",20, 2 100 596 40
  edit "",13, 6 115 587 20
  button "Quit mIRC",14, 6 145 300 50,ok
  button "Get back to mIRC",15, 310 145 284 50,cancel
}
on *:dialog:quit:init:0:{
  /did -m quit 13
  //did -i quit 12 1 $mid(%quit,1,7)
}
on *:dialog:quit:sclick:3:/did -r quit 2 | /did -r quit 13
on *:dialog:quit:sclick:4:/did -i quit 2 1 Read error: Connection reset by peer | /did -r quit 13 
on *:dialog:quit:sclick:5:/did -i quit 2 1 3Rastafari is callin' 8me to come 4back to Zion! | /did -r quit 13
on *:dialog:quit:sclick:6:/did -i quit 2 1 3,8|®®®|8,3Reggae3,8|®®®| | /did -r quit 13
on *:dialog:quit:sclick:7:/did -i quit 2 1 Restarting... | /did -r quit 13
on *:dialog:quit:sclick:8:/did -i quit 2 1 I'll be back very soon... | /did -r quit 13
on *:dialog:quit:sclick:10:/did -i quit 2 1 /did -i quit 2 1 Emancipate yourselves from mental slavery... None but ourselves can free our minds! Have no fear for atomic energy, | /did -i quit 13 3 'Cause none of them can stop the time. How long shall they kill our prophets, While we stand aside and look?

on *:dialog:quit:sclick:9:/did -i quit 2 1 One Love. One heart. Let's get together and feel all right. Give thanks and praise to the Lord and I will feel all right. Let's get | /did -i quit 13 3 together and feel all right..
on *:dialog:quit:sclick:11:/did -i quit 2 1 Got to have kaya now! For the rain is falling. I'm so high, I even touch the sky! Above the falling rain... I feel so good in my | /did -i quit 13 3 neighbourhood, so here I come again... 'Cause I have some kaya now...  
on *:dialog:quit:sclick:12:/did -i quit 2 1 %quit | /did -r quit 13
on *:dialog:quit:sclick:14://quit $did(quit,2) $did(quit,13)
on *:dialog:quit:edit:2:/did -r quit 13 | /did -u quit 3,4,5,6,7,8,9,10,11,12
