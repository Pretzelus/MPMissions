disableSerialization;
private ["_wX","_wY"];

_wX = _this select 0;
_wY = _this select 1;

if(_wY < 0) then
{
	if((RespCamPara select 1) < 50) then
	{
		RespCamPara set [1, ((RespCamPara select 1) + (1 + ((RespCamPara select 1) / (100 / 20))))];
	};
}
else
{
	if((RespCamPara select 1) > 2) then
	{
		RespCamPara set [1, ((RespCamPara select 1) - (1 + ((RespCamPara select 1) / (100 / 20))))];
	};
};