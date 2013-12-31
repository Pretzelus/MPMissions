if(time < 2) then
{
onMapSingleClick "player setpos _pos";

waituntil{time > 1};

_text = format["
[Wegpunkt-Zonen]
\n\nIm Zusammenhang mit den verlinkten Zonen, kommen die Wegpunkt-Zonen in's Spiel.
\n\nWegpunkt-Zonen sind Zonen, in denen keine Gruppen generiert werden, sondern nur Wegpunkte. Insofern machen die Wegpunkt-Zonen nur Sinn, wenn sie mit Master-Zonen verlinkt werden.
\n\nIn dieser Demo habe ich 2 Konstellationen mit Wegpunkt-Zonen erzeugt.
\n\nZum einen gibt es 3 Wegpunkt-Zonen ausserhalb einer Master-Zone, und zum anderen gibt es 3 Wegpunkt-Zonen, die innerhalb einer Masterzone platziert sind.
\n\nDas Ergebnis bleibt in beiden Faellen das gleiche: Die Einheiten aus der Master-Zone ""koennen"" Wegpunkte in ihren 3 Wegpunkt-Zonen haben ...
"];
"DAC V3.0 Demonstration - Teil 6" hintC [_text];

sleep 1;
hintsilent "";
waituntil {(DAC_Basic_Value > 0)};
sleep 1;

_text = format["
[Wegpunkt-Zonen]
\n\nJede Gruppe in dieser Demo bekommt 10 zufaellige Wegpunkte zugewiesen. In welchen Zonen sich die Wegpunkte befinden ist ungewiss. 
\n\nWenn Du die Gruppen beobachtest, siehst Du wie sie Wegpunkte in ihren Wegpunkt-Zonen ansteuern.
\n\nDas aendert sich natuerlich mit jedem Missionsstart ;-)
"];
"DAC V3.0 Demonstration - Teil 6" hintC [_text];

sleep 0.05;
hint "Erweiterte Info verfuegbar";
player sidechat "Erweiterte Info verfuegbar";
dHint = player addaction ["Erweiterte Info","DemoText.sqf",[1]];
}
else
{
_text = format["
[Wegpunkt-Zonen]
\n\nDas Beispiel mit den Wegpunkt-Zonen innerhalb der Master-Zone zeigt Dir z.B., wie Du in bestimmten Gebieten die Wahrscheinlichkeit erhoehen kannst, dass dort Einheiten auftauchen.
\n\nDie andere Methode zeigt Dir, das Wegpunkt-Zonen auch weit ab von ihrer Master-Zone platziert werden koennen.
\n\nDer Effekt ist dann, dass Niemand weiss wann dort Einheiten eintreffen, wieviele Einheiten dort eintreffen, welche Einheiten dort eintreffen, wie lange sich die Einheiten dort aufhalten usw.
\n\nCool, oder?
"];
"DAC V3.0 Demonstration - Teil 6" hintC [_text];
player removeAction dHint;
player sidechat "Ein einfacher Links-Klick auf die Karte platziert Deine Spielfigur dort hin."; 
};