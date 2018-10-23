VAR player_attack = "none"
VAR ai_attack = "none"
VAR attack_result = "tie"
Welcome to the Rock Paper Scissors challenge!
-> pick_attack

=== main_loop ===
Welcome back! 
  + Play again -> pick_attack
  * Quit -> DONE


=== pick_attack ===
What will you throw?
+ [Rock] You throw Rock. 
    ~ player_attack = "rock"
+ [Paper] You throw Paper.
    ~ player_attack = "paper"
+ [Scissors] You throw Scissors.
    ~ player_attack = "scissors"
-
-> random_attack


=== random_attack ===
{&Chris|Xiaoyan|Rose|Skip|Poe|Jynx|Howard|Banker|Matt} throws <>
{ shuffle:
  - Rock.
    ~ ai_attack = "rock"
  - Paper.
    ~ ai_attack = "paper"
  - Scissors.
    ~ ai_attack = "scissors"
}
-> result

=== result ===
{ 
  - player_attack == ai_attack:
    You tied!
  - player_attack == "rock" and ai_attack != "paper":
    Rock Wins! You Win!
  - player_attack == "rock" and ai_attack == "paper":
    Paper Wins! You Lose!!
  - player_attack == "paper" and ai_attack != "scissors":
    Paper Wins! You Win!
  - player_attack == "paper" and ai_attack == "scissors":
    Scissors Wins! You Lose!
  - player_attack == "scissors" and ai_attack != "rock":
    Scissors Wins! You Win!
  - player_attack == "scissors" and ai_attack == "rock":
    Rock Wins! You Lose!
}
-> main_loop