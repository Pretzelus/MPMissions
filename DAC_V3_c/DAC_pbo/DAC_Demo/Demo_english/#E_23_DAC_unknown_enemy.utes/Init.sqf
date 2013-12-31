execVM "DemoText.sqf";

DAC_Basic_Value = 0;escape = false;

waituntil{time > 5};

waituntil {(DAC_Basic_Value == 1)};
sleep 1;

DAC_Marker = 0;

while{true} do
{
	"sp" setmarkerpos (position s1);
	sleep 0.3;
};