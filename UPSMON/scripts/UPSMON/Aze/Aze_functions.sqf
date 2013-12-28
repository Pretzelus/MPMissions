MON_Bld_ruins = ["Land_Unfinished_Building_01_F","Land_Unfinished_Building_02_F","Land_d_Stone_HouseBig_V1_F","Land_d_Stone_Shed_V1_F","Land_u_House_Small_02_V1_F","Land_i_Stone_HouseBig_V1_F","Land_u_Addon_02_V1_F"];


Aze_artilleryTarget = {
	// [_arti,"",_target] spawn Aze_artilleryTarget;
	
	private ["_support","_askBullet","_target","_arti","_missionabort","_rounds","_range","_area","_nbrbullet","_maxcadence","_mincadence","_askmission","_fire","_artibusy","_targetpos","_auxtarget","_npc"];
	
	_support = _this select 0;
	
	If (count _support <= 0 ) exitwith {if (KRON_UPS_Debug>0) then {player sidechat "ABORT: no support";};};
	
	
	_askMission = _this select 1;
	_target = _this select 2;

	
	_arti  = _support select 0;
	_rounds = _support select 1;					
	_area = _support select 2;	
	_maxcadence = _support select 3;	
	_mincadence = _support select 4;	

	_nbrbullet = 0;
	_askbullet = "";
	_missionabort = false;
	
	_npc = objNull;
	if (count _this > 3) then {_npc = _this select 3;}; 
	
	If (isnull (gunner _arti) 
	&& !(canmove (gunner _arti))) 
	exitwith 
	{
		if (KRON_UPS_Debug>0) then {player sidechat "ABORT: no gunner";};
	};
	
	_side = side gunner _arti;
	_artibusy = (vehicle _arti) getVariable "artibusy";
	_munradius = 150;	

	Switch (_askmission) do {
		case "HE": {
			If ((typeof (vehicle _arti)) in ["B_Mortar_01_F","O_Mortar_01_F","I_G_Mortar_01_F"]) then {_askbullet = "8Rnd_82mm_Mo_shells";};
			If ((typeof (vehicle _arti)) in ["B_MBT_01_arty_F","O_MBT_02_arty_F"]) then {_askbullet = "32Rnd_155mm_Mo_shells";_munradius = 300;};	
			_nbrbullet = _rounds select 2;
		};
		
		case "WP": {
			If ((typeof (vehicle _arti)) in ["B_Mortar_01_F","O_Mortar_01_F","I_G_Mortar_01_F"]) then {_askbullet = "8Rnd_82mm_Mo_Smoke_white";};
			If ((typeof (vehicle _arti)) in ["B_MBT_01_arty_F","O_MBT_02_arty_F"]) then {_askbullet = "6Rnd_155mm_Mo_smoke";};
			_nbrbullet = _rounds select 1;
		};
		
		case "FLARE": {
			If ((typeof (vehicle _arti)) in ["B_Mortar_01_F","O_Mortar_01_F","I_G_Mortar_01_F"]) then {_askbullet = "8Rnd_82mm_Mo_Flare_white";};
			If ((typeof (vehicle _arti)) in ["B_MBT_01_arty_F","O_MBT_02_arty_F"]) then {_nbrbullet = 0;};
			// _nbrbullet = _rounds select 0;
		};
	
	};
	
	If(_artibusy 
	|| isNull _target 
	|| !alive _target 
	|| _nbrbullet <= 0) 
	exitwith 
	{
		if (KRON_UPS_Debug>0) then {player sidechat format ["ABORT: Arti: %1   Target: %2   Munition: %3",_artibusy,_target,_nbrbullet];};
	};
	

	
	if (!isnull _target  || alive _target) then 
	{
	
	
	switch (_side) do {
		case West: {
			KRON_UPS_ARTILLERY_WEST_UNITS set [0,1];
			KRON_UPS_ARTILLERY_WEST_UNITS = KRON_UPS_ARTILLERY_WEST_UNITS - [0];
			KRON_UPS_ARTILLERY_WEST_UNITS = KRON_UPS_ARTILLERY_WEST_UNITS - [1];
		};
		case EAST: {
			KRON_UPS_ARTILLERY_EAST_UNITS set [0,1];
			KRON_UPS_ARTILLERY_EAST_UNITS = KRON_UPS_ARTILLERY_EAST_UNITS - [0];
			KRON_UPS_ARTILLERY_EAST_UNITS = KRON_UPS_ARTILLERY_EAST_UNITS - [1];
		};
		case GUER: {
			KRON_UPS_ARTILLERY_GUER_UNITS set [0,1];
			KRON_UPS_ARTILLERY_GUER_UNITS = KRON_UPS_ARTILLERY_GUER_UNITS - [0];
			KRON_UPS_ARTILLERY_GUER_UNITS = KRON_UPS_ARTILLERY_GUER_UNITS - [1];
		};
	
	};
		
		
	(vehicle _arti) setVariable ["artibusy",true];
	
	_auxtarget = _target;
	_targetPos = [];

	If ((_askbullet == "8Rnd_82mm_Mo_Smoke_white" || _askbullet == "6Rnd_155mm_Mo_smoke") 
	&& !IsNull _npc 
	&& alive _npc) 
	then 
	{ 
		_vcttarget = [_npc, _target] call BIS_fnc_dirTo;
		_dist = (_npc distance _target)/2;
		_targetPos = [position _npc,_vcttarget, _dist] call MON_GetPos2D;
	}
	else 
	{
		_targetPos = _auxtarget getvariable ("UPSMON_lastknownpos");
	};
	
	
		if (!isnil "_targetPos" || count _targetPos > 0) then 
		{
			//If target in range check no friendly squad near									
			if (alive _auxtarget 
			&& !(_auxtarget iskindof "Air") 
			&& (_targetPos inRangeOfArtillery [[_arti], _askbullet])) 
			then 
			{
			
				_target = _auxtarget;
				//Must check if no friendly squad near fire position
				If (_askbullet != "8Rnd_82mm_Mo_Flare_white") then
				{
					{	
						if (!isnull _x && _side == side _x) then 
						{																								
							if ((round([position _x,_targetPos] call KRON_distancePosSqr)) < (_munradius)) exitwith {_target = objnull;};
						};										
					} foreach KRON_NPCs;
				};
			};
		};
	
	If (!isNull _target || count _targetPos > 0) then 
	{
		//Fix current target
		_targetPos = [];	
		
		If (
		(_askbullet == "8Rnd_82mm_Mo_Smoke_white" || _askbullet == "6Rnd_155mm_Mo_smoke") 
		&& !IsNull _npc 
		&& alive _npc) 
		then 
		{ 
		_vcttarget = [_npc, _target] call BIS_fnc_dirTo;
		_dist = (_npc distance _target)/2;
		_targetPos = [position _npc,_vcttarget, _dist] call MON_GetPos2D;
		}
		else 
		{
		_targetPos = _auxtarget getvariable ("UPSMON_lastknownpos");
		};
		
		if (!isnil "_targetPos") then 
		{									
			// _arti removeAllEventHandlers "fired"; 
			// chatch the bullet in the air and delete it
			// _arti addeventhandler["fired", {deletevehicle (nearestobject[_this select 0, _this select 4])}];
			sleep 5;
			if (KRON_UPS_Debug>0) then {player sidechat "FIRE";};
			[_arti,_targetPos,_nbrbullet,_area,_maxcadence,_mincadence,_askbullet,_support] spawn Aze_artillerydofire;
		}
		else 
		{
			if (KRON_UPS_Debug>0) then {player sidechat "ABORT: no more target";}; 
			_missionabort = true;
		};
	
	}
	else
	{
		_missionabort = true
	};
	
	If (_missionabort) then
	{
	
		if (KRON_UPS_Debug>0) then {player sidechat "ABORT: no more target";};
		
			switch (_side) do {
		case West: {
			KRON_UPS_ARTILLERY_WEST_UNITS = KRON_UPS_ARTILLERY_WEST_UNITS + [_support];
		};
		case EAST: {
			KRON_UPS_ARTILLERY_EAST_UNITS = KRON_UPS_ARTILLERY_EAST_UNITS + [_support];
		};
		case GUER: {
			KRON_UPS_ARTILLERY_GUER_UNITS = KRON_UPS_ARTILLERY_GUER_UNITS + [_support];
		};
	
		};
		
		(vehicle _arti) setVariable ["artibusy",false];
	};
};
};

