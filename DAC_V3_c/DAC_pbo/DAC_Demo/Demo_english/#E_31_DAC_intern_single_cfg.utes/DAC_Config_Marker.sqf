//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.0 - 2010    //
//--------------------------//
//    DAC_Config_Marker     //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_MarkerConfig","_MarkerSet","_s","_setShowZones","_setShowWPs","_setShowUnit","_setGroupType",
			"_setMarkerText","_setMarkerDel","_setMarkerRefresh","_setSizeWpLine","_setSizeLeaderLine",
			"_setSizeZoneLine","_setSizeCampLine","_setSizeZoneBorder","_setArtiMarker","_setCampMarker",
			"_setMarkerClass","_setSideColor","_MarkerValues"
		];

_MarkerSet = 	[
					"_setShowZones","_setShowWPs","_setShowUnit","_setGroupType","_setMarkerText",
					"_setMarkerDel","_setMarkerRefresh","_setSizeWpLine","_setSizeLeaderLine",
					"_setSizeZoneLine","_setSizeCampLine","_setSizeZoneBorder","_setArtiMarker",
					"_setCampMarker","_setSideColor","_setMarkerClass"
				];

					_MarkerConfig = _this select 0;_MarkerValues = [0];_s = 0;

if(_MarkerConfig == 0) exitwith {};

switch (_MarkerConfig) do
{
//-----------------------------------------------------------------------------------------------
	case 1:	
	{		
				_setShowZones 		= 0;
				_setShowWPs 		= 0;
				_setShowUnit 		= [1,1,1,1];
				_setGroupType 		= 1;
				_setMarkerText		= ["if(format[""%1"",_group] == ""<NULL-group>"") then {format[""<--- %1"",typeof _unit]} else {format[""%1"",count units _group]}"];
				_setMarkerDel 		= 0;
				_setMarkerRefresh 	= [0.2,0.2];
				_setSizeWpLine 		= [0,0];
				_setSizeLeaderLine 	= 0;
				_setSizeZoneLine 	= 0;
				_setSizeCampLine 	= 0;
				_setSizeZoneBorder 	= 1;
				_setArtiMarker 		= 1;
				_setCampMarker 		= 2;
				_setSideColor 		= [
										"ColorRed",
										"ColorBlue",
										"ColorYellow",
										"ColorGreen",
										"ColorWhite",
										"ColorBlack",
										"ColorGreen",
										"ColorBlack"
									  ];
				_setMarkerClass		= [
										[
											["STATICWEAPON","Dot",[0.5,0.5],1]
										],
										[
											["MAN","mil_triangle",[0.6,0.6],1]
										],
										[
											["CAR","mil_box",[0.5,0.8],1],
											["TRUCK","mil_box",[0.5,0.9],1]
										],
										[
											["TANK","mil_box",[0.6,1.2],1],
											["APC","mil_box",[0.6,1.2],1]
										],
										[
											["MOTORCYCLE","Dot",[0.3,0.7],1]
										],
										[
											["AIR","mil_triangle",[0.7,1.5],1],
											["HELICOPTER","mil_triangle",[0.7,1.5],1],
											["PLANE","mil_triangle",[0.9,1.5],1],
											["ParachuteBase","mil_triangle",[0.9,0.3],1]
										],
										[
											["SHIP","Dot",[0.9,1.3],1]
										],
										[
											["OTHER","Dot",[0.7,0.7],1]
										]
									  ];
	};
//-----------------------------------------------------------------------------------------------
	Default 
	{
				if(DAC_Basic_Value != 5) then
				{
					DAC_Basic_Value = 5;publicvariable "DAC_Basic_Value";
					hintc "Error: DAC_Config_Waypoints > No valid config number";
				};
				if(true) exitwith {};
	};
};

while{_s < count _MarkerSet} do
{
	_MarkerValues set[_s, (call compile (_MarkerSet select _s))];
	_s = _s + 1;
};
_MarkerValues