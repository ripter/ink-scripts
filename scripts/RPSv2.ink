VAR fame = 1
VAR player_attack = ()
VAR ai_attack = ()
LIST throws = rock, paper, scissors

- (start)
Let's play Rock, Paper, or Scissors.
Each game costs $1

- (top)
{
  - fame > 0:
    You have ${fame}.
    -> pick_attack ->
    -> random_attack ->
    -> match_results ->
    -> top
  - fame <= 0:
    You had a good run, and a lot of people made money. You where not one of those people.
    -> gameover
}



=== pick_attack ===
+ [Throw Rock!] You <> -> attack(rock, player_attack)
+ [Throw Paper!] You <> -> attack(paper, player_attack)
+ [Throw Scissors!] You <> -> attack(scissors, player_attack)
+ [Quit with ${fame}]
    -> gameover



== random_attack ===
{~Chris|Xiaoyan|Rose|Will|Skip|Poe|Jynx|Howard|Banker|Matt} <>
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
    -> player_win
  - player_attack == rock and ai_attack == paper:
    Paper wraps around the Rock, makeing it, less of a rock or something.
    You Lose.
    -> player_lose
  - player_attack == paper and ai_attack != scissors:
    Paper wraps and binds, You Win!
    -> player_win
  - player_attack == paper and ai_attack == scissors:
    Scissors shred the Paper into tiny pieces.
    You Lose.
    -> player_lose
  - player_attack == scissors and ai_attack != rock:
    Scissors cut and shred everything in their path, You Win!
    -> player_win
  - player_attack == scissors and ai_attack == rock:
    Rock smashes scissors into scrap metal.
    You Lose.
    -> player_lose
}
->->

== gameover ==
~ temp total_turns = TURNS_SINCE(-> start)
You lasted {total_turns} rounds.
You walked away with ${fame}.
{ fame > 0:
    You averaged ${total_turns/fame} per round.
}
-> DONE

== player_win ==
~ fame++
->->

== player_lose ==
~ fame--
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
