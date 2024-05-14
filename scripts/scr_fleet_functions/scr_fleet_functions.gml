
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
	        var goal_x=target.action_x;
	        var goal_y=target.action_y;
	        targ_location=instance_nearest(goal_x,goal_y,obj_star);
		} else {
			targ_location=instance_nearest(target.x,target.y,obj_star);
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
	if (target.action!=""){
        goal_x=target_intercept.action_x;
        goal_y=target_intercept.action_y;
        targ_location=instance_nearest(goal_x,goal_y,obj_star);
	} else {
		targ_location=instance_nearest(target_intercept.x,target_intercept.y,obj_star);
	}
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
	var all_ships = [];
	var i, ship_ident;
	with (fleet){
		for (i=1; i<=capital_number;i++){
			array_push(all_ships, capital_num[i]);
		}
		for (i=1; i<=frigate_number;i++){
			array_push(all_ships, frigate_num[i]);
		}
		for (i=1; i<=escort_number;i++){
			array_push(all_ships, escort_num[i]);
		}				
	}

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