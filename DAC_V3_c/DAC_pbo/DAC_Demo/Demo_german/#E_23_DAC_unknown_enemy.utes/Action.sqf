titleText ["The Battlefield is being generated . . . please wait.", "BLACK OUT",0.1];
//playmusic "Short01_Defcon_Three";
sleep 1;

switch ((_this select 3) select 0) do
{
	case 1:	{
				["z1",[1,0,0],[(2+random 2),2,50,10],[(1+random 1),2,30,10],[(1+random 1),1,30,10],[1,2,1],[0,0,0,0]] spawn DAC_Zone;
			};
	case 2:	{
				["z1",[1,0,0],[(3+random 3),2,50,10],[(2+random 1),2,30,10],[(2+random 1),1,30,10],[2,2,2],[0,0,0,0]] spawn DAC_Zone;
			};
	case 3:	{
				["z1",[1,0,0],[(4+random 4),2,50,10],[(3+random 2),2,30,10],[(3+random 2),1,30,10],[3,2,3],[0,0,0,0]] spawn DAC_Zone;
			};
	case 4:	{
				["z1",[1,0,0],[(5+random 5),2,50,10],[(4+random 3),2,30,10],[(4+random 3),1,30,10],[4,2,4],[0,0,0,0]] spawn DAC_Zone;
			};
	Default {};
};

["z2",[1,1,0],[6,3,6,20],[],[],[],[1,1,1,1]] spawn DAC_Zone;

waituntil {(DAC_Basic_Value > 0)};
sleep 1;
titleText ["", "BLACK IN",2];