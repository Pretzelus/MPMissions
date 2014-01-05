//Create tasks
[] execVM "tasks.sqf";

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
DAC_Zone = compile preprocessFile "DAC\Scripts\DAC_Init_Zone.sqf";
DAC_Objects	= compile preprocessFile "DAC\Scripts\DAC_Create_Objects.sqf";
execVM "DAC\DAC_Config_Creator.sqf";
//Finish world initialization before mission is launched. 
finishMissionInit;