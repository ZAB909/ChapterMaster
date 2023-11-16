function scr_load_decide_loc(role_type, role, is_vehicle) {

	// role_type = "unit role" or "ground" or "space"
	// role = "unit role"
	// is_vehicle = vehicle?

	// This script determines the majory location of a particular unit type and then sets the selecting_location string to that

	var nope=0;

	//if (selecting_location!="") or (selecting_planet!=0) or (selecting_ship!=0) then nope=1;

	if (nope==0){
	    var master_loc=0,ship_id_list=0,ship_selection_list=0,i=-1,j=0,good=0,location_list="",unit_location="",planet_number_list=0;
    
	    for(i=0;i<100;i++){
	    	location_list[i]="";
	    	ship_id_list[i]=0;
	    	ship_selection_list[i]=0;
	    	planet_number_list[i]=0;
	    }
	    i=0;j=0;
    
	    if (role_type="man"){
	        for(i=0;i<301;i++){
	        	unit_location=ma_loc[i];
	        	if (ma_lid[i]>0) then unit_location=obj_ini.ship[ma_lid[i]];
	            if (man[i]="man") and (ma_role[i]!="") and (ma_god[i]<10){
	                j=0;
	                good=0;
                
	                for(j=1;j<91;j++){
	                	if (good=0){
		                    if (location_list[j]=unit_location) and (planet_number_list[j]=ma_wid[i]){
		                    	good=1;
		                    	ship_id_list[j]+=1;

		                    }
	                	}
	                }
	                if (good=0){
	                	for (j=1;j<91;j++){
	                		if (good=0){
			                    if (location_list[j]=""){
			                    	good=1;
			                    	ship_id_list[j]=1;
			                    	ship_selection_list[j]=ma_lid[i];
			                    	location_list[j]=unit_location;
			                    	planet_number_list[j]=ma_wid[i];
			                    }
	                		}
	                	}	
	               	}
	            }
	        }
	        for(j=1;j<91;j++){
	        	if (location_list[j]!="") and (ship_id_list[j]>ship_id_list[master_loc]) then master_loc=j;
	        }
	        selecting_location=location_list[master_loc];
	        selecting_planet=planet_number_list[master_loc];
	        selecting_ship=ship_selection_list[master_loc];
	    }
	    i=0;j=0;
    
	    if (role_type="vehicle"){
	        for(i=0;i<301;i++){
	        	unit_location=ma_loc[i];if (ma_lid[i]>0) then unit_location=obj_ini.ship[ma_lid[i]];
	            if (man[i]="vehicle") and (ma_role[i]!=""){
	                j=0;good=0;
                
	                for(j=1;j<91;j++){
	                	if (good=0){
	                    if (location_list[j]=unit_location) and (planet_number_list[j]=ma_wid[i]){
	                    	good=1;
	                    	ship_id_list[j]+=1;
	                    }
	                }}
	                if (good=0){j=0;for(j=1;j<91;j++){
	                	if (good=0){
			                if (location_list[j]=""){
			                    	good=1;
			                    	ship_id_list[j]=1;
			                    	ship_selection_list[j]=ma_lid[i];location_list[j]=unit_location;
			                    	planet_number_list[j]=ma_wid[i];
			                    }
			                }
			            }
			        }
	            }
	        }
	        j=0;for(j=1;j<91;j++){
	        	if (location_list[j]!="") and (ship_id_list[j]>ship_id_list[master_loc]) then master_loc=j;}
	        selecting_location=location_list[master_loc];selecting_planet=planet_number_list[master_loc];selecting_ship=ship_selection_list[master_loc];
	    }
	    i=0;j=0;
    
	    if (role_type="command"){
	        for(i=1;i<101;i++){
	        	unit_location=ma_loc[i];
	        	if (ma_lid[i]>0) then unit_location=obj_ini.ship[ma_lid[i]];
	            if (man[i]="man") and (ma_god[i]<10){
	                if (ma_role[i]=obj_ini.role[100][5]) or (ma_role[i]=obj_ini.role[100][14]) or (ma_role[i]=obj_ini.role[100][15]) or (ma_role[i]="Standard Bearer") or (ma_role[i]="Company Champion") or (ma_role[i]="Champion"){
	                    j=0;good=0;
	                    for(j=1;j<91;j++){
	                    	if (good=0){
	                        if (location_list[j]=unit_location) and (planet_number_list[j]=ma_wid[i]){
	                        	good=1;
	                        	ship_id_list[j]+=1;
	                        }
	                    }}
	                    if (good=0){
	                    	j=0;for(j=1;j<91;j++){
			                    if (good=0){
			                        if (location_list[j]=""){
			                        	good=1;
			                        	ship_id_list[j]=1;
			                        	ship_selection_list[j]=ma_lid[i];location_list[j]=unit_location;
			                        	planet_number_list[j]=ma_wid[i];
			                        }
			                    }
			                }
			            }
	                }
	            }
	        }
	        j=0;for(j=1;j<91;j++){
	        	if (location_list[j]!="") and (ship_id_list[j]>ship_id_list[master_loc]) then master_loc=j;}
	        selecting_location=location_list[master_loc];selecting_planet=planet_number_list[master_loc];selecting_ship=ship_selection_list[master_loc];
	    }
	    i=0;j=0;
    
	    if (role_type="unit role") and (is_vehicle=false){
	        for (i=0;i<301;i++){
	        	unit_location=ma_loc[i];
	        	if (ma_lid[i]>0) then unit_location=obj_ini.ship[ma_lid[i]];
	            if (man[i]="man") and (ma_role[i]=role) and (ma_god[i]<10){
	                good=0;
                
	                for(j=1;j<91;j++){
	                	if (good=0){
		                    if (location_list[j]=unit_location) and (planet_number_list[j]=ma_wid[i]){
		                    	good=1;
		                    	ship_id_list[j]+=1;
		                    }
	                	}
	            	}
	                if (good=0){
	                	j=0;
	                	for(j=1;j<91;j++){
		                	if (good=0){
			                    if (location_list[j]=""){
			                    	good=1;
			                    	ship_id_list[j]=1;
			                    	ship_selection_list[j]=ma_lid[i];location_list[j]=unit_location;
			                    	planet_number_list[j]=ma_wid[i];
			                    }
		                	}
		            	}
		            }
	            }
	        }
        
	        j=0;for(j=1;j<91;j++){
	        	if (location_list[j]!="") and (ship_id_list[j]>ship_id_list[master_loc]) then master_loc=j;
	        }
	        selecting_location=location_list[master_loc];
	        selecting_planet=planet_number_list[master_loc];
	        selecting_ship=ship_selection_list[master_loc];
	        // show_message(selecting_location);
	        // game_end();
	    }
	    i=0;j=0;
    
    
	    if (role_type="unit role") and (is_vehicle=true){
	        for(i=0;i<301;i++){
	        	unit_location=ma_loc[i];
	        	if (ma_lid[i]>0) then unit_location=obj_ini.ship[ma_lid[i]];
	            if (man[i]="vehicle") and (ma_role[i]=role){
	                j=0;good=0;
                
	                for(j=1;j<91;j++){
	                	if (good=0){
		                    if (location_list[j]=unit_location) and (planet_number_list[j]=ma_wid[i]){
		                    	good=1;
		                    	ship_id_list[j]+=1;
		                    }
		                }
		            }
	                if (good=0){
	                	j=0;for(j=1;j<91;j++){
		                	if (good=0){
				                if (location_list[j]=""){
			                    	good=1;
			                    	ship_id_list[j]=1;location_list[j]=unit_location;
			                    	planet_number_list[j]=ma_wid[i];
			                    }
			                }
			            }
			        }
	            }
	        }
	        j=0;for(j=1;j<91;j++){
	        	if (location_list[j]!="") and (ship_id_list[j]>ship_id_list[master_loc]) then master_loc=j;}
	        selecting_location=location_list[master_loc];selecting_planet=planet_number_list[master_loc];selecting_ship=ship_selection_list[master_loc];
	    }
	    i=0;j=0;
    
    
	    if (selecting_ship>0) then sel_loading=selecting_ship;
    
	}


}
