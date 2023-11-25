
var orb;orb=orbiting;

if (round(owner)!=eFACTION.Imperium) and (navy=1) then owner= noone;

if ((trade_goods="BLOODBLOODBLOOD") or (trade_goods="BLOODBLOODBLOODBLOOD")) and (owner=eFACTION.Chaos) {
    if (orb!=0) and (instance_exists(orb)) and (action=""){
        if (orb.present_fleet[1]+orb.present_fleet[2]+orb.present_fleet[3]+orb.present_fleet[6]+orb.present_fleet[7]+orb.present_fleet[9]+orb.present_fleet[13]=0){
            var ii,good,part,contin;ii=0;good=0;part=0;contin=0;
            
            // No forces already landed
            repeat(orb.planets){
				ii+=1;
                if (planet_feature_bool(orb.p_feature[ii], P_features.World_Eaters)==1) {
					good-=1;
					
                    if (orb.p_guardsmen[ii]+orb.p_pdf[ii]+orb.p_sisters[ii]+orb.p_player[ii]<=0) and (orb.p_population[ii]>orb.p_max_population[ii]/20){
                        orb.p_population[ii]=round(orb.p_population[ii]/2);
                        if (orb.p_population[ii]<=orb.p_max_population[ii]/20) then contin=99;
                    }
                    if (orb.p_guardsmen[ii]+orb.p_pdf[ii]+orb.p_sisters[ii]+orb.p_player[ii]<=0) and (orb.p_population[ii]<=orb.p_max_population[ii]/20) then contin=99;
                }
            }
            // Next planet; rembark the chaos forces
            if (contin=99){ii=0;
                repeat(orb.planets){ii+=1;
                    if (planet_feature_bool(orb.p_feature[ii], P_features.World_Eaters)==1){
                        orb.p_chaos[ii]=0;orb.p_traitors[ii]=max(4,orb.p_traitors[ii]+1);
						delete_features(orb.p_feature[ii], P_features.World_Eaters);contin=100;
                        
                        if (ii>1){delete_features(orb.p_feature[ii-1], P_features.World_Eaters);contin=100;}
                    }
                }
            }
            // No forces landed
            if ((good=0) or (contin=100)){
				ii=0;
				good=0;
                repeat(orb.planets) {
					ii+=1;
                    if (good=0) and (trade_goods="BLOODBLOODBLOOD"){
                        if (orb.p_guardsmen[ii]+orb.p_pdf[ii]+orb.p_sisters[ii]+orb.p_player[ii]>0) and (orb.p_population[ii]>orb.p_max_population[ii]/20){
							array_push(orb.p_feature[ii], new new_planet_feature(P_features.World_Eaters));
                            good=ii;orb.p_chaos[ii]=6;
                        }// Forces landed
                    }
                    if (good=0) and (trade_goods="BLOODBLOODBLOODBLOOD"){
                        if (orb.p_player[ii]>0) and (orb.p_population[ii]>orb.p_max_population[ii]/20){
                            good=ii;orb.p_chaos[ii]=6;array_push(orb.p_feature[ii], new new_planet_feature(P_features.World_Eaters));
                        }// Forces landed
                    }
                }
                
                if (good=0) and (trade_goods!="BLOODBLOODBLOODBLOOD"){// Nothing to see here, continue to next star*/
                    ii=0;
                    repeat(orb.planets){ii+=1;
                        if (string_count("World Eaters",orb.p_feature[ii])>0){
                            orb.p_chaos[ii]=0;orb.p_traitors[ii]=max(4,orb.p_traitors[ii]+1);
                            delete_features(orb.p_feature[ii], P_features.World_Eaters);contin=100;
                            if (ii>1){delete_features(orb.p_feature[ii-1], P_features.World_Eaters);contin=100;}
                        }
                    }
                    
                    with(orb) {
						y-=20000;
					}
					
                    with(obj_star) {
						if (planets=1) and (p_type[1]="Dead") then y-=20000;
					}
                    with(obj_star) {
						if (owner=eFACTION.Chaos) or (owner=eFACTION.Ork) or (owner=eFACTION.Necrons) or (owner=eFACTION.Eldar) then y-=20000;
					}
					var bd,b;
                    with(obj_star) {
						bd=0;
						b=0;
                        repeat(4) {
							b+=1;
							if (p_guardsmen[b]+p_pdf[b]+p_sisters[b]+p_player[b]>0)
								and (p_population[b]>p_max_population[b]/20) 
								then bd+=1;
						}
                        if (bd=4) then y-=20000;
                    }
                    
                    var nx,ny,n2,yy2,ndir,next_star;
					next_star=0;
                    ndir = point_direction(x,y,home_x,home_y);
                    nx  = x+lengthdir_x(250,ndir);
					ny  = y+lengthdir_y(250,ndir);
                    n2  = x+lengthdir_x(450,ndir);
					yy2 = y+lengthdir_y(450,ndir);
                    
					
					if !point_in_rectangle(n2,yy2, 50,50,room_width,room_height) {
						trade_goods="BLOODBLOODBLOODBLOOD";
                        // show_message("BLOODBLOODBLOODBLOOD");
                    }
                    
                    if (trade_goods!="BLOODBLOODBLOODBLOOD") {
                        next_star=instance_nearest(nx,ny,obj_star);
                        action_x=next_star.x;action_y=next_star.y;
                        action="";
						alarm[4]=1;
                    }
                    
                    with(obj_star){if (y<=-16000) then y+=20000;}
                    with(obj_star){if (y<=-16000) then y+=20000;}
                    with(obj_star){if (y<=-16000) then y+=20000;}
                }
                
                
                
                if (good=0){
                    if (trade_goods="BLOODBLOODBLOODBLOOD") {
                        debugl("BLOOD: A");
                        
                        // Go after the player now
                        var yarr = false;
                        
                        if (obj_ini.fleet_type=1) {
							debugl("BLOOD: B");
                            with(obj_temp3){instance_destroy();}
                            with(obj_star){if (y<=-16000) then y+=20000;}
                            with(obj_star){if (y<=-16000) then y+=20000;}
                            with(obj_star){if (y<=-16000) then y+=20000;}
                            
                            with(obj_star){
                                if array_contains(p_owner, eFACTION.Player) then instance_create(x,y,obj_temp3);
                            }

                            if (instance_exists(obj_temp3)) {
								debugl("BLOOD: C");
                                var pee1  = instance_nearest(x,y,obj_temp3);
                                next_star = instance_nearest(pee1.x,pee1.y,obj_star);
                                yarr=true;
								with(obj_temp3){instance_destroy();}
                                action_x=next_star.x;
								action_y=next_star.y;
								alarm[4]=1;
								action="";
								yarr=true;
                            }
                        }
						
						//was (A or B) and A before, which simplifies to A
                        if (obj_ini.fleet_type!=1)  {
							debugl("BLOOD: D");
                            // Chase player fleets
                            with(obj_temp8){instance_destroy();}
                            with(obj_p_fleet){
                                if (action="move") and point_in_rectangle(x, y, 0, 0, room_width, room_height) {
                                    if point_in_rectangle(action_x, action_y, 0, 0, room_width, room_height) {
                                        var tem = instance_create(action_x,action_y,obj_temp8);
										tem.eta = action_eta;
                                    }
                                }
                            }
                            if (instance_exists(obj_temp8)) and (instance_exists(orbiting)) {
								debugl("BLOOD: E");
                                var my_dis;
                                var that = instance_nearest(x,y,obj_temp8);
								etah=that.eta;
                                var thatp = instance_nearest(that.x,that.y,obj_star);
                                
                                if (thatp != noone){
									var next_star = noone;
                                    my_dis= point_distance(orbiting.x,orbiting.y,thatp.x,thatp.y)/48;
                                    if rectangle_in_rectangle(thatp.x, thatp.y, thatp.x2, thatp.y2, orbiting.x, orbiting.y, orbiting.x2, orbiting.y2) > 0
										then my_dis=my_dis/2;
                                    
                                    if (my_dis<=etah){
                                        next_star=thatp
										yarr=true;
                                        with(obj_temp8){instance_destroy();}
                                        // trade_goods="player_hold";
                                    }
                                }
                                with(obj_temp8){instance_destroy();}
                            }
                            // End chase
                            
                            
                            // Go after home planet or fleet?
                            with(obj_temp7){instance_destroy();}
                            with(obj_temp8){instance_destroy();}
                            
                            
                            if (action="") and (yarr=false){
								debugl("BLOOD: F");

                                var homeworld_distance=9999;
								var fleet_distance=9999;
								var fleet_nearby = noone;
								var homeworld_nearby = noone;
								var planet_nearby = noone;
								
                                with(obj_p_fleet) {
									if (action="") then instance_create(x,y,obj_temp7);
								}
                                with(obj_star) {
									if array_contains(p_owner, eFACTION.Player)
										then instance_create(x,y,obj_temp8);
								}
                                
                                if (instance_exists(obj_temp7)) {
									fleet_nearby = instance_nearest(x,y,obj_temp7);
									fleet_distance = point_distance(x,y,fleet_nearby.x,fleet_nearby.y);
								}
                                if (instance_exists(obj_temp8)) {
									homeworld_nearby=instance_nearest(x,y,obj_temp8);
									homeworld_distance=point_distance(x,y,homeworld_nearby.x,homeworld_nearby.y)-30;
								}
                                
                                if (homeworld_distance<fleet_distance) and (homeworld_distance<5000) and (homeworld_distance>40) {// Go towards planet
									if (instance_exists(homeworld_nearby)) {
										next_star=homeworld_nearby;
										yarr=true;
									}

                                    with(obj_temp7){instance_destroy();}
                                    with(obj_temp8){instance_destroy();}
                                }
                                
                                
                                if (fleet_distance<homeworld_distance) and (fleet_distance<7000) and (fleet_distance>40) and (instance_exists(obj_temp7)) { // Go towards that fleet
                                    planet_nearby = instance_nearest(fleet_nearby.x,fleet_nearby.y,obj_star);
                                    
                                    if (instance_exists(planet_nearby)) and (instance_exists(orbiting)){debugl("BLOOD: G");
                                        if (fleet_distance<=500) and (orbiting!=planet_nearby){// Case 1; really close, wait for them to make the move
                                            with(obj_temp7){instance_destroy();}
                                            with(obj_temp8){instance_destroy();}
                                            
                                            with(obj_star){if (y<=-16000) then y+=20000;}
                                            with(obj_star){if (y<=-16000) then y+=20000;}
                                            with(obj_star){if (y<=-16000) then y+=20000;}
                                            
                                            exit;
                                        }
                                        if (fleet_distance>500){// Case 2; kind of far away, move closer
											var diss=fleet_distance/2;
											var goto=0;
                                            var dirr = point_direction(x,y,fleet_nearby.x,fleet_nearby.y);
											debugl("BLOOD: H");
                                            
                                            with(orbiting){y-=20000;}
                                            goto=instance_nearest(x+lengthdir_x(diss,dirr),y+lengthdir_y(diss,dirr),obj_star);
                                            with(orbiting){y+=20000;}
                                            if (goto.present_fleet[1]=0) {
												action_x=goto.x;
												action_y=goto.y;
												alarm[4]=1;
											}

                                            with(obj_temp7){instance_destroy();}
                                            with(obj_temp8){instance_destroy();}
                                            exit;
                                        }
                                    }
                                }
                            }
                            
                            with(obj_temp7){instance_destroy();}
                            with(obj_temp8){instance_destroy();}
                        }
						
                        if (yarr=true){
                            action_x=next_star.x;
							action_y=next_star.y;
                            action="";alarm[4]=1;
                            debugl("BLOOD: YARR");
                        }
						
                        with(obj_star){if (y<=-16000) then y+=20000;}
                        with(obj_star){if (y<=-16000) then y+=20000;}
                        with(obj_star){if (y<=-16000) then y+=20000;}
                    }    
                }
            }
        }
    }
}

var spid = noone;
if (instance_exists(orbiting)){
	spid=orbiting;
	spid.present_fleet[owner]+=1;
} else {
	spid = instance_nearest(x,y,obj_star);
	spid.present_fleet[owner]+=1;
	orbiting=spid;
}

if (spid != noone) {
    if (instance_exists(obj_crusade)) 
	and (spid.owner <= eFACTION.Ecclesiarchy) 
	and (owner = eFACTION.Imperium) 
	and (navy=1) 
	and (trade_goods="") 
	and (action="") 
	and (guardsmen_unloaded = 0) {// Crusade AI
        obj_controller.temp[88]=owner;
        with(obj_crusade){
			if (owner!=obj_controller.temp[88]){
				y-=20000;
			}
		}

		var enemu;
		//var cs
        with(obj_star) {
			var cs = instance_nearest(x,y,obj_crusade);
			
            if (point_distance(x,y,cs.x,cs.y)>cs.radius) {
				y-=20000;
			}
			enemu=0;
			
			var nids = array_reduce(p_tyranids, function(prev, curr) {
				return prev || curr > 3
			}, false)
			var tau = array_reduce(p_tau, function(prev, curr) {
				return prev || curr > 0;
			}, false)
			
			enemu += nids + tau

            if (present_fleet[eFACTION.Eldar]>0)	then enemu+=2;
			if (present_fleet[eFACTION.Ork]>0)		then enemu+=2;
            if (present_fleet[eFACTION.Tau]>0)		then enemu+=2;
			if (present_fleet[eFACTION.Tyranids]>0) then enemu+=2;
            if (present_fleet[eFACTION.Chaos]>0)	then enemu+=2;
			//nothing for heritics faction
			if (present_fleet[eFACTION.Necrons]>0)	then enemu+=2;

        }
		var ns = instance_nearest(x,y,obj_star);
		var ok=false;
		var max_dist = 800;
		var min_dist = 40;
		var to_ignore = [eFACTION.Imperium, eFACTION.Mechanicus,eFACTION.Inquisition, eFACTION.Ecclesiarchy]
		
		var dist = point_distance(x,y,ns.x,ns.y)
		var valid_target = !array_contains_ext(ns.p_owner, to_ignore, false)
        if valid_target and dist <= max_dist and dist >= min_dist and (owner = eFACTION.Imperium) 
			then ok = true;

        // if ((ns.owner>5) or (ns.owner  = eFACTION.Player)) and (point_distance(x,y,ns.x,ns.y)<=max_dis) and (point_distance(x,y,ns.x,ns.y)>40) and (owner = eFACTION.Imperium){
        if (ok){
            action_x=ns.x;
			action_y=ns.y;
			alarm[4]=1;
            spid.present_fleet[owner]-=1;
            home_x=spid.x;
            home_y=spid.y;
			
            var i;
			i=0;
            repeat(4){
				i+=1;
                if (spid.p_owner[i]=eFACTION.Imperium) and (spid.p_guardsmen[i]>500) {
					guardsmen +=round(spid.p_guardsmen[i]/2);
					spid.p_guardsmen[i]=round(spid.p_guardsmen[i]/2);}
            }

            alarm[5]=2;
            
            with(obj_crusade){if (y<-10000) then y+=20000;}
            with(obj_crusade){if (y<-10000) then y+=20000;}
            with(obj_star){if (y<-10000) then y+=20000;}
            with(obj_star){if (y<-10000) then y+=20000;}
            
            exit;
        }
        
        with(obj_crusade){if (y<-10000) then y+=20000;}
        with(obj_crusade){if (y<-10000) then y+=20000;}
        with(obj_star){if (y<-10000) then y+=20000;}
        with(obj_star){if (y<-10000) then y+=20000;}
    }
}

