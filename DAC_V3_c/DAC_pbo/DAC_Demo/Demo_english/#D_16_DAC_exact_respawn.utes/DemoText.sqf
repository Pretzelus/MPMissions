if(time < 2) then
{
waituntil{time > 1};

_text = format["
[exact DAC-Respawn]
\n\nThe last variety of the Respawn System
\nis the ""exact"" DAC-Respawn.
\n\nI call it exact, because you can directly determine which DAC Camps are resposible for which zones.
\nNot everything have to be on random ;-)
\n\nAs DAC determines by random which one of multiple camps will generate and spawn new groups, a group can spawn far away off misson center or misson action. 
\n\nThis fact can be restricted by the exact Respawn.
\n\nAs u will notice this demo is representing 4 master zones with units, and 2 master zones with camps...
"];
"DAC V3.0 Demonstration - Part 16" hintC [_text];

sleep 1;
hintsilent "";
waituntil {(DAC_Basic_Value > 0)};
sleep 1;

_text = format["
[exact DAC-Respawn]
\n\nI guess you already opened the map ;-)
\nNotice the zones as advised.
\n\nThe northern camp is linked to the northern master zones, the southern camp to the southern master zones.
\n\nAccording, no southern units will spawn in the north.
\n\nThe principle and advantage of this variety of DAC Respawn should supposely be clear.
\n\nWell, same buisiness as with remaining respawn demos:
\nLeft click on any unit to destroy the whole group ;-)
"];
"DAC V3.0 Demonstration - Part 16" hintC [_text];

sleep 0.05;
hint "Additional info available";
player sidechat "Additional info available";
dHint = player addaction ["Additional Info","DemoText.sqf",[1]];
}
else
{
_text = format["
[exact DAC-Respawn]
\n\nAs basic principle, a DAC Camp is responsible always for its own zone, no matter which kind of respawn.
\n\nCheck the ReadMe for how to match the camp and much more details that I can not be bothered in this demo.
\n\nAfter all, a DAC camp is even a requirement for the
\nDAC Arty, which can be used by player and AI ;-)
"];
"DAC V3.0 Demonstration - Part 16" hintC [_text];
player removeAction dHint;
};