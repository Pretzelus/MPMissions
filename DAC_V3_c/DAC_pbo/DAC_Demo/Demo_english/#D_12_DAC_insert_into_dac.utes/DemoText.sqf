if(time < 2) then
{
waituntil{time > 1};

_text = format["
[Integrate Editor-Groups in the DAC System]
\n\nI will show you now how to integrate Editor-placed Groups into the DAC System, respective to remove
integrated groups again.
\n\nWait until DAC has been initialised and open the Map then...
"];
"DAC V3.0 Demonstration - Part 12" hintC [_text];

sleep 1;
hintsilent "";
waituntil {(DAC_Basic_Value > 0)};
sleep 5;

_text = format["
[Integrate Editor-Groups in the DAC System]
\n\nOK, you see now a DAC Zone, where some DAC Groups are moving in. Above of this Zone, you see also an Editor-placed Group, which I assigned some Waypoints to.
\n\nBelow of this DAC Zone a Editor-placed Group is located as well, but without Waypoints.
\n\nTo integrate one of these two Groups into the DAC System, left mouseclick on an any unit out of one of the groups.
\n\nA few moments later you should recognize that this group is recieving Waypoints from the DAC Zone. Thus she is integrated into DAC.
\n\nTo release this Group again out of the DAC System, left click again a further time on any unit of the Group. The Group will recieve then again its Editor placed Waypoints, or return to its start position.
"];
"DAC V3.0 Demonstration - Part 12" hintC [_text];

sleep 0.05;
hint "Further Information available";
player sidechat "Further Information available";
dHint = player addaction ["Further Information","DemoText.sqf",[1]];
}
else
{
_text = format["
[Integrate Editor-Groups in the DAC System]
\n\nYou can integrate/release an Editor-Group
\nas often you want :-)
\n\nImportant Hint:
\nThere is a restriction about the integrated Editor-Groups.
\nIf such a group will be destroyed, it cant get respawned again by a DAC-Camp.
\n\nWith other words:
\nIf the Group is ""down"", so she stay permenantly.
"];
"DAC V3.0 Demonstration - Part 12" hintC [_text];
player removeAction dHint;
};



































