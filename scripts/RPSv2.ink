VAR player_attack = ""
VAR ai_attack = ""
LIST throws = rock, paper, scissors
- (top)
    Let's play Rock, Paper, or Scissors.
    -> pick_attack ->
    -> random_attack ->
    -> match_results ->
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
{
  - player_attack == ai_attack:
  Tie!
  - player_attack == rock and ai_attack != paper:
  Rock smashes everything, You Win!
  - player_attack == rock and ai_attack == paper:
  Paper wraps around the Rock, makeing it, less of a rock or something.
  You Lose.
  - player_attack == paper and ai_attack != scissors:
  Paper wraps and binds, You Win!
  - player_attack == paper and ai_attack == scissors:
  Scissors shred the Paper into tiny pieces.
  You Lose.
  - player_attack == scissors and ai_attack != rock:
  Scissors cut and shred everything in their path, You Win!
  - player_attack == scissors and ai_attack == rock:
  Rock smashes scissors into scrap metal.
  You Lose.
}
->->

    
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