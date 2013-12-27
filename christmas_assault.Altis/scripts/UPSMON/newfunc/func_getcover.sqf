
//==================================================================
// BY TPWCAS Team
UPS_fnc_find_cover =
{
	private ["_units","_position_use","_unit","_status","_cover","_allcover","_objects","_lineIntersect","_terrainIntersect","_inCover","_coverPosition","_cPos","_vPos"];

	_units = _this select 0;

	_cover = [];
	_allcover = [];
	_position_use = [];
	_vdir = _this select 1;
	_unit = _units select 0;
	_dist = 40;
	// sleep 2;
	if (KRON_UPS_Debug>0) then {player sidechat "Cover"};
	//potential cover objects list
	If ("gdtStratisforestpine" == surfaceType getPosATL player) then {_dist = 75;};
	_objects = (nearestObjects [_unit, [], _dist]); // - ((position _unit) nearRoads _dist);	

	if ( count _objects > 0 ) then
	{
		{
			_inCover = false;
			_coverPosition = [];
			_y = _x;
			
			_y setUnitPos "UP";
			
			
			// start foreach _objects
			{ 
				_potentialcover = [_x] call fnc_filter;
				
				if ( !(_x isKindOf "Man") && !(_inCover) && (_potentialcover) && !(IsNull _x)) then
				{
					//_x is potential cover object
					_bbox = boundingBox _x;
					_nb1 = -1;
					_nb2 = -1;
					If ((_vdir select 0) == 0) then {_nb1 = 1;};
					If ((_vdir select 1) == 0) then {_nb2 = 1;};
					_dz = ((_bbox select 1) select 2) - ((_bbox select 0) select 2);
					_use = false;
					_cPos = (position _x);
					// If ((_cpos find _position_use) > -1) then {_use = true;} else {_position_use = _position_use + [_cpos]};
					_vPos = [(_vdir select 0)*(-1),(_vdir select 1)*(-1),_vdir select 2];
					
					//set coverposition to 1.3 m behind the found cover
					_coverPosition = [((_cPos select 0) + (0.8 * (_vPos select 0))), ((_cPos select 1) + (0.8 * (_vPos select 1))), (_cPos select 2)];
					_manarray = nearestObjects [_cPos,["MAN"],10]; 
					
					if (KRON_UPS_Debug>0) then {
							Hint format ["Nbre Hommes: %1",count _manarray];
					};		
					//Any object which is high and wide enough is potential cover position, excluding water
					if ((_dz > 0.2) && (_dz < 12) && !(surfaceIsWater _coverPosition) && !(_use) && ((count _manarray) == 0)) exitwith
					{
					
						if (KRON_UPS_Debug>0) then {
							_ballCover = "sign_sphere100cm_F" createvehicle _coverPosition;
							_ballCover attachto [_coverPosition,[0,0,245]];	
							Hint format ["object: %1",_x];
						};	

						_cover = [_x, _coverPosition];

					};
				};
			} forEach _objects;
			

			
				//if cover found order unit to move into cover
			if ( ((count _cover) > 0)) then
			{		
				[_y, _cover] call UPS_fnc_move_to_cover;
			};
						
			sleep 5;
			} foreach _units;
			// end foreach _objects
		};
	

};

//======================================================================================================================================================================================================
// By TPWCAS Team
UPS_fnc_move_to_cover =
{
	private ["_unit","_cover","_coverArray","_coverPosition","_coverDist","_coverTarget","_cPos","_vPos","_debug_flag","_dist","_continue","_logOnce","_startTime","_checkTime","_stopped","_tooFar","_tooLong","_elapsedTime"];
	
	_unit 			=	_this select 0;
	_coverArray 	=	_this select 1;
	
	
	_cover 			=	_coverArray select 0;
	_coverPosition 	= 	_coverArray select 1;


	dostop _unit;
	_unit enableAI "MOVE";
	_unit forceSpeed -1;
	_unit doMove _coverPosition;

	_coverDist = round ( _unit distance _coverPosition );

	_stopped = false;
	_continue = true;
	_logOnce = true;
	
	_startTime = time;
	_checkTime =  (_startTime + (1.7 * _coverDist) + 17);
	
	while { _continue } do 
	{
		if ( _logOnce) then 
		{

			_logOnce = false;
		};
		
		_dist = round ( _unit distance _coverPosition );
						
		if ( !( unitReady _unit ) && ( alive _unit ) && ( _dist > 1.25 ) ) then
		{
			//if unit takes too long to reach cover or moves too far out stop at current location
			_tooFar = ( _dist > ( _coverDist + 10 ));
			_tooLong = ( time >  _checkTime );
			_elapsedTime = time - _checkTime;
			
			if ( _tooFar || _tooLong ) exitWith
			{
				_coverPosition = getPosATL _unit;
				_unit forceSpeed -1;
				_unit doMove _coverPosition;

				_stopped = true;
				_continue = false;
				
			};
			sleep 0.3;
		}
		else
		{	
			_continue = false;
		};
	}; 

	if ( !( _stopped) ) then 
	{			
		doStop _unit;
		_unit disableAI "MOVE";
		_unit setUnitPos "DOWN";
	};
};


// By Robalo
fnc_filter = { 
    private ["_type","_z","_object"]; 
	_object = _this select 0;
    if (_object isKindOf "Man") exitWith {false}; 
    if (_object isKindOf "Bird") exitWith {false}; 
    if (_object isKindOf "BulletCore") exitWith {false}; 
    if (_object isKindOf "Grenade") exitWith {false}; 
    if (_object isKindOf "WeaponHolder") exitWith {false}; 
    if (_object isKindOf "WeaponHolderSimulated") exitWith {false}; 
    _type = typeOf _object; 
    if (_type == "") then { 
        if (damage _object == 1) exitWith {false}; 
   } else { 
        if (_type in ["Land_Concrete_SmallWall_4m_F", "Land_Concrete_SmallWall_8m_F"]) exitWith {false}; 
        if (_type in ["#crater","#crateronvehicle","#soundonvehicle","#particlesource","#lightpoint","#slop","#mark","#footprint"]) exitWith {false}; 
        if (["fence", _type] call BIS_fnc_inString) exitWith {false}; 
   }; 
    _z = (getPosATL _object) select 2; 
    if (_z > 0.2) exitWith {false}; 
    // _z = (boundingCenter _object) select 2; 
    // if (_z < 0.5) exitWith {false}; 
    true 
};  
