if(time < 2) then
{
waituntil{time > 1};

_text = format["
[User defined Waypoints]
\n\nThis examples presents a possibilty for user defined waypoints.
\n\nYou can predefine custom wayppoints by creating them outside of a zone.
\n\nThese waypoints have no meaning at first. But as soon as a DAC zone gets switched and reaches these waypoints they get activated.
\n\nSo you are able to predefine Waypoints, in case a zone shall be placed there.
\n\nInfo:
\nDAC will allways consider predefined waypoints at first, and fill the rest with generated waypoints.
"];
"DAC V3.0 Example Mission - Part 25" hintC [_text];

sleep 0.5;

_text = format["
[User defined Waypoints]
\n\nWhen you open the map, you will notice some marker, where user defined waypoints are located.
\n\nMove a zone by a single left click to any position. If you click at one of the marker, you will note that DAC use the user defined waypoints.
\n\nIf you click to another position random waypoints will be generated.
\n\nAt marker ""Pos_4"" are less user defined waypoints than on other positions. So Dac will fill the rest with generated waypoints.
\n\nEnough talking ... wait for DAC to be done, and check out yourself.
"];
"DAC V3.0 Example Mission - Part 25" hintC [_text];

sleep 1;
hintsilent "";
waituntil {(DAC_Basic_Value > 0)};

sleep 1;
hint "Additional Info available";
player sidechat "Additional Info available";
dHint = player addaction ["Additional Info","DemoText.sqf",[1]];
}
else
{
_text = format["
[User defined Waypoints]
\n\nYou probably noticed at ""Pos_5"" no user defined waypoints are read, although they exist.
\n\nSimple reason: it is possible to adress user defined waypoints to a certain zone. 
\n\nThe waypoints from ""Pos_5"" are adressed to zone ""z2"".
\nAs this zone is not available, so the waypoints wont be considerated by zone ""z1"".
\n\nGot it? Great ... carry on :-)
"];
"DAC V3.0 Example Mission - Part 25" hintC [_text];
player removeAction dHint;
player sidechat "A single left click moves the zone to that position."; 
};









