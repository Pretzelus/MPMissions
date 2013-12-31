if(time < 2) then
{

waituntil{time > 2};

_text = format["
[Request Artillery support *Example*]
\n\nThis Demo will show you how to request for Artillery support as a Player, cause until now AI units were enabled for only.
\n\nPlease keep in mind, that the DAC-Arti is a ""just for fun feature"". The Range e.g. is not really realistic and even balistics
are not calculated as well.
\nIf you feel bothered with this so I recommend to hit the ESC key now and leave this Demo part, if not so have much fun ;).
\n\nThe situation as follows: A West-Zone with 2 DAC camps will be generated in southeastern direction. These Camps will all togehther providing 8 static Arti Positions.
\n\nFar more in south eastern direction, there are 4 further mobile Arti-units, which are playing an important role in this Demo.
"];
"DAC V3.0 Demonstration - Part 21" hintC [_text];

sleep 0.5;

_text = format["
[Request Artillery support *Example*]
\n\nAn enemy Zone is located in north western direction, where some Infantry-groups are waiting for their orders.
\n\nThere are also 8 Anti Aircraft units located on the Islands near the coastline (red marker dots),
\nwhich you are pleased to destroy.
\n\nThe Problem with this is, even not the static camp based Arti units as well as the mobile Arti units, do have the firerange to take down the AA units. 
\n\nBut if you will let the mobile arti get good positions to fire, so the destruction of the AA units should an easy job ;-).
\n\nHow you can do this will be explained as long the DAC has generated the situation ...
"];
"DAC V3.0 Demonstration - Part 21" hintC [_text];

sleep 1;
hintsilent "";
waituntil {(DAC_Basic_Value > 0)};
sleep 6;

_text = format["
[Request Artillery support *Example*]
\n\nThe range of each static Arti (the ones located in the camps) will be represented by 2 orange colored circled markers. 
\n\nThe range of the Arti units will cover the lower area of the enemy zone. So you actually can directly cover this area with permanently fire, as long enemy units are spotted there.
\n\nTo request Artillery support keep the left shift key pressed and mark the position of your choice by another single map click on respective position.
\n\nIf your request is apllied, you will notice respective marker on that position. Also the units, which are executing the Fire attack, will recieve a rotating marker as well.
\n\nEach Artillery strike consists out of 1 round with max. 4 shells, but this will only happen if really all 4 Arti units will be prepared to fire.
"];
"DAC V3.0 Demonstration - Part 21" hintC [_text];

sleep 0.5;

_text = format["
[Request Artillery support *Example*]
\n\nTo control the mobile Arti units you have got to select (mark) the Arti units, to make them moving:
\n\nSuch a unit can easily be selected just by singleclick on it (that takes some time). A further left click on the map on disered position will assign a waypoint to the selected unit.
\n\nThe selected unit is covered then with a blue marker. The range of the selected unit will also been displayed.
\n\nTo select another unit just click on it to assign a waypoint to it and so on ...
\n\nTo deselect a unit, just click again on an already selected unit..
"];
"DAC V3.0 Demonstration - Part 21" hintC [_text];

sleep 0.05;
hint "advanced Information available";
player sidechat "advanced Information available";
dHint = player addaction ["advanced Information","DemoText.sqf",[1]];
}
else
{
_text = format["
[Request Artillery support *Example*]
\n\nHint:
\n\nIt is also possible to select the player. That becomes an interesting effect to follow. The player character will be beamed then to the clicked poistion on the map.
\n\nTry it out ...
\n\nIt is always recommended to disable approaching enemy forces with your static Artillery, if your mobile arti units are directly threaten by them.
\n\nInfo: you have 25 possibilities to request Artillery support (*clicks*), to absolve the Mission.
"];
"DAC V3.0 Demonstration - Part 21" hintC [_text];
player removeAction dHint;
};


