execVM "DemoText.sqf";
onMapSingleClick "player setpos _pos";
sleep 1;
waituntil{DAC_Basic_Value > 0};
[player,"2"] spawn DAC_Weapons;