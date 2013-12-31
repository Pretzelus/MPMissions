disableSerialization;
private ["_curobj","_mX","_mY","_mO","_mL","_valX","_valY","_inc"];

_mX = _this select 0;_mY = _this select 1;_mL = _this select 2;_mO = _this select 3;
_curObj = player;_valX = 0;_valY = 0;_inc = 5;

if((RespMousePara select 0) == 1) then
{
	_valX = (((RespCamPara select 3) - _mY) * ((paramsarray select 3) * _inc));
	_valY = (((RespCamPara select 4) - _mL) * (((paramsarray select 3) / 2) * _inc));
	if((((RespCamPara select 2) + _valY) >= 1) && (((RespCamPara select 2) + _valY) <= 100)) then {RespCamPara set [2,((RespCamPara select 2) + _valY)]};
	Resp_Logic setdir (direction Resp_Logic - _valX);
	RespCamPara set [7,direction Resp_Logic];
};

RespCamPara set [3,_mY];RespCamPara set [4,_mL];