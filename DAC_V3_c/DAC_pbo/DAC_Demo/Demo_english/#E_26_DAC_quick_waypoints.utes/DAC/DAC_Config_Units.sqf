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
		_Unit_Pool_S = 	[
							
							"RU_Soldier_Crew","RU_Soldier_Pilot","RU_Soldier_SL","RU_Soldier","RU_Soldier_GL",
							"RU_Soldier_MG","RU_Soldier2","RU_Soldier_Medic","RU_Soldier_AT",
							"RU_Soldier_Sniper","RU_Soldier_AR","RU_Soldier_Marksman",
							"RUS_Soldier_Sab","RUS_Soldier_Marksman"	
						];

		_Unit_Pool_V = 	[	"UAZMG","UralOpen_INS","UAZ_RU","UAZ_AGS30_RU","BRDM2_INS","UAZ_MG_INS","GAZ_Vodnik_HMG","GAZ_Vodnik"];
		_Unit_Pool_T = 	[	"T72_RU","ZSU_INS","BMP3","2S6M_Tunguska","T90","BMP3","BTR90"];
		_Unit_Pool_A = 	[	"Mi17_rockets_RU","Ka52","Mi24_V","Mi24_P"];
	};
//-------------------------------------------------------------------------------------------------
	case 1:
	{
		_Unit_Pool_S = 	[
							"USMC_Soldier_Crew","USMC_Soldier_Pilot","USMC_Soldier_SL","USMC_Soldier_HAT",
							"USMC_Soldier_AR","USMC_Soldier_Medic","USMC_Soldier_MG","USMC_Soldier_GL",
							"USMC_Soldier_AT","USMC_Soldier_LAT","USMC_SoldierS_Sniper","USMC_SoldierS_SniperH","USMC_SoldierS_Spotter",
							"USMC_SoldierS_Engineer","USMC_SoldierM_Marksman","USMC_Soldier_TL","USMC_Soldier_MG"
							
						];
		_Unit_Pool_V = 	[	"HMMWV","HMMWV_M2","MTVR","HMMWV_MK19","HMMWV_Armored","MTVR","LAV25","HMMWV_TOW","HMMWV_Avenger"];
		_Unit_Pool_T =	[	"M1A1","LAV25","M1A2_TUSK_MG","MLRS","AAV"];
		_Unit_Pool_A = 	[	"AH1Z","UH1Y","MH60S"];
	};
//-------------------------------------------------------------------------------------------------
	case 2:
	{
		_Unit_Pool_S = 	[
							"GUE_Soldier_Crew","GUE_Soldier_Pilot","GUE_Soldier_CO","GUE_Soldier_Medic",
							"GUE_Soldier_1","GUE_Soldier_2","GUE_Soldier_3","GUE_Soldier_AR","GUE_Soldier_MG",
							"GUE_Soldier_AT","GUE_Soldier_AA","GUE_Soldier_GL",
							"GUE_Soldier_Sniper","GUE_Soldier_Sab","GUE_Soldier_Scout"
						];
		_Unit_Pool_V = 	[	"Offroad_DSHKM_INS","Pickup_PK_INS","UAZ_INS","UAZ_AGS30_INS","UAZ_MG_INS","UAZ_SPG9_INS","Ural_INS","UralOpen_INS","Ural_ZU23_INS"];
		_Unit_Pool_T = 	[	"BMP2_INS","BRDM2_INS","BRDM2_ATGM_INS","T72_INS","ZSU_INS"];
		_Unit_Pool_A = 	[	"Mi17_MG","Ka52","Mi17_MG","Mi24_V","Mi24_D","mi171_Sh","Mi17","Mi24_P","Mi_8T_Hip_C"];
	};
//-------------------------------------------------------------------------------------------------
	case 3:
	{
		_Unit_Pool_S = 	[
							"Citizen1","Citizen2","Citizen3","Citizen4",
							"Woodlander1","Woodlander2","Woodlander3","Woodlander4",
							"Profiteer1","Profiteer2","Profiteer3","Profiteer4",
							"Rocker1","Rocker2","Rocker3","Rocker4",
							"Woodlander1","Woodlander2","Woodlander3","Woodlander4",
							"Villager1","Villager2","Villager3","Villager4"
						];
		_Unit_Pool_V = 	[	"datsun1_civil_2_covered","hilux1_civil_1_open","UralCivil","SkodaBlue","Bus_city","car_sedan","SkodaRed","Skoda","SkodaGreen","datsun1_civil_3_open","car_hatchback"];
		_Unit_Pool_T = 	[	"Tractor","UralCivil","	UralCivil2"];
		_Unit_Pool_A = 	[];
	};
