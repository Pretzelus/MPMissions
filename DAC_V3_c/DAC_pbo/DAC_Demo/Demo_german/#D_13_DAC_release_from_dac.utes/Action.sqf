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
						// Insert all groups from zone "z1" back into the DAC-system
						{[_x,1,[z1],8,1,1,[1,1,1],0] spawn DAC_fInsertGroup}foreach z1_groups;
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
						if(!_shift) then
						{
							// Release all groups from zone "z1" from the DAC-system (groups saved in array "z1_groups")
							{[_x] spawn DAC_fReleaseGroup}foreach z1_groups;
						}
						else
						{
							// Release all groups from zone "z1" from the DAC-system (groups saved in array "z1_groups")
							// All these groups gets 8 random waypoints from zone "z2" to start a simple move-script
							{[_x,[z2],1,8] spawn DAC_fReleaseGroup}foreach z1_groups;
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