Aze_artillerydofire = {
	 
		private ["_smoke1","_i","_area","_position","_maxcadence","_mincadence","_sleep","_nbrbullet","_rounds","_arti","_timeout","_bullet"];
		
		_arti = _this select 0;
		_position  = _this select 1;
		_nbrbullet = _this select 2;	
		_area = _this select 3;	
		_maxcadence = _this select 4;	
		_mincadence = _this select 5;	
		_bullet = _this select 6;
		_rounds = 0;
		_support = _this select 7;
		_supportrounds = _support select 1;
		_support2 = [];

		
		If (_bullet == "8Rnd_82mm_Mo_Flare_white")
		then {_rounds = 1; [] spawn Aze_Flaretime;} else {_rounds = 3;};
		
		If (_rounds > _nbrbullet) then {_rounds = _nbrbullet};
	
	
	Switch (_bullet) do {
		case "8Rnd_82mm_Mo_shells": {
			_support2 = [_support select 0,[_supportrounds select 0, _supportrounds select 1, (_supportrounds select 2) - _rounds],_support select 2, _support select 3,_support select 4];
			
		};
		
		case "32Rnd_155mm_Mo_shells": {
			_support2 = [_support select 0,[_supportrounds select 0, _supportrounds select 1, (_supportrounds select 2) - _rounds],_support select 2, _support select 3,_support select 4];
			
		};
		
		case "8Rnd_82mm_Mo_Smoke_white": {
			_support2 = [_support select 0,[_supportrounds select 0, (_supportrounds select 1) - _rounds, _supportrounds select 2],_support select 2, _support select 3,_support select 4];
			
		};
		
		case "6Rnd_155mm_Mo_smoke": {
			_support2 = [_support select 0,[_supportrounds select 0, (_supportrounds select 1) - _rounds, _supportrounds select 2],_support select 2, _support select 3,_support select 4];
			
		};
		
		case "8Rnd_82mm_Mo_Flare_white": {
			_support2 = [_support select 0,[(_supportrounds select 0) - _rounds, _supportrounds select 1, _supportrounds select 2],_support select 2, _support select 3,_support select 4];
		};
	
	};		
		
		_area2 = _area * 2;
		if (KRON_UPS_Debug>0) then { player globalchat format["artillery doing fire on %1",_position] };	
		
		for [{_i=0}, {_i<_rounds}, {_i=_i+1}] do 
		{ 		
			_sleep = random _maxcadence;			
			if (_sleep < _mincadence) then {_sleep = _mincadence};
			_com = effectiveCommander (vehicle _arti);
			sleep 2;
			_com commandArtilleryFire [[(_position select 0)+ random _area2 - _area, (_position select 1)+ random  _area2 - _area, 0], _bullet, 1];	
			sleep _sleep; 
			if (KRON_UPS_Debug>0) then {player sidechat "SPLASH";};
			//Swap this
			_arti setVehicleAmmo 1;
		};
		
	sleep 15;
	_side = side gunner _arti;

		switch (_side) do {
		case West: {
			KRON_UPS_ARTILLERY_WEST_UNITS = KRON_UPS_ARTILLERY_WEST_UNITS + [_support2];
		};
		case EAST: {
			KRON_UPS_ARTILLERY_EAST_UNITS = KRON_UPS_ARTILLERY_EAST_UNITS + [_support2];
		};
		case GUER: {
			KRON_UPS_ARTILLERY_GUER_UNITS = KRON_UPS_ARTILLERY_GUER_UNITS + [_support2];
		};
	
		};
		
	(vehicle _arti) setVariable ["artibusy",false];
};


