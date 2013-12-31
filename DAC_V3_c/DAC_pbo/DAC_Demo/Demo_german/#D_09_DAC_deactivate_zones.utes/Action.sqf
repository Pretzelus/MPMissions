switch ((_this select 3) select 0) do
{
	case 1:	{
				player removeAction pAction1;
				[z1] call DAC_Activate;
				sleep 5;
				pAction1 = player addaction ["Deactivate zone [z1]","Action.sqf",[2]];
				if(pAct == 0) then
				{
					pAct = 1;
					sleep 3;
					execVM "DemoText.sqf";
				};
			};
	case 2:	{
				player removeAction pAction1;
				[z1] call DAC_Deactivate;
				sleep 5;
				pAction1 = player addaction ["Activate zone [z1]","Action.sqf",[1]];
			};
	Default {};
};
