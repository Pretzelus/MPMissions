switch ((_this select 3) select 0) do
{
	case 1:	{
				z2 setVariable ["zone_action", 1, false];
				{player removeAction _x}foreach [Demo_Act_1,Demo_Act_2];
				sleep 5;
				Demo_Act_3 = player addaction ["Zone [z2 - vehicles] stop following Player","Action_z2.sqf",[2]];
				Demo_Act_4 = player addaction ["Zone [z2 - vehicles] move back to startpos","Action_z2.sqf",[3]];
				_pos = position player;
				[z2,_pos,[70,70,0],0,2,0] call DAC_fChangeZone;
				while{((z2 getVariable "zone_action") == 1)} do
				{
					sleep 2;
					if((position player distance _pos) > 25) then
					{
						_pos = position player;
						[z2,_pos,[70,70,0],0,0,0] call DAC_fChangeZone;
					};
				};
			};
	case 2:	{
				z2 setVariable ["zone_action", 2, false];
				{player removeAction _x}foreach [Demo_Act_3,Demo_Act_4];
				Demo_Act_1 = player addaction ["Zone [z1 - infantry] follow Player","Action_z1.sqf",[1]];
				Demo_Act_2 = player addaction ["Zone [z2 - vehicles] follow Player","Action_z2.sqf",[1]];
			};
	case 3:	{
				z2 setVariable ["zone_action", 3, false];
				{player removeAction _x}foreach [Demo_Act_3,Demo_Act_4];
				Demo_Act_1 = player addaction ["Zone [z1 - infantry] follow Player","Action_z1.sqf",[1]];
				Demo_Act_2 = player addaction ["Zone [z2 - vehicles] follow Player","Action_z2.sqf",[1]];
				[z2,(z2 getVariable "zone_startpos"),[50,50,0],0,0,0] call DAC_fChangeZone;
			};
	Default {};
};
