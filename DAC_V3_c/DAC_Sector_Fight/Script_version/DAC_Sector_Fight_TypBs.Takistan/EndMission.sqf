_val = _this select 0;

if(_val == 1) then
{
	hintc "Mission complete !\n\nYou have won this sector fight!\n\nAll sectors conquered by friendly units.\nYou can terminate this mission now.";
}
else
{
	hintc "Mission failed !\n\nYou have lost this sector fight!\n\nAll sectors conquered by enemy units.\nYou can terminate this mission now.";
};