Aze_supstatestatus = {
private ["_npc","_azesupstate","_tpwcas_running"];
_tpwcas_running = true;
if (isNil "tpwcas_running") then {_tpwcas_running = true;} else {_tpwcas_running = false;};
_npc = _this select 0;
_azesupstate = 0;

if (_tpwcas_running) then
{
{
	If (_x getvariable "tpwcas_supstate" == 3) exitwith {_azesupstate = 3;};
	If (_x getvariable "tpwcas_supstate" == 2) exitwith {_azesupstate = 2;};
} foreach units group _npc;
};
_azesupstate

};


Aze_Flaretime = {
FlareInTheAir = true;
sleep 120;
FlareInTheAir = false;
Publicvariable "FlareInTheAir";
};


Aze_See = {
private ["_see","_infront","_uposASL","_opp","_adj","_hyp","_eyes","_obstruction","_angle","_inbuilding"];
_unit = _this select 0;
_angle = _this select 1;
_bld = _this select 2;
_essai = 0;
_see = false;
_ouverture = false;
_findoor = false;

	_inbuilding = [_unit] call Aze_inbuilding;
	If (!_inbuilding) then {
	// check window
	_windowposition = [_bld] call Aze_checkwindowposition;
	sleep 0.4;
	_watch = [];
	If (count _windowposition > 0) then 
	{
		{
			
			_x = [_x select 0,_x select 1,(getPosATL _unit) select 2];
			If ((_unit distance _x) <= 2.3) exitwith {_watch = _x;};
		} forEach _windowposition;
	
		if (count _watch > 0) then 
		{
		
		_posATL = getPosATL _unit;

		_abx = (_watch select 0) - (_posATL select 0);
		_aby = (_watch select 1) - (_posATL select 1);
		_abz = (_watch select 2) - (_posATL select 2);

		_vec = [_abx, _aby, _abz];

		// Main body of the function;

		_unit setVectorDir _vec;		
		
			sleep 0.2;
			_unit lookat _watch;
			// player globalchat "Watch window";
			_ouverture = true;
			
			
	// _ballCover = "Sign_Arrow_Large_Blue_F" createvehicle [0,0,0];
	// _ballCover setpos _watch;	
	
	
		};
	};
 
	// If no window found check for door
	If (!_ouverture) then
	{
	_doorposition = [_bld] call Aze_checkdoorposition;
	sleep 0.4;
	_watch = [];
	If (count _doorposition > 0) then 
	{
		{
			
			_x = [_x select 0,_x select 1,(getPosATL _unit) select 2];
			If ((_unit distance _x) <= 3) exitwith {_watch = _x;};

		} forEach _doorposition;
	
		if (count _watch > 0) then 
		{
		
		_posATL = getPosATL _unit;

		_abx = (_watch select 0) - (_posATL select 0);
		_aby = (_watch select 1) - (_posATL select 1);
		_abz = (_watch select 2) - (_posATL select 2);

		_vec = [_abx, _aby, _abz];

		// Main body of the function;

		_unit setVectorDir _vec;	
			sleep 0.2;
			_unit lookat _watch;
			// player globalchat "Watch DOOR";

		// _ballCover = "Sign_Arrow_Large_RED_F" createvehicle [0,0,0];
		// _ballCover setpos _watch;	

			_ouverture = true;
			_findoor = true;
		};
	};	
	};
	};
	Sleep 2;
	// Check if window not blocking view or search direction for AI if he doesn't watch window or door.
	If (!(_findoor)) then {
	_cansee = [_unit,getdir _unit,_bld] spawn Aze_WillSee;};	

};

