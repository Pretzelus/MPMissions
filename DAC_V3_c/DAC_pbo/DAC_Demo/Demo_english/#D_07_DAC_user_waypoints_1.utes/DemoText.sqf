if(time < 2) then
{
onMapSingleClick "player setpos _pos";

waituntil{time > 1};

_text = format["
[Custom Waypoints]
\n\nFor not creating waypoints within a zone by random only, DAC offers custom waypoints means user defined waypoints. This are the waypoint you have chosen.
\n\nI created 2 zones in this demo, to generate 22 waypoints each. The zone downside has exactly 22 custom waypoints, so no further waypoints will be created any more. 
\n\nIn the upper zone, I have built only 11 custom waypoints. DAC has to generate 11 waypoints more to complete the amount of 22 waypoints.
\n\nCustom waypoints are of higher priority, which will be considered by DAC first.
"];
"DAC V3.0 Demonstration - Part 7" hintC [_text];

sleep 1;
hintsilent "";
waituntil {(DAC_Basic_Value > 0)};
sleep 1;

_text = format["
[Custom Waypoints]
\n\nFor custom waypoint use within a zone, place a logic and add as many waypoints as disred to that logic.
\n\nAdd a small entry to the logics init to determine the waypoint ... thats it.
\n\nThis method is actually pretty simple and effectiv :-)
\n\nHint: markers for custom waypoints are non-filled marker, only if the DAC_Marker are enabled of course.
"];
"DAC V3.0 Demonstration - Part 7" hintC [_text];

sleep 0.05;
hint "additional Info available";
player sidechat "additional Info available";
dHint = player addaction ["additional Info","DemoText.sqf",[1]];
}
else
{
_text = format["
[Custom Waypoints]
\n\nImportant note:
\nThe logic and its waypoint must be within the zone !!
\n\nAs the position of custom waypoint is known and do not need to be generated though, the initialisation of DAC decreases. 
\n\nTypical use for custom waypoints is, for example, a mission area with high object counts.
"];
"DAC V3.0 Demonstration - Part 7" hintC [_text];
player removeAction dHint;
player sidechat "An ordinary lmb - left mouse button - click moves your unit on the map."; 
};