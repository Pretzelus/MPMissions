waituntil{time > 1};

_text = format["
Beispiel Minenfeld
\n\nSzenario: Ein Fahrzeug wurde versehentlich von einem Hubschrauber in einem Minenfeld abgesetzt. Es ist Ihre Aufgabe dieses Fahrzeug sicher wieder aus diesem Minenfeld zu bringen.
\n\nDieses Beispiel zeigt Dir, wie Du komplexe Muster anwenden kannst, um Objekte in sehr speziellen Situationen zu plazieren.
\n\nEin abgestecktes Gebiet wird gleich mit Baeumen umrandet und anschliessend vollstaendig vermint. Du musst alle Minen entschaerfen, die auf Deiner geplanten Route liegen, wenn Du es schaffen willst das Fahrzeug da rauszuholen.
"];
"DAC V3.0 Beispiel - #E_28 (by MattXR)" hintC [_text];

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

_text = format["
Beispiel Minenfeld
\n\nGluecklicherweise bist Du ein Pionier, und die Mission sollte insofern kein grosses problem fuer Dich sein.
\n\nHinweis: Benutze das Actionmenu, um Minen zu lokalisieren und anschliessend zu entschaerfen.
\n\nDu solltest einen Pfad schaffen, der breit genug ist, um das Fahrzeug problemlos da raus zu manoevrieren.
\n\nDieses Minenfeld ist ein schoenes Beispiel dafuer, welche zusaetzlichen Moeglichkeiten es durch die Objektgenerierung gibt.
"];
"DAC V3.0 Beispiel - #E_28 (by MattXR)" hintC [_text];
