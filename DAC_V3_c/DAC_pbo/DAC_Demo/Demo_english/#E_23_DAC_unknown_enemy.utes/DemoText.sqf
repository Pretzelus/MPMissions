if(time < 2) then
{
waituntil{time > 1};

_text = format["
[Unknown Enemy]
\n\nAwhile the demo all DAC marker were enabled to provide all available information. Intentionally DAC marker are created to help mission designers playing Big Brother.
\n\nYou will always know what got where generated and follow the process of AIs routing etc.
\n\nIn a final mission all DAC marker should be disabled for fun sake.
\n\nThat ´s what we will do right now ... we start a mission on DAC marker disabled.
"];
"DAC V3.0 Examnple mission - Part 23" hintC [_text];

sleep 0.5;
//hintsilent "";
//waituntil {(DAC_Basic_Value > 0)};
//sleep 1;

_text = format["
[Unknown Enemy]
\n\nYou can choose 4 skill levels, linked to the group count, DAC will generate.
\n\nThis is just an example how to do it.
\n\nAfter you chose a skill level, DAC starts to initialize. 
\n\nStrange feeling, not kowing what gets generated and what not. Each start is an absolut new mission ;-).
\n\nIt is up to you now ...
"];
"DAC V3.0 Examnple mission - Part 23" hintC [_text];

sleep 1;
hintsilent "";
Demo_Act_1 = player addaction ["mission level 1","Action.sqf",[1]];
Demo_Act_2 = player addaction ["mission level 2","Action.sqf",[2]];
Demo_Act_3 = player addaction ["mission level 3","Action.sqf",[3]];
Demo_Act_4 = player addaction ["mission level 4","Action.sqf",[4]];
sleep 1;
waituntil {(DAC_Basic_Value > 0)};
sleep 1;
{player removeAction _x}foreach [Demo_Act_1,Demo_Act_2,Demo_Act_3,Demo_Act_4];

_text = format["
[Unknown Enemy]
\n\nThis is the plan for your mission:
\n\nYou are all alone at the beginning. First target is to reach the hangar at the airport. New west units will then be unlocked and start in the north of the island to move into the south.
\n\nThis troop movements will probably lead to some combat action, distracting the enemy. Use that advantage to break out.
\n\nThere is a boat, to reach the green circle marker in the very north. Mission will then be accomplished.
\n\nPlease take note of the additional info ...
"];
"DAC V3.0 Examnple mission - Part 23" hintC [_text];

sleep 1;
hint "Additional Info available";
player sidechat "Additional Info available";
dHint = player addaction ["Additional Info","DemoText.sqf",[1]];
}
else
{
_text = format["
[Unknown Enemy]
\n\nI created some ""Hot Spots"" , indicated by blue circled marker.
\n\nAs soon as you reach one of that ""Hot Spot"" DAC marker will be enabled and u can see the enemy on the map.
\n\nThis info should help you to find an appropiate route to the hangar. As soon as you leave the  ""Hot Spot"" the marker will be disabled again.
\n\nNear the ""Hot Spots"" are some ammo crates and a medic tent.
\n\nRock´n´Roll !
"];
"DAC V3.0 Examnple mission - Part 23" hintC [_text];
player removeAction dHint;
};