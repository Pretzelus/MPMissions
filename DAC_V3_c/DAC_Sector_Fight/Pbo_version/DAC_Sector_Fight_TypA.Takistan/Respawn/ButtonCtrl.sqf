disableSerialization;
private ["_btn","_xcord","_ycord","_ctrl","_mode","_pos"];

_ctrl = _this select 0;_btn = _this select 1;_xcord = _this select 2;
_pos = position player;_ycord = _this select 3;_mode = _this select 4;

if(_btn == 1) then
{
	if(_mode == 1) then
	{
		if((RespMousePara select 0) == 0) then
		{
			RespMousePara set [0,1];
			RespMousePara set [1,_xcord];
			RespMousePara set [2,_ycord];
		};
	}
	else
	{
		if((RespMousePara select 0) == 1) then
		{
			RespMousePara set [0,0];
		};
	};
};