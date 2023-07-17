function scr_enemy_ai_e() {



	// Guess I'll handle all of the ship combat in here
	// This needs to keep on running in each sector until only one faction's fleet remains

	var have_fleets,battle,battle2,strength,attack;have_fleets=0;battle=0;battle2=0;strength=0;damage=0;attack=0;
	var i;i=-1;repeat(20){i+=1;attack[i]=0;strength[i]=0;damage[i]=0;}

	i=0;
	repeat(13){i+=1;
	    if (present_fleet[i]>0) then have_fleets+=1;
	}

	if (present_fleet[1]>0){// Battle1 is reserved for player battles
	    if (present_fleet[2]>0) and (obj_controller.faction_status[2]="War") then battle=1;
	    if (present_fleet[3]>0) and (obj_controller.faction_status[3]="War") then battle=1;
	    if (present_fleet[6]>0) and (obj_controller.faction_status[6]="War") then battle=1;
	    if (present_fleet[7]>0) then battle=1;
	    if (present_fleet[8]>0) and (obj_controller.faction_status[8]="War") then battle=1;
	    if (present_fleet[9]>0) then battle=1;
	    if (present_fleet[10]>0) and (obj_controller.faction_status[10]="War"){
	        var special_stop,run,s;
	        special_stop=false;run=0;s=0;
	        repeat(4){run+=1;s=0;
	            repeat(4){s+=1;
	                if (p_problem[run,s]="meeting") or (p_problem[run,s]="meeting_trap") then special_stop=true;
	            }
	        }
	        if (special_stop=false) then battle=1;
	    }
	    if (present_fleet[13]>0) then battle=1;
	}
	if (present_fleet[2]>0) and (battle2=0){
	    if (present_fleet[7]+present_fleet[8]+present_fleet[9]+present_fleet[10]+present_fleet[13]>0) then battle2=2;
	}
	if (present_fleet[3]>0) and (battle2=0){
	    if (present_fleet[7]+present_fleet[8]+present_fleet[9]+present_fleet[10]+present_fleet[13]>0) then battle2=3;
	}
	if (present_fleet[6]>0) and (battle2=0){
	    if (present_fleet[2]+present_fleet[7]+present_fleet[8]+present_fleet[9]+present_fleet[10]+present_fleet[13]>0) then battle2=6;
	}
	if (present_fleet[7]>0) and (battle2=0){
	    if (present_fleet[2]+present_fleet[8]+present_fleet[9]+present_fleet[10]+present_fleet[13]>0) then battle2=7;
	}
	if (present_fleet[8]>0) and (battle2=0){
	    if (present_fleet[2]+present_fleet[7]+present_fleet[9]+present_fleet[10]+present_fleet[13]>0) then battle2=8;
	}
	if (present_fleet[9]>0) and (battle2=0){
	    if (present_fleet[2]+present_fleet[7]+present_fleet[8]+present_fleet[10]+present_fleet[13]>0) then battle2=9;
	}
	if (present_fleet[10]>0) and (battle2=0){
	    if (present_fleet[2]+present_fleet[7]+present_fleet[9]+present_fleet[13]>0) then battle2=10;
	}
	if (present_fleet[13]>0) and (battle2=0){
	    if (present_fleet[2]+present_fleet[7]+present_fleet[8]+present_fleet[9]+present_fleet[10]>0) then battle2=13;
	}



	instance_activate_object(obj_en_fleet);
	if (battle2>0) and (battle=0){// AI only battle
	    var i,f,shiyp;i=0;f=1;shiyp=0;
    
	    repeat(10){f+=1;if (f=11) then f=13;
	        if (present_fleet[f]>0){
	            obj_controller.temp[1049]=self.id;
	            obj_controller.temp[1050]=f;
            
	            with(obj_en_fleet){
	                if (orbiting=obj_controller.temp[1049]) and (owner=obj_controller.temp[1050]){
	                    obj_controller.temp[1051]=self.escort_number+(self.frigate_number*4)+(self.capital_number*8);
	                }
	            }
            
	            strength[f]=obj_controller.temp[1051];
            
	            if (f=7) and (strength[7]>0) then strength[f]=strength[f]*0.8;
	            if (f=9) and (strength[9]>0) then strength[f]=strength[f]*1.1;
	            if (f=10) and (strength[10]>0) then strength[f]=strength[f]*1.1;
	            if (f=11) and (strength[13]>0) then strength[13]=strength[13]*2;
            
	            // if (f=10) or (f=2) then show_message("["+string(f)+"] Fleet strength: "+string(strength[f]));
            
	            with(obj_en_ship){if (x<-7000) and (y<-7000){x+=10000;y+=10000;}}
	            with(obj_en_ship){if (x<-7000) and (y<-7000){x+=10000;y+=10000;}}
	            with(obj_en_ship){if (x<-7000) and (y<-7000){x+=10000;y+=10000;}}
	            // show_message(string(name)+"] Owner: "+string(f)+", strength: "+string(strength[f]));
	        }
	    }// This grabs the "strength" from all present fleets and adds it to the temporary variable for this AI battle
    
        
	    // Determine who will attack who
	    var still_battling,rond;
	    still_battling=true;rond=0;
    
	    repeat(5){rond+=1;
	        still_battling=false;
	        if (strength[2]+strength[3]>0) and (strength[6]+strength[7]+strength[8]+strength[9]+strength[10]+strength[13]>0) then still_battling=true;
	        if (strength[6]>0) and (strength[2]+strength[7]+strength[8]+strength[9]+strength[10]+strength[13]>0) then still_battling=true;
	        if (strength[7]>0) and (strength[2]+strength[6]+strength[8]+strength[9]+strength[10]+strength[13]>0) then still_battling=true;
	        if (strength[8]>0) and (strength[2]+strength[6]+strength[7]+strength[9]+strength[10]+strength[13]>0) then still_battling=true;
	        if (strength[9]>0) and (strength[2]+strength[6]+strength[7]+strength[8]+strength[10]+strength[13]>0) then still_battling=true;
	        if (strength[10]>0) and (strength[2]+strength[6]+strength[7]+strength[8]+strength[9]+strength[13]>0) then still_battling=true;
	        if (strength[13]>0) and (strength[2]+strength[6]+strength[7]+strength[8]+strength[9]+strength[10]>0) then still_battling=true;
        
	        // show_message(string(name)+" Round "+string(rond)+": "+string(still_battling));
        
	        if (still_battling=true){
	            var who;who=0;
            
	            // Imperial Fleet Attacks
	            who=2;if (strength[who]>0){
	                if (strength[9]>0) and (attack[who]=0) then attack[who]=9;
	                if (strength[10]>0) and (attack[who]=0) then attack[who]=10;
	                if (strength[13]>0) and (attack[who]=0) then attack[who]=13;
	                if (strength[7]>0) and (attack[who]=0) then attack[who]=7;
	                if (strength[8]>0) and (attack[who]=0) then attack[who]=8;
	                if (strength[6]>0) and (attack[who]=0) then attack[who]=6;
	                damage[attack[who]]+=strength[who]/2;
                
	                // if (attack[who]=10) then show_message("Imperial Fleet damage: "+string(damage[10])+", Strength: "+string(strength[2]));
	                // show_message(string(who)+" attacking "+string(attack[who])+" for "+string(strength[who]/2));
	            }
            
	            // Eldar Fleet Attacks
	            who=6;if (strength[who]>0){i=11;
	                if (strength[13]>0) and (13!=who) then attack[who]=13;
	                if (attack[who]!=13) then repeat(9){i-=1;if (strength[i]>0) and (i!=who) then attack[who]=i;}
	                damage[attack[who]]+=strength[who]/2;
	            }
            
	            // Ork Fleet Attacks
	            who=7;if (strength[who]>0){
	                if (strength[9]>0) and (attack[who]=0) then attack[who]=9;
	                if (strength[13]>0) and (attack[who]=0) then attack[who]=13;
	                if (strength[10]>0) and (attack[who]=0) then attack[who]=10;
	                if (strength[8]>0) and (attack[who]=0) then attack[who]=8;
	                if (strength[2]>0) and (attack[who]=0) then attack[who]=2;
	                if (strength[6]>0) and (attack[who]=0) then attack[who]=6;
	                damage[attack[who]]+=strength[who]/2;
	                // show_message(string(who)+" attacking "+string(attack[who])+" for "+string(strength[who]/2));
	            }
            
	            // Tau Fleet Attacks
	            who=8;if (strength[who]>0){
	                if (strength[13]>0) and (attack[who]=0) then attack[who]=13;
	                if (strength[9]>0) and (attack[who]=0) then attack[who]=9;
	                if (strength[7]>0) and (attack[who]=0) then attack[who]=7;
	                if (strength[10]>0) and (attack[who]=0) then attack[who]=10;
	                if (strength[2]>0) and (attack[who]=0) then attack[who]=2;
	                damage[attack[who]]+=strength[who]/2;
	            }
            
	            // Tyranid Fleet Attacks
	            who=9;if (strength[who]>0){i=1;
	                if (strength[13]>0) and (13!=who) then attack[who]=13;
	                if (attack[who]!=13) then repeat(9){i+=1;if (strength[i]>0) and (i!=who) then attack[who]=i;}
	                damage[attack[who]]+=strength[who]/2;
	            }
            
	            // Chaos Fleet Attacks
	            who=10;if (strength[who]>0){
	                if (strength[9]>0) and (attack[who]=0) then attack[who]=9;
	                if (strength[13]>0) and (attack[who]=0) then attack[who]=13;
	                if (strength[2]>0) and (attack[who]=0) then attack[who]=2;
	                if (strength[6]>0) and (attack[who]=0) then attack[who]=6;
	                if (strength[7]>0) and (attack[who]=0) then attack[who]=7;
	                if (strength[8]>0) and (attack[who]=0) then attack[who]=8;
	                damage[attack[who]]+=strength[who]/2;
	                // if (attack[who]=2) then show_message("Chaos Fleet damage: "+string(damage[2])+", Strength: "+string(strength[10]));
	            }
            
	            // Necron Fleet Attacks
	            who=13;if (strength[who]>0){
	                if (strength[6]>0) and (attack[who]=0) then attack[who]=6;
	                if (strength[9]>0) and (attack[who]=0) then attack[who]=9;
	                if (strength[2]>0) and (attack[who]=0) then attack[who]=2;
	                if (strength[10]>0) and (attack[who]=0) then attack[who]=10;
	                if (strength[7]>0) and (attack[who]=0) then attack[who]=7;
	                if (strength[8]>0) and (attack[who]=0) then attack[who]=8;
	                damage[attack[who]]+=strength[who]/2;
	            }
            
	            // Attacking has been determined, work out damage
	            var i;i=1;
	            repeat(9){i+=1;
	                strength[i]-=damage[i];damage[i]=0;
	               //  if (strength[i]>0) and (present_fleet[i]>0) then show_message(string(name)+"] Fleet:"+string(i)+" surviving at "+string(strength[i])+" in round "+string(rond));
	                if (strength[i]<=0) and (present_fleet[i]>0){
	                    // show_message(string(name)+"] Fleet:"+string(i)+" beat to shit in round "+string(rond));
	                    obj_controller.temp[1049]=i;
	                    obj_controller.temp[1050]=self.id;
	                    with(obj_en_fleet){
	                        if (owner=obj_controller.temp[1049]) and (orbiting=obj_controller.temp[1050]) then instance_destroy();
	                    }
	                }
	            }
            
            
	            strength[13]-=damage[13];damage[13]=0;
	           //  if (strength[i]>0) and (present_fleet[i]>0) then show_message(string(name)+"] Fleet:"+string(i)+" surviving at "+string(strength[i])+" in round "+string(rond));
	            if (strength[13]<=0) and (present_fleet[13]>0){
	                // show_message(string(name)+"] Fleet:"+string(i)+" beat to shit in round "+string(rond));
	                obj_controller.temp[1049]=13;
	                obj_controller.temp[1050]=self.id;
	                with(obj_en_fleet){
	                    if (owner=obj_controller.temp[1049]) and (orbiting=obj_controller.temp[1050]) then instance_destroy();
	                }
	            }
            
	        }
	    }
    
	    // Those 5 battle intervals have finished
	    // Clean up the surviving fleet(s)
    
    
	    var i;i=1;
	    repeat(10){i+=1;if (i=11) then i=13;
	        if (strength[i]>0) and (present_fleet[i]>0){
	            // Get RACE[X] ORBITING[Y] and STRENGTH[z]
	            obj_controller.temp[1047]=strength[i];
	            obj_controller.temp[1048]=0;
	            obj_controller.temp[1049]=i;
	            obj_controller.temp[1050]=self.id;
            
	            with(obj_en_fleet){
	                if (owner!=obj_controller.temp[1049]) and (orbiting!=obj_controller.temp[1050]){x-=10000;y-=10000;}
	                if (owner=obj_controller.temp[1049]) and (orbiting=obj_controller.temp[1050]){
	                    obj_controller.temp[1048]+=escort_number;
	                    obj_controller.temp[1048]+=frigate_number*4;
	                    obj_controller.temp[1048]+=capital_number*8;
	                }
	            }
            
	            // show_message("Fleet "+string(owner)+" has "+string(obj_controller.temp[1048])+" strength remaining after the battle");
            
            
	            // if (i=10) and (strength[i]>0) then show_message("STR "+string(strength[10])+" < "+string(obj_controller.temp[1048])+" ?");
            
	            if (strength[i]<obj_controller.temp[1048]){// Need to remove ships if !=
	                repeat(40){
	                    if (obj_controller.temp[1047]>obj_controller.temp[1048]) then with(obj_en_fleet){
	                        if (owner=obj_controller.temp[1049]) and (orbiting=obj_controller.temp[1050]){
	                            if (escort_number>0) and (escort_number+frigate_number+capital_number!=1){
	                                escort_number-=1;obj_controller.temp[1047]-=1;
	                                // show_message("removed an escort, escorts left: "+string(escort_number));
	                                if (escort_number+frigate_number+capital_number<=0) then instance_destroy();
	                            }
	                        }
	                    }
	                }
	            }
	            if (strength[i]<obj_controller.temp[1048]){
	                repeat(20){
	                    if (obj_controller.temp[1047]<obj_controller.temp[1048]) then with(obj_en_fleet){
	                        if (owner=obj_controller.temp[1049]) and (orbiting=obj_controller.temp[1050]){
	                            if (frigate_number>0) and (escort_number+frigate_number+capital_number!=1){
	                                frigate_number-=1;obj_controller.temp[1047]-=4;
	                                // show_message("removed a frigate, frigates left: "+string(frigate_number));
	                                if (escort_number+frigate_number+capital_number<=0) then instance_destroy();
	                            }
	                        }
	                    }
	                }
	                repeat(10){
	                    if (obj_controller.temp[1047]<obj_controller.temp[1048]) then with(obj_en_fleet){
	                        if (owner=obj_controller.temp[1049]) and (orbiting=obj_controller.temp[1050]){
	                            if (capital_number>0) and (escort_number+frigate_number+capital_number!=1){
	                                capital_number-=1;obj_controller.temp[1047]-=8;
	                                // show_message("removed a capital ship, capitals left: "+string(capital_number));
	                                if (escort_number+frigate_number+capital_number<=0) then instance_destroy();
	                            }
	                        }
	                    }
	                }
	            }
            
	            strength[i]=obj_controller.temp[1047];
	            // show_message("Surviving fleet ("+string(i)+") strength: "+string(strength[i]));
	            // I'd hope that removes enough ships from the survivor
	        }
	        with(obj_en_fleet){if (x<-5000) and (y<-5000){x+=10000;y+=10000;}}
	    }
	}// End AI battle




	if (battle>0){
	    if (present_fleet[1]>0) and ((present_fleet[6]+present_fleet[7]+present_fleet[8]+present_fleet[9]+present_fleet[10]+present_fleet[13]>0) or ((present_fleet[2]>0) and (obj_controller.faction_status[2]="War"))){
	        var i,onceh;i=1;onceh=0;
        
	        repeat(9){i+=1;
	            var special_stop;special_stop=false;
            
	            if (i=10) or (i=11){var run,s;run=0;s=0;
	                repeat(4){run+=1;s=0;
	                    repeat(4){s+=1;
	                        if (p_problem[run,s]="meeting") or (p_problem[run,s]="meeting_trap") then special_stop=true;
	                    }
	                }
	            }
            
            
	            if (obj_controller.faction_status[i]="War") and (onceh=0) and (special_stop=false){// Quene battle
	                obj_turn_end.battles+=1;
	                obj_turn_end.battle[obj_turn_end.battles]=1;
	                obj_turn_end.battle_world[obj_turn_end.battles]=-50;
	                obj_turn_end.battle_opponent[obj_turn_end.battles]=i;// Who triggered it first
	                obj_turn_end.battle_location[obj_turn_end.battles]=name;
	                // obj_turn_end.battle_object[obj_turn_end.battles]=instance_nearest(x,y,obj_en_fleet);
	                obj_turn_end.battle_pobject[obj_turn_end.battles]=instance_nearest(x,y,obj_p_fleet);
                
	                if (i=10){
	                    obj_controller.temp[1049]=string(name);
	                    with(obj_temp2){instance_destroy();}
	                    with(obj_temp3){instance_destroy();}
	                    with(obj_en_fleet){
	                        if (action="") and (orbiting=obj_controller.temp[1049]) and (owner=10){
	                            if (string_count("BLOOD",trade_goods)>0) then instance_create(x,y,obj_temp2);
	                            if (string_lower(trade_goods)="csm") then instance_create(x,y,obj_temp3);
	                        }
	                    }
	                    if (instance_exists(obj_temp2)){
	                        obj_turn_end.battle_special[obj_turn_end.battles]="BLOOD";
	                        with(obj_temp2){instance_destroy();}
	                    }
	                    if (instance_exists(obj_temp3)){
	                        obj_turn_end.battle_special[obj_turn_end.battles]="CSM";
	                        with(obj_temp2){instance_destroy();}
	                    }
	                }
	                onceh=1;
	            }
	        }
	    }
	}

	instance_activate_object(obj_p_fleet);
	instance_activate_object(obj_en_fleet);


















	// 2    3   5   6   7   8   9   10  11  13



	var run,force,beetle,chaos_meeting;
	run=0;force=1;beetle=0;chaos_meeting=0;

	repeat(4){run+=1;force=1;

	    if (p_player[run]>0){
	        var spyrer,fallen,s;spyrer=0;fallen=0;s=0;
        
	        repeat(4){s+=1;
	            if (p_player[run]>0) and (p_problem[run,s]="meeting") or (p_problem[run,s]="meeting_trap"){
	                if (p_problem[run,s]="meeting") then chaos_meeting=run;
	                if (p_problem[run,s]="meeting_trap") then chaos_meeting=run+0.1;
	            }
	            if (p_player[run]>20) and (p_problem[run,s]="spyrer"){
	                var tixt;tixt="The Spyrer on "+string(name);
	                if (run=1) then tixt+=" I";if (run=2) then tixt+=" II";if (run=3) then tixt+=" III";if (run=4) then tixt+=" IV";
	                tixt+=" seems to have vanished, presumably gone into hiding.";
	                scr_popup("Spyrer Rampage",tixt,"spyrer","");
	            }
	            if (p_player[run]<=20) and (p_problem[run,s]="spyrer"){
	                obj_turn_end.battles+=1;
	                obj_turn_end.battle[obj_turn_end.battles]=1;
	                obj_turn_end.battle_world[obj_turn_end.battles]=run;
	                obj_turn_end.battle_opponent[obj_turn_end.battles]=30;
	                obj_turn_end.battle_location[obj_turn_end.battles]=name;
	                obj_turn_end.battle_object[obj_turn_end.battles]=id;
	                obj_turn_end.battle_special[obj_turn_end.battles]="spyrer";
	            }
	            if (p_player[run]>0) and (p_problem[run,s]="fallen"){
	                var chan;chan=choose(1,2,3,4);
	                if (chan<=2){
	                    obj_turn_end.battles+=1;
	                    obj_turn_end.battle[obj_turn_end.battles]=1;
	                    obj_turn_end.battle_world[obj_turn_end.battles]=run;
	                    obj_turn_end.battle_opponent[obj_turn_end.battles]=10;
	                    obj_turn_end.battle_location[obj_turn_end.battles]=name;
	                    obj_turn_end.battle_object[obj_turn_end.battles]=id;
	                    if (chan=1) then obj_turn_end.battle_special[obj_turn_end.battles]="fallen1";
	                    if (chan=2) then obj_turn_end.battle_special[obj_turn_end.battles]="fallen2";
	                }
	                if (chan>=3){
	                    if (p_problem[run,1]="fallen") then fallen=1;
	                    if (p_problem[run,2]="fallen") then fallen=2;
	                    if (p_problem[run,3]="fallen") then fallen=3;
	                    if (p_problem[run,4]="fallen") then fallen=4;
	                    p_problem[run,fallen]="";p_timer[run,fallen]=0;
	                    var tixt;tixt="Your marines have scoured "+string(name);
	                    if (run=1) then tixt+=" I";
	                    if (run=2) then tixt+=" II";
	                    if (run=3) then tixt+=" III";
	                    if (run=4) then tixt+=" IV";
	                    tixt+=" in search of the Fallen.  Despite their best efforts, and meticulous searching, none have been found.  It appears as though the information was faulty or out of date.";
	                    scr_popup("Hunt the Fallen",tixt,"fallen","");
	                    if (run=1) then scr_event_log("","Mission Successful: No Fallen located upon "+string(name)+" I.");
	                    if (run=2) then scr_event_log("","Mission Successful: No Fallen located upon "+string(name)+" II.");
	                    if (run=3) then scr_event_log("","Mission Successful: No Fallen located upon "+string(name)+" III.");
	                    if (run=4) then scr_event_log("","Mission Successful: No Fallen located upon "+string(name)+" IV.");
	                }
	            }
	        }
	    }
	    if (p_player[run]>0) and ((p_problem[run,1]="bomb") or (p_problem[run,2]="bomb") or (p_problem[run,3]="bomb") or (p_problem[run,4]="bomb")){
	        var have_bomb;have_bomb=scr_check_equip("Plasma Bomb",name,run,0);
	        if (have_bomb>0){
	            var tixt;tixt="Your marines on "+string(name);
	            if (run=1) then tixt+=" I";if (run=2) then tixt+=" II";if (run=3) then tixt+=" III";if (run=4) then tixt+=" IV";
	            tixt+=" are prepared and ready to enter the Necron Tombs.  A Plasma Bomb is in tow.";
	            scr_popup("Necron Tomb Excursion",tixt,"necron_cave","blarg|"+string(name)+"|"+string(run)+"|999|");
	        }
	    }
    
    
    
    
    
	    if (p_player[run]>0) then repeat(10-1){force+=1;beetle=0;
	        if (force=3) then force=4;// mechanicus aren't quite in yet
	        if (force=4) then force=5;
	        if (force=12) then force=13;
        
	        if (force=2){
	            if (p_player[run]>0) and (p_owner[run]=1) and (p_guardsmen[run]>0) and (obj_controller.faction_status[2]="War") then beetle=2;
	            if (p_player[run]>=10) and (p_owner[run]!=1) and (p_guardsmen[run]>0) and (obj_controller.faction_status[2]="War") then beetle=2;
	        }
	        /*if (force=3){
	            if (p_player[run]>0) and (p_owner[run]=1) and (p_guardsmen[run]>0) and (obj_controller.faction_status[2]="War") then beetle=2;
	            if (p_player[run]>=10) and (p_owner[run]!=1) and (p_guardsmen[run]>0) and (obj_controller.faction_status[2]="War") then beetle=2;
	        }*/
	        if (force=5){
	            if (p_player[run]>0) and (p_sisters[run]>0) and (obj_controller.faction_status[5]="War") then beetle=5;
	        }
	        if (force=6){
	            if (p_player[run]>0) and (p_eldar[run]>0) and (obj_controller.faction_status[6]="War") then beetle=6;
	        }
	        if (force=7) and (p_guardsmen[run]+p_pdf[run]=0){
	            if (p_player[run]>0) and (p_orks[run]>0) then beetle=7;
	        }
	        if (force=8) and (p_guardsmen[run]=0){
	            if (p_player[run]>0) and (p_tau[run]>0) then beetle=8;
	        }
	        if (force=9) and (p_guardsmen[run]+p_pdf[run]=0){
	            if (p_player[run]>0) and (p_tyranids[run]>0) then beetle=9;
	        }
	        if (force=10) and (p_guardsmen[run]+p_pdf[run]=0){
	            var pause,r;pause=0;r=0;repeat(4){r+=1;if (p_problem[run,r]="meeting") or (p_problem[run,r]="meeting_trap") then pause=1;}
	            if (p_player[run]>0) and (p_traitors[run]>0) and (pause=0) and (obj_controller.faction_status[10]="War") then beetle=10;
	        }
	        if (force=11) and (p_guardsmen[run]+p_pdf[run]=0){
	            var pause,r;pause=0;r=0;repeat(4){r+=1;if (p_problem[run,r]="meeting") or (p_problem[run,r]="meeting_trap") then pause=1;}
	            if (p_player[run]>0) and (p_chaos[run]>0) and (pause=0) and (obj_controller.faction_status[10]="War") then beetle=11;
	        }
	        if (force=13) and (p_guardsmen[run]+p_pdf[run]=0){
	            if (p_player[run]>0) and (p_necrons[run]>0) then beetle=13;
	        }
        
	        // other battle crap here
	        if (beetle>0){
	            // obj_controller.x=self.x;obj_controller.y=self.y;
	            obj_turn_end.battles+=1;
	            obj_turn_end.battle[obj_turn_end.battles]=1;
	            obj_turn_end.battle_world[obj_turn_end.battles]=run;
	            obj_turn_end.battle_opponent[obj_turn_end.battles]=beetle;
	            obj_turn_end.battle_location[obj_turn_end.battles]=name;
	            obj_turn_end.battle_object[obj_turn_end.battles]=id;
	        }
        
        
        
        
	    }
    
    
    
    
    
    
    
	    // Other planetary stuff
    
	    if (p_feature[run]!=""){
	        if (string_count("Recruiting World|",p_feature[run])>0) and (obj_controller.gene_seed=0) and (obj_controller.recruiting>0){
	            obj_controller.recruiting=0;obj_controller.income_recruiting=0;
	            scr_alert("red","recruiting","The Chapter has run out of gene-seed!",0,0);
	        }
        
	        if (string_count("Recruiting World|",p_feature[run])>0) and (obj_controller.gene_seed>0) and (p_owner[run]<=5) and (obj_controller.faction_status[p_owner[run]]!="War"){
	            if (p_population[run]>=50){
	                if (p_large[run]=0) then p_population[run]-=1;
                
	                var recr, aspirant, corr, train, dista, onceh; 
	                recr=999;aspirant=0;corr=10;train=72;dista=0;onceh=0;
                
	                if (obj_controller.recruiting=1) then recr=floor(random(300))+1; // fast, frentic, slow, ect
	                if (obj_controller.recruiting=2) then recr=floor(random(200))+1;
	                if (obj_controller.recruiting=3) then recr=floor(random(100))+1;
	                if (obj_controller.recruiting=4) then recr=floor(random(80))+1;
	                if (obj_controller.recruiting=5) then recr=floor(random(60))+1;
                
	                if (obj_controller.recruit_trial="Exposure") then recr=floor(recr*1.3);
	                if (obj_controller.recruit_trial="Challenge") then recr=floor(recr*1.3);
	                if (obj_controller.recruit_trial="Knowledge of Self") then recr=floor(recr*2);
                
	                // 135; recruiting
					// corr isn't really relevant as corruption in marines doesn't matter
	                if (p_type[run]="Agri") and (recr<=10){aspirant=1;corr=choose(1,2);}
	                if (p_type[run]="Death") and (recr<=23){aspirant=1;corr=choose(1,2);}
	                if (p_type[run]="Desert") and (recr<=15){aspirant=1;corr=choose(1,2);}
	                if (p_type[run]="Feral") and (recr<=23){aspirant=1;corr=choose(1,2);}
	                if (p_type[run]="Feudal") and (recr<=10){aspirant=1;corr=choose(1,2);}
	                if (p_type[run]="Shrine") and (recr<=10){aspirant=1;corr=choose(1,2);}
	                if (p_type[run]="Forge") and (recr<=10){aspirant=1;corr=floor(random(10))+floor(random(10))+2;}
	                if (p_type[run]="Hive") and (recr<=5){aspirant=1;corr=floor(random(10))+floor(random(10))+2;}
	                if (p_type[run]="Ice") and (recr<=5){aspirant=1;corr=choose(1,2);}
	                if (p_type[run]="Lava") and (recr<=2){aspirant=1;corr=floor(random_range(3,18))+1;}
	                if (p_type[run]="Temperate") and (recr<=10){aspirant=1;corr=choose(1,2);}
                
	                // train-=58;
	                // train-=55;
                
	                if (obj_controller.recruit_trial="Blood Duel"){
	                    corr+=choose(100,200,300);train-=choose(1,2,3);
	                    var rand5;rand5=floor(random(100))+1;
	                    if (rand5<=2) then corr+=15;
	                }
	                if (obj_controller.recruit_trial="Survival of the Fittest"){corr+=choose(1,2,3);train-=choose(1,2,3);}
	                if (obj_controller.recruit_trial="Exposure"){train-=choose(1,2,3,4);}
	                if (obj_controller.recruit_trial="Knowledge of Self"){train-=choose(7,9,11,13);}
                
	                if (aspirant!=0){
	                    var i,thiss;
	                    i=0;thiss=0;
                    
	                    repeat(300){
	                        i+=1;
	                        if (thiss=0){
	                            if (obj_controller.recruit_name[i]=""){thiss=i;}
	                        }    
	                    }
                    
	                    obj_controller.recruit_name[thiss]=scr_marine_name();
	                    obj_controller.recruit_exp[thiss]=0;
                    
	                    if (obj_controller.recruit_trial="Hunting the Hunter"){
	                        obj_controller.recruit_exp[thiss]=choose(1,2);
	                        var rand5;rand5=floor(random(100))+1;
	                        if (rand5<=1){
	                            obj_controller.recruit_exp[thiss]=choose(10,11,12);train-=5;
	                            scr_alert("green","recruitment","Recruit "+string(obj_controller.recruit_name[thiss])+" hunts a larger, more impressive beast by mistake.",0,0);
	                        }
	                    }
	                    if (obj_controller.recruit_trial="Challenge"){
	                        obj_controller.recruit_exp[thiss]=choose(2,3,4);
	                        var rand5;rand5=floor(random(100))+1;
	                        if (rand5<=1){
	                            obj_controller.recruit_exp[thiss]=choose(20,25,30);train-=5;
	                            scr_alert("green","recruitment","Recruit "+string(obj_controller.recruit_name[thiss])+" defeats the Astartes and is destined for greatness.",0,0);
	                        }
	                    }
	                    if (obj_controller.recruit_trial="Apprenticeship") then train+=36{ 
	                        obj_controller.recruit_exp[thiss]=choose(8,9,9);
	                    }
                    
                    
	                    onceh=0;
                    
                    
	                    obj_controller.recruit_corruption[thiss]=corr;
	                    obj_controller.recruit_distance[thiss]=0;
	                    obj_controller.recruit_training[thiss]=train;
	                    obj_controller.gene_seed-=1;
                    
                    
                    
                    
	                    var i;
	                    i=0;
                    
	                    repeat(5){i=0;
	                        repeat(300){i+=1;
	                            if (obj_controller.recruit_training[i]<obj_controller.recruit_training[i-1]) and (obj_controller.recruit_name[i]!=""){
	                                // Get old
	                                obj_controller.recruit_name[500]=obj_controller.recruit_name[i-1];
	                                obj_controller.recruit_exp[500]=obj_controller.recruit_exp[i-1];
	                                obj_controller.recruit_corruption[500]=obj_controller.recruit_corruption[i-1];
	                                obj_controller.recruit_distance[500]=obj_controller.recruit_distance[i-1];
	                                obj_controller.recruit_training[500]=obj_controller.recruit_training[i-1];
	                                // Plug in new
	                                obj_controller.recruit_name[i-1]=obj_controller.recruit_name[i];
	                                obj_controller.recruit_exp[i-1]=obj_controller.recruit_exp[i];
	                                obj_controller.recruit_corruption[i-1]=obj_controller.recruit_corruption[i];
	                                obj_controller.recruit_distance[i-1]=obj_controller.recruit_distance[i];
	                                obj_controller.recruit_training[i-1]=obj_controller.recruit_training[i];
	                                // Plug in old
	                                obj_controller.recruit_name[i]=obj_controller.recruit_name[500];
	                                obj_controller.recruit_exp[i]=obj_controller.recruit_exp[500];
	                                obj_controller.recruit_corruption[i]=obj_controller.recruit_corruption[500];
	                                obj_controller.recruit_distance[i]=obj_controller.recruit_distance[500];
	                                obj_controller.recruit_training[i]=obj_controller.recruit_training[500];
	                            }
	                        }
	                    }
	                    // End sorting
	                }
	                // End aspirant!=0
	            }// End pop>50
	        }// End recruiting possible
	    }// End p_feature!=""
    
    
	    // Work on fortifications
	    if (p_owner[run]=1){
	        if (string_count("Monastery",p_feature[run])>0){
	            var md,ms,ml,build_rate,build_rate2;
	            md=225;ms=300;ml=32;build_rate=4;build_rate2=6;
            
	            if (string_count("Siege Masters",obj_ini.strin)>0){md=300;ms=400;ml=48;build_rate2=5;}
	            if (string_count("Crafters",obj_ini.strin)>0) or (string_count("Crafters",obj_ini.strin)>0){build_rate=3;
	                if (choose(0,1)=1){if (p_silo[run]<ms) then p_silo[run]+=1;if (p_defenses[run]<md) then p_defenses[run]+=1;}
	            }
	            if (p_silo[run]<ms) then p_silo[run]+=1;if (p_defenses[run]<md) then p_defenses[run]+=1;
            
	            if ((obj_controller.turn/build_rate)=round(obj_controller.turn/build_rate)) and (p_lasers[run]>ml) then p_lasers[run]+=1;
	            if ((obj_controller.turn/build_rate2)=round(obj_controller.turn/build_rate2)) and (p_fortified[run]<5) then p_fortified[run]+=1;
	        }
	    }
    
    
	    // Work on upgrades
	    if (p_upgrades[run]!=""){
	        var type,finished;type="";finished=false;
	        if (string_count(".1|",p_upgrades[run])>0){p_upgrades[run]=string_replace(p_upgrades[run],".1|",".0|");finished=true;}
	        if (string_count(".2|",p_upgrades[run])>0) then p_upgrades[run]=string_replace(p_upgrades[run],".2|",".1|");
	        if (string_count(".3|",p_upgrades[run])>0) then p_upgrades[run]=string_replace(p_upgrades[run],".3|",".2|");
	        if (finished=true){
	            if (string_count("Lair",p_upgrades[run])>0){type="Lair";obj_controller.und_lairs+=1;}
	            if (string_count("Arsenal",p_upgrades[run])>0){type="Arsenal";obj_controller.und_armories+=1;}
	            if (string_count("Gene",p_upgrades[run])>0){type="Gene-Vault";obj_controller.und_gene_vaults+=1;}
	            var tx;tx="Hidden "+string(type)+" on "+string(name)+" "+scr_roman(run)+" has been completed.";
	            scr_alert("green","owner",string(tx),x,y);scr_event_log("",string(tx));
	        }
	    }
    
    
    
	    if (p_population[run]<0) then p_population[run]=0;
    
	}



	if (chaos_meeting>0){
	    // Run through forces and determine what all is there
    
	    instance_create(0,0,obj_temp_meeting);
    
    
	    var i,co,ii,otm,good,master_present;ii=0;i=0;co=-1;good=0;master_present=0;
	    repeat(11){co+=1;i=0;
	        repeat(200){i+=1;good=0;
	            if (obj_ini.role[co,i]!="") and (obj_ini.loc[co,i]=name) and (obj_ini.wid[co,i]==floor(chaos_meeting)) then good+=1;
	            if (obj_ini.role[co,i]!=obj_ini.role[100,6]) and (obj_ini.role[co,i]!="Venerable "+string(obj_ini.role[100,6])) then good+=1;
	            if (string_count("Dread",obj_ini.armor[co,i])=0) or (obj_ini.role[co,i]="Chapter Master") then good+=1;
            
	            if (good=3){
	                obj_temp_meeting.dudes+=1;otm=obj_temp_meeting.dudes;
	                obj_temp_meeting.present[otm]=1;obj_temp_meeting.co[otm]=co;obj_temp_meeting.ide[otm]=i;
	                if (obj_ini.role[co,i]="Chapter Master") then master_present=1;
	            }
	        }
	    }
    
	    // title / text / image / speshul
	    if (master_present=1) and (otm<=21){
	        var effect;effect="meeting_1t";
	        if (chaos_meeting==floor(chaos_meeting)) then effect="meeting_1";
	        scr_popup("Chaos Meeting","A cloaked, ragged figure approaches your forces and hails you.  He is to bring you to meet with their master and you have few enough forces to be permitted.  What is thy will?","chaos_messenger",effect);
	    }
	    if (master_present=1) and (otm>21){
	        scr_popup("Chaos Meeting","A cloaked, ragged figure approaches your forces and hails you.  He is to bring you to their master, but before the meeting proceeds, you must bring fewer forces.  Only yourself and up to two squads will be allowed in the presence of "+string(obj_controller.faction_title[10])+" "+string(obj_controller.faction_leader[10])+".","chaos_messenger","meeting_2");
	        with(obj_temp_meeting){instance_destroy();}
	    }
	    if (master_present=0) and (otm>21){
	        scr_popup("Chaos Meeting","A cloaked, ragged figure approaches your forces and hails them.  The meeting was supposed to be with the Chaos Lord, and yourself, but you are not planet-side.  Land on the planet with up to two squads and the meeting will proceed.","chaos_messenger","meeting_3");
	        with(obj_temp_meeting){instance_destroy();}
	    }
    
	    // show_message(string(otm));
	}


}
