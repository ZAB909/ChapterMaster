function scr_count_forces(argument0, argument1, argument2) {

	// argument 0 : planet or ship
	// argument 1 : world number (wid)
	// argument 2 : is it a planet?  boolean

	// Works similar to scr_battle_roster but merely counts the forces
	// Used for the obj_turn_end display to give a sense of player forces

	var fiy, secc;
	fiy=argument0;
	secc=argument1;


	if (argument2=true){
	    var co, v;
	    co=0;v=0;
    
	    repeat(3600){
	        if (co<11){v+=1;
        
	            if (v>300){co+=1;v=1;/*show_message("mahreens at the start of company "+string(co)+" is equal to "+string(info_mahreens));*/}
        
	            if (co>10) then exit;
            
	            if (obj_ini.race[co,v]=1) and (obj_ini.loc[co,v]=fiy) and (obj_ini.wid[co,v]=secc){info_mahreens+=1;}
        
	            if (v<=100){
	                if (obj_ini.veh_race[co,v]=1) and (obj_ini.veh_loc[co,v]=fiy) and (obj_ini.veh_wid[co,v]=secc){info_vehicles+=1;}
	            }
    
	        }
	    }

	}


}
