# KwirkTas
A tool assisted speedrun of Kwirk for GBC (including notes regarding the run)

The current focus of this TAS is the 99rms "Average" run, although research done here will allow for other aspects of this game to be explored.

Kwirk has a "random" value it reads when preforming any "random" action. This value can be found at 02EC in WRAM. It counts from 0 to 59 and then loops back to 0. This means there is a extrememly finite number of random possiblities.

In Kwirk, the character enters a maze where each room leads onto another room. The current room ID can be found in WRAM at 02BF. A collection of screenshots of the rooms can be found in the notes (note that these screenshots were automatically generated using a script found in the scripts folder of this repo). Valid rooms seem to exist from ID 29 to ID 149. Any room before 29 or after 149 appears glitchy and can cause Kwirk to spawn in strange locations.

For what I've found so far, the "random" value is only ever called when starting in the first room, so that all future rooms are consistent. And because there are only the values 0 through 59 as random values, there are only 60 possible routes Kwirk can take. (note, even though multiple values can result in the same first room, the routes will divert after the first room, so they are not the same.) (the info regarding this can be found in the notes section of this repo in the format [frame]: [random value] -> [room ID] (sometimes with misc info on the end I used for notes)(also note the random value sometimes doesn't change or skips a value, I believe this is down to either lag or just the strange timing on incrementing the randomiser).)

In terms of Kwirk's movement in the stages, Kwirk moves at a speed of 1square/9frames. When Kwirk is navigating a spinner, 2 frames of holding the button are required, and Kwirk moves at 2squares/13frames (however this is more often 2squares/14frames due to lag).

No TASing has been done for the indiviudal levels yet, however my current plan is to make a TAS of each room and write a script to automatically apply the indiviudal level TAS to the full game TAS. Once this is done for all 60 "random" values, it'll simply be a matter of finding which TAS is fastest.

If you have any information or suggestions you would like to pass on, please feel free to contact me through twitter (@CDRomatron), twitch (@CDRomatron) or discord (@CDRomatron#6527).