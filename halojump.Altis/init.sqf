//Set UPS markers invis
"kavala" setMarkerAlpha 0;
"objective1" setMarkerAlpha 0;
"fuelstation1ups" setMarkerAlpha 0;
"fuelstation2ups" setMarkerAlpha 0;
"kastro" setMarkerAlpha 0;

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

player createDiaryRecord ["diary", ["Credits","Mission made by Pretzel and Pejter for /a3g/<br/>We are hoping you are going to have fun!"]];

player createDiaryRecord ["diary", ["Execution","You need to stay mobile. Enemy forces are large in the region, and holding position for too long will get you killed, either by encirclement or getting overpowered with enemy fire. After jumping out from C-130J, I would recommend opening parachute as low as possible, to avoid enemy gunfire. Once on a ground, you are allowed to use every resource given to gain advantage over the enemy. Good luck out there."]];

player createDiaryRecord ["diary", ["Mission","You have several tasks awaiting for completion. We understand that you may not be able to complete them all, but more the better. Your objectives are:<br/>
- Destroy enemy supply trucks located <marker name = 'objective1marker'>here</marker>.<br/>
- Secure hospital located <marker name = 'hospital'>here</marker>.<br/>
- Destroy fuel stations located <marker name = 'fuelstation1'>here</marker> and <marker name = 'fuelstation2'>here</marker>.<br/>
- Secure <marker name = 'castlekastro'>Castle Kastro</marker>."]];

player createDiaryRecord ["diary", ["Situation","War has changed. It's no longer about nations, ideologies, or ethnicity. It's an endless series of proxy battles fought by mercenaries and machines.<br/>War - and its consumption of life - has become a well-oiled machine. War has changed. ID-tagged soldiers carry ID-tagged weapons, use ID-tagged gear. Nanomachines inside their bodies enhance and regulate their abilities. Genetic control. Information control. Emotion control. Battlefield control. Everything is monitored and kept under control.<br/>War has changed. The age of deterrence has become the age of control...All in the name of averting catastrophe from weapons of mass destruction. And he who controls the battlefield...controls history. War has changed. When the battlefield is under total control...War becomes routine. ~Solid Snake, MGS4<br/><br/>For this mission you are given transport plane C-130J and two armed Little Birds."]];


//Init Group Menu
[player] execVM "groupsMenu\initGroups.sqf";

//Init UPSMON script
call compile preprocessFileLineNumbers "scripts\Init_UPSMON.sqf";
//Process statements stored using setVehicleInit
//processInitCommands;
//Finish world initialization before mission is launched. 
finishMissionInit;