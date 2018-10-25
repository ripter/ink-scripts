LIST throws = rock, paper, scissors
- (top)
    Let's play Rock, Paper, or Scissors.
    -> pick_attack -> random_attack -> top

=== pick_attack ===
+ [Throw Rock!] You <> -> attack(rock)
+ [Throw Paper!] You <> -> attack(paper)
+ [Throw Scissors!] You <> -> attack(scissors)
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
The AI <>
{ shuffle:
  - -> attack(rock)
  - -> attack(paper)
  - -> attack(scissors)
}
->->