execVM "DemoText.sqf";
waituntil{time > 3};
[-1] execVM "Action.sqf";
waituntil{time > 10};
Demo_Act_1 = player addaction ["Activate object zone [A]","Action.sqf",[1]];
Demo_Act_2 = player addaction ["Activate object zone [B]","Action.sqf",[2]];
Demo_Act_3 = player addaction ["Activate object zone [C]","Action.sqf",[3]];
Demo_Act_4 = player addaction ["Activate object zone [D]","Action.sqf",[4]];
Demo_Act_5 = player addaction ["Activate object zone [E]","Action.sqf",[5]];