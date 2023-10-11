function scr_random_marine(role, exp_req, search_params="none"){

	// role : role
	// exp_req: exp
	//search params : a struct giving extra search information defaults to "none"

	var company, i,  comp_size, unit, match, r, unit_role;
	company=0;i=0;
	var company_list = [0,1,2,3,4,5,6,7,8,9,10]

	for (var comp_shuffle=0;comp_shuffle<11;comp_shuffle++;){
		// this ensures that companies are searched randomly
		var new_comp = irandom(array_length(company_list)-1);
		company = company_list[new_comp];
		array_delete(company_list, new_comp, 1);
		if (!is_array(role)){
			if (string_count("Aspirant",role)>0){
				comp_shuffle=15;
				company = 0;
			}
		}
	    if (company<=10){
	    	comp_size = array_length(obj_ini.name[company]);

	    	//TODO make sure marines within company are searched randomly
	        for(i=1;i<comp_size;i++;){
	        	match = true
	        	unit = obj_ini.TTRPG[company, i]

	        	//exit if not real name
	        	if (unit.name() == "") or (unit.name() == 0) then continue;

	        	//check correct search param roles
	        	unit_role = unit.role()
	        	if (unit_role == "Chapter Master") then continue;
	        	//if list of matchable roles given
	        	if (is_array(role)){
            		match = false;
            		for(r=0;r<array_length(role);r++;){
            			if (unit_role == role[r]){
            				match = true;
            				break;
            			}
            		}
            		//if no role matches quit
            		if (!match) then continue;

            		//if single matchable role given
            	} else if (role!=""){
            		if (unit_role!=role) then continue;
            	}

            	//check corect experience
            	if (unit.experience()<exp_req) then continue;

            	//if extra search parmas struct submitted
            	if (is_struct(search_params)){

            		//if searching for marines with particular traits
            		if (struct_exists(search_params, "trait")){
            			//list of traits (all required) need an option for if only one is required
            			if (is_array(search_params[$ "trait"])){
            				for(var trait=0;trait<array_length(search_params[$ "trait"]);trait++;){
            					if (!array_contains(unit.traits, search_params[$ "trait"][trait])){
            						match = false;
            						break;
            					}
            				}
            			} else {
            				//search for single trait
            				if (!array_contains(unit.traits, search_params[$ "trait"])){
            					match = false;
            				}
            			}
            			//move to next unit if unit did not have required traits
            			if (!match) then continue;
            		}
            		if (struct_exists(search_params, "stat")){
            			for (var stat = 0;stat<array_length(search_params[$ "stat"]);stat++;){
            				if (search_params[$ "stat"][stat][2] =="more"){
            					if (unit[$ search_params[$ "stat"][stat][0]] < search_params[$ "stat"][stat][1]){
            						match = false;
									break;
            					}
            				} else if(search_params[$ "stat"][stat][2] =="less"){
 								if (unit[$ search_params[$ "stat"][stat][0]] > search_params[$ "stat"][stat][1]){
            						match = false;
									break;
            					}           					
            				}
            			}
            			if (!match) then continue;
            		}
            	}
            	//if match made exit loop and return unit
	            if (match){
	            	return [company, i];
	            }
	        }
	    }
	}

	return "none"

}