Aze_checkdoorposition = {
	private ["_house","_uACfg","_sel","_position","_doorPositions","_worldPos"];
	_house = _this select 0;
	_doorPositions = [];
	
	_uACfg = (configFile >> "cfgVehicles" >> (typeOf _house) >> "UserActions");
	if ((count _uACfg) <= 0) exitwith {_doorPositions};


	for "_i" from 0 to ((count _uACfg) - 1) step 3 do
	{
		if (_i >= (count _uACfg)) exitwith {_doorPositions};
		_door = _uACfg select _i;
		_position = getText (_door >> "position");
		
		_posdoor = _house selectionPosition _position;
		_worldPos = [(_house modelToWorld _posdoor) select 0,(_house modelToWorld _posdoor) select 1,((_house modelToWorld _posdoor) select 2) + 0.5];
		_doorPositions = _doorPositions + [_worldPos];
	};

	_doorPositions
};

Aze_checkwindowposition = {
	private ["_house","_uACfg","_sel","_position","_WindowPositions","_worldPos"];
	_house = _this select 0;
	_WindowPositions = [];

	_uACfg = (configFile >> "cfgVehicles" >> (typeOf _house) >> "HitPoints");
	if ((count _uACfg) <= 0) exitwith {_WindowPositions};


	for "_i" from 1 to ((count _uACfg) - 2) step 1 do
	{
		if (_i >= (count _uACfg)) exitwith {_WindowPositions};
		_window = format ["Glass_%1_effects",_i];

		_poswindow = _house selectionPosition _window;
		_worldPos = [(_house modelToWorld _poswindow) select 0,(_house modelToWorld _poswindow) select 1,((_house modelToWorld _poswindow) select 2) + 1.4];
		_WindowPositions = _WindowPositions + [_worldPos];
	};
	

	
	_WindowPositions
};


