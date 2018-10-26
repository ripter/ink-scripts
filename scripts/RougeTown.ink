LIST PROP = Stick, Torch
LIST ENV = Day, Night
VAR aspects = (ENV.Night)
VAR inventory = ()

// Init is good to setup first time game stuff
- (init)
  -> top


- (top)
<- campfire.enter
There is a cave to the south.
There is a forest to the north.
+ {inventory ? PROP.Stick} Craft the Stick into a Torch
    ~ inventory -= PROP.Stick
    ~ inventory += PROP.Torch
    -> player.display_inventory ->
    -> top
+ [Forest] -> forest.enter
+ [Cave] -> cave.enter
+ [Check Inventory] 
    -> player.display_inventory -> 
    -> top


== campfire ==
= enter
    {aspects ? ENV.Night: It is dark out}
    {aspects ? ENV.Day: The sun is out, the campfire seems unnecessary but welcome.}
    
    - You are sitting next to a campfire.
      -> environment.advanceTime ->
    -> DONE

== cave ==
= enter
    You enter the cave,
    {
      - inventory ? PROP.Torch:
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
    ~ inventory += PROP.Stick
    -> player.display_inventory ->
    -> top
    
== player ==
= display_inventory
    You have: {inventory}
    ->->
    
== environment ==
= advanceTime
{
  - aspects ? ENV.Night:
    ~ aspects -= ENV.Night
    ~ aspects += ENV.Day
  - aspects ? ENV.Day:
    ~ aspects += ENV.Night
    ~ aspects -= ENV.Day
}
->->