if(time < 2) then
{
onMapSingleClick "player setpos _pos";
 
waituntil{time > 1};
 
_text = format["
[Activate/Deactivate of DAC zones]
\n\nThis demo shows you how you can completely deactivate a DAC zone, and how you can activate a deactivated DAC zone again.
\n\nDeactivate signified, that all groups from a certain zone, are deleted. However, the zone is preserved.
\n\nWith the activation, a deactivated zone is completely anew generated again.
\n\nNow wait until the DAC has been initialized ...
"];
"DAC V3.0 Demonstration - Part 9" hintC [_text];
 
sleep 1;
hintsilent "";
waituntil {(DAC_Basic_Value > 0)};
sleep 1;
 
_text = format["
[Activate/Deactivate of DAC zones]
\n\nOk, right in front of you DAC has generated a zone with 4 different unit categories.
\n\nWait a moment, then an action item appears to you, with which you can disable the zone (all units in this zone are deleted then).
\n\nThen you get a new action item, with which you can activate the zone again, etc.
\n\nThe actions "" activate / deactivate "" You can repeat as often you want... try this out now.
"];
"DAC V3.0 Demonstration - Part 9" hintC [_text];
 
sleep 2;
pAction1 = player addaction ["Deactivate zone [z1]","Action.sqf",[2]];
}
else
{
_text = format["
[Activate/Deactivate of DAC zones]
\n\nIn the West, I placed another zone that has been disabled from the very start.
\n\nThe activating / deactivating of this zone is coupled to a trigger, which I have marked on the map with a red marker.
\n\nClick yourself in these trigger to activate this zone, or click outside of the trigger to deactivate the zone again.
\n\n
"];
"DAC V3.0 Demonstration - Part 9" hintC [_text];
player sidechat "Use the single mapclick to set the player to a new position";
};