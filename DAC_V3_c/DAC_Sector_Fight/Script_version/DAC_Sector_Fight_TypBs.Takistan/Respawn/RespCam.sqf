disableSerialization;
private ["_thisPos","_QPos","_dlg","_p","_r","_d","_a","_c","_curPos","_action","_camtype","_cp","_lpl"];

_thisPos = _this select 0;_camtype = 0;_cp = 0;_lpl = [];

if((typeName _thisPos) == "STRING") then
{
	Resp_Logic = "Logic" createvehiclelocal (call compile _thisPos);
	_camtype = 1;
}
else
{
	Resp_Logic = "Logic" createvehiclelocal (position player);
};

_curPos = position Resp_Logic;_action = 0;RespAction = 0;

showCinemaBorder false;

	_QPos = [(position Resp_Logic select 0) + 0.5,(position Resp_Logic select 1),(paramsarray select 3)];
	Resp_Cam = "camera" camCreate _QPos;
	Resp_Cam cameraEffect ["internal","back"];
	Resp_Cam camPrepareTarget Resp_Logic;
	Resp_Cam camPreparePos _QPos;
	Resp_Cam camPrepareFOV 0.7;
	Resp_Cam camCommitPrepared 0;

RespCamPara = [0,(paramsarray select 3),45,0,0,1,6,0];

RespMousePara = [0,0,0];
	
	_dlg  = createDialog "RespDlg";
	showPad false;
	showCompass false;
	showWatch false;
	showCinemaBorder false;
	player sidechat "Please wait and do not press [ESC]";
	
_d = "(RespCamPara select 1)";
_r = "((RespCamPara select 0) + ((RespCamPara select 7) * (RespCamPara select 5)))";
_a = "((RespCamPara select 2) + ((RespCamPara select 4) * (RespCamPara select 6)))";

if((paramsarray select 2) == 1) then
{
	if(_camtype == 0) then
	{
		while {_action == 0} do
		{
			if(!(ctrlvisible 111)) then
			{
				_action = 3;
			}
			else
			{
				if(RespAction == 2) then {_action = 2};
				if(RespAction == 3) then {_action = 3};
				_curPos = Resp_Logic modelToWorld [0,0,0];
				_p = [(_curPos select 0) + ((Sin (call compile _a)) * (Sin (call compile _r)) * (call compile _d)),(_curPos select 1) + ((Sin (call compile _a)) * (Cos (call compile _r)) * (call compile _d)),(cos (call compile _a) * (call compile _d)) + ((_curPos select 2) + 0.4)];
				Resp_Cam camSetPos _p;
				Resp_Cam camCommit 0.2;
				sleep 0.01;
			};
		};

		switch (_action) do
		{
			case 2:
			{
				sleep 0.1;
				closedialog 0;
				_p = (position Resp_Logic);
				Resp_Cam camSetPos _p;
				Resp_Cam camCommit 2;
				titleText ["Get ready . . .", "BLACK OUT",3];
				sleep 5;
				camDestroy Resp_Cam;
				deletevehicle Resp_Logic;
				titleText ["", "BLACK IN",2];
				player cameraEffect ["terminate","back"];
			};
			case 3:
			{
				sleep 0.1;
				camDestroy Resp_Cam;
				deletevehicle Resp_Logic;
				player cameraEffect ["terminate","back"];
			};
			Default {};
		};
	}
	else
	{
		while {_action == 0} do
		{
			_curPos = Resp_Logic modelToWorld [0,0,0];
			_p = [(_curPos select 0) + ((Sin (call compile _a)) * (Sin (call compile _r)) * (call compile _d)),(_curPos select 1) + ((Sin (call compile _a)) * (Cos (call compile _r)) * (call compile _d)),(cos (call compile _a) * (call compile _d)) + ((_curPos select 2) + 0.4)];
			Resp_Cam camSetPos _p;
			Resp_Cam camCommit 0.2;
			sleep 0.01;
			if(!(ctrlvisible 111)) then
			{
				_action = 1;
				closedialog 0;
				camDestroy Resp_Cam;
				deletevehicle Resp_Logic;
				player cameraEffect ["terminate","back"];
			};
		};
	};
}
else
{
	while {_action == 0} do
	{
		sleep 0.1;
		if(!(ctrlvisible 111)) then
		{
			_action = 1;
			closedialog 0;
			camDestroy Resp_Cam;
			deletevehicle Resp_Logic;
			player cameraEffect ["terminate","back"];
		};
	};
};