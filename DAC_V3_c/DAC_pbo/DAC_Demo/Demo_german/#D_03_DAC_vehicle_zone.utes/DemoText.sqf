if(time < 2) then
{
onMapSingleClick "player setpos _pos";

waituntil{time > 1};

_text = format["
[Einfache Fahrzeug-Zonen]
\n\nIn diesem Beispiel generiert DAC zwei Zonen mit Fahrzeugen. In der oberen Zone werden schwere Fahrzeuge bzw. Panzerfahrzeuge generiert.
\n\nIn der unteren Zone werden leichte Fahrzeuge wie LKW's oder Jeeps generiert.
\n\nDiese leichten Fahrzeuge koennen in der Regel Passagiere mitnehmen, die der DAC dann gleich mitgeneriert.
\n\nHinweis: DAC kann bis zu 4 Fahrzeuge in einer Gruppe generieren.
"];
"DAC V3.0 Demonstration - Teil 3" hintC [_text];

sleep 1;
hintsilent "";
waituntil {(DAC_Basic_Value > 0)};
sleep 1;

_text = format["
[Einfache Fahrzeug-Zonen]
\n\nLeichte Fahrzeuge haben eine Besonderheit:
\nErreicht eine Gruppe einen ihrer Wegpunkte, steigt die Gruppe aus ihren Fahrzeugen aus und begibt sich, fuer eine bestimmte Zeit und in einem bestimmten Radius, auf Patroullie.
\n\nSollte es eine Schuetzenposition in einem Fahrzeug geben, bleibt diese waehrend dieser Zeit besetzt.
\n\nHinweis: Gruppen, die in einem einzelnen leichten Fahrzeug unterwegs sind, werden genau wie die Infanterie-Gruppen, reduziert.
\n\nAchtung, bitte denk' daran, dass in fast jeder Demo-Mission eine erweiterte Info aufgerufen werden kann, in der sich wichtige Informationen befinden !!
"];
"DAC V3.0 Demonstration - Teil 3" hintC [_text];

sleep 0.05;
hint "Erweiterte Info verfuegbar";
player sidechat "Erweiterte Info verfuegbar";
dHint = player addaction ["Erweiterte Info","DemoText.sqf",[1]];
}
else
{
_text = format["
[Einfache Fahrzeug-Zonen]
\n\nDa die zwei Zonen nicht miteinander ""verlinkt"" sind, bewegen sich die Einheiten nur in der Zone, in der sie generiert wurden.
\n\nEs kann natuerlich passieren, dass Einheiten die Zone verlassen, um einen ihrer Wegpunkte zu erreichen, z.B. wenn sie ein Waldstueck umfahren muessen.
\n\nWas genau ""verlinkt"" bedeutet, erklaere ich Dir in einem spaeteren Abschnitt :-)
"];
"DAC V3.0 Demonstration - Teil 3" hintC [_text];
player removeAction dHint;
player sidechat "Ein einfacher Links-Klick auf die Karte platziert Deine Spielfigur dort hin."; 
};