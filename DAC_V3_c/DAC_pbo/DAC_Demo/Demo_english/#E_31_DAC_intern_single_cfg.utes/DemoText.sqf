waituntil{time > 1};

_text = format["
DAC-Logic INTERN + Config-file
\n\nThis example uses the DAC-Logic ""DAC_intern""
\n\nAdditionally I placed another logic with the entry:
\nDAC_Single_Config = [""Units"",""Marker""].
\n\nThis parameter outsources single config files into your mission folder, for further adjusting.
\n\nThe intern config files are secondary to the outsourced ones and DAC.
\n\nThe parameter ""DAC_Marker = 1"" e.g. doesn´t use the intern marker config now, but the marker config from your mission folder, with the config No. 1.
\n\nThe unit config I have also outsourced for now.
\nAttention: The unit-config requires allways the config-nr. 0 + 1 (East + West), but can be extanded.
\n(view ""ReadMe"" please)
"];
"DAC V3.0 Example mission - Part 31" hintC [_text];

sleep 0.5;

_text = format["
DAC-Logic INTERN + Config-file
\n\nFollowing config files are available and adjustable:
\n\nDAC_Config_Arti = ""Arti""
\nDAC_Config_Behaviour = ""Behaviour""
\nDAC_Config_Camps = ""Camps""
\nDAC_Config_Creator = ""Creator""
\nDAC_Config_Events = ""Events""
\nDAC_Config_Marker = ""Marker""
\nDAC_Config_Objects = ""Objects""
\nDAC_Config_Sound = ""Sound""
\nDAC_Config_Units = ""Units""
\nDAC_Config_Waypoints = ""Waypoints""
\nDAC_Config_Weapons = ""Weapons""
\n\nThe names in """" refer to the names, you have to use in 
\nthe Parameter ""DAC_Single_Config"" .
"];
"DAC V3.0 Example mission - Part 31" hintC [_text];