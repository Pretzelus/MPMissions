waituntil{time > 1};
movedWpMarkerList = [];

_text = format["
[DAC_quick_custom_points_moving_zone]
\n\nDie vorangeganene Demo hat das grundlegene Handling mit der Verwendung von eigene Wegpunkten erlaeutert.
\n\nDiese Mission soll Dir die praktische und dynamische Verwendung in einer echten Umgebung verdeutlichen.
\n\nAuf der Map siehst ein ganzes Netzwerk von eigenen Wegpunkten verschiedener Typen, die ueber die gesamte Insel verteilt sind. Eine einfache DAC Zone wird generiert und beginnt verschiedene Wegpunkte eines jeden Types zu verwenden. Allerdings betrifft das nur die Wegpunkte, die auch innerhalb dieser Zone liegen.
\n\nDu hast 3 verschiedene Operationen zur Auswahl:
\n1.Einfacher Linksklick irgendwo auf die Map um die Zone mit einigen neuen Wegpunkten zu versorgen.
\n2.Shift + Linksklick irgendwo auf die Map um die Zone vollstaendig mit neuen Wegpunkten zu versorgen.
\n3.Alt + Linksklick aktiviert/deaktiviert eine DAC Zone.
\n4.Shift+Alt+Linksklick loescht die WPs in einer Zone.
"];
"DAC V3.0 Beispiel - #E_27 (by MadRussian)" hintC [_text];

sleep 0.75;

_text = format["
[DAC_quick_custom_points_moving_zone]
\n\nWichtige Anmerkungen:
\n\n1. Du wirst feststellen, das jeder Punkt unanbhaengig von einer Zone plaziert werden kann. Somit koennen eigene Wepunkte schneller und leichter plaziert werden als zuvor. Dieses ganze Set von mehreren Hundert Wegpunkten wurde innerhalb von 10 Minuten platziert.
\n\n2. Zusaetzlich zu den GELBEN und ROTEN Punkten
\n(für Rad- und Kettenfahrzeuge) gibt es auch noch die ORANGENEN Punkte, die fuer beide Fahrzeugtypen verwendet werden, denn Rad- und Kettenfahrzeuge koennen im Prinzip die gleichen Wegpunkte nutzen. 
\n\n3. Die Anzahl der benutzbaren Wegpunkte ergibt sich automatisch aus der Anzahl der eingelesenen/gefundenen Wegpunkte. Die maximale Anzahl kann per Befehl festgelegt werden.
\n\nUebrigens - Diese Demo benutzt die gleichen Funktionen, die bereits in der vorherigen Demo zum Einsatz kamen :)
"];
"DAC V3.0 Beispiel - #E_27 (by MadRussian)" hintC [_text];

sleep 1;

hintSilent "";

_locs = ["ptS", "ptV", "ptT", "ptB", "ptA", "PtC", 1000, false] call DAC_fReadAllCustomPoints;

onMapSingleClick "_fun = [_pos,_shift] execVM ""Action.sqf""";

waituntil {(DAC_Basic_Value == 1)};
sleep 3;

_usageS = 0.25 + 0.25*(random 1);
_usageV = 0.25 + 0.25*(random 1);
_usageT = 0.25 + 0.25*(random 1);
_usageA = 0.25 + 0.25*(random 1);
_usageC = 0.25 + 0.25*(random 1);
_capS = [4,5,6] select (floor(random 3));
_capV = [4,5,6] select (floor(random 3));
_capT = [4,5,6] select (floor(random 3));
_capA = [4,5,6] select (floor(random 3));
_capC = [4,5,6] select (floor(random 3));
_result = [z1, [_usageS, _capS], [_usageV, _capV], [_usageT, _capT], [_usageA, _capA], [_usageC, _capC]] call DAC_fApplyPointsWithinZone;

_report = _result select 0;
_appliedPosList = _result select 1;

hint format ["Custom points applied!\n\nDetails: %1", _report];
//hint format ["_appliedPosList: %1", _appliedPosList];
{
	deleteMarker _x;
} foreach movedWpMarkerList;
_i = 0;
{
	_pos = _x;
	_markName = format ["Highlight_%1", _i];
	_marker = createMarker [_markName, _pos];
	_markName setMarkerShape "ICON";
	_markName setMarkerType  "mil_circle";
	_markName setMarkerSize [0.55, 0.55];
	_ptLoc = (nearestLocations [_pos, ["DAC_Point_Soldier","DAC_Point_Vehicle","DAC_Point_Tank","DAC_Point_Air","DAC_Point_Camp"], 1]) select 0;
	_color = switch (type _ptLoc) do {
		case "DAC_Point_Soldier": {"ColorBlue"};
		case "DAC_Point_Vehicle": {"ColorYellow"};
		case "DAC_Point_Tank": {"ColorRed"};
		case "DAC_Point_Air": {"ColorGreen"};
		default {"ColorBlack"};
	};
	_markName setMarkerColor _color;
	movedWpMarkerList = movedWpMarkerList + [_markName];
	_i = _i + 1;
} foreach _appliedPosList;

sleep 1;

[z1] call DAC_Activate;




