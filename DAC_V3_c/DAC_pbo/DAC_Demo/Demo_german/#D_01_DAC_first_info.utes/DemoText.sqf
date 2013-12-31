waituntil{time > 1};

_text = format["
[Erste Infos]
\n\nWillkommen bei der Demonstration von DAC V3.0 fuer Arma II.
\n\nDie Demonstration besteht aus mehreren Teilen, die in der vorgegebenen Reihenfolge gestartet werden sollten.
\n\nDie Demonstration zeigt nur die wichtigsten Merkmale von DAC. Die jeweiligen Details und weitere Features, musst Du bitte der Liesmich entnehmen.
\n\nAchtung, den Schwierigkeitsgrad solltest Du fuer diese Demonstration auf ""Veteran"" einstellen, damit die DAC-Marker nicht mit den Arma-Markern optisch in Konflikt kommen.
\n\nOk, dann viel Spass mit der Demo.
"];
"DAC V3.0 Demonstration - Teil 1" hintC [_text];

sleep 1;

_text = format["
[Erste Infos]
\n\nBevor es losgeht, moechte ich Dir ganz kurz erklaeren, was DAC ueberhaupt macht.
\n\nDAC generiert Einheiten aus verschiedenen Kategorien in sogenannten DAC-Zonen.
\nDas passiert voll dynamisch. Die Bewegungs- und Verhaltensmuster der KI sind ebenfalls voll dynamisch.
\n\nEine DAC-Zone ist nichts anderes als ein Ausloeser, den Du im Editor platzierst.
\n\nDie Form und die Groesse des Ausloesers bestimmt gleichzeitig die Form und Groesse der DAC-Zone.
\n\nEin Skriptaufruf direkt im Ausloeser sorgt dafuer, dass der Ausloeser zu einer DAC-Zone wird, zu welcher Seite die Zone gehoert, oder wieviele Gruppen einer Einheiten-
\nKategorie darin generiert werden sollen usw.
"];
"DAC V3.0 Demonstration - Teil 1" hintC [_text];

sleep 1;

_text = format["
[Erste Infos]
\n\nIn dieser kurzen Demo zeige ich Dir, wie sich die Zonen in Form und Farbe unterscheiden koennen, nur damit Du die Bedeutung kennenlernst.
\n\nOk, sobald Du auf [weiter] drueckst, wird DAC die verschiedenen Zonen aufbauen.
\n\nDu kannst dann die Karte oeffnen und Dir die Zonen ansehen ...
\n\n\nSobald der DAC seine Initialisierung abgeschlossen hat, kommt ein letzter Hint mit ein paar Erklaerungen.
"];
"DAC V3.0 Demonstration - Teil 1" hintC [_text];
sleep 0.05;
hintsilent "";
waituntil {(DAC_Basic_Value > 0)};

sleep 5;

_text = format["
[Erste Infos]
\n\nIm oberen Teil der Karte befinden sich 4 DAC-Zonen
\nin 4 verschiedenen Farben.
\n\nDie Farben zeigen Dir an, zu welcher Seite eine Zone gehoert: [Ost,Zivil,Widerstand,West].
\n\nIm mittleren Teil der Karte erkennst Du die verschiedenen Formen, die eine DAC-Zone haben kann: [Rechteck,Kreis,Ellipse,Polygon].
\n\nIm unteren Teil der Karte befindet sich eine deaktivierte Zone [grau] und 2 Wegpunkt-Zonen [mehrfarbig], die ich spaeter noch genau erklaere.
"];
"DAC V3.0 Demonstration - Teil 1" hintC [_text];

sleep 1;

hint format["Rot=Ost\nGruen=Zivil\nGelb=Widerstand\nBlau=West\n\nGrau=deaktiviert\nMehrfarbig=WP-Zone"];