Aze_WillSee = {
// garrison func from ....
	private ["_see","_infront","_uposASL","_opp","_adj","_hyp","_eyes","_obstruction","_angle"];

	_unit = _this select 0;
	_angle = _this select 1;
	_bld = _this select 2;
	_essai = 0;

	If (count _this > 3) then {_essai = _this select 3;};

	_uposASL = getposASL _unit;
	_eyes = eyepos _unit;

	_hyp = 10;
	_adj = _hyp * (cos _angle);
	_opp = sqrt ((_hyp*_hyp) - (_adj * _adj));

	
	_infront = if ((_angle) >=  180) then 
	{
		[(_eyes select 0) - _opp,(_eyes select 1) + _adj,(_eyes select 2)]
	} 
	else 
	{
		[(_eyes select 0) + _opp,(_eyes select 1) + _adj,(_eyes select 2)]
	};

	_obstruction = (lineintersectswith [_eyes,_infront,_unit]) select 0;


	_see = if (isnil("_obstruction")) then {true} else {false};

	If (!_see && _essai < 5) exitwith 
	{
		_essai = _essai + 1;
		_angle = random 360;
		[_unit,_angle,_bld,_essai] call Aze_WillSee;
	};

	If (_see) then 
	{
		_posATL = getPosATL _unit;

		_abx = (_infront select 0) - (_posATL select 0);
		_aby = (_infront select 1) - (_posATL select 1);
		_abz = (_infront select 2) - (_posATL select 2);

		_vec = [_abx, _aby, _abz];

		// Main body of the function;

		_unit setVectorDir _vec;
		sleep 0.02;
		_unit lookat [_infront select 0,_infront select 1, 1];
		
		// _ballCover = "Sign_Arrow_Large_GREEN_F" createvehicle [0,0,0];
		// _ballCover setpos [_infront select 0,_infront select 1, 1];
	};
};



Aze_Inbuilding = {
private ["_Inbuilding","_posunit","_unit","_abovehead","_roof"];
	_unit = _this select 0;

	_posunit = [(getposASL _unit) select 0,(getposASL _unit) select 1,((getposASL _unit) select 2) + 0.5];
	_abovehead = [_posunit select 0,_posunit select 1,(_posunit select 2) + 20];

	_roof = (lineintersectswith [_posunit,_abovehead,_unit]) select 0;

	_Inbuilding = if (isnil("roof")) then {false} else {true};

_Inbuilding
};


