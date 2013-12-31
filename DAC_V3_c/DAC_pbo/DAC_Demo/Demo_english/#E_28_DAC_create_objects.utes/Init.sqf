waituntil{time > 1};

_text = format["
Example Minefield
\n\nSCENARIO: A valuable vehicle has accidentally been helo-dropped into a minefield. Your mission is to successfully extract the vehicle from the minefield.
\n\nThis is an example of how you can use a complex shape to place objects in a very specific pattern.
\n\nIn this mission, trees will be placed around the perimeter of the field apart from one area close to your starting position, leading the player to think about using your planned route.
\n\nThe field, as well as surrounded by trees, is full of mines. You must disable all the mines in your planned route if you wish to drive the vehicle out of the field.
"];
"DAC V3.0 Example - #E_28 (by MattRX)" hintC [_text];

sleep 1;

waituntil{(count DAC_Obj_Init > 0)};
showCinemaBorder false;
_demoCam = "camera" camCreate [(position player select 0),(position player select 1),(position player select 2) + 1];
_demoCam cameraEffect ["internal","back"];
_demoCam camSetTarget t1;
_demoCam camSetPos [(position t1 select 0),(position t1 select 1),(position t1 select 2) + 5];
_demoCam camCommit 50;
waitUntil {camCommitted _demoCam};
waituntil{(count DAC_Obj_Init <= 0)};
_demoCam camSetPos [(position player select 0),(position player select 1),(position player select 2) + 2];
_demoCam camCommit 1;
waitUntil {camCommitted _demoCam};
player cameraEffect ["terminate","back"];
camDestroy _demoCam;

sleep 1;

_text = format["
Example Minefield
\n\nLuckily, you are an engineer :) so you can accomplish this mission with skill and luck.
\n\nHINT: You can use your engineer's action menu to easily spot mines to deactivate.
\n\nYou must clear a path wide enough for the vehicle to safely leave the minefield, so think about several sweeps, in various patterns, to ensure you don't miss a few ;) This minefield example should set your brain thinking about other object placement possibilities :)
"];
"DAC V3.0 Example - #E_28 (by MattRX)" hintC [_text];