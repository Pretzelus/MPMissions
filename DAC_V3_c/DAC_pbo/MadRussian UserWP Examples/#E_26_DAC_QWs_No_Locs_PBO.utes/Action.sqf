
_pos = _this select 0;
_shift = _this select 1;
_alt = _this select 2;

if (DAC_NewZone == 0) then
{
	_zones = [_pos, "Zones"] call DAC_fInsideOfZones;
	//_zoneLocs = [_pos, "ZoneLocs"] call DAC_fInsideOfZones; // <- Works!
	//hint format ["_zones: %1\n_zoneLocs: %2", _zones, _zoneLocs]; // <- Works!
	//breakOut "ExitOut";
	
	_zone = "";

	// NEXT LINE IS TEMP TEST UNTIL NEW DAC PBO VERSION IS RELEASED !!!!! (WHICH WILL REMOVE THE SPECIAL LOCATIONS)
	//_zones = [((nearestLocations [_pos, ["DAC_Zone"], 10000]) select 0) getVariable "DAC_Zone"];

	if ( (count _zones) > 0) then
	{
		// Get the closest of the zones returned in DAC_fInsideOfZones
		_zone = _zones select 0;
	}
	else
	{
		hint "No zone selected!";
		breakOut "ExitOut";
	};
	
	if (not MRU_DacReady) then
	{
		hint "Please wait... DAC almost ready";
		breakOut "ExitOut";
	};

	_base = "";
	_type = "";
	switch (_zone) do {
		case (z1): { _base = "Inf"; _type = "S" };
		case (z2): { _base = "Wheels"; _type = "V" };
		case (z3): { _base = "Armor"; _type = "T" };
		case (z4): { _base = "Helo"; _type = "A" };
	};
	_customPoints = [];
	if (_shift) then
	{
		_customPoints = [_base, "Pos", 1000, true] call DAC_fReadMarkers;
	}
	else
	{
		_customPoints = [_base, "Pos", 1000, false] call DAC_fReadMarkers;
	};
	if ((count _customPoints) == 0) then
	{
		hint "Custom Point Marks (""dots"") for this zone were removed previously.\n\nPlease restart mission to reapply custom marks for this zone!";
	}
	else
	{
		_replaceCount = [5,6,7] select (floor(random 3)); // 0-2
		_result = [_zone, _type, _customPoints, _replaceCount] call DAC_fReplaceZoneWaypoints;
		_report = _result select 0;
		//hint format ["%1", _report];
		hint format ["Replaced %1 of %2 zone waypoints of type %3.\n\nObserve the groups are now using some of the new waypoints!", _result select 1, _result select 2, _result select 3];
	};
}
else
{
	player groupchat "Any Zone action in procress. Please try again later.";
};




