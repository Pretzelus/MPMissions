if(time < 2) then
{
onMapSingleClick "player setpos _pos";

waituntil{time > 1};

_text = format["
[Custom Waypoints]
\n\nThis small demo presents the use of custom wayoints to determine locations for DAC camps and helicopters. 
\n\nCharacteristically these DAC categories are sometimes a bit tricky in certain areas as the object count must be very low and the terrain flat.
"];
"DAC V3.0 Demonstration - Part 8" hintC [_text];

sleep 1;
hintsilent "";
waituntil {(DAC_Basic_Value > 0)};
sleep 1;

_text = format["
[Custom Waypoints]
\n\nAs u notice the helicopter locations are positioned at the airfield. The locations for the 3 camps are located at suitable positions.
\n\nBy left click on the map u will have a detailled look on that locations ;-)
\n\nThat´s all for now..
"];
"DAC V3.0 Demonstration - Part 8" hintC [_text];

sleep 0.05;
hint "no more info available";
player sidechat "no more info available";
};