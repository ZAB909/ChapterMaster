// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fleet_has_roles(fleet="none", roles){
	var all_ships = fleet_full_ship_array(fleet);
	var unit;
	for (var i=0;i<=10;i++){
		for (var s=0;s<500;s++){
			unit=fetch_unit([i,s]);
			if (unit.planet_location<1){
				if (array_contains(all_ships,unit.ship_location)){
					if (array_contains(roles, unit.role())){

						return true;
					}
				}
			}
		}
	}
}

function fleet_full_ship_array(fleet="none"){
	var all_ships = [];
	var i;
	if (fleet=="none"){
		for (i=1; i<=capital_number;i++){
			array_push(all_ships, capital_num[i]);
		}
		for (i=1; i<=frigate_number;i++){
			array_push(all_ships, frigate_num[i]);
		}
		for (i=1; i<=escort_number;i++){
			array_push(all_ships, escort_num[i]);
		}			
	} else {
		with (fleet){
			all_ships = fleet_full_ship_array();
		}
	}
	return all_ships;
}