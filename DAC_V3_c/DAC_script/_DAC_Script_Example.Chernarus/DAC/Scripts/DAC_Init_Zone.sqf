//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.0 - 2010    //
//--------------------------//
//    DAC__Init_Zone        //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

waituntil{format["%1",!isNil 'DAC_Basic_Value'] == "true"};
sleep (random 1);
if(DAC_Basic_Value > 0) then {exit};
if((count (_this select 5)) >= 6) then {DAC_Init_Camps = DAC_Init_Camps + ((_this select 5) select 0)};
_this execVM "DAC\Scripts\DAC_Create_Zone.sqf";