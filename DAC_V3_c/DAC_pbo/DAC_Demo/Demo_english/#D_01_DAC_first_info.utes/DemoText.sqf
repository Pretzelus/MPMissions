waituntil{time > 1};

_text = format["
[First steps]
\n\nWelcome to the demonstration of DAC V3.0 for Arma II.
\n\nThis demonstration is seperated into multiple parts, which should be started in order. 
\n\nThe tutorial only shows the most important aspects of DAC. The details and other features, which are not mentioned in this demonstration, are written down in the Readme file.
\n\nNote: The difficulty setting for this demonstration should be set to ""Veteran"" mode. Otherwise, DAC markers could cause visual conflicts with the ArmA markers.
\n\nOk, Have fun!
"];
"DAC V3.0 Demonstration - Part 1" hintC [_text];

sleep 1;

_text = format["
[First steps]
\n\nBefore we start, i want to explain you what DAC actually does.
\n\nDAC creates units within so-called DAC-Zones.
\nThe creation, movement and behaviour of units
\nis totally dynamic.
\n\nA DAC-Zone is a simple Trigger, which you can place in the editor (F3-key). The shape and radius of the trigger resembles the size of the DAC-Zone.
\n\nA DAC-Zone is initialized by calling a script in the On-Activation field of the trigger. This will also determine the side of the DAC-Zone and how much groups will be created etc.
"];
"DAC V3.0 Demonstration - Part 1" hintC [_text];

sleep 1;

_text = format["
[First steps]
\n\nIn this first demo part I will show you, how the zones can be distinguished in their size and color.
\nJust to let you understand this better. 
\n\nOk, once you close this hint, DAC will proceed to build up the different zones.
\n\nYou can open the map in order to see the zones...
\n\nA hint will appear after DAC is finished with the Initialization.
"];
"DAC V3.0 Demonstration - Part 1" hintC [_text];
sleep 0.05;
hintsilent "";
waituntil {(DAC_Basic_Value > 0)};

sleep 5;

_text = format["
[First steps]
\n\nOpen the map and you'll see 4 DAC-Zones to the north. The colors indicate the side of a Zone:
\n[East, Civilian, Resistance and West].
\n\nYou can see the different shapes of a DAC zone at the center [Rectangle, circle, ellipse, polygon].
\n\nThere is also a deactivated zone [grey] and two waypoint-zones [multicolored] to the south. I will explain them in depth later on.
"];
"DAC V3.0 Demonstration - Part 1" hintC [_text];

sleep 1;

hint format["Red=East\nGreen=Civil\nYellow=Resistance\nBlue=West\n\nGrey=deactivated zone\nMulticolored=WP-Zone"];
