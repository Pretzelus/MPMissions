if(time < 2) then
{
waituntil{time > 1};

_text = format["
[Bewegliche Zone *Beispiel*]
\n\nIn dieser kleinen Demo zeige ich Dir eine der Moeglichkeiten, die Du mit der Funktion ""DAC_fChangeZone"" umsetzen kannst.
\n\nNormalerweise wird diese Funktion dafuer benutzt, eine Zone waehrend der Mission auf eine neue Position zu platzieren, um dadurch eine Art globale Truppenbewegung auszuloesen.
\n\nEs ist aber auch moeglich, diese Funktion alle paar Sekunden auf eine Zone anzuwenden.
\n\nWofuer das gut sein soll, zeige ich Dir jetzt ...
"];
"DAC V3.0 Beispielmission - Teil 24" hintC [_text];

sleep 0.5;

_text = format["
[Bewegliche Zone *Beispiel*]
\n\nDie Mission enthaelt 2 kleine DAC-Zonen. In der einen werden Infanterie-Einheiten generiert, und in der anderen ein paar schwere Fahrzeuge.
\n\nNichts Besonderes also. Aber ... ich gebe Dir nun ein Action-Menue an die Hand, mit dem Du die Zonen kontrollieren kannst. 
\n\nDas Action-Menue sollte selbsterklaerend sein. Nur soviel vorab: Der Action-Eintrag ""... follow player"" bedeutet, dass die entsprechende Zone Dir folgen wird und damit auch deren Einheiten.
\n\nDas kannst Du gut beobachten, wenn Du die Karte oeffnest und Dich dann bewegst, denn die Zone wird alle paar Sekunden an Deine Position angepasst.
\n\nWarte nun, bis DAC die Zonen aufgebaut hat ...
"];
"DAC V3.0 Beispielmission - Teil 24" hintC [_text];

sleep 1;
waituntil {(DAC_Basic_Value > 0)};
sleep 1;

_text = format["
[Bewegliche Zone *Beispiel*]
\n\nOk, die Einheiten sind da und warten nun darauf, an ihre Zielposition gebracht zu werden (2 Markierungen auf der Karte, ohne weitere Bedeutung).
\n\nInfo: Du kannst immer nur eine Zone kontrollieren, aber Du kannst jederzeit die Zone wechseln.
\n\nBitte beachte, dass auch hier wieder eine gewisse Verzoegerung auftreten wird, mit anderen Worten:
\nEs dauert ein paar Sekunden, bis die Gruppen einer Zone die neuen Wegpunkt-Daten uebermittelt bekommen haben.
\n\nDann viel Spass ...
"];
"DAC V3.0 Beispielmission - Teil 24" hintC [_text];

sleep 2;

z1 setVariable ["zone_action", 0, false];z1 setVariable ["zone_startpos", (position z1), false];
z2 setVariable ["zone_action", 0, false];z2 setVariable ["zone_startpos", (position z2), false];

Demo_Act_1 = player addaction ["Zone [z1 - infantry] follow Player","Action_z1.sqf",[1]];
Demo_Act_2 = player addaction ["Zone [z2 - vehicles] follow Player","Action_z2.sqf",[1]];
};