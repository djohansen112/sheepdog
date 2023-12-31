# Game design document:

## Sheepdog game – 
Subtitiles: “Herdable” “Herd” not sure yet.

### Mechanic:
Player controls a sheepdog that has to encircle a flock of sheep and guide them into gates. Similar idea to the sheepdog trials. As the dog gets closer, the sheep try to get away from them. 
As the play progresses, they can unlock more unruly flocks.
- Start with placid sheep
- next level add rams, these attack the player dog if thee stress level gets to high.
- next level goats – they can climb or something similar?
- next level goats and billy goats – ram the player/
- final level – cats. They can jump over, they go to sleep in spots etc. to ignore the dog. Instead of choosing a path directly away from the dog they might choose a random vector away.

Maybe think of separating types of sheep from each other and ONLY black sheep for some levels etc.

Game is done when all the sheep are in the gate. Gate closes and time based score is calculated.

### Format: 
high camera/isometric. Camera to follow the dog. Similar play style to a roguelike game like archero or pickle pete would be good. Dog follows the mouse click, so if you click in an area, the dog will make their best way to that spot. Alternately you cna control with the arrows or WASD.  

### Components to build

#### Maps/levels.
Thes can be flat, with a single gate. Player starts in the middle, with the flock all around scattere randomly. Once the sheep go through the gate they should bunch up until they are all put away. Higher levels can have obtacles like trees or other gates to get through.

#### UI:
Need a timer, don’t want this to be a run out of time game, just a personal best time.
Need a counter – number of sheep in the gate out of the number total  so the player can track 'lost' sheep.

#### Menu
##### Start new game. 
Unlocks/progress status – show the different unlocks (dogs, upgrades or levels)
##### Level select//Upgrades
The game will be level based. Unlock as per standard progression. Complete a level to unlock the next. 
##### Dog select
Each dog is unique, and the player score is attached to the dog - so the best Labrador time and current unlocked levels with the Labrador may be different to the unlocked levels for the Jack Russell.

#### Components 
<l1> Save feature – should be saving between levels and after each unlock to ensure player progress.</l1>
<l1>
<b>Player dog:</b>
- threat level and radius. 
- speed and movement abilities (run, walk, directions, bark)
- sprite. Sprite should point around depending on the direcion. 

A bark mechanic might be able to add a stress level or points towards so the dog can induce the next behaviour level.</l1> 

<l1>Sheep:
Needs a stress level – the longer the dog is within their threat radius, or the threat radius overlap, the higher the stress. If the sheep are stressed they will run directly awa from the threat. For higher levels, if the stress gets too high then at a threshold they can attack (rams, billygoats etc). For low enough stress the animal goes into grazing animation and stays pretty still.</l1>

Behaviour table:
| NPC type      | Zero stress       | Medium stress     | High stress           | Special       |
|---------------|-------------------|-------------------|-----------------------|---------------|
| Sheep         | Grazing, walk     | Walk, no stopping | Run, no stopping      |  Nil          |
| Rams          | Grazing, walking  | Run, no stopping  | Attack player         |               |
| Goats         | Grazing, walking  | Run, can jump     | Play dead             | Jumping       |
| Billygoats    | Walking           | Run, can jump     | Attack                | Jumping       |
| Cats          | Walking, sleep    | Walk away         | Random sprint/jump    | Sprint/Jump   |

Cat can jump or wander out of gate. Must be barked at to wake up goes back to sleep when stress back to zero. Thin middle section of behaviour before going to high level.

Notes/Ideas:
Maybe look at upgrading the player with scary collars, or possibly new dogs – start with a dachsund family dog and work up to kelpie? 
Not sure if the dogs should be just skins or should have a different stat block for each type.
New maps - maybe obstacles or bigger map/smaller gate?



