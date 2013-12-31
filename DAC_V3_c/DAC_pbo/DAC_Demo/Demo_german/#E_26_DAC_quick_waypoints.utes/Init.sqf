waituntil{time > 1};

_text = format["
[DAC_quick_custom_points]
\n\nDiese Mission zeigt ein schnelles und einfaches Beispiel darueber, wie man eigene Wegpunkte per Zufall auswaehlt und an eine DAC-Zone uebergibt.
\n\nOeffne gleich die Karte, dann siehst Du vier Gruppen von unterschiedlich farblich markierten Punkten auf der Karte.
\n\nAnalog dazu wird jeweils 1 DAC-Zone ueber jedem dieser Gebiete generiert. In diesen Zonen werden aber erst mal nur ""normale"" zufaellige Wegpunkte generiert.
\n\nSobald Du mit der linken Maustaste in der Naehe von den eigenen Punkten auf die Map klickst, werden einige Zonen-Wegpunkte durch die zufaellige Markerpositionen ersetzt.
\n\nDie Tastenkombination Shift+Linksklick bewirkt die selbe Operation, nur das die Marker anschliessend geloescht werden.
"];
"DAC V3.0 Beispiel - #E_26 (by MadRussian)" hintC [_text];

sleep 0.75;

_text = format["
[DAC_quick_custom_points]
\n\nWichtige Anmerkungen:
\n\n1.Jede Anhaeufung von Markerpunkten wurde in einer schnellen kopieren/einfuegen Manier von einem Ausgangsmarker erzeugt.
\n\n(Beispiel: Ein Ausgangsmarker koennte ""Mark"" heissen. Wenn Du diesen Marker kopierst und an anderer Stelle mehrfach wieder einfuegst, heissen diese Kopien automatisch ""Mark_1"", ""Mark_2"",""Mark_3"" usw.) Auf diese Weise hat man sich sehr schnell diese ""Markerhaufen"" zusammengebaut.
\n\n2.Bei dieser Methode ist es auch voellig egal, wenn Du mittendrin Marker loeschst, oder spaeter einfach ein paar Marker hinzufuegst, denn die Funktion beruecksichtigt diese Umstaende.
\n\n3.In einer echten Mission koennt Ihr diese Marker vorher in der ""init.sqf"" einlesen, somit werden diese nicht vom Spieler gesehen, auch nicht im Briefing :)
"];
"DAC V3.0 Beispiel - #E_26 (by MadRussian)" hintC [_text];

sleep 1;

hintSilent "";

onMapSingleClick "_fun = [_pos,_shift] execVM ""Action.sqf""";




