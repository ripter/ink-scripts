LIST throws = rock, paper, scissors
- (top)
    Let's play Rock, Paper, or Scissors.
    -> pick_attack -> random_attack -> top

=== pick_attack ===
    + Throw Rock! -> attack(rock)
    + Throw Paper! -> attack(paper)
    + Throw Scissors! -> attack(scissors)
    - good throw
    ->->
    
== attack(type) ==
{
  - type ? rock:
    threw a Rock!
  - type ? paper:
    threw Paper!
  - type ? scissors:
    threw Scissors!
}
->->

== random_attack ===
AI picks <>
{ shuffle:
  - Rock
  - Paper
  - Scissors
}
->->