LIST PROP = Stick, Torch, Campfire
LIST AFFECT = None, Hallucinating
LIST ENV = Day, Night
VAR aspects = (ENV.Day) // It will be Night when the player starts
VAR inventory = ()
VAR thirst = 0
VAR hunger = 0

// Init is good to setup first time game stuff
- (init)
  You wake up next to a roaring campire in a small forest clearing.
  ~ aspects += PROP.Campfire
  ~ thirst = 10
  ~ hunger = 10
  -> home_base

- (home_base)
  -> player.health ->
  + Wait around the campfire
    -> environment.advanceTime -> home_base
  + Search the forest
  -> DONE
  

- (top)
  { has_light(): You have some light }
  { not has_light(): You do not have light }
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
    -> environment.advanceTime ->
    {aspects ? ENV.Night: It is dark out}
    {aspects ? ENV.Day: The sun is out, the campfire seems unnecessary but welcome.}
    
    - You are sitting next to a campfire.
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
    You enter the forest. 
    { 
      - aspects ? ENV.Night: At night you have trouble and trip over something.
      - else: A thick line of trees make it hard to travel into the forest.
    }
    + Search the area -> search
    + Go back to the Campfire -> campfire.enter

= search
    After bumbling around, you manage to find a stick.
    ~ inventory += PROP.Stick
    -> player.display_inventory ->
    -> top
    
== player ==
= display_inventory
  ~ temp total_items = LIST_COUNT(inventory)
  {  total_items == 0:
      You don't have any items.
      (Does that mean you are naked?)
    - else:
      You have {total_items} items.
      [{inventory}]
  }
  You have: {inventory}
  ->->

= health
  {
    - thirst < 10:
      You are starting to hallucinate from dehydration.
      ~ aspects += Hallucinating
    - thirst < 15 and hunger < 15:
      Your stomach twists in pain from thirst and hunger.
    - else:
      You are hungry
  }
  ->->
  
== environment ==
= advanceTime
  ~ thirst--
  ~ hunger--
  As time passes <>
  {
    - aspects ? ENV.Night:
      the sun rises.
      ~ aspects -= ENV.Night
      ~ aspects += ENV.Day
    - aspects ? ENV.Day:
      the sun sets.
      ~ aspects += ENV.Night
      ~ aspects -= ENV.Day
  }
  ->->


== function has_light()
{ 
  - inventory ? PROP.Torch: 
    ~ return true
  - aspects ? ENV.Day:
    ~ return true
  - else:
    ~ return false
}