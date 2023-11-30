function scr_enemy_ai_d() {

	if (x<-15000){x+=20000;y+=20000;}
	if (x<-15000){x+=20000;y+=20000;}
	if (x<-15000){x+=20000;y+=20000;}


	// Planetary problems here

	var i;i=0;
	repeat(4){i+=1;
	    if (p_necrons[i]>0) and (p_necrons[i]<6) then p_necrons[i]+=1;
    
	    // if (p_problem[i,0]!="") then p_timer[i,0]-=1;
	    if (p_problem[i,1]!="") then p_timer[i,1]-=1;
	    if (p_problem[i,2]!="") then p_timer[i,2]-=1;
	    if (p_problem[i,3]!="") then p_timer[i,3]-=1;
	    if (p_problem[i,4]!="") then p_timer[i,4]-=1;
    
    
	    var wob;wob=0;
	    repeat(4){wob+=1;
	        if (p_problem[i,wob]="fallen") and (storm-1>0) then p_timer[i,wob]+=1;
	    }
    
    
	    // Requesting help here
	    if ((p_halp[i]=1) or (p_halp[i]=1.1)) and (p_population[i]>0) and (p_owner[i]<6){
	        if (p_orks[i]+p_tau[i]+p_traitors[i]+p_chaos[i]+p_necrons[i]=0) and (p_tyranids[i]<4) then p_halp[i]=0;
	    }
	    if (p_halp[i]=0) and (p_population[i]>0) and (p_owner[i]<6) and (p_owner[i]!=1) and (present_fleet[1]<=0) and (p_player[i]<=0){
	        var enemy1,enemies,minimum,tx;
	        enemy1="";enemies=0;minimum=5;tx="";
        
	        if (p_guardsmen[i]+p_pdf[i]<=1000000) then minimum=4;
	        if (p_guardsmen[i]+p_pdf[i]<=500000) then minimum=3;
	        if (p_guardsmen[i]+p_pdf[i]<=200000) then minimum=2;
	        if (p_guardsmen[i]+p_pdf[i]<=1000) then minimum=1;
        
	        if (p_orks[i]>=minimum){enemy1="Ork";enemies+=1;}
	        if (p_tau[i]>=minimum){enemy1="Tau";enemies+=1;}
	        if (p_traitors[i]>=minimum){enemy1="Heretic";enemies+=1;}
	        if (p_chaos[i]>=minimum){enemy1="Chaos Space Marine";enemies+=1;}
	        if (p_necrons[i]>=minimum){enemy1="Necron";enemies+=1;}
	        if (p_tyranids[i]>=minimum) and (vision>0) and (p_tyranids[i]>3){enemy1="Tyranid";enemies+=1;}
        
	        if (enemies=1){p_halp[i]=1;tx="The Planetary Governor of "+string(name)+" "+scr_roman(i)+" requests help against "+string(enemy1)+" forces!";
	            scr_alert("green","halp",string(tx),x,y);scr_event_log("",string(tx));
	        }
	        if (enemies>1){p_halp[i]=1;tx="The Planetary Governor of "+string(name)+" "+scr_roman(i)+" requests help against numerous enemy forces!";
	            scr_alert("green","halp",string(tx),x,y);scr_event_log("",string(tx));
	        }
	    }
    
	    var wob;wob=0;
	    repeat(4){wob+=1;
	        if (p_problem[i,wob]="succession") and (p_timer[i,wob]=0){
	            var dice1,dice2,result,tixt;
	            dice1=floor(random(100))+1;
	            dice2=floor(random(100))+1;
            
	            result="";tixt="";
	            if (dice1<=(p_heresy[i]*2)) then result="chaos";
	            if (dice2<=(p_influence[i]*2)) and (result="") then result="tau";
	            if (result="") then result="imperial";
            
	            if (wob=1) then tixt="War of Succession on "+string(name)+" I has ended";
	            if (wob=2) then tixt="War of Succession on "+string(name)+" II has ended";
	            if (wob=3) then tixt="War of Succession on "+string(name)+" III has ended";
	            if (wob=4) then tixt="War of Succession on "+string(name)+" IV has ended";
            
	            if (p_owner[i]=2) and (result="chaos"){
	                tixt+=" with Chaos in control.";dispo[wob]=0;
	                p_owner[i]=10;p_pdf[i]+=p_guardsmen[i];p_guardsmen[i]=0;scr_alert("red","succession",string(tixt),x,y);
	            }
	            if (p_owner[i]=2) and (result="tau"){
	                tixt+=" with a Tau sympathizer in control.";dispo[wob]=10+choose(1,2,3,4,5,6);
	                p_owner[i]=8;p_pdf[i]+=p_guardsmen[i];p_guardsmen[i]=0;p_tau[i]=2;scr_alert("red","succession",string(tixt),x,y);
                
	            }
	            if (result="imperial"){tixt+=".";
	                scr_alert("green","succession",string(tixt),x,y);
	            }
	            p_problem[i,wob]="";delete_features(p_feature[i], P_features.Succession_War);
	            if (result="chaos") then scr_event_log("purple",tixt);
	            if (result="tau") then scr_event_log("red",tixt);
	            if (result="imperial") then scr_event_log("",tixt);
	        }
        
        
	        if (p_problem[i,wob]!=""){
	            if (string_pos("mech_",p_problem[i,wob])>0){
	                if (p_timer[i,wob]>0){
	                    if (string_count("mech_raider",p_problem[i,wob])>0){
	                        var t1,t2,check1,check2;check1=0;check2=0;
	                        explode_script(p_problem[i,wob],"!");
	                        t1=string(explode[0]);t2=real(explode[1]);
	                        check1=scr_role_count(obj_ini.role[100][16],string(name)+"|"+string(i)+"|");
	                        check2=scr_vehicle_count("Land Raider",string(name)+"|"+string(i)+"|");
	                        if (check1>=6) and (check2>=1){t2+=1;scr_alert("","mission","Mechanicus Mission on "+string(name)+" "+scr_roman(i)+" is "+string(round((t2/24)*100))+"% complete.",0,0);}
	                        p_problem[i,wob]=string(t1)+"!"+string(t2)+"!";
                        
	                        if (t2>=24){// Done
	                            scr_mission_reward("mech_raider",id,i);p_problem[i,wob]="";p_timer[i,wob]=-1;
	                        }
	                    }// End raider
	                    if (string_count("mech_bioni",p_problem[i,wob])>0){
	                        var t1,t2,check1;check1=0;
	                        explode_script(p_problem[i,wob],"!");
	                        t1=string(explode[0]);t2=real(explode[1]);
	                        check1=scr_bionics_count("star",string(name),i,"number");
	                        if (check1>=10){t2+=1;scr_alert("","mission","Mechanicus Mission on "+string(name)+" "+scr_roman(i)+" is "+string(round((t2/24)*100))+"% complete.",0,0);}
                        
	                        p_problem[i,wob]=string(t1)+"!"+string(t2)+"!";
	                        if (t2>=24){// Done
	                            scr_mission_reward("mech_bionics",id,i);p_problem[i,wob]="";p_timer[i,wob]=-1;
	                        }
	                    }// End bionics
	                    if (string_count("mech_tomb2",p_problem[i,wob])>0){
	                        var t1,t2,roll1,roll2,check1,battli;check1=0;
	                        roll1=floor(random(100))+1;roll2=0;battli=0;
	                        explode_script(p_problem[i,wob],"!");
	                        t1=string(explode[0]);t2=real(explode[1]);
                        
	                        t2+=1;
                        
	                        p_problem[i,wob]=string(t1)+"!"+string(t2)+"!";
                        
                        
	                        if (t2>0){
	                            if (roll1>=90) and (roll1<98) then battli=1;// oops
	                            if (roll1>=98) then battli=2;// very oops, much necron, wow
                            
	                            if (battli>0) and (p_player[i]>0){// Quene the battle
	                                obj_turn_end.battles+=1;
	                                obj_turn_end.battle[obj_turn_end.battles]=1;
	                                obj_turn_end.battle_world[obj_turn_end.battles]=i;
	                                obj_turn_end.battle_opponent[obj_turn_end.battles]=13;
	                                obj_turn_end.battle_location[obj_turn_end.battles]=name;
	                                obj_turn_end.battle_object[obj_turn_end.battles]=id;
	                                if (battli=1) then obj_turn_end.battle_special[obj_turn_end.battles]="study2a";
	                                if (battli=2) then obj_turn_end.battle_special[obj_turn_end.battles]="study2b";
                                
	                                if (obj_turn_end.battle_opponent[obj_turn_end.battles]=11){
	                                    if (planet_feature_bool(p_feature[i],P_features.World_Eaters)==1){
	                                        obj_turn_end.battle_special[obj_turn_end.battles]="world_eaters";
	                                    }
	                                }
	                            }
	                            if (battli>0) and (p_player[i]<=0){// XDDDDD
	                                scr_popup("Mechanicus Mission Failed","The Mechanicus Research team on planet "+string(name)+" "+scr_roman(i)+" have been killed by Necrons in the absence of your astartes.  The Mechanicus are absolutely livid, doubly so because of the promised security they did not recieve.","","");
	                                obj_controller.turns_ignored[3]+=choose(8,10,12,14,16,18,20,22,24);
	                                obj_controller.disposition[3]-=25;
	                                p_problem[i,wob]="";p_timer[i,wob]=-1;
	                            }
	                        }
                        
	                        if (t2>3) and (battli=0){// Done
	                            if (obj_ini.adv[1]="Shitty Luck") or (obj_ini.adv[2]="Shitty Luck") or (obj_ini.adv[3]="Shitty Luck") or (obj_ini.adv[4]="Shitty Luck") then roll1+=15;
                            
	                            if (roll1>40) then scr_alert("","mission","Adeptus Mechanicus research within the Necron Tomb of "+string(name)+" "+scr_roman(i)+" continues.",0,0);
                            
	                            if (roll1<=40){// Complete
	                                var reward,text;reward=choose(1,1,2);
	                                if (obj_ini.adv[1]="Tech-Brothers") or (obj_ini.adv[2]="Tech-Brothers") or (obj_ini.adv[3]="Tech-Brothers") or (obj_ini.adv[4]="Tech-Brothers") then reward=choose(1,2);
                                
	                                if (reward=1){obj_controller.requisition+=400;
	                                    text="The Mechanicus Research team on planet "+string(name)+" "+scr_roman(i)+" have completed their work without any major setbacks.  Pleased with your astartes' work, they have granted you 400 Requisition to be used as you see fit.";
	                                    scr_event_log("","Mechanicus Mission Completed: The Mechanicus research team on "+string(name)+" "+scr_roman(i)+" have completed their work.");
	                                }
	                                if (reward=2){
	                                    if (obj_ini.fleet_type=1) then scr_add_artifact("random","",0,obj_ini.home_name,2);
	                                    if (obj_ini.fleet_type!=1) then scr_add_artifact("random","",0,obj_ini.ship[1],501);
	                                    text="The Mechanicus Research team on planet "+string(name)+" "+scr_roman(i)+" have completed their work without any major setbacks.  Pleased with your astartes' work, they have granted your Chapter an artifact, to be used as you see fit.";
	                                    scr_event_log("","Mechanicus Mission Completed: The Mechanicus research team on "+string(name)+" "+scr_roman(i)+" have completed their work.");
	                                    scr_event_log("","Artifact gifted from Mechanicus.");
	                                }
                                
	                                scr_popup("Mechanicus Mission Completed",text,"mechanicus","");
                                
	                                obj_controller.disposition[3]+=1;p_problem[i,wob]="";p_timer[i,wob]=-1;
	                            }
	                        }
	                    }// End necron_tomb2
                    
                    
	                    if (p_problem[i,wob]="mech_tomb1") and (p_player[i]>=20){
	                        var check;check=scr_marine_count(id,i,20);
                        
	                        if (check>=20){
	                            p_problem[i,wob]="mech_tomb2!0!";p_timer[i,wob]=999;
	                            scr_popup("Mechanicus Research","The Mechanicus Research team on planet "+string(name)+" "+scr_roman(i)+" has taken note of your Astartes and are now prepared to begin their research.  Your marines are to stay on the planet until further notice.","necron_cave","");
	                        }
	                    }// End necron_tomb1
	                }
	                if (p_timer[i,wob]=0){
                
	                    if (string_count("mech_mars",p_problem[i,wob])>0){
	                        var techs_taken,com,ide,ship_planet;
	                        techs_taken=0;com=-1;ide=0;ship_planet="";
                        
	                        repeat(11){com+=1;ide=0;
	                            repeat(300){ide+=1;
	                                if (obj_ini.role[com][ide]=obj_ini.role[100][16]){
	                                    // Case 1: on planet
	                                    if (obj_ini.loc[com][ide]=name) and (obj_ini.wid[com][ide]=i){
	                                        p_player[i]-=scr_unit_size(obj_ini.armour[com][ide],obj_ini.role[com][ide],true);
	                                        obj_ini.loc[com][ide]="Mechanicus Vessel";obj_ini.wid[com][ide]=0;obj_ini.lid[com][ide]=0;
	                                        techs_taken+=1;
	                                    }
	                                    if (obj_ini.lid[com][ide]>0){
	                                        ship_planet=obj_ini.ship_location[obj_ini.lid[com][ide]];
	                                        if (ship_planet=name){
	                                            obj_ini.ship_carrying[obj_ini.lid[com][ide]]-=scr_unit_size(obj_ini.armour[com][ide],obj_ini.role[com][ide],true);
	                                            obj_ini.loc[com][ide]="Mechanicus Vessel";obj_ini.wid[com][ide]=0;obj_ini.lid[com][ide]=0;
	                                            techs_taken+=1;
	                                        }
	                                    }
	                                }
	                            }
	                        }
                        
                        
                        
	                        if (techs_taken=0){
	                            var tixt;tixt="Mechanicus Mission Failed: Journey to Mars Catacombs at "+string(name)+" "+scr_roman(i)+".";
	                            scr_alert("red","mission_failed",string(tixt),0,0);scr_event_log("red",tixt);
	                            obj_controller.disposition[3]-=10;
	                        }
                        
                        
	                        if (techs_taken>0){
	                            if (techs_taken>=20) then obj_controller.disposition[3]+=1;
	                            var taxt;taxt="Mechanicus Ship departs for the Mars catacombs.  Onboard are "+string(techs_taken)+" of your "+string(obj_ini.role[100][16])+"s.";
	                            scr_alert("","mission",taxt,0,0);scr_event_log("green",taxt);
	                        }
                            
	                        var flit;flit=instance_create(x,y-32,obj_en_fleet);
	                        flit.owner = eFACTION.Mechanicus;flit.sprite_index=spr_fleet_mechanicus;
	                        flit.capital_number=1;flit.image_index=0;flit.image_speed=0;
	                        flit.trade_goods="mars_spelunk1";
	                        flit.home_x=x;flit.home_y=y;
	                        flit.action_x=x+lengthdir_x(3000,obj_controller.terra_direction);
	                        flit.action_y=y+lengthdir_y(3000,obj_controller.terra_direction);
	                        flit.action="move";flit.action_eta=48;
	                    }
                    
                    
                    
	                    if (p_problem[i,wob]="mech_tomb1"){
	                        var tixt;tixt="Mechanicus Mission Failed: Necron Tomb Study at "+string(name)+" "+scr_roman(i)+".";
	                        scr_alert("red","mission_failed",string(tixt),0,0);scr_event_log("red",tixt);
	                        obj_controller.disposition[3]-=15;
	                    }
	                    if (string_count("mech_raider",p_problem[i,wob])>0){
	                        var tixt;tixt="Mechanicus Mission Failed: Land Raider testing at "+string(name)+" "+scr_roman(i)+".";
	                        scr_alert("red","mission_failed",string(tixt),0,0);scr_event_log("red",tixt);
	                        obj_controller.disposition[3]-=6;
	                    }
	                    if (string_count("mech_bioni",p_problem[i,wob])>0){
	                        var tixt;tixt="Mechanicus Mission Failed: Experiment on Astartes bionics at "+string(name)+" "+scr_roman(i)+".";
	                        scr_alert("red","mission_failed",string(tixt),0,0);scr_event_log("red",tixt);
	                        obj_controller.disposition[3]-=6;
	                    }
	                    p_problem[i,wob]="";
	                }
	            }
	        }
        
	        if (p_problem[i,wob]="recon") and (p_timer[i,wob]=0){
	            var tixt;tixt="Inquisition Mission Failed: Investigate ";
	            tixt+=string(name)+" "+scr_roman(i)+".";
	            scr_alert("red","mission_failed",string(tixt),0,0);
	            scr_event_log("red",tixt);
	            obj_controller.disposition[4]-=5;p_problem[i,wob]="";
	        }
        
	        if (p_problem[i,wob]="bomb") and (p_timer[i,wob]=0){
	            var tixt;
	            tixt="The Necron Tomb of planet ";
	            if (i=1) then tixt+=string(name)+" I";if (i=2) then tixt+=string(name)+" II";
	            if (i=3) then tixt+=string(name)+" III";if (i=4) then tixt+=string(name)+" IV";
	            tixt+=" has not been deactivated in time.  It has awakened, rank upon rank of Necrons pouring out to the planet's surface.  The Inquisition is not pleased with your failure.";
	            scr_popup("Inquisition Mission Failed",tixt,"necron_army","");
	            if (i=1) then scr_event_log("red","Inquisition Mission Failed: Bombing run failed; the Necron Tomb on "+string(name)+" I has become active.");
	            if (i=2) then scr_event_log("red","Inquisition Mission Failed: Bombing run failed; the Necron Tomb on "+string(name)+" II has become active.");
	            if (i=3) then scr_event_log("red","Inquisition Mission Failed: Bombing run failed; the Necron Tomb on "+string(name)+" III has become active.");
	            if (i=4) then scr_event_log("red","Inquisition Mission Failed: Bombing run failed; the Necron Tomb on "+string(name)+" IV has become active.");
            
	            p_problem[i,wob]="";p_timer[i,wob]=0;p_necrons[i]=4;
	            if (awake_tomb_world(p_feature[i])==0) then awaken_tomb_world(p_feature[i]);
            
	            // scr_alert("red","mission_failed",string(tixt),0,0);
	            obj_controller.disposition[4]-=8;p_problem[i,wob]="";
	        }
        
	        if (p_problem[i,wob]="great_crusade") and (p_timer[i,wob]=0){
	            var flet,cont,dir;cont=0;
	            flet=instance_nearest(x,y,obj_p_fleet);
            
	            if (flet.action="") then cont=1;
	            if (cont=1) and (point_distance(x,y,flet.x,flet.y)<40) then cont=2;
            
	            if (cont=2){
	                flet.action="crusade1";
	                dir=point_direction(room_width/2,room_height/2,x,y);
	                flet.action_x=x+lengthdir_x(2000,dir);
	                flet.action_y=y+lengthdir_y(2000,dir);
	                // flet.action_eta=floor(random(8))+12;
	                flet.action_eta=floor(random(8))+2;
	                flet.alarm[4]=1;
	                scr_alert("green","crusade","Fleet embarks upon Crusade.",x,y);
	                scr_event_log("","Fleet embarks upon Crusade.");
	            }
	            if (cont=1) or (cont=0){
	                // hit loyalty here
	                obj_controller.disposition[2]-=5;
	                obj_controller.disposition[4]-=10;
	                scr_alert("red","crusade","No ships designated for Crusade.",x,y);
	                scr_loyalty("Refusing to Crusade","+");
	                scr_event_log("red","No ships designated for Crusade.");
	                if (obj_controller.penitent=1) then obj_controller.penitent_current=0;
	            }
            
	            p_problem[i,wob]="";p_timer[i,wob]=0;// p_necrons[i]=4;
	        }
        
	        if ((p_problem[i,wob]="inquisitor1") or (p_problem[i,wob]="inquisitor2")) and (p_timer[i,wob]=6){
	            var flit, x7,y7,drr;
	            drr=random(floor(360))+1;
	            x7=x+lengthdir_x(384,drr);
	            y7=y+lengthdir_y(384,drr);
            
	            if (x7<0) or (x7>room_width) or (y7>room_height) or (y7<0){
	                drr=point_direction(x,y,room_width/2,room_height/2);
	                x7=x+lengthdir_x(384,drr);y7=y+lengthdir_y(384,drr);
	            }
            
	            // show_message("x1:"+string(x)+", y1:"+string(y)+"#x2:"+string(x7)+", y2:"+string(y7));
            
	            flit=instance_create(x7,y7,obj_en_fleet);
	            flit.owner  = eFACTION.Inquisition;flit.image_index=0;flit.sprite_index=spr_fleet_inquisition;
	            if (p_problem[i,wob]="inquisitor1") then flit.trade_goods="male_her";
	            if (p_problem[i,wob]="inquisitor2") then flit.trade_goods="female_her";
	            flit.action_x=x;flit.action_y=y;flit.alarm[4]=1;flit.action_spd=128;
	            p_problem[i,wob]="";p_timer[i,wob]=0;flit.escort_number=1;
	        }
        
	        if (p_problem[i,wob]="spyrer") and (p_timer[i,wob]=0){
	            var tixt,text;
	            tixt="The Spyrer on "+string(name)+" "+scr_roman(i)+" has been left unchecked.  In the ensuing carnage some high-ranking officials have been killed, along with several Nobles.  Panic is running amock in several parts of the hives and the Inquisition is less than pleased.";
	            text="Inquisition Mission Failed: The Spyrer on "+string(name)+" "+scr_roman(i)+" was not removed.";
	            scr_popup("Inquisition Mission Failed",tixt,"spyrer","");
	            obj_controller.disposition[4]-=3;scr_event_log("red",text);
	            p_problem[i,wob]="";
	        }
        
	        if (p_problem[i,wob]="fallen") and (p_timer[i,wob]=0){
	            var tixt;tixt="";
	            // if (string_count("Shitty",obj_ini.strin2)>0) then ran+=20;
            
	            /*if (ran<=33){// Nothing
	                tixt="Any Fallen that may have been on "+string(name)+" ";
	                if (i=1) then tixt+="I ";if (i=2) then tixt+="II ";
	                if (i=3) then tixt+="III ";if (i=4) then tixt+="IV ";
	                tixt+="have been given sufficient time to escape.  Morale within your chapter has plummeted; some of your battle brothers have become restless and speak among eachother in hushed tones.";
	                scr_popup("Hunt the Fallen Failed",tixt,"fallen","");
	            }
	            if (ran>33){// Give all marines +3d6 corruption and reduce loyalty by 20*/
	                var co,me;co=-1;me=0;
	                repeat(obj_ini.companies+1){co+=1;me=0;
	                    repeat(500){me+=1;
	                        if (obj_ini.race[co,me]=1) and (obj_ini.role[co,me]!="") then obj_ini.chaos[co,me]+=choose(1,2,3,4,5,6)+choose(1,2,3,4,5,6)+choose(1,2,3,4,5,6);
	                    }
	                }
	                tixt="Any Fallen that may have been on "+string(name)+" ";
	                if (i=1) then tixt+="I ";if (i=2) then tixt+="II ";
	                if (i=3) then tixt+="III ";if (i=4) then tixt+="IV ";
	                tixt+="have been given sufficient time to escape.  Morale within your chapter has plummeted; some of your battle brothers have become restless and speak among eachother in hushed tones.";
	                scr_popup("Hunt the Fallen Failed",tixt,"fallen","");
	                obj_controller.loyalty-=30;obj_controller.loyalty_hidden-=30;
	                p_problem[i,wob]="";
	                scr_event_log("red","Mission Failed: Any Fallen within the "+string(name)+" system have been given time to escape.");
	            // }
	        }
	    }
    
    
	    if ((p_tyranids[i]=3) or (p_tyranids[i]=4)) and (p_population[i]>0){
	        if (p_problem[i,1]!="Hive Fleet") and (p_problem[i,2]!="Hive Fleet") and (p_problem[i,3]!="Hive Fleet") and (p_problem[i,4]!="Hive Fleet"){
	            var roll, cont;
	            roll=floor(random(100))+201;
	            cont=0;
        
            
	            if (p_tyranids[i]=3) and (roll<=5) then cont=1;
	            if (p_tyranids[i]=4) and (roll<=8) then cont=1;
            
            
	            if (cont=1){
	                var firstest;
	                firstest=0;
                
	                if (p_problem[i,4]="") then firstest=4;
	                if (p_problem[i,3]="") then firstest=3;
	                if (p_problem[i,2]="") then firstest=2;
	                if (p_problem[i,1]="") then firstest=1;
                
	                p_problem[i,firstest]="Hive Fleet";
	                p_timer[i,firstest]=floor(random_range(60,120))+1;
	                p_timer[i,firstest]+=floor(random_range(80,120))+1;
	                // p_timer[i,firstest]=floor(random_range(3,6))+1;
	                // show_message("Hive Fleet Destination: "+string(name)+"#ETA: "+string(p_timer[i,firstest]));
                
                
	                var fleet, xx, yy;
	                xx=random_range(room_width*1.25,room_width*2);xx=choose(xx*-1,xx);xx=x+xx;
	                yy=random_range(room_height*1.25,room_height*2);yy=choose(yy*-1,yy);yy=y+yy;
	                fleet=instance_create(xx,yy,obj_en_fleet);
	                fleet.owner = eFACTION.Tyranids;
	                fleet.sprite_index=spr_fleet_tyranid;
	                fleet.image_speed=0;
                
	                fleet.capital_number=choose(7,8,9);
	                fleet.frigate_number=round(random_range(6,12));
	                fleet.escort_number=round(random_range(12,27));
                
	                /*fleet.capital_number=choose(5,6);
	                fleet.frigate_number=round(random_range(4,8));
	                fleet.escort_number=round(random_range(8,18));*/
                
	                fleet.image_index=floor((fleet.capital_number)+(fleet.frigate_number/2)+(fleet.escort_number/4));
	                fleet.image_alpha=0;
                
	                fleet.action_x=x;
	                fleet.action_y=y;
                
	                fleet.action_eta=p_timer[i,firstest];
	                fleet.action="move";
	            }
            
    
	        }
    
	    }

	}





	var g,h;
	g=0;h=0;
	repeat(20){
	    h+=1;
	    if (h>4){g+=1;h=1;}
	    /*if (g<5) and (i<5){if (p_problem[g,h]="Hive Fleet") and (p_timer[g,h]=0){
	        scr_alert("red","owner","Contact has been lost with "+string(name)+"!");
	        // vision=0;
	        g=50;i=50;
	    }}*/
	    if (g<5) and (i<5){if (p_problem[g,h]="Hive Fleet") and (p_timer[g,h]=3){
	        var woop;
	        woop=0;woop=scr_role_count("Chief "+string(obj_ini.role[100,17]),"");
        
	        var o,yep,yep2;o=0;yep=true;yep2=false;
	        repeat(4){o+=1;if (obj_ini.dis[o]="Psyker Intolerant") then yep=false;}
	        if (obj_controller.known[eFACTION.Tyranids]=0) and (woop!=0) and (yep!=false){
	            scr_popup("Shadow in the Warp","Chief "+string(obj_ini.role[100,17])+" "+string(obj_ini.name[0,5])+" reports a disturbance in the warp.  He claims it is like a shadow.","shadow","");
	            scr_event_log("red","Chief "+string(obj_ini.role[100,17])+" reports a disturbance in the warp.  He claims it is like a shadow.");
	        }
	        if (obj_controller.known[eFACTION.Tyranids]=0) and (woop=0) and (yep!=false){
	            var q,q2;q=0;q2=0;
	            repeat(90){
	                if (q2=0){q+=1;
	                    if (obj_ini.role[0,q]="Chapter Master"){q2=q;
	                        if (string_count("0",obj_ini.spe[0,q2])>0) then yep2=true;
	                    }
	                }
	            }
	            if (yep2=true){
	                scr_popup("Shadow in the Warp","You are distracted and bothered by a nagging sensation in the warp.  It feels as though a shadow descends upon your sector.","shadow","");
	                scr_event_log("red","You sense a disturbance in the warp.  It feels something like a massive shadow.");
	            }
	        }
        
        
        
	        g=50;i=50;obj_controller.known[eFACTION.Tyranids]=1;
	    }}
    
    
    
    
	    if (g<5) and (i<5){if (p_problem[g,h]!="") and (p_timer[g,h]=-5){
	        p_problem[g,h]="";p_timer[g,h]=-1;g=50;i=50;
	    }}
	}







	if (storm>0){storm-=1;
	    if (storm=0){
	        var tr;tr="Warp Storms over "+string(name)+" dissipate.";
	        scr_alert("green","warp",tr,x,y);scr_event_log("green",tr);
	    }
	}
	if (trader>0){trader-=1;
	    if (trader=0){
	        var tr;tr="Rogue Trader fleet departs from "+string(name)+".";
	        scr_alert("green","warp",tr,x,y);scr_event_log("green",tr);
	    }
	}


	// Colonists Colonize

	with(obj_star){if (x<-10000){x+=20000;y+=20000;}}
	with(obj_star){if (x<-10000){x+=20000;y+=20000;}}


	with(obj_temp2){instance_destroy();}
	with(obj_temp3){instance_destroy();}
	with(obj_temp4){instance_destroy();}
	with(obj_temp5){instance_destroy();}
	with(obj_temp6){instance_destroy();}
	with(obj_en_fleet){
	    if (owner = eFACTION.Imperium) and ((trade_goods="colonize") or (trade_goods="colonizeL")){
	        var tirg;tirg=instance_nearest(action_x,action_y,obj_star);
	        instance_create(tirg.x,tirg.y,obj_temp2);
	    }
	}
	with(obj_star){
	    if (instance_exists(obj_temp2)){
	        var tirg;tirg=instance_nearest(x,y,obj_temp2);
	        if (point_distance(x,y,tirg.x,tirg.y)<5){x-=20000;y-=20000;}
	    }
	    if (planets<=0){x-=20000;y-=20000;}
	}
	with(obj_temp2){instance_destroy();}

	with(obj_star){
	    var r;r=0;
	    repeat(4){r+=1;// temp6: origin hive, temp5: new hive, temp4: new planet
	        // if (p_owner[r]=2) and (p_type[r]!="Dead") and (p_type[r]!="Lava") and (p_type[r]!="Hive") and (p_type[r]!="Temperate") and (p_population[r]=0) then instance_create(x,y,obj_temp4);
	        // if (p_owner[r]=2) and (p_type[r]!="Dead") and ((p_type[r]="Hive") or (p_type[r]="Temperate")) and (p_population[r]=0) then instance_create(x,y,obj_temp5);
	        // if (p_owner[r]=3) and (p_type[r]!="Dead") and (p_type[r]="Forge") and (p_population[r]=0) then instance_create(x,y,obj_temp5);
        
	        if (p_owner[r]=2) and (p_type[r]="Hive") and (p_population[r]>0) and (p_large[r]=1) then instance_create(x,y,obj_temp6);
	    }
	}

	var r,yep;r=0;yep=0;
	repeat(4){r+=1;// temp5: new hive, temp4: new planet
	    if (planets>=r) and (space_hulk=0) and (craftworld=0){
	        if ((p_owner[r]=2) or (p_owner[r]=5)) and (p_type[r]!="Dead") and (p_type[r]!="") and (p_type[r]!="Lava") and (p_type[r]!="Hive") and (p_type[r]!="Temperate") and (p_population[r]=0) then instance_create(x,y,obj_temp4);
	        if (p_owner[r]=2) and (p_type[r]!="Dead") and (p_type[r]!="") and ((p_type[r]="Hive") or (p_type[r]="Temperate") or (p_type[r]="Shrine")) and (p_population[r]=0) then instance_create(x,y,obj_temp5);
	        if (p_owner[r]=3) and (p_type[r]!="Dead") and (p_type[r]!="") and (p_type[r]="Forge") and (p_population[r]=0) then instance_create(x,y,obj_temp5);
	        // Count player planets as HIVE PLANETS so that they are prioritized
	        if (p_owner[r]=1) and (p_type[r]!="Dead") and (p_type[r]!="") and (p_population[r]=0) and (obj_controller.faction_status[eFACTION.Imperium]!="War") then instance_create(x,y,obj_temp5);
	    }
	}

	if (instance_exists(obj_temp6)){
	    var onceh,rind;onceh=0;rind=floor(random(100))+1;
    
	    if (instance_exists(obj_temp5)) and (onceh=0) and (rind<=3){// A hive is requesting repopulation
	        var you1,you2,you3,flit;
	        you1=instance_nearest(obj_temp5.x,obj_temp5.y,obj_temp6);
	        you2=instance_nearest(obj_temp5.x,obj_temp5.y,obj_star);
	        you3=instance_nearest(obj_temp6.x,obj_temp6.y,obj_star);
	        flit=instance_create(you1.x,you1.y,obj_en_fleet);
	        flit.owner = eFACTION.Imperium;flit.sprite_index=spr_fleet_civilian;flit.image_index=3;
        
	        var l;l=0;
	        repeat(4){l+=1;
	            if (you3.p_large[l]=1) and (you3.p_type[l]="Hive") and ((flit.trade_goods="") or (flit.trade_goods="colonizeL")){
	                flit.guardsmen+=(you3.p_population[l]*0.01);
	                you3.p_population[l]=you3.p_population[l]*0.99;
	                you3.p_population[l]=floor(you3.p_population[l]*100)/100;// Round to two decimals
	                flit.trade_goods="colonizeL";
	            }
	        }     
	        flit.action_x=you2.x;flit.action_y=you2.y;flit.alarm[4]=1;onceh=1;
	    }
	    if (instance_exists(obj_temp4)) and (onceh=0) and (rind<=3){// Some other world is requesting repopulation
	        var you1,you2,you3,flit;// this was triggering
	        you1=instance_nearest(obj_temp4.x,obj_temp4.y,obj_temp6);// Origin temp
	        you2=instance_nearest(obj_temp4.x,obj_temp4.y,obj_star);// Destination star
	        you3=instance_nearest(obj_temp6.x,obj_temp6.y,obj_star);// Origin star
	        flit=instance_create(you1.x,you1.y,obj_en_fleet);
	        flit.owner = eFACTION.Imperium;flit.sprite_index=spr_fleet_civilian;flit.image_index=choose(1,2);
        
	        /*show_message("Colonist fleet created at "+string(flit.x)+","+string(flit.y));
	        obj_controller.x=flit.x;
	        obj_controller.y=flit.y;
	        instance_create(flit.x,flit.x,obj_explosion);*/
        
	        var l;l=0;
	        repeat(4){l+=1;
	            if (you3.p_large[l]=1) and (you3.p_type[l]="Hive") and ((flit.trade_goods="") or (flit.trade_goods="colonize")){
	                flit.guardsmen+=floor(((you3.p_population[l]*0.01))*10000*10000);
	                flit.trade_goods="colonize";
	            }
	        }
	        flit.action_x=you2.x;flit.action_y=you2.y;flit.alarm[4]=1;onceh=1;
	    }
	}
	with(obj_temp3){instance_destroy();}with(obj_temp4){instance_destroy();}with(obj_temp5){instance_destroy();}with(obj_temp6){instance_destroy();}

	instance_activate_all();
	with(obj_star){
	    if (x<-10000){x+=20000;y+=20000;}
	    if (x<-10000){x+=20000;y+=20000;}
	}

	// Local problems will go here


}
