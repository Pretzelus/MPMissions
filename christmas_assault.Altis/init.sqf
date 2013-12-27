[] execVM "tasks.sqf";
[] execVM "FAR_revive\FAR_revive_init.sqf";

if ((!isServer) && (player != player)) then
{
  waitUntil {player == player};
};

[player] execVM "groupsMenu\initGroups.sqf";
//Init UPSMON script
call compile preprocessFileLineNumbers "scripts\Init_UPSMON.sqf";
//Process statements stored using setVehicleInit
//processInitCommands;
//Finish world initialization before mission is launched. 
finishMissionInit;
