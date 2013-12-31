execVM "DemoText.sqf";
DAC_Basic_Value = 0;
"sRange_2" setmarkeralpha 0.3;
waituntil {(DAC_Basic_Value > 0)};
onMapSingleClick "_fun = [_pos,_shift] execVM ""Action.sqf""";
sleep 3;

while{true} do
{
	sleep 0.1;
	{_x setmarkerpos (position player)}foreach ["sRange_1","sRange_2"];
	hintsilent format ["Support calls: %1\nSupport groups: %2",(DAC_Support_Logic getVariable "support_count"),count (DAC_Support_Logic getVariable "support_groups")];
};