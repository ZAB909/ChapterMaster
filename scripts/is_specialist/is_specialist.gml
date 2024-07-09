function role_groups(group){
	var role_list = [];
	var roles = obj_ini.role[100];
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
	            obj_ini.role[100][11],
	            obj_ini.role[100][7],
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
				"Techpriest"
			];
			break;
		case "captain_candidates":
			role_list = [
				roles[Role.SERGEANT], //sergeant
				roles[Role.VETERAN_SERGEANT],
				roles[Role.CHAMPION],				
				roles[Role.CAPTAIN],								
				roles[Role.TERMINATOR],				
				roles[Role.VETERAN],
				 obj_ini.role[100][11],			
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
						obj_ini.role[100][15],
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
		case "captain_candidates":
			specialists = role_groups("captain_candidates");
			break;			
	}

	return array_contains(specialists,unit_role);
}

function collect_role_group(group="standard", location="", opposite=false, search_conditions = {companies:"all"}){
	var units = [], unit, count=0, add=false, is_special_group;
	for (var com=0;com<=10;com++){
		var wanted_companies = search_conditions.companies;
		if (wanted_companies!="all"){
			if (is_array(wanted_companies)){
				if (!array_contains(wanted_companies, com)) then continue;
			} else {
				if (wanted_companies != com) then continue;
			}
		}
	    for (i=0;i<array_length(obj_ini.TTRPG[com]);i++){
	    	add=false;
			unit=fetch_unit([com,i]);
			if (unit.name()=="") then continue;
			if (is_array(group)){
				is_special_group = unit.IsSpecialist(group[0], group[1]);
			} else {
				is_special_group = unit.IsSpecialist(group);
			}
	        if ((is_special_group && !opposite) || (!is_special_group && opposite)){
	        	if (location==""){
	        		add=true;
	       		} else if (unit.is_at_location(location, 0, 0)){
	       			add=true;
	       		}
	        }
	        if (add){
	        	if (struct_exists(search_conditions, "stat")){
	        		add = stat_valuator(search_conditions[$ "stat"], unit);
	        	}
	        }
	        if (add) then array_push(units, obj_ini.TTRPG[com][i]);
	    }    
	}
	return units;
}

function stat_valuator(search_params, unit){
	match = true;
	for (var stat = 0;stat<array_length(search_params);stat++){
		if (search_params[stat][2] =="more"){
			if (unit[$ search_params[stat][0]] < search_params[stat][1]){
				match = false;
				break;
			}
		} else if(search_params[stat][2] =="less"){
				if (unit[$ search_params[stat][0]] > search_params[stat][1]){
				match = false;
				break;
			}           					
		}
	}
	return match;	
}

function collect_by_religeon(religion, sub_cult="", location=""){
	var units = [], unit, count=0, add=false;
	for (var com=0;com<=10;com++){
	    for (i=1;i<array_length(obj_ini.TTRPG[com]);i++){
	    	add=false;
			unit=obj_ini.TTRPG[com][i];
			if (unit.name()=="")then continue; 	
	        if (unit.religion == religion){
	        	if (sub_cult!=""){
	        		if (unit.religion_sub_cult != "sub_cult"){
	        			continue;
	        		}
	        	}
	        	if (location==""){
	        		add=true;
	       		} else if (unit.is_at_location(location, 0, 0)){
	       			add=true;
	       		}
	        }
	        if (add) then array_push(units, obj_ini.TTRPG[com][i]);
	    }    
	}
	return units;
}

function group_selection(group, selection_data){
	var unit, s, unit_location;
	obj_controller.selection_data = selection_data;
	with (obj_controller){
            menu=1;
            onceh=1;
            cooldown=8000;
            click=1;
            popup=0;
            selected=0;
            hide_banner=1;
            with(obj_fleet_select){instance_destroy();}
            with(obj_star_select){instance_destroy();}
            view_squad=false;
            managing=0;		
			zoomed=0;
			menu=1;
			managing=0;
			diplomacy=0;
            cooldown=8000;
            exit_button = new shutter_button();
            proceed_button = new shutter_button();
            selection_data.start_count=0;
        // Resets selections for next turn
            man_size=0;
            selecting_location="";
            selecting_types="";
            selecting_ship=0;
            selecting_planet=0;
            sel_uid=0;
            reset_manage_arrays();
            alll=0;              
            cooldown=10;
            sel_loading=0;
            unload=0;
            alarm[6]=7;
            company_data={};
            view_squad=false;
            managing =-1; 
            var vehicles = [];
            for (var i = 0; i< array_length(group);i++){
            	if (!is_struct(group[i])){
            		if (is_array(group[i])){
            			array_push(vehicles, group[i]);
            		}
            		continue;
            	}
            	unit = group[i];
            	add_man_to_manage_arrays(unit);

                if (selection_data.purpose_code=="forge_assignment"){
                	if (unit.job != "none"){
                		if (unit.job.type=="forge" && unit.job.planet== selection_data.planet){
							man_sel[array_length(display_unit)-1]=1;
							man_size++;
							selection_data.start_count++;

                		}                		
                	}
                }       	
            }
            var last_vehicle=0;
        if (array_length(vehicles)>0){
        	for (var veh=0;veh<array_length(vehicles);veh++){
        		unit = vehicles[veh];
        		add_vehicle_to_manage_arrays(unit)       		
        	}
        }
        other_manage_data();
        man_current=0;
        man_max=array_length(display_unit)+2;
        man_see=38-4;
	}
}
