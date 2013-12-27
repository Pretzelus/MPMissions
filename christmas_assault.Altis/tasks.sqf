seize_ifestonia = player createSimpleTask ["seize_ifestonia"];
seize_ifestonia setSimpleTaskDescription ["A little village to the north west of Athira. It's usually used as a rally point for defending forces, now mostly empty.", "Seize Ifestonia", "Seize Ifestonia"];
seize_ifestonia setSimpleTaskDestination (getMarkerPos "seize_ifestonia_marker");

seize_athira = player createSimpleTask ["seize_athira"];
seize_athira setSimpleTaskDescription ["Second most heavily guarded place on this island - expect heavy resistance.", "Seize Athira", "Seize Athira"];
seize_athira setSimpleTaskDestination (getMarkerPos "athira");

seize_abdera = player createSimpleTask ["seize_abdera"];
seize_abdera setSimpleTaskDescription ["We haven't got a reliable intel about this villiage - expect from low to high enemy forces.", "Seize Abdera", "Seize Abdera"];
seize_abdera setSimpleTaskDestination (getMarkerPos "seize_abdera_marker");

seize_galati = player createSimpleTask ["seize_galati"];
seize_galati setSimpleTaskDescription ["Our intel states that most of enemy forces have been sent for christmas holiday vacation, so it's not heavly guarded.", "Seize Galati", "Seize Galati"];
seize_galati setSimpleTaskDestination (getMarkerPos "seize_galati_marker");

seize_syrta = player createSimpleTask ["seize_syrta"];
seize_syrta setSimpleTaskDescription ["The enemy villiage of Syrta is considered a low priority target.", "Seize Syrta(optional)", "Seize Syrta"];
seize_syrta setSimpleTaskDestination (getMarkerPos "syrta");

destroy_mortar = player createSimpleTask ["destroy_mortar"];
destroy_mortar setSimpleTaskDescription ["This is a low priority task. Our intel have confirmed that this military complex is a base of operation for mortar section of AAF army. If you would eliminate the threat, a future invasion from the south would be made easier.", "Destroy enemy mortar(optional)", "Destroy mortar"];
destroy_mortar setSimpleTaskDestination (getMarkerPos "destroy_mortar_marker");