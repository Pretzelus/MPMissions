tasks = [];

destroy_trucks = player createSimpleTask ["destroy_trucks"];
destroy_trucks setSimpleTaskDescription ["","Destroy enemy supply trucks",""];
tasks = tasks + [destroy_trucks];

secure_hospital = player createSimpleTask ["secure_hospital"];
secure_hospital setSimpleTaskDescription ["","Secure hospital",""];
tasks = tasks + [secure_hospital];

destroy_fuel_north = player createSimpleTask ["destroy_fuel_north"];
destroy_fuel_north setSimpleTaskDescription ["","Destroy fuel station on the north.",""];
tasks = tasks + [destroy_fuel_north];

destroy_fuel_south = player createSimpleTask ["destroy_fuel_south"];
destroy_fuel_south setSimpleTaskDescription ["","Destroy fuel station on the south.",""];
tasks = tasks + [destroy_fuel_south];

secure_castle = player createSimpleTask ["secure_castle"];
secure_castle setSimpleTaskDescription ["","Secure Castle Kastro",""];
tasks = tasks + [secure_castle];