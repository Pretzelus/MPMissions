private ["_pos","_shift","_mode"];

_pos = _this select 0;_shift = _this select 1;_mode = 5;_i = 0;
_marker = ["zonexyok","zonexplus","zonexminus","zoneyplus","zoneyminus"];

while{_i < count _marker} do
{
	if(([(_pos select 0),(_pos select 1)] distance (getMarkerPos (_marker select _i))) < (((mSetting select 1) select 0) * 2)) then
	{
		_mode = _i;
	};
	_i = _i + 1;
};

switch(_mode) do 
{
	case 0:	{
				if((time - leadTime) > 10) then
				{
					if(isMultiplayer) then
					{
						playsound "CodeBad";
						"zonexyok" setMarkerColor "ColorGreen";
						leadVal = format["%1",_pos];
						publicvariable "leadVal";
					}
					else
					{
						playsound "CodeBad";
						"zonexyok" setMarkerColor "ColorGreen";
						sleep 1;
						[z1_1,(getMarkerPos "fZone"),[((mSetting select 0) select 0),((mSetting select 0) select 1),0.1],0,0,0] call DAC_fChangeZone;
					};
					leadTime = time;
				}
				else
				{
					hintsilent "Hint: You can move the zone only every 10 seconds.";
					playsound "CodeRight";
				};
			};
	case 1:	{
				(mSetting select 0) set [0,((mSetting select 0) select 0) + (mSetting select 2)];
				publicvariable "mSetting";
			};
	case 2:	{
				(mSetting select 0) set [0,((mSetting select 0) select 0) - (mSetting select 2)];
				publicvariable "mSetting";
			};
	case 3:	{
				(mSetting select 0) set [1,((mSetting select 0) select 1) + (mSetting select 2)];
				publicvariable "mSetting";
			};
	case 4:	{
				(mSetting select 0) set [1,((mSetting select 0) select 1) - (mSetting select 2)];
				publicvariable "mSetting";
			};
	case 5:	{
				"fZone" setMarkerPos _pos;
			};
	default	{};
};
if(_mode > 0) then
{
	hint format["Area size = %1\nArea Pos = %2\nClick in the middle to accept\n%3\n%4",(mSetting select 0),(getMarkerPos "fZone"),(triggerArea z1_1),(direction z1_1)];
	_pos = (getMarkerPos "fZone");
	_xfact = ((mSetting select 0) select 0) + ((mSetting select 1) select 0);
	_yfact = ((mSetting select 0) select 1) + ((mSetting select 1) select 1);
	"fZone" setMarkerSize (mSetting select 0);
	"zonexyok" setMarkerColor "ColorBlack";
	"zonexyok" setMarkerPos _pos;
	"zonexplus" setMarkerPos [(_pos select 0)+_xfact,(_pos select 1)];
	"zonexminus" setMarkerPos [(_pos select 0)-_xfact,(_pos select 1)];
	"zoneyplus" setMarkerPos [(_pos select 0),(_pos select 1)+_yfact];
	"zoneyminus" setMarkerPos [(_pos select 0),(_pos select 1)-_yfact];
};