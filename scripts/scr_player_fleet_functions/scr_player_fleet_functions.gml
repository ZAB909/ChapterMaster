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

function split_selected_into_new_fleet(start_fleet="none"){
	var new_fleet;
	if (start_fleet=="none"){
		new_fleet = instance_create(x,y,obj_p_fleet);
		new_fleet.owner  = eFACTION.Player;
        // Pass over ships to the new fleet, if they are selected
        var cap_number = capital_number+1;

        for (i=0; i<=cap_number;i++){
            if (capital[i]!="") and (capital_sel[i]){
            	move_ship_between_player_fleets(self, new_fleet,"capital", i);
            }
        }
        var frig_number = frigate_number+1;
        for (i=0; i<=frig_number;i++){
            if (frigate[i]!="") and (frigate_sel[i]){
            	move_ship_between_player_fleets(self, new_fleet,"frigate", i);
            }
        }
        var esc_number = escort_number+1;
        for (i=0; i<=esc_number;i++){
            if (escort[i]!="") and (escort_sel[i]){
            	move_ship_between_player_fleets(self, new_fleet,"escort", i)
            }
        }
       	set_player_fleet_image();	
	} else {
		with (start_fleet){
			new_fleet = split_selected_into_new_fleet();
		}
	}
	return new_fleet;
}

function cancel_fleet_movement(){
	var nearest_star = instance_nearest(x,y, obj_star);
    action="";
    x=nearest_star+24;
    y=nearest_star-24;
    action_x=0;
    action_y=0;
    complex_route=[];
    just_left=false;
}
function set_new_player_fleet_course(target_array){
	if (array_length(target_array)>0){
		var target_planet = target_array[0];
		var nearest_planet = instance_nearest(x,y,obj_star);
		var from_star = point_distance(nearest_planet.x,nearest_planet.y, x, y) <100;
		if (target_planet.id == nearest_planet.id && from_star){
			if (array_length(target_array)>1){
				target_planet = target_array[1];
				array_delete(target_array, 0, 2);
			} else {
				return "complex_route_finish";
			}
		} else {
			array_delete(target_array, 0, 1);
		}
		complex_route = target_array;
		var from_x = from_star ? nearest_planet.x:x;
		var from_y = from_star ? nearest_planet.y:y;
		action_eta=calculate_fleet_eta(from_x,from_y,target_planet.x,target_planet.y, action_spd, from_star, true);
		action_x = target_planet.x;
		action_y = target_planet.y;
		action="move";
		just_left=true;
		orbiting=0;
        x=x+lengthdir_x(48,point_direction(x,y,action_x,action_y));
        y=y+lengthdir_y(48,point_direction(x,y,action_x,action_y));
        set_fleet_location("Warp");
	}

}


function move_ship_between_player_fleets(out_fleet, in_fleet, class, index){
	if (class=="capital"){
		array_insert(in_fleet.capital, 1,out_fleet.capital[index]);
		array_insert(in_fleet.capital_num, 1,out_fleet.capital_num[index])
		array_insert(in_fleet.capital_uid, 1,out_fleet.capital_uid[index]);
		in_fleet.capital_number++;
		array_delete(out_fleet.capital, index, 1);
		array_delete(out_fleet.capital_num, index, 1);
		array_delete(out_fleet.capital_uid, index, 1);
		out_fleet.capital_number--;
	} else if (class=="frigate"){
		array_insert(in_fleet.frigate, 1,out_fleet.frigate[index]);
		array_insert(in_fleet.frigate_num, 1,out_fleet.frigate_num[index])
		array_insert(in_fleet.frigate_uid, 1,out_fleet.frigate_uid[index]);
		in_fleet.frigate_number++;
		array_delete(out_fleet.frigate, index, 1);
		array_delete(out_fleet.frigate_num, index, 1);
		array_delete(out_fleet.frigate_uid, index, 1);
		out_fleet.frigate_number--;
	}else if (class=="escort"){
		array_insert(in_fleet.escort, 1,out_fleet.escort[index]);
		array_insert(in_fleet.escort_num, 1,out_fleet.escort_num[index])
		array_insert(in_fleet.escort_uid, 1,out_fleet.escort_uid[index]);
		in_fleet.escort_number++;
		array_delete(out_fleet.escort, index, 1);
		array_delete(out_fleet.escort_num, index, 1);
		array_delete(out_fleet.escort_uid, index, 1);
		out_fleet.escort_number--;
	}
}
function set_player_fleet_image(){
    var ii=0;
    ii+=capital_number;
    ii+=round((frigate_number/2));
    ii+=round((escort_number/4));
    if (ii<=1) then ii=1;
    image_index=ii;	
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
function set_fleet_location(location){
	fleet_ships = fleet_full_ship_array();
	var temp;
	for (var i=0;i<array_length(fleet_ships);i++){
		temp = fleet_ships[i];
		obj_ini.ship_location[temp] = location;
	}
}
function player_fleet_ship_count(fleet="none"){
	var ship_count = 0;
	if (fleet=="none"){
		capital_number = 0;
		frigate_number = 0;
		escort_number = 0;

		for (i=1; i<=capital_number;i++){
			if (capital[i]!=""){
				ship_count++;
				capital_number++;
			}
		}
		for (i=1; i<=frigate_number;i++){
			if (frigate[i]!=""){
				ship_count++;
				frigate_number++;
			}
		}
		for (i=1; i<=escort_number;i++){
			if (escort[i]!=""){
				ship_count++;
				escort_number++;
			}
		}
	} else {
		with(fleet){
			ship_count = player_fleet_ship_count();
		}
	}
	return ship_count;		
}
function player_fleet_selected_count(fleet="none"){
	var ship_count = 0;
	if (fleet=="none"){
		for (i=1; i<=capital_number;i++){
			if (capital_sel[i]) then ship_count++;
		}
		for (i=1; i<=frigate_number;i++){
			if (frigate_sel[i]) then ship_count++;
		}
		for (i=1; i<=escort_number;i++){
			if (escort_sel[i]) then ship_count++;
		}
	} else {
		with(fleet){
			ship_count = player_fleet_selected_count();
		}		
	}
	return ship_count;			
}