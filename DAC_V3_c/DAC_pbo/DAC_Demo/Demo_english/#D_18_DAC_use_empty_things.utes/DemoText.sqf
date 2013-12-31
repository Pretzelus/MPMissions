if(time < 2) then
{
onMapSingleClick "player setpos _pos";

waituntil{time > 1};

_text = format["
[Identify empty objects]
\n\nThe DAC units are more than just ramblers ;-)
\n\nThey find and use empty vehicles and helicopters as long as possible.
\n\nEven empty guns or MG position will be manned.
\n\nFurther more enterable buildings will be checked and occupied.
\n\nThis characteristics belong to infantrie units only.
"];
"DAC V3.0 Demonstration - part 18" hintC [_text];

sleep 1;
hintsilent "";
waituntil {(DAC_Basic_Value > 0)};
sleep 1;

_text = format["
[Identify empty objects]
\n\nNoticably, we have 3 DAC zones, in which each group has to do its own job ;-)
\n\nVehicles in the right zone will probably be manned within moments.
\n\nBuildings inside the center zone, will be occuoied and checked within moments.
\n\nSame belongs to the left zone with its MGs, which will also be manned in a few moments.
\n\nKeep in mind ... singlemapclick and u can beam yourself where ever you want to on the map to follow the action.
"];
"DAC V3.0 Demonstration - part 18" hintC [_text];

sleep 0.05;
hint "Additional info available";
player sidechat "Additional info available";
dHint = player addaction ["Additional Info","DemoText.sqf",[1]];
}
else
{
_text = format["
[Identify empty objects]
\n\nThese DAC features can be enabled and disabled each time or individual customized.
\n\nFurther more each zone can get its own behaviour configuration loaded. That means, DAC features can be adjusted for each zone ""locally"". 
\n\nThere is also a kind of ""blacklist"" for buildings, to make certain buildings non enterable for DAC units.
\n\nAnalogous, there is a ""whitelist"" for vehicles defining usable vehicles types for DAC units.
"];
"DAC V3.0 Demonstration - part 18" hintC [_text];
player removeAction dHint;
player sidechat "A singlemapclick will port your player unit to each desired position."; 
};