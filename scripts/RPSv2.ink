VAR player_attack = ""
VAR ai_attack = ""
LIST throws = rock, paper, scissors
- (top)
    Let's play Rock, Paper, or Scissors.
    -> pick_attack ->
    -> random_attack ->
    Player Attack was {player_attack}
    AI Attack was {ai_attack}
    -> top


=== pick_attack ===
+ [Throw Rock!] You <> -> attack(rock, player_attack)
+ [Throw Paper!] You <> -> attack(paper, player_attack)
+ [Throw Scissors!] You <> -> attack(scissors, player_attack)
->->


== random_attack ===
{&Chris|Xiaoyan|Rose|Will|Skip|Poe|Jynx|Howard|Banker|Matt} <>
{ shuffle:
  - -> attack(rock, ai_attack)
  - -> attack(paper, ai_attack)
  - -> attack(scissors, ai_attack)
}
->->

== match_results ==
TODO Show the result

    
== attack(type, ref attacker) ==
{
  - type ? rock:
    threw a Rock!
    ~ attacker = rock
  - type ? paper:
    threw Paper!
    ~ attacker = paper
  - type ? scissors:
    threw Scissors!
    ~ attacker = scissors
    
}
->->