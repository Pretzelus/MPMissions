if(time < 2) then
{
onMapSingleClick "player setpos _pos";

waituntil{time > 1};

_text = format["
[Heli-Zonen und Camps]
\n\nDAC kann noch 2 weitere Kategorien generieren: Helikopter und Camps.
\n\nIn dieser Demo wird 1 Zone mit 6 Helis und 1 weitere Zone mit zwei Camps generiert.
\n\nDie Camps haben eine Sonderfunktion, denn sie sorgen fuer neue Einheiten auf dem Schlachtfeld.
\n\nWie das genau funktioniert, erklaere ich spaeter.
"];
"DAC V3.0 Demonstration - Teil 4" hintC [_text];

sleep 1;
hintsilent "";
waituntil {(DAC_Basic_Value > 0)};
sleep 1;

_text = format["
[Heli-Zonen und Camps]
\n\nGeneriert DAC einen Heli der Platz fuer Passagiere bietet, wird eine zusaetzliche Gruppe generiert, die dann auch zur Besatzung geheoert.
\n\nDiese Gruppe verhaelt sich aehnlich wie die der leichten Fahrzeuge:
\n\nBefindet sich der Heli in Wartestellung auf dem Boden, dann steigt diese Gruppe aus und patroulliert in der Naehe des Helis.
\n\nHinweis: Die zusaetzliche Gruppe wird bei entsprechender Anforderung auch mal ueber Feindgebiet abgeworfen ;-)
"];
"DAC V3.0 Demonstration - Teil 4" hintC [_text];

sleep 0.05;
hint "Erweiterte Info verfuegbar";
player sidechat "Erweiterte Info verfuegbar";
dHint = player addaction ["Erweiterte Info","DemoText.sqf",[1]];
}
else
{
_text = format["
[Heli-Zonen und Camps]
\n\nFuer Helis werden keine Wegpunkte generiert, sondern nur die Standorte.
\n\nBeginnt ein Heli mit seiner Patroullie, nimmt er sich zufaellige Wegpunkte aus seiner Zone.
\n\nHat ein Heli eine bestimmte Anzahl von Wegpunkten abgeflogen, kehrt er zu seinem Standort zurueck, landet dort und legt eine Pause ein, bevor er dann eine weitere Patroullie startet.
\n\nHinweis: Camps und Heli-Standorte koennen nicht ueberall generiert werden. Das Gelaende muss entsprechend geeignet sein.
"];
"DAC V3.0 Demonstration - Teil 4" hintC [_text];
player removeAction dHint;
player sidechat "Ein einfacher Links-Klick auf die Karte platziert Deine Spielfigur dort hin."; 
};