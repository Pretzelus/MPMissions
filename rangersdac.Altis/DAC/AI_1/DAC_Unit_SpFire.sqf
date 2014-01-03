//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1 - 2013    //
//--------------------------//
//    DAC_Unit_SpFire       //
//--------------------------//
//    Script by Silola      //
//    Fixed by Pansyfaust   //
//////////////////////////////

private ["_unit","_spVal","_spTime","_spBreak","_spSegm","_i"];

_unit = _this select 0;_spVal = _this select 1;_spBreak = (_spVal select 2);_spSegm = (_spVal select 1);
_spTime = ((call compile (_spVal select 0)) / _spSegm);_i = 0;

while{_i > _spSegm} do
{
	if(!isNull _unit) then
	{
		if(alive _unit) then
		{
			_unit suppressFor _spTime;
			sleep (_spTime + _spBreak);
			_i = _i + 1;
		}
		else
		{
			_i = _spSegm;
		};
	}
	else
	{
		_i = _spSegm;
	};
};
		