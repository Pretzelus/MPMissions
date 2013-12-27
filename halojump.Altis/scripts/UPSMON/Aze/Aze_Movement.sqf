
Aze_Flank = {
	_npc = _this select 0;
	_dir2 = _this select 1;
	_targetPos = _this select 2;
	_flankdir = _this select 3;

	_loop = true;
	//Establecemos una distancia de flanqueo	
	_flankdist = ((random 0.5)+0.7)*KRON_UPS_safedist;
						
	//La distancia de flanqueo no puede ser superior a la distancia del objetivo o nos pordría pillar por la espalda
	_flankdist = if ((_flankdist*1.40) >= _dist) then {_dist*.65} else {_flankdist};
			
	_exp = "(1 + houses) * (1.5 + trees)* (1 - Sea)";
	if ("Air" countType [vehicle (_npc)]>0) then {_flankdist = _flankdist / 2;};
	If (("LandVehicle" countType [vehicle (_npc)]>0) || ("Air" countType [vehicle (_npc)]>0)) then {_exp = "(0.2 - trees) * (0.5 - houses) * (1 - forest) * (1 - hills) * (1 -Sea)";};


	//Calculamos posición de avance frontal			
	_frontPos = [_targetPos,_dir2, _flankdist] call MON_GetPos2D;	
			
	_bestplaces = selectBestPlaces [_frontPos,_flankdist/2,_exp,20,5];
	
	If ((count _bestplaces) > 0) then 
	{
		//_y = (count _bestplaces) - 1;
		//player sidechat format ["Best places: %1",_y];
		//_i = 0;
		//player sidechat format ["Terrain blocked: %1",_terrainBlocked];
			
		// while {_loop && (_i < _y)} do 
		// {
			_frontPos = (_bestplaces select 0) select 0;
			//_i = _i + 1;
			//_terrainBlocked = terrainIntersect [_pos,_frontPos];
			//sleep 0.1;
			//if (_terrainBlocked) then {_loop = false;};
			//player sidechat format ["Terrain blocked: %1",_terrainBlocked];
					
		//};
		
	} else 
	{
		If (vehicle _npc iskindof "LandVehicle") then 
		{
			_roadcheckpos = _frontPos nearRoads 50;
			If (count _roadcheckpos > 0) then {_frontPos = _roadcheckpos select 0;};
		};
	};

	//Adaptamos el ángulo de flanqueo a la distancia		
	_newflankAngle = ((random(KRON_UPS_flankAngle)+1) * 2 * (_flankdist / KRON_UPS_safedist )) + (KRON_UPS_flankAngle/1.4) ;
	if (_newflankAngle > KRON_UPS_flankAngle) then {_newflankAngle = KRON_UPS_flankAngle};			
			
	//Calculamos posición de flanqueo 1 45º
	_dirf1 = (_dir2+_newflankAngle) mod 360;			
	_flankPos = [_targetPos,_dirf1, _flankdist] call MON_GetPos2D;					
			
	_bestplaces = selectBestPlaces [_flankPos,_flankdist/2,_exp,20,1];
	If ((count _bestplaces) > 0) then 
	{
		_flankPos = (_bestplaces select 0) select 0;
	} else 
	{
		If (vehicle _npc iskindof "LandVehicle") then 
		{
			_roadcheckpos = _flankPos nearRoads 50;
			If (count _roadcheckpos > 0) then {_flankPos = _roadcheckpos select 0;};
		};
	};
			
	//Calculamos posición de flanqueo 2 -45º			
	_dirf2 = (_dir2-_newflankAngle+360) mod 360;		
	_flankPos2 = [_targetPos,_dirf2, _flankdist] call MON_GetPos2D;	
			
	_bestplaces = selectBestPlaces [_flankPos2,_flankdist/2,_exp,20,5];
	If ((count _bestplaces) > 0) then 
	{
		_flankPos2 = (_bestplaces select 0) select 0;
	} else 
	{
		If (vehicle _npc iskindof "LandVehicle") then 
		{
			_roadcheckpos = _flankPos2 nearRoads 50;
			If (count _roadcheckpos > 0) then {_flankPos2 = _roadcheckpos select 0;};
		};
	};
			
	if (KRON_UPS_Debug>0) then 
	{
		"flank1" setMarkerPos _flankPos; 
		"flank2" setMarkerPos _flankPos2; 
		"target" setMarkerPos _attackPos;	
	};
						
						
	//Decidir por el mejor punto de flanqueo
	//Contamos las posiciones de destino de otros grupos más alejadas
	_fldest = 0;
	_fldest2 = 0;
	_fldestfront = 0;
	_i = 0;
			
	{			
		if (!isnil "x") then 
		{
			if ( _i != _grpid &&  { format ["%1", _x] != "[0,0]" } ) then 
			{
				_dist1 = [_x,_flankPos] call KRON_distancePosSqr;
				_dist2 = [_x,_flankPos2] call KRON_distancePosSqr;	
				_dist3 = [_x,_frontPos] call KRON_distancePosSqr;	
				if (_dist1 <= _flankdist/1.5 || { _dist2 <= _flankdist/1.5 } || { _dist3 <= _flankdist/1.5 } ) then 
				{					
					if (_dist1 < _dist2 && { _dist1 < _dist3 } ) then {_fldest = _fldest + 1;};
					if (_dist2 < _dist1 && { _dist2 < _dist3 } ) then {_fldest2 = _fldest2 + 1;};
					if (_dist3 < _dist1 && { _dist3 < _dist2 } ) then {_fldestfront = _fldestfront + 1;};						
				};
			};
		}; 
		_i = _i + 1;
			
		//sleep 0.01;
	} foreach KRON_targetsPos;	
			
			
	//We have the positions of other groups more distant
	_i = 0;
	{
		if (!isnil "_x") then 
		{
			if (_i != _grpid && !isnull(_x)) then 
			{
				_dist1 = [getpos(_x),_flankPos] call KRON_distancePosSqr;
				_dist2 = [getpos(_x),_flankPos2] call KRON_distancePosSqr;	
				_dist3 = [getpos(_x),_frontPos] call KRON_distancePosSqr;
				if (_dist1 <= _flankdist/1.5 || { _dist2 <= _flankdist/1.5 } || { _dist3 <= _flankdist/1.5 } ) then 
				{						
					if (_dist1 < _dist2 && { _dist1 < _dist3 } ) then {_fldest = _fldest + 1;};
					if (_dist2 < _dist1 && { _dist2 < _dist3 } ) then {_fldest2 = _fldest2 + 1;};
					if (_dist3 < _dist1 && { _dist3 < _dist2 } ) then {_fldestfront = _fldestfront + 1;};	
				};
			};
			_i = _i + 1;
		};
			//sleep 0.01;
	} foreach KRON_NPCs;					
						
			
			
	//La preferencia es la elección inicial de dirección
	switch (_flankdir) do 
	{
		case 1: 
				{_prov = 125};
		case 2: 
				{_prov = -25};
		default
				{_prov = 50};
	};						
			
			
	//Si es positivo significa que hay más destinos existentes lejanos a la posicion de flanqueo1, tomamos primariamente este
	if (_fldest<_fldest2) then {_prov = _prov + 50;};
	if (_fldest2<_fldest) then {_prov = _prov - 50;};		

	//Si la provablilidad es negativa indica que tomará el flank2 por lo tanto la provabilidad de coger 1 es 0
	if (_prov<0) then {_prov = 0;};
			
				
	//Evaluamos la dirección en base a la provablilidad calculada
	if ((random 100) <= _prov) then 
	{
		_flankdir =1;
		_flankPos = _flankPos; _targettext = "_flankPos";
	} else {
		_flankdir =2;
		_flankPos = _flankPos2; _targettext = "_flankPos2";
	};			
			
					
	//Posición de ataque por defecto el flanco
	_targetPos = _flankPos;
	_targettext = "_flankPos";
			
			
	if ((surfaceIsWater _flankPos && { !(_isplane || _isboat || _isDiver) } ) ) then 
	{
		_targetPos = _attackPos;
		_targettext = "_attackPos"; 
		_flankdir =0;
	}
	else 
	{
		if (_fldestfront < _fldest  && _fldestfront < _fldest2) then 
		{
			_targetPos = _frontPos;
			_targettext = "_frontPos"; 
		};
	};	
	

	_array = [] + [_targetPos];
	_array = _array + [_targettext];
	_array = _array + [_flankdir];

	_array
};

