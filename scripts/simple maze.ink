VAR living_sheep = 5
VAR dead_sheep = 0

- (homestead)
  "I need you to deliver these {living_sheep} sheep to the docks. I'm trying to setup an overseas trading partner, so don't screw this up!" You father bellows.
  He hands you a long leash that ties all the sheep together.
  "Stay on the road" He warns as he hands over the sheep. 
  + [Head out with the sheep] -> north1
  
== north1
  As you leave the farm, you get an amazing view of the city below. You can see ships moving slowly in the bay and even some wagons along the road.
  The road to the city is long, winding down the steep hill. You often climb down the side of the hill, It's steep, but still walkable. You aren't sure, but you think you can recall someone telling you that sheep are good at climbing steep slopes.
  + [Take the road into the city] 
    You decide not to risk the shortcut. Your dad was very serious about this delivery.
    -> north2
  + [Take the shortcut into the city] -> east_shortcut
  
  
== north2
  An hour and half later you reach the cobble stone road that leads into the city. There is a large patch of grass next to the road.
  The sheep are bleeting loudly and are starting to pull on the leash. They probably want ot rest.
  + [Continue to the city] -> east1
  + [Let the sheep graze in the grass] -> graze_sheep
  <- go_back(->north1)
  
== east1
  You can see the city in the distance. Traffic along the road is starting to pick up.
  + [Head into the city] -> east2
  <- go_back(-> north2)
  
== east2
  You reach the market. You have been here many times helping your father sell whool and cheese.
  + [Head South] -> south1
  <- go_back(-> east1)
  
== south1
  You make your way down into the lower city. You've been here before, sure. But this is the first time you've noticed that the there are no read street signs. And a lot of hungry looking people eying your {living_sheep} sheep.
  + [Make haste to the docks] -> docks
  <- go_back(-> east2)
  
== docks
  ~ temp payment = living_sheep
  As soon as you enter the Docks the Captian comes out to greet you.
    "Ah, thanks for the delivery."
  {
    - dead_sheep == 0: 
      I'm impressed you made it here without losing any sheep.
      ~ payment = payment * 2
    - else:
      There seems to be a few missing. Well I guess you did your best.
  }
  He hands you ${payment} as payment for the sheep.
  + [Go Home]
    -> DONE
  
== east_shortcut
  About half way down the hill, several of the sheep refuse to continue moving. You could just yank on the leash, forcing them down. Or you could let them off the leash so they can make it down at their own pace.
  The slope doesn't seem to be that steep as you start down the hill. Some of the sheep are reluctant to follow you.
  + [Yank on the leash, pulling the sheep along.]
    The sheep resist your pulling, after a good yank the sheep stop resting, causing you to lose your balance. You tumble down the hill, yaking the sheel along with you.
    <- lose_sheep("{~1|2|2|2|3|3}")
  + [Let the sheep off the leash and heard them down the hill.] As soon as you have all the sheep off the leash, they bolt in all directions. After twenty minutes chashing them around the hill, you manage to reach the bottom.
    <- lose_sheep("{~0|1|1|1|2}")
  - 
  When you reach the bottom, you count {living_sheep} sheep still with you.
  + [Enter the docks] -> docks


== graze_sheep
  You let the sheep off the leash and they spread out to eat grass.
  After some time, you hear a commotion and what looks like a group of travlers riding horses comming down the road from the city.
  + [Wait for the travlers to pass]
    As the travlers aproach, they take a look at you and your sheep. They smile wide and shoot a few arrows at your sheep. The city guard on their tail as the two groups pass you.
    <- lose_sheep("{~1|2|2|3|3}")
  + [Hide in the bushes while the travelers pass.]
    As the travelers near, you can see the city guard chasing them. Arrows flying back and forth wildly.
    <- lose_sheep("{~0|0|1|1|1|3}")
  - With the action over, you gather the {living_sheep} sheep and head down the road. -> east1
  -> DONE

== go_back(-> to)
  + [Go Back] -> to
  ->->
  
== lose_sheep(lost)
  ~ temp dead = 0
  {
    - lost == 1:
      ~ dead = 1
    - lost == 2:
      ~ dead = 2
    - lost == 3:
      ~ dead = 3
  }
  ~ living_sheep -= dead
  ~ dead_sheep += dead
  -> DONE