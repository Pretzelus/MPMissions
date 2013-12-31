waituntil{time > 3};
_list = "list playerTrig";
while{(alive player)} do
{
	waituntil{(player in (call compile _list))};
	[z2] call DAC_Activate;
	sleep 5;
	waituntil{(!(player in (call compile _list)))};
	[z2] call DAC_Deactivate;
	sleep 5;
};