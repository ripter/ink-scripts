VAR living_sheep = 5
VAR dead_sheep = 0

- (homestead)
  Your father has tasked you with the very import job taking the sheep to the docks.
  You have {living_sheep} sheep, keep it that way or else your father will be very mad.
  + [Head out with the sheep] -> north1
  
== north1
  The trees quickly thicken into a dense forest. You lead the sheep down the dirt path. The thick trees making it easy to keep the {living_sheep} sheep on the path.
  + [Continue down the path] -> north2
  + [Take the shortcut down the hill to the shore] -> east_shortcut
  <- go_back(->homestead)
  
== north2
  You reach the Northern Path Crossroads. A cobble stone road heads East and West.
  + Head East -> east1
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
  The forest abrubtly ends into a steep down hill. The sheep start to fan out as they playfully jump down the steep slope.
  ~ living_sheep -= 2
  ~ dead_sheep += 2
  When you reach the bottom, you count {living_sheep} sheep still with you.
  + [Make your way to the docks] -> docks


== go_back(-> to)
  + [Go Back] -> to
