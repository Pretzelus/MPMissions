if(time < 2) then
{
onMapSingleClick "player setpos _pos";

waituntil{time > 1};

_text = format["
[Einfache Infanterie-Zone]
\n\nIn diesem Beispiel generiert DAC in einer Zone
\n50 Wegpunkte und 10 Gruppen Infanterie.
\n\nJede Gruppe bekommt aus dem gesamten Wegpunkt-Pool
\n8 Wegpunkte per Zufall zugewiesen.
\n\nWenn Du die Karte oeffnest, kannst Du das Generieren beobachten.
\n\nHinweis: Die Einheiten und die Wegpunkte werden bei jedem Neustart der Mission wieder neu generiert.
"];
"DAC V3.0 Demonstration - Teil 2" hintC [_text];
sleep 1;
hintsilent "";
waituntil {(DAC_Basic_Value > 0)};

sleep 5;

_text = format["
[Einfache Infanterie-Zone]
\n\nEinige Gruppen melden gleich, dass sie reduziert wurden. Das ist ein besonderes Feature von DAC.
\n\nBefindet sich eine Gruppe ausserhalb einer bestimmten Reichweite zum Spieler bzw. zu feindlichen Einheiten, dann reduziert DAC diese Gruppe bis auf den Anfuehrer.
\n\nKommt der Anfuehrer wieder in Reichweite, baut sich die Gruppe wieder auf. Faktoren wie Beschaedigung, Faehigkeit, Munition usw. werden natuerlich wiederhergestellt.
\n\nHinweis zur Demo: Mit einem einfachen Linksklick auf die Karte kannst Du Deine Spielfigur beliebig platzieren.
\n\nPer Action-Menue kannst Du ausserdem eine erweiterte Info aufrufen.
"];
"DAC V3.0 Demonstration - Teil 2" hintC [_text];
sleep 0.05;
hint "Erweiterte Info verfuegbar";
player sidechat "Erweiterte Info verfuegbar";
dHint = player addaction ["Erweiterte Info","DemoText.sqf",[1]];
}
else
{
_text = format["
[Einfache Infanterie-Zone]
\n\nKlick Dich direkt in die Zone, damit alle Gruppen aufgebaut werden, oder klick Dich weit weg von der Zone, damit die Gruppen reduziert werden.
\n\nDu kannst die DAC-Zone auch mal im Missions-Editor auf eine andere Position platzieren, die Groesse aendern, oder die Zone drehen, und dann einfach die Mission neu starten.
\n\nViel Spass dabei :-)
\n\nInfo:
\nIch habe in diesem Beispiel die DAC System-Meldungen
\naktiviert (gruener Text), die Dir genau anzeigen,
\nwas DAC gerade macht.
"];
"DAC V3.0 Demonstration - Teil 2" hintC [_text];
player removeAction dHint;
player sidechat "Ein einfacher Links-Klick auf die Karte platziert Deine Spielfigur dort hin."; 
};