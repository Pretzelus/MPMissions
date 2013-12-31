DAC_Zone = compile preprocessFile "DAC\Scripts\DAC_Init_Zone.sqf";
DAC_Objects	= compile preprocessFile "DAC\Scripts\DAC_Create_Objects.sqf";
if(!isServer) then {waitUntil{!isNull player}};
execVM "DAC\DAC_Config_Creator.sqf";

//waitUntil { MRU_DacReady };

waituntil{time > 1};

movedWpMarkerList = [];

_text = format["
[DAC_quick_custom_points_moving_zone]
\n\nThe previous demo covered the basic principles of using quick alternative custom waypoints. This mission, in contrast, shows a practical, dynamic, real world example.
\n\nOn the map, you will see a network of custom points of various types placed throughout the island. A single DAC zone will generate, and will begin using some custom points from each type, but only those that exist inside the zone.
\n\nThree user-operations are possible this demo:
\n\n1. Left-click anywhere on the map to relocate the zone with moderate custom point replacement
\n2. Shift-left-click to relocate the zone with complete custom point replacement.
\n3. Alt-left-click to activate/deactivate the zone.
\n\n(Note - It is also possible to delete all custom WP markers with Shift-Alt-left-click, and then observe that the custom locations are still being used.)
"];
"DAC V3.0 Demo - Part 27 (by MadRussian)" hintC [_text];

sleep 0.75;

_text = format["
[DAC_quick_custom_points_moving_zone]
\n\nImportant notes:
\n\n1. Observe that each point is placed independently of any zone. Thus, custom points are easier and quicker to place than ever before. This entire set of hundreds of points took about 10 minutes.
\n\n2. In addition to the YELLOW and RED points (for wheeled and tracked vehicles), note the special ORANGE points. These apply to both wheeled and tracked vehicles. (Mostly you won't need yellow, as tanks can go pretty much anywhere that wheeled vehicles can.)
\n\n3. Observe that custom replacement scales according to the number of custom points of each type detected within the zone at various locations.  This custom point ""usage"" is adjustable via command.
\n\nbtw- The benefits noted in the previous demo apply here as well. ;-)
"];
"DAC V3.0 Demo - Part 27 (by MadRussian)" hintC [_text];

sleep 1;

hintSilent "";

_locs = ["ptS", "ptV", "ptT", "ptB", "ptA", "PtC", 1000, false] call DAC_fReadAllCustomPoints;

onMapSingleClick "_fun = [_pos,_shift] execVM ""Action.sqf""";

waituntil {(DAC_Basic_Value == 1)};
sleep 3;

_usageS = 0.25 + 0.25*(random 1);
_usageV = 0.25 + 0.25*(random 1);
_usageT = 0.25 + 0.25*(random 1);
_usageA = 0.25 + 0.25*(random 1);
_usageC = 0.25 + 0.25*(random 1);
_capS = [4,5,6] select (floor(random 3));
_capV = [4,5,6] select (floor(random 3));
_capT = [4,5,6] select (floor(random 3));
_capA = [4,5,6] select (floor(random 3));
_capC = [4,5,6] select (floor(random 3));
_result = [z1, [_usageS, _capS], [_usageV, _capV], [_usageT, _capT], [_usageA, _capA], [_usageC, _capC]] call DAC_fApplyPointsWithinZone;

_report = _result select 0;
_appliedPosList = _result select 1;

hint format ["Custom points applied!\n\nDetails: %1", _report];
//hint format ["_appliedPosList: %1", _appliedPosList];
{
	deleteMarker _x;
} foreach movedWpMarkerList;
_i = 0;
{
	_pos = _x;
	_markName = format ["Highlight_%1", _i];
	_marker = createMarker [_markName, _pos];
	_markName setMarkerShape "ICON";
	_markName setMarkerType  "mil_circle";
	_markName setMarkerSize [0.55, 0.55];
	//_ptLoc = (nearestLocations [_pos, ["DAC_Point_Soldier","DAC_Point_Vehicle","DAC_Point_Tank","DAC_Point_Air","DAC_Point_Camp"], 1]) select 0;
	_ptLoc = (nearestLocations [_pos, ["Name"], 1]) select 0;
	//_color = switch (type _ptLoc) do {
	_color = switch (_ptLoc getVariable "DAC_Type") do {
		case "DAC_Point_Soldier": {"ColorBlue"};
		case "DAC_Point_Vehicle": {"ColorYellow"};
		case "DAC_Point_Tank": {"ColorRed"};
		case "DAC_Point_Air": {"ColorGreen"};
		default {"ColorBlack"};
	};
	_markName setMarkerColor _color;
	movedWpMarkerList = movedWpMarkerList + [_markName];
	_i = _i + 1;
} foreach _appliedPosList;

sleep 1;

[z1] call DAC_Activate;




