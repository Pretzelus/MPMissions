if(time < 2) then
{

waituntil{time > 2};

_text = format["
[Bodenunterstuetzung anfordern *Beispiel*]
\n\nDiese Mission entspricht in etwa der vorherigen Mission:
\nIm Norden befinden sich Ost-Truppen und im Sueden West-Truppen.
\n\nEs gibt hier aber 2 wesentliche Unterschiede:
\nDer Feind besitzt keine DAC-Camps. Es werden also keine neuen Ost-Einheiten generiert. Ausserdem sind die beiden Haupt-Zonen nicht miteinander verlinkt.
\n\nEine Konfliktsituation ist daher normalerweise ausgeschlossen, da die Gruppen ihre Zonen nicht verlassen und es somit keine Feindberuehrungen gibt.
\n\nIch werde Dir aber nun ""etwas"" Kontrolle ueber die eigenen Gruppen geben ...
"];
"DAC V3.0 Demonstration - Teil 20" hintC [_text];

sleep 0.5;

_text = format["
[Bodenunterstuetzung anfordern *Beispiel*]
\n\nDie Unterstuetzungs-Anforderungen der KI, wie Du sie in der letzten Mission kennengelernt hast, stehen auch dem Spieler zu Verfuegung!
\n\nDie Bedingungen sind die gleichen wie fuer die KI. Du hast also keinen Einfluss darauf, welche Gruppe zu Unterstuetzung kommt, bzw. ob ueberhaupt eine Gruppe kommen kann. Wenn ja, ist es in der Regel die Gruppe, die der Position am naechsten ist. Das ist aber nur bei optimalen Bedingungen so.
\n\nAls Spieler hast Du den Vorteil, dass Du die Position innerhalb eines bestimmten Radius selbst bestimmen kannst, allerdings muessen sich auch eigene Einheiten in einer gewissen Reichweite befinden.
\n\nOk, warte nun bis DAC mit der Initialisierung durch ist ...
"];
"DAC V3.0 Demonstration - Teil 20" hintC [_text];

sleep 1;
hintsilent "";
waituntil {(DAC_Basic_Value > 0)};
sleep 1;

_text = format["
[Bodenunterstuetzung anfordern *Beispiel*]
\n\nDen Bereich, in dem Du Unterstuetzung anfordern kannst, habe ich Dir mit einem Kreismarker markiert. Du kannst also eine beliebige Position innerhalb dieses Bereichs mit der linken Maustaste anklicken, um fuer diese Position eine Unterstuetzungs-Gruppe anzufordern.
\n\nUm nun eigene Einheiten in die feindliche Zone zu lenken, musst Du Dich weiter nach Norden bewegen, damit dieser Bereich in die feindliche Zone gelangt.
\n\nBitte beachte, dass nicht jeder Klick automatisch eine Gruppe anfordert. Beobachte den Hint, der Dir anzeigt wie oft Du die Funktion ausgeloest hast, und wieviel Gruppen derzeit eine Anforderung bekommen haben bzw. schon unterwegs sind.
\n\nEs kann auch passieren, dass eine Gruppe Deiner Unterstuetzungs-Anforderung zusagt, kurze Zeit spaeter aber Abbrechen muss, weil sie Feindkontakt hat.
"];
"DAC V3.0 Demonstration - Teil 20" hintC [_text];

sleep 0.05;
hint "Erweiterte Info verfuegbar";
player sidechat "Erweiterte Info verfuegbar";
dHint = player addaction ["Erweiterte Info","DemoText.sqf",[1]];
}
else
{
_text = format["
[Bodenunterstuetzung anfordern *Beispiel*]
\n\nErreicht eine Unterstuetzungs-Gruppe die von Dir markierte Position (die Genauigkeit, mit der die Gruppe dort eintrifft, ist abhaengig vom Skill des Anfuehrers), und die Gruppe kann dort keine Feinde ausmachen, wird sie im Bereich dieser Position auf Such-Patroullie gehen.
\n\nAnschliessend wird sie zu ihrer Master-Zone zurueckkehren. Dieses Verhalten gilt nicht fuer schwere Fahrzeuge, die unter diesen Umstaenden direkt umkehren.
\n\nBitte beachte, dass die Unterstuetzungs-Anforderung traege reagiert, und nicht ""auf Knopfdruck"" zu Verfuegung steht. Du musst genauso lange warten, wie die KI dies tun muss ;-)
\n\nZudem solltest Du zwischen jeder Anforderung ein paar Sekunden Pause einlegen.
"];
"DAC V3.0 Demonstration - Teil 20" hintC [_text];
player removeAction dHint;
};