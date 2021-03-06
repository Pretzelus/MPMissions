
if(time < 2) then
{

waituntil{time > 2};

_text = format["
[Requesting reinforcements *Example*]
\n\nThis mission complies to the prior mission:
\nOpfor units are positioned to the north, while the south is occupied by Blufor. 
\n\nThere are two crucial distinctions:
\nThe enemy does not posses a DAC-Camp, which means that there will be no spawn of Opfor Units. Furthermore, the two main zones are not synced with each other.
\n\nA conflict situation is normaly excluded, since the enemy forces will not leave their zones and make contact with Blufor.
\n\nI will give you ""a bit"" control over your own units now...
"];
"DAC V3.0 Demonstration - Part 20" hintC [_text];

sleep 0.5;

_text = format["
[Requesting reinforcements *Example*]
\n\nThe reinforcement-Request system of the AI, which was showed to you in the last mission, is under the players disposal! 
\n\nThe terms are the same. You will not have influence over how many groups of AI (if at all) will come to your aid. At best, it is the group which is nearest to your position.
\n\nAs a player you have the advantage to define that position yourself within a radius. However, friendly units must be present in the space of a certain range.
\n\nAlright, please wait until DAC is finished with the Initialization... 
"];
"DAC V3.0 Demonstration - Part 20" hintC [_text];

sleep 1;
hintsilent "";
waituntil {(DAC_Basic_Value > 0)};
sleep 1;

_text = format["
[Requesting reinforcements *Example*]
\n\nThis Area, in which you can request nearby groups to your aid, is shown to you via a marker on the map. To request reinforcements to a certain position within this marker, simply do this by clicking on the map with your left mouse button. Nearby groups will advance to that position (maybe).
\n\nYou can move to the north until the hostile area is within your ""reinforcements"" marker in order to send in friendly units to attack the enemy.
\n\nPlease note, that not all requests will call in reinforcements automatically. The hint box will show you how many friendly groups received your call.  
\n\nThere is a possibilty, that a group will answer your request and be on their way, but abort their movement due to an enemy contact for example.
"];
"DAC V3.0 Demonstration - Part 20" hintC [_text];

sleep 0.05;
hint "More Information available";
player sidechat "More Information available";
dHint = player addaction ["More Information","DemoText.sqf",[1]];
}
else
{
_text = format["
[Requesting reinforcements *Example*]
\n\nIf the reinforcements arrive at the target position
\n(the group may not arrive spot-on, since it depends on the skill level of the leader) and has no contact with the enemy, they will perform a patrol around this area.  
\n\nThe reinforcements will return to their original waypoints afterwards. This behaviour does not count for heavy assets. They will return immediately.
\n\nPlease note: The reinforcement-request does not react instantly. There is no distinction between you calling reinforcements or the AI. You will have to wait as long as the AI would ;-)
\n\nAlso, you will have to wait a few seconds between every reinforcements-request.
"];
"DAC V3.0 Demonstration - Part 20" hintC [_text];
player removeAction dHint;
};