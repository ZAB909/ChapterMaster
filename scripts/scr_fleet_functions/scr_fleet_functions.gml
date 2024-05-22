
//function fr tallying arrays
function array_sum(_prev, _curr, _index) {
    return _prev + _curr;
}



//to be run within with scope
function set_fleet_target(targ_x, targ_y, final_target){
	action_x = targ_x;
	action_y = targ_y;
	target = final_target;
	action_eta=floor(point_distance(x,y,targ_x,targ_y)/128)+1;
}

function fleets_next_location(fleet="none"){
	var targ_location ="none";
	if (fleet=="none"){
		if (action!=""){
	        var goal_x=fleet.action_x;
	        var goal_y=fleet.action_y;
	        targ_location=instance_nearest(goal_x,goal_y,obj_star);
		} else {
			targ_location=instance_nearest(fleet.x,fleet.y,obj_star);
		}		
	} else {
		with (fleet){
			targ_location = fleets_next_location();
		}
	}
	return targ_location.id;
}
function chase_fleet_target_set(){
	var targ_location = fleets_next_location(target);
	if (targ_location!="none"){
		action_x=targ_location.x;
	    action_y=targ_location.y;
	    action="";
	    set_fleet_movement();
	}
}

function fleet_intercept_time_calculate(target_intercept){
	var intercept_time = -1
	targ_location = fleets_next_location(target_intercept);
	if (instance_exists(targ_location)){
		intercept_time=floor(point_distance(x,y,action_x,action_y)/action_spd)+1;
	}
	return intercept_time;
}


function get_largest_player_fleet(){

	var chosen_fleet = "none";
	if instance_exists(obj_p_fleet){
		with(obj_p_fleet){
			if (point_in_rectangle(x, y, 0, 0, room_width, room_height)){
				if (chosen_fleet=="none"){
					chosen_fleet=self;
					continue;
				}
				if (!(capital_number==0 && chosen_fleet.capital_number==0)){
					if (capital_number>chosen_fleet.capital_number){
						chosen_fleet = self;
					}
				} else if (!(frigate_number==0 && chosen_fleet.frigate_number==0)) {
					if (frigate_number>chosen_fleet.frigate_number){
						chosen_fleet = self;
					}
				}else if (!(escort_number==0 && chosen_fleet.escort_number==0)) {
					if (escort_number>chosen_fleet.escort_number){
						chosen_fleet = self;
					}
				}
			}
		}
	}
	return chosen_fleet;
}

function get_nearest_player_fleet(nearest_x, nearest_y){
	var chosen_fleet = "none";
	if instance_exists(obj_p_fleet){
		with(obj_p_fleet){
			if (point_in_rectangle(x, y, 0, 0, room_width, room_height)){
				if (chosen_fleet=="none"){
					chosen_fleet=self;
					continue;
				}
				if (point_distance(nearest_x, nearest_y,x,y) < point_distance(nearest_x, nearest_y,chosen_fleet.x,chosen_fleet.y)){
					chosen_fleet=self;
				}
			}
		}
	}
	return chosen_fleet;	
}

