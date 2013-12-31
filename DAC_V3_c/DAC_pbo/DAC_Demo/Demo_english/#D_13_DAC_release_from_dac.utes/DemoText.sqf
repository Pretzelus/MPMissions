if(time < 2) then
{
waituntil{time > 1};

_text = format["
[Removing DAC-groups out of the DAC System]
\n\nThis Demonstration will show you how to release all Groups out of a DAC zone just by usng a single ""click"".
\n\nThis function was created to e.g. hand over ""released"" DAC-groups to another AI system.
\n\nOf course it is possible to reintegrate released DAC-groups again into the DAC-System.
\n\nWait a short while until DAC has been initiated ...
"];
"DAC V3.0 Demonstration - Part 13" hintC [_text];

sleep 1;
hintsilent "";
waituntil {(DAC_Basic_Value > 0)};
sleep 1;

_text = format["
[Removing DAC-groups out of the DAC System]
\n\nYou can see a master zone right on the map where some DAC-groups have been generated, below there is a waypoint zone located, which we also need for this Demo as well.
\n\nTo release now all DAC groups of the master zone out of the DAC System, just left click on any unit in the zone.
\n\nThe released groups will hold their positions a short while later because they dont have any Waypoints anymore. All DAC Features as there are ""Reduction, repawn, erasing, behaviour etc."" has been deleted as well.
\n\nIf you would like to reintegrate the Groups into the DAC System again, left click again on a single unit.
\n\nInformation: If a reduced group will be released, the group will rebuilt completely again befor she is leaving the DAC system.
"];
"DAC V3.0 Demonstration - Part 13" hintC [_text];

sleep 0.05;
hint "Advanced Information available";
player sidechat "Advanced Information available";
dHint = player addaction ["Advanced Information","DemoText.sqf",[1]];
}
else
{
_text = format["
[Removing DAC-groups out of the DAC System]
\n\nThere is an optional posibility to assign a few waypoints to the released groups.
\n\nThats an advantage if the user wants to keep the groups moving, although these groups are no more a part of the DAC system
(A simple move script is still running then).
\n\nTo use this function in this Demo, just keep the shift key pressed, while releasing the DAC-groups out of the System.
\n\nThen you can observe the groups moving to their waypoint zone.
"];
"DAC V3.0 Demonstration - Part 13" hintC [_text];
player removeAction dHint;
};






























