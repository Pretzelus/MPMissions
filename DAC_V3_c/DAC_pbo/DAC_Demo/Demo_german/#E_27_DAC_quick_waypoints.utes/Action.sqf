
_pos = _this select 0;
_shift = _this select 1;
_alt = _this select 2;

onMapSingleClick "_fun = [_pos, _shift, _alt] execVM ""Action.sqf""";

if (DAC_Basic_Value == 1) then
{
	if (_shift and _alt) then
	{
		hint "Deleting custom WP markers...";
		_locs = ["ptS", "ptV", "ptT", "ptB", "ptA", "PtC", 1000, true] call DAC_fReadAllCustomPoints;
		hint "Custom WP markers deleted!\n\nBe advised though, custom waypoint swapping will still be in effect, as the markers were read in upon mission startup.";
		breakOut "ExitOut";
	};
	if (_alt) then
	{
		if (z1 in DAC_Inactive_Zones) then
		{		
			[z1] call DAC_Activate;
			hint "Zone activated!\n\nObserve that camp points may be moved while a zone is active, although the camp will not physically relocate until the zone has been subsequently deactivated/reactivated.";
		}
		else
		{
			[z1] call DAC_Deactivate;
			hint "Zone deactivated!";
		};
		breakOut "ExitOut";
	};
	if (surfaceIswater _pos) then
	{
		player groupchat "Please select a position over land...";
	}
	else
	{
		_trigArea = triggerArea z1;
		[z1,_pos,[_trigArea select 0,_trigArea select 1,_trigArea select 2],1,1,0] call DAC_fChangeZone;
		waituntil {(DAC_Basic_Value == 1)};
		
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
		
		if (_shift) then
		{
			_usageS = 1;
			_usageV = 1;
			_usageT = 1;
			_usageA = 1;
			_usageC = 1;
			_capS = 1000;
			_capV = 1000;
			_capT = 1000;
			_capA = 1000;
			_capC = 1000;
		};
		
		_result = [z1, [_usageS, _capS], [_usageV, _capV], [_usageT, _capT], [_usageA, _capA], [_usageC, _capC]] call DAC_fApplyPointsWithinZone;
		_report = _result select 0;
		_appliedPosList = _result select 1;

		hint format ["Custom points applied!\n\nDetails: %1", _report];
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
	};
}
else
{
	player groupchat "Any Zone action in procress. Please try again later.";
};