//-------------------------------------------------------------------------------------------------
	case 4:
	{
		_Unit_Pool_S = 	[
							"FR_TL","FR_TL","FR_TL","FR_AC","FR_GL","FR_Commander",
							"FR_Miles","FR_OHara","FR_Rodriguez","FR_R","FR_Corpsman","FR_Marksman",
							"FR_AR","FR_Sapper","FR_Assault_R","FR_Assault_GL","FR_Sykes"
						];
		_Unit_Pool_V = 	[	"HMMWV","HMMWV_M2","MTVR","HMMWV_MK19","HMMWV_Armored","MTVR","LAV25","HMMWV_TOW","M1030","HMMWV_Avenger"];
		_Unit_Pool_T =	[	"M1A1","LAV25","M1A2_TUSK_MG","MLRS","AAV"];
		_Unit_Pool_A = 	[	"AH1Z","UH1Y","MH60S"];
	};
//-------------------------------------------------------------------------------------------------
	case 5:
	{
		_Unit_Pool_S = 	[
							"CDF_Soldier_Crew","CDF_Soldier_Pilot","CDF_Soldier_Officer","CDF_Soldier_SL",
							"CDF_Soldier_Spotter","CDF_Commander","CDF_Soldier_GL","CDF_Soldier_AR",
							"CDF_Soldier_Strela","CDF_Soldier_MG","CDF_Soldier_Militia","CDF_Soldier_RPG",
							"CDF_Soldier_Engineer","CDF_Soldier_Medic",
							"CDF_Soldier","CDF_Soldier_Sniper","CDF_Soldier_Marksman"
						];
		_Unit_Pool_V = 	[	"UAZ_CDF","UAZ_AGS30_CDF","UAZ_MG_CDF","Ural_CDF","UralOpen_CDF","Ural_ZU23_CDF"];
		_Unit_Pool_T = 	[	"BMP2_CDF","BRDM2_CDF","BRDM2_ATGM_CDF","T72_CDF","ZSU_CDF"];
		_Unit_Pool_A = 	[	"Mi17_CDF","Mi24_D"];
	};
//-------------------------------------------------------------------------------------------------
	case 6:
	{
		_Unit_Pool_S = 	[
							"Ins_Soldier_Crew","Ins_Soldier_Pilot","Ins_Commander","Ins_Soldier_GL","Ins_Soldier_AR",
							"Ins_Soldier_AA","Ins_Soldier_MG","Ins_Soldier_CO","Ins_Soldier_AT",
							"Ins_Soldier_Sab","Ins_Soldier_Medic","Ins_Soldier_Sappe",
							"Ins_Soldier_1","Ins_Bardak","Ins_Soldier_2","Ins_Soldier_Sniper"
						];
		_Unit_Pool_V = 	[	"UAZ_INS","UAZ_AGS30_INS","UAZ_SPG9_INS","UAZ_MG_INS","Ural_INS","UralOpen_INS","Ural_ZU23_INS"];
		_Unit_Pool_T = 	[	"BMP2_INS","BRDM2_INS","BRDM2_ATGM_INS","T72_INS","ZSU_INS"];
		_Unit_Pool_A = 	[	"Mi17_Ins"];
	};
//-------------------------------------------------------------------------------------------------
	case 7:
	{
		_Unit_Pool_S = 	[
							"BWMod_CrewG","BWMod_CrewG","BWMod_SquadLeaderG","BWMod_ATSoldierG","BWMod_EngineerG",
							"BWMod_SniperG_G82","BWMod_MedicG","BWMod_RiflemanG","BWMod_MGunnerG_MG3",
							"BWMod_RiflemanG","BWMod_MGunnerG_MG3"
						];
		_Unit_Pool_V = 	[	"BWMod_Fuchs"];
		_Unit_Pool_T = 	[	"BWMod_Fuchs_ArmoredTurret","BWMod_Leopard_2A6","BWMod_Fuchs_ArmoredTurret"];
		_Unit_Pool_A = 	[	"AH1Z","UH1Y","MH60S"];
	};
//-------------------------------------------------------------------------------------------------
	Default {
				if(DAC_Basic_Value != 5) then
				{
					DAC_Basic_Value = 5;publicvariable "DAC_Basic_Value";
					hintc "Error: DAC_Config_Units > No valid config number";
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