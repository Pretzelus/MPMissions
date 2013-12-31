if(time < 2) then
{
onMapSingleClick "player setpos _pos";

waituntil{time > 1};

_text = format["
[Benutzerdefinierte Wegpunkte]
\n\nDiese kleine Demo zeigt Dir, dass sich benutzerdefinierte Wegpunkte sehr gut dafuer eignen, Standorte fuer DAC-Camps und Helis zu bestimmen. 
\n\nBesonders diese beiden DAC-Kategorien sind in bestimmten Gebieten etwas problematisch, wenn DAC dafuer Standorte generieren soll, denn fuer einen solchen Standort muss das Gelaende relativ flach sein und es duerfen sich nur sehr wenig (kleine) Objekte in der Naehe der Position befinden.
"];
"DAC V3.0 Demonstration - Teil 8" hintC [_text];

sleep 1;
hintsilent "";
waituntil {(DAC_Basic_Value > 0)};
sleep 1;

_text = format["
[Benutzerdefinierte Wegpunkte]
\n\nWie Du siehst, habe ich die Heli-Standorte auf dem Flughafengelaende platziert. Die Standorte fuer die 3 Camps habe ich an geeignete Positionen gelegt.
\n\nMit einem Links-Klick auf die Karte kannst Du Dir diese Standorte gerne aus der Naehe ansehen ;-)
\n\nAnsonsten gibt es zu dieser Demo nicht mehr zu sagen.
"];
"DAC V3.0 Demonstration - Teil 8" hintC [_text];

sleep 0.05;
hint "keine erweiterte Info verfuegbar";
player sidechat "keine erweiterte Info verfuegbar";
};