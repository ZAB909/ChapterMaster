function role_groups(group){
	var role_list = [];
	switch (group){
		case "lib":
			role_list = [
						string("Chief {0}",obj_ini.role[100,17]),
						obj_ini.role[100,17], //librarian
						"Codiciery",
						"Lexicanum",
			];
			break;
		case "trainee":
			role_list = [
				string("{0} Aspirant",obj_ini.role[100,17]),
				string("{0} Aspirant",obj_ini.role[100,15]),  
				string("{0} Aspirant",obj_ini.role[100,14]),
				string("{0} Aspirant",obj_ini.role[100,16]),
			];
			break;
		case "heads":
			role_list = [
				"Master of Sanctity",
				string("Chief {0}", obj_ini.role[100,17]),
				"Forge Master", 
				"Chapter Master", 
				"Master of the Apothecarion"
			];
			break;
		case "veterans":
			role_list = [
				obj_ini.role[100,3],  //veterans
				obj_ini.role[100,4],  //terminatore
				obj_ini.role[100,19], //vet sergeant
				obj_ini.role[100,2],  //honour guard
			];
			break;
		case "rank_and_file":
			role_list = [
				obj_ini.role[100,8], //tactical marine
				obj_ini.role[100,9], //devastator
				obj_ini.role[100,10], //assualt
				obj_ini.role[100,12], //scout
			];
			break;

		case "squad_leaders":
			role_list = [
				obj_ini.role[100][18], //sergeant
				obj_ini.role[100][19],  //vet sergeant
			]
			break;
		case "command":
			role_list = [
	            obj_ini.role[100][5],
	            obj_ini.role[100][14],
	            obj_ini.role[100][15],
	            obj_ini.role[100][16],
	            obj_ini.role[100][17],
	            "Codiciery",
	            "Lexicanum",
	            "Standard Bearer",
	            "Company Champion",
	            "Champion"
	        ]; 
	        break;
	    case "dreadnoughts":
	        role_list = [
				obj_ini.role[100][6],//dreadnought
				string("Venerable {0}",obj_ini.role[100][6]),
			];
			break;
		case "forge":
	        role_list = [
				obj_ini.role[100][16],//techmarine
				"Forge Master",
			];
			break;	
	}
	return role_list;
}

function is_specialist(unit_role, type="standard", include_trainee=false) {

	// unit_role
	//TODO need to make all string roles not strings but array references
	switch(type){
		case "standard":
			specialists = ["Chapter Master",
							"Forge Master",
							"Master of Sanctity",
							"Master of the Apothecarion",
							string("Chief {0}",obj_ini.role[100][17]),//chief librarian
							obj_ini.role[100][5],//captain
							obj_ini.role[100][6],//dreadnought
							string("Venerable {0}",obj_ini.role[100][6]),
							obj_ini.role[100][7],//company_champion
							obj_ini.role[100][14],//chaplain
							obj_ini.role[100][15],//apothecary
							obj_ini.role[100][16],//techmarine
							obj_ini.role[100][17], //librarian
							"Codiciery",
							"Lexicanum",
							obj_ini.role[100,2],//honour guard
			];
			if (include_trainee){
				array_push(specialists, 
							 string("{0} Aspirant",obj_ini.role[100][17]),
							 string("{0} Aspirant",obj_ini.role[100][15]),  
							 string("{0} Aspirant",obj_ini.role[100][14]),
							 string("{0} Aspirant",obj_ini.role[100][16]),
							 );
			}
			break;
      
		case "libs":
			specialists = role_groups("lib");
			if (include_trainee){
				array_push(specialists,  string("{0} Aspirant",obj_ini.role[100][17]));
			}
			break;
		case "forge":
			specialists = role_groups("forge");
			if (include_trainee){
				array_push(specialists,  string("{0} Aspirant",obj_ini.role[100][16]));
			}			
			break;
		case "chap":
			specialists = [
						obj_ini.role[100][14],//techmarine
						"Master of Sanctity",
			];
			if (include_trainee){
				array_push(specialists,  string("{0} Aspirant",obj_ini.role[100][14]));
			}			
			break;
		case "apoth":
			specialists = [
						obj_ini.role[100][15],//techmarine
						"Master of the Apothecarion",
			];
			if (include_trainee){
				array_push(specialists,  string("{0} Aspirant",obj_ini.role[100][15]));
			}			
			break;
		case "heads":
			specialists = role_groups("heads");
			break;
		case "command":	
			specialists = role_groups("command");
			break;	
		case "trainee":	
			specialists = role_groups("trainee");
			break;
		case "rank_and_file":
			specialists = role_groups("rank_and_file");
			break;
		case "squad_leaders":
			specialists = role_groups("squad_leaders");
			break;
		case "dreadnoughts":
			specialists = role_groups("dreadnoughts");	
			break;
		case "veterans":
			specialists = role_groups("veterans");
			break;
	}

	return array_contains(specialists,unit_role);
}

function collect_role_group(group, location=""){
	var units = [], unit, count=0, add=false;
	for (var com=0;com<=10;com++){
	    for (i=1;i<array_length(obj_ini.TTRPG[com]);i++){
	    	add=false;
			unit=obj_ini.TTRPG[com][i];
			if (unit.name()=="")then continue; 	
	        if (unit.IsSpecialist(group)){
	        	if (location==""){
	        		add=true;
	       		} else if (obj_ini.loc[com][i] == location){
	       			add=true;
	       		}
	        }
	        if (add) then array_push(units, obj_ini.TTRPG[com][i]);
	    }    
	}
	return units;
}
