
var orb=orbiting;

if (round(owner)!=eFACTION.Imperium) and (navy=1) then owner= noone;

//TODO centralise orbiting logic
if (orbiting != 0 && action=="" && owner!=noone){
    var orbiting_found=instance_exists(orbiting);
    if (orbiting_found){
        orbiting_found = variable_instance_exists(orbiting, "present_fleet");
        if (orbiting_found){
            orbiting.present_fleet[owner]+=1;
        }
    } 
    if (!orbiting_found) {
        orbiting = instance_nearest(x,y,obj_star);
        orbiting.present_fleet[owner]++;
    }
}

if ((trade_goods="Khorne_warband") or (trade_goods="Khorne_warband_landing_force")) and (owner=eFACTION.Chaos) {
    khorne_fleet_cargo();
}

if (orbiting != noone) {
    if (instance_exists(obj_crusade)) 
	and (orbiting.owner <= eFACTION.Ecclesiarchy) 
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
            orbiting.present_fleet[owner]-=1;
            home_x=orbiting.x;
            home_y=orbiting.y;
			
            var i;
			i=0;
            repeat(4){
				i+=1;
                if (orbiting.p_owner[i]=eFACTION.Imperium) and (orbiting.p_guardsmen[i]>500) {
					guardsmen +=round(orbiting.p_guardsmen[i]/2);
					orbiting.p_guardsmen[i]=round(orbiting.p_guardsmen[i]/2);}
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

if (navy) {
	if trade_goods != "player_hold" {


	if (action="") and (trade_goods="") and (instance_exists(orbiting)){
	    if (orbiting.present_fleet[20]>0) then exit;
	}


	// Check if the ground battle is victorious or not
	if (obj_controller.faction_status[eFACTION.Imperium]="War") and (action="") and (trade_goods="invading_player") and (guardsmen_unloaded=1) {
	    if (instance_exists(orbiting)) {
			
			//slightly more verbose than the last way, but reduces reliance on fixed array sizes
	        var tar = array_reduce(orbiting.p_guardsmen, function(prev, curr, idx) {
				return curr > 0 ? idx : prev;
			},0)
			
	        if (tar == 0) {// Guard all dead
	            trade_goods="recr";action="";
	        } else { //this was always a dead path previously since tar could never be bigger than i, now it will
	            if (orbiting.p_owner[tar]=eFACTION.Player) and (orbiting.p_player[tar]=0) and (planet_feature_bool(orbiting.p_feature[tar],P_features.Monastery)==0){
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
	if (obj_controller.faction_status[eFACTION.Imperium]="War") and (action="") and (trade_goods="") and (guardsmen_unloaded=0) and (instance_exists(orbiting)){
        var bombard=false;
	    if (orbiting!=noone){
            if (orbiting.object_index==obj_star) then bombard=true;
        }
        if (bombard){
			var orbiting_guardsmen = array_reduce(orbiting.p_guardsmen, array_sum,1);
			var player_forces = array_reduce(orbiting.p_player,  array_sum,1);

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

	                    if (scare>2) then scare=2;
                        if (scare<1) then scare=0;
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
		var player_owns_planet = array_reduce(orbiting.p_owner, array_sum,1, false);
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
	                        var diss=fleet_distance/2;
	                        var goto=0;
	                        var dirr=point_direction(x,y,fleet_nearby.x,fleet_nearby.y);
                        
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
	        with(obj_temp_inq){
                instance_destroy();
            }
	        with(obj_star){
	            var cont=0,p=0;
	            repeat(planets){
                    p+=1;
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
	            var go_there=instance_nearest(x,y,obj_temp_inq);
	            action_x=go_there.x;
                action_y=go_there.y;
                alarm[4]=1;
                trade_goods="goto_forge";// show_message("D");
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
                
	                repeat(orbiting.planets){
                        o+=1;
	                    if (orbiting.p_type[o]!="Daemon"){
	                        if (orbiting.p_population[o]=0) and (orbiting.p_tyranids[o]>0) and (onceh=0){
                                bombard=o;
                                onceh=1;
                            }
	                        if (orbiting.p_population[o]=0) and (orbiting.p_orks[o]>0) and (orbiting.p_owner[o]=7) and (onceh=0){bombard=o;onceh=1;}
	                        if (orbiting.p_owner[o]=8) and (orbiting.p_tau[o]+orbiting.p_pdf[o]>0) and (onceh=0){
                                bombard=o;onceh=1;
                            }
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
	var o=0;
	if (guardsmen_unloaded=1) and (instance_exists(orbiting)){
	    var o,bad;o=0;bad=1;
	    repeat(orbiting.planets){
            o+=1;
	        if (orbiting.p_guardsmen[o]>0) then bad-=1;
	    }
	    if (bad=1){
            guardsmen_unloaded=0;
            guardsmen_ratio=0;
            trade_goods="";
        }
	}


	// Go to recruiting grounds
	if ((guardsmen_unloaded=0) and (guardsmen_ratio<0.5) and ((trade_goods=""))) or (trade_goods="recr"){// determine what sort of planet is needed
	    var guard_wanted=maxi-curr,planet_needed=0;
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
    
	    var plah=false;
	    if (obj_controller.faction_status[eFACTION.Imperium]="War"){
	        if (orbiting.present_fleet[1]>0) then plah=true;
	        var r=0;
            repeat(orbiting.planets){
                r+=1;
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
            
	            action_x=next.x;
                action_y=next.y;
                alarm[4]=1;// show_message("G");
	        }
	    }
	}

	if (trade_goods="recruited") then trade_goods="";
	/* */
	}
}

var  dir;dir=0;
var ret;ret=0;


if (action==""){
    if (instance_exists(orbiting)){orbiting=orbiting;}// orbiting.present_fleet[owner]+=1;
    else{orbiting=instance_nearest(x,y,obj_star);orbiting=orbiting;}
    var max_dis;max_dis=400;
    
    if (instance_exists(orbiting)){
        if (orbiting.owner=eFACTION.Player) and (obj_controller.faction_status[eFACTION.Imperium]="War") and (owner=eFACTION.Imperium){
            var i;i=0;
            repeat(4){i+=1;
                if (orbiting.p_owner[i]=1) then orbiting.p_pdf[i]-=capital_number*50000;
                if (orbiting.p_owner[i]=1) then orbiting.p_pdf[i]-=frigate_number*10000;
                if (orbiting.p_pdf[i]<0) then orbiting.p_pdf[i]=0;
            }
        }
    }
    
    // 1355;
    
    
    if (instance_exists(obj_crusade)) and (owner=eFACTION.Ork) and (orbiting.owner=eFACTION.Ork){// Ork crusade AI
        var max_dis;
        max_dis=400;
    
        var fleet_owner = owner;
        with(obj_crusade){if (owner!=fleet_owner){x-=40000;}}
        
        with(obj_star){
            var ns=instance_nearest(x,y,obj_crusade);
            if (point_distance(x,y,ns.x,ns.y)>ns.radius){x-=40000;}
            if (owner=ns.owner){x-=40000;}
        }
        
        var ns=instance_nearest(x,y,obj_star);
        if (ns.owner != eFACTION.Ork) and (point_distance(x,y,ns.x,ns.y)<=max_dis) and (point_distance(x,y,ns.x,ns.y)>40) and (instance_exists(obj_crusade)) and (image_index>3){
            action_x=ns.x;
            action_y=ns.y;alarm[4]=1;
            home_x=orbiting.x;
            home_y=orbiting.y;
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
        var valid = true;
        if (instance_exists(target)){
            if (instance_nearest(target.x,target.y, obj_star).id != instance_nearest(x,y, obj_star).id){
                valid=false;
            }
        }
        if (((orbiting.owner = eFACTION.Player || system_feature_bool(orbiting.p_feature, P_features.Monastery)) or (obj_ini.fleet_type!=1)) and (trade_goods!="cancel_inspection") && valid){
            if (obj_controller.disposition[6]>=60) then scr_loyalty("Xeno Associate","+");
            if (obj_controller.disposition[7]>=60) then scr_loyalty("Xeno Associate","+");
            if (obj_controller.disposition[8]>=60) then scr_loyalty("Xeno Associate","+");
            
            if (orbiting.p_owner[2]=1) and (orbiting.p_heresy[2]>=60) then scr_loyalty("Heretic Homeworld","+");
            
            var whom=-1;
            whom = inquisitor;

            var inquis_string = $"Inquisitor {obj_controller.inquisitor[whom]}";
            
            // INVESTIGATE DEAD HERE 137 ; INVESTIGATE DEAD HERE 137 ; INVESTIGATE DEAD HERE 137 ; INVESTIGATE DEAD HERE 137 ; 
            var cur_star,t,type,cha,dem,tem1,tem1_base,perc,popup;
            t=0;type=0;cha=0;dem=0;tem1=0;popup=0;perc=0;tem1_base=0;
            
            cur_star=instance_nearest(x,y,obj_star);
            
            if (string_count("investigate",trade_goods)>0){
                // Check for xenos or demon-equip items on those planets
                //TODO update this to check weapon or artifact tags
                var e=0,ia=-1,ca=0;
                var unit;
                repeat(4400){
                    if (ca<=10) and (ca>=0){
                        ia+=1;
                        if (ia=400){ca+=1;ia=1;
                        if (ca=11) then ca=-5;}
                        if (ca>=0) and (ca<11){
                            unit=fetch_unit([ca,ia]);
                            if (obj_ini.loc[ca,ia]=cur_star.name) and (unit.planet_location>0){
                                if (unit.role()="Ork Sniper") and (obj_ini.race[ca,ia]!=1){tem1_base=3;}
                                if (unit.role()="Flash Git") and (obj_ini.race[ca,ia]!=1){tem1_base=3;}
                                if (unit.role()="Ranger") and (obj_ini.race[ca,ia]!=1){tem1_base=3;}
                                if (unit.equipped_artifact_tag("Daemon")){
                                	tem1_base+=3;
                                	dem+=1;
                                }
                            }
                        }
                    }
                }
                repeat(cur_star.planets){
                    t+=1;
                    tem1=tem1_base;// Repeat to check each of the planets
                    if (cur_star.p_type[t]="Dead") and (array_length(cur_star.p_upgrades[t])>0){
						var base_search = search_planet_features(cur_star.p_upgrades[t], P_features.Secret_Base); 
                        if (array_length(base_search) >0){
							var player_base = cur_star.p_upgrades[t][base_search[0]]
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
						var arsenal_search = search_planet_features(cur_star.p_upgrades[t], P_features.Arsenal)
						var arsenal;

                        if (array_length(arsenal_search) > 0 ){
                        	e=0;
                        	arsenal = cur_star.p_upgrades[t][arsenal_search[0]];
                        	arsenal.inquis_hidden = 0;
                            for (e=0;e<array_length(obj_ini.artifact_tags[e]);e++){
                                if (obj_ini.artifact[e]!="") and (obj_ini.artifact_loc[e]=cur_star.name) and (obj_controller.und_armouries<=1){
                                    if (array_contains(obj_ini.artifact_tags[e],"Chaos")) then cha+=1;
                                    if (array_contains(obj_ini.artifact_tags[e],"Daemon")) then dem+=1;
                                }
                            }
                            perc=((dem*10)+(cha*3))/100;
                            obj_controller.disposition[2]-=max(round((obj_controller.disposition[2]/6)*perc),round(8*perc));
                            obj_controller.disposition[4]-=max(round((obj_controller.disposition[4]/4)*perc),round(10*perc));
                            obj_controller.disposition[5]-=max(round((obj_controller.disposition[5]/4)*perc),round(10*perc));
                            
                            popup=3;
                            if ((dem*10)+(cha*3)>=10) then popup=4;

                            var start_inquisition_war = ((obj_controller.disposition[4]<0 || obj_controller.loyalty<=0) && obj_controller.faction_status[eFACTION.Inquisition]!="War")
                            
                            if (start_inquisition_war){
                                if (popup==3){
                                    popup=0.3;
                                    var moo=false;
                                    if (!moo){
                                        if (obj_controller.penitent=1) {
                                            obj_controller.alarm[8]=1;
                                            moo=true;
                                        }else if (obj_controller.penitent=0){
                                            scr_audience(4,"loyalty_zero",0,"",0,0);
                                        }
                                    }
                                }
                                else if (popup==4){
                                    popup=0.4;
                                    var moo=false;
                                    if (obj_controller.penitent=1) and (moo=false){obj_controller.alarm[8]=1;moo=true;}
                                    if (obj_controller.penitent=0) and (moo=false) then scr_audience(4,"loyalty_zero",0,"",0,0);
                                }
                            }
                        }
 						var vault = search_planet_features(cur_star.p_upgrades[t], P_features.Arsenal)
						var gene_vault;                       
                        if (array_length(vault) > 0 ){
                        	gene_vault = cur_star.p_upgrades[t][arsenal_search[0]];
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
                        var star_planet = $"{cur_star.name}{scr_roman(t)}";

                        if (popup=1){scr_event_log("",$"{inquis_string} discovers your Secret Lair on {star_planet}.");}
                        else if (popup=2) or (popup=0.2) {scr_event_log("red",$"{inquis_string} discovers your Secret Lair on {star_planet}.", cur_star);}
                        else if (popup=3) or (popup=0.3) {scr_event_log("",$"{inquis_string} discovers your Secret Arsenal on {star_planet}.", cur_star);}
                        else if (popup=4) or (popup=0.4) {scr_event_log("red",$"{inquis_string} discovers your Secret Arsenal on {star_planet}.", cur_star);}
                        else if (popup>=5) or (popup=0.6) {scr_event_log("",$"{inquis_string} discovers your Secret Gene-Vault on {star_planet}.", cur_star);}
                        
                        var pop_tit,pop_txt,pop_spe;
                        pop_tit="";pop_txt="";pop_spe="";
                        if (popup=1){
                            pop_tit="Inquisition Discovers Lair";
                            pop_txt=$"{inquis_string} has discovered your Secret Lair on {star_planet}.  A quick inspection revealed that there was no contraband or heresy, though the Inquisition does not appreciate your secrecy at all.";
                        }
                        else if (popup=2){
                            pop_tit="Inquisition Discovers Lair";
                            pop_txt=$"{inquis_string} has discovered your Secret Lair on {star_planet}.  A quick inspection turned up heresy, most foul, and it has all been reported to the Inquisition.  They are seething, as a whole, and relations are damaged.";
                        }
                        else if (popup=3){
                            pop_tit="Inquisition Discovers Arsenal";
                            pop_txt=$"{inquis_string} has discovered your Secret Arsenal on {star_planet}.  A quick inspection revealed that there was no contraband or heresy, though the Inquisition does not appreciate your secrecy at all.";
                        }
                        else if (popup=4){
                            pop_tit="Inquisition Discovers Arsenal";
                            pop_txt=$"{inquis_string} has discovered your Secret Arsenal on {star_planet}.  A quick inspection turned up heresy, most foul, and it has all been reported to the Inquisition.  Relations have been heavily damaged.";
                        }
                        else if (popup=5){
                            pop_tit="Inquisition Discovers Arsenal";
                            pop_txt=$"{inquis_string} has discovered your Secret Gene-Vault on {star_planet} and reported it.  The Inquisition does NOT appreciate your secrecy, nor the fact that you were able to mass produce Gene-Seed unknowest to the Imperium.  Relations are damaged.";
                        }
                        else if (popup=6){
                            pop_tit="Inquisition Discovers Arsenal";
                            pop_txt=$"{inquis_string} has discovered your Secret Gene-Vault on {star_planet} and reported it.  You were warned once already to not sneak about with Gene-Seed stores and Test-Slave incubators.  Do not let it happen again or your Chapter will be branded heretics.";
                        }
                        
                        if ((dem*10)+(cha*3)>=10){
                            pop_txt+="The Inquisitor responsible for the inspection also demands that you hand over all heretical materials and Artifacts.";
                            pop_spe="contraband";instance_create(x,y,obj_temp_arti);
                        }
                        
                        if (popup>=1) then scr_popup(pop_tit,pop_txt,"inquisition",pop_spe);
                        
                    }
                }
            }else if (string_count("investigate",trade_goods)==0){
                inquisition_inspection_logic();
            }
            // End Test-Slave Incubator Crap
            
            if (obj_controller.known[eFACTION.Inquisition]=1){obj_controller.known[eFACTION.Inquisition]=3;}
            if (obj_controller.known[eFACTION.Inquisition]=2){obj_controller.known[eFACTION.Inquisition]=4;}
            
            orbiting=instance_nearest(x,y,obj_star);

            // 135;
            if (obj_controller.loyalty_hidden<=0){// obj_controller.alarm[7]=1;global.defeat=2;
                var moo=false;
                if (obj_controller.penitent=1) and (moo=false){
                    obj_controller.alarm[8]=1;
                    moo=true;
                }
                if (obj_controller.penitent=0) and (moo=false) then scr_audience(4,"loyalty_zero",0,"",0,0);
            }
            
            exit_star=distance_removed_star(x,y, choose(2,3,4));
            action_x=exit_star.x;
            action_y=exit_star.y;
            orbiting=exit_star;
            alarm[4]=1;
            trade_goods="|DELETE|";
            exit;
        }
    }
    
    if (owner=eFACTION.Tau){
        if (instance_exists(obj_p_fleet)) and (obj_controller.known[eFACTION.Tau]==0){
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
            var capitals_engaged=0;
            with (orbiting){
            	for (var i=1;i<planets;i++){
            		if (capitals_engaged=capital_number) then break;
            		if (p_type[i]!="Dead"){
            			p_tyranids[4]=5;
            			capitals_engaged+=1;
            		}
            	}
            }
        }
        
        

        var n=false;
        with (orbiting){
        	n = is_dead_star();
        }
        
        if (n){
            var xx,yy,good, plin, plin2;
            xx=0;yy=0;good=0;plin=0;plin2=0;
            
            if (capital_number>5) then n=5;
            
            instance_deactivate_object(orbiting);
            
            repeat(100){
                if (good!=5){
                    xx=self.x+random_range(-300,300);
                    yy=self.y+random_range(-300,300);
                    if (good=0) then plin=instance_nearest(xx,yy,obj_star);
                    if (good=1) and (n=5) then plin2=instance_nearest(xx,yy,obj_star);
                    
                    good = !array_contains(plin.p_type, "dead");

                    if (good=1) and (n=5){
                        if (!instance_exists(plin2)) then exit;
                        if (!array_contains(plin.p_type, "dead")) then good++
                        
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
                        break;
                    }
                    
                    
                    if (good=1) and (instance_exists(plin)){action_x=plin.x;action_y=plin.y;alarm[4]=1;if (n!=5) then good=5;}
                }
            }
            instance_activate_object(obj_star);
        }
    }
    
    if (owner=eFACTION.Ork) and (action="") and (instance_exists(orbiting)){// Should fix orks converging on useless planets
        var maxp,bad,i,hides,hide;maxp=0;bad=0;i=0;hides=1;hide=0;
        
        bad = is_dead_star(orbiting);
        
        if (bad){
            hides+=choose(0,1,2,3);
            
            repeat(hides){
                instance_deactivate_object(instance_nearest(x,y,obj_star));
            }
            
            with(obj_star){
            	if ((planets=1) and (p_type[1]="Dead")) or (owner=eFACTION.Ork) then instance_deactivate_object(id);
            }
            var nex=instance_nearest(x,y,obj_star);
            action_x=nex.x;
            action_y=nex.y;
            set_fleet_movement();

            instance_activate_object(obj_star);
            exit;
        }
    }
}


if (action="move") and (action_eta>5000){
    var woop = instance_nearest(x,y,obj_star);
    if (woop.storm=0) then action_eta-=10000;
}

if (action="move") and (action_eta<5000){
    if (instance_nearest(action_x,action_y,obj_star).storm>0) then exit;
    if (action_x+action_y=0) then exit;
    
    var dos=0;
    dos=point_distance(x,y,action_x,action_y);
    orbiting=dos/action_eta;
    dir=point_direction(x,y,action_x,action_y);
    
    x=x+lengthdir_x(orbiting,dir);
    y=y+lengthdir_y(orbiting,dir);
    
    action_eta-=1;
    
    /*if (owner>5){
        
    }*/
    
    if (action_eta==2) and (owner=eFACTION.Inquisition) {
    	inquisitor_ship_approaches();
    }else if (action_eta==0) {
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
                    
                    sta.dispo[r]=min(obj_ini.imperium_disposition,obj_controller.disposition[2])+choose(-1,-2,-3,-4,0,1,2,3,4);
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
        
        
        
        
        
        
        if (navy==0){
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
                if ((trade_goods!="return") and (target!=noone) and ((target.action!="") or (point_distance(x,y,target.x,target.y)>30))) and (obj_ini.fleet_type!=1) and (navy=0){
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
                    orbiting=instance_nearest(x,y,obj_star);
                    instance_deactivate_object(orbiting);
                }
                
                repeat(5){
                    orbiting=instance_nearest(x,y,obj_star);
                    if (orbiting.owner = eFACTION.Eldar) then instance_deactivate_object(orbiting);
                }
                
                orbiting=instance_nearest(x,y,obj_star);
                action_x=orbiting.x;
                action_y=orbiting.y;
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
        else if (owner= eFACTION.Mechanicus){x=action_x;y=action_y-32;}
        else if (owner= eFACTION.Inquisition){
            x=action_x;
            y=action_y-32;
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
        if (string_count("Inqis",trade_goods)>0) and (string_count("fleet",trade_goods)>0) and (string_count("_her",trade_goods)=0) {
            inquisition_fleet_inspection_chase();
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
        
        if (owner=eFACTION.Chaos) and (trade_goods="csm") or (trade_goods="Khorne_warband") then mergus=0;
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
                var  tau_influence;
                var tau_influence_chance=irandom(100)+1;
                var tau_influence_planet=irandom(stue.planets)+1;
                
                with (stue){
                    if (p_type[tau_influence_planet]!="Dead"){
                    
                        scr_alert("green","owner",$"Tau ship broadcasts subversive messages to {planet_numeral_name(tau_influence_planet)}.",sta.x,sta.y);
                        tau_influence = p_influence[tau_influence_planet][eFACTION.Tau]
                    
                        if (tau_influence_chance<=70) and (tau_influence<70){
                        	adjust_influence[tau_influence_planet](eFACTION.Tau, 10, tau_influence_planet);
                            if (p_type[tau_influence_planet]=="Forge") then adjust_influence(eFACTION.Tau, -5, tau_influence_planet);
                        }
                        
                        if (tau_influence_chance<=3) and (tau_influence<70){
                            adjust_influence(eFACTION.Tau, 30, tau_influence_planet);
                            if (p_type[tau_influence_planet]=="Forge") then adjust_influence(eFACTION.Tau, -25, tau_influence_planet);
                        }
                    }
                }
            } 
            
            
            
            instance_deactivate_object(stue);
            
            with(obj_star){
            	if (owner != eFACTION.Tau) then instance_deactivate_object(instance_id);
            }
            
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
        
        if (steh.x=old_x) and (steh.y=old_y) and (steh.owner=self.owner) and (steh.action="") and ((owner = eFACTION.Tau) or (owner = eFACTION.Chaos)) and (mergus=10) and (trade_goods!="csm") and (trade_goods!="Khorne_warband"){// Move somewhere new
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
