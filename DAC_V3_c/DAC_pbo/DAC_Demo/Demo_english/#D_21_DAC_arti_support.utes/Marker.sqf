DAC_Basic_Value = 0;

{_x setmarkersize [1500,1500]}foreach ["ar1","ar2"];
{_x setmarkersize [1480,1480]}foreach ["ar1_1","ar2_1"];
{_x setmarkersize [8,8]}foreach ["ar4","ar5","ar6","ar7","ar4_1","ar5_1","ar6_1","ar7_1"];
{_x setmarkerpos [0,0]}foreach ["ar4","ar5","ar6","ar7","ar4_1","ar5_1","ar6_1","ar7_1","ar8","wppos"];
{_x setmarkeralpha 0.3}foreach ["ar4_1","ar5_1","ar6_1","ar7_1"];
"ar1_1" setmarkeralpha 0.15;"ar2_1" setmarkeralpha 0.15;

sleep 3;
waituntil {(DAC_Basic_Value == 1)};
sleep 3;
MaxArtiCount = (DAC_Player_Support select 0);_i = 0;
_temp = [[au1,"ar4","ar4_1"],[au2,"ar5","ar5_1"],[au3,"ar6","ar6_1"],[au4,"ar7","ar7_1"]];
SelectedUnit = objNull;ClickPos = "logic" createvehiclelocal [0,0,0];

onMapSingleClick "_fun = [_pos,_shift]execVM ""Action.sqf""";

while{MaxArtiCount > 0} do
{
	hintsilent format["Count arti calls: %1\n(Shift + LeftClick call Arti)",MaxArtiCount];_i = 0;
	if(isNull SelectedUnit) then
	{
		"ar8" setmarkerpos [0,0];
		{_x setmarkersize [8,8]}foreach ["ar4","ar5","ar6","ar7","ar4_1","ar5_1","ar6_1","ar7_1"];
		{_x setmarkerpos [0,0]}foreach ["ar4","ar5","ar6","ar7","ar4_1","ar5_1","ar6_1","ar7_1"];
		"wppos" setmarkerpos [0,0];
	}
	else
	{
		"ar8" setmarkerpos position SelectedUnit;
		{
			if((_x select 0) == SelectedUnit) then
			{
				(_x select 1) setmarkerpos position SelectedUnit;(_x select 1) setmarkersize [1500,1500];
				(_x select 2) setmarkerpos position SelectedUnit;(_x select 2) setmarkersize [1490,1490];
				"wppos" setmarkerpos (getWPPos [(group SelectedUnit), 0]);
			}
			else
			{
				(_x select 1) setmarkerpos [0,0];(_x select 1) setmarkersize [8,8];
				(_x select 2) setmarkerpos [0,0];(_x select 2) setmarkersize [8,8];
			};
		} 	foreach _temp;
	};
	sleep 0.1;
};
{deletemarker _x}foreach ["ar1","ar2","ar4","ar5","ar6","ar7"];