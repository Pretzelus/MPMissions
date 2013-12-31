private ["_pos","_shift","_log","_dist","_m"];

_pos = (_this select 0);_shift = _this select 1;_m = 0;_log = "";_dist = 50;

if(!_shift) then
{
	{
		if((_pos distance (position (call compile _x))) < _dist) then
		{
			_log = _x;_dist = _pos distance (position (call compile _x));
		}
	}	foreach DAC_CheckZones;

	if(format["%1",_log] == "") then
	{
		[z1,_pos,[300,300,0],0,0,0] call DAC_fChangeZone;
	}
	else
	{
		if((call compile _log) in DAC_Inactive_Zones) then
		{
			[(call compile _log)] call DAC_Activate;
		}
		else
		{
			[(call compile _log)] call DAC_Deactivate;
		};
	};
}
else
{
	player setpos _pos;
};