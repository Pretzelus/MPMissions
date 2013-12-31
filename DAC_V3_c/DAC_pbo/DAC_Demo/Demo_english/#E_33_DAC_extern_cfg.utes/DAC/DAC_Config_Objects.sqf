//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.0 - 2010    //
//--------------------------//
//    DAC_Config_Objects    //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_TypNumber","_TempArray","_Object_Pool"];

_TypNumber = _this select 0;_TempArray = [];

switch (_TypNumber) do
{
//-------------------------------------------------------------------------------------------------
	// use this config no. if you want to create positions only
	case 0:
	{
		_Object_Pool =	[
							12,
							["LOGIC",1,0,0,0,0,""]
						];
	};
//-------------------------------------------------------------------------------------------------
	case 1:
	{
		_Object_Pool =	[
							12,
							["MAP_c_fern",1,0,0,0,0,""],
							["MAP_c_fernTall",1,0,0,0,0,""],
							["MAP_c_GrassCrooked",0,0,0,0,0,""],
							["MAP_c_GrassCrookedForest",0,0,0,0,0,""],
							["MAP_c_GrassCrookedGreen",0,0,0,0,0,""]
						];
	};
//-------------------------------------------------------------------------------------------------
	case 2:
	{
		_Object_Pool =	[
							12,
							["MAP_c_picea",2,0,0,0,0,""],
							["MAP_b_betulaHumilis",2,0,0,0,0,""],
							["MAP_b_canina2s",3,0,0,0,0,""],
							["MAP_b_craet1",2,0,0,0,0,""],
							["MAP_b_pmugo",0,0,0,0,0,""],
							["MAP_b_prunus",2,0,0,0,0,""],
							["MAP_R2_Stone",5,0,0.1,0,0,""],
							["MAP_t_picea1s",1,0,0.03,0,0,""],
							["MAP_t_betula2f",0,0,0.05,0,0,""],
							["MAP_R2_Boulder1",5,0,0.05,0,0,""],
							["MAP_R2_Boulder2",5,0,0.05,0,0,""]
						];
	};
//-------------------------------------------------------------------------------------------------
	case 3:
	{
		_Object_Pool =	[
							12,
							["MAP_t_picea1s",2,0,0.05,0,0,""],
							["MAP_t_picea2s",2,0,0.05,0,0,""],
							["MAP_t_picea3f",2,0,0.05,0,0,""],
							["MAP_t_pinusN1s",1,0,0,0,0,""],
							["MAP_t_pinusN2s",2,0,0,0,0,""],
							["MAP_t_pinusS2f",1,0,0,0,0,""],
							["MAP_R2_Stone",5,0,0.1,0,0,""],
							["MAP_c_picea",5,0,0,0,0,""],
							["MAP_t_betula2f",1,0,0.05,0,0,""],
							["MAP_R2_Boulder1",2,0,0.05,0,0,""],
							["MAP_R2_Boulder2",1,0,0.05,0,0,""]
						];
	};
//-------------------------------------------------------------------------------------------------
	case 4:
	{
		_Object_Pool =	[
							12,
							["MAP_c_picea",4,0,0,0,0,""],
							["MAP_t_picea2s",1,0,0.05,0,0,""],
							["MAP_b_betulaHumilis",5,0,0,0,0,""],
							["MAP_b_canina2s",5,0,0,0,0,""],
							["MAP_b_craet1",5,0,0,0,0,""],
							["MAP_b_pmugo",2,0,0,0,0,""],
							["MAP_b_prunus",2,0,0,0,0,""],
							["MAP_misc_FallenTree2",1,0,0,0,0,""],
							["MAP_t_picea1s",4,0,0.03,0,0,""],
							["MAP_t_betula2f",1,0,0.05,0,0,""],
							["MAP_R2_Boulder1",5,0,0.05,0,0,""],
							["MAP_ruin_corner_1",1,0,0,0,1,""],
							["MAP_ruin_corner_2",1,0,0,0,1,""],
							["MAP_ruin_wall",1,0,0,0,1,""],
							["MAP_ruin_walldoor",1,0,0,0,1,""],
							["MAP_R2_Boulder2",5,0,0.05,0,0,""]
						];
	};
//-------------------------------------------------------------------------------------------------
	case 5:
	{
		_Object_Pool =	[
							12,
							["USBasicAmmunitionBox",1,0,0,0,0,""],
							["USLaunchersBox",1,0,0,0,0,""],
							["USOrdnanceBox",1,0,0,0,0,""],
							["USBasicWeaponsBox",1,0,0,0,0,""],
							["USSpecialWeaponsBox",1,0,0,0,0,""],
							["USVehicleBox",1,0,0,0,0,""],
							["RUBasicAmmunitionBox",1,0,0,0,0,""],
							["RULaunchersBox",1,0,0,0,0,""],
							["RUOrdnanceBox",1,0,0,0,0,""],
							["RUBasicWeaponsBox",1,0,0,0,0,""],
							["RUSpecialWeaponsBox",1,0,0,0,0,""],
							["RUVehicleBox",1,0,0,0,0,""],
							["LocalBasicAmmunitionBox",1,0,0,0,0,""],
							["LocalBasicWeaponsBox",1,0,0,0,0,""],
							["GuerillaCacheBox",1,0,0,0,0,""],
							["SpecialWeaponsBox",1,0,0,0,0,""]
						];
	};
//-------------------------------------------------------------------------------------------------
	case 6:
	{
		_Object_Pool =	[
							12,
							["MAP_cihlovej_dum_in",2,0,0,0,1,""],
							["hruzdum",2,0,0,0,1,""],
							["MAP_deutshe_mini",2,0,0,0,1,""],
							["MAP_dum_m2",2,0,0,0,1,""],
							["MAP_sara_domek_ruina",2,0,0,0,1,""],
							["MAP_sara_domek_sedy",2,0,0,0,1,""],
							["MAP_Statek_kulna",2,0,0,0,1,""],
							["MAP_hut06",1,0,0,0,1,""],
							["MAP_Shed_W01",1,0,0,0,1,""],
							["MAP_Shed_W02",1,0,0,0,1,""],
							["MAP_Shed_W03",1,0,0,0,1,""]
						];
	};
//-------------------------------------------------------------------------------------------------
	case 7:
	{
		_Object_Pool =	[
							12,
							["MAP_dum_mesto2",1,0,1,0,0,""],
							["MAP_dum_mesto_in",1,0,1,0,0,""]
						];
	};
//-------------------------------------------------------------------------------------------------
	case 8:
	{
		_Object_Pool =	[
							15,
							["MAP_t_picea1s",3,0,0.05,0,0,""],
							["MAP_t_picea2s",3,0,0.05,0,0,""],
							["MAP_t_picea3f",3,0,0.05,0,0,""],
							["MAP_R2_Stone",8,0,0.1,0,0,""],
							["MAP_c_picea",3,0,0,0,0,""],
							["MAP_b_betulaHumilis",8,0,0,0,0,""],
							["MAP_b_canina2s",8,0,0,0,0,""],
							["MAP_b_craet1",8,0,0,0,0,""],
							["MAP_b_pmugo",7,0,0,0,0,""],
							["MAP_b_prunus",3,0,0,0,0,""],
							["MAP_t_betula2f",2,0,0.05,0,0,""],
							["MAP_R2_Boulder1",3,0,0.05,0,0,""],
							["MAP_R2_Boulder2",3,0,0.05,0,0,""],
							["MAP_R2_RockWall",1,0,0,-30,0,""]
						];
	};
//-------------------------------------------------------------------------------------------------
	case 9:
	{
		_Object_Pool =	[
							12,
							["MAP_t_picea1s",5,0,0.05,0,0,""],
							["MAP_t_picea2s",2,0,0.05,0,0,""],
							["MAP_t_picea3f",2,0,0.05,0,0,""],
							["MAP_t_pinusN1s",1,0,0,0,0,""],
							["MAP_t_pinusN2s",2,0,0,0,0,""],
							["MAP_t_pinusS2f",1,0,0,0,0,""],
							["MAP_R2_Stone",5,0,0.1,0,0,""],
							["MAP_R2_RockWall",1,0,0,-30,0,""],
							["MAP_t_betula2f",1,0,0.05,0,0,""],
							["MAP_R2_Boulder1",5,0,0.05,0,0,""],
							["MAP_R2_Boulder2",5,0,0.05,0,0,""]
						];
	};
//-------------------------------------------------------------------------------------------------
	Default {
				if(DAC_Basic_Value != 5) then
				{
					DAC_Basic_Value = 5;publicvariable "DAC_Basic_Value";
					hintc "Error: DAC_Config_Objects > No valid config number";
				};
				if(true) exitwith {};
			};
};

_TempArray = _Object_Pool;
_TempArray