if(time < 2) then
{
waituntil{time > 1};

_text = format["
[Dynamic created DAC zones]
\n\nCreating DAC zones during the misison is new and sweeping ;-)
\n\nActually DAC requires at least one zone for initialisation. As for begin of this demo no zone exist (which we want to create) we will use the following DAC parameter:
\nDAC_Direct_Start = true
\n\nThis parameter makes DAC to initialize without a zone.
"];
"DAC V3.0 Demonstration - Part 11" hintC [_text];

sleep 1;
hintsilent "";
waituntil {(DAC_Basic_Value > 0)};
sleep 1;

_text = format["
[Dynamic created DAC zones]
\n\nLets go ...
\n\nOpen the map and do a single mapclick to a position of your choice. DAC will generate a new zone imediately.
\n\nSize, form and rotation of the new zone is created by chance. The zones side (east or west) will change by each new zone.
\n\nThese settings are chosen for this demo, change the settings of your zones individually different if you are up to. 
\n\nWatch the additional infos. !!
"];
"DAC V3.0 Demonstration - Part 11" hintC [_text];

sleep 0.05;
hint "additional Info available";
player sidechat "additional Info available";
dHint = player addaction ["additional Info","DemoText.sqf",[1]];
}
else
{
_text = format["
[Dynamic created DAC zones]
\n\nFor deleting the dynamically generated zones click into the corresponding zones center.
\n\nIf u want to delete all zones by once, click onto the players marker.
\n\nImportant hint:
\n\nPlease note, each zone u generate, either it is initialized at the beginning or awhile your mission, takes system resources. 
\n\nDeactivated or deleted zones increases system resources. 
"];
"DAC V3.0 Demonstration - Part 11" hintC [_text];
player removeAction dHint;
player sidechat "Use the single mapclick to create a new DAC zone"; 
};