if navy {
	if trade_goods != "player_hold" {


	if (action="") and (trade_goods="") and (instance_exists(orbiting)){
	    if (orbiting.present_fleet[20]>0) then exit;
	}


	// Check if the ground battle is victorious or not
	if (obj_controller.faction_status[eFACTION.Imperium]="War") and (action="") and (trade_goods="invading_player") and (guardsmen_unloaded=1) {
	    if (instance_exists(orbiting)) {
			
			//slightly more verbose than the last way, but reduces reliance on fixed array sizes
	        var tar = array_reduce(orbiting.p_guardsmen, function(prev, curr, idx) {
				return curr > 0 ? idx : prev
			},0)
			
	        if (tar == 0) {// Guard all dead
	            trade_goods="recr";action="";
	        } else { //this was always a dead path previously since tar could never be bigger than i, now it will
	            if (orbiting.p_owner[tar]=eFACTION.Player) and (orbiting.p_player[tar]=0) and (planet_feature_bool(orbiting.p_feature[tar],P_features.Monastery )==0){
	                if (orbiting.p_first[tar] != eFACTION.Player) {
						orbiting.p_owner[tar] = orbiting.p_first[tar];
					} else {
						orbiting.p_owner[tar]= eFACTION.Imperium;
					}
					orbiting.dispo[tar]=-50;
	                trade_goods="";
					action="";
	            }
	        }
	    }
	}

	// Invade the player homeworld as needed
	if (obj_controller.faction_status[eFACTION.Imperium]="War") and (action="") and (trade_goods="invade_player") and (guardsmen_unloaded=0){
	    if (instance_exists(orbiting)){
	        var tar=0;
			var i=0;
	        repeat(4) {
				i+=1;
	            if (orbiting.p_owner[i]=eFACTION.Player) 
					and (planet_feature_bool(orbiting.p_feature[i],P_features.Monastery)==0) 
					and (orbiting.p_guardsmen[i]=0) 
					then tar=i;
	        }
	        if (tar){
	            guardsmen_unloaded=1;
	            i=0;
				repeat(20) {
					i+=1;
					if (capital_imp[i]>0) {
						orbiting.p_guardsmen[tar]+=capital_imp[i];
						capital_imp[i]=0;
					}
				}
	            i=0;
				repeat(30) {
					i+=1;
					if (frigate_imp[i]>0) {
						orbiting.p_guardsmen[tar]+=frigate_imp[i];
						frigate_imp[i]=0;
					}
				}
	            i=0;
				repeat(30) {
					i+=1;
					if (escort_imp[i]>0) {
						orbiting.p_guardsmen[tar]+=escort_imp[i];
						escort_imp[i]=0;
					}
				}
	            trade_goods="invading_player";
				exit;
	        }
	    }
	}

	// Bombard the shit out of the player homeworld
	if (obj_controller.faction_status[eFACTION.Imperium]="War") and (action="") and (trade_goods="") and (guardsmen_unloaded=0){
	    if (instance_exists(orbiting)) {
			var orbiting_guardsmen = array_reduce(orbiting.p_guardsman, function(prev, curr) {
				return prev + curr
			})
			var player_forces = array_reduce(orbiting.p_player, function(prev, curr) {
				return prev + curr;
			})

	        if (orbiting_guardsmen == 0) or (player_forces > 0) {
				
				//cleaned this up so it is easier to read, even though it reads more verbosely
				var hostile_fleet_count = 0;
				with(orbiting) {
					hostile_fleet_count += present_fleet[eFACTION.Player]
						+ present_fleet[eFACTION.Eldar]
						+ present_fleet[eFACTION.Ork]
						+ present_fleet[eFACTION.Tau]
						+ present_fleet[eFACTION.Tyranids]
						+ present_fleet[eFACTION.Chaos]
						+ present_fleet[eFACTION.Necrons]
				}
	            if (hostile_fleet_count == 0){
                
	                var o,bombard,deaths,hurss,scare,onceh,wob,kill;
	                o=0;bombard=0;deaths=0;hurss=0;onceh=0;wob=0;kill=0;
                
	                repeat(4){
						o+=1;
	                    if (orbiting.p_owner[o]=eFACTION.Player) and (orbiting.p_population[o]+orbiting.p_pdf[o]>0) {
							bombard=o;
							break;
						}
	                    if (orbiting.p_owner[o]=eFACTION.Player) and (orbiting.p_player[o]>0) {
							bombard=o;
							break;
						}
	                }
                
	                if (bombard){
						
	                    scare=(capital_number*3)+frigate_number;

	                    if (scare>2) then scare=2;if (scare<1) then scare=0;
	                    //onceh=2;

	                    if (orbiting.p_large[bombard]) {
							kill=scare*0.15; // Population if large
						} else {
							kill=scare*15000000; // pop if small
						}
	                    var eheh,eheh2,eheh3;eheh=0;eheh2=0;eheh3="";
	                    eheh=min(orbiting.p_pdf[bombard],(scare*15000000)/2);
						
	                    if (orbiting.p_large[bombard]=0) {
							eheh2=min(orbiting.p_population[bombard],scare*15000000)
						}
	                    if (orbiting.p_large[bombard]=1) {
							eheh2=min(orbiting.p_population[bombard],scare*0.15);
						}
                        
	                    if (eheh2>0) and (orbiting.p_large[bombard]=0) then {
							eheh3="Imperial Battlefleet bombards "+string(orbiting.name)+" "+scr_roman(bombard)+".  "+string(scr_display_number(eheh2))+" civilian casualties";
						}
	                    if (eheh2>0) and (orbiting.p_large[bombard]=1) {
	                        if (eheh2>=1) then eheh3="Imperial Battlefleet bombards "+string(orbiting.name)+" "+scr_roman(bombard)+".  "+string(eheh2)+" billion civilian casualties";
	                        if (eheh2<1) then eheh3="Imperial Battlefleet bombards "+string(orbiting.name)+" "+scr_roman(bombard)+".  "+string(floor(eheh2*1000))+" million civilian casualties";
	                    }
	                    if (eheh>0) then eheh3+=" and "+string(scr_display_number(eheh))+" PDF lost.";
	                    if (eheh<=0) and (eheh2>0) then eheh3+=".";
	                    if (eheh2=0) and (eheh>0) then eheh3="Imperial Battlefleet bombards "+string(orbiting.name)+" "+scr_roman(bombard)+".  "+string(eheh)+" PDF lost.";
                        
	                    if (eheh3!="") {
	                        scr_alert("red","owner",string(eheh3),orbiting.x,orbiting.y);
	                        scr_event_log("red",string(eheh3));
	                        eheh3=string_replace(eheh3,",.",",");
	                    }
                        
	                    orbiting.p_pdf[bombard]-=(scare*15000000)/2;
	                    if (orbiting.p_pdf[bombard]<0) then orbiting.p_pdf[bombard]=0;

                    
	                    orbiting.p_population[bombard]-=kill;
	                    if (orbiting.p_population[bombard]<0) then orbiting.p_population[bombard]=0;
	                    if (orbiting.p_pdf[bombard]<0) then orbiting.p_pdf[bombard]=0;
                    
	                    if (orbiting.p_population[bombard]+orbiting.p_pdf[bombard]<=0) and (orbiting.p_owner[bombard]=eFACTION.Player){
	                        if (planet_feature_bool(orbiting.p_feature[bombard], P_features.Monastery)==0) {
	                            if (orbiting.p_first[bombard]!=eFACTION.Player) {
									orbiting.p_owner[bombard]=orbiting.p_first[bombard];
								} else {
									orbiting.p_owner[bombard]=eFACTION.Imperium;
								}
								orbiting.dispo[bombard]=-50;
	                        } else {
	                            trade_goods="invade_player";
	                        }
	                    }
	                    exit;
	                }
	            }
	        }
	    }
	}


	if (obj_controller.faction_status[eFACTION.Imperium]="War") and (action="") and (trade_goods="") and (guardsmen_unloaded=0) {
	    var hold = false;
		var player_owns_planet = array_reduce(orbiting.p_owner, function(prev, curr) {
			return prev or curr == eFACTION.Player
		}, false)
	    if (instance_exists(orbiting)){
	        hold = player_owns_planet or (orbiting.present_fleet[eFACTION.Player] > 0)
	    }
    
	    if (hold){
	        // Chase player fleets
	        with(obj_temp8){instance_destroy();}
	        with(obj_p_fleet) {
	            if (action="move") and (x>0) and (x<room_width) and (y>0) and (y<room_height) {
	                if (action_x>0) and (action_x<room_width) and (action_y>0) and (action_y<room_width) {
	                    var tem;
						tem=instance_create(action_x,action_y,obj_temp8);
						tem.eta=action_eta;
	                }
	            }
	        }
	        if (instance_exists(obj_temp8)) and (instance_exists(orbiting)){
	            var that,thatp,my_dis;
	            that=instance_nearest(x,y,obj_temp8);
				etah=that.eta;
	            thatp=instance_nearest(that.x,that.y,obj_star);
            
	            if (instance_exists(thatp)){
	                my_dis=point_distance(orbiting.x,orbiting.y,thatp.x,thatp.y)/48;
	                if ((orbiting.x2=thatp.x) and (orbiting.y2=thatp.y)) 
						or ((thatp.x2=orbiting.x) and (thatp.y2=orbiting.y)) 
						then my_dis=my_dis/2;
                
	                if (my_dis<=etah) {
	                    action_x=thatp.x;
						action_y=thatp.y;
						alarm[4]=1;// show_message("A");
	                    with(obj_temp8){instance_destroy();}
	                    trade_goods="player_hold";
	                    exit;
	                }
	            }
	            with(obj_temp8){instance_destroy();}
	        }
	        // End chase
        
        
	        // Go after home planet or fleet?
	        with(obj_temp7){instance_destroy();}
	        with(obj_temp8){instance_destroy();}
        
        
	        if (trade_goods="") and (action="") {
	            var homeworld_distance,homeworld_nearby,fleet_nearby,fleet_distance,planet_nearby;
	            homeworld_distance=9999;fleet_distance=9999;fleet_nearby=0;homeworld_nearby=0;planet_nearby=0;
            
	            with(obj_p_fleet){ 
					if (action="") then instance_create(x,y,obj_temp7);
				}
	            with(obj_star) {
					if array_contains(p_owner, eFACTION.Player)
						instance_create(x,y,obj_temp8);
				}
            
	            if (instance_exists(obj_temp7)) {
					fleet_nearby=instance_nearest(x,y,obj_temp7);
					fleet_distance=point_distance(x,y,fleet_nearby.x,fleet_nearby.y);
				}
	            if (instance_exists(obj_temp8)) {homeworld_nearby=instance_nearest(x,y,obj_temp8);
					homeworld_distance=point_distance(x,y,homeworld_nearby.x,homeworld_nearby.y)-30;
				}
            
	            if (homeworld_distance<fleet_distance) and (homeworld_distance<5000) and (homeworld_distance>40) {// Go towards planet
	                action_x=homeworld_nearby.x;
					action_y=homeworld_nearby.y;
					alarm[4]=1;// show_message("B");
	                with(obj_temp7){instance_destroy();}
	                with(obj_temp8){instance_destroy();}
	                exit;
	            }
            
            
            
	            if (fleet_distance<homeworld_distance) and (fleet_distance<7000) and (fleet_distance>40) and (instance_exists(obj_temp7)) {// Go towards that fleet
	                planet_nearby=instance_nearest(fleet_nearby.x,fleet_nearby.y,obj_star);
                
	                if (instance_exists(planet_nearby)) and (instance_exists(orbiting)){
						if (fleet_distance<=500) and (planet_nearby!=orbiting){// Case 1; really close, wait for them to make the move
	                        with(obj_temp7){instance_destroy();}
	                        with(obj_temp8){instance_destroy();}
	                        exit;
	                    }
	                    if (fleet_distance>500) {// Case 2; kind of far away, move closer
	                        var dirr,diss,goto;diss=fleet_distance/2;goto=0;
	                        dirr=point_direction(x,y,fleet_nearby.x,fleet_nearby.y);
                        
	                        with(orbiting){y-=20000;}
	                        goto=instance_nearest(x+lengthdir_x(diss,dirr),y+lengthdir_x(diss,dirr),obj_star);
	                        with(orbiting){y+=20000;}
	                        if (goto.present_fleet[eFACTION.Player]=0) {
								action_x=goto.x;
								action_y=goto.y;
								alarm[4]=1;
							}
                        
	                        with(obj_temp7){instance_destroy();}
	                        with(obj_temp8){instance_destroy();}
	                        exit;
	                    }
	                }
                
	            }
	        }
        
	        with(obj_temp7){instance_destroy();}
	        with(obj_temp8){instance_destroy();}
 
	        /*var homeworld_distance,homeworld_nearby,fleet_nearby,fleet_distance;
	        homeworld_distance=9999;fleet_distance=9999;fleet_nearby=0;homeworld_nearby=0;
        
	        with(obj_p_fleet){if (action!="") then y-=20000;}// Disable non-stationary player fleets
	        if (instance_exists(obj_p_fleet)){fleet_nearby=instance_nearest(x,y,obj_p_fleet);fleet_distance=point_distance(x,y,fleet_nearby.x,fleet_nearby.y);}// Get closest player fleet
	        with(obj_star){if (owner  = eFACTION.Player) then instance_create(x,y,obj_temp7);}// Create temp7 at player stars
	        if (instance_exists(obj_temp7)){homeworld_nearby=instance_nearest(x,y,obj_temp7);homeworld_distance=point_distance(x,y,homeworld_nearby.x,homeworld_nearby.y);}// Get closest star
	        with(obj_p_fleet){if (y<-10000) then y+=20000;}// Enable non-stationary player fleets
        
	        if (homeworld_distance<=fleet_distance) and (homeworld_distance<7000) and (instance_exists(homeworld_nearby)){// Go towards planet
	            action_x=homeworld_nearby.x;action_y=homeworld_nearby.y;alarm[4]=1;exit;
	        }
        
        
	    */
    
	    }
	}

	//Eldar shit I think? Doesn't check for eldar ships
	if (trade_goods="building_ships"){
	    var onceh,cont,p;onceh=0;cont=0;p=0;
    
	    p=0;
	    if (instance_exists(orbiting)) then repeat(4) {
			p+=1;
	        if (orbiting.p_type[p]="Forge"){
				//if no non-imperium,player, or eldar aligned fleets or ground forces, continue
	            if (orbiting.p_orks[p]+orbiting.p_chaos[p]+orbiting.p_tyranids[p]+orbiting.p_necrons[p]+orbiting.p_tau[p]+orbiting.p_traitors[p]=0){
	                if (orbiting.present_fleet[7]+orbiting.present_fleet[8]+orbiting.present_fleet[9]+orbiting.present_fleet[10]+orbiting.present_fleet[13]=0){
	                    cont=1;
	                }
	            }
	        }
	    }
    
	    if (cont=1){
	        if (escort_number<12) and (onceh=0) {
				escort_number+=1;onceh=1;
			}
	        if (capital_number<1) {
				capital_number+=0.0834;
				onceh=1;
				if (capital_number>1) then capital_number=1;
			}
	        if (frigate_number<5) and (onceh=0) {
				frigate_number+=0.25;
				onceh=1;
				if (frigate_number>4.99) then frigate_number=5;
			}
	        if (onceh=1){
	            var ii;ii=0;ii+=capital_number;ii+=round((frigate_number/2));
	            ii+=round((escort_number/4));if (ii<=1) then ii=1;image_index=ii;
	        }
        
	        if (capital_number=1) and (frigate_number>=5) and (escort_number>=12){
	            var i;i=0;repeat(capital_number){i+=1;
	                capital_max_imp[i]=(((floor(random(15))+1)*1000000)+15000000)*2;
	            }
	            i=0;repeat(frigate_number){i+=1;
	                frigate_max_imp[i]=(500000+(floor(random(50))+1)*10000)*2;
	            }
	            trade_goods="";
	        }
	    }
    
	    if (trade_goods="building_ships") or (cont!=1) then exit;
	}



	var maxi,curr,i,o;
	maxi=0;curr=0;i=0;o=0;

	i=0;repeat(20){i+=1;
	    if (capital_max_imp[i]>0) and (capital_number>i){capital_max_imp[i]=0;}
	    if (capital_imp[i]>0) and (capital_number<=i) and (guardsmen_unloaded=0) then curr+=capital_imp[i];
	    if (capital_max_imp[i]>0) and (capital_number<=i) then maxi+=capital_max_imp[i];
	}
	i=0;repeat(30){i+=1;
	    if (frigate_max_imp[i]>0) and (frigate_number>i){frigate_max_imp[i]=0;}
	    if (frigate_imp[i]>0) and (frigate_number<=i) and (guardsmen_unloaded=0) then curr+=frigate_imp[i];
	    if (frigate_max_imp[i]>0) and (frigate_number<=i) then maxi+=frigate_max_imp[i];
	}
	i=0;repeat(30){i+=1;
	    if (escort_max_imp[i]>0) and (escort_number>i){escort_imp[i]=0;escort_max_imp[i]=0;}
	    if (escort_imp[i]>0) and (escort_number<=i) and (guardsmen_unloaded=0) then curr+=escort_imp[i];
	    if (escort_max_imp[i]>0) and (escort_number<=i) then maxi+=escort_max_imp[i];
	}

	guardsmen_ratio=1;
	if (guardsmen_unloaded=0) then guardsmen_ratio=curr/maxi;
	with(obj_temp_inq){instance_destroy();}



	if (action="") and (instance_exists(orbiting)) and (guardsmen_unloaded=1){// Move from one planet to another
	    var o,that,highest,cr;
	    o=0;that=0;highest=0;cr=0;
    
	    repeat(4){o+=1;
	        if (orbiting.p_guardsmen[o]>0) then cr=o;
	        if (orbiting.p_orks[o]+orbiting.p_chaos[o]+orbiting.p_tyranids[o]+orbiting.p_necrons[o]+orbiting.p_tau[o]+orbiting.p_traitors[o]>highest) and (orbiting.p_type[o]!="Daemon"){
	            that=o;highest=orbiting.p_orks[o]+orbiting.p_chaos[o]+orbiting.p_tyranids[o]+orbiting.p_necrons[o]+orbiting.p_tau[o]+orbiting.p_traitors[o];
	        }
	    }
    
    
	    // Move on, man
	    if (orbiting.p_orks[cr]+orbiting.p_chaos[cr]+orbiting.p_tyranids[cr]+orbiting.p_necrons[cr]+orbiting.p_tau[cr]+orbiting.p_traitors[cr]=0){
	        var hol;hol=false;if ((orbiting.p_player[cr]>0) and (obj_controller.faction_status[eFACTION.Imperium]="War")) then hol=true;
        
	        if (cr>0) and (that>0) and (hol=false){// Jump to next planet
	            orbiting.p_guardsmen[that]=orbiting.p_guardsmen[cr];orbiting.p_guardsmen[that]=0;
	            exit;
	        }
        
	        if (cr>0) and (that=0) and (hol=false){// Get back onboard
	            var new_capacity;
	            new_capacity=orbiting.p_guardsmen[1]+orbiting.p_guardsmen[2]+orbiting.p_guardsmen[3]+orbiting.p_guardsmen[4]/maxi;
            
	            i=0;repeat(20){i+=1;if (capital_number>=i) then capital_imp[i]=floor(capital_max_imp[i]*new_capacity);}
	            i=0;repeat(30){i+=1;if (frigate_number>=i) then frigate_imp[i]=floor(frigate_max_imp[i]*new_capacity);}
	            i=0;repeat(30){i+=1;if (escort_number>=i) then escort_imp[i]=floor(escort_max_imp[i]*new_capacity);}
            
	            orbiting.p_guardsmen[1]=0;orbiting.p_guardsmen[2]=0;orbiting.p_guardsmen[3]=0;orbiting.p_guardsmen[4]=0;
	            trade_goods="";guardsmen_unloaded=0;exit;
	        }
	    }
	}

	if (((capital_number*8)+(frigate_number*2)+escort_number)<=14) and (guardsmen_unloaded=0){
	    // Got to forge world
	    if (action="") and (trade_goods="goto_forge") and (instance_exists(orbiting)){
	        trade_goods="building_ships";exit;
	    }

	    // Quene a visit to a forge world
	    if (action="") and (trade_goods="") and (instance_exists(orbiting)){
	        with(obj_temp_inq){instance_destroy();}
	        with(obj_star){
	            var cont,p;cont=0;p=0;
	            repeat(4){p+=1;
	                if (p_type[p]="Forge"){
	                    if (p_orks[o]+p_chaos[o]+p_tyranids[o]+p_necrons[o]+p_tau[o]+p_traitors[o]=0){
	                        if (present_fleet[7]+present_fleet[8]+present_fleet[9]+present_fleet[10]+present_fleet[13]=0){
	                            cont=1;
	                        }
	                    }
	                }
	            }
	            if (cont!=0) then instance_create(x,y,obj_temp_inq);
	        }
	        if (instance_exists(obj_temp_inq)){
	            var go_there;go_there=instance_nearest(x,y,obj_temp_inq);
	            action_x=go_there.x;action_y=go_there.y;alarm[4]=1;trade_goods="goto_forge";// show_message("D");
	            with(obj_temp_inq){instance_destroy();}exit;
	        }
	    }
	}

	// Bombard the shit out of things when able
	if (trade_goods="") and (instance_exists(orbiting)) and (action=""){
	    if (guardsmen_unloaded=0) or ((orbiting.p_guardsmen[1]+orbiting.p_guardsmen[2]+orbiting.p_guardsmen[3]+orbiting.p_guardsmen[4]=0) and (guardsmen_unloaded=1)) or ((orbiting.p_player[cr]>0) and (obj_controller.faction_status[eFACTION.Imperium]="War")){
	        if (orbiting.present_fleet[6]+orbiting.present_fleet[7]+orbiting.present_fleet[8]+orbiting.present_fleet[9]+orbiting.present_fleet[10]+orbiting.present_fleet[13]=0){
	            var hol;hol=false;if ((orbiting.present_fleet[1]>0) and (obj_controller.faction_status[eFACTION.Imperium]="War")) then hol=true;
        
	            if (hol=false){
	                var o,bombard,deaths,hurss,scare,onceh,wob,kill;
	                o=0;bombard=0;deaths=0;hurss=0;onceh=0;wob=0;kill=0;
                
	                repeat(4){o+=1;
	                    if (orbiting.p_type[o]!="Daemon"){
	                        if (orbiting.p_population[o]=0) and (orbiting.p_tyranids[o]>0) and (onceh=0){bombard=o;onceh=1;}
	                        if (orbiting.p_population[o]=0) and (orbiting.p_orks[o]>0) and (orbiting.p_owner[o]=7) and (onceh=0){bombard=o;onceh=1;}
	                        if (orbiting.p_owner[o]=8) and (orbiting.p_tau[o]+orbiting.p_pdf[o]>0) and (onceh=0){bombard=o;onceh=1;}
	                        if (orbiting.p_owner[o]=10) and ((orbiting.p_chaos[o]+orbiting.p_traitors[o]+orbiting.p_pdf[o]>0) or (orbiting.p_heresy[o]>=50)){bombard=o;onceh=1;}
	                    }
	                }
                
	                if (bombard>0){
	                    scare=(capital_number*3)+frigate_number;
                    
                    
                    
	                    // Eh heh heh
	                    if (onceh<2) and (orbiting.p_tyranids[bombard]>0){
	                        if (scare>2) then scare=2;if (scare<1) then scare=0;
	                        orbiting.p_tyranids[bombard]-=2;onceh=2;
	                    }
	                    if (onceh<2) and (orbiting.p_orks[bombard]>0){
	                        if (scare>2) then scare=2;if (scare<1) then scare=0;
	                        orbiting.p_orks[bombard]-=2;onceh=2;
	                    }
	                    if (onceh<2) and (orbiting.p_owner[bombard]=8) and (orbiting.p_tau[bombard]>0){
	                        if (scare>2) then scare=2;if (scare<1) then scare=0;
	                        orbiting.p_tau[bombard]-=2;onceh=2;
                        
	                        if (orbiting.p_large[bombard]=0) then kill=scare*15000000;// Population if normal
	                        if (orbiting.p_large[bombard]=1) then kill=scare*0.15;// Population if large
	                    }
	                    if (onceh<2) and (orbiting.p_owner[bombard]=8) and (orbiting.p_pdf[bombard]>0){
	                        wob=scare*5000000+choose(floor(random(100000)),floor(random(100000))*-1);
	                        orbiting.p_pdf[bombard]-=wob;
	                        if (orbiting.p_pdf[bombard]<0) then orbiting.p_pdf[bombard]=0;
                        
	                        if (orbiting.p_large[bombard]=0) then kill=scare*15000000;// Population if normal
	                        if (orbiting.p_large[bombard]=1) then kill=scare*0.15;// Population if large
	                    }
	                    if (onceh<2) and (orbiting.p_owner[bombard]=10){
	                        if (scare>2) then scare=2;if (scare<1) then scare=0;
                        
	                        if (onceh!=2) and (orbiting.p_chaos[bombard]>0){orbiting.p_chaos[bombard]=max(0,orbiting.p_traitors[bombard]-1);onceh=2;}
	                        if (onceh!=2) and (orbiting.p_traitors[bombard]>0){orbiting.p_traitors[bombard]=max(0,orbiting.p_traitors[bombard]-2);onceh=2;}
                        
	                        if (orbiting.p_large[bombard]=0) then kill=scare*15000000;// Population if normal
	                        if (orbiting.p_large[bombard]=1) then kill=scare*0.15;// Population if large
	                        if (orbiting.p_heresy[bombard]>0) then orbiting.p_heresy[bombard]=max(0,orbiting.p_heresy[bombard]-5);
	                    }
                    
	                    orbiting.p_population[bombard]-=kill;
	                    if (orbiting.p_population[bombard]<0) then orbiting.p_population[bombard]=0;
	                    if (orbiting.p_pdf[bombard]<0) then orbiting.p_pdf[bombard]=0;
                    
	                    if (orbiting.p_population[bombard]+orbiting.p_pdf[bombard]<=0) and (orbiting.p_owner[bombard]=1) and (obj_controller.faction_status[eFACTION.Imperium]="War"){
	                        if (planet_feature_bool(orbiting.p_feature[bombard],P_features.Monastery)==0){orbiting.p_owner[bombard]=2;orbiting.dispo[bombard]=-50;}
	                    }
	                    exit;
	                }
	            }
	        }
	    }
	}


	// If the guardsmen all die then move on
	var o;o=0;
	if (guardsmen_unloaded=1) and (instance_exists(orbiting)){
	    var o,bad;o=0;bad=1;
	    repeat(4){o+=1;
	        if (orbiting.p_guardsmen[o]>0) then bad-=1;
	    }
	    if (bad=1){guardsmen_unloaded=0;guardsmen_ratio=0;trade_goods="";}
	}


	// Go to recruiting grounds
	if ((guardsmen_unloaded=0) and (guardsmen_ratio<0.5) and ((trade_goods=""))) or (trade_goods="recr"){// determine what sort of planet is needed
	    var guard_wanted,planet_needed;guard_wanted=0;planet_needed=0;guard_wanted=maxi-curr;
	    if (guard_wanted<=50000) then planet_needed=1;// Pretty much any
	    if (guard_wanted>50000) then planet_needed=2;// Feudal and up
	    if (guard_wanted>200000) then planet_needed=3;// Temperate and up
	    if (guard_wanted>2000000) then planet_needed=4;// Hive
	    obj_controller.temp[200]=guard_wanted;trade_goods="";
    
	    if (planet_needed=1) or (planet_needed=2){
			var good
	        with(obj_star){
				if (scr_is_star_owned_by_allies(self)) {
					good=0;o=0;
		            repeat(4){o+=1;
		                if (scr_is_planet_owned_by_allies(self, o)) and (p_type[o]!="Dead") and (p_population[o]>(obj_controller.temp[200]*6)){
		                    if (p_orks[o]+p_chaos[o]+p_tyranids[o]+p_necrons[o]+p_tau[o]+p_traitors[o]=0) then good=1;
		                }
		            }
		            if (good=1) then instance_create(x,y,obj_temp_inq);
		        }
			}
	    }
	    if (planet_needed=3){
			var good
	        with(obj_star) {
				if (scr_is_star_owned_by_allies(self)) {
					good=0;o=0;
			        repeat(4){o+=1;
			            if (scr_is_planet_owned_by_allies(self, o)) and ((p_population[o]>(obj_controller.temp[200]*6)) or ((p_large[o]=1) and (p_population[o]>0.1))){
			                if (p_orks[o]+p_chaos[o]+p_tyranids[o]+p_necrons[o]+p_tau[o]+p_traitors[o]=0) then good=1;
			            }
			        }
			        if (good=1) then instance_create(x,y,obj_temp_inq);
			    }
			}
	    }
	    if (planet_needed=4) {
			var good
	        with(obj_star) {
				if (scr_is_star_owned_by_allies(self)) {
					good=0;o=0;
			        repeat(4) {
						o+=1;
			            if (scr_is_planet_owned_by_allies(self, o)) and ((p_large[o]=1) and (p_population[o]>0.1)){
			                if (p_orks[o]+p_chaos[o]+p_tyranids[o]+p_necrons[o]+p_tau[o]+p_traitors[o]=0) then good=1;
			            }
			        }
			        if (good=1) then instance_create(x,y,obj_temp_inq);
			    }
			}
	    }
    
	    var closest,c_plan,closest_dist;
	    closest=instance_nearest(x,y,obj_temp_inq);
	    c_plan=instance_nearest(closest.x,closest.y,obj_temp_inq);
	    closest_dist=point_distance(x,y,closest.x,closest.y);
    
	    if (c_plan=orbiting) then trade_goods="recruiting";
	    if (c_plan!=orbiting){
	        trade_goods="goto_recruiting";
	        action_x=c_plan.x;action_y=c_plan.y;
	        alarm[4]=1;// show_message("E");
	    }
    
	    with(obj_temp_inq){instance_destroy();}exit;
	}
	// Get recruits
	if (action="") and (trade_goods="goto_recruiting"){
	    if (instance_exists(orbiting)){
	        var o,that,te,te_large;o=0;that=0;te=0;te_large=0;
	        repeat(4){o+=1;
	            if (orbiting.p_owner[o]<=5){
	                if (orbiting.p_population[o]>te) and (orbiting.p_orks[o]+orbiting.p_chaos[o]+orbiting.p_tyranids[o]+orbiting.p_necrons[o]+orbiting.p_tau[o]+orbiting.p_traitors[o]=0){
	                    te=orbiting.p_population[o];that=o;
	                }
	                if (orbiting.p_large[o]=1) and (orbiting.p_population[o]>0) and (te_large=0) and (orbiting.p_orks[o]+orbiting.p_chaos[o]+orbiting.p_tyranids[o]+orbiting.p_necrons[o]+orbiting.p_tau[o]+orbiting.p_traitors[o]=0){
	                    te=orbiting.p_population[o];that=o;te_large=1;
	                }
	                if (te_large=1) and (orbiting.p_population[o]>te) and (orbiting.p_large[o]=1) and (orbiting.p_orks[o]+orbiting.p_chaos[o]+orbiting.p_tyranids[o]+orbiting.p_necrons[o]+orbiting.p_tau[o]+orbiting.p_traitors[o]=0){
	                    te=orbiting.p_population[o];that=o;te_large=1;
	                }
	            }
	        }
        
	        var guard_wanted;guard_wanted=0;guard_wanted=maxi-curr;
        
	        // if (orbiting.p_population[that]<guard_wanted) and (orbiting.p_large[that]=0) then trade_goods="";
	        if (orbiting.p_population[that]>guard_wanted) or (orbiting.p_large[that]=1){
	            if (orbiting.p_large[that]=0){orbiting.p_population[that]-=guard_wanted;
	                i=0;repeat(20){i+=1;capital_imp[i]=capital_max_imp[i];}
	                i=0;repeat(30){i+=1;frigate_imp[i]=frigate_max_imp[i];}
	                i=0;repeat(30){i+=1;escort_imp[i]=escort_max_imp[i];}
	            }
	            if (orbiting.p_large[that]=1){guard_wanted=guard_wanted/1000000000;
	                orbiting.p_population[that]-=guard_wanted;
	                i=0;repeat(20){i+=1;capital_imp[i]=capital_max_imp[i];}
	                i=0;repeat(30){i+=1;frigate_imp[i]=frigate_max_imp[i];}
	                i=0;repeat(30){i+=1;escort_imp[i]=escort_max_imp[i];}
	            }
	            trade_goods="recruited";
	        }
	    }
	}


	if (action="") and (instance_exists(orbiting)) and (guardsmen_unloaded=0){// Unload if problem sector, otherwise patrol
	    var o,that,highest,popu,popu_large;
	    o=0;that=0;highest=0;popu=0;popu_large=false;
    
	    repeat(4){o+=1;
	        if (orbiting.p_orks[o]+orbiting.p_chaos[o]+orbiting.p_tyranids[o]+orbiting.p_necrons[o]+orbiting.p_tau[o]+orbiting.p_traitors[o]>highest) and (orbiting.p_type[o]!="Daemon"){
	            that=o;highest=orbiting.p_orks[o]+orbiting.p_chaos[o]+orbiting.p_tyranids[o]+orbiting.p_necrons[o]+orbiting.p_tau[o]+orbiting.p_traitors[o];
	            popu=orbiting.p_population[o];if (orbiting.p_large[o]=true) then popu_large=true;
	        }
        
	        // New shit here, prioritize higher population worlds
	        if (orbiting.p_orks[o]+orbiting.p_chaos[o]+orbiting.p_tyranids[o]+orbiting.p_necrons[o]+orbiting.p_tau[o]+orbiting.p_traitors[o]>=highest) and (orbiting.p_type[o]!="Daemon") and (o>1){
	            if (orbiting.p_orks[o]+orbiting.p_chaos[o]+orbiting.p_tyranids[o]+orbiting.p_necrons[o]+orbiting.p_tau[o]+orbiting.p_traitors[o]>0){
	                var isnew;isnew=false;
                
	                if (popu_large=false) and (orbiting.p_large[o]=true) and (floor(popu/1000000000)<orbiting.p_population[o]) then isnew=true;
	                if (popu_large=true) and (orbiting.p_large[o]=true) and (popu<orbiting.p_population[o]) then isnew=true;
	                if (popu_large=true) and (orbiting.p_large[o]=false) and (popu<(orbiting.p_population[o]/1000000000)) then isnew=true;
                
	                if (isnew=true){
	                    that=o;highest=orbiting.p_orks[o]+orbiting.p_chaos[o]+orbiting.p_tyranids[o]+orbiting.p_necrons[o]+orbiting.p_tau[o]+orbiting.p_traitors[o];
	                    if (orbiting.p_large[o]=1) then popu_large=true;
	                    if (orbiting.p_large[o]=0) then popu_large=false;
	                }
                
	            }
	        }
        
	        if (obj_controller.faction_status[eFACTION.Imperium]="War") and (orbiting.p_owner[o]=1) and (orbiting.p_player[o]=0) and (highest=0){that=o;highest=0.5;}
	        if (obj_controller.faction_status[eFACTION.Imperium]="War") and ((orbiting.p_player[o]/50)>=highest){that=o;highest=orbiting.p_player[o]/50;}
	        if (obj_controller.faction_status[eFACTION.Imperium]="War") and (planet_feature_bool(orbiting.p_feature[o], P_features.Monastery)==1){that=o;highest=1000+o;}
	    }
    
	    if (that>0) and (highest>0) and (orbiting.p_guardsmen[1]+orbiting.p_guardsmen[2]+orbiting.p_guardsmen[3]+orbiting.p_guardsmen[4]=0){
	        if (highest>2) or (orbiting.p_pdf[that]=0){guardsmen_unloaded=1;
	            i=0;repeat(20){i+=1;if (capital_imp[i]>0) then orbiting.p_guardsmen[that]+=capital_imp[i];capital_imp[i]=0;}
	            i=0;repeat(30){i+=1;if (frigate_imp[i]>0) then orbiting.p_guardsmen[that]+=frigate_imp[i];frigate_imp[i]=0;}
	            i=0;repeat(30){i+=1;if (escort_imp[i]>0) then orbiting.p_guardsmen[that]+=escort_imp[i];escort_imp[i]=0;}
	        }
	    }
    
    
	    with(obj_temp7){instance_destroy();}
    
	    var plah;plah=false;
	    if (obj_controller.faction_status[eFACTION.Imperium]="War"){
	        if (orbiting.present_fleet[1]>0) then plah=true;
	        var r;r=0;repeat(4){r+=1;
	            if (orbiting.p_owner[r]=1) then plah=true;
	            if (planet_feature_bool(orbiting.p_feature[r], P_features.Monastery)==1) then plah=true;
	        }
	    }
    
	    if (that=0) and (highest=0) and (plah=false){
	        var halp;halp=0;
        
	        // Check for any help requests
	        with(obj_star){
	            if (p_halp[1]=1) or (p_halp[2]=1) or (p_halp[3]=1) or (p_halp[4]=1) then instance_create(x,y,obj_temp7);
	        }
	        if (instance_exists(obj_temp7)){
	            var hum;hum=instance_nearest(x,y,obj_temp7);
	            if (point_distance(x,y,hum.x,hum.y)>600) then halp=0;
	            if (point_distance(x,y,hum.x,hum.y)<=400){
                
	                var hum2;hum2=instance_nearest(hum.x,hum.y,obj_star);
	                with(hum2){
	                    if (p_halp[1]=1) then p_halp[1]=1.1;if (p_halp[2]=1) then p_halp[2]=1.1;
	                    if (p_halp[3]=1) then p_halp[3]=1.1;if (p_halp[4]=1) then p_halp[4]=1.1;
	                }
                
	                action_x=hum.x;action_y=hum.y;alarm[4]=1;halp=1;// show_message("F");
	            }
	        }
	        with(obj_temp7){instance_destroy();}
        
	        // Patrol otherwise
	        if (halp=0){
	            with(orbiting){y-=10000;}
	            with(obj_star){if (craftworld=1) or (space_hulk=1) then y-=10000;}
            
	            var next,ndir,ndis;
	            ndir=floor(random_range(0,360))+1;
	            if (y<=300) then ndir=floor(random_range(180,359))+1;
	            if (y>(room_height-300)) then ndir=floor(random_range(0,180))+1;
	            if (x<=300) then ndir=choose(floor(random_range(0,90))+1,floor(random_range(270,359))+1);
	            if (x>(room_width-300)) then ndir=floor(random_range(90,270))+1;
            
	            ndis=random_range(200,400);
	            next=instance_nearest(x+lengthdir_x(ndis,ndir),y+lengthdir_y(ndis,ndir),obj_star);
	            // next=instance_nearest(x,y,obj_star);
            
	            with(obj_star){
	                if (y<-5000) then y+=10000;
	                if (y<-5000) then y+=10000;
	            }
            
	            action_x=next.x;action_y=next.y;alarm[4]=1;// show_message("G");
	        }
	    }
	}

	if (trade_goods="recruited") then trade_goods="";
	/* */
	}
}