function set_fleet_movement(){
	if (action!=""){
	    var sys, sys_dist, mine, connected, fleet, cont;
	    sys_dist=9999;connected=0;cont=0;
	    
	    fleet=instance_id_get( 0 );
	    sys=instance_nearest(action_x,action_y,obj_star);
	    sys_dist=point_distance(action_x,action_y,sys.x,sys.y);
	    act_dist=point_distance(x,y,sys.x,sys.y);
	    mine=instance_nearest(x,y,obj_star);
	    if (mine.x=sys.x2) and (mine.y=sys.y2) then connected=1;
	    
	    var eta=0;
	    eta=floor(point_distance(x,y,action_x,action_y)/action_spd)+1;
	    if (connected=0) then eta=eta*2;
	    if (connected=1) then connected=1;
	    
	    if (owner=eFACTION.Inquisition) and (action_eta<2) then action_eta=2;
	    // action_x=sys.x;
	    // action_y=sys.y;
	    action="move";
	    
	    if (owner != eFACTION.Eldar) and (mine.storm>0) then action_eta+=10000;
	    
	    x=x+lengthdir_x(24,point_direction(x,y,sys.x,sys.y));
	    y=y+lengthdir_y(24,point_direction(x,y,sys.x,sys.y));
	}


	if (action=""){
	    var sys, sys_dist, mine, connected, fleet, cont, target_dist;
	    sys_dist=9999;connected=0;cont=0;target_dist=0;
	    
	    fleet=id;
	    sys=instance_nearest(action_x,action_y,obj_star);
	    sys_dist=point_distance(action_x,action_y,sys.x,sys.y);
	    if (target!=0) and (instance_exists(target)) then target_dist=point_distance(x,y,target.action_x,target.action_y);
	    act_dist=point_distance(x,y,sys.x,sys.y);
	    mine=instance_nearest(x,y,obj_star);
	    
	    // if (owner = eFACTION.Tau) then mine.tau_fleets-=1;
	    // if (owner = eFACTION.Tau) and (image_index!=1) then mine.tau_fleets-=1;
	    // mine.present_fleets-=1;
	    
	    
	    if (mine.buddy=sys) then connected=1;
	    if (sys.buddy=mine) then connected=1;
	    
	    cont=1;
	    
	    
	    if (cont=1){
	        cont=20;
	    }
	    
	    
	    if (cont=20){// Move the entire fleet, don't worry about the other crap
	        var eta;eta=0;
	        
	        if (trade_goods!="") and (owner != eFACTION.Tyranids) and (owner != eFACTION.Chaos) and (string_count("Inqis",trade_goods)=0) and (string_count("merge",trade_goods)=0)and (string_count("_her",trade_goods)=0) and (trade_goods!="cancel_inspection") and (trade_goods!="return"){
	            if (target!=0) and (instance_exists(target)){
	                if (target.action!=""){
	                    if (target_dist>sys_dist){
	                        action_x=target.action_x;
	                        action_y=target.action_y;
	                        sys=instance_nearest(action_x,action_y,obj_star);}
	                }
	            }
	        }        
	        
	        eta=floor(point_distance(x,y,action_x,action_y)/action_spd)+1;
	        if (connected=0) then eta=eta*2;
	        if (connected=1) then connected=1;
	        
	        if (action_eta<=0) or (owner  != eFACTION.Inquisition){
	            action_eta=eta;
	            if (owner  = eFACTION.Inquisition) and (action_eta<2) and (string_count("_her",trade_goods)=0) then action_eta=2;
	        }
	        
	        if (owner != eFACTION.Eldar) and (mine.storm>0) then action_eta+=10000;
	        
	        // action_x=sys.x;
	        // action_y=sys.y;
	        action="move";
	        
	        if (minimum_eta>action_eta) and (minimum_eta>0) then action_eta=minimum_eta;
	        minimum_eta=0;
	        if (etah>action_eta) and (etah!=0) then action_eta=etah;
	        
	        x=x+lengthdir_x(24,point_direction(x,y,sys.x,sys.y));
	        y=y+lengthdir_y(24,point_direction(x,y,sys.x,sys.y));
	    }
	}

	etah=0;	
}


//TODO build into unit struct
function load_unit_to_fleet(fleet, unit){
	var loaded = false;
	var all_ships = fleet_full_ship_array(fleet);
	var i, ship_ident;

	for (i=0;i<array_length(all_ships);i++){
		ship_ident = all_ships[i];
		  if (obj_ini.ship_capacity[ship_ident]>obj_ini.ship_carrying[ship_ident]){
		  	obj_ini.ship_carrying[ship_ident]+=unit.size;
		  	unit.planet_location=0;
		  	obj_ini.loc[unit.company][unit.marine_number]=obj_ini.ship_location[ship_ident];
		  	unit.ship_location=ship_ident;
		  	loaded=true;
		  	break
		  }
	}
	return loaded;
}

