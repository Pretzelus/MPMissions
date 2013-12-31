waituntil{time > 1};

_text = format["
[DAC_quick_custom_points]
\n\nThis mission covers a quick and alternative means of choosing and applying custom waypoints.
\n\nAfter closing this hint, you will see four groups of colored custom points on the map.  Four corresponding DAC zones will generate, but won't start out using these points.
\n\nLeft-click near a custom point cloud to replace some of the corresponding zone's waypoints. Shift-left-click to perform the same operation but also delete the markers.
"];
"DAC V3.0 Demo - Part 26 (by MadRussian)" hintC [_text];

sleep 0.75;

_text = format["
[DAC_quick_custom_points]
\n\nImportant notes:
\n\n1. Each custom point cloud was placed in quick succession, via copy-paste of a single marker.  (For example, in the editor, you can create a single marker called ""Custom"", and then copy and paste it quickly and easily to create ""Custom_1"", ""Custom_2"", etc.)
\n\n2. This method smartly ignores any missing marker names (for example if you later delete a handful of markers), so you are free to add and delete them without worry!
\n\n3. In a real mission, you can read in these markers early in your ""init.sqf"", so the player won't see them, not even on the briefing screen. ;-)
"];
"DAC V3.0 Demo - Part 26 (by MadRussian)" hintC [_text];

sleep 1;

hintSilent "";

onMapSingleClick "_fun = [_pos,_shift] execVM ""Action.sqf""";




