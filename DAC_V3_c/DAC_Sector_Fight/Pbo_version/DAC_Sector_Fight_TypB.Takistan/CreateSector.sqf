// ["nameOfTheZone","nameOfTheScript"] execVM "CreateSector.sqf"
// "nameOfTheScript" = You can start a script if the sector is conquered by friendly units

_sector = call compile (_this select 0);
_callString = _this select 1;

sleep (1 + random 1);

_area = triggerArea _sector;
_id = round (random 10000);

call compile format["sec%1 = createTrigger [""EmptyDetector"",position _sector]",_id];
call compile format["sec%1 setTriggerActivation [""ANY"", ""PRESENT"", true]",_id];
if(((triggerArea _sector) select 2) == 0) then
{
	call compile format["sec%1 setTriggerArea [(_area select 0), (_area select 1), 0, true ]",_id];
}
else
{
	call compile format["sec%1 setTriggerArea [(_area select 1), (_area select 0), 0, true ]",_id];
};
call compile format["sec%1 setTriggerStatements [""this"", """", """"]",_id];

mySectors = mySectors + [[call compile format["sec%1",_id],_callString]];