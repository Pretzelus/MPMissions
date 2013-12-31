if(time < 2) then
{
onMapSingleClick "player setpos _pos";

waituntil{time > 1};

_text = format["
[Verlinken von DAC-Zonen]
\n\nJetzt kommen wir zu den ""verlinkten"" DAC-Zonen. Wenn zwei Zonen miteinander verlinkt sind, dann werden die Wegpunkte beider Zonen (vom gleichen Typ) sozusagen in einen Topf geworfen.
\n\nDas bedeutet, dass die Gruppen aus beiden Zonen auch Wegpunkte in beiden Zonen haben koennen.
\n\nDie Gruppen werden zwar in ihren Master-Zonen generiert, bewegen sich aber zwischen den verlinkten Zonen hin und her. Die Routen der Gruppen sind dadurch noch schwerer hervorsehbar.
\n\nDer Parameter, der Zonen miteinander verlinkt, befindet sich direkt im Skriptaufruf der Zone.
\n\nHinweis: Es koennen beliebig viele Zonen miteinander verlinkt werden. Es koennen auch Ost- und West-Zonen miteinander verlinkt werden ;-)
"];
"DAC V3.0 Demonstration - Teil 5" hintC [_text];

sleep 1;
hintsilent "";
waituntil {(DAC_Basic_Value > 0)};
sleep 1;

_text = format["
[Verlinken von DAC-Zonen]
\n\nOeffne die Kartenansicht und schau Dir die Zonen genau an. Im Osten gibt es 2 West-Zonen, die miteinander verlinkt sind (Fuer die Demo habe ich die Verbindungslinie sichtbar gemacht).
\n\nDie Gruppen aus den beiden West-Zonen sollten sich zwischen den beiden Zonen hin und her bewegen.
\n\nIm Westen siehst Du 3 Ost-Zonen, die ebenfalls miteinander verlinkt sind. Auch dort bewegen sich die Gruppen unvorhersehbar zwischen den Zonen hin und her.
"];
"DAC V3.0 Demonstration - Teil 5" hintC [_text];

sleep 0.05;
hint "Erweiterte Info verfuegbar";
player sidechat "Erweiterte Info verfuegbar";
dHint = player addaction ["Erweiterte Info","DemoText.sqf",[1]];
}
else
{
_text = format["
[Verlinken von DAC-Zonen]
\n\nEin kleiner Hinweis:
\n\nEs macht nur Sinn Zonen zu verlinken, die den gleichen Wegpunkttyp generieren.
\n\nMit anderen Worten ... eine Zone, die nur Wegpunkte fuer schwere Fahrzeuge generiert, kann nicht mit einer Zone verlinkt werden, die nur Wegpunkte fuer Infanterie generiert.
\n\nDas geht schon, nur kommt nichts dabei raus ;-)
\n\nMoegliche Wegpunkttypen sind:
\n[Infanterie, leichte Fahrzeuge, schwere Fahrzeuge]
"];
"DAC V3.0 Demonstration - Teil 5" hintC [_text];
player removeAction dHint;
player sidechat "Ein einfacher Links-Klick auf die Karte platziert Deine Spielfigur dort hin."; 
};