waituntil{time > 1};

_text = format["
Mixed DAC-groups
\n\nThis little example presents how to generate mixed groups. The group consists of at least one vehicle and a few infantry units, that move around their waypoints.
\n\nInfantry and tracked vehicles is the only option in this DAC version. An infantry group becomes also mixed if they find an empty vehicle.
\n\nWait until DAC finished generating, then check as it looks like.
\n\nHint: The speed of infantry and vehicle is not always optimal and in villages problems could occur.
"];
"DAC V3.0 Example mission - Part 29" hintC [_text];
player sidechat "A single mapclick will port your player unit to each desired position."; 