Aze_SN_EHfired = {
// based on WindWalking Work
	// Audio Alert for nearest IA.
	_shooter = _this select 0;
	_magazine = _this select 6;

	_AudioRadius = 0;
	_noiseSource = [0,0,0];
	
	If (_shooter getvariable "UPS_Fire" > 0) exitwith {_nbr = (_shooter getvariable "UPS_Fire") - 10; _shooter setvariable ["UPS_Fire",_nbr];};

	_shooter setvariable ["UPS_Fire",120];
	
	if(vehicle _shooter == _shooter) then 
	{
		//Set audible range based on weapon type and muzzle
		switch (currentWeapon _shooter) do
		{
			case (handgunWeapon _shooter): 
			{
			
				if (("muzzle_snds_L" in (handgunItems _shooter)) || ("muzzle_snds_acp" in (handgunItems _shooter))) then
				{
					_AudioRadius = 200;
				}
				else
				{
					_AudioRadius = 10;
				};
			};
			case (primaryWeapon _shooter): 
			{
				//If it is a grenade launcher
				if((_this select 2) == "GL_3GL_F" || (_this select 2) == "EGLM") then
				{
					_grenade = _magazine;
					while{alive _grenade} do
					{
						_noiseSource = getPos _grenade;
						sleep 0.05;
					};
					_AudioRadius = 200;
				}
				else
				{
					_noiseSource = getPos _shooter;
					if (_this select 2 == "srifle_LRR_F" || _this select 2 == "srifle_LRR_SOS_F" || 
						_this select 2 == "srifle_GM6_F" || _this select 2 == "srifle_GM6_SOS_F") then
					{
						_AudioRadius = 700;
					}
					else
					{
						if (("muzzle_snds_H" in (primaryWeaponItems _shooter)) || ("muzzle_snds_L" in (primaryWeaponItems _shooter)) || ("muzzle_snds_B" in (primaryWeaponItems _shooter)) || ("muzzle_snds_H_MG" in (primaryWeaponItems _shooter))) then
						{
							_AudioRadius = 50;
						}
						else
						{
							_AudioRadius = 400;
						};
					};
				};
			};
			case (secondaryWeapon _shooter): 
			{
				_AudioRadius = 400;
				_rocket = _magazine;
				while{alive _rocket} do
				{
					_noiseSource = getPos _rocket;
					sleep 0.2;
				};
						
			};

		};
			
			//If grenade, only activate effect when the grenade explodes
			if(_this select 1 == "Throw") then {
				if(_this select 5 == "HandGrenade") then
				{
					sleep 3;
					_grenade = _magazine;
					while{alive _grenade} do
					{
						_noiseSource = getPos _grenade;
						sleep 0.2;
					};
					_AudioRadius = 600;
				};
			};
			
			//If an explosive pkaced, only activate effect when the explodes
			if(_this select 1 == "Put") then {
					_explosives = _magazine;
					_noiseSource = getPos _explosives;
					while{alive _explosives} do
					{
						sleep 2;
					};
					_AudioRadius = 600;
			};
			
			_shooterSide = side _shooter;
	}
	else //If the shooter is a vehicle
	{
		_AudioRadius = 700;
	};

	If (_AudioRadius != 0) then {
		_nearbyAI = _shooter nearEntities [["CAManBase"], _AudioRadius];
		// player sidechat format ["AI: %1  Shooter: %2",_nearbyAI,_shooter];
		{
			if(alive _x && !(_x in units group _shooter) && !(side _x == side _shooter) && !((_x getvariable "UPS_Hear") select 0)) then
			{
				_x setvariable ["UPS_Hear",[true,_noiseSource]];
				[_x,"UPS_hear",200,false] spawn Aze_Timeleft;
			};
	
		} foreach (_nearbyAI - [_shooter]);
	};
};

Aze_checkfire = {
private ["_npc","_firenear"];

_npc = _this select 0;
_firenear = false;

{
	If (_x getvariable "UPS_hear" select 0) exitwith {_firenear;};
} foreach units group _npc;

_firenear

};

