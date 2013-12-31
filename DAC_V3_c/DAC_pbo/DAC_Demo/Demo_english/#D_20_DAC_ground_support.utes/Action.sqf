private ["_pos","_shift"];

_pos = _this select 0;_shift = _this select 1;

if(!(_shift)) then
{
	[player,_pos] spawn DAC_fCallHelp;
}
else
{
	player setpos _pos;
};