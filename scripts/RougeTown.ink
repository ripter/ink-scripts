VAR inventory = ()
LIST prop = stick, torch

- (top)
You are sitting near a campfire.
It is dark out.
There is a cave to the south.
There is a forest to the north.
+ {inventory ? prop.stick} Craft the Stick into a Torch
    ~ inventory -= prop.stick
    ~ inventory += prop.torch
    -> player.display_inventory ->
    -> top
+ [Forest] -> forest.enter
+ [Cave] -> cave.enter
+ [Check Inventory] 
    -> player.display_inventory -> 
    -> top


== cave ==
= enter
    You enter the cave,
    {
      - inventory ? prop.torch:
        The cave walls flicker in the torch light.
      - else:
        <> but is too dark to see. You walk back to the campfire.
        -> top
    }
    -> DONE
    

== forest ==
= enter
    You enter the forest, it is dark.
    -> search
= search
    After bumbling around, you manage to find a stick.
    ~ inventory += prop.stick
    -> player.display_inventory ->
    -> top
    
== player ==
= display_inventory
    You have: {inventory}
    ->->
