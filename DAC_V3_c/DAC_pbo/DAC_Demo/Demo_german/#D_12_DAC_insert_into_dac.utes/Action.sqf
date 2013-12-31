private ["_pos","_shift","_log","_dist","_m","_array","_group"];

_pos = _this select 0;_shift = _this select 1;_m = 0;_log = "";_dist = 20;_array = [];_group = objNull;

_array = nearestObjects [[(_pos select 0),(_pos select 1)], [], 20];
{
	if(format["%1",group _x] != "<NULL-group>") then
	{
		if(isNull _group) then
		{
			if(group _x != group player) then
			{
				_group = (group _x);
				if(!(_group in DAC_All_Groups)) then
				{
					if(DAC_Release_Action == 0) then
					{
						if(_group in z1_groups) then
						{
							// Insert a DAC-group back into the DAC-system
							//[_group,1,[z1],8,1,1,[1,1,1],0] spawn DAC_fInsertGroup;
						}
						else
						{
							if(({(vehicle _x) != _x} count (units _group)) == 0) then
							{
								// Insert an editor-placed infantry group into the DAC-system and saving editor-placed waypoints in random generated array
								[_group,1,[z1],8,1,1,[1,1,1],0,true] spawn DAC_fInsertGroup;
								
								// Insert an editor-placed group into the DAC-system without saving editor-placed waypoints
								//[_group,1,[z1],8,1,1,[1,1,1],0] spawn DAC_fInsertGroup;
							}
							else
							{
								// Insert an editor-placed light vehicle group into the DAC-system and saving editor-placed waypoints in random generated array
								[_group,2,[z1],8,1,1,[1,1,1],0,true] spawn DAC_fInsertGroup;
							};
						};
					}
					else
					{
						player sidechat "Any release-action is running. Please try again later";
					};
				}
				else
				{
					if(DAC_Release_Action == 0) then
					{
						if(!(_group in z1_groups)) then
						{
							// Release DAC or editor-placed group from DAC-system
							// If waypoints have been saved, they are automatically transferred to the (editor-placed) group
							[_group] spawn DAC_fReleaseGroup;
						};
					}
					else
					{
						player sidechat "Release-action still running. Please try again later";
					};
				};
			};
		};
	};
}	foreach _array;
if(isNull _group) then
{
	player groupchat "No group in range. Please try again.";
};