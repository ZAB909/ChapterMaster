// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function khorne_fleet_cargo(){
	//This handles khorne fleets killing planet popultions moving planet and then choosing a new target ot chase
	var orb=orbiting; 
	if (orb!=0) and (instance_exists(orb)) and (action=""){
        array_reduce(orb.present_fleet, array_sum,1)
        if (orb.present_fleet[1]+orb.present_fleet[2]+orb.present_fleet[3]+orb.present_fleet[6]+orb.present_fleet[7]+orb.present_fleet[9]+orb.present_fleet[13]=0){
            var ii=0,good=0,part=0,find_new_planet=false;
            
            // No forces already landed
            with (orb){
                repeat(planets){
                    ii+=1;
                    if (planet_feature_bool(p_feature[ii], P_features.World_Eaters)==1) {
                        good-=1;
                        
                        if (planet_imperium_ground_total(ii)<=0){
                           if (p_population[ii]>p_max_population[ii]/20){
                                p_population[ii]=round(p_population[ii]/2);
                                if (p_population[ii]<=p_max_population[ii]/20) then find_new_planet=true;
                            }
                        } else if (p_population[ii]<=p_max_population[ii]/20) then find_new_planet=true;
                    }
                }
                // Next planet; rembark the chaos forces
                if (find_new_planet=true){
                    ii=0;
                    find_new_planet=false;
                    repeat(planets){
                        ii+=1;
                        if (planet_feature_bool(p_feature[ii], P_features.World_Eaters)==1){
                            p_chaos[ii]=0;
                            p_traitors[ii]=max(4,p_traitors[ii]+1);
                            delete_features(p_feature[ii], P_features.World_Eaters);
                            find_new_planet=true;
                        }
                    }
                }                
            }

            // No forces landed
            if ((good=0) or (find_new_planet=true)){
				ii=0;
				var landing_planet=0;
                with (orb){
                    repeat(planets) {
                        ii+=1;
                        if (landing_planet=0) and (trade_goods="Khorne_warband"){
                            if (planet_imperium_ground_total(ii)>0) and (p_population[ii]>p_max_population[ii]/20){
                                array_push(p_feature[ii], new new_planet_feature(P_features.World_Eaters));
                                landing_planet=ii;
                                p_chaos[ii]=6;
                                break;
                            }// Forces landed
                        }
                        if (landing_planet=0) and (trade_goods="Khorne_warband_landing_force"){
                            if (p_player[ii]>0) and (p_population[ii]>p_max_population[ii]/20){
                                landing_planet=ii;
                                p_chaos[ii]=6;
                                array_push(p_feature[ii], new new_planet_feature(P_features.World_Eaters));
                                break;
                            }// Forces landed
                        }
                    }
                }
                
                if (landing_planet=0) and (trade_goods!="Khorne_warband_landing_force"){// Nothing to see here, continue to next star*/
                    ii=0;
                    
                    with(orb) {
						instance_deactivate_object(id);
					}
					
                    with(obj_star) {
						if (owner=eFACTION.Chaos) or (owner=eFACTION.Ork) or (owner=eFACTION.Necrons) or (owner=eFACTION.Eldar){
                            instance_deactivate_object(id)
                        } else {
                            for (var p =1;p<=planets;p++){
                                if (p_type[p] != "Dead") then break;
                                if (p == planets) then instance_deactivate_object(id);
                            }
                        }
					}
					var bd,b;
                    with(obj_star) {
						bd=0;
						b=0;
                        repeat(planets) {
							b+=1;
							if (planet_imperium_ground_total(b)>0) and (p_population[b]>p_max_population[b]/20) then bd+=1;
						}
                        if (bd==4) then instance_deactivate_object(id);
                    }
                    
                    var nx,ny,n2,yy2,ndir,next_star;
					next_star=0;
                    ndir = point_direction(x,y,home_x,home_y);
                    nx  = x+lengthdir_x(250,ndir);
					ny  = y+lengthdir_y(250,ndir);
                    n2  = x+lengthdir_x(450,ndir);
					yy2 = y+lengthdir_y(450,ndir);
                    
					
					if !point_in_rectangle(n2,yy2, 50,50,room_width,room_height) {
						trade_goods="Khorne_warband_landing_force";
                        // show_message("Khorne_warband_landing_force");
                    }
                    
                    if (trade_goods!="Khorne_warband_landing_force") {
                        next_star=instance_nearest(nx,ny,obj_star);
                        action_x=next_star.x;
                        action_y=next_star.y;
                        action="";
						set_fleet_movement();
                    }
                    instance_activate_object(obj_star);
                }
                
                
                
                if (landing_planet=0 && trade_goods="Khorne_warband_landing_force"){
                    debugl("BLOOD: A");
                    
                    // Go after the player now
                    var yarr = false;
                    
                    if (obj_ini.fleet_type==1) {
                        var player_stars =0;
                        with(obj_star){
                            if !(array_contains(p_owner, eFACTION.Player)){
                                instance_deactivate_object(id);
                            } else{
                                player_stars++;
                            }
                        }

                        if (player_stars>0) {
                            var pee1  = instance_nearest(x,y,obj_star);
                            instance_activate_object(obj_star);
                            next_star = distance_removed_star(pee1.x,pee1.y, choose(1,1,2));
                            action_x=next_star.x;
							action_y=next_star.y;
							action="";
							set_fleet_movement()
							yarr=true;
                        }
                        instance_activate_object(obj_star);
                    }else if (obj_ini.fleet_type!=1)  {

                        // Chase player fleets
                        var target_chosen = false;
                        if (instance_exists(orbiting)){
                        	action = "";
                        }
                        var chase_fleet = get_nearest_player_fleet(nearest_x, nearest_y);

                        if (chase_fleet != "none") and (action == "") {
                        	var intercept_time = fleet_intercept_time_calculate(chase_fleet);
                        	if (chase_fleet.action!=""){
                        		if (intercept_time<=chase_fleet.eta){
                        			target = chase_fleet;
                        			chase_fleet_target_set();
                        			target_chosen=true;
                        		}
                        	} else {
                        		if (intercept_time<12){
                        			target = chase_fleet;
                        			chase_fleet_target_set();
                        			target_chosen=true;
                        		}
                        	}
                        }
                        if (action="") and (target_chosen=false){
                            var player_stars = 0;
                            with(obj_star){
                                if !(array_contains(p_owner, eFACTION.Player)){
                                    instance_deactivate_object(id);
                                } else{
                                    player_stars++;
                                }
                            }
                            if (player_stars > 0){
                            	var nearest_star = instance_nearest(x, y, obj_star);
                            	instance_activate_object(obj_star);
                            	if (chase_fleet=="none"){
                            		action_x = nearest_star.x;
                            		action_y = nearest_star.y;
                            		set_fleet_movement();
                            		target_chosen=true;
                            	} else {
                            		if (fleet_intercept_time_calculate(chase_fleet)<(floor(point_distance(x,y,nearest_star.x,nearest_star.y)/action_spd)+1)){
                            			target=chase_fleet;
                            			chase_fleet_target_set()
                            			target_chosen=true;
                            		} else {
	                            		action_x = nearest_star.x;
	                            		action_y = nearest_star.y;
	                            		set_fleet_movement();
	                            		target_chosen=true;	                            			
                            		}
                            	}
                            }
                    		instance_activate_object(obj_star);
                        }
                    }
                }
            }
        }
    }	
}