_check = leadVal;

"fZone" setMarkerPos (position z1_1);
_xfact = ((mSetting select 0) select 0) + ((mSetting select 1) select 0);
_yfact = ((mSetting select 0) select 1) + ((mSetting select 1) select 1);
"zonexyok" setMarkerSize (mSetting select 1);"zonexyok" setMarkerPos (position z1_1);
"zonexplus" setMarkerSize (mSetting select 1);"zonexplus" setMarkerPos [((position z1_1) select 0)+_xfact,((position z1_1) select 1)];
"zonexminus" setMarkerSize (mSetting select 1);"zonexminus" setMarkerPos [((position z1_1) select 0)-_xfact,((position z1_1) select 1)];
"zoneyplus" setMarkerSize (mSetting select 1);"zoneyplus" setMarkerPos [((position z1_1) select 0),((position z1_1) select 1)+_yfact];
"zoneyminus" setMarkerSize (mSetting select 1);"zoneyminus" setMarkerPos [((position z1_1) select 0),((position z1_1) select 1)-_yfact];

if(isMultiplayer) then
{
	if(isServer) then
	{
		sleep 10;
		waituntil{DAC_Basic_Value > 0};
		while{true} do
		{
			sleep 3;
			if(_check != leadVal) then
			{
				_check = leadVal;
				"fZone" setMarkerPos (call compile leadVal);
				"fZone" setMarkerSize (mSetting select 0);
				sleep 1;
				[z1_1,(call compile leadVal),[((mSetting select 0) select 0),((mSetting select 0) select 1),0],0,0,0] call DAC_fChangeZone;
			};
		};
	};
};