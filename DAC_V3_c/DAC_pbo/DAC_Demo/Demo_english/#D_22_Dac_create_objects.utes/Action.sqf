waituntil{time > 2};

_Temp_Objects = [];_i = 0;

if (time < 10) then
{
	if(ZoneCam) then
	{
		showCinemaBorder false;
		_demoCam = "camera" camCreate [(position player select 0),(position player select 1),(position player select 2) + 2];
		_demoCam cameraEffect ["internal","back"];
		_demoCam camSetTarget o2;
		_demoCam camSetPos [(position l5 select 0),(position l5 select 1),(position l5 select 2) + 30];
		cutText [format["- The houses do not touch each other\n- The trees almost touch no houses"],"PLAIN DOWN",3];
		_demoCam camCommit 30;
		waitUntil {camCommitted _demoCam};
		waituntil{(count DAC_Obj_Init <= 0)};
		_demoCam camSetPos [(position player select 0),(position player select 1),(position player select 2) + 2];
		_demoCam camCommit 1;
		waitUntil {camCommitted _demoCam};
		player cameraEffect ["terminate","back"];
		camDestroy _demoCam;
	};
}
else
{
	if(count DAC_Obj_Init == 0) then
	{
		switch ((_this select 3) select 0) do
		{
			case 1:	{
						_Temp_Objects = nearestObjects [Position o1, [], 300];
						{if(!(_x == player)) then {deletevehicle _x}}foreach _Temp_Objects;
						sleep 1;
						DemoValue = 1;
						player setpos (position l3);
						player setdir (direction l3);
						player removeAction Demo_Act_1;
						if(ZoneCam) then
						{
							waituntil{(count DAC_Obj_Init > 0)};
							showCinemaBorder false;
							sleep 1;
							_demoCam = "camera" camCreate [(position player select 0),(position player select 1),(position player select 2) + 2];
							_demoCam cameraEffect ["internal","back"];
							_demoCam camSetTarget o7;
							_demoCam camSetPos [(position player select 0),(position player select 1),(position player select 2) + 60];
							cutText [format["- In the area of the lighthouse are not objects\n- Stones left and right of the road"],"PLAIN DOWN",3];
							_demoCam camCommit 10;
							waitUntil {camCommitted _demoCam};
							waituntil{(count DAC_Obj_Init <= 0)};
							_demoCam camSetPos [(position player select 0),(position player select 1),(position player select 2) + 2];
							_demoCam camCommit 1;
							waitUntil {camCommitted _demoCam};
							player cameraEffect ["terminate","back"];
							camDestroy _demoCam;
						};
					};
			case 2:	{
						_Temp_Objects = nearestObjects [Position o7, [], 300];
						{if(!(_x == player)) then {deletevehicle _x}}foreach _Temp_Objects;
						sleep 1;
						DemoValue = 2;
						player setpos (position l2);
						player setdir (direction l2);
						player removeAction Demo_Act_2;
						if(ZoneCam) then
						{
							waituntil{(count DAC_Obj_Init > 0)};
							showCinemaBorder false;
							sleep 1;
							_demoCam = "camera" camCreate [(position player select 0),(position player select 1),(position player select 2) + 2];
							_demoCam cameraEffect ["internal","back"];
							_demoCam camSetTarget o6;
							_demoCam camSetPos [(position l7 select 0),(position l7 select 1),(position l7 select 2) + 20];
							cutText [format["- No special features. Only a beautiful place to hide ;-)"],"PLAIN DOWN",3];
							_demoCam camCommit 20;
							waitUntil {camCommitted _demoCam};
							waituntil{(count DAC_Obj_Init <= 0)};
							_demoCam camSetPos [(position player select 0),(position player select 1),(position player select 2) + 2];
							_demoCam camCommit 1;
							waitUntil {camCommitted _demoCam};
							player cameraEffect ["terminate","back"];
							camDestroy _demoCam;
						};
					};
			case 3:	{
						//_Temp_Objects = nearestObjects [Position o6, [], 300];
						//{if(!(_x == player)) then {deletevehicle _x}}foreach _Temp_Objects;
						sleep 1;
						DemoValue = 3;
						player setpos (position l1);
						player setdir (direction l1);
						player removeAction Demo_Act_3;
						if(ZoneCam) then
						{
							waituntil{(count DAC_Obj_Init > 0)};
							showCinemaBorder false;
							sleep 1;
							_demoCam = "camera" camCreate [(position player select 0),(position player select 1),(position player select 2) + 2];
							_demoCam cameraEffect ["internal","back"];
							_demoCam camSetTarget o4;
							_demoCam camSetPos [(position player select 0),(position player select 1),(position player select 2) + 50];
							_demoCam camCommit 0;
							cutText [format["- Rocks surround the camp\n- The rocks were sunk 30m into the ground\n- A few bushes along the fence"],"PLAIN DOWN",3];
							waitUntil {camCommitted _demoCam};
							waituntil{(count DAC_Obj_Init <= 0)};
							sleep 2;
							_demoCam camSetPos [(position player select 0),(position player select 1),(position player select 2) + 2];
							_demoCam camCommit 1;
							waitUntil {camCommitted _demoCam};
							player cameraEffect ["terminate","back"];
							camDestroy _demoCam;
						};
					};
			case 4:	{
						_Temp_Objects = nearestObjects [Position o4, [], 300];
						{if(!(_x == player)) then {deletevehicle _x}}foreach _Temp_Objects;
						sleep 1;
						player setpos (position l4);
						player setdir (direction l4);
						player removeAction Demo_Act_4;
						DemoValue = 4;
						if(ZoneCam) then
						{
							waituntil{(count DAC_Obj_Init > 0)};
							showCinemaBorder false;
							sleep 1;
							_demoCam = "camera" camCreate [(position player select 0),(position player select 1),(position player select 2) + 2];
							_demoCam cameraEffect ["internal","back"];
							_demoCam camSetTarget o5;
							_demoCam camSetPos [(position l6 select 0),(position l6 select 1),(position l6 select 2) + 30];
							cutText [format["- Also no special features, only that the island is somewhat embellished."],"PLAIN DOWN",3];
							_demoCam camCommit 30;
							waitUntil {camCommitted _demoCam};
							waituntil{(count DAC_Obj_Init <= 0)};
							_demoCam camSetPos [(position player select 0),(position player select 1),(position player select 2) + 2];
							_demoCam camCommit 1;
							waitUntil {camCommitted _demoCam};
							player cameraEffect ["terminate","back"];
							camDestroy _demoCam;
						};
					};
			case 5:	{
						_Temp_Objects = nearestObjects [Position o5, [], 500];
						{if(!(_x == player)) then {deletevehicle _x}}foreach _Temp_Objects;
						sleep 1;
						player setpos (position l8);
						player setdir (direction l8);
						player removeAction Demo_Act_5;
						if(ZoneCam) then
						{
							//waituntil{(count DAC_Obj_Init > 0)};
							showCinemaBorder false;
							sleep 1;
							_demoCam = "camera" camCreate [(position player select 0),(position player select 1),(position player select 2) + 2];
							_demoCam cameraEffect ["internal","back"];
							_demoCam camSetTarget l8_1;
							_demoCam camSetPos [(position l8 select 0),(position l8 select 1),(position l8 select 2) + 60];
							cutText [format["- Three objects are excluded."],"PLAIN DOWN",3];
							DemoValue = 5;
							_demoCam camCommit 3;
							waitUntil {camCommitted _demoCam};
							waituntil{(count DAC_Obj_Init <= 0)};
							_demoCam camSetPos [(position player select 0),(position player select 1),(position player select 2) + 2];
							_demoCam camCommit 1;
							waitUntil {camCommitted _demoCam};
							player cameraEffect ["terminate","back"];
							camDestroy _demoCam;
						};
						DemoValue = 6;
					};
			Default {
						
					};
		};
	}
	else
	{
		player sidechat "please wait until all objects are created...";
	};
};