Aze_Timeleft = {
private ["_npc","_event","_time"];

_npc = _this select 0;
_event = _this select 1;
_time = _this select 2;

sleep _time;

_npc setvariable [_event,[false,[0,0,0]]];
};

Aze_SortOutBldpos = {
	private ["_bld","_bldpos","_windowspos","_doorspos","_otherspos","_windowsposition","_doorsposition"];
	_bld = _this select 0;
	_bldpos = _this select 1;

	_windowspos = [];
	_doorspos = [];
	_otherspos = [];
	_allpos = [];
	_roofspos = [];

	if (!(typeof _bld in MON_Bld_ruins)) then {
	_windowsposition = [_bld] call Aze_checkwindowposition;
	_doorsposition = [_bld] call Aze_checkdoorposition;};

		sleep 0.3;
	{
		_bldpos1 = _x;
		_loop = true;
		if (!(typeof _bld in MON_Bld_ruins)) then 
		{
			If (count _windowsposition > 0) then 
			{
				{
					_windowpos1 = _x;
					If (_bldpos1 distance _windowpos1 <= 2) then {_windowspos = _windowspos + [_bldpos1]; _loop = false;};
				} foreach _windowsposition;
			};
			If (count _doorsposition > 0 && _loop) then 
			{
				{
					_doorpos1 = _x;
					If (_bldpos1 distance _doorpos1 <= 2) then {_doorspos = _doorspos + [_bldpos1]; _loop = false;};			
				} foreach _doorsposition;
		
			};
		} 
		else 
		{
			_pos1 = _bldpos1 select 2;
			If (_pos1 >= 3) then {_roofspos = _roofspos + [_bldpos1]; _loop = false;};
		};
		
		
		If (_loop) then {
		_otherspos = _otherspos + [_bldpos1];
		};
	
	} foreach _bldpos;
	
	
//	if (count _windowspos > 0) then {
//	{
//	_ballCover = "Sign_Arrow_Large_BLUE_F" createvehicle [0,0,0];
// 	_ballCover setpos _x;	
//	} foreach _windowspos;
//	};
	
//	if (count _doorspos > 0) then {
//	{
//	_ballCover = "Sign_Arrow_Large_RED_F" createvehicle [0,0,0];
// 	_ballCover setpos _x;	
//	} foreach _doorspos;
//	};
	
//	if (count _otherspos > 0) then {
//	{
//	_ballCover = "Sign_Arrow_Large_GREEN_F" createvehicle [0,0,0];
//	_ballCover setpos _x;	
//	} foreach _otherspos;
//	};

		if (count _windowspos > 0) then 
	{
		_windowspos call BIS_fnc_arrayShuffle;
		sleep 0.5;
		_allpos = _allpos + _windowspos;
	};
	
	if (count _doorspos > 0) then 
	{
		_doorspos call BIS_fnc_arrayShuffle;
		sleep 0.5;
		_allpos = _allpos + _doorspos;
	};
		if (count _roofspos > 0) then 
	{
		_roofspos call BIS_fnc_arrayShuffle;
		sleep 0.5;
		_allpos = _allpos + _roofspos;
	};
		if (count _otherspos > 0) then 
	{
		_otherspos call BIS_fnc_arrayShuffle;
		sleep 0.5;
		_allpos = _allpos + _otherspos;
	};
	
	

	// if (isNil (_bld getvariable "Aze_bldPos")) then {_bld setvariable ["Aze_bldPos",_allpos];};
	
	_allpos

};

Aze_checkallied = {
private ["_npc","_mennear","_result"];

	_npc = _this select 0;
	_mennear = nearestobjects [_npc,["CAManBase"],180];
	_result = true;

	{
		If (!(alive _x) && !(side _x == side _npc) && (_x in (units _npc))) exitwith {_mennear = _mennear - [_x];};
	} foreach _mennear;
	
	if (count _mennear > 1) then {_result = false;};

	_result
};