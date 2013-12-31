onMapSingleClick "player setpos _pos";DemoValue = 0;

waituntil{time > 1};

_text = format["
[Generieren von Objekten]
\n\nIn dieser Demo zeige ich Dir, dass DAC noch mehr kann als ""nur"" Einheiten generieren. Es gibt die Moeglichkeit, innerhalb von DAC-Zonen auch Objekte zu generieren.
\n\nDas Generieren muss unbedingt ueber eine eigene Zone passieren, denn Einheiten + Objekte ueber die gleiche Zone zu generieren, ist nicht moeglich.
\n\nBitte beachte, dass es sich hierbei im Prinzip um einen Zufalls-Generator handelt, der aber in gewissen Bereichen beeinflusst werden kann.
\n\nOk, ich zeige Dir gleich 6 verschiedene Beispiele, die Du nach und nach ueber Dein Action-Menue anwaehlen kannst (Unbedingt die Reihnenfolge einhalten).
\n\nAlles was Du ueber dieses Thema wissen musst, findest Du in der ""Liesmich"". Ansonsten gibt es nicht viel zu sagen ;-)
"];
"DAC V3.0 Demonstration - Teil 22" hintC [_text];

waituntil{DemoValue == 6};
sleep 3;

onMapSingleClick "_fun = [_pos,_shift] execVM ""MapClick.sqf""";
_text = format["
[Generieren von Objekten]
\n\nGut, die 6 Beispiele sind durch und ich hoffe, dass ich Dich damit etwas inspirieren konnte.
\n\nDu hast jetzt noch die Moeglichkeit, eine beliebige Position der Karte mit linker Maustaste anzuklicken, um an dieser Position ein paar Objekte zu generieren.  
\n\nHalte die Shift-Taste gedrueckt, wenn Du den Spieler neu positionieren moechtest.
\n\nViel Spass !
"];
"DAC V3.0 Demonstration - Teil 22" hintC [_text];
sleep 1;
hintsilent "";