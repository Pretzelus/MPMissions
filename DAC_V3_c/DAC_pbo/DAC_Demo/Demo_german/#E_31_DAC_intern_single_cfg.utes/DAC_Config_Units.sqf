//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 2.1 - 2009    //
//--------------------------//
//    DAC_Config_Units      //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_TypNumber","_TempArray",
			"_Unit_Pool_S","_Unit_Pool_V","_Unit_Pool_T","_Unit_Pool_A"
		];

			_TypNumber = _this select 0;_TempArray = [];

switch (_TypNumber) do
{
//-------------------------------------------------------------------------------------------------
	case 0:
	{
		_Unit_Pool_S = 	[];
		_Unit_Pool_V = 	[];
		_Unit_Pool_T =	[];
		_Unit_Pool_A = 	[];
	};
//-------------------------------------------------------------------------------------------------
	case 1:
	{
		_Unit_Pool_S = 	[
							"USMC_Soldier_Crew","USMC_Soldier_Pilot","USMC_Soldier_SL","USMC_Soldier_HAT",
							"USMC_Soldier_AR","USMC_Soldier_Medic","USMC_Soldier_MG","USMC_Soldier_GL"
							
						];
		_Unit_Pool_V = 	[	"HMMWV"];
		_Unit_Pool_T =	[	"AAV"];
		_Unit_Pool_A = 	[	"AH1Z"];
	};
//-------------------------------------------------------------------------------------------------
	Default {
				if(DAC_Basic_Value != 5) then
				{
					DAC_Basic_Value = 5;publicvariable "DAC_Basic_Value";
					hintc format["DAC_Config_Units > No valid config number = %1",_TypNumber];
				};
				if(true) exitwith {};
			};
};

if(count _this == 2) then
{
	_TempArray = _TempArray + [_Unit_Pool_S,_Unit_Pool_V,_Unit_Pool_T,_Unit_Pool_A];
}
else
{
	_TempArray = _Unit_Pool_V + _Unit_Pool_T + _Unit_Pool_A;
};
_TempArray