function fastest_route_algorithm(start_x,start_y, xx,yy,ship_speed, start_from_star=false) constructor{
	var star_number = instance_number(obj_star);
	target = instance_nearest(xx,yy,obj_star);
	self.ship_speed = ship_speed;
	worst_case = (floor(point_distance(start_x,start_y, xx,yy)/ship_speed+2))*2;
	start_star = instance_nearest(start_x,start_y,obj_star).id;
	unvisited_stars = [
		[start_star,-1, [], false],
		[target,-1, [], false],
	];

	for (var i = 0; i < star_number; i++){
		if (instance_find(obj_star,i).id == start_star.id) then continue;
		if (instance_find(obj_star,i).id == target.id) then continue;
		var i_star = instance_find(obj_star,i);
		for (var s=1;s<array_length(unvisited_stars);s++){
			var s_star = unvisited_stars[s][0];
			if (point_distance(i_star.x,i_star.y, start_star.x,start_star.y)<point_distance(s_star.x,s_star.y, start_star.x,start_star.y)){
				array_insert(unvisited_stars, s, [i_star,-1, [], false]);
				break;
			}
		}
	};

	function find_star_travel_distances(cur_star_id){
		var current_star = unvisited_stars[cur_star_id][0];
		var cur_travel = unvisited_stars[cur_star_id][1];
		var eta;
		var warp_lane = false;
		for (var s=cur_star_id+1; s<array_length(unvisited_stars);s++){
			var visit_data = unvisited_stars[s];
			if (visit_data[3]) then continue;
			visit_star = unvisited_stars[s][0];
			warp_lane = current_star.buddy==visit_star || visit_star.buddy == current_star;
			eta=floor(point_distance(current_star.x,current_star.y,visit_star.x,visit_star.y)/ship_speed)+1;
			if (eta){
				if (!warp_lane) then eta*=2;
				if (current_star.storm) then eta += 900;
				if (eta+cur_travel<visit_data[1]
					|| visit_data[1]==-1 ){
					visit_data[1] = eta+cur_travel;
					visit_data[2] =[];
					for (var c=0;c<array_length(unvisited_stars[cur_star_id][2]);c++){
						array_push(visit_data[2], unvisited_stars[cur_star_id][2][c]);
					}
					if (!array_contains(visit_data[2], current_star.id)){
						array_push(visit_data[2], current_star.id);
					};
				}
			} else {
				visit_data[3] = true;
			}
			/*if (cur_star_id==0){
				if (eta>worst_case){
					visit_data[3] = true;
				}
			}*/
			unvisited_stars[s] = visit_data;
		}
		unvisited_stars[cur_star_id][3] = true;
	}

	for (var i=0;i<array_length(unvisited_stars);i++){
		if (!unvisited_stars[i][3]){
			find_star_travel_distances(i);
		}
	}

	final_route_info = unvisited_stars[array_length(unvisited_stars)-1];
	static draw_route = function(){
	    draw_set_color(c_blue);
        draw_set_alpha(1);            
        var cur_star = start_star;
        for (var i=0;i<array_length(final_route_info[2]);i++){
             draw_line_dashed(cur_star.x,cur_star.y,final_route_info[2][i].x,final_route_info[2][i].y,16,0.5);
             cur_star = final_route_info[2][i];
        }
        draw_line_dashed(cur_star.x,cur_star.y,final_route_info[0].x,final_route_info[0].y,16,0.5);
        var eta = $"ETA {final_route_info[1]}";
        if (obj_controller.zoomed=0) then draw_text_transformed(cur_star.x+16,cur_star.y+15,eta,1,1,0);
        if (obj_controller.zoomed=1) then draw_text_transformed(cur_star.x+24,cur_star.y+40,eta,5,5,0);             
	}
}













