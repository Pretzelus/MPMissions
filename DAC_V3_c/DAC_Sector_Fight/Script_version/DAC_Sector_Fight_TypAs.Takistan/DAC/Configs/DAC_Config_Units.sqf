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
							"TK_Soldier_Crew_EP1","TK_Soldier_Pilot_EP1","TK_Soldier_SL_EP1","TK_Soldier_EP1",
							"TK_Soldier_B_EP1","TK_Soldier_LAT_EP1","TK_Soldier_AT_EP1","TK_Soldier_AA_EP1",
							"TK_Soldier_AAT_EP1","TK_Soldier_AMG_EP1","TK_Soldier_HAT_EP1","TK_Soldier_AR_EP1",
							"TK_Soldier_Engineer_EP1","TK_Soldier_GL_EP1","TK_Soldier_MG_EP1","TK_Soldier_Medic_EP1",
							"TK_Soldier_Sniper_EP1","TK_Soldier_SniperH_EP1","TK_Soldier_Sniper_Night_EP1","TK_Soldier_Night_1_EP1",
							"TK_Soldier_Night_2_EP1","TK_Soldier_TWS_EP1","TK_Soldier_Spotter_EP1","TK_Special_Forces_MG_EP1",
							"TK_Special_Forces_EP1","TK_Special_Forces_TL_EP1"
						];
		_Unit_Pool_V = 	[	
							"LandRover_MG_TK_EP1","LandRover_SPG9_TK_EP1",
							"UAZ_Unarmed_TK_EP1","UAZ_AGS30_TK_EP1","UAZ_MG_TK_EP1","Ural_ZU23_TK_EP1",
							"V3S_TK_EP1","V3S_Open_TK_EP1"
						];
		_Unit_Pool_T = 	[
							"BMP2_TK_EP1","BMP2_HQ_TK_EP1","BRDM2_TK_EP1","BRDM2_ATGM_TK_EP1","BTR60_TK_EP1",
							"M113_TK_EP1","T34_TK_EP1","T55_TK_EP1","T72_TK_EP1","ZSU_TK_EP1"
						];
		_Unit_Pool_A = 	[	"Mi17_TK_EP1","Mi24_D_TK_EP1"	 ];
	};
//-------------------------------------------------------------------------------------------------
	case 1:
	{
		_Unit_Pool_S = 	[
							"US_Soldier_Crew_EP1","US_Soldier_Pilot_EP1","US_Soldier_Officer_EP1",
							"US_Soldier_EP1","US_Soldier_B_EP1","US_Soldier_AMG_EP1","US_Soldier_AAR_EP1","US_Soldier_AHAT_EP1","US_Soldier_AAT_EP1",
							"US_Soldier_Light_EP1","US_Soldier_GL_EP1","US_Soldier_TL_EP1","US_Soldier_AT_Base_EP1","US_Soldier_LAT_EP1",
							"US_Soldier_AT_EP1","US_Soldier_HAT_EP1","US_Soldier_AA_EP1","US_Soldier_Medic_EP1","US_Soldier_AR_EP1",
							"US_Soldier_MG_EP1","US_Soldier_Spotter_EP1","US_Soldier_Sniper_EP1","US_Soldier_Sniper_NV_EP1","US_Soldier_SniperH_EP1",
							"US_Soldier_Marksman_EP1","US_Soldier_Engineer_EP1"
							
						];
		_Unit_Pool_V = 	[	"HMMWV_Avenger","HMMWV_Avenger_DES_EP1"];
		_Unit_Pool_T =	[	
							"M1128_MGS_EP1","M1126_ICV_mk19_EP1","MLRS_DES_EP1","M6_EP1","M1130_CV_EP1",
							"M1129_MC_EP1","M1135_ATGMV_EP1","M1126_ICV_M2_EP1","M2A3_EP1","M2A2_EP1",
							"M1A1_US_DES_EP1","M1A2_US_TUSK_MG_EP1"
						];
		_Unit_Pool_A = 	[	
							"AH64D_EP1","AH6J_EP1","AH6X_EP1","MH6J_EP1","UH60M_EP1"
						];
	};
//---------------------------------------Taki Civilians (and goats) CIVI----------------------------------------------------------
	case 2:
	{
		_Unit_Pool_S = 	[
							"TK_INS_Soldier_EP1","TK_INS_Soldier_TL_EP1","TK_INS_Soldier_AA_EP1","TK_INS_Soldier_AR_EP1",
							"TK_INS_Bonesetter_EP1","TK_INS_Soldier_MG_EP1","TK_INS_Soldier_2_EP1","TK_INS_Soldier_EP1",
							"TK_INS_Soldier_4_EP1","TK_INS_Soldier_3_EP1","TK_INS_Soldier_AAT_EP1","TK_INS_Soldier_AT_EP1",
							"TK_INS_Soldier_Sniper_EP1"
						];
		_Unit_Pool_V = 	["LandRover_MG_TK_INS_EP1","LandRover_SPG9_TK_INS_EP1","Old_bike_TK_INS_EP1"	];
		_Unit_Pool_T = 	["BTR40_TK_INS_EP1","BTR40_MG_TK_INS_EP1"	 ];
		_Unit_Pool_A = 	[	 ];
	};
//---------------------------------------Taki Army (mixed) OPFOR----------------------------------------------------------
	case 3:
	{
		_Unit_Pool_S = 	[
							"TK_CIV_Takistani03_EP1","TK_CIV_Takistani02_EP1","TK_CIV_Takistani05_EP1",
							"TK_CIV_Takistani01_EP1","TK_CIV_Takistani04_EP1","TK_CIV_Takistani06_EP1",
							"TK_CIV_Worker02_EP1","TK_CIV_Worker01_EP1","TK_CIV_Woman01_EP1","TK_CIV_Woman02_EP1",
							"TK_CIV_Woman03_EP1","TK_CIV_Takistani03_EP1","TK_CIV_Takistani02_EP1","TK_CIV_Takistani05_EP1",
							"TK_CIV_Takistani01_EP1","TK_CIV_Takistani04_EP1","TK_CIV_Takistani06_EP1",
							"TK_CIV_Worker02_EP1","TK_CIV_Worker01_EP1","TK_CIV_Woman01_EP1","TK_CIV_Woman02_EP1",
							"TK_CIV_Woman03_EP1","Goat02_EP1","Goat01_EP1"
						];
		_Unit_Pool_V = 	[	
							"Ikarus_TK_CIV_EP1","Lada1_TK_CIV_EP1","Lada2_TK_CIV_EP1","LandRover_TK_CIV_EP1","Old_bike_TK_CIV_EP1",
							"TT650_TK_CIV_EP1","Old_bike_TK_CIV_EP1","Old_moto_TK_Civ_EP1","hilux1_civil_3_open_EP1",
							"S1203_TK_CIV_EP1","SUV_TK_CIV_EP1","UAZ_Unarmed_TK_CIV_EP1","Ural_TK_CIV_EP1","Old_bike_TK_CIV_EP1",
							"V3S_Open_TK_CIV_EP1","Volha_1_TK_CIV_EP1","Volha_2_TK_CIV_EP1","VolhaLimo_TK_CIV_EP1"
						];
		_Unit_Pool_T = 	[	 ];
		_Unit_Pool_A = 	[	 ];
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