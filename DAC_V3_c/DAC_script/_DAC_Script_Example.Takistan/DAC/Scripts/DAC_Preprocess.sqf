//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.0 - 2010    //
//--------------------------//
//    DAC_Preprocess        //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

DAC_Path = "DAC\Configs\";

	DAC_fChangeZone      		= compile preprocessFile "DAC\Scripts\DAC_Change_Zone.sqf";
	DAC_fNewWaypoints   		= compile preprocessFile "DAC\Scripts\DAC_New_Waypoints.sqf";
	DAC_fAISpeak        		= compile preprocessFile "DAC\Scripts\DAC_AISpeak.sqf";
	DAC_fAIRadio        		= compile preprocessFile "DAC\Scripts\DAC_AIRadio.sqf";
	DAC_fClientSpeak    		= compile preprocessFile "DAC\Scripts\DAC_ClientSpeak.sqf";
	DAC_fClientRadio    		= compile preprocessFile "DAC\Scripts\DAC_ClientRadio.sqf";
	DAC_fClientSayer    		= compile preprocessFile "DAC\Scripts\DAC_ClientSayer.sqf";
	DAC_fClientCheck    		= compile preprocessFile "DAC\Scripts\DAC_ClientCheck.sqf";
	DAC_fSectorCheck    		= compile preprocessFile "DAC\Scripts\DAC_Sector_Check.sqf";
	DAC_fMoveToBuilding 		= compile preprocessFile format["DAC\AI_%1\DAC_Move_to_Building.sqf",DAC_AI_AddOn];
	DAC_fMoveToWaypoint 		= compile preprocessFile format["DAC\AI_%1\DAC_Move_to_WP.sqf",DAC_AI_AddOn];
	DAC_fMoveToEnemy    		= compile preprocessFile format["DAC\AI_%1\DAC_Move_to_Enemy.sqf",DAC_AI_AddOn];
	DAC_fMoveRandom     		= compile preprocessFile format["DAC\AI_%1\DAC_Move_Random.sqf",DAC_AI_AddOn];
	DAC_fMoveToVH       		= compile preprocessFile format["DAC\AI_%1\DAC_Move_to_VH.sqf",DAC_AI_AddOn];
	DAC_fMoveToFriendly 		= compile preprocessFile format["DAC\AI_%1\DAC_Move_to_Friendly.sqf",DAC_AI_AddOn];
	DAC_fMoveWithVH     		= compile preprocessFile format["DAC\AI_%1\DAC_Move_with_VH.sqf",DAC_AI_AddOn];
	DAC_fMoveSimple     		= compile preprocessFile format["DAC\AI_%1\DAC_Move_Simple.sqf",DAC_AI_AddOn];
	DAC_fAddBehaviour     		= compile preprocessFile format["DAC\AI_%1\DAC_Add_Behaviour.sqf",DAC_AI_AddOn];
	DAC_fScanBuilding   		= compile preprocessFile format["DAC\AI_%1\DAC_Scan_Buildings.sqf",DAC_AI_AddOn];
	DAC_fHoldBuilding   		= compile preprocessFile format["DAC\AI_%1\DAC_Hold_Building.sqf",DAC_AI_AddOn];
	DAC_fHoldArtiGroup  		= compile preprocessFile format["DAC\AI_%1\DAC_Hold_ArtiGroup.sqf",DAC_AI_AddOn];
	DAC_fCallArti       		= compile preprocessFile format["DAC\AI_%1\DAC_Call_Arti.sqf",DAC_AI_AddOn];
	DAC_fHitByEnemy     		= compile preprocessFile format["DAC\AI_%1\DAC_Hit_by_Enemy.sqf",DAC_AI_AddOn];
	DAC_fCheckTarget     		= compile preprocessFile format["DAC\AI_%1\DAC_Check_Target.sqf",DAC_AI_AddOn];
	DAC_fCheckNewTarget    		= compile preprocessFile format["DAC\AI_%1\DAC_Check_NewTarget.sqf",DAC_AI_AddOn];
	DAC_fWaitForHelp			= compile preprocessFile format["DAC\AI_%1\DAC_Wait_for_Help.sqf",DAC_AI_AddOn];
	DAC_fSmokeGren				= compile preprocessFile format["DAC\AI_%1\DAC_Smoke_Gren.sqf",DAC_AI_AddOn];
	DAC_fRouteMarker    		= compile preprocessFile "DAC\Marker\DAC_RouteMarker.sqf";
	DAC_fLeaderMarker   		= compile preprocessFile "DAC\Marker\DAC_LeaderMarker.sqf";
	DAC_fDelPlayer      		= compile preprocessFile "DAC\Scripts\DAC_Del_Player.sqf";
	DAC_fDeleteUnit     		= compile preprocessFile "DAC\Scripts\DAC_Delete_Unit.sqf";
	DAC_fSumWaypoints   		= compile preprocessFile "DAC\Scripts\DAC_Sum_Waypoints.sqf";
	DAC_fFindMClass     		= compile preprocessFile "DAC\Scripts\DAC_Find_MClass.sqf";
	DAC_fCheckCargo     		= compile preprocessFile format["DAC\AI_%1\DAC_Check_Cargo.sqf",DAC_AI_AddOn];
	DAC_fVehicleArray     		= compile preprocessFile format["DAC\AI_%1\DAC_Vehicle_Array.sqf",DAC_AI_AddOn];
	DAC_fGroupGetin     		= compile preprocessFile format["DAC\AI_%1\DAC_Group_Getin.sqf",DAC_AI_AddOn];
	DAC_fCallHelp       		= compile preprocessFile format["DAC\AI_%1\DAC_Call_Help.sqf",DAC_AI_AddOn];
	DAC_fCheckCrew      		= compile preprocessFile format["DAC\AI_%1\DAC_Check_Crew.sqf",DAC_AI_AddOn];
	DAC_fLeaveVehicle   		= compile preprocessFile format["DAC\AI_%1\DAC_Leave_Vehicle.sqf",DAC_AI_AddOn];
	DAC_fSetBehaviour   		= compile preprocessFile format["DAC\AI_%1\DAC_Set_Behaviour.sqf",DAC_AI_AddOn];
	DAC_fFlashMarker    		= compile preprocessFile "DAC\Marker\DAC_FlashMarker.sqf";
	DAC_fResizeMarker   		= compile preprocessFile "DAC\Marker\DAC_ResizeMarker.sqf";
	DAC_fFindGroup      		= compile preprocessFile format["DAC\AI_%1\DAC_Find_Group.sqf",DAC_AI_AddOn];
	DAC_fFindVehicle    		= compile preprocessFile format["DAC\AI_%1\DAC_Find_Vehicle.sqf",DAC_AI_AddOn];
	DAC_fEnterVehicle   		= compile preprocessFile format["DAC\AI_%1\DAC_Enter_Vehicle.sqf",DAC_AI_AddOn];
	DAC_fEnterGun		   		= compile preprocessFile format["DAC\AI_%1\DAC_Enter_Gun.sqf",DAC_AI_AddOn];
	DAC_fWaitingForEnd  		= compile preprocessFile format["DAC\AI_%1\DAC_Waiting_For_End.sqf",DAC_AI_AddOn];
	DAC_fSomeConditions 		= compile preprocessFile format["DAC\AI_%1\DAC_Some_Conditions.sqf",DAC_AI_AddOn];
	DAC_fSimpleConditions 		= compile preprocessFile format["DAC\AI_%1\DAC_Simple_Conditions.sqf",DAC_AI_AddOn];
	DAC_fOtherConditions		= compile preprocessFile format["DAC\AI_%1\DAC_Other_Conditions.sqf",DAC_AI_AddOn];
	DAC_fHeliConditions	    	= compile preprocessFile format["DAC\AI_%1\DAC_Heli_Conditions.sqf",DAC_AI_AddOn];
	DAC_fEnemyCond      		= compile preprocessFile format["DAC\AI_%1\DAC_Enemy_Conditions.sqf",DAC_AI_AddOn];
	DAC_fCommandUnit    		= compile preprocessFile format["DAC\AI_%1\DAC_Command_Unit.sqf",DAC_AI_AddOn];
	DAC_fFindPos        		= compile preprocessFile "DAC\Scripts\DAC_Find_Pos.sqf";
	DAC_fGetWaypoints      		= compile preprocessFile "DAC\Scripts\DAC_Get_Waypoints.sqf";
	DAC_fSetWaypoints      		= compile preprocessFile "DAC\Scripts\DAC_Set_Waypoints.sqf";
	DAC_fDeleteObject   		= compile preprocessFile "DAC\Scripts\DAC_Delete_Object.sqf";
	DAC_fRemoveGroup    		= compile preprocessFile format["DAC\AI_%1\DAC_Remove_Group.sqf",DAC_AI_AddOn];
	DAC_fReduceGroup    		= compile preprocessFile "DAC\Scripts\DAC_Reduce_Group.sqf";
	DAC_fAddGroup	    		= compile preprocessFile "DAC\Scripts\DAC_Add_Group.sqf";
	DAC_fInsertGroup    		= compile preprocessFile "DAC\Scripts\DAC_Insert_Group.sqf";
	DAC_fReleaseGroup    		= compile preprocessFile "DAC\Scripts\DAC_Release_Group.sqf";
	DAC_fCreateCamp     		= compile preprocessFile "DAC\Scripts\DAC_Create_Camp.sqf";
	DAC_fUnitMarker     		= compile preprocessFile "DAC\Marker\DAC_UnitMarker.sqf";
	DAC_fGroupMarker     		= compile preprocessFile "DAC\Marker\DAC_GroupMarker.sqf";
	DAC_fInsertVehicle  		= compile preprocessFile "DAC\Scripts\DAC_Insert_Vehicle.sqf";
	DAC_fShowRadio      		= compile preprocessFile "DAC\Scripts\DAC_Show_Radio.sqf";
	DAC_fConfigUnits    		= compile preprocessFile format["%1DAC_Config_Units.sqf",DAC_Path];
	DAC_fConfigWeapons    		= compile preprocessFile format["%1DAC_Config_Weapons.sqf",DAC_Path];
	DAC_fConfigBehav    		= compile preprocessFile format["%1DAC_Config_Behaviour.sqf",DAC_Path];
	DAC_fConfigCamps    		= compile preprocessFile format["%1DAC_Config_Camps.sqf",DAC_Path];
	DAC_fConfigWP       		= compile preprocessFile format["%1DAC_Config_Waypoints.sqf",DAC_Path];
	DAC_fConfigObj       		= compile preprocessFile format["%1DAC_Config_Objects.sqf",DAC_Path];
	DAC_fConfigMarker   		= compile preprocessFile format["%1DAC_Config_Marker.sqf",DAC_Path];
	DAC_fConfigArti		   		= compile preprocessFile format["%1DAC_Config_Arti.sqf",DAC_Path];
	DAC_fConfigEvents       	= compile preprocessFile format["%1DAC_Config_Events.sqf",DAC_Path];
	DAC_fConfigSound			= compile preprocessFile format["%1DAC_Config_Sound.sqf",DAC_Path];
	DAC_fArtiConditions 		= compile preprocessFile format["DAC\AI_%1\DAC_Arti_Conditions.sqf",DAC_AI_AddOn];
	DAC_fArtiFire       		= compile preprocessFile format["DAC\AI_%1\DAC_Arti_Fire.sqf",DAC_AI_AddOn];
	DAC_fFindCover	    		= compile preprocessFile format["DAC\AI_%1\DAC_Find_Cover.sqf",DAC_AI_AddOn];
	DAC_fForceSpeed	    		= compile preprocessFile format["DAC\AI_%1\DAC_Force_Speed.sqf",DAC_AI_AddOn];
	DAC_fFindPolyLog			= compile preprocessFile "DAC\Scripts\DAC_Find_PolyLog.sqf";
	DAC_fFindWpLog				= compile preprocessFile "DAC\Scripts\DAC_Find_WpLog.sqf";
	DAC_fFindPolyPos			= compile preprocessFile "DAC\Scripts\DAC_Find_PolyPos.sqf";
	DAC_fFindEllipsPos			= compile preprocessFile "DAC\Scripts\DAC_Find_EllipsPos.sqf";
	DAC_fNewZone 				= compile preprocessFile "DAC\Scripts\DAC_New_Zone.sqf";
	DAC_fClearZone 				= compile preprocessFile "DAC\Scripts\DAC_Clear_Zone.sqf";
	DAC_fDeleteZone 			= compile preprocessFile "DAC\Scripts\DAC_Delete_Zone.sqf";
	DAC_fGetMovepoints 			= compile preprocessFile "DAC\Scripts\DAC_Get_Movepoints.sqf";
	DAC_fFillArray 				= compile preprocessFile "DAC\Scripts\DAC_Fill_Array.sqf";
	DAC_fWritePosition			= compile preprocessFile "DAC\Scripts\DAC_Write_Position.sqf";
	DAC_fInitSector				= compile preprocessFile "DAC\Scripts\DAC_Init_Sector.sqf";
	DAC_fFindSpUnit				= compile preprocessFile format["DAC\AI_%1\DAC_Find_SpUnit.sqf",DAC_AI_AddOn];
	DAC_fShuffleArray 			= compile preprocessFile "DAC\Scripts\DAC_Shuffle_Array.sqf";
	DAC_fReadMarkers 			= compile preprocessFile "DAC\Scripts\DAC_Read_Markers.sqf";
	DAC_fGetZoneWaypoints 		= compile preprocessFile "DAC\Scripts\DAC_Get_Zone_Waypoints.sqf";
	DAC_fReplaceZoneWaypoints 	= compile preprocessFile "DAC\Scripts\DAC_Replace_Zone_Waypoints.sqf";
	DAC_fInsideOfZones 			= compile preprocessFile "DAC\Scripts\DAC_Inside_Of_Zones.sqf";
	DAC_fReadAllCustomPoints 	= compile preprocessFile "DAC\Scripts\DAC_Read_AllCustom_Points.sqf";
	DAC_fApplyPointsWithinZone 	= compile preprocessFile "DAC\Scripts\DAC_Apply_Points_WithinZone.sqf";