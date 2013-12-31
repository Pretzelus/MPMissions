waituntil{time > 1};

_text = format["
DAC-Logic INTERN
\n\nThe following 4 examples are the last ones. This examples explain the basic and configuration settings.
\n\nThis mission shows how to start and initialize DAC at its easiest.
\n\nIf u installed the addons, the DAC Logic and a DAC zone of course is required for your mission.
\n\nYour misison folder keeps clean of any DAC files.
\n\nThe Dac intern configuration settings are used, which got a certain standard, for creating a testmisison e.g.
\n\nRead the ReadMe for any access to the default settings.
"];
"DAC V3.0 Example mission - Part 30" hintC [_text];

sleep 0.5;

_text = format["
DAC-Logic INTERN
\n\nBy default no marker would be visible, as these are disabled. To follow the generation process of DAC
\nI enabled the markers by parameter.
\n\nHave a look at the init line of the DAC logic and notice the entry: DAC_Marker = 3
\n\nThat means DAC uses the intern marker config No. 3.
\n\nTo deactivate DAC marker you have to delete the init entry or use: DAC_Marker = 0
\n\nOr just try another marker config: DAC_Marker = 5
"];
"DAC V3.0 Example mission - Part 30" hintC [_text];