var storyContent = ﻿{"inkVersion":18,"root":[[["^Let's play Rock, Paper, or Scissors.","\n","^You have ","ev",{"VAR?":"fame"},"out","/ev","^ fame.","\n",{"->t->":"pick_attack"},{"->t->":"random_attack"},{"->t->":"match_results"},{"->":".^"},["done",{"#f":7,"#n":"g-0"}],{"#f":7,"#n":"top"}],null],"done",{"pick_attack":[["ev","str","^Throw Rock!","/str","/ev",{"*":".^.c-0","flg":4},"ev","str","^Throw Paper!","/str","/ev",{"*":".^.c-1","flg":4},"ev","str","^Throw Scissors!","/str","/ev",{"*":".^.c-2","flg":4},{"c-0":["^ You ","<>","^ ","ev",{"VAR?":"rock"},{"^var":"player_attack","ci":-1},"/ev",{"->":"attack"},"\n",{"#f":7}],"c-1":["^ You ","<>","^ ","ev",{"VAR?":"paper"},{"^var":"player_attack","ci":-1},"/ev",{"->":"attack"},"\n",{"#f":7}],"c-2":["^ You ","<>","^ ","ev",{"VAR?":"scissors"},{"^var":"player_attack","ci":-1},"/ev",{"->":"attack"},"\n","ev","void","/ev","->->",{"#f":7}]}],{"#f":3}],"random_attack":[["ev","visit",10,"%","/ev","ev","du",0,"==","/ev",{"->":".^.s0","c":true},"ev","du",1,"==","/ev",{"->":".^.s1","c":true},"ev","du",2,"==","/ev",{"->":".^.s2","c":true},"ev","du",3,"==","/ev",{"->":".^.s3","c":true},"ev","du",4,"==","/ev",{"->":".^.s4","c":true},"ev","du",5,"==","/ev",{"->":".^.s5","c":true},"ev","du",6,"==","/ev",{"->":".^.s6","c":true},"ev","du",7,"==","/ev",{"->":".^.s7","c":true},"ev","du",8,"==","/ev",{"->":".^.s8","c":true},"ev","du",9,"==","/ev",{"->":".^.s9","c":true},"nop",{"s0":["pop","^Chris",{"->":".^.^.65"},null],"s1":["pop","^Xiaoyan",{"->":".^.^.65"},null],"s2":["pop","^Rose",{"->":".^.^.65"},null],"s3":["pop","^Will",{"->":".^.^.65"},null],"s4":["pop","^Skip",{"->":".^.^.65"},null],"s5":["pop","^Poe",{"->":".^.^.65"},null],"s6":["pop","^Jynx",{"->":".^.^.65"},null],"s7":["pop","^Howard",{"->":".^.^.65"},null],"s8":["pop","^Banker",{"->":".^.^.65"},null],"s9":["pop","^Matt",{"->":".^.^.65"},null],"#f":5}],"^ ","<>","\n",["ev","visit",3,"seq","/ev","ev","du",0,"==","/ev",{"->":".^.s0","c":true},"ev","du",1,"==","/ev",{"->":".^.s1","c":true},"ev","du",2,"==","/ev",{"->":".^.s2","c":true},"nop",{"s0":["pop","\n","ev",{"VAR?":"rock"},{"^var":"ai_attack","ci":-1},"/ev",{"->":"attack"},{"->":".^.^.23"},null],"s1":["pop","\n","ev",{"VAR?":"paper"},{"^var":"ai_attack","ci":-1},"/ev",{"->":"attack"},{"->":".^.^.23"},null],"s2":["pop","\n","ev",{"VAR?":"scissors"},{"^var":"ai_attack","ci":-1},"/ev",{"->":"attack"},{"->":".^.^.23"},null],"#f":5}],"\n","ev","void","/ev","->->",{"#f":3}],"match_results":[["ev",{"VAR?":"player_attack"},{"VAR?":"ai_attack"},"==","/ev",{"->":".^.b","c":true},{"b":["\n","^Tie!","\n",{"->":".^.^.^.7"},null]}],["ev",{"VAR?":"player_attack"},{"VAR?":"rock"},"==",{"VAR?":"ai_attack"},{"VAR?":"paper"},"!=","&&","/ev",{"->":".^.b","c":true},{"b":["\n","^Rock smashes everything, You Win!","\n",{"->":"player_win"},{"->":".^.^.^.7"},null]}],["ev",{"VAR?":"player_attack"},{"VAR?":"rock"},"==",{"VAR?":"ai_attack"},{"VAR?":"paper"},"==","&&","/ev",{"->":".^.b","c":true},{"b":["\n","^Paper wraps around the Rock, makeing it, less of a rock or something.","\n","^You Lose.","\n",{"->":"player_lose"},{"->":".^.^.^.7"},null]}],["ev",{"VAR?":"player_attack"},{"VAR?":"paper"},"==",{"VAR?":"ai_attack"},{"VAR?":"scissors"},"!=","&&","/ev",{"->":".^.b","c":true},{"b":["\n","^Paper wraps and binds, You Win!","\n",{"->":"player_win"},{"->":".^.^.^.7"},null]}],["ev",{"VAR?":"player_attack"},{"VAR?":"paper"},"==",{"VAR?":"ai_attack"},{"VAR?":"scissors"},"==","&&","/ev",{"->":".^.b","c":true},{"b":["\n","^Scissors shred the Paper into tiny pieces.","\n","^You Lose.","\n",{"->":"player_lose"},{"->":".^.^.^.7"},null]}],["ev",{"VAR?":"player_attack"},{"VAR?":"scissors"},"==",{"VAR?":"ai_attack"},{"VAR?":"rock"},"!=","&&","/ev",{"->":".^.b","c":true},{"b":["\n","^Scissors cut and shred everything in their path, You Win!","\n",{"->":"player_win"},{"->":".^.^.^.7"},null]}],["ev",{"VAR?":"player_attack"},{"VAR?":"scissors"},"==",{"VAR?":"ai_attack"},{"VAR?":"rock"},"==","&&","/ev",{"->":".^.b","c":true},{"b":["\n","^Rock smashes scissors into scrap metal.","\n","^You Lose.","\n",{"->":"player_lose"},{"->":".^.^.^.7"},null]}],"nop","\n","ev","void","/ev","->->",{"#f":3}],"player_win":["ev",{"VAR?":"fame"},1,"+",{"temp=":"fame","re":true},"/ev","ev","void","/ev","->->",{"#f":3}],"player_lose":["ev",{"VAR?":"fame"},1,"-",{"temp=":"fame","re":true},"/ev","ev","void","/ev","->->",{"#f":3}],"attack":[{"temp=":"attacker"},{"temp=":"type"},["ev",{"VAR?":"type"},{"VAR?":"rock"},"?","/ev",{"->":".^.b","c":true},{"b":["\n","^threw a Rock!","\n","ev",{"VAR?":"rock"},"/ev",{"temp=":"attacker","re":true},{"->":"attack.5"},null]}],["ev",{"VAR?":"type"},{"VAR?":"paper"},"?","/ev",{"->":".^.b","c":true},{"b":["\n","^threw Paper!","\n","ev",{"VAR?":"paper"},"/ev",{"temp=":"attacker","re":true},{"->":"attack.5"},null]}],["ev",{"VAR?":"type"},{"VAR?":"scissors"},"?","/ev",{"->":".^.b","c":true},{"b":["\n","^threw Scissors!","\n","ev",{"VAR?":"scissors"},"/ev",{"temp=":"attacker","re":true},{"->":"attack.5"},null]}],"nop","\n","ev","void","/ev","->->",{"#f":3}],"global decl":["ev",0,{"VAR=":"fame"},{"list":{}},{"VAR=":"player_attack"},{"list":{}},{"VAR=":"ai_attack"},{"list":{},"origins":["throws"]},{"VAR=":"throws"},"/ev","end",null],"#f":3}],"listDefs":{"throws":{"rock":1,"paper":2,"scissors":3}}};