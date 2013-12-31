private ["_pos","_rndZone","_para","_shift","_name"];

_pos = (_this select 0);_shift = _this select 1;_name = "";

if(_shift) then
{
	player setpos _pos;
}
else
{
	if(count DAC_Obj_Init == 0) then
	{
		_rndZone = round(random 1000);
		_name = format["z%1",_rndZone];
		call compile format["%1 = createTrigger [""EmptyDetector"",_pos]",_name];
		call compile format["%1 setTriggerActivation [""LOGIC"", ""PRESENT"", true]",_name];;
		call compile format["%1 setTriggerArea [100, 100, 0, false]",_name];
		call compile format["%1 setTriggerStatements [""this"", """", """"]",_name];
		call compile format["%1 setTriggerType ""NONE""",_name];
		[_name,300,0,0,3,1,[s1,20],""] spawn DAC_Objects;
	}
	else
	{
		player groupchat "Any object action in procress. Please try again later.";
	};
};