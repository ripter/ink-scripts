VAR living_sheep = 5
VAR dead_sheep = 0
VAR cash = 0
LIST inventory = pastry, cheese

- (homestead)
  "I need you to deliver these {living_sheep} sheep to the docks. I'm trying to setup an overseas trading partner, so don't screw this up!" You father bellows.
  He hands you {living_sheep} long leashes, each ending in a sheep.
  "Stay on the road" He warns as he hands over the sheep.
  + [Head out with the sheep] -> north1

== north1
  As you leave the farm, you get an amazing view of the city below. You can see ships moving slowly in the bay and even some wagons along the road.
  The road to the city is long, winding down the steep hill. You often climb down the side of the hill, It's steep, but still walkable. You aren't sure, but you think you can recall someone telling you that sheep are good at climbing steep slopes.
  + [Take the road into the city]
    You decide not to risk the shortcut. Your dad was very serious about this delivery.
    -> north2
  + [Take the shortcut into the city] -> east_shortcut


== north2
  An hour and half later you reach the cobble stone road that leads into the city. There is a large patch of grass next to the road.
  The sheep are bleeting loudly and trying to pull you to the grass.
  + [Continue to the city] -> east1
  + [Let the sheep graze in the grass] -> graze_sheep
  <- go_back(->north1)

== east1
  The cobble stone road turns into paved road and the number of horses and carrages greatly increase as you walk twords the city gates.
  As you approach, an elder woman calls to you, pointing at your sheep.
  + [Head into the city.]
    -> east2
  + [Stop and greet the old woman]
    -> old_woman
  <- go_back(-> north2)

== east2
  As you pass though the market, the smell of fresh bread covered in fried butter and suger fills your senses.
  - (market)
  * {cash >= 1} [Buy a butter pastry.]
    You buy a pastry for $1 and add it to your bag.
    ~ cash -= 1
    ~ inventory += pastry
    -> market
  * {cash >= 5} [Buy a cheese slice.]
    You buy a cheese slice for $5 and add it to your bag.
    ~ cash -= 5
    ~ inventory += cheese
    -> market
  + [Head South] -> south1
  <- go_back(-> east1)

== south1
  As you make your way though the lower city, you can feel eyes watching you from the shadows.
  {
    - cash > 0 and living_sheep > 1:
      -> need_permit
  }
  + [Make haste to the docks!] You pull a little bit harder in an effort to make them move quicker.
    -> docks
  <- go_back(-> east2)

== docks
  ~ temp payment = living_sheep
  As soon as you enter the Docks the Captian comes out to greet you.
    "Ah, thanks for the delivery."
  {
    - dead_sheep == 0:
      I'm impressed you made it here without losing any sheep.
      ~ payment = payment * 2
    - else:
      There seems to be a few missing. Well I guess you did your best.
  }
  ~ cash += payment
  He hands you ${payment} as payment.
  + [Go Home]
    -> gameover

== east_shortcut
  About half way down the hill, several of the sheep refuse to continue moving. You could just yank on the leash, forcing them down. Or you could let the leashes go; letting the sheep make it down at their own pace.
  + [Yank on the leashes, pulling the sheep along.]
    The sheep resist your pulling, after a good yank the sheep stop resting, causing you to lose your balance. You tumble down the hill, yaking the sheel along with you.
    <- lose_sheep("{~1|2|2|2|3|3}")
  + [Let go of the leashes and heard the sheep down the hill.] As soon as you let go, the sheep bolt in all directions. After twenty minutes chashing them around the hill, you manage to reach the bottom.
    <- lose_sheep("{~0|1|1|1|2}")

  - When you reach the bottom, you count {living_sheep} sheep still with you.
  + [Enter the docks] -> docks


== graze_sheep
  You let the sheep off the leashes and they spread out to eat grass.
  After some time, you hear a commotion and what looks like a group of men on horseback comming from the city. They are riding very fast and yelling a lot. You can't make out any of the words.
  + [Wait for the travlers to pass]
    As the travlers aproach, they take a look at you and your sheep. They smile wide and shoot a few arrows at your sheep as they pass. The City Guard quick on their tail.
    <- lose_sheep("{~1|2|2|3|3}")
  + [Hide in the bushes while the travelers pass.]
    As the riders near, you can see the City Guard chasing them. Arrows flying back and forth wildly.
    <- lose_sheep("{~0|0|1|1|1|3}")

  - With the action over, you gather the {living_sheep} sheep and head down the road. -> east1


== old_woman
  She mumbles something, but you can not understand her. You are not sure if you would understand her even if you could hear her.
  She points to the sheep, and pulls out a coin bag.
  + [Wave the woman away and continue into the city.]
    -> east2
  + [Sell some sheep to the old woman.]
    You've been in this bussiness long enough that you no longer need words. She wants to buy some sheep.
    ~ temp dead = dead_sheep
    <- lose_sheep("{~1|1|2|2|1}")
    ~ temp diff = dead_sheep - dead
    ~ cash += diff * 10
    She picks out {diff} sheep and hands you ${diff * 15}
    You thank her and into the city.
    -> east2


== need_permit
  A city guard steps out in front of you; In the corner of your eye, can see more men moving in the shadows.
  "Do you have a permit to transfer all this lifestock into the city?
  * ["What are you talking about? There is no permit."]
    Several men jump you, punching and kicking until you are laying on the ground.
      ~ cash = 0
      <- lose_sheep("{~0|0|1|2|2|2}")
      After several agonizing minutes, you are able to get back up. You still have {living_sheep} sheep left. But the thugs took all of your money.
      You limp your way to the docks.
  * {inventory ? cheese} [I think I left my permit in this cheese slice.]
    The man looks at you for a moment, then at the cheese. In the blink of an eye the cheese is gone.
    "Have a good day sir" The man says as he steps aside.
    You and your sheep make haste to the docks.
  -
  -> docks


== gameover
  It's dark out by the time you make it home. When you enter the house, your Father greats you warmly as your mother fills a bowl with soup for you.
  {
    - cash <= 5:
      You father shakes his head. "With only ${cash} we can't afford this new trade deal."
    - cash <= 10:
      You father pats you on the back. "${cash} isn't to bad, if we can figure out a way to cut some corners, we might yet make this deal work."
    - cash > 10:
      You father stares blankly at the money on the table. "Amazing, just amzing. Clearly I've underestamated you son." He gives you a big hug. With ${cash} we can finally aford your sisters surgery.
  }
  -> DONE

== go_back(-> to)
  + [Go Back] -> to
  ->->

== lose_sheep(lost)
  ~ temp dead = 0
  {
    - lost == 1:
      ~ dead = 1
    - lost == 2:
      ~ dead = 2
    - lost == 3:
      ~ dead = 3
  }
  ~ living_sheep -= dead
  ~ dead_sheep += dead
  -> DONE
