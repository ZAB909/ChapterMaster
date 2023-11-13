function scr_count_forces(_unit_location, _target_location, _is_planet) {

	// Works similar to scr_battle_roster but merely counts the forces
	// Used for the obj_turn_end display to give a sense of player forces

	// argument 0 : planet or ship
	// argument 1 : world number (wid)
	// argument 2 : is it a planet?  boolean

	//--------------------------------------------------------------------------------------------------------------------
	// Global objects used.
	//--------------------------------------------------------------------------------------------------------------------
	checked_unit=obj_ini;
	//--------------------------------------------------------------------------------------------------------------------

	if (_is_planet){
		info_mahreens=0;
		info_vehicles=0;
		//For each of the companies (HQ + 10)
		for(var company=0;company<11;company++)
		{
			//For now, obj_ini arrays start at array[1].
			var i = 1;
			
			//For each unit in that company, while unit exists
			//Marines and vehicles get checked AT THE SAME TIME
			//This is possible since array for saving vehicles and marines are separated
			while ((checked_unit.name[company][i]!="" || i<=array_length(veh_race[company])) && i<500)
			{
				if (checked_unit.race[company][i]==1)					&& 
				   (checked_unit.loc[company][i]==_unit_location)		&& 
				   (checked_unit.wid[company][i]==_target_location)
				{
					info_mahreens+=1;
				}
				
				if (i<=array_length(veh_race[company])){
					if (checked_unit.veh_race[company][i]=1)				&& 
					   (checked_unit.veh_loc[company][i]=_unit_location)	&& 
					   (checked_unit.veh_wid[company][i]=_target_location)		
					{
						info_vehicles+=1;
					}
				}
				
				i++
			}
		}
	}
}
