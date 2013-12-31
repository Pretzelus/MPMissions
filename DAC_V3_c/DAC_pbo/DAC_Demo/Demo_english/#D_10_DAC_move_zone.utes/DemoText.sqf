if(time < 2) then
{
waituntil{time > 1};

_text = format["
[Moving DAC Zones]
\n\nThis demo is about how to move a DAC zone while the mission is running.
\n\nIf a zone gets moved to a new poistion, DAC generates new waypoints to that zone and all affected groups are informed of this change.
\n\nIn principle a kind of ""global troop movement"".
\n\nWait until the initialisation is finished ...
"];
"DAC V3.0 Demonstration - Part 10" hintC [_text];

sleep 1;
hintsilent "";
waituntil {(DAC_Basic_Value > 0)};
sleep 1;

_text = format["
[Moving DAC Zones]
\n\nOpen the map and notice the DAC zone has generated. 
\n\nClick somewhere into the map to move the zone to the desired position. As DAC-Markers are enabled you can notice new generated waypoints at your desired position.
\n\nAs soon as this process finished the affected groups will report their new waypoints.
\n(It takes a moment until the groups noticed the change)
\n\nRepeat the process in clicking a new position on the map.
\n\nPlease note the additional Info !!!
"];
"DAC V3.0 Demonstration - Part 10" hintC [_text];

sleep 0.05;
hint "additional Info available";
player sidechat "additional Info available";
dHint = player addaction ["additional Info","DemoText.sqf",[1]];
}
else
{
_text = format["
[Moving DAC Zones]
\n\nMoving a zone can be well combined with ""enable/disable"" of a zone. Try the following:
\n\n- Click into the zones center to disable it.
\n\n- Wait until all units are deleted.
\n\n- Click the zone to a new position,
\n  thereby new waypoints can be generated.
\n\n- Concluding another click to the zones center
\n  to enable it again.
\n\nThats it ;-)
"];
"DAC V3.0 Demonstration - Part 10" hintC [_text];
player removeAction dHint;
player sidechat "Use the single mapclick to set the player to an new position"; 
};