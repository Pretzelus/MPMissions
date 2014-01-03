//Create tasks
[] execVM "tasks.sqf";
/*[] spawn {
	_completed = false;
	while {!_completed} do {
		sleep 1;
		_completed = true;
		{
			if (!(taskCompleted _x)) then { _completed = false; };
		}forEach tasks;
	};
	["finish",true,7] call BIS_fnc_endMission;
};*/

// Init Farooq revive
[] execVM "FAR_revive\FAR_revive_init.sqf";

//fix for JIP players
if ((!isServer) && (player != player)) then
{
  waitUntil {player == player};
};

player createDiaryRecord ["diary", ["Credits","Mission made by Pretzel and Pejter for /a3g/"]];

player createDiaryRecord ["diary", ["Mission",""]];

player createDiaryRecord ["diary", ["Situation",""]];

//Init Group Menu
[player] execVM "groupsMenu\initGroups.sqf";

//Init DAC
if(!isServer) then {waitUntil{!isNull player}};
DAC_Zone = compile preprocessFile "DAC\Scripts\DAC_Init_Zone.sqf";
DAC_Objects	= compile preprocessFile "DAC\Scripts\DAC_Create_Objects.sqf";
execVM "DAC\DAC_Config_Creator.sqf";
//Finish world initialization before mission is launched. 
finishMissionInit;