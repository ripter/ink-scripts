LIST directions = NORTH, EAST, SOUTH, WEST, BACK

- (top)
  You must cross the forset with your flock of sheep.
  Don't let any of your sheep die!
  ~ temp mychoice = ()
  <- list_directions(NORTH)
  + Blah Head North -> north1
  
== north1
  You travel deeper into the woods.
  The sheep wonder on the path, bleeting occsonally.
  <- list_directions((NORTH, BACK))
  + Double Blah Head North -> north2
  
== north2
  You reach a small clearing. The trees look fresly cut.
  + Head East -> east1
  + Go back -> north1
  
== east1
  The path widens as more of the forst has been cleared.
  + Head East -> east2
  + Go back -> north2
  
== east2
  There is a small hut here.
  + Head South -> south1
  + Go back -> east1
  
== south1
  You enter the town.
  + Head West -> west1
  + Go Back -> east2
  
== west1
  You arrive at the docks.
  Congratulations!
  -> DONE
  
== list_directions(available_directions)
  There are {available_directions} directions
  + {available_directions ? NORTH} You can go North!
    -> DONE
  + {available_directions ? BACK} You can go back!
    -> DONE
