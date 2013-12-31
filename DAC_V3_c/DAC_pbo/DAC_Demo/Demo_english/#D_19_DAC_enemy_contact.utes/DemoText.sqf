if(time < 2) then
{
waituntil{time > 1};

_text = format["
[East/West Conflict]
\n\nDAC will generate a simple conflict situation in this demo part.
\n\nTwo master zones for east in the north and two master zones for west in the south.
\n\nBoth sides have two DAC camps to provide units and artillery support.
\n\nBoth zones are linked with each other, a conflict is inevitable, cause each side will try to advance into the enemies zones.
\n\nThis demo uses the parameter ""DAC_Fast_Init"".
\nThis parameter leads at the beginning to minimze the view distance and to maximize the fog.
\n\nThis measure releases CPU power and supports the initialisation process which saves 20-40 percent.
\n(only in singleplayer mode)
"];
"DAC V3.0 Demonstration - part 19" hintC [_text];

sleep 0.5;
//hintsilent "";
//waituntil {(DAC_Basic_Value > 0)};
//sleep 1;

_text = format["
[East/West Conflict]
\n\nYou can not affect this conflict, it develops dynamically, at each mission restart in an other way.
\n\nThe conflict will relax again, when all respawns are expired on each side.
\n\nBecause each group from each side may request reinforcement (only groups that have no specific task will follow such a request), the map will be very dynamicly.
\n\nI activated the DAC system messages for this demo. That means you are always informed about what DAC
\nis doing.
"];
"DAC V3.0 Demonstration - part 19" hintC [_text];

sleep 1;
hintsilent "";
waituntil {(DAC_Basic_Value > 0)};
sleep 0.05;
hint "Additional Info available";
player sidechat "Additional Info available";
dHint = player addaction ["Additional Info","DemoText.sqf",[1]];
}
else
{
_text = format["
[East/West Conflict]
\n\nDAC has several marker settings to be explained:
\n\n[circle marker / black shaded]:
\nArti support in this area (successfully)
\n[circle marker / red shaded]:
\nArti support in this area (unsuccessful)
\n[yellow line marker]:
\nGroup is located in an observation mission
\n[red line marker]:
\nGroup is located in an attack mission
\n[yellow animated line marker]:
\nGroup is located in a support mission
\n[yellow rotated bar marker]:
\nGroup is located in a search mission
\n[blue line marker]:
\nGroup is located in an occupy mission
\n[white line marker]:
\nGroup has lost its leader and has to reorder
\n[black rotated ellipse marker]:
\nGroup makes a patrol in this area
"];
"DAC V3.0 Demonstration - Teil 19" hintC [_text];
player removeAction dHint;
};