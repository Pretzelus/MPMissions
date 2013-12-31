execVM "DemoText.sqf";
waituntil{time > 3};
[-1] execVM "Action.sqf";
waituntil{time > 10};
Demo_Act_1 = player addaction ["Aktiviere Objektzone [A]","Action.sqf",[1]];
Demo_Act_2 = player addaction ["Aktiviere Objektzone [B]","Action.sqf",[2]];
Demo_Act_3 = player addaction ["Aktiviere Objektzone [C]","Action.sqf",[3]];
Demo_Act_4 = player addaction ["Aktiviere Objektzone [D]","Action.sqf",[4]];
Demo_Act_5 = player addaction ["Aktiviere Objektzone [E]","Action.sqf",[5]];