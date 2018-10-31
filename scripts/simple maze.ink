VAR living_sheep = 5
VAR dead_sheep = 0

- (homestead)
  Your father has tasked you with the very import job taking the sheep to the docks.
  You have {living_sheep} sheep, keep it that way or else your father will be very mad.
  + [Head out with the sheep] -> north1
  
== north1
  As you leave the farm, you get an amazing view of the city below. You can see ships moving slowly in the bay. 
  When you are by yourself, sometimes instead of walking all the way around to the city, you just walk down the side of the hill. It is a steep hill. You can't quite remember if it was sheep or goats that are great climbers.
  + [Take the path into the city] -> north2
  + [Lead the sheep down the side of the hill] -> east_shortcut
  
  
== north2
  After a half an hour of walking, the path reaches the cobble stone road that leads into town.
  The sheep are bleeting loudly to rest.
  You reach the Northern Path Crossroads. A cobble stone road heads East and West.
  + Head East -> east1
  + Head West -> DONE
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
  You make it {dead_sheep == 0: safely} to the docks with your {living_sheep} sheep.
  The captian comes out to greet you.
    "Ah, thanks for the delivery."
  {
    - dead_sheep == 0: 
      I'm impressed you made it here without losing any sheep.
      ~ payment = payment * 2
  }
  He hands you ${payment} as payment for the sheep.
  + [Go Home]
    -> DONE
  
== east_shortcut
  The slope doesn't seem to be that steep as you start down the hill. Some of the sheep are reluctant to follow you.
  + [Keep moving, they will follow] As you keep moving, the hill drops off sharply. You and your sheep tumble the rest of the way down.
    <- lose_sheep("{~1|2|3}")
  + [Stop and gather the sheep] You try to gather all the sheep. It is hard to keep track with the sharp slope.
    <- lose_sheep("{~0|1|2}")
  - 
  When you reach the bottom, you count {living_sheep} sheep still with you.
  + [Make your way to the docks] -> docks



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