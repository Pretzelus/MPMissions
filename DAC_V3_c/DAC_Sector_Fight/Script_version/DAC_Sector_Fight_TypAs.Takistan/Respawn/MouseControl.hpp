#define CT_STATIC       0
#define ST_CENTER 		0x02
#define ST_PICTURE		48
#define ProcTextWhite 	"#(argb,8,8,3)color(1,1,1,1)"

class xRscTextx
{
	access = ReadAndWrite;
	type = CT_STATIC;
	idc = -1;
	style = ST_CENTER;
	w = 0.1;
	h = 0.05;
	font = "BitStream";
	sizeEx = 0.016;
	colorBackground[] = {0, 0, 0, 0};
	colorText[]= {1,1,1,0.8};
	text = "";
};

class xRscActiveTextx
{
	access = ReadAndWrite;
	type = 11;
	style = ST_CENTER;
	x = -0.1; y = 0;
	w = 1.2; h = 1;
	font = "BitStream";
	sizeEx = 1;
	color[] = {0,0,0,1};
	colorActive[] = {0.84,1,0.55,1};
	soundEnter[] = {"", 0.1, 1};
	soundPush[] = {"", 0.1, 1};
	soundClick[] = {"", 0.1, 1};
	soundEscape[] = {"", 0.1, 1};
	text = "";
	default = 0;
};

class RespDlg
{
	idd = 100000;
	movingEnable = false;
	controlsBackground[] = {RespPlain,TimeInfo};

	class RespPlain: xRscActiveTextx
	{
			idc = 111;
			style = ST_PICTURE;
			x = -0.1; y = 0;
			w = 1.2; h = 1;
			text = ProcTextWhite;
			color[] = {0, 0, 0, 0};
			colorActive[] = {0, 0, 0, 0};
			onMouseMoving = "[_this select 0, _this select 1, _this select 2,1] execVM ""Respawn\MouseCtrl.sqf""";
			onMouseButtonDown= "[_this select 0,_this select 1,_this select 2,_this select 3,1] execVM ""Respawn\ButtonCtrl.sqf""";
			onMouseButtonUp= "[_this select 0,_this select 1,_this select 2,_this select 3,2] execVM ""Respawn\ButtonCtrl.sqf""";
			onMouseZChanged = "[_this select 0,_this select 1] execVM ""Respawn\WheelCtrl.sqf""";
	};
	class TimeInfo: xRscTextx
	{
		idc = 112; type = 0;style = ST_CENTER;
		colorText[]= {1,1,1,0};
		font = BitStream;
		SizeEx = 0.016;
		colorBackground[]= {0.3,0.3,0.3,0};
		x = 0.48; y = 0.005;
		w = 0.04; h = 0.020;
		text = "";
	};

	cobjects[] = { };
	controls[] = { };
};