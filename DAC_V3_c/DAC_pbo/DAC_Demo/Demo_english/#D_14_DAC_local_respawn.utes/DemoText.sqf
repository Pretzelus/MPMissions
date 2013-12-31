if(time < 2) then
{
waituntil{time > 1};

_text = format["
[local DAC-respawn]
\n\nThe DAC-respawn is a main part of the DAC system.
\nIt re-generates killed groups after a while.
\n\nThere is a special thing about it. ""New"" groups will automaticly addapt the waypoints of the previous group. That will throw the group into the fight again, soon.
\n\nIn order to have a working respawn, you need at least one DAC-camp on the according side.
\n\nAs a limitation only the following three basic categories can be respawned:
\n\n[ Infantery, wheeled vehicles, tracked vehicles ]
\n\nThere are a lot of options that will not be covered here, but I want you to go trough the three diffrent variants of the DAC-respawn: [local, global, exact] ...
"];
"DAC V3.0 Demonstration - Part 14" hintC [_text];
 
sleep 0.5;
 
_text = format["
[local DAC-respawn]
\n\nLets start with the local respawn:
\n\nAs mentioned before there has to be at least one DAC-camp in order to have a working respawn. =)
\n\nIf the respawn is defined as ""local"", groups can only be respawnd, in whose master zone there is a DAC-camp.
\n\nIf there is no DAC-camp in the zone, it is impossible to generate new groups.
\n\nTo demonstrate the local respawn, I have placed two zones. The zone in the south has a DAC-camp, the zone in the north has none.
\n\nWait until DAC has generated the zones ...
"];
"DAC V3.0 Demonstration - Part 14" hintC [_text];
 
sleep 1;
hintsilent "";
waituntil {(DAC_Basic_Value > 0)};
sleep 3;

_text = format["
[local DAC-respawn]
\n\nIf you open the map, you can see the two zones and the DAC-camp. In addition to that you can see how much respawns are available at the given camp.
\nIn order to trigger a respawn, you have to kill one group now. =)
\n\nIn this demonstration it's quiet easy. Just click on any unit of a group to eliminate the whole group.
\n\nIf you do that to a group in the upper zone, nothing happens. DAC can't respawn the group, because it has no DAC-camp available for this zone, and will delete the dead units after a while.
\n\nIf you eliminate a group from the zone at the bottom, DAC will create a new group with the waypoints of the previous group after a short period of time.
"];
"DAC V3.0 Demonstration - Part 14" hintC [_text];

sleep 0.05;
hint "Additional information avaible";
player sidechat "Additional information avaible";
dHint = player addaction ["Additional info","DemoText.sqf",[1]];
}
else
{
_text = format["
[local DAC-respawn]
\n\nPlease note: If a group has fallen under a certain strengh, they will join another group that is near by. If that is the case, DAC will act like the group was killed and create a new one.
\n\nThere are two numbers you can see at a DAC-camp. Those shows you the avaible respawns of this camp and the number of respawns that are in the respawn process.
\n\nIf there are no respawns left at the camp, the guarding group will left the camp and gather up with the nearest group.
\n\nHint: If a new group is created it will not be exactly like the old one. The group will differ, but it will have the same waypoints.
"];
"DAC V3.0 Demonstration - Teil 14" hintC [_text];
player removeAction dHint;
};