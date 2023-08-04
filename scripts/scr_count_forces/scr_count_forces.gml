function scr_count_forces(argument0, argument1, argument2) {

	// Works similar to scr_battle_roster but merely counts the forces
	// Used for the obj_turn_end display to give a sense of player forces

	// argument 0 : planet or ship
	// argument 1 : world number (wid)
	// argument 2 : is it a planet?  boolean

	//--------------------------------------------------------------------------------------------------------------------
	// Global objects used.
	//--------------------------------------------------------------------------------------------------------------------
	deploying_unit=obj_ini;
	//--------------------------------------------------------------------------------------------------------------------

	var unit_location, target_location, is_planet;
	unit_location=argument0;
	target_location=argument1;
	is_planet = argument2;

	if (is_planet=true){
	    var co, v;
	    co=0;v=0;
    
	    repeat(3600){
	        if (co<11){v+=1;
        
	            if (v>300){co+=1;v=1;/*show_message("mahreens at the start of company "+string(co)+" is equal to "+string(info_mahreens));*/}
        
	            if (co>10) then exit;
            
	            if (deploying_unit.race[co,v]=1) and (deploying_unit.loc[co,v]=unit_location) and (deploying_unit.wid[co,v]=target_location){info_mahreens+=1;}
        
	            if (v<=100){
	                if (deploying_unit.veh_race[co,v]=1) and (deploying_unit.veh_loc[co,v]=unit_location) and (deploying_unit.veh_wid[co,v]=target_location){info_vehicles+=1;}
	            }
	        }
	    }
	}
}
