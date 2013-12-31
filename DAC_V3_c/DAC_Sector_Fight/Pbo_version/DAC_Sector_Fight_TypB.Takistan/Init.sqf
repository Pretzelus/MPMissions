if(!isServer) then {waitUntil{!isNull player}};

mySectors = [];leadVal = "[0,0,0]";leadTime = time;_pos = position z1_1;
_list = [];_dumy = objNull;_unit = objNull;_i = 0;_text = "";
mSetting = [[100,100],[10,10],25];sSetting = 2;cSetting = 2;

if(isMultiplayer) then
{
	sSetting = (paramsarray select 7);
	cSetting = (paramsarray select 6);
	DAC_AI_Level = (paramsarray select 4);
	DAC_Auto_UnitCount = [(paramsarray select 5),10];
	if((!isServer) || ((isServer) && (local player))) then
	{
		[]execVM "Respawn\Respawn.sqf";
		sleep 5;
		waituntil{DAC_Basic_Value > 0};
		[player,"2"] spawn DAC_Weapons;
		sleep 1;
		if(player == (leader (group player))) then
		{
			onMapSingleClick "_fun = [_pos,_shift] execVM ""Action.sqf""";
			_text = format["
			[Important Hint]
			\n\nBecause You are the leader of the group,
			\nyou have the possibility to move the friendly
			\nDAC zone with a simple mapclick to a new position. Click in the middle of the zone, to confirm the new position. Click on the red or blue marker to change the size of the zone.
			\n\nInfo:
			\n---------
			\nWithin this area 2 or more friendly groups will move around and search for enemys. If one of these groups are killed in action, a new one will be generated in our camp.
			\n\n\nGood luck soldier.
			"];
			"DAC V3.0c SectorFight Type [B]" hintC [_text];
		};
	};
}
else
{
	DAC_Auto_UnitCount	= [4,10];
	titleText [format["DAC_Sector_Fight Type [B]\n=======================\n\n\n\nThe Battlefield is being generated . . . please wait.\n\n\n\nWith this DAC_Sector_Fight mission example,\nin each sector only waypoits are generated because each sector is a DAC Waypoint Zone.\nAll enemy units are generated within the big DAC Master Zone around the mission area.\n\nThe goal of this mission is to conquer each sector until it is fully filled green."], "BLACK OUT",0.1];
	playmusic "EP1_Track13";
	waituntil {(time > 10)};
	waituntil{DAC_Basic_Value > 0};
	titleText ["", "BLACK IN",2];
	3 fademusic 0;
	sleep 4;
	playmusic "";
	0 fademusic 1;
	[player,"2"] spawn DAC_Weapons;
	if(player == (leader (group player))) then
	{
		onMapSingleClick "_fun = [_pos,_shift] execVM ""Action.sqf""";
		_text = format["
		[Important Hint]
		\n\nBecause You are the leader of the group,
		\nyou have the possibility to move the friendly
		\nDAC zone with a simple mapclick to a new position. Click in the middle of the zone, to confirm the new position. Click on the red or blue marker to change the size of the zone.
		\n\nInfo:
		\n---------
		\nWithin this area 2 or more friendly groups will move around and search for enemys. If one of these groups are killed in action, a new one will be generated in our camp.
		\n\n\nGood luck soldier.
		"];
		"DAC V3.0c SectorFight Type [B]" hintC [_text];
	};
	sleep 1;
};

DAC_Sector_Values = [500,0.5,1,0.5,[5,0,"[1] execVM ""EndMission.sqf"""],[5,1,""],true];
mySectors execVM "\DAC_Source\Scripts\DAC_Init_Sector.sqf";
if(isServer) then {[] execVM "MoveZone.sqf"};