//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 2.1 - 2009    //
//--------------------------//
//    DAC_Config_Units      //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_TypNumber","_TempArray","_Unit_Pool_S","_Unit_Pool_V","_Unit_Pool_T","_Unit_Pool_A"];
_TypNumber = _this select 0;_TempArray = [];

switch (_TypNumber) do
{
//-------------------------------------------------------------------------------------------------
// OPFOR (A3)
  case 0:
  {
    _Unit_Pool_S = [
		"O_Soldier_F",
		"O_Soldier_lite_F",
		"O_Soldier_GL_F",
		"O_Soldier_AR_F",
		"O_Soldier_SL_F",
		"O_Soldier_TL_F",
		"O_soldier_M_F",
		"O_medic_F",
		"O_soldier_repair_F",
		"O_soldier_exp_F",
		"O_Soldier_A_F",
		"O_engineer_F",
		"O_officer_F"
	];
    _Unit_Pool_V = [
		"O_MRAP_02_F",
		"O_MRAP_02_hmg_F",
		"O_MRAP_02_gmg_F"
	];
    _Unit_Pool_T = [
		"O_APC_Wheeled_02_rcws_F",
		"O_MBT_02_cannon_F",
		"O_APC_Tracked_02_cannon_F"	
	];
    _Unit_Pool_A = [
		"O_Heli_Light_02_F",
		"O_Heli_Attack_02_F",
		"O_Heli_Attack_02_black_F",
		"O_Heli_Light_02_unarmed_F"		
	];
 };
//-------------------------------------------------------------------------------------------------
// BLUFOR (A3)
  case 1:
  {
    _Unit_Pool_S = [
		"B_engineer_F",
		"B_medic_F",
		"B_sniper_F",
		"B_Soldier_A_F",
		"B_soldier_AA_F",
		"B_soldier_AR_F",
		"B_soldier_AT_F",
		"B_soldier_exp_F",
		"B_Soldier_F",
		"B_Soldier_GL_F",
		"B_soldier_LAT_F",
		"B_Soldier_lite_F",
		"B_soldier_M_F",
		"B_soldier_repair_F",
		"B_Soldier_SL_F",
		"B_Soldier_TL_F",
		"B_spotter_F",
		"B_recon_exp_F",
		"B_recon_JTAC_F",
		"B_recon_M_F",
		"B_recon_medic_F",
		"B_recon_F",
		"B_recon_LAT_F",
		"B_recon_TL_F"
	];
    _Unit_Pool_V = [
		"B_MRAP_01_F",
		"B_Truck_01_covered_F",
		"B_Truck_01_transport_F",
		"B_Mortar_01_F"
	];
    _Unit_Pool_T = [
		"B_MRAP_01_gmg_F",
		"B_MRAP_01_hmg_F",
		"B_APC_Wheeled_01_cannon_F",
		"B_APC_Tracked_01_rcws_F"
	];
    _Unit_Pool_A = [
		"B_Heli_Attack_01_F",
		"B_Heli_Light_01_armed_F",
		"B_Heli_Light_01_F",
		"B_Heli_Transport_01_F",
		"B_Heli_Transport_01_camo_F"
	];
  };
//-------------------------------------------------------------------------------------------------
// IND (A3)
  case 2:
  {
    _Unit_Pool_S = [
		"I_G_Soldier_F",
		"I_G_Soldier_lite_F",
		"I_G_Soldier_SL_F",
		"I_G_Soldier_TL_F",
		"I_G_Soldier_AR_F",
		"I_G_medic_F",
		"I_G_engineer_F",
		"I_G_Soldier_exp_F",
		"I_G_Soldier_GL_F",
		"I_G_Soldier_M_F",
		"I_G_Soldier_A_F",
		"I_G_officer_F"
	];
    _Unit_Pool_V = [
		"I_G_Quadbike_01_F",
		"I_G_Van_01_transport_F",
		"I_G_Offroad_01_F"
	];
    _Unit_Pool_T = [
		"I_G_Offroad_01_armed_F"
	];
    _Unit_Pool_A = [
	];
  };

//-------------------------------------------------------------------------------------------------
  Default
  {
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