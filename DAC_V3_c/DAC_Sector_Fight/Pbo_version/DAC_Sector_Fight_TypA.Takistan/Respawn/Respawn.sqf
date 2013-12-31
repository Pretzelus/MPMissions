private ["_respPos","_myResp","_p","_n","_t","_PLUnit","_it","_i","_NObj","_u","_w","_m","_ma","_rArray","_sFlogic","_action","_step"];

PlayerArray = ["s1","s2","s3","s4","s5","s6","s7","s8","s9","s10"];

titleText [format["DAC_Sector_Fight Type [A]\n=======================\n\n\n\nThe Battlefield is being generated . . . please wait.\n\n\n\nWith this DAC_Sector_Fight mission example,\nin each sector enemy units are generated because each sector is a DAC Master Zone.\nBut note, there is also a big DAC Master Zone around the mission area.\n\nThe goal of this mission is to conquer each sector until it is fully filled green."], "BLACK OUT",0.1];
playmusic "EP1_Track13";
waituntil {(time > 10)};
waituntil{DAC_Basic_Value > 0};
titleText ["", "BLACK IN",2];
3 fademusic 0;
sleep 4;
playmusic "";
0 fademusic 1;

_myResp = (paramsarray select 0);_respPos = "";
_sFlogic = "Logic" createvehiclelocal [100,100,0];
player sidechat format["Start Respawn Script (respawn count = %1)",_myResp];

_p = primaryweapon player;
_n = format["%1",name player];
_w = weapons player;
_m = magazines player;
_it = items player;
_t = time + Param2;
_action = true;_step = 0;_l = 0;

sleep 1;

while{_myResp > 0} do
{
	switch (_step) do
	{
		case 0:
		{
			while{_action} do
			{
				_PLUnit = objNull;_i = 0;_u = objNull;
				_NObj = nearestObjects [Position player, [], 5];
				while {_i < count _NObj} do {_u = _NObj select _i;if(_u == player) then {_PLUnit = _u};_i = _i + 1};
				sleep 0.01;
				if(!(isNull _PLUnit)) then {_step = 1;_action = false};
			};
		};
		case 1:
		{
			if(alive _PLUnit) then
			{
				_sFlogic setpos position _PLUnit;
				sleep 1;
			}
			else
			{
				_sFlogic setpos position _PLUnit;
				_sFlogic setdir direction _PLUnit;
				_w = weapons _PLUnit;
				_m = magazines _PLUnit;
				_myResp = _myResp - 1;
				sleep (2 + (random 1));
				_respPos = format["%1",_PLUnit modelToWorld [0,0,0]];
				[_PLUnit]execVM "Respawn\RespCam.sqf";
				_ma = createmarker [_n, position _PLUnit];
                _ma setMarkerType "Dot";
                _ma setMarkerSize [0.4,0.4];
                _ma setMarkerColor "ColorBlack";
                _ma setMarkerText _n;
				sleep 3;
				_PLUnit setTargetAge "30 MIN";
				waituntil{alive player};
				sleep 1;
				player setTargetAge "30 MIN";
				{if(!(_x in _it)) then {player removeweapon _x}}foreach (weapons player);
				sleep 0.1;
				{player removemagazine _x}foreach (magazines player);
				_step = 2;
			};
		};
		case 2:
		{
			_action = true;_t = time + (paramsarray select 1);
			player switchMove "AmovPpneMstpSnonWnonDnon_injured";
			while{_action} do
			{
				_rArray = [];
				{if(!(format["%1",call compile _x] == "any")) then {_rArray = _rArray + [call compile _x]}}foreach PlayerArray;
				if(({(((_x distance _PLUnit) < 2) && (alive _x) && (_x != player))} count _rArray) > 0) then
				{
					_step = 3;_action = false;
				}
				else
				{
					if((paramsarray select 1) > 0) then
					{
						if(time > _t) then
						{
							_step = 3;_action = false;
						};
					};
				};
			};
		};
		case 3:
		{
			deletevehicle _PLUnit;
			player setcaptive true;
			player switchMove "AmovPpneMstpSnonWnonDnon_injured";
			player setpos (call compile _respPos);
			sleep 0.5;
			_i = 0;_u = _sFlogic;
			while {_i < count PlayerArray} do
			{
				if(!(format["%1",call compile (PlayerArray select _i)] == "any")) then
				{
					if((call compile (PlayerArray select _i)) == player) then
					{
						(call compile (PlayerArray select _i)) setVariable ["respawn_var", 1, true];
						_i = count PlayerArray;
					}
					else
					{
						_i = _i + 1;
					};
				}
				else
				{
					_i = _i + 1;
				};
			};
			_i1 = 0;_i2 = 0;
			while{_i1 < count _m} do {player addmagazine (_m select _i1);_i1 = _i1 + 1};
			sleep 0.1;
			while{_i2 < count _w} do {if(!((_w select _i2) in _it)) then {player addWeapon (_w select _i2)};_i2 = _i2 + 1};
			sleep 0.1;
			player selectweapon (primaryweapon player);
			cuttext[format["You have still %1 respawns.",_myResp],"plain",0.4];
			deletemarker _ma;
			reload player;
			showCompass true;
			player setcaptive false;
			_step = 0;_action = true;
			RespAction = 2;
		};
		Default {};
	};
};
cuttext["You used up your respawns. The mission is terminated for you.","plain",0.5];