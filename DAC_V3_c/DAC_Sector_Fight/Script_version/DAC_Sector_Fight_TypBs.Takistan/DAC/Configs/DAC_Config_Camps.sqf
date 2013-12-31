//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.0 - 2010    //
//--------------------------//
//    DAC_Config_Camps      //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_CampTyp","_campBasic","_campAmmo","_campStatic","_campWall","_campObjInit",
			"_campUserObj","_campAddUnit","_campRandomObj","_Unit_Pool_C","_array"
		];

			_CampTyp = _this select 0;_array = [];

switch (_CampTyp) do
{
//-------------------------------------------------------------------------------------------------------------------------
	case 0:
	{
		_campBasic     = ["FlagCarrierOPFOR_EP1",["Land_Campfire_burning",8,5,0],["CampEAST_EP1",5,0,0],["Logic",10,15,0],0];
		_campAmmo      = [["TKBasicWeaponsBox_EP1",10,2,0],["TKLaunchersBox_EP1",10,0,0],["TKSpecialWeaponsBox_EP1",10,-2,0],["TKBasicAmmunitionBox_EP1",10,-4,0]];
		_campStatic    = [["D30_TK_GUE_EP1",-7,25,0,"TK_Soldier_GL_EP1"],["D30_TK_GUE_EP1",25,25,0,"TK_Soldier_GL_EP1"],["D30_TK_GUE_EP1",25,-20,180,"TK_Soldier_GL_EP1"],["D30_TK_GUE_EP1",-7,-20,180,"TK_Soldier_GL_EP1"]];
		_campAddUnit   = [];
		_campUserObj   = [["Land_Antenna",5,-5,45]];
		_campRandomObj = [];
		_campWall      = ["Land_BagFenceLong",[-10,30],[40,56,0],[5,5,5,5],[1,0.2],[0,0]];
		_campObjInit   = [[],[],[],[],[],[],[]];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 1:
	{
		_campBasic     = ["FlagCarrierBLUFOR_EP1",["Land_Campfire_burning",8,5,0],["Camp_EP1",5,0,0],["Logic",10,15,0],0];
		_campAmmo      = [["USLaunchersBox_EP1",10,2,0],["USSpecialWeaponsBox_EP1",10,0,0],["USBasicAmmunitionBox_EP1",10,-2,0],["USBasicWeaponsBox_EP1",10,-4,0]];
		_campStatic    = [["M119_US_EP1",-7,25,0,"US_Soldier_GL_EP1"],["M119_US_EP1",25,25,0,"US_Soldier_GL_EP1"],["M119_US_EP1",25,-20,180,"US_Soldier_GL_EP1"],["M119_US_EP1",-7,-20,180,"US_Soldier_GL_EP1"]];
		_campAddUnit   = [];
		_campUserObj   = [["Land_Antenna",5,-5,45]];
		_campRandomObj = [];
		_campWall      = ["Land_BagFenceLong",[-10,30],[40,56,0],[5,5,5,5],[1,0.2],[0,0]];
		_campObjInit   = [[],[],[],[],[],[],[]];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 0:
	{
		_campBasic     = ["FlagCarrierRU_EP1",["Land_Campfire_burning",8,5,0],["CampEAST_EP1",5,0,0],["Logic",10,15,0],0];
		_campAmmo      = [["TKBasicWeaponsBox_EP1",10,2,0],["TKLaunchersBox_EP1",10,0,0],["TKSpecialWeaponsBox_EP1",10,-2,0],["TKBasicAmmunitionBox_EP1",10,-4,0]];
		_campStatic    = [["D30_TK_GUE_EP1",-7,25,0,"TK_Soldier_GL_EP1"],["D30_TK_GUE_EP1",25,25,0,"TK_Soldier_GL_EP1"],["D30_TK_GUE_EP1",25,-20,180,"TK_Soldier_GL_EP1"],["D30_TK_GUE_EP1",-7,-20,180,"TK_Soldier_GL_EP1"]];
		_campAddUnit   = [];
		_campUserObj   = [["Land_Antenna",5,-5,45]];
		_campRandomObj = [];
		_campWall      = ["Land_BagFenceLong",[-10,30],[40,56,0],[5,5,5,5],[1,0.2],[0,0]];
		_campObjInit   = [[],[],[],[],[],[],[]];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 11:
	{
		_campBasic     = ["NULL"];
		_campAmmo      = [];
		_campStatic    = [];
		_campAddUnit   = [];
		_campUserObj   = [];
		_campRandomObj = [];
		_campWall      = [];
		_campObjInit   = [[],[],[],[],[],[],[]];
	};
//-------------------------------------------------------------------------------------------------------------------------
	Default {
				if(DAC_Basic_Value != 5) then
				{
					DAC_Basic_Value = 5;publicvariable "DAC_Basic_Value";
					hintc "Error: DAC_Config_Camps > No valid config number";
				};
				if(true) exitwith {};
			};
};

_array = [_campBasic,_campAmmo,_campStatic,_campAddUnit,_campUserObj,_campRandomObj,_campWall,_campObjInit];
_array
