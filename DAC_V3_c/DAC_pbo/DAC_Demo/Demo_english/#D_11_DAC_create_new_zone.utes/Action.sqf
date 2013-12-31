private ["_pos","_rndZone","_para","_shift","_rndSide","_rndType","_rndSize","_rndShape","_log","_dist","_m"];

_pos = (_this select 0);_shift = _this select 1;_alt = _this select 2;_rndSide = 0;_m = 0;
_rndType = 0;_rndSize = 0;_rndShape = 0;_log = "";_dist = 90;_i = 0;_m = 0;

if((_pos distance player) < _dist) then
{
	if(count zonePool > 0) then
	{
		zonePool call DAC_fDeleteZone;
	}
	else
	{
		player sidechat "Position to close to the player unit.";
	};
}
else
{
	{
		if((_pos distance (position (call compile _x))) < _dist) then
		{
			_log = _x;_dist = _pos distance (position (call compile _x));
		}
	}	foreach DAC_CheckZones;
	
	if(format["%1",_log] == "") then
	{
		if(DAC_NewZone == 0) then
		{
			_rndZone = round(random 1000);_rndShape = round(random 1);
			_para = [format["z%1",_rndZone],[_rndZone,0,0],[2,2,10,4],[],[1,1,8,5],[],[sideChange,sideChange,0,sideChange]];
			if(_rndShape == 1) then
			{
				[_pos,100 + (random 150),100 + (random 150),_rndShape,random 360,_para] call DAC_fNewZone;
			}
			else
			{
				_rndSize = round(100 + (random 150));
				[_pos,_rndSize,_rndSize,_rndShape,random 360,_para] call DAC_fNewZone;
			};
			sleep 1;
			waituntil{DAC_NewZone == 0};
			if(format["z%1",_rndZone] in DAC_CheckZones) then
			{
				zonePool = zonePool + [format["z%1",_rndZone]];
				if(sideChange == 0) then {sideChange = 1} else {sideChange = 0};
			}
			else
			{
				player sidechat "Zone could not be created.";
			};
		}
		else
		{
			player groupchat "Any Zone action in procress. Please try again later.";
		};
	}
	else
	{
		[_log] call DAC_fDeleteZone;_m = 0;
		while{_m < count zonePool} do
		{
			if(((position (call compile (zonePool select _m))) distance (position (call compile _log))) < 1) then
			{
				zonePool = zonePool - [(zonePool select _m)];
			}
			else
			{
				_m = _m + 1;
			};
		};
	};
};