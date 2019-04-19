# CSC 303 Final Project Proposal: Deep Space Interceptor
## Game Summary
Deep Space Interceptor is a top-down style space shooter similar to games like _Galaga_ or _Iridion
II_. The game is a singleplayer driven experience that has the player fighting off continuous waves of
enemy AI drones and dodging space debris. The game will increase in difficulty by as the player
progresses and will obtain a score based on performance.

## Gameplay Details
The objective of the game is to survive as long as possible against endless waves of AI drones and
space debris. The player will be given a score, starting at 0 points, that will keep track of how
well the player does during gameplay. The game will be infinitely running until the player dies, and
survival time will also be a factor in player's final score. The game will end when the player runs
out of lives and health.

The player will control a small space fighter in the third-person top-down fashion. The space
fighter will be equiped will a minimal weapon system that can be upgraded during gameplay by
obtaining pick-ups. The space fighter will also start with minimal health and no sheilds which can
both be upgraded through pick-ups. A standard three lives will be given at start and can be
increased through pick-ups or through good performance. 

The AI drones and debris in the level are planned to be percedurally generated on to the screen as
the player progresses. One planned feature is to have the enemy drones increase in difficulty. This
could be through how much enemies deal damage to the player, how many enemies spawn on the screen,
and the different types of enemies. It should also be noted that there will also be non-enemy NPCs
that will spawn. Destroying these can have a negative effect on player score. If time permits it,
a cool feature that could be added is boss enemies that can spawn from time to time.

## Controls
Controls will be designed to be simple and easy to learn. By default, the controls to move the
player on screen will be W, A, S, D for UP, LEFT, DOWN, RIGHT directions respectively. The spacebar
will be used to fire the space fighter's main weapon, with some other key that will be used for
optional secondary weapons. 

## Visuals & Sound
The game will feature some simple sprites made from scratch. Since the developer is not an artist,
do not expect anything spectacular. This will most likely be place holder graphics that can later be
swapped with better sprites. One important visual effect worth mentioning is the idea for having a
scrolling background to give the illusion that the space fighter is continuously flying through
space.

It will be important to be able to add sound effects and music to the game if time permits. This
will give the game part of its feeling and may even give the gameplay itself some extra depth. At
the very least, the game will try to implement some sort of place hold effect that could be replaced
at a later time.

## Goals
Here is a list of goals for features the in the game project and will be worked in roughly the same
order as listed. If time permits, optional/extra features will be implemented like some of ones
mentioned above. If there is any features added that are not mentioned in this proposal but somehow
make it into the game, then it will be mentioned in the README. 

+ Visual Game Object (Based on FlxSprite)
+ Player Object extending Visual Game Object
+ NPC Object extending Visual Game Object (Birth of the enemy AI)
+ UI
+ Procedural Spawning
+ Enemy NPC Object extending NPC Object
+ Implement some different versions of Enemy NPCs (As child classes)
+ Title screen/Main menu
+ Extras (If time permits, adding polish to core features and extending functionality)