Aze_Retreat = {

	_npc = _this select 0;
	_dir2 = _this select 1;
	_targetPos = _this select 2;

	
	_flankdist = ((random 0.5)+0.7)*KRON_UPS_safedist;

	//La distancia de flanqueo no puede ser superior a la distancia del objetivo o nos pordría pillar por la espalda
	_flankdist = if ((_flankdist*1.40) >= _dist) then {_dist*.65} else {_flankdist};
	
	_exp = "(1 + houses) * (1.5 + trees)* (1 - Sea)";
	if ("Air" countType [vehicle (_npc)]>0) then {_flankdist = _flankdist / 2;};
	If (("LandVehicle" countType [vehicle (_npc)]>0) || ("Air" countType [vehicle (_npc)]>0)) then {_exp = "(0.2 - trees) * (0.5 - houses) * (1 - forest) * (1 - hills) * (1 -Sea)";};	
			
	// avoidance position (right or left of unit)
	_avoidPos = [getpos _npc,_dir2, KRON_UPS_safedist] call MON_GetPos2D;	

	_bestplaces = selectBestPlaces [_avoidPos,50,_exp,20,5];
	If ((count _bestplaces) > 0) then 
	{
		_avoidPos = (_bestplaces select 0) select 0;
	} else 
	{
		If (vehicle _npc iskindof "LandVehicle") then 
		{
			_roadcheckpos = _avoidPos nearRoads 50;
			If (count _roadcheckpos > 0) then {_avoidPos = _roadcheckpos select 0;};
		};
	};
	
	_array = [] + [_targetPos];
	_array = _array + [_targettext];

	_array
};

Aze_Travel = {

};