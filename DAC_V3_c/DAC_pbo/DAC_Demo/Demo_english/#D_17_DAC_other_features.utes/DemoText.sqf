if(time < 2) then
{
onMapSingleClick "player setpos _pos";

waituntil{time > 1};

_text = format["
[Assigning a logic to a zone + DAC_SavePos]
\n\nThis demo contains 2 features ;-)
\nAt first, assigning a logic to a zone.
\n\nThis step is required if multiple zones overlap or are created into each other, and logics with DAC characteristics are involved.
\n\nIn the south east of the map I created 4 zones that overlap and are created into one another. Each zone has a logic with a certian characteristic:
\n\n- a camp location
\n- userdefined wapoints
\n- 2 zones defined as polygon.
\n\nThe zone constellation will work only, if the logics are linked to their zone:
\n\nNameofLogic setvariable [""Link"", NameofZone]
"];
"DAC V3.0 Demonstration - part 17" hintC [_text];

sleep 0.5;

_text = format["
[Assigning a logik to a zone + DAC_SavePos]
\n\nAnother zone in the north-west is full of DAC generated waypoints (for demo only).
\n\nWithin this zone area I defined 3 postions, in a radius of 100m won´t be any generated waypoints, and also none units though.
\n\nThis defined as follows (example):
\n\nDAC_SaveDistance = [100,[""Logic_1"",""Logic_2"",""Logic_3""]]
\n\n\nNothing more to say here ;-)
"];
"DAC V3.0 Demonstration - part 17" hintC [_text];

sleep 1;
hintsilent "";
};