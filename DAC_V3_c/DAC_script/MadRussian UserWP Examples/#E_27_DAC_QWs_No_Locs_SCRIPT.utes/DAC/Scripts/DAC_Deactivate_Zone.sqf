//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.0 - 2010    //
//--------------------------//
//    DAC_Deactivate_Zone   //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

if(DAC_Code > 1) exitwith {};

private ["_zones","_a","_c","_m","_i","_z"];

_zones = _this;_c = 0;_a = "";_i = 0;_z = objNull;

while {_i < count _zones} do
{
	_z = _zones select _i;_c = 0;
	if(str(_z) == scalar) then
	{
		hintc "Error: DAC_Deactivate_Zone > No valid zone";_i = _i + 1;
	}
	else
	{
		while {_c < count DAC_Zones} do
		{
			_a = DAC_Zones select _c;
			if((call compile (_a select 0)) == _z) then
			{
				_m = ((_a select 9) select 0);
				_m setmarkersizelocal [4,4];
				_c = ((count DAC_Zones) + 1);
				DAC_Inactive_Zones set [count DAC_Inactive_Zones,_z];
			}
			else
			{
				_c = _c + 1;
			};
		};
		_i = _i + 1;
	};
};