var spid, dir;spid=0;dir=0;
var ret;ret=0;


if (action=""){
    if (instance_exists(orbiting)){spid=orbiting;}// spid.present_fleet[owner]+=1;
    else{spid=instance_nearest(x,y,obj_star);orbiting=spid;}
    var max_dis;max_dis=400;
    
    if (instance_exists(spid)){
        if (spid.owner=eFACTION.Player) and (obj_controller.faction_status[eFACTION.Imperium]="War") and (owner=eFACTION.Imperium){
            var i;i=0;
            repeat(4){i+=1;
                if (spid.p_owner[i]=1) then spid.p_pdf[i]-=capital_number*50000;
                if (spid.p_owner[i]=1) then spid.p_pdf[i]-=frigate_number*10000;
                if (spid.p_pdf[i]<0) then spid.p_pdf[i]=0;
            }
        }
    }
    
    // 1355;
    
    
    if (instance_exists(obj_crusade)) and (owner=eFACTION.Ork) and (spid.owner=eFACTION.Ork){// Ork crusade AI
        var max_dis;
        max_dis=400;
    
        obj_controller.temp[88]=owner;
        with(obj_crusade){if (owner!=obj_controller.temp[88]){x-=40000;}}
        
        with(obj_star){
            var ns;ns=instance_nearest(x,y,obj_crusade);
            if (point_distance(x,y,ns.x,ns.y)>ns.radius){x-=40000;}
            if (owner=ns.owner){x-=40000;}
        }
        
        var ns;ns=instance_nearest(x,y,obj_star);
        if (ns.owner != eFACTION.Ork) and (point_distance(x,y,ns.x,ns.y)<=max_dis) and (point_distance(x,y,ns.x,ns.y)>40) and (instance_exists(obj_crusade)) and (image_index>3){
            action_x=ns.x;action_y=ns.y;alarm[4]=1;
            home_x=spid.x;home_y=spid.y;
            exit;
        }
        
        with(obj_star){
            if (x<-30000) then x+=40000;
            if (x<-30000) then x+=40000;
            if (x<-30000) then x+=40000;
        }
        with(obj_crusade){
            if (x<-30000) then x+=40000;
            if (x<-30000) then x+=40000;
            if (x<-30000) then x+=40000;
        }
    }
    
    
    instance_activate_object(obj_star);
    instance_activate_object(obj_crusade);
    instance_activate_object(obj_en_fleet);
    
    /*if (action="") and (owner = eFACTION.Imperium){// Defend nearby systems and return when done
        
        with(obj_star){
            // 137 ; might want for it to defend under other circumstances
            if (present_fleet[8]>0) and (owner<=5) and (x>2) and (y>2) then instance_create(x,y,obj_temp3);
        }
        if (instance_number(obj_temp3)=0) then ret=1;
        if (instance_number(obj_temp3)>0){
            var you,dis,mem;
            you=instance_nearest(x,y,obj_temp3);
            dis=point_distance(x,y,you.x,you.y);
            
            if (dis<300) and (image_index>=3){
                action_x=you.x;action_y=you.y;
                home_x=instance_nearest(x,y,obj_star).x;
                home_y=instance_nearest(x,y,obj_star).y;
                alarm[4]=1;with(obj_temp3){instance_destroy();}
                exit;
            }
            if (dis>=300) then ret=1;
        }
        
        if (instance_exists(obj_crusade)){
            var cru;cru=instance_nearest(x,y,obj_crusade);
            if (cru.owner=self.owner) and (point_distance(x,y,cru.x,cru.y)<cru.radius) then ret=0;
        }
        
        if (ret=1){
            var cls;cls=instance_nearest(x,y,obj_star);
            if ((cls.x!=home_x) or (cls.y!=home_y)) and (home_x+home_y>0){
                action_x=home_x;
                action_y=home_y;
                alarm[4]=1;
            }
        }

        with(obj_temp3){instance_destroy();}
    }*/
    
    
    
    if (owner=eFACTION.Inquisition){
        if ((spid.owner  = eFACTION.Player) or (obj_ini.fleet_type!=1)) and (trade_goods!="cancel_inspection"){
            if (obj_controller.disposition[6]>=60) then scr_loyalty("Xeno Associate","+");
            if (obj_controller.disposition[7]>=60) then scr_loyalty("Xeno Associate","+");
            if (obj_controller.disposition[8]>=60) then scr_loyalty("Xeno Associate","+");
            
            if (spid.p_owner[2]=1) and (spid.p_heresy[2]>=60) then scr_loyalty("Heretic Homeworld","+");
            
            var whom;whom=-1;
            if (string_count("Inqis",trade_goods)=0) then whom=0;
            if (string_count("Inqis1",trade_goods)=1) then whom=1;
            if (string_count("Inqis2",trade_goods)=1) then whom=2;
            if (string_count("Inqis3",trade_goods)=1) then whom=3;
            if (string_count("Inqis4",trade_goods)=1) then whom=4;
            if (string_count("Inqis5",trade_goods)=1) then whom=5;
            
            
            // INVESTIGATE DEAD HERE 137 ; INVESTIGATE DEAD HERE 137 ; INVESTIGATE DEAD HERE 137 ; INVESTIGATE DEAD HERE 137 ; 
            var thata,t,type,cha,dem,tem1,tem1_base,perc,popup;
            t=0;type=0;cha=0;dem=0;tem1=0;popup=0;perc=0;tem1_base=0;
            
            thata=instance_nearest(x,y,obj_star);
            
            if (string_count("investigate",trade_goods)>0){
                // Check for xenos or demon-equip items on those planets
                var e,ia,ca;e=0;ia=-1;ca=0;
                repeat(4400){
                    if (ca<=10) and (ca>=0){
                        ia+=1;if (ia=400){ca+=1;ia=1;if (ca=11) then ca=-5;}
                        if (ca>=0) and (ca<11){
                            // show_message("is loc "+string(ca)+":"+string(ia)+" ("+string(obj_ini.loc[ca,ia])+") equal to "+string(thata.name)+" ?");
                            // show_message("is wid "+string(ca)+":"+string(ia)+" ("+string(obj_ini.wid[ca,ia])+") >0 ?");
                            
                            if (string(obj_ini.loc[ca,ia])=thata.name) and (real(obj_ini.wid[ca,ia])>0){
                                if (obj_ini.role[ca,ia]="Ork Sniper") and (obj_ini.race[ca,ia]!=1){tem1_base=3;}
                                if (obj_ini.role[ca,ia]="Flash Git") and (obj_ini.race[ca,ia]!=1){tem1_base=3;}
                                if (obj_ini.role[ca,ia]="Ranger") and (obj_ini.race[ca,ia]!=1){tem1_base=3;}
                                if (string_count("Daemon",obj_ini.wep1[ca,ia])>0){tem1_base+=3;dem+=1;}
                                if (string_count("Daemon",obj_ini.wep2[ca,ia])>0){tem1_base+=3;dem+=1;}
                                if (string_count("Daemon",obj_ini.armour[ca,ia])>0){tem1_base+=3;dem+=1;}
                                if (string_count("Daemon",obj_ini.mobi[ca,ia])>0){tem1_base+=3;dem+=1;}
                                if (string_count("Daemon",obj_ini.gear[ca,ia])>0){tem1_base+=3;dem+=1;}
                            }
                        }
                    }
                }
                repeat(4){t+=1;tem1=tem1_base;// Repeat to check each of the planets
                    if (thata.p_type[t]="Dead") and (array_length(thata.p_upgrades[t])>0){
						var base_search = search_planet_features(thata.p_upgrades[t], P_features.Secret_Base); 
                        if (array_length(base_search) >0){
							var player_base = thata.p_upgrades[t][base_search[0]]
                            if (player_base.vox>0) then tem1+=2;
                            if (player_base.torture>0) then tem1+=1;
                            if (player_base.narcotics>0) then tem1+=3;
                            // Should probably also check for xenos
                            obj_controller.disposition[2]-=tem1*2;obj_controller.disposition[4]-=tem1*3;
                            obj_controller.disposition[5]-=tem1*3;popup=1;
                            
                            if (tem1>=3){popup=2;obj_controller.inqis_flag_lair+=1;
                                obj_controller.loyalty-=10;obj_controller.loyalty_hidden-=10;
                                if ((obj_controller.inqis_flag_lair=2) or (obj_controller.disposition[4]<0) or (obj_controller.loyalty<=0)) and (obj_controller.faction_status[eFACTION.Inquisition]!="War"){popup=0.3;obj_controller.alarm[8]=1;}// {popup=0.2;obj_controller.alarm[8]=1;}
                            }
                            if  (player_base.inquis_hidden = 1){
							 	player_base.inquis_hidden = 0;							
                       		}
						}
						var arsenal_search = search_planet_features(thata.p_upgrades[t], P_features.Arsenal)
						var arsenal;

                        if (array_length(arsenal_search) > 0 ){
                        	e=0;
                        	arsenal = thata.p_upgrades[t][arsenal_search[0]];
                        	arsenal.inquis_hidden = 0;
                            for (e=0;e<array_length(obj_ini.artifact_tags[e]);e++){
                                if (obj_ini.artifact[e]!="") and (obj_ini.artifact_loc[e]=thata.name) and (obj_controller.und_armouries<=1){
                                    if (string_count("Daemon",obj_ini.artifact_tags[e])>0) then dem+=1;
                                    if (string_count("Chaos",obj_ini.artifact_tags[e])>0) then cha+=1;
                                }
                            }
                            perc=((dem*10)+(cha*3))/100;
                            obj_controller.disposition[2]-=max(round((obj_controller.disposition[2]/6)*perc),round(8*perc));
                            obj_controller.disposition[4]-=max(round((obj_controller.disposition[4]/4)*perc),round(10*perc));
                            obj_controller.disposition[5]-=max(round((obj_controller.disposition[5]/4)*perc),round(10*perc));
                            
                            popup=3;if ((dem*10)+(cha*3)>=10) then popup=4;
          
                            if ((obj_controller.disposition[4]<0) or (obj_controller.loyalty<=0)) and (obj_controller.faction_status[eFACTION.Inquisition]!="War") and (popup=3){popup=0.3;
                                var moo;moo=false;
                                if (obj_controller.penitent=1) and (moo=false){obj_controller.alarm[8]=1;moo=true;}
                                if (obj_controller.penitent=0) and (moo=false) then scr_audience(4,"loyalty_zero",0,"",0,0);
                            }
                            if ((obj_controller.disposition[4]<0) or (obj_controller.loyalty<=0)) and (obj_controller.faction_status[eFACTION.Inquisition]!="War") and (popup=4){popup=0.4;
                                var moo;moo=false;
                                if (obj_controller.penitent=1) and (moo=false){obj_controller.alarm[8]=1;moo=true;}
                                if (obj_controller.penitent=0) and (moo=false) then scr_audience(4,"loyalty_zero",0,"",0,0);
                            }
                        }
 						var vault = search_planet_features(thata.p_upgrades[t], P_features.Arsenal)
						var gene_vault;                       
                        if (array_length(vault) > 0 ){
                        	gene_vault = thata.p_upgrades[t][arsenal_search[0]];
                        	gene_vault.inquis_hidden = 0;
                            obj_controller.inqis_flag_gene+=1;
                            obj_controller.loyalty-=10;obj_controller.loyalty_hidden-=10;
                            obj_controller.disposition[4]-=tem1*3;
                            
                            if (obj_controller.inqis_flag_gene=1) then popup=5;
                            if (obj_controller.inqis_flag_gene=2) then popup=6;
                            if ((obj_controller.inqis_flag_gene>=3) or (obj_controller.loyalty<=0) or (obj_controller.disposition[4]<0)) and (obj_controller.faction_status[eFACTION.Inquisition]!="War"){popup=0.6;obj_controller.alarm[8]=1;}
                        }
                        
                        // Popup1: Lair Discovered
                        // Popup2: Heretic Lair Discovered
                        // Popup3: Arsenal Discovered
                        // Popup4: Aresenal with Chaos/Demonic Discovered
                        // Popup5: First Gene-Seed warning
                        // Popup6: Second Gene-Seed warning
                        
                        if (popup=1) then scr_event_log("","Inquisitor "+string(obj_controller.inquisitor[whom])+" discovers your Secret Lair on "+string(thata.name)+" "+scr_roman(t)+".");
                        if (popup=2) or (popup=0.2) then scr_event_log("red","Inquisitor "+string(obj_controller.inquisitor[whom])+" discovers your Secret Lair on "+string(thata.name)+" "+scr_roman(t)+".");
                        if (popup=3) or (popup=0.3) then scr_event_log("","Inquisitor "+string(obj_controller.inquisitor[whom])+" discovers your Secret Arsenal on "+string(thata.name)+" "+scr_roman(t)+".");
                        if (popup=4) or (popup=0.4) then scr_event_log("red","Inquisitor "+string(obj_controller.inquisitor[whom])+" discovers your Secret Arsenal on "+string(thata.name)+" "+scr_roman(t)+".");
                        if (popup>=5) or (popup=0.6) then scr_event_log("","Inquisitor "+string(obj_controller.inquisitor[whom])+" discovers your Secret Gene-Vault on "+string(thata.name)+" "+scr_roman(t)+".");
                        
                        var pop_tit,pop_txt,pop_spe;
                        pop_tit="";pop_txt="";pop_spe="";
                        
                        if (popup=1){pop_tit="Inquisition Discovers Lair";pop_txt="Inquisitor "+string(obj_controller.inquisitor[whom])+" has discovered your Secret Lair on "+string(thata.name)+" "+scr_roman(t)+".  A quick inspection revealed that there was no contraband or heresy, though the Inquisition does not appreciate your secrecy at all.";}
                        if (popup=2){pop_tit="Inquisition Discovers Lair";pop_txt="Inquisitor "+string(obj_controller.inquisitor[whom])+" has discovered your Secret Lair on "+string(thata.name)+" "+scr_roman(t)+".  A quick inspection turned up heresy, most foul, and it has all been reported to the Inquisition.  They are seething, as a whole, and relations are damaged.";}
                        if (popup=3){pop_tit="Inquisition Discovers Arsenal";pop_txt="Inquisitor "+string(obj_controller.inquisitor[whom])+" has discovered your Secret Arsenal on "+string(thata.name)+" "+scr_roman(t)+".  A quick inspection revealed that there was no contraband or heresy, though the Inquisition does not appreciate your secrecy at all.";}
                        if (popup=4){pop_tit="Inquisition Discovers Arsenal";pop_txt="Inquisitor "+string(obj_controller.inquisitor[whom])+" has discovered your Secret Arsenal on "+string(thata.name)+" "+scr_roman(t)+".  A quick inspection turned up heresy, most foul, and it has all been reported to the Inquisition.  Relations have been heavily damaged.";}
                        if (popup=5){pop_tit="Inquisition Discovers Arsenal";pop_txt="Inquisitor "+string(obj_controller.inquisitor[whom])+" has discovered your Secret Gene-Vault on "+string(thata.name)+" "+scr_roman(t)+" and reported it.  The Inquisition does NOT appreciate your secrecy, nor the fact that you were able to mass produce Gene-Seed unknowest to the Imperium.  Relations are damaged.";}
                        if (popup=6){pop_tit="Inquisition Discovers Arsenal";pop_txt="Inquisitor "+string(obj_controller.inquisitor[whom])+" has discovered your Secret Gene-Vault on "+string(thata.name)+" "+scr_roman(t)+" and reported it.  You were warned once already to not sneak about with Gene-Seed stores and Test-Slave incubators.  Do not let it happen again or your Chapter will be branded heretics.";}
                        
                        if ((dem*10)+(cha*3)>=10){
                            pop_txt+="The Inquisitor responsible for the inspection also demands that you hand over all heretical materials and Artifacts.";
                            pop_spe="contraband";instance_create(x,y,obj_temp_arti);
                        }
                        
                        if (popup>=1) then scr_popup(pop_tit,pop_txt,"inquisition",pop_spe);
                        
                    }
                }
            }
            
            
            
            
            
            
            if (obj_ini.fleet_type=1) and (string_count("investigate",trade_goods)=0){
                scr_event_log("","Inquisitor finishes inspection of "+string(instance_nearest(x,y,obj_star).name)+".");
                scr_loyalty("blarg","inspect_world");// This updates the loyalties
                if (whom=0) then scr_alert("green","duhuhuhu","Inquisitor Ship finishes inspection of "+string(instance_nearest(x,y,obj_star).name)+".",x,y);
                if (whom>0) then scr_alert("green","duhuhuhu","Inquisitor "+string(obj_controller.inquisitor[whom])+" finishes inspection of "+string(instance_nearest(x,y,obj_star).name)+".",x,y);
            }
            if (obj_ini.fleet_type!=1) and (string_count("investigate",trade_goods)=0){
                scr_event_log("","Inquisitor finishes inspection of your fleet.");
                scr_loyalty("blarg","inspect_fleet");// This updates the loyalties
                if (whom=0) then scr_alert("green","duhuhuhu","Inquisitor Ship finishes inspection of your fleet.",x,y);
                if (whom>0) then scr_alert("green","duhuhuhu","Inquisitor "+string(obj_controller.inquisitor[whom])+" finishes inspecting your fleet.",x,y);
                target=0;
            }
            
            // Test-Slave Incubator Crap
            if (obj_controller.und_gene_vaults=0) and (string_count("investigate",trade_goods)=0){
                var e,sla,hur;e=0;sla=0;hur=0;
                repeat(120){e+=1;
                    if (obj_ini.slave_batch_num[e]>0) then sla+=obj_ini.slave_batch_num[e];
                }
                if (obj_controller.marines<=200) and (sla>=100) and (obj_controller.gene_seed>=1100) then hur=1;
                if (obj_controller.marines<=500) and (obj_controller.marines>200) and (sla>=75) and (obj_controller.gene_seed>=900) then hur=1;
                if (obj_controller.marines<=700) and (obj_controller.marines>500) and (sla>=50) and (obj_controller.gene_seed>=750) then hur=1;
                if (obj_controller.marines>700) and (sla>=50) and (obj_controller.gene_seed>=500) then hur=1;
                if (obj_controller.marines>990) and (sla>=50) then hur=2;
                if (hur>0){
                    obj_turn_end.popups+=1;
                    obj_turn_end.popup[obj_turn_end.popups]=1;
                    obj_turn_end.popup_type[obj_turn_end.popups]="Inquisition Inspection";
                    obj_turn_end.popup_image[obj_turn_end.popups]="inquisition";
                    
                    if (hur=1) then obj_controller.disposition[4]-=max(6,round(obj_controller.disposition[4]*0.2));
                    if (hur=2) then obj_controller.disposition[4]-=max(3,round(obj_controller.disposition[4]*0.1));
                    
                    
                    obj_controller.inqis_flag_gene+=1;
                    if (obj_controller.inqis_flag_gene=1){
                        if (hur=1) then obj_turn_end.popup_text[obj_turn_end.popups]="Inquisitor "+string(obj_controller.inquisitor[whom])+" has noted your abundant Gene-Seed stores and Test-Slave Incubators.  Your Chapter has plenty enough Gene-Seed to restore itself to full strength and the Incubators on top of that are excessive.  Both have been reported, and you are ordered to remove the Test-Slave Incubators.  Relations with the Inquisition are also more strained than before.";
                        if (hur=2) then obj_turn_end.popup_text[obj_turn_end.popups]="Inquisitor "+string(obj_controller.inquisitor[whom])+" has noted your abundant Gene-Seed stores and Test-Slave Incubators.  Your Chapter is already at full strength and the Incubators on top of that are excessive.  The Incubators have been reported, and you are ordered to remove them immediately.  Relations with the Inquisition are also slightly more strained than before.";
                    }
                    if (obj_controller.inqis_flag_gene=2){
                        if (hur=1) then obj_turn_end.popup_text[obj_turn_end.popups]="Inquisitor "+string(obj_controller.inquisitor[whom])+" has noted your abundant Gene-Seed stores and Test-Slave Incubators.  Both the stores and incubators have been reported, and you are AGAIN ordered to remove the Test-Slave Incubators.  The Inquisitor says this is your final warning.";
                        if (hur=2) then obj_turn_end.popup_text[obj_turn_end.popups]="Inquisitor "+string(obj_controller.inquisitor[whom])+" has noted your abundant Gene-Seed stores and Test-Slave Incubators.  Your Chapter is already at full strength and the Incubators are unneeded.  The Incubators have been reported, AGAIN, and you are to remove them.  The Inquisitor says this is your final warning.";
                    }
                    if (obj_controller.inqis_flag_gene=3){
                        if (obj_controller.faction_status[eFACTION.Inquisition]!="War") then obj_controller.alarm[8]=1;
                    }
                    
                }
            }
            // End Test-Slave Incubator Crap
            
            if (obj_controller.known[eFACTION.Inquisition]=1){obj_controller.known[eFACTION.Inquisition]=3;}
            if (obj_controller.known[eFACTION.Inquisition]=2){obj_controller.known[eFACTION.Inquisition]=4;}
            
            instance_deactivate_object(spid);
            repeat(choose(1,2)){
                spid=instance_nearest(x,y,obj_star);
                instance_deactivate_object(spid);
            }
            
            repeat(5){
                spid=instance_nearest(x,y,obj_star);
                if (spid.owner=eFACTION.Eldar) then instance_deactivate_object(spid);
            }
            // 135;
            if (obj_controller.loyalty_hidden<=0){// obj_controller.alarm[7]=1;global.defeat=2;
                var moo;moo=false;
                if (obj_controller.penitent=1) and (moo=false){obj_controller.alarm[8]=1;moo=true;}
                if (obj_controller.penitent=0) and (moo=false) then scr_audience(4,"loyalty_zero",0,"",0,0);
            }
            
            spid=instance_nearest(x,y,obj_star);
            action_x=spid.x;
            action_y=spid.y;
            alarm[4]=1;
            instance_activate_object(obj_star);
            trade_goods="|DELETE|";
            exit;
        }
    }
    
    if (owner=eFACTION.Tau){
        if (instance_exists(obj_p_fleet)) and (obj_controller.known[eFACTION.Tau]=0){
            var p_ship =instance_nearest(x,y,obj_p_fleet);
            if (p_ship.action="") and (point_distance(x,y,p_ship.x,p_ship.y)<=80) then obj_controller.known[eFACTION.Tau] = 1;
        }
        
        
        /*if (image_index>=4){
            with(obj_star){
                if (owner = eFACTION.Tau) and (present_fleets>0) and (tau_fleets=0){
                    instance_create(x,y,obj_temp5);
                }
            }
            if (instance_exists(obj_temp5)){
                var wop;wop=instance_nearest(x,y,obj_temp5);
                if (wop!=0) and (point_distance(x,y,wop.x,wop.y)<300) and (wop.x>5) and (wop.y>5){
                    target_x=wop.x;target_y=wop.y;
                    home_x=x;home_y=y;
                    alarm[4]=1;
                }
            }
            with(obj_temp5){instance_destroy();}
        }*/
    }
    
    if (owner = eFACTION.Tyranids) {// Juggle bio-resources
        if (capital_number*2>frigate_number){
            capital_number-=1;frigate_number+=2;
        }
        
        if (capital_number*4>escort_number){
            var rand;
            rand=choose(1,2,3,4);
            if (rand=4) then escort_number+=1;
        }
        
        
        
        if (capital_number>0){
            var onceh;onceh=0;
            if (spid.p_type[4]!="Dead") and (spid.planets=4){spid.p_tyranids[4]=5;onceh+=1;}
            if (spid.p_type[3]!="Dead") and (spid.planets>=3) and (onceh<capital_number){spid.p_tyranids[3]=5;onceh+=1;}
            if (spid.p_type[2]!="Dead") and (spid.planets>=2) and (onceh<capital_number){spid.p_tyranids[2]=5;onceh+=1;}
            if (spid.p_type[1]!="Dead") and (spid.planets>=1) and (onceh<capital_number){spid.p_tyranids[1]=5;onceh+=1;}
        }
        
        
        
        
        var n;
        n=0;
        
        if (spid.planets=0) then n=1;
        if (spid.planets=1) and (spid.p_type[1]="Dead") then n=1;
        if (spid.planets=2) and (spid.p_type[1]="Dead") and (spid.p_type[2]="Dead") then n=1;
        if (spid.planets=3) and (spid.p_type[1]="Dead") and (spid.p_type[2]="Dead") and (spid.p_type[3]="Dead") then n=1;
        if (spid.planets=4) and (spid.p_type[1]="Dead") and (spid.p_type[2]="Dead") and (spid.p_type[3]="Dead") and (spid.p_type[4]="Dead") then n=1;
        
        if (n=1){
            var xx,yy,good, plin, plin2;
            xx=0;yy=0;good=0;plin=0;plin2=0;
            
            if (capital_number>5) then n=5;
            
            instance_deactivate_object(spid);
            
            repeat(100){
                if (good!=5){
                    xx=self.x+random_range(-300,300);
                    yy=self.y+random_range(-300,300);
                    if (good=0) then plin=instance_nearest(xx,yy,obj_star);
                    if (good=1) and (n=5) then plin2=instance_nearest(xx,yy,obj_star);
                    
                    if (plin.planets=1) and (plin.p_type[1]!="Dead") then good=1;
                    if (plin.planets=2) and (plin.p_type[1]!="Dead") and (plin.p_type[2]!="Dead") then good=1;
                    if (plin.planets=3) and (plin.p_type[1]!="Dead") and (plin.p_type[2]!="Dead") and (plin.p_type[3]!="Dead") then good=1;
                    if (plin.planets=4) and (plin.p_type[1]!="Dead") and (plin.p_type[2]!="Dead") and (plin.p_type[3]!="Dead") and (plin.p_type[4]!="Dead") then good=1;
                    
                    
                    if (good=1) and (n=5){
                        if (!instance_exists(plin2)) then exit;
                        if (plin2.planets=1) and (plin2.p_type[1]!="Dead") then good=2;
                        if (plin2.planets=2) and (plin2.p_type[1]!="Dead") and (plin2.p_type[2]!="Dead") then good=2;
                        if (plin2.planets=3) and (plin2.p_type[1]!="Dead") and (plin2.p_type[2]!="Dead") and (plin2.p_type[3]!="Dead") then good=2;
                        if (plin2.planets=4) and (plin2.p_type[1]!="Dead") and (plin2.p_type[2]!="Dead") and (plin2.p_type[3]!="Dead") and (plin2.p_type[4]!="Dead") then good=2;
                        
                        var new_fleet;
                        new_fleet=instance_create(x,y,obj_en_fleet);
                        new_fleet.capital_number=floor(capital_number*0.4);
                        new_fleet.frigate_number=floor(frigate_number*0.4);
                        new_fleet.escort_number=floor(escort_number*0.4);
                        
                        capital_number-=new_fleet.capital_number;
                        frigate_number-=new_fleet.frigate_number;
                        escort_number-=new_fleet.escort_number;
                        
                        new_fleet.owner=eFACTION.Tyranids;
                        new_fleet.sprite_index=spr_fleet_tyranid;
                        new_fleet.image_index=1;
                        
                        /*with(new_fleet){
                            var ii;ii=0;ii+=capital_number;ii+=round((frigate_number/2));ii+=round((escort_number/4));
                            if (ii<=1) then ii=1;image_index=ii;
                        }*/
                        
                        new_fleet.action_x=plin2.x;
                        new_fleet.action_y=plin2.y;
                        new_fleet.alarm[4]=1;
                        good=5;
                    }
                    
                    
                    if (good=1) and (instance_exists(plin)){action_x=plin.x;action_y=plin.y;alarm[4]=1;if (n!=5) then good=5;}
                }
            }
            instance_activate_object(obj_star);
        }
    }
    
    if (owner=eFACTION.Ork) and (action="") and (instance_exists(spid)){// Should fix orks converging on useless planets
        var maxp,bad,i,hides,hide;maxp=0;bad=0;i=0;hides=1;hide=0;
        
        if (spid.planets<=0) or ((spid.planets=1) and (spid.p_type[1]="Dead")) then bad=1;
        if (spid.planets=2) and (spid.p_type[1]="Dead") and (spid.p_type[2]="Dead") then bad=1;
        
        if (bad=1){
            hides+=choose(0,1,2,3);
            
            repeat(hides){
                hide=instance_nearest(x,y,obj_star);
                with(hide){y+=20000;}
            }
            
            with(obj_star){if ((planets=1) and (p_type[1]="Dead")) or (owner=eFACTION.Ork) then y+=20000;}
            var nex;nex=instance_nearest(x,y,obj_star);
            action_x=nex.x;action_y=nex.y;alarm[4]=1;
            with(obj_star){if (y>=17000) then y-=20000;}
            with(obj_star){if (y>=17000) then y-=20000;}
            with(obj_star){if (y>=17000) then y-=20000;}
            with(obj_star){if (y>=17000) then y-=20000;}
            with(obj_star){if (y>=17000) then y-=20000;}
            exit;
        }
        
        /*i=0;repeat(4){i+=1;if (spid.p_type[i]!="") then maxp+=1;}
        i=0;repeat(4){i+=1;
            if (spid.p_player[i]+spid.p_traitors[i]+spid.p_chaos[i]+spid.p_tyranids[i]+spid.p_tau[i]+spid.p_necrons[i]=0) 
             or (spid.p_type[i]="Dead") 
              or (spid.p_owner[i]=7) then bad+=1;
        }
        if (bad>=maxp){
            with(spid){y+=20000;}
            with(obj_star){if ((planets=1) and (p_type[1]="Dead")) or (owner = eFACTION.Ork) then y+=20000;}
            var nex;nex=instance_nearest(x,y,obj_star);
            action_x=nex.x;action_y=nex.y;alarm[4]=1;
            with(obj_star){if (y>=16000) then y-=20000;}
            with(obj_star){if (y>=16000) then y-=20000;}
            with(obj_star){if (y>=16000) then y-=20000;}
            exit;
        }*/
    
        
        
        /*
        i=0;repeat(4){i+=1;
            if (i<=orbiting.planets) and (orbiting.p_type[i]!="") and (orbiting.p_type[i]!="Dead") and (orbiting.p_player[i]+orbiting.p_traitors[i]+orbiting.p_chaos[i]+orbiting.p_tyranids[i]+orbiting.p_tau[i]+orbiting.p_necrons[i]+orbiting.p_sisters[i]>0) and (orbiting.p_orks[i]<=4) then maxp+=1;
            else bad+=1;
        }
        
        
        i=0;repeat(4){i+=1;if (orbiting.p_type[i]!="") and (orbiting.p_type[i]!="Dead") then maxp+=1;}
        i=0;repeat(4){i+=1;
            if (orbiting.p_player[i]+orbiting.p_traitors[i]+orbiting.p_chaos[i]+orbiting.p_tyranids[i]+orbiting.p_tau[i]+orbiting.p_necrons[i]+orbiting.p_sisters[i]=0) 
             or (orbiting.p_type[i]="Dead") 
              or (orbiting.p_owner[i]=7) then bad+=1;
        }
        
        if (maxp=0) or (bad>=maxp){
            with(orbiting){y+=20000;}
            with(obj_star){if ((planets=1) and (p_type[1]="Dead")) or (owner = eFACTION.Ork) or (planets=0) then y+=20000;}
            var nex;nex=instance_nearest(x,y,obj_star);
            action_x=nex.x;action_y=nex.y;alarm[1]=4;
            with(obj_star){if (y>=17000) then y-=20000;}
            with(obj_star){if (y>=17000) then y-=20000;}
            with(obj_star){if (y>=17000) then y-=20000;}
            exit;
        }*/
    }
}


