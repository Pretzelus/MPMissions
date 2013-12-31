waituntil{time > 1};

_text = format["
DAC-Logik EXTERN
\n\nDieses letzte Beispiel zeigt Dir, wie Du sehr einfach Zugriff auf alle moeglichen DAC-Config-Dateien bekommst, ohne sie einzeln auslagern zu muessen.
\n\nDafuer benutzt Du einfach die DAC-Logik ""DAC_extern"". Das bedeutet, dass DAC alle Config-Dateien ""extern"" erwartet, also in Deinem Missions-Ordner.
\n\nSpeziell in diesem Fall musst Du den Ordner ""DAC"", der dem Zip-File beiliegt, komplett in Dein Missionsverzeichnis kopieren.
\n\nDort sind alle DAC-Config-Dateien drin, die Du dann nach belieben aendern und erweitern kannst.
\n\nDAC wird dann die internen Konfigurationen umgehen, und ausschliesslich auf diese externen Konfigurations-Dateien zugreifen.
"];
"DAC V3.0 Beispielmission - Teil 33" hintC [_text];

sleep 0.5;

_text = format["
DAC-Logik EXTERN
\n\nDas war's im Prinzip schon. Alles Weitere findest Du in der ""Liesmich"" ;-).
\n\nIch hoffe, dass Du etwas Spass an der Demonstration hattest, und ich Dir den DAC und dessen Moeglichkeiten gut vermitteln konnte.
\n\nUeber etwas Feedback im offiziellen Forum, egal ob positiv oder negativ, wuerde ich mich sehr freuen.
\n\nDanke fuer Dein Interesse und Deine Aufmerksamkeit!
"];
"DAC V3.0 Beispielmission - Teil 33" hintC [_text];