
//to be run within with scope
function set_fleet_target(targ_x, targ_y, final_target){
	action_x = targ_x;
	action_y = targ_y;
	target = final_target;
	action_eta=floor(point_distance(x,y,targ_x,targ_y)/128)+1;
}

function chase_fleet_target_set(){
	var targ_location;
	if (target.action!=""){
        goal_x=target.action_x;
        goal_y=target.action_y;
        targ_location=instance_nearest(goal_x,goal_y,obj_star);
	} else {
		targ_location=instance_nearest(target.x,target.y,obj_star);
	}
	action_x=targ_location.x;
    action_y=targ_location.y;
    action="";
    set_fleet_movement();    
}

function base_inquis_fleet (){
	owner=eFACTION.Inquisition;
    frigate_number=1;
    sprite_index=spr_fleet_inquisition;
    image_index=0;
    var roll=irandom(100)+1;
    inquisitor = 0;
    trade_goods="Inqis";
    if (roll>60){
        var inquis_choice = choose(2,3,4,5);
        inquisitor = inquis_choice
    }
}



// TODO maybe have the inquisitor or his team as an actual entity that goes around and can die, which gives the player time to fix stuff 
// either kill the inquisitor or he dies in combat

// Sets up an inquisitor ship to do an inspection on the HomeWorld
function new_inquisitor_inspection(){
	var inspection_set = false;
	var target_system = "none";
	var new_inquis_fleet;
    if (obj_ini.fleet_type==1){
    	var monestary_system = "none";
        // If player does not own their homeworld than do a fleet inspection instead
        var player_stars = [];
        with(obj_star){
            if (owner==eFACTION.Player) then array_push(player_stars,id);
            if (system_feature_bool(p_feature, P_features.Monastery)){
            	monestary_system=self;
            }
        }
        if (monestary_system!="none"){
        	target_system=monestary_system;
        } else if (array_length(player_stars)==1){
        	target_system=player_stars[0];
        }

        if (target_system!="none"){
            inspection_set = true;
            var target_star = target_system;
            var tar,new_inquis_fleet;
            var xx=target_star.x;
            var yy=target_star.y;

              //get the second or third closest planet to launch inquisitor from
            var from_star = distance_removed_star(target_star.x,target_star.y);            
            new_inquis_fleet=instance_create(from_star.x,from_star.y-24,obj_en_fleet);


            with (new_inquis_fleet){
            	base_inquis_fleet();
            	action_x=xx;
            	action_y=yy;
            	set_fleet_movement();
            }
            var mess=$"Inquisitor {obj_controller.inquisitor[new_inquis_fleet.inquisitor]}";
            mess += " wishes to inspect your chapter base at "+string(target_star.name);
            scr_alert("green","inspect",mess,target_star.x,target_star.y);
            obj_controller.last_world_inspection=obj_controller.turn;
        }
    }
    if  (obj_ini.fleet_type!=1 || !inspection_set){
        // If player does not own their homeworld than do a fleet inspection instead

        var target_player_fleet = get_largest_player_fleet();
        if (target_player_fleet != "none"){

            with(obj_star){
                if (owner==eFACTION.Eldar) then instance_deactivate_object(id);
            }

            //get the second or third closest planet to launch inquisitor from
            var from_star =distance_removed_star(target_player_fleet.x,target_player_fleet.y);

            new_inquis_fleet=instance_create(from_star.x,from_star.y-24,obj_en_fleet);
            var obj;
            with (new_inquis_fleet){
            	base_inquis_fleet();
            	target = target_player_fleet;
            	chase_fleet_target_set();
            	obj=instance_nearest(action_x,action_y,obj_star);
            	trade_goods+="_fleet";
            }              

            var mess=$"Inquisitor {obj_controller.inquisitor[new_inquis_fleet.inquisitor]}";

            mess+=" wishes to inspect your fleet at "+string(obj.name);
            scr_alert("green","inspect",mess,obj.x,obj.y);

            obj_controller.last_fleet_inspection=obj_controller.turn;

            instance_activate_object(obj_star);
        }
    }	
}


function get_largest_player_fleet(){

	var chosen_fleet = "none";
	if instance_exists(obj_p_fleet){
		with(obj_p_fleet){
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
	    
	    var eta;eta=0;
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