if (action="move") and (action_eta>5000){
    var woop = instance_nearest(x,y,obj_star);
    if (woop.storm=0) then action_eta-=10000;
}

if (action="move") and (action_eta<5000){
    if (instance_nearest(action_x,action_y,obj_star).storm>0) then exit;
    if (action_x+action_y=0) then exit;
    
    var spid,dos;dos=0;spid=0;
    dos=point_distance(x,y,action_x,action_y);
    spid=dos/action_eta;
    dir=point_direction(x,y,action_x,action_y);
    
    x=x+lengthdir_x(spid,dir);
    y=y+lengthdir_y(spid,dir);
    
    action_eta-=1;
    
    /*if (owner>5){
        
    }*/
    
    if (action_eta=2) and (owner=eFACTION.Inquisition) {
        if (instance_nearest(action_x,action_y,obj_star).owner  = eFACTION.Player) and (string_count("eet",trade_goods)=0) and (string_count("_her",trade_goods)=0){
            if (string_count("Inqis",trade_goods)=0) then scr_alert("green","duhuhuhu","Inquisitor Ship approaches "+string(instance_nearest(action_x,action_y,obj_star).name)+".",x,y);
            if (string_count("Inqis1",trade_goods)=1) then scr_alert("green","duhuhuhu","Inquisitor "+string(obj_controller.inquisitor[1])+" approaches "+string(instance_nearest(action_x,action_y,obj_star).name)+".",x,y);
            if (string_count("Inqis2",trade_goods)=2) then scr_alert("green","duhuhuhu","Inquisitor "+string(obj_controller.inquisitor[2])+" approaches "+string(instance_nearest(action_x,action_y,obj_star).name)+".",x,y);
            if (string_count("Inqis3",trade_goods)=3) then scr_alert("green","duhuhuhu","Inquisitor "+string(obj_controller.inquisitor[3])+" approaches "+string(instance_nearest(action_x,action_y,obj_star).name)+".",x,y);
            if (string_count("Inqis4",trade_goods)=4) then scr_alert("green","duhuhuhu","Inquisitor "+string(obj_controller.inquisitor[4])+" approaches "+string(instance_nearest(action_x,action_y,obj_star).name)+".",x,y);
            if (string_count("Inqis5",trade_goods)=5) then scr_alert("green","duhuhuhu","Inquisitor "+string(obj_controller.inquisitor[5])+" approaches "+string(instance_nearest(action_x,action_y,obj_star).name)+".",x,y);
            
            
        
            // scr_alert("green","duhuhuhu","Inquisitor Ship approaches "+string(instance_nearest(action_x,action_y,obj_star).name)+".",x,y);
        }
    }
    
    if (action_eta=0) {
        var steh, sta, steh_dist, old_x, old_y;
        steh=instance_nearest(action_x,action_y,obj_star);
        sta=instance_nearest(action_x,action_y,obj_star);
        
        // steh.present_fleets+=1;if (owner = eFACTION.Tau) then steh.tau_fleets+=1;
        
        
        if (owner = eFACTION.Mechanicus){
            if (string_count("spelunk1",trade_goods)=1){
                trade_goods="mars_spelunk2";action_x=home_x;action_y=home_y;action_eta=52;exit;
            }
            if (string_count("spelunk2",trade_goods)=1){
                // Unload techmarines nao plz
                scr_mission_reward("mars_spelunk",instance_nearest(home_x,home_y,obj_star),1);
                instance_destroy();
            }
        }
        
        
        if (trade_goods="colonize") or (trade_goods="colonizeL"){
            var onceh,lag,r;onceh=0;lag=1;r=0;
            if (trade_goods="colonizeL") then lag=2;
            
            repeat(4){
                r+=1;
                
                if (onceh=0) and (sta.p_population[r]=0) and (sta.p_type[r]!="") and (sta.p_type[r]!="Dead") and (sta.planets>=r){onceh=1;
                    if (lag=1){sta.p_population[r]+=guardsmen;sta.p_large[r]=0;guardsmen=0;}
                    if (lag=2){sta.p_population[r]+=guardsmen;sta.p_large[r]=1;guardsmen=0;}
                    
                    if (r=1) then scr_alert("green","duhuhuhu","Imperial citizens recolonize "+string(sta.name)+" I.",sta.x,sta.y);
                    if (r=2) then scr_alert("green","duhuhuhu","Imperial citizens recolonize "+string(sta.name)+" II.",sta.x,sta.y);
                    if (r=3) then scr_alert("green","duhuhuhu","Imperial citizens recolonize "+string(sta.name)+" III.",sta.x,sta.y);
                    if (r=4) then scr_alert("green","duhuhuhu","Imperial citizens recolonize "+string(sta.name)+" IV.",sta.x,sta.y);
                    
                    sta.dispo[r]=min(obj_ini.imperium_disposition,obj_controller.disposition[2])+choose(-1,-2,-3,-4,0,1,2,3,4);;
                    if (sta.name=obj_ini.home_name) and (sta.p_type[r]=obj_ini.home_type) and (obj_controller.homeworld_rule!=1) then sta.dispo[r]=-5000;
                    
                    // sta.present_fleet[owner]-=1;
                    instance_destroy();
                    exit;exit;
                }
                
            }
            
        }
        
        
        
        
        if (trade_goods="return") and (action="move"){
            // with(instance_nearest(x,y,obj_star)){present_fleets-=1;}
            instance_destroy();
        }
        
        
        
        
        
        if (trade_goods="female_her") or (trade_goods="male_her"){
            // if (owner  = eFACTION.Inquisition) then show_message("A");
            
            var next;next=0;
            if (!instance_exists(obj_p_fleet)) then next=1;
            if (instance_exists(obj_p_fleet)){
                with(obj_p_fleet){if (action!="") then instance_deactivate_object(id);}
                var pfa;pfa=instance_nearest(x,y,obj_p_fleet);
                if (point_distance(x,y,pfa.x,pfa.y)<40) then next=2;
                if (point_distance(x,y,pfa.x,pfa.y)>=40) then next=1;
            }
            instance_activate_object(obj_p_fleet);
            if (next=1){
                action_x=choose(room_width*-1,room_width*2);
                action_y=choose(room_height*-1,room_height*2);
                alarm[4]=1;trade_goods="|DELETE|";
                action_spd=256;action="";
                obj_controller.disposition[4]-=15;
                scr_popup("Inquisitor Mission Failed","The radical Inquisitor has departed from the planned intercept coordinates.  They will now be nearly impossible to track- the mission is a failure.","inquisition","");
                scr_event_log("red","Inquisition Mission Failed: The radical Inquisitor has departed from the planned intercept coordinates.");
            }
            if (next=2){
                action="";y-=24;
                var tixt,gender;
                if (trade_goods="male_her") then gender="he";if (trade_goods="female_her") then gender="she";
                tixt="You have located the radical Inquisitor.  As you prepare to destroy their ship, and complete the mission, you recieve a hail- it appears as though "+string(gender)+" wishes to speak.";
                if (trade_goods="male_her") then scr_popup("Inquisitor Located",tixt,"inquisition","1");
                if (trade_goods="female_her") then scr_popup("Inquisitor Located",tixt,"inquisition","2");
            }
            instance_deactivate_object(id);
            instance_deactivate_object(id);
            exit;
        }
        
        
        
        
        
        
        if (navy=0){
            var cancel;
			cancel=false;
            if (string_count("Inqis",trade_goods)>0) then cancel=true;
            if (string_count("merge",trade_goods)>0) then cancel=true;
            if (trade_goods="cancel_inspection") then cancel=true;
            if (trade_goods="|DELETE|") then cancel=true;
            if (trade_goods="return") then cancel=true;
            if (string_count("_her",trade_goods)>0) then cancel=true;
            if (string_count("investigate_dead",trade_goods)>0) then cancel=true;
            if (string_count("spelunk",trade_goods)>0) then cancel=true;
            if (string_count("BLOOD",trade_goods)>0) then cancel=true;
            if (trade_goods="WL7") then cancel=true;
            if (trade_goods="csm") then cancel=true;
            
            if (trade_goods!="") and (owner!=eFACTION.Tyranids) and (owner!=eFACTION.Chaos) and (cancel=false) and ((instance_exists(target)) or (obj_ini.fleet_type=1)) {
                if ((trade_goods!="return") and (target!=0) and ((target.action!="") or (point_distance(x,y,target.x,target.y)>30))) and (obj_ini.fleet_type!=1) and (navy=0){
                    var mah_x,mah_y;
                    mah_x=instance_nearest(x,y,obj_star).x;
                    mah_y=instance_nearest(x,y,obj_star).y;
                    
                    if (target!=noone) and (string_count("Inqis",trade_goods)=0){
                        if (instance_exists(target)) {
                            
                            if (target.action!="") or (point_distance(x,y,target.x,target.y)>40){
                           
                                if (target.action!="") {
									action="";
									action_x=target.action_x;
									action_y=target.action_y;
									alarm[4]=1;
									if (owner!=eFACTION.Eldar) then obj_controller.disposition[owner]-=1;exit;}
                                if (target.action="" ){
									action="";
                                    action_x=instance_nearest(target.x,target.y,obj_star).x;
                                    action_y=instance_nearest(target.x,target.y,obj_star).y;
                                    alarm[4]=1;
									if (owner!=eFACTION.Eldar) then obj_controller.disposition[owner]-=1;exit;
                                }
                            }
                        }
                    }
                }
                
                
                /*show_message(string(trade_goods));
                show_message(string_count("_her",trade_goods)=0);
                show_message(target);
                show_message(string(point_distance(x,y,target.x,target.y)));
                show_message(target.action);*/
                
                
                
                if (trade_goods!="return") and (string_count("_her",trade_goods)=0) and ((target=noone) or ((point_distance(x,y,target.x,target.y)<=40)) and ((target.action="") or (obj_ini.fleet_type=1))){
                    with(obj_temp2){instance_destroy();}
                    with(obj_temp3){instance_destroy();}
                    with(obj_temp4){instance_destroy();}
                    
                    var targ, steh;steh=instance_nearest(x,y,obj_star);
                    var bleh;bleh="";
                    if (owner!=eFACTION.Inquisition) 
						bleh=string(obj_controller.faction[owner])+" Fleet finalizes trade at "+string(steh.name)+".";
                    else
						bleh="Inquisitor Ship finalizes trade at "+string(steh.name)+".";
                    debugl(bleh);scr_alert("green","trade",bleh,steh.x,steh.y);scr_event_log("",bleh);
                    
                    // Drop off here
                    if (trade_goods!="stuff") and (trade_goods!="none") then scr_trade_dep();
                    
                    trade_goods="return";
                    if (target!=noone) then target=noone;
                    
                    if (owner=eFACTION.Eldar){
                        with(obj_star){
							if (owner= eFACTION.Eldar) and (p_owner[1]= eFACTION.Eldar) {
								instance_create(x,y,obj_temp4);
								instance_create(x,y,obj_temp3);
							}
						}
                        // with(obj_temp4){x=instance_nearest(obj_temp3.x,obj_temp3.y,obj_star).old_x;y=instance_nearest(obj_temp3.x,obj_temp3.y,obj_star).old_y;}
                    }
                    
                    
                    
                    // show_message("temp3 created");
                    // show_message("x:"+string(temp3.x)+",y:"+string(temp3.y));
                    
                    /*if (owner != eFACTION.Eldar) then targ=instance_nearest(x,y,obj_temp3);
                    if (owner = eFACTION.Eldar) then targ=instance_nearest(x,y,obj_temp4);*/
                    // show_message("targ ID: "+string(targ.instance_id));
                    // targ=instance_nearest(x,y,obj_temp3);
                    
                    
                    
                    /*action_x=targ.x;
                    action_y=targ.y;*/
                    
                    
                    // show_message(string(home_x)+","+string(home_y));
                    
                    action_x=home_x;
					action_y=home_y;
                    if (owner=eFACTION.Eldar) {
						targ=instance_nearest(x,y,obj_temp4);
						action_x=targ.x;
						action_y=targ.y;
					}
                    
                    action_eta=0;
					action="";
					//more alarm shenanigans
                    alarm[4]=1;
                    
                    with(obj_temp2){instance_destroy();}
                    with(obj_temp3){instance_destroy();}
                    with(obj_temp4){instance_destroy();}
                    exit;
                }
                exit;
            }
        }
        
        
        
        
        if (owner=eFACTION.Inquisition) and (string_count("_her",trade_goods)=0){
            if (steh.owner  = eFACTION.Player) and (trade_goods="cancel_inspection"){
                instance_deactivate_object(steh);
                repeat(choose(1,2)){
                    spid=instance_nearest(x,y,obj_star);
                    instance_deactivate_object(spid);
                }
                
                repeat(5){
                    spid=instance_nearest(x,y,obj_star);
                    if (spid.owner = eFACTION.Eldar) then instance_deactivate_object(spid);
                }
                
                spid=instance_nearest(x,y,obj_star);
                action_x=spid.x;
                action_y=spid.y;
                alarm[4]=1;
                instance_activate_object(obj_star);
                trade_goods+="|DELETE|";
                exit;
            }
        }
        
        
        /*if (owner = eFACTION.Imperium) and (guardsmen>0){// 135 ; guardsmen onto planet
            var en_p,en_planets,land,i;
            i=0;en_planets=0;land=0;
            
            if (sta.x=home_x) and (sta.y=home_y){
                repeat(4){i+=1;
                    en_p[i]=0;
                    if (sta.p_owner[i]<=5){en_p[i]=1;en_planets+=1;}
                }
                
                if (guardsmen>0) and (en_planets>0){
                    land=floor(guardsmen/en_planets);
                    i=0;
                    repeat(4){i+=1;
                        if (en_p[i]=1){guardsmen-=land;sta.p_guardsmen[i]+=land;}
                    }
                    if (guardsmen<5) then guardsmen=0;
                }
            }
            if (sta.owner>5) or ((sta.owner  = eFACTION.Player) and (obj_controller.faction_status[eFACTION.Imperium]="War")){
                repeat(4){i+=1;
                    en_p[i]=0;
                    if (sta.p_player[i]>0) and (obj_controller.faction_status[eFACTION.Imperium]="War"){en_p[i]=1;en_planets+=1;}
                }
                
                if (guardsmen>0) and (en_planets>0){
                    land=floor(guardsmen/en_planets);
                    i=0;
                    repeat(4){i+=1;
                        if (en_p[i]=1){guardsmen-=land;sta.p_guardsmen[i]+=land;}
                    }
                    if (guardsmen<5) then guardsmen=0;
                }
            }
        }*/
        
        
        
        
        action="";
        if (owner= eFACTION.Imperium){x=action_x;y=action_y-24;if (navy=1) then x=action_x+24;}
        if (owner= eFACTION.Mechanicus){x=action_x;y=action_y-32;}
        if (owner= eFACTION.Inquisition){x=action_x;y=action_y-32;
            if (string_count("DELETE",trade_goods)>0) then instance_destroy();
            if (obj_controller.known[eFACTION.Inquisition]=0) then obj_controller.known[eFACTION.Inquisition]=1;
        }
        if (owner=eFACTION.Eldar){x=action_x-24;y=action_y-24;}
        if (owner=eFACTION.Ork){x=action_x+30;y=action_y;}
        if (owner=eFACTION.Tau) {
            x=action_x-24;y=action_y-24;
            if (instance_exists(obj_p_ship)){
                var p_ship;p_ship=instance_nearest(x,y,obj_p_ship);
                if (p_ship.action="") and (point_distance(x,y,p_ship.x,p_ship.y)<80){
                    if (obj_controller.p_known[8]=0) then obj_controller.p_known[8]=1;
                }
            }
        }
        if (owner=eFACTION.Tyranids){
            x=action_x;y=action_y+32;
            var mess,plap;mess=1;plap=99999;plap=instance_nearest(action_x,action_y,obj_p_fleet);
            
            if (instance_exists(plap)){if (point_distance(plap.x,plap.y,action_x,action_y)<80) then mess=0;}
            
            if (mess=1) and (sta.vision!=0){
                scr_alert("red","owner","Contact has been lost with "+string(sta.name)+"!",sta.x,sta.y);
                scr_event_log("red","Contact has been lost with "+string(sta.name)+".");sta.vision=0;}
        }
        if (owner=eFACTION.Chaos){x=action_x-30;y=action_y;}
        if (owner=eFACTION.Necrons){x=action_x+32;y=action_y+32;}
        action_x=0;
        action_y=0;
        
        
        
        
        
        
        // 135 ; fleet chase
        if (string_count("Inqis",trade_goods)>0) and (string_count("eet",trade_goods)>0) and (string_count("_her",trade_goods)=0) {
            var acty,good;acty="";good=0;
			
			if (!instance_exists(target)){// Reaquire target
                with(obj_temp4){instance_destroy();}
                with(obj_temp5){instance_destroy();}
                
                if (instance_exists(obj_p_fleet)){
                    with(obj_p_fleet){
                        if (capital_number>0){instance_create(x,y,obj_temp5);}
                        if (frigate_number>0) then instance_create(x,y,obj_temp4);
                    }
                
                    var obj,x4,y4,from,flit;
                    if (instance_exists(obj_p_ship)) then obj=instance_nearest(x,y,obj_p_ship);
                    if (instance_exists(obj_temp4)) then obj=instance_nearest(x,y,obj_temp4);
                    if (instance_exists(obj_temp5)) then obj=instance_nearest(x,y,obj_temp5);
                    
                    x4=obj.x;y4=obj.y;
                    
                    with(obj_star){if (owner = eFACTION.Eldar) then instance_deactivate_object(id);}
                    
                    
                    repeat(choose(2,3)){
                        from=instance_nearest(x4,y4,obj_star);with(from){instance_deactivate_object(id);};
                    }
                    from=instance_nearest(x4,y4,obj_star);
                    instance_activate_object(obj_star);
                    
                    target=instance_nearest(x4,y4,obj_p_fleet);
                    target_x=0;
                    target_y=0;
                    
                    with(obj_temp4){instance_destroy();}
                    with(obj_temp5){instance_destroy();}
				}
                instance_activate_object(obj_star);
			}
			if (target>0) and (instance_exists(target)) {
            
	            var meh,teh;
	            meh=instance_nearest(target.x,target.y,obj_star).id;
	            teh=instance_nearest(x,y,obj_star).id;
	            if (target.action!="") then meh=555;
            
	            if (meh!=teh){trade_goods+="!";acty="chase";scr_loyalty("Avoiding Inspections","+");}
            
	            // if (string_count("!",trade_goods)>=3) then demand stop fleet
            
            
	            if (string_count("!",trade_goods)=5){
	                obj_controller.alarm[8]=10;
	                instance_destroy();exit;
	            }
            
            
	            if (acty="chase"){
	                instance_activate_object(obj_star);
	                var goal_x,goal_y,tonk;tonk=0;
                
	                if (target.action!=""){goal_x=target.action_x;goal_y=target.action_y;tonk=instance_nearest(goal_x,goal_y,obj_star);}
	                if (target.action=""){
	                    var wop;wop=instance_nearest(target.x,target.y,obj_star);
	                    tonk=wop;goal_x=wop.x;goal_y=wop.y;
	                }
                
	                with(obj_temp3){instance_destroy();}
	                with(obj_temp4){instance_destroy();}
                
                
                
	                // This is the goal destination
	                instance_create(goal_x,goal_y,obj_temp3);
	                obj_temp3.x2=instance_nearest(goal_x,goal_y,obj_star).x2;
	                obj_temp3.y2=instance_nearest(goal_x,goal_y,obj_star).y2;
                
	                if (!instance_exists(obj_temp4)){// Just book it after them
	                    good=1;
	                }
                
	                if (good=1){
	                    action_x=tonk.x;
	                    action_y=tonk.y;
	                    action="";
	                    alarm[4]=1;
	                }
                
                
                
	                if (string_count("!",trade_goods)=4) and (instance_exists(obj_turn_end)){
                
	                // color / type / text /x/y
                
	                    scr_alert("blank","blank","blank",tonk.x,tonk.y);
                    
	                    var massa,iq;iq=0;
	                    massa="Inquisitor ";
                    
	                    if (string_count("Inqis1",trade_goods)=1) then iq=1;
	                    if (string_count("Inqis2",trade_goods)=1) then iq=2;
	                    if (string_count("Inqis3",trade_goods)=1) then iq=3;
	                    if (string_count("Inqis4",trade_goods)=1) then iq=4;
	                    if (string_count("Inqis5",trade_goods)=1) then iq=5;
                    
	                    massa+=string(obj_controller.inquisitor[iq]);
                    
	                    if (target.action="") then massa+=" DEMANDS that you keep your fleet at "+string(tonk.name)+" until ";
	                    if (target.action!="") then massa+=" DEMANDS that you station your fleet at "+string(tonk.name)+" until ";
                
	                    scr_event_log("red",string(massa)+" they may inspect it.");
                    
	                    if (obj_controller.inquisitor_gender[iq]=1) then massa+="he is able to complete the inspection.  Further avoidance will be met with harsh action.";
	                    if (obj_controller.inquisitor_gender[iq]=2) then massa+="she is able to complete the inspection.  Further avoidance will be met with harsh action.";
                    
                    
	                    scr_popup("Fleet Inspection",massa,"inquisition","");
                
	                // scr_poup("
	                }
                
                
	                with(obj_temp3){instance_destroy();}
	                with(obj_temp4){instance_destroy();}
	                exit;
				}
            }
        }


        old_x=x;old_y=y;
        x=-100;y=-100;
        
        steh=instance_nearest(old_x,old_y,obj_en_fleet);
        var mergus;mergus=0;
        
        mergus=steh.image_index;
        if (mergus<3) then mergus=0;
        if (mergus>=3) then mergus=10;
        if (owner = eFACTION.Tau) and (mergus>=3) then mergus=0;
        if (string_count("_her",trade_goods)=0) then mergus=99;// was 999
        
        // Think this might be causing the crash
        if (owner=eFACTION.Tau) and (sta.present_fleet[eFACTION.Imperium]+sta.present_fleet[eFACTION.Player]>=1) 
			and (sta.present_fleet[eFACTION.Tau]=1) and (image_index=1) and (ret=0) then mergus=15;
        if (steh.owner=eFACTION.Tau) and (owner=eFACTION.Tau) and (ret=1) then mergus=0;
        
        
        
        
        if (owner=eFACTION.Tau) and (image_index=1){
            // show_message("Tau|||  Other Owner: "+string(steh.owner)+"   ret: "+string(ret)+"    mergus: "+string(mergus));
        }
        
        if (owner=eFACTION.Chaos) and (trade_goods="csm") or (trade_goods="BLOODBLOODBLOOD") then mergus=0;
        if (trade_goods="merge") then mergus=0;
        // if (steh.owner!=owner) then mergus=0;
        
        
        
        
        if (steh.x=old_x) and (steh.y=old_y) and (steh.owner=self.owner) and (steh.action="") and (mergus=1999){// Merge the fleets
            steh.escort_number+=self.escort_number;
            steh.frigate_number+=self.frigate_number;// show_message("Tau fleet merging");
            steh.capital_number+=self.capital_number;
            steh.guardsmen+=self.guardsmen;
            
            
            
            steh=instance_nearest(old_x,old_y,obj_star);
            // if (steh.present_fleets>=1) then steh.present_fleets-=1;
            if (owner = eFACTION.Tau){obj_controller.tau_fleets-=1;steh.tau_fleets-=1;}
            if (owner = eFACTION.Chaos) then obj_controller.chaos_fleets-=1;
            
            instance_destroy();
        }// End merge fleets
        
        
        
        if (owner=eFACTION.Tau) and (mergus=15){                                               // Get the fuck out
            var new_star, stue;new_star=0;stue=0;ret=1;
            
            
            instance_activate_object(obj_star);// new_star
            stue=instance_nearest(x,y,obj_star);
            
            
            
            if (image_index=1){// Start influence thing
                var rando3, rando4;
                rando3=floor(random(100))+1;
                rando4=floor(random(stue.planets))+1;
                
                // show_message(string(stue.p_type[rando4])+" | "+string(stue.p_influence[rando4]));
                // show_message(string(rando3)+"|"+string(rando4));
                
                
                if (stue.p_type[rando4]!="Dead"){
                
                    scr_alert("green","owner","Tau ship broadcasts subversive messages to "+string(sta.name)+" "+string(rando4)+".",sta.x,sta.y);
                
                    if (rando3<=70) and (stue.p_influence[rando4]<70){
                        stue.p_influence[rando4]+=10;
                        if (stue.p_type[rando4]="Forge") then stue.p_influence[rando4]-=5;
                    }
                    
                    if (rando3<=3) and (stue.p_influence[rando4]<70){
                        stue.p_influence[rando4]+=30;
                        if (stue.p_type[rando4]="Forge") then stue.p_influence[rando4]-=25;
                    }
                }
            } 
            
            
            
            instance_deactivate_object(stue);
            
            with(obj_star){if (owner != eFACTION.Tau) then instance_deactivate_object(instance_id);}
            
            var good;good=0;
            
            repeat(100){
                var xx, yy;
                if (good=0){
                    xx=x+choose(random(300),random(300)*-1);
                    yy=y+choose(random(300),random(300)*-1);
                    new_star=instance_nearest(xx,yy,obj_star);
                    if (new_star.owner!=eFACTION.Tau) then with(new_star){instance_deactivate_object(id);}
                    if (new_star.owner=eFACTION.Tau) then good=1;
                }
            }
            
            // show_message("Get the fuck out working?: "+string(good));
            
            if (new_star.owner=eFACTION.Tau){
                // show_message("Tau fleet actually fleeing");
                action="";action_x=new_star.x;action_y=new_star.y;alarm[4]=1;
            }
            
            instance_activate_object(obj_star);
            // This appears bugged
        }
        
        
        
        
        
        
        x=old_x;y=old_y;
        
        if (steh.x=old_x) and (steh.y=old_y) and (steh.owner=self.owner) and (steh.action="") and ((owner = eFACTION.Tau) or (owner = eFACTION.Chaos)) and (mergus=10) and (trade_goods!="csm") and (trade_goods!="BLOODBLOODBLOOD"){// Move somewhere new
            var stue, stue2;stue=0;stue2=0;
            var goood;goood=0;
            
            with(obj_star){if (planets=1) and (p_type[1]="Dead") then instance_deactivate_object(id);}
            stue=instance_nearest(x,y,obj_star);
            instance_deactivate_object(stue);
            repeat(10){
                if (goood=0){
                    stue2=instance_nearest(x+choose(random(400),random(400)*-1),y+choose(random(400),random(400)*-1),obj_star);
                    if (owner = eFACTION.Tau) and (stue2.owner = eFACTION.Tau) then goood=1;
                    if (owner = eFACTION.Chaos) and (stue2.owner != eFACTION.Chaos) then goood=1;
                    if (stue2.planets=0) then goood=0;
                    if (stue.present_fleet[eFACTION.Imperium]>0) or (stue.present_fleet[eFACTION.Player]>0) then goood=0;
                    if (stue2.planets=1) and (stue2.p_type[1]="Dead") then goood=0;
                    }
                }
            action_x=stue2.x;action_y=stue2.y;alarm[4]=1;// stue.present_fleets-=1;
            instance_activate_object(obj_star);
        }
        
        
        // ORKS
        // Right here check to see if the fleet is being useless
        // If yes check for connected planet, see if not owned by orks
        // If not owned by orks then start heading that way
        // If the connected planet is owned by orks then choose a random one within 400 not owned by orks
        
        
        if (owner = eFACTION.Ork){
            
            var kay, temp5, temp6, temp7;
            kay=0;temp5=0;temp6=0;temp7=0;
            
            var steh;steh=0;// Opposite of what normally is
			//the hell is this jank? Doesn't even make sense since all the tests will fail
            if (owner = eFACTION.Imperium) then steh=instance_nearest(x,y+32,obj_star);
            if (owner = eFACTION.Mechanicus) then steh=instance_nearest(x,y+32,obj_star);
            if (owner  = eFACTION.Inquisition) then steh=instance_nearest(x,y+32,obj_star);
            if (owner = eFACTION.Ork) then steh=instance_nearest(x-32,y,obj_star);
            if (owner = eFACTION.Tau) then steh=instance_nearest(x+24,y+24,obj_star);
            if (owner = eFACTION.Tyranids) then steh=instance_nearest(x,y-32,obj_star);
            if (owner = eFACTION.Chaos) then steh=instance_nearest(x+32,y,obj_star);
            
            
            // This is the new check to go along code; if doesn't add up to all planets = 7 then they exit
            
            if (steh.planets>=1) and (steh.p_type[1]!="Dead") and (steh.p_owner[1]!=7){kay=5;exit;}
            if (steh.planets>=2) and (steh.p_type[2]!="Dead") and (steh.p_owner[2]!=7){kay=5;exit;}
            if (steh.planets>=3) and (steh.p_type[3]!="Dead") and (steh.p_owner[3]!=7){kay=5;exit;}
            if (steh.planets>=4) and (steh.p_type[4]!="Dead") and (steh.p_owner[4]!=7){kay=5;exit;}
            
            
            /*
            var chick;chick=0;
            if (steh.p_type[1]!="Dead") then chick+=steh.p_owner[1];
            if (steh.p_type[2]!="Dead") then chick+=steh.p_owner[2];
            if (steh.p_type[3]!="Dead") then chick+=steh.p_owner[3];
            if (steh.p_type[4]!="Dead") then chick+=steh.p_owner[4];
            if (chick/7)!=round(chick/7){
                kay=5;exit;
            }*/
            
            /*if ((steh.owner = eFACTION.Ork) and (image_index>=5) and (owner = eFACTION.Ork)) or ((owner = eFACTION.Ork) and (image_index>=5) and (steh.planets=0)){// Continue away
                kay=50;
            }*/
            if (kay=5){// KILL the enemy
                if (steh.present_fleet[1]>1) or (steh.present_fleet[2]>1) then exit;
            }
            
            if ((steh.owner = eFACTION.Chaos) and (image_index>=5) and (owner = eFACTION.Chaos)) or ((owner = eFACTION.Chaos) and (image_index>=5) and (steh.planets=0)) then kay=50;
    
            if (kay=50){
            
                if (owner = eFACTION.Ork) then with(obj_star){if (owner = eFACTION.Ork) then instance_deactivate_object(instance_id);}
            
                repeat(20){
                    if (kay=50){
                        temp5=x+choose(random(300),random(300)*-1);temp6=y+choose(random(300),random(300)*-1);
                        temp7=instance_nearest(temp5,temp6,obj_star);
                        
                        if (owner = eFACTION.Ork) and (temp7.owner != eFACTION.Ork) and (temp7.planets>0) and (temp7.image_alpha>=1) then kay=55;
                        if (owner = eFACTION.Tau) and (temp7.owner != eFACTION.Tau) and (temp7.planets>0) and (temp7.image_alpha>=1) then kay=55;
                        if (owner = eFACTION.Chaos) and (temp7.owner != eFACTION.Chaos) and (temp7.planets>0) and (temp7.image_alpha>=1) then kay=55;
                    }
                }
            
                if (kay=55) and (instance_exists(temp7)){
                    action_x=temp7.x;
                    action_y=temp7.y;
                    alarm[4]=1;
                    // steh.present_fleets-=1;
                }
                
                instance_activate_object(obj_star);
            }
           
    
            instance_activate_object(obj_star);
     
        }
    
    
        exit;// end of eta=0
    }
    
}





/* */
/*  */
