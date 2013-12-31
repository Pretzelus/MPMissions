private ["_pos","_shift","_dist","_array","_obj","_list"];

_pos = _this select 0;_shift = _this select 1;_dist = 1000;_list = [];
_array = [au1,au2,au3,au4,player];artiList setpos _pos;clickPos setpos _pos;_sObj = objNull;

if(!(_shift)) then
{
	_list = list artiList;
	sleep 0.5;
	{
		if(_x in _list) then {if(alive _x) then {_sObj = _x}};
	}	foreach _array;
	
	if(isNull _sObj) then
	{
		if(isNull SelectedUnit) then
		{
			player groupchat "No unit in range. Please try again.";
		}
		else
		{
			if(SelectedUnit == s1) then
			{
				s1 setpos (position clickPos);
			}
			else
			{
				[(group SelectedUnit), 0] setWaypointPosition [(position clickPos), 0];
				(group SelectedUnit) setCurrentWaypoint [(group SelectedUnit), 0];
				(group SelectedUnit) move (position clickPos);
			};
		};
	}
	else
	{
		if(_sObj == SelectedUnit) then
		{
			SelectedUnit = objNull;
		}
		else
		{
			SelectedUnit = _sObj;
		};
	};
}
else
{
	sleep 0.5;
	if(clickPos in (List z2)) then
	{
		[Player,_pos,5,50] spawn DAC_fCallArti;MaxArtiCount = MaxArtiCount - 1;
	}
	else
	{
		hintc format["Arti fire not possible at this position.\n\nPlease click within the enemy zone"];
	};
};