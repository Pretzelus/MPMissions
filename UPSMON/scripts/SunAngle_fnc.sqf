// SUN ANGLE - CarlGustaffa

	private ["_lat","_day","_hour","_sunangle"];
		While {true} do 
		{
			_lat = -1 * getNumber(configFile >> "CfgWorlds" >> worldName >> "latitude");
			_day = 360 * (dateToNumber date);
			_hour = (daytime / 24) * 360;
			_sunangle = ((12 * cos(_day) - 78) * cos(_lat) * cos(_hour)) - (24 * sin(_lat) * cos(_day));  
			KRON_UPS_Night = false;
		
			If (_sunangle < 0) then {KRON_UPS_Night = true;};
			If (_sunangle > 0) then {KRON_UPS_Night = False;};
			Publicvariable "KRON_UPS_Night";
			sleep 162;
		};