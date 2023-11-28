
if (hide=true) then exit;

if (cooldown>=0) and (cooldown<=40) then cooldown-=1;
if (instance_exists(obj_controller)){if (obj_controller.zoomed=1) then with(obj_controller){scr_zoom();}}


if keyboard_check_pressed(ord("1")) and (cooldown<=0) then press=1;
if keyboard_check_pressed(ord("2")) and (cooldown<=0) then press=2;
if keyboard_check_pressed(ord("3")) and (cooldown<=0) then press=3;
if (press=1) and (option1="") then press=0;
if (press=2) and (option2="") then press=0;
if (press=3) and (option3="") then press=0;
if (press!=0) and (cooldown>0){press=0;exit;}

if (type!=6) and (master_crafted=1) then master_crafted=0;

if (type=9.1) and (obj_controller.stc_wargear_un+obj_controller.stc_vehicles_un+obj_controller.stc_ships_un<=0){
    obj_controller.cooldown=10;instance_destroy();exit;
}



if (image="fuklaw") and (save>0){
    if (press=1){
        var del;del=obj_saveload.save[self.save];
        if (file_exists("save"+string(del)+".ini")){
            file_delete("save"+string(del)+".ini");
            if (file_exists("save"+string(del)+"log.ini")){file_delete("save"+string(del)+"log.ini");}
            if (file_exists("screen"+string(del)+".png")){file_delete("screen"+string(del)+".png");}
            with(obj_saveload){instance_destroy();}
            var news;news=instance_create(0,0,obj_saveload);
            news.menu=woopwoopwoop;news.top=owner;news.alarm[4]=1;
            
            instance_destroy();
        }
    }
    if (press=2){instance_destroy();}
    exit;
}



if (room_get_name(room)="Main_Menu") and (title="Tutorial"){
    if (press=2){// 1: yes, 2: no (without disabling)
        obj_main_menu_buttons.fading=1;
        obj_main_menu_buttons.crap=3;
        obj_main_menu_buttons.cooldown=9999;
        instance_destroy();
    }
    if (press=3){ini_open("saves.ini");ini_write_real("Data","tutorial",1);ini_close();}
    
    if (press>=2){
        obj_main_menu_buttons.fading=1;
        obj_main_menu_buttons.crap=self.press;
        obj_main_menu_buttons.cooldown=9999;
        instance_destroy();
    }
    exit;
}




if (image="debug_banshee") and (cooldown<=0){
    if (planet=2){
        if (press=1) or (press=3){
            if (press=1) then amount=7;
            if (press=3) then amount=9;
            with(obj_star){
                if (choose(0,1,1)=1) and (owner != eFACTION.Eldar) and (owner!=1){
                    var fleet;
                    fleet=instance_create(x+32,y,obj_en_fleet);
                    fleet.owner=obj_popup.amount;
                    if (obj_popup.amount=7){fleet.sprite_index=spr_fleet_ork;fleet.capital_number=3;present_fleet[7]+=1;}
                    if (obj_popup.amount=9){
                        if (present_fleet[1]=0) then vision=0;
                        fleet.sprite_index=spr_fleet_tyranid;fleet.capital_number=3;fleet.frigate_number=6;fleet.escort_number=16;present_fleet[9]+=1;
                    }
                    fleet.image_index=4;
                    fleet.orbiting=id;
                }
            }
            instance_destroy();
        }
        if (press=2){
            with(obj_star){
                if (choose(0,1,1)=1) and (owner != eFACTION.Eldar) and (owner!=1){
                    var h;h=0;repeat(4){h+=1;if (p_type[h]!="Dead") and (p_type[h]!=""){p_traitors[h]=5;p_chaos[h]=4;}}
                }
            }
            instance_destroy();
        }
    }
    if (planet=5){
        if (press=1){
            var fleet,tar;tar=instance_nearest(x,y,obj_star);
            fleet=instance_create(tar.x+32,tar.y-0,obj_en_fleet);
            fleet.owner = eFACTION.Ork;fleet.sprite_index=spr_fleet_ork;
            fleet.capital_number=2;fleet.frigate_number=5;
            tar.present_fleet[7]+=1;fleet.image_index=4;
            fleet.orbiting=id;instance_destroy();
        }
        if (press=2){
            var fleet,tar;tar=instance_nearest(x,y,obj_star);
            fleet=instance_create(tar.x-24,tar.y-24,obj_en_fleet);
            fleet.owner = eFACTION.Tau;fleet.sprite_index=spr_fleet_tau;
            fleet.capital_number=2;fleet.frigate_number=5;
            tar.present_fleet[8]+=1;fleet.image_index=4;
            fleet.orbiting=id;instance_destroy();
        }
        if (press=3) then instance_destroy();
    }
    if (planet=3){
        if (press=1){
            var fleet,tar;tar=instance_nearest(x,y,obj_star);
            fleet=instance_create(tar.x+0,tar.y-24,obj_en_fleet);
            fleet.owner = eFACTION.Imperium;fleet.sprite_index=spr_fleet_imperial;
            fleet.capital_number=2;fleet.frigate_number=5;
            tar.present_fleet[2]+=1;fleet.image_index=4;
            fleet.orbiting=id;
            instance_destroy();
        }
        if (press=2){
            var fleet,tar;tar=instance_nearest(x,y,obj_star);
            fleet=instance_create(tar.x-32,tar.y-0,obj_en_fleet);
            fleet.owner = eFACTION.Chaos;fleet.sprite_index=spr_fleet_chaos;
            fleet.capital_number=2;fleet.frigate_number=5;
            tar.present_fleet[10]+=1;fleet.image_index=4;
            fleet.orbiting=id;
            instance_destroy();
        }
        if (press=3){planet=5;cooldown=30;text="Ork, Tau, Cancel?";option1="Ork";option2="Tau";option3="Cancel";press=0;exit;}
    }
    if (planet=1){
        if (press=1){planet=2;cooldown=30;text="Select a faction";option1="Orks";option2="Chaos";option3="Tyranids";press=0;exit;}
        if (press=2){planet=3;cooldown=30;text="Imperium, Heretic, or Xeno?";option1="Imperium";option2="Heretic";option3="Xeno";press=0;exit;}
        if (press=3){
            var flit1,flit2,onceh;onceh=0;
            flit1=instance_nearest(x,y,obj_p_fleet);
            flit2=instance_nearest(x,y,obj_en_fleet);
            
            if (instance_exists(flit1)) and (instance_exists(flit2)){
                if (point_distance(x,y,flit1.x,flit1.y)>point_distance(x,y,flit2.x,flit2.y)) then with(flit2){instance_destroy();}
                else with(flit1){instance_destroy();}
                onceh=1;
            }
            if (onceh=0) and (!instance_exists(flit1)) and (instance_exists(flit2)){if (point_distance(x,y,flit2.x,flit2.y)<=40) then with(flit2){instance_destroy();}onceh=1;}
            if (onceh=0) and (instance_exists(flit1)) and (!instance_exists(flit2)){if (point_distance(x,y,flit1.x,flit1.y)<=40) then with(flit1){instance_destroy();}onceh=1;}
            
            instance_destroy();
        }
    }
    exit;
}







if ((title="Inquisition Mission") or (title="Inquisition Recon")) and (title!="Artifact Located") and (obj_controller.demanding=1) then demand=1;



if (image="chaos_messenger") and (title="Chaos Meeting"){
    if (mission="meeting_1") or (mission="meeting_1t"){
        if (option1=""){
            option1="Die, heretic!";option2="Very well.  Lead the way.";
            option3="I must take care of an urgent matter first.  (Exit)";
            exit;
        }
        if (option1!=""){
            if (press=1){
                with(obj_star){var i,r;i=0;r=0;
                    repeat(4){i+=1;r=0;repeat(4){r+=1;if (p_problem[i,r]="meeting") or (p_problem[i,r]="meeting_trap"){p_problem[i,r]="";p_timer[i,r]=-1;}}}
                }
                obj_controller.disposition[10]-=10;
                text="The heretic is killed in a most violent fashion.  With a lack of go-between the meeting cannot proceed.";
                option1="";option2="";option3="";mission="";// image="";
                if (obj_controller.blood_debt=1){obj_controller.penitent_current+=1;obj_controller.penitent_turn=0;obj_controller.penitent_turnly=0;}
                with(obj_temp_meeting){instance_destroy();}
                cooldown=20;exit;
            }
            if (press=2) and (mission="meeting_1"){
                obj_controller.complex_event=true;obj_controller.current_eventing="chaos_meeting_1";
                text="You signal your readiness to the heretic.  Nearly twenty minutes of following the man passes before you all enter an ordinary-looking structure.  Down, within the basement, you then pass into the entrance of a tunnel.  As the trek downward continues more and more heretics appear- cultists, renegades that appear to be from the local garrison, and occasionally even the fallen of your kind.  Overall the heretics seem well supplied and equip.  This observation is interrupted as your group enters into a larger chamber, revealing a network of tunnels and what appears to be ancient catacombs.  Bones of the ancient dead, the forgotten, litter the walls and floor.  And the chamber seems to open up wider, and wider, until you find yourself within a hall.  Within this hall, waiting for you, are several dozen Chaos Terminators, a Greater Daemon of Tzeentch and Slaanesh, and Chaos Lord "+string(obj_controller.faction_leader[eFACTION.Chaos])+".";
                option1="";option2="";option3="";mission="cslord1";image="";img=0;image_wid=0;size=3;
                cooldown=20;exit;
            }
            if (press=2) and (mission="meeting_1t"){
                with(obj_star){var i,r;i=0;r=0;
                    repeat(4){i+=1;r=0;repeat(4){r+=1;if (p_problem[i,r]="meeting") or (p_problem[i,r]="meeting_trap"){p_problem[i,r]="";p_timer[i,r]=-1;}}}
                }
                obj_controller.complex_event=true;obj_controller.current_eventing="chaos_trap";
                text="You signal your readiness to the heretic.  Nearly twenty minutes of following the man passes before you all enter an ordinary-looking structure.  Down, within the basement, you then pass into the entrance of a tunnel.  As the trek downward continues more and more heretics appear- cultists, renegades that appear to be from the local garrison, and occasionally even the fallen of your kind.  Overall the heretics seem well supplied and equip.  This observation is interrupted as your group enters into a larger chamber, revealing a network of tunnels and what appears to be ancient catacombs.  Bones of the ancient dead, the forgotten, litter the walls and floor.  And the chamber seems to open up wider, and wider, until you find yourself within a hall.  Within this hall, waiting for you, are several dozen Chaos Terminators, a handful of Helbrute, and many more Chaos Space Marines.  The Chaos Lord is nowhere to be seen.  It is a trap.";
                option1="";option2="";option3="";mission="cslord1t";image="";img=0;image_wid=0;size=3;
                cooldown=20;exit;
            }
            if (press=3) and (instance_exists(obj_turn_end)){
                if (number!=0) then obj_turn_end.alarm[1]=4;
                with(obj_temp_meeting){instance_destroy();}
                instance_destroy();
            }
        }
    }
}


if (title="Scheduled Event"){
    if (option1=""){option1="Yes!";option2="No.";exit;}
    
    if (press=1) and (!instance_exists(obj_event)){
        instance_create(0,0,obj_event);
        if (obj_controller.fest_planet=0) then obj_controller.fest_attend=scr_event_dudes(1,0,"",obj_controller.fest_sid);
        if (obj_controller.fest_planet=1) then scr_event_dudes(1,1,obj_controller.fest_star,obj_controller.fest_wid);
        hide=true;cooldown=6000;title="Scheduled Event:2";
        exit;
    }
    if (press=2){
        obj_controller.fest_repeats-=1;
        if (obj_controller.fest_repeats<=0){
            obj_controller.fest_scheduled=0;
            
            instance_create(0,0,obj_event);
            if (obj_controller.fest_planet=0) then obj_controller.fest_attend=scr_event_dudes(1,0,"",obj_controller.fest_sid);
            if (obj_controller.fest_planet=1) then scr_event_dudes(1,1,obj_controller.fest_star,obj_controller.fest_wid);
            
            with(obj_event){
                var ide;ide=0;
                repeat(700){ide+=1;
                    if (attend_corrupted[ide]=0) and (attend_id[ide]>0){
                        if (string_count("Chaos",obj_ini.artifact_tags[obj_controller.fest_display])>0){
                            obj_ini.chaos[attend_co[ide],attend_id[ide]]+=choose(1,2,3,4);
                        }
                        if (string_count("Daem",obj_ini.artifact_tags[obj_controller.fest_display])>0){
                            obj_ini.chaos[attend_co[ide],attend_id[ide]]+=choose(6,7,8,9);
                        }
                        attend_corrupted[ide]=1;
                    }
                }
            }
            with(obj_event){instance_destroy();}
            
            var p1,p2,p3;
            p1=obj_controller.fest_type;p3="";
            p2=obj_controller.fest_planet;
            
            if (p2>0) then p3=string(obj_controller.fest_star)+" "+scr_roman(obj_controller.fest_wid);
            if (p2<=0) then p3=+" the vessel '"+string(obj_ini.ship[obj_controller.fest_sid])+"'";
            
            scr_alert("green","event",string(p1)+" on "+string(p3)+" ends.",0,0);
            scr_event_log("green",string(p1)+" on "+string(p3)+" ends.");
        }
        obj_controller.cooldown=10;if (number!=0) then obj_turn_end.alarm[1]=4;instance_destroy();
    }
}
if (title="Scheduled Event:2") then exit;


if (image="inquisition") and (loc="contraband"){
    demand=0;
    option1="Hand over all Chaos and Daemonic Artifacts";
    option2="Over your dead body";
    
    if (press=1){
        var e,ca,ia;e=0;ca=0;ia=0;
        repeat(obj_controller.artifacts){e+=1;
            if (string_count("aemon",obj_ini.artifact_tags[e])>0) or (string_count("haos",obj_ini.artifact_tags[e])>0){
                obj_ini.artifact[e]="";obj_ini.artifact_tags[e]="";obj_ini.artifact_identified[e]=0;obj_ini.artifact_condition[e]=100;
                obj_ini.artifact_loc[e]="";obj_ini.artifact_sid[e]=0;obj_controller.artifacts-=1;
                if (obj_controller.menu_artifact>obj_controller.artifacts) then obj_controller.menu_artifact=obj_controller.artifacts;
                obj_ini.artifact[e]=obj_ini.artifact[e+1];obj_ini.artifact_tags[e]=obj_ini.artifact_tags[e+1];
                obj_ini.artifact_identified[e]=obj_ini.artifact_identified[e+1];obj_ini.artifact_condition[e]=obj_ini.artifact_condition[e+1];
                obj_ini.artifact_loc[e]=obj_ini.artifact_loc[e+1];obj_ini.artifact_sid[e]=obj_ini.artifact_sid[e+1];
            }
        }
        
        var noom1,noom2;noom1=0;noom2=0;
        noom1=instance_nearest(obj_temp_arti.x,obj_temp_arti.y,obj_star);noom2=noom1.name;
        repeat(4400){
            if (ca<=10) and (ca>=0){
                ia+=1;if (ia=400){ca+=1;ia=1;if (ca=11) then ca=-5;}
                if (ca>=0) and (ca<11){
                    if (string(obj_ini.loc[ca,ia])=noom2){
                        // show_message(string(obj_ini.loc[ca,ia])+" is at the right location");
                        // show_message("wep1: "+string(obj_ini.wep1[ca,ia])+", wep2: "+string(obj_ini.wep2[ca,ia]));
                        if (string_count("aemon",obj_ini.wep1[ca,ia])>0) or (string_count("haos",obj_ini.wep1[ca,ia])>0) then obj_ini.wep1[ca,ia]="";
                        if (string_count("aemon",obj_ini.wep2[ca,ia])>0) or (string_count("haos",obj_ini.wep2[ca,ia])>0) then obj_ini.wep2[ca,ia]="";
                        if (string_count("aemon",obj_ini.armour[ca,ia])>0) or (string_count("haos",obj_ini.armour[ca,ia])>0) then obj_ini.armour[ca,ia]="";
                        if (string_count("aemon",obj_ini.mobi[ca,ia])>0) or (string_count("haos",obj_ini.mobi[ca,ia])>0) then obj_ini.mobi[ca,ia]="";
                        if (string_count("aemon",obj_ini.gear[ca,ia])>0) or (string_count("haos",obj_ini.gear[ca,ia])>0) then obj_ini.gear[ca,ia]="";
                    }
                }
            }
        }
    }
    
    if (press=1){obj_controller.cooldown=10;option1="";option2="";loc="";text="All Chaos and Daemonic Artifacts present have been handed over to the Inquisitor.  They remain seething, but your destruction has been stalled.  Or so you imagine.";exit;}
    if (press=2){obj_controller.cooldown=10;if (number!=0) then obj_turn_end.alarm[1]=4;instance_destroy();}
}




if (title="Planetary Governor Assassinated") and (option1!="") and (cooldown<=0){
    if (new_target=0) and (instance_exists(obj_temp6)){
        new_target=instance_nearest(obj_temp6.x,obj_temp6.y,obj_star);
        with(obj_temp6){instance_destroy();}
    }
    
    if (press>0){
        var randa,randa2;randa=floor(random(100))+1;randa2=floor(random(100))+1;
        if (string_count("Shitty",obj_ini.strin2)>0) then randa-=20;
    }
    
    if (press=1){
        new_target.dispo[planet]=min(obj_ini.imperium_disposition,obj_controller.disposition[2])+choose(-1,-2,-3,-4,0,1,2,3,4);
        if (randa<=3) then new_target.dispo[planet]=min(new_target.dispo[planet],choose(1,2,3,4,5,6)*3);
        if (randa>=95) then new_target.dispo[planet]=max(new_target.dispo[planet],60+choose(1,2,3,4,5,6)*3);
        scr_event_log("","Planetary Governor of "+string(new_target.name)+" "+scr_roman(planet)+" assassinated.  The next in line takes over.");
        text="The next in line for rule of "+string(new_target.name)+" "+scr_roman(planet)+" has taken over their rightful position of Planetary Governor.";
        option1="";option2="";option3="";
        with(obj_temp4){instance_destroy();}
        cooldown=30;exit;
    }
    if (press=2){
        new_target.dispo[planet]=70+floor(random_range(5,15))+1;
        scr_event_log("","Planetary Governor of "+string(new_target.name)+" "+scr_roman(planet)+" assassinated.  A more suitable Governor is installed.");
        if (randa2<=(10*estimate)){
            var v=0,ev=0;
            repeat(99){v+=1;if (ev=0) and (obj_controller.event[v]="") then ev=v;}
            obj_controller.event[ev]="governor_assassination_1|"+string(new_target.name)+"|"+string(planet)+"|";
            obj_controller.event_duration[ev]=((choose(1,2,3,4,5,6)+choose(1,2,3,4,5,6))*6)+choose(-3,-2,-1,0,1,2,3);
        }
        text="Many of the successors for "+string(new_target.name)+" "+scr_roman(planet)+" are removed or otherwise made indisposed.  Your chapter ensures that the new Planetary Governor is sympathetic to your plight and more than willing to heed your advice.  A powerful new ally may be in the making.";
        option1="";option2="";option3="";
        with(obj_temp4){instance_destroy();}
        cooldown=30;exit;
    }
    if (press=3){
        new_target.dispo[planet]=101;
        scr_event_log("","Planetary Governor of "+string(new_target.name)+" "+scr_roman(planet)+" assassinated.  One of your Chapter Serfs take their position.");
        if (randa2<=(25*estimate)){
            var v=0,ev=0;
            repeat(99){v+=1;if (ev=0) and (obj_controller.event[v]="") then ev=v;}
            obj_controller.event[ev]="governor_assassination_2|"+string(new_target.name)+"|"+string(planet)+"|";
            obj_controller.event_duration[ev]=(choose(1,2)*6)+choose(-3,-2,-1,0,1,2,3);
        }
        text="All of the successors for "+string(new_target.name)+" "+scr_roman(planet)+" are removed or otherwise made indisposed.  Paperwork is slightly altered.  Rather than any sort of offical one of your Chapter Serfs is installed as the Planetary Governor.  The planet is effectively under your control.";
        if (new_target.p_first[planet]!=3) then new_target.p_owner[planet]=1;
        option1="";option2="";option3="";
        with(obj_temp4){instance_destroy();}
        cooldown=30;exit;
    }
}
/*
var he;he=instance_create(argument0.x,argument0.y,obj_temp6);
var pip;pip=instance_create(0,0,obj_popup);
pip.title="Planetary Governor Assassinated";
pip.text=txt;

pip.option1="Allow the official successor to become Planetary Governor.";
pip.option2="Ensure that a sympathetic successor will be the one to rule.";
pip.option3="Remove all successors and install a loyal Chapter Serf.";

// Result-  this is the multiplier for the chance of discovery with the inquisition, can also be used to determine
// the new Governor disposition if they are the official successor
if (aroll<=chance){// Discovered
    pip.estimate=2;
}
if (aroll>chance){// Success
    pip.estimate=1;
}
*/



if (image="ruins_fort"){
    if (press=1) and (obj_controller.requisition>=1000){
        obj_controller.requisition-=1000;
        text="Resources have been spent on the planet to restore the fortress.  The planet's defense rating has increased to 5 (";
        option1="";option2="";option3="";
        var obj;obj=obj_temp4.obj;
        text+=string(obj.p_fortified[obj_temp4.num])+"+";
        text+=string(5-obj.p_fortified[obj_temp4.num])+")";
        obj.p_fortified[obj_temp4.num]=max(obj.p_fortified[obj_temp4.num],5);
        with(obj_temp4){instance_destroy();}
        cooldown=15;exit;
    }
    if (press=2){
        var req;req=floor(random_range(200,500))+1;
        image="";text="Much of the fortress is demolished in order to salvage adamantium and raw materials.  The opration has yielded "+string(req)+" requisition.";
        option1="";option2="";option3="";
        obj_controller.requisition+=req;
        with(obj_temp4){instance_destroy();}
        cooldown=15;exit;
    }
    
    /*
    if (loot="fortress"){// Fortress
    var gene,pop;gene=floor(random_range(20,40))+1;pop=instance_create(0,0,obj_popup);
    pop.image="ruins_fort";pop.title="Ancient Ruins: Fortress";
    pop.text="Your battle brothers have found a massive, ancient fortress that has fallen into disrepair.  Gun batteries rusted, and walls covered in moss and undergrowth, it is a pale shadow of its former glory.  It is possible to repair the structure.  What is thy will?";
    pop.option1="Repair the fortress to boost planet defenses.  (1000 Req)";
    pop.option2="Salvage raw materials from the fortress.";
    }
    */
}

if (image="mechanicus") and (title="Mechanicus Mission") or (title="Mechanicus Mission Accepted"){
    if (option1="")and (title="Mechanicus Mission"){option1="Accept";option2="Refuse";exit;}
    
    if (press=1) and (option1!=""){
    
        if (string_count("tomb",mission)>0){
            with(obj_temp5){instance_destroy();}
            with(obj_star){if (name=obj_popup.loc) then instance_create(x,y,obj_temp5);}
            if (instance_exists(obj_temp5)){
                var tempy,eh,eh2,that,that2;tempy=instance_nearest(obj_temp5.x,obj_temp5.y,obj_star);eh=0;that=0;eh2=0;that2=0;
                repeat(4){
						eh+=1;
						var tomb_list =  search_planet_features(tempy.p_feature[eh], P_features.Necron_Tomb);
						if (tempy.p_owner[eh]<=5) and (array_length(tomb_list)>0){
							for (var tomb = 0;tomb<array_length(tomb_list);tomb++){
								if (tempy.p_feature[eh][tomb].awake == 0){
									that = eh
								}
							if (that !=0){break;}
						}
					}
				}
                
                with(obj_temp5){instance_destroy();}
                if (eh>0){
                    repeat(4){eh2+=1;if (tempy.p_problem[that,eh2]="") and (that2=0) then that2=eh2;}
                    if (that2>0){
                        tempy.p_problem[that,that2]="mech_tomb1";
                        text="The Adeptus Mechanicus await your forces at "+string(tempy.name)+" "+scr_roman(that)+".  They are expecting at least two squads of Astartes and have placed the testing on hold until their arrival.  You have 16 months to arrive.";
                        scr_event_log("","Mechanicus Mission Accepted: At least two squads of marines are expected at "+string(tempy.name)+" "+scr_roman(that)+" within 16 months."); 
                        instance_create(tempy.x+16,tempy.y-24,obj_star_event);
                        tempy.p_timer[that,that2]=17;
                        title="Mechanicus Mission Accepted";
                        option1="";option2="";cooldown=15;exit;
                    }
                }
            }
        }
    
    
        if (string_count("raider",mission)>0) or (string_count("bionics",mission)>0) or (string_count("mech_mars",mission)>0){
            with(obj_temp5){instance_destroy();}
            with(obj_star){if (name=obj_popup.loc) then instance_create(x,y,obj_temp5);}
            if (instance_exists(obj_temp5)){
                var tempy,eh,eh2,that,that2;tempy=instance_nearest(obj_temp5.x,obj_temp5.y,obj_star);eh=0;that=0;eh2=0;that2=0;
                repeat(4){eh+=1;if (tempy.p_owner[eh]=3) and (tempy.p_type[eh]="Forge") then that=eh;}
                
                with(obj_temp5){instance_destroy();}
                if (eh>0){
                    repeat(4){eh2+=1;if (tempy.p_problem[that,eh2]="") and (that2=0) then that2=eh2;}
                    if (that2>0){
                        if (string_count("raider",mission)>0){
                            tempy.p_problem[that,that2]="mech_raider!0!";
                            text="The Adeptus Mechanicus await your forces at "+string(tempy.name)+" "+scr_roman(that)+".  They are expecting six "+string(obj_ini.role[100][16])+"s and a Land Raider.";
                            scr_event_log("","Mechanicus Mission Accepted: Six of your "+string(obj_ini.role[100][16])+"s and a Land Raider are to be stationed at "+string(tempy.name)+" "+scr_roman(that)+" for 24 months."); 
                        }
                        if (string_count("bionics",mission)>0){
                            tempy.p_problem[that,that2]="mech_bionics!0!";
                            text="The Adeptus Mechanicus await your forces at "+string(tempy.name)+" "+scr_roman(that)+".  They are expecting ten Astartes with bionics.";
                            scr_event_log("","Mechanicus Mission Accepted: Ten Astartes with bionics are to be stationed at "+string(tempy.name)+" "+scr_roman(that)+" for 24 months for testing purposes."); 
                        }
                        if (string_count("mars",mission)>0){
                            tempy.p_problem[that,that2]="mech_mars";
                            text="The Adeptus Mechanicus await your "+string(obj_ini.role[100][16])+"s at "+string(tempy.name)+" "+scr_roman(that)+".  They are willing to hold on the voyage for up to 12 months.";
                            scr_event_log("","Mechanicus Mission Accepted: "+string(obj_ini.role[100][16])+"s are expected at "+string(tempy.name)+" "+scr_roman(that)+" within 12 months, for the voyage to Mars."); 
                        }
                        instance_create(tempy.x+16,tempy.y-24,obj_star_event);
                        tempy.p_timer[that,that2]=49;if (string_count("mars",mission)>0) then tempy.p_timer[that,that2]=13;
                        title="Mechanicus Mission Accepted";
                        option1="";option2="";cooldown=15;exit;
                    }
                }
            }
        }
        // Other missions here
    }
    if (press=2) and (option2!=""){obj_controller.cooldown=10;if (number!=0) then obj_turn_end.alarm[1]=4;instance_destroy();}    
}


if (image="geneseed_lab"){
    if (press=1){
        image="";text=string(estimate)+" gene-seed has been added to the chapter vaults.";
        option1="";option2="";option3="";
        obj_controller.gene_seed+=estimate;
        with(obj_temp4){instance_destroy();}
        cooldown=15;exit;
    }
    if (press=2){
        var req;req=floor(random_range(200,500))+1;
        image="";text="Technological components have been salvaged, granting "+string(req)+" requisition.";
        option1="";option2="";option3="";
        obj_controller.requisition+=req;
        with(obj_temp4){instance_destroy();}
        cooldown=15;exit;
    }
    if (press=3){
        with(obj_temp4){instance_destroy();}
        obj_controller.cooldown=15;cooldown=15;
        instance_destroy();exit;
    }
}


if (image="ancient_ruins") and (woopwoopwoop=2){
    instance_deactivate_all(true);
    instance_activate_object(obj_controller);
    instance_activate_object(obj_ini);
    instance_activate_object(obj_controller.current_planet_feature.battle);
	var _star = obj_controller.current_planet_feature.star;
	var _planet = obj_controller.current_planet_feature.planet;
    
    instance_create(0,0,obj_ncombat);
    
    instance_activate_object(_star);
	obj_ncombat.man_size_limit = obj_controller.current_planet_feature.man_size_limit;
   // with(obj_star){if (name!=obj_temp4.loc) then instance_deactivate_object(id);}
    
    //that_one=instance_nearest(0,0,obj_star);
   // instance_activate_object(obj_star);
    scr_battle_roster(_star.name ,_planet,true);
    obj_controller.cooldown=10;
    obj_ncombat.battle_object=_star;instance_deactivate_object(obj_star);
    obj_ncombat.battle_loc=_star.name;
    obj_ncombat.battle_id=_planet;
    obj_ncombat.battle_special="ruins";if (obj_temp4.ruins_race=6) then obj_ncombat.battle_special="ruins_eldar";
    obj_ncombat.dropping=0;obj_ncombat.attacking=0;
    obj_ncombat.enemy=obj_temp4.ruins_battle;
    obj_ncombat.threat=obj_temp4.battle_threat;
    obj_ncombat.formation_set=1;
    
    instance_destroy();exit;
}

if (image="ancient_ruins") and (option1!=""){
    if (press=1){// Begin
		var _ruins = obj_controller.current_planet_feature;
        var ruins_battle,ruins_fact,ruins_disp,ruins_reward,dice,battle_threat;
        ruins_battle=0;ruins_fact=0;ruins_disp=0;ruins_reward=0;battle_threat=0;
        
        _ruins.determine_race()
        
        dice=floor(random(100))+1;
        if (string_count("Shitty",obj_ini.strin2)=0) and (dice<=50) then ruins_battle=1;
        if (string_count("Shitty",obj_ini.strin2)>0) and (dice<=66) then ruins_battle=1;
        
        // ruins_battle=1;
        
        if (ruins_battle=1){
            dice=floor(random(100))+1;
            if (string_count("Shitty",obj_ini.strin2)>0) then dice+=10;
            
            battle_threat=4;
            if (dice>0) and (dice<=60) then battle_threat=1;
            if (dice>60) and (dice<=90) then battle_threat=2;
            if (dice>90) and (dice<=99) then battle_threat=3;
            
            if (_ruins.ruins_race=1) or (_ruins.ruins_race=2) or (_ruins.ruins_race=10) then ruins_battle=choose(10,10,10,10,11,11,12);
            if (_ruins.ruins_race=5) then ruins_battle=10;
            if (_ruins.ruins_race=6) then ruins_battle=choose(6,6,10,10,10,12);
            
            obj_temp4.ruins_race=_ruins.ruins_race;
            obj_temp4.ruins_battle=ruins_battle;
            obj_temp4.battle_threat=battle_threat;
            
            option1="";option2="";option3="";
            text="Your marines descended into the ancient ruins, mapping them out as they go.  They quickly determine the ruins were once ";
            if (_ruins.ruins_race=1) then text+="a Space Marine fortification from earlier times.";
            if (_ruins.ruins_race=2) then text+="golden-age Imperial ruins, lost to time.";
            if (_ruins.ruins_race=5) then text+="a magnificent temple of the Imperial Cult.";
            if (_ruins.ruins_race=6) then text+="Eldar colonization structures from an unknown time.";
            if (_ruins.ruins_race=10) then text+="golden-age Imperial ruins, since decorated with spikes and bones."; 
			if (_ruins.failed_exploration == 1){
				text+= "You see the scarring in the walls and rouns impacts where your brothers died to clense this place of it's foul inhabitants"
			}			
            text+="  Unfortunantly, it's too late before your Battle Brothers discern the ruins are still inhabited.  Shapes begin to descend upon them from all directions, masked in the shadows.";
            
            cooldown=15;woopwoopwoop=1;exit;
        }
        if (ruins_battle=0){
            var obj;obj=obj_temp4.obj;
            instance_activate_object(obj_star);
            scr_ruins_reward(obj,obj_temp4.num,obj_controller.current_planet_feature);
            instance_destroy();exit;
        }
    }
    if (press=2){// Nothing
        obj_controller.cooldown=10;
        obj_controller.menu=1;
        // obj_controller.managing=manag;
        with(obj_controller){
            var i;i=-1;man_size=0;selecting_location="";selecting_types="";selecting_ship=0;sel_uid=0;
            repeat(501){i+=1;
                man[i]="";ide[i]=0;man_sel[i]=0;ma_lid[i]=0;ma_wid[i]=0;ma_bio[i]=0;
                ma_race[i]=0;ma_loc[i]="";ma_name[i]="";ma_role[i]="";ma_wep1[i]="";display_unit[i]={};
                ma_wep2[i]="";ma_armour[i]="";ma_health[i]=100;ma_chaos[i]=0;ma_exp[i]=0;ma_promote[i]=0;
                sh_ide[i]=0;sh_uid[i]=0;sh_name[i]="";sh_class[i]="";sh_loc[i]="";sh_hp[i]="";sh_cargo[i]=0;sh_cargo_max[i]="";
            }
            alll=0;
            if (managing<=10) and (managing!=0) then scr_company_view(managing);
            if (managing>10) or (managing=0) then scr_special_view(managing);
            cooldown=10;sel_loading=0;unload=0;alarm[6]=7;
        }
        with(obj_temp4){instance_destroy();}
        instance_destroy();exit;
    }
    if (press=3){// Return to ship, exit
        scr_return_ship(obj_temp4.loc,obj_temp4,obj_temp4.num);
        var man_size,ship_id,comp,plan,i;
        i=0;ship_id=0;man_size=0;comp=0;plan=0;
        repeat(30){i+=1;if (obj_ini.ship[i]=obj_temp4.loc) then ship_id=i;}i=0;
        obj_controller.menu=0;obj_controller.managing=0;
        obj_controller.cooldown=10;
        with(obj_temp4){instance_destroy();}
        instance_destroy();exit;
    }
}



if (image="stc"){
    if (ma_co>0) and (ma_id=0){
        if (press=1){
            obj_temp4.alarm[5]=1;
            obj_controller.cooldown=10;
            instance_destroy();
        }
        if (press=2){
            scr_return_ship(obj_temp4.loc,obj_temp4,obj_temp4.num);
            var man_size,ship_id,comp,plan,i;
            i=0;ship_id=0;man_size=0;comp=0;plan=0;
            repeat(30){i+=1;if (obj_ini.ship[i]=obj_temp4.loc) then ship_id=i;}i=0;
            obj_controller.menu=0;obj_controller.managing=0;
            obj_controller.cooldown=10;
            with(obj_temp4){instance_destroy();}
            instance_destroy();exit;
        }
        if (press=3) then exit;
    }
    if (ma_co>0) and (ma_id>0){
        if (press=1){
            obj_temp4.alarm[5]=1;
            obj_controller.cooldown=10;
            instance_destroy();
        }
        if (press=2){
            scr_return_ship(obj_temp4.loc,obj_temp4,obj_temp4.num);
            var man_size,ship_id,comp,plan,i;
            i=0;ship_id=0;man_size=0;comp=0;plan=0;
            repeat(30){i+=1;if (obj_ini.ship[i]=obj_temp4.loc) then ship_id=i;}i=0;
            obj_controller.menu=0;obj_controller.managing=0;
            obj_controller.cooldown=10;
            with(obj_temp4){instance_destroy();}
            instance_destroy();exit;
        }
        if (press=3){
            obj_temp4.alarm[6]=1;
            obj_controller.cooldown=10;
            instance_destroy();
        }
    }
    if (ma_co=0) and (ma_id>0) and (target_comp!=3){
        if (press=1){
            scr_return_ship(obj_temp4.loc,obj_temp4,obj_temp4.num);
            var man_size,ship_id,comp,plan,i;
            i=0;ship_id=0;man_size=0;comp=0;plan=0;
            repeat(30){i+=1;if (obj_ini.ship[i]=obj_temp4.loc) then ship_id=i;}i=0;
            obj_controller.menu=0;obj_controller.managing=0;
            obj_controller.cooldown=10;
            with(obj_temp4){instance_destroy();}
            instance_destroy();exit;
        }
        if (press=2){
            obj_temp4.alarm[6]=1;
            obj_controller.cooldown=10;
            instance_destroy();
        }
        if (press=3) then exit;
    }
    if (ma_id>0) and (target_comp=3){
        if (press=1){
            scr_return_ship(obj_temp4.loc,obj_temp4,obj_temp4.num);
            var man_size,ship_id,comp,plan,i;
            i=0;ship_id=0;man_size=0;comp=0;plan=0;
            repeat(30){i+=1;if (obj_ini.ship[i]=obj_temp4.loc) then ship_id=i;}i=0;
            obj_controller.menu=0;obj_controller.managing=0;
            obj_controller.cooldown=10;
            with(obj_temp4){instance_destroy();}
            instance_destroy();exit;
        }
        if (press=2) then exit;
        if (press=3) then exit;
    }
}




if (type=6){// Equipment
    if (target_comp=1) then target_role=sel1;
    if (target_comp=2) then target_role=sel2;
    if (target_comp=3) then target_role=sel3;
    if (target_comp=4) then target_role=sel4;
    if (target_comp=5) then target_role=sel5;
}

if (type=8){
    if (obj_ini.artifact[obj_controller.menu_artifact]="Power Armour") then target_role=5;
    if (obj_ini.artifact[obj_controller.menu_artifact]="Terminator Armour") then target_role=5;
    if (obj_ini.artifact[obj_controller.menu_artifact]="Artificer Armour") then target_role=5;
    if (obj_ini.artifact[obj_controller.menu_artifact]="Dreadnought") then target_role=5;
    if (obj_ini.artifact[obj_controller.menu_artifact]="Dreadnought Armour") then target_role=5;
    if (obj_ini.artifact[obj_controller.menu_artifact]="Rosarius") then target_role=5;
    if (obj_ini.artifact[obj_controller.menu_artifact]="Bionics") then target_role=5;
    if (obj_ini.artifact[obj_controller.menu_artifact]="Psychic Hood") then target_role=5;
    if (obj_ini.artifact[obj_controller.menu_artifact]="Jump Pack") then target_role=5;
    if (obj_ini.artifact[obj_controller.menu_artifact]="Servo Arms") then target_role=5;
    
    all_good=0;
    if (target_role>0) and (target_comp!=-1) and (units=1) then all_good=1;
}

if (image="gene_bad"){
    option1="Dispose of ";
    if (obj_controller.gene_seed<=30) then option1+="100% of the gene-seed.";
    if (obj_controller.gene_seed>30) and (obj_controller.gene_seed<60) then option1+="50% of all gene-seed.";
    if (obj_controller.gene_seed>=60) then option1+="33% of all gene-seed.";
    option2="Tell the apothecaries to let it be.";option3="";
}

if ((title="Inquisition Mission") or (title="Inquisition Recon")) and (option1=""){option1="Accept";option2="Refuse";}
if (title="Inquisitor Located"){option1="Destroy their vessel";option2="Hear them out";}
if (title="Necron Tomb Excursion"){option1="Begin the Mission";option2="Not Yet";}
if (title="Necron Tunnels : 1"){option1="Continue";option2="Return to the surface";}
if (title="Necron Tunnels : 2"){option1="Continue";option2="Return to the surface";}
if (title="Necron Tunnels : 3"){option1="Continue";option2="Return to the surface";}

if (title="He Built It") and (option1="") and (string_count("submerged",text)=0){
    option1="Execute the heretic";
    option2="Move him to the Penitorium";
    option3="You see no problem";
}




if (press=1) and (option1!="") or ((demand=1) and (mission!="") and (string_count("Inquisition",title)>0)) or ((demand=1) and (title="Inquisition Recon")){
    if (image="gene_bad"){
        var onceh;onceh=0;
        if (obj_controller.gene_seed<=30) and (onceh=0){obj_controller.gene_seed=0;}
        if (obj_controller.gene_seed>30) and (obj_controller.gene_seed<60) and (onceh=0){obj_controller.gene_seed=round(obj_controller.gene_seed*0.5);}
        if (obj_controller.gene_seed>=60) and (onceh=0){obj_controller.gene_seed=round(obj_controller.gene_seed*0.66);}
    }
    if (title="Inquisitor Located") or (title="Artifact Offered") or (title="Mercy Plea"){
        with(obj_en_fleet){if (trade_goods="male_her") or (trade_goods="female_her") then instance_destroy();}
        
        if (obj_controller.demanding=0) then obj_controller.disposition[4]+=1;
        if (obj_controller.demanding=1) then obj_controller.disposition[4]+=choose(0,0,1);
        
        if (title="Artifact Offered") or (title="Mercy Plea") then obj_controller.disposition[4]-=choose(0,1);
        
        title="Inquisition Mission Completed";image="exploding_ship";
        text="The Inquisitor's ship begans to bank and turn, to flee, but is immediately fired upon by your fleet.  The ship explodes, taking the Inquisitor with it.  The mission has been accomplished.";
        option1="";option2="";option3="";
        
        scr_event_log("","Inquisition Mission Completed: The radical Inquisitor has been purged.");
        
        exit;    
    }
    if (title="He Built It"){
        obj_ini.race[ma_co,ma_id]=0;obj_ini.loc[ma_co,ma_id]="";obj_ini.name[ma_co,ma_id]="";obj_ini.role[ma_co,ma_id]="";
        obj_ini.wep1[ma_co,ma_id]="";obj_ini.lid[ma_co,ma_id]=0;obj_ini.wep2[ma_co,ma_id]="";obj_ini.armour[ma_co,ma_id]="";
        obj_ini.gear[ma_co,ma_id]="";obj_ini.hp[ma_co,ma_id]=100;obj_ini.chaos[ma_co,ma_id]=0;obj_ini.experience[ma_co,ma_id]=0;
        obj_ini.mobi[ma_co,ma_id]="";obj_ini.age[ma_co,ma_id]=0;
        obj_ini.TTRPG[ma_co,ma_id]=new TTRPG_stats("chapter",ma_co,ma_id, "blank");
;
        with(obj_ini){scr_company_order(0);}
    }
    
    if (title="Necron Tomb Excursion"){
        instance_activate_all();
        var player_forces,penalty,roll;player_forces=0;penalty=0;roll=floor(random(100))+1;
        with(obj_star){if (name!=obj_popup.loc) then instance_deactivate_object(id);}
        if (!instance_exists(obj_temp8)) then instance_create(obj_star.x,obj_star.y,obj_temp8);
        player_forces=obj_star.p_player[planet];
        instance_activate_object(obj_star);cooldown=30;
        
        obj_temp8.stage+=1;
        obj_temp8.loc=loc;
        obj_temp8.wid=planet;
        
        title="Necron Tunnels : "+string(obj_temp8.stage);
        if (obj_temp8.stage=1){
            image="necron_tunnels_1";
            text="Your marines enter the massive tunnel complex, following the energy readings.  At first the walls are cramped and tiny, closing about them, but the tunnels widen at a rapid pace.";
            option1="Continue";
            option2="Return to the surface";
        }
        
        exit;
    }
    
    if (string_count("Necron Tunnels",title)>0){
        var player_forces,penalty,roll,battle;player_forces=0;penalty=0;roll=floor(random(100))+1;battle=0;
        instance_activate_all();
        with(obj_star){if (name!=obj_temp8.loc) then instance_deactivate_object(id);}
        if (!instance_exists(obj_temp8)) then instance_create(obj_star.x,obj_star.y,obj_temp8);
        player_forces=obj_star.p_player[obj_temp8.wid];
        instance_activate_object(obj_star);
        obj_temp8.popup=obj_turn_end.current_popup;
        
        // SMALL TEAM OF MARINES
        if (player_forces>6) then penalty=10;if (player_forces>10) then penalty=20;
        if (player_forces>=20) then penalty=30;if (player_forces>=40) then penalty=50;
        if (player_forces>=60) then penalty=100;roll+=penalty;
        
        // roll=30;if (string_count("3",title)>0) then roll=70;
        
        // Result
        if (roll<=60){
            obj_temp8.stage+=1;
            title="Necron Tunnels : "+string(obj_temp8.stage);
            
            if (obj_temp8.stage=2){image="necron_tunnels_2";
                text="The energy readings are much stronger, now that your marines are deep inside the tunnels.  What was once cramped is now luxuriously large, the tunnel ceiling far overhead decorated by stalactites.";
            }
            if (obj_temp8.stage=3){image="necron_tunnels_3";
                text="After several hours of descent the entrance to the Necron Tomb finally looms ahead- dancing, sickly green light shining free.  Your marine confirms that the Plasma Bomb is ready.";
            }
            if (obj_temp8.stage>=4){
                image="";title="Inquisition Mission Completed";
                text="Your marines finally enter the deepest catacombs of the Necron Tomb.  There they place the Plasma Bomb and arm it.  All around are signs of increasing Necron activity.  With half an hour set, your men escape back to the surface.  There is a brief rumble as the charge goes off, your mission a success.";
                option1="";option2="";option3="";
                
                if (obj_controller.demanding=0) then obj_controller.disposition[4]+=1;
                if (obj_controller.demanding=1) then obj_controller.disposition[4]+=choose(0,0,1);
                
                obj_controller.temp[200]=string(loc);
                with(obj_temp5){instance_destroy();}
                instance_activate_object(obj_star);
                with(obj_star){if (name!=obj_controller.temp[200]) then instance_deactivate_object(id);}
                
                
                // with(obj_star){if (name=obj_controller.temp[200]) then instance_create(x,y,obj_temp5);}
                // you=instance_nearest(obj_temp5.x,obj_temp5.y,obj_star);onceh=0;
                you=instance_nearest(0,0,obj_star);
                instance_activate_object(obj_star);
                
                var ppp;ppp=0;
                if (you.p_problem[self.planet,1]="bomb"){ppp=1;
					you.p_feature[self.planet][search_planet_features(you.p_feature[self.planet], P_features.Necron_Tomb)[0]].sealed = 1;
					you.p_problem[self.planet,1]="";you.p_timer[self.planet,1]=0;
				}
                if (you.p_problem[self.planet,2]="bomb"){ppp=2;
					you.p_feature[self.planet][search_planet_features(you.p_feature[self.planet], P_features.Necron_Tomb)[0]].sealed = 1;you.p_problem[self.planet,2]="";you.p_timer[self.planet,2]=0;}
                if (you.p_problem[self.planet,3]="bomb"){ppp=3;
					you.p_feature[self.planet][search_planet_features(you.p_feature[self.planet], P_features.Necron_Tomb)[0]].sealed = 1;you.p_problem[self.planet,3]="";you.p_timer[self.planet,3]=0;}
                if (you.p_problem[self.planet,4]="bomb"){ppp=4;
					you.p_feature[self.planet][search_planet_features(you.p_feature[self.planet], P_features.Necron_Tomb)[0]].sealed = 1;you.p_problem[self.planet,4]="";you.p_timer[self.planet,4]=0;}
                with(obj_temp5){instance_destroy();}with(obj_temp8){instance_destroy();}
                instance_activate_object(obj_star);
                
                scr_event_log("","Inquisition Mission Completed: Your Astartes have sealed the Necron Tomb on "+string(you.name)+" "+string(scr_roman(ppp))+".");
                scr_gov_disp(you.name,ppp,choose(1,2,3,4,5));
                var have_bomb;have_bomb=scr_check_equip("Plasma Bomb",self.loc,self.planet,1);
                exit;
            }
        }
        if (roll>60) and (roll<=82){// Necron Wraith attack
            battle=1;
        }
        if (roll>82) and (roll<=92){// Tomb Spyder attack
            battle=2;
        }
        if (roll>92) and (roll<=97){// Tomb Stalker
            battle=3;
        }
        if (roll>97){// Tomb World wakes up
            if (player_forces<=30) then battle=4;
            if (player_forces>30) then battle=5;
            if (player_forces>100) then battle=6;
        }
        
        if (battle>0){
            var that_one;
            instance_deactivate_all(true);
            instance_activate_object(obj_controller);
            instance_activate_object(obj_ini);
            instance_activate_object(obj_temp8);
            
            instance_create(0,0,obj_ncombat);
            scr_battle_roster(obj_temp8.loc,obj_temp8.wid,true);
            
            instance_activate_object(obj_star);
            with(obj_star){if (name!=obj_temp8.loc) then instance_deactivate_object(id);}
            
            
            that_one=instance_nearest(0,0,obj_star);
            instance_activate_object(obj_star);
            
            obj_ncombat.battle_object=that_one;instance_deactivate_object(obj_star);
            obj_ncombat.battle_loc=loc;
            obj_ncombat.battle_id=planet;
            obj_ncombat.dropping=0;
            obj_ncombat.attacking=0;
            obj_ncombat.enemy=13;
            obj_ncombat.threat=1;
            obj_ncombat.formation_set=1;
            
            if (battle=1) then obj_ncombat.battle_special="wraith_attack";
            if (battle=2) then obj_ncombat.battle_special="spyder_attack";
            if (battle=3) then obj_ncombat.battle_special="stalker_attack";
            if (battle=4) then obj_ncombat.battle_special="wake1_attack";
            if (battle=5) then obj_ncombat.battle_special="wake2_attack";
            if (battle=6) then obj_ncombat.battle_special="wake2_attack";
            
            instance_destroy();
        }
        
        
    
        exit;
    }
    
    
    
    
    

    
    if (title="Inquisition Recon"){
        with(obj_temp5){instance_destroy();}
        var you,onceh;onceh=0;
        obj_controller.temp[200]=string(loc);
        
        with(obj_star){if (name=obj_controller.temp[200]) then instance_create(x,y,obj_temp5);}
        you=instance_nearest(obj_temp5.x,obj_temp5.y,obj_star);onceh=0;
        
        if (you.p_problem[planet,1]="") and (onceh=0){you.p_problem[planet,1]="recon";you.p_timer[planet,1]=estimate;onceh=1;if (demand=1){title="Inquisition Mission Demand";text="The Inquisition demands that your Chapter demonstrate its loyalty to the Imperium of Mankind and the Emperor.  You are to land Astartes on "+string(you.name)+" "+scr_roman(1)+" to investigate the planet within "+string(estimate)+" months.";}}
        if (you.p_problem[planet,2]="") and (onceh=0){you.p_problem[planet,2]="recon";you.p_timer[planet,2]=estimate;onceh=1;if (demand=1){title="Inquisition Mission Demand";text="The Inquisition demands that your Chapter demonstrate its loyalty to the Imperium of Mankind and the Emperor.  You are to land Astartes on "+string(you.name)+" "+scr_roman(2)+" to investigate the planet within "+string(estimate)+" months.";}}
        if (you.p_problem[planet,3]="") and (onceh=0){you.p_problem[planet,3]="recon";you.p_timer[planet,3]=estimate;onceh=1;if (demand=1){title="Inquisition Mission Demand";text="The Inquisition demands that your Chapter demonstrate its loyalty to the Imperium of Mankind and the Emperor.  You are to land Astartes on "+string(you.name)+" "+scr_roman(3)+" to investigate the planet within "+string(estimate)+" months.";}}
        if (you.p_problem[planet,4]="") and (onceh=0){you.p_problem[planet,4]="recon";you.p_timer[planet,4]=estimate;onceh=1;if (demand=1){title="Inquisition Mission Demand";text="The Inquisition demands that your Chapter demonstrate its loyalty to the Imperium of Mankind and the Emperor.  You are to land Astartes on "+string(you.name)+" "+scr_roman(4)+" to investigate the planet within "+string(estimate)+" months.";}}
        if (onceh!=0){var bob;bob=instance_create(you.x+16,you.y-24,obj_star_event);bob.image_alpha=1;bob.image_speed=1;}
        
        scr_event_log("","Inquisition Mission Accepted: The Inquisition wish for Astartes to land on and investigate "+string(you.name)+" "+scr_roman(planet)+" within "+string(estimate)+" months.");
    }
    if (mission!="") and (title="Inquisition Mission"){
        with(obj_temp5){instance_destroy();}
        obj_controller.temp[200]=string(loc);
        var you, onceh;you=0;onceh=0;
        
        if (mission="purge"){with(obj_star){if (name=obj_controller.temp[200]) then instance_create(x,y,obj_temp5);}
            you=instance_nearest(obj_temp5.x,obj_temp5.y,obj_star);
            var s;s=0;repeat(4){s+=1;if (you.p_problem[planet,s]="") and (onceh=0){you.p_problem[planet,s]="purge";you.p_timer[planet,s]=estimate;onceh=s;}}
            if (onceh!=0){var bob;bob=instance_create(you.x+16,you.y-24,obj_star_event);bob.image_alpha=1;bob.image_speed=1;bob.color="green";}
            scr_event_log("","Inquisition Mission Accepted: The nobles of "+string(you.name)+" "+string(scr_roman(planet))+" must be selectively purged within "+string(estimate)+" months.");
            if (demand=1){title="Inquisition Mission Demand";text="The Inquisition demands that your Chapter demonstrate its loyalty to the Imperium of Mankind and the Emperor.  You are to selectively purge the Nobles on "+string(you.name)+" "+scr_roman(onceh)+" within "+string(estimate)+" months.";}
        }
        
        if (mission="cleanse"){with(obj_star){if (name=obj_controller.temp[200]) then instance_create(x,y,obj_temp5);}
            you=instance_nearest(obj_temp5.x,obj_temp5.y,obj_star);
            var s;s=0;repeat(4){s+=1;if (you.p_problem[planet,s]="") and (onceh=0){you.p_problem[planet,s]="cleanse";you.p_timer[planet,s]=estimate;onceh=s;}}
            if (onceh!=0){var bob;bob=instance_create(you.x+16,you.y-24,obj_star_event);bob.image_alpha=1;bob.image_speed=1;bob.color="green";}
            scr_event_log("","Inquisition Mission Accepted: The mutants beneath "+string(you.name)+" "+string(scr_roman(planet))+" must be cleansed by fire within "+string(estimate)+" months.");
            if (demand=1){title="Inquisition Mission Demand";text="The Inquisition demands that your Chapter demonstrate its loyalty to the Imperium of Mankind and the Emperor.  You are to cleanse by fire the mutants in Hive "+string(you.name)+" "+scr_roman(onceh)+" within "+string(estimate)+" months.";}
        }
        
        if (mission="inquisitor"){with(obj_star){if (name=obj_controller.temp[200]) then instance_create(x,y,obj_temp5);}
            you=instance_nearest(obj_temp5.x,obj_temp5.y,obj_star);
            var s;s=0;repeat(4){s+=1;if (you.p_problem[planet,s]="") and (onceh=0){you.p_problem[planet,s]="inquisitor"+string(planet);you.p_timer[planet,s]=estimate;onceh=s;}}
            if (onceh!=0){var bob;bob=instance_create(you.x+16,you.y-24,obj_star_event);bob.image_alpha=1;bob.image_speed=1;bob.color="green";}
            scr_event_log("","Inquisition Mission Accepted: A radical Inquisitor enroute to "+string(you.name)+" must be removed.  Estimated arrival in "+string(estimate)+" months.");
            if (demand=1){title="Inquisition Mission Demand";text="The Inquisition demands that your Chapter demonstrate its loyalty to the Imperium of Mankind and the Emperor.  A radical inquisitor is enroute to "+string(you.name)+", expected within "+string(estimate)+" months.  They are to be silenced and removed.";}
        }
        
        if (mission="spyrer"){with(obj_star){if (name=obj_controller.temp[200]) then instance_create(x,y,obj_temp5);}
            you=instance_nearest(obj_temp5.x,obj_temp5.y,obj_star);
            var s;s=0;repeat(4){s+=1;if (you.p_problem[planet,s]="") and (onceh=0){you.p_problem[planet,s]="spyrer";you.p_timer[planet,s]=estimate;onceh=s;}}
            if (onceh!=0){var bob;bob=instance_create(you.x+16,you.y-24,obj_star_event);bob.image_alpha=1;bob.image_speed=1;bob.color="green";}
            scr_event_log("","Inquisition Mission Accepted: The Spyrer on "+string(you.name)+" "+string(scr_roman(planet))+" must be killed within "+string(estimate)+" months.");
            if (demand=1){title="Inquisition Mission Demand";text="The Inquisition demands that your Chapter demonstrate its loyalty to the Imperium of Mankind and the Emperor.  An out of control Spyrer on Hive "+string(you.name)+" "+scr_roman(onceh)+" must be removed within "+string(estimate)+" months.";}
        }
        
        if (mission="artifact"){
            scr_quest(0,"artifact_loan",4,estimate);
            if (obj_ini.fleet_type=1){
                image="fortress";
                if (obj_ini.home_type="Hive") then image="fortress_hive";
                if (obj_ini.home_type="Death") then image="fortress_death";
                if (obj_ini.home_type="Ice") then image="fortress_ice";
                if (obj_ini.home_type="Lava") then image="fortress_lava";
                if (obj_ini.icon_name="dorf1") then image="fortress_dorf";
                if (obj_ini.icon_name="dorf2") then image="fortress_dorf";
                if (obj_ini.icon_name="dorf3") then image="fortress_dorf";
                scr_add_artifact("good","inquisition",0,obj_ini.home_name,2);
            }
            if (obj_ini.fleet_type!=1){
                image="artifact_given";
                scr_add_artifact("good","inquisition",0,obj_ini.ship[1],501);
            }
            
            title="New Artifact";fancy_title=0;text_center=0;
            text="The Inquisition has left an Artifact in your care, until it may be retrieved.  It has been stored ";
            if (obj_ini.fleet_type=1) then text+="within your Fortress Monastery.";
            if (obj_ini.fleet_type!=1) then text+="upon your ship '"+string(obj_ini.ship[1])+"'.";
            scr_event_log("","Inquisition Mission Accepted: The Inquisition has left an Artifact in your care.");
            
            var i,last_artifact;i=0;last_artifact=0;
            repeat(100){if (last_artifact=0){i+=1;if (obj_ini.artifact[i]="") then last_artifact=i-1;}}
            
            text+="  It is some form of "+string(obj_ini.artifact[last_artifact])+".";
            option1="";option2="";option3="";
            obj_controller.cooldown=10;exit;
        }
        
        if (mission="necron"){with(obj_star){if (name=obj_controller.temp[200]) then instance_create(x,y,obj_temp5);}
            you=instance_nearest(obj_temp5.x,obj_temp5.y,obj_star);
            var s;s=0;repeat(4){s+=1;if (you.p_problem[planet,s]="") and (onceh=0){you.p_problem[planet,s]="bomb";you.p_timer[planet,s]=estimate;onceh=s;}}
            if (onceh!=0){var bob;bob=instance_create(you.x+16,you.y-24,obj_star_event);bob.image_alpha=1;bob.image_speed=1;bob.color="green";}
            
            scr_event_log("","Inquisition Mission Accepted: You have been given a Bomb to seal the Necron Tomb on "+string(you.name)+" "+scr_roman(planet)+".");
            
            image="necron_cave";title="New Equipment";fancy_title=0;text_center=0;
            text="You have been provided with 1x Plasma Bomb in order to complete the mission.";
            
            if (demand=1){title="Inquisition Mission Demand";text="The Inquisition demands that your Chapter demonstrate its loyalty.  You have been given a Plasma Bomb to seal the Necron Tomb on "+string(you.name)+" "+scr_roman(onceh)+".  It is expected to be completed within "+string(estimate)+" months.";}
            option1="";option2="";option3="";scr_add_item("Plasma Bomb",1);obj_controller.cooldown=10;
            if (demand=1) then demand=0;
            exit;
        }
        
        if (mission="tyranid_org"){with(obj_star){if (name=obj_controller.temp[200]) then instance_create(x,y,obj_temp5);}
            you=instance_nearest(obj_temp5.x,obj_temp5.y,obj_star);
            var s;s=0;repeat(4){s+=1;if (you.p_problem[planet,s]="") and (onceh=0){you.p_problem[planet,s]="tyranid_org";you.p_timer[planet,s]=estimate;onceh=s;}}
            if (onceh!=0){var bob;bob=instance_create(you.x+16,you.y-24,obj_star_event);bob.image_alpha=1;bob.image_speed=1;bob.color="green";}
            image="webber";title="New Equipment";fancy_title=0;text_center=0;
            text="You have been provided with 4x Astartes Webbers in order to complete the mission.";
            
            
            if (demand=1){title="Inquisition Mission Demand";text="The Inquisition demands that your Chapter demonstrate its loyalty to the Imperium of Mankind and the Emperor.  You are to capture a Gaunt organism and return it, unharmed- 4x Webbers have been provided for this purpose.";}
            
            option1="";option2="";option3="";scr_add_item("Webber",4);obj_controller.cooldown=10;
            scr_event_log("","Inquisition Mission Accepted: The Inquisition wishes for the capture of a Gaunt.  "+string(you.name)+" "+string(scr_roman(planet))+" is advisable.");            
            obj_controller.useful_info+="Tyr|";
            if (demand=1) then demand=0;
            exit;
        }
        
        if (mission="ethereal"){
            with(obj_star){
                if (p_tau[1]>=4) or (p_tau[2]>=4) or (p_tau[3]>=4) or (p_tau[4]>=4){
                    var bob;bob=instance_create(x+16,y-24,obj_star_event);bob.image_alpha=1;bob.image_speed=1;bob.color="green";
                }
            }
            scr_quest(0,"ethereal_capture",4,estimate);
            obj_controller.useful_info+="Tau|";
            
            if (demand=1){title="Inquisition Mission Demand";text="The Inquisition demands that your Chapter demonstrate its loyalty to the Imperium of Mankind and the Emperor.  You are to capture the Tau Ethereal somewhere within the "+string(you.name)+" system.";}
            if (you.p_problem[planet,1]="recon") then scr_event_log("","Inquisition Mission Accepted: The Inquisition wish for you to capture the Tau Ethereal somewhere within "+string(you.name)+".");
        }
        
        with(obj_temp5){instance_destroy();}
        
        if (demand=1){demand=0;option1="";option2="";option3="";exit;}// Remove multi-choices
    }
    
    
    if (image="inquisition") and (title="Investigation Completed"){
        obj_temp7.alarm[1]=1;instance_destroy();
    }
    
    if (image="artifact"){
        if (target_comp=2){
            obj_temp4.alarm[3]=1;
        }
        if (target_comp>2) and (target_comp!=7) and (target_comp<9){
            obj_controller.menu=20;
            obj_controller.cooldown=10;
            obj_controller.diplomacy=target_comp;
            obj_controller.trading_artifact=1;
            with(obj_controller){scr_dialogue("artifact");}
            instance_destroy();
        }
        if (target_comp=7) or (target_comp>=9){
            obj_temp4.alarm[4]=1;
            obj_controller.cooldown=10;
            instance_destroy();
        }
    }
    
    if (image="artifact2"){
        obj_temp4.alarm[4]=1;
        obj_controller.cooldown=10;
        instance_destroy();
    }
    
    obj_controller.cooldown=10;
    if (obj_controller.complex_event=false){
        if (number!=0) then obj_turn_end.alarm[1]=4;instance_destroy();
    }
}

if (press=2) and (option2!=""){
    if (image="gene_bad") then scr_loyalty("Mutant Gene-Seed","+");
    
    if (mission="spyrer") then obj_controller.disposition[4]-=2;
    if (title="Inquisition Recon") then obj_controller.disposition[4]-=2;
    if (image="inquisition") and (title="Investigation Completed"){
        with(obj_temp7){instance_destroy();}instance_destroy();
    }
    
    
    
    
    if (title="Artifact Offered"){
        with(obj_en_fleet){if (trade_goods="male_her") or (trade_goods="female_her") then instance_destroy();}
        if (obj_ini.fleet_type!=1) then scr_add_artifact("random","",4,obj_ini.ship[1],501);
        if (obj_ini.fleet_type=1) then scr_add_artifact("random","",4,obj_ini.home_name,2);
        var i,last_artifact;i=0;last_artifact=0;
        repeat(100){if (last_artifact=0){i+=1;if (obj_ini.artifact[i]="") then last_artifact=i-1;}}
        option1="";option2="";option3="";
        title="Inquisition Mission Completed";
        text="Your ship sends over a boarding party, who retrieve the offered artifact- ";
        text+=" some form of "+string(obj_ini.artifact[last_artifact])+".  Once it is safely stowed away your ship is then ordered to fire.  The Inquisitor's own seems to hesitate an instant before banking away, but is quickly destroyed.";
        image="exploding_ship";
        option1="";option2="";option3="";
        scr_event_log("","Artifact recovered from radical Inquisitor.");
        scr_event_log("","Inquisition Mission Completed: The radical Inquisitor has been purged.");
        exit;
    }
    
    
    
    if (title="He Built It"){
        obj_ini.god[ma_co,ma_id]+=10;
        option1="";option2="";option3="";
    }
    
    
    
    if (title="Mercy Plea"){
        // If have any marines within the fleet on the ships
        
        var able,i;able=0;i=0;
        
        
        // Several things can happen when the ship is searched;
        // Full of demons, maybe remove a marine, fired upon and explodes
        
        exit;
        
    }
    
    if (title="Inquisitor Located"){
        var offer,gender,gender2;
        offer=choose(1,1,2,2,3);
        if (planet=1) then gender="he";if (planet=2) then gender="she";
        if (planet=1) then gender2="his";if (planet=2) then gender2="her";
        
        if (offer=1){
            title="Artifact Offered";
            text="The Inquisitor claims that this is a massive misunderstanding, and "+string(gender)+" wishes to prove "+string(gender2)+" innocence.  If you allow their ship to leave "+string(gender)+" will give you an artifact.";
            option1="Destroy their vessel";
            option2="Take the artifact and then destroy them";
            option3="Take the artifact and spare them";
            exit;
        }
        
        if (offer=2){
            title="Mercy Plea";
            text="The Inquisitor claims that "+string(gender)+" has key knowledge that would grant the Imperium vital power over the forces of Chaos.  If you allow "+string(gender2)+" ship to leave the forces of Chaos within this sector will be weakened.";
            option1="Destroy their vessel";
            option2="Search their ship";
            option3="Spare them";
            exit;
        }
        
        if (offer=3){
            var gender2;
            if (planet=1) then gender2="his";if (planet=2) then gender2="her";
            with(obj_en_fleet){
                if (trade_goods="male_her") or (trade_goods="female_her"){
                    with(obj_p_fleet){if (action!="") then instance_deactivate_object(id);}
                    with(instance_nearest(x,y,obj_p_fleet)){scr_add_corruption(true,"1d3");}
                    instance_activate_object(obj_p_fleet);
                    instance_destroy();
                }
            }
            title="Inquisition Mission Completed";image="exploding_ship";
            text="You allow communications.  As soon as the vox turns on you hear a sickly, hateful voice.  They begin to speak of the inevitable death of your marines, the fall of all that is and ever shall be, and "+string(gender2)+" Lord of Decay.  Their ship is fired upon and destroyed without hesitation.";
            option1="";option2="";option3="";
            scr_event_log("","Inquisition Mission Completed: The radical Inquisitor has been purged.");
            exit;
        }
        exit;
    }
    
    if (image="artifact"){
        if (target_comp!=7) and (target_comp<9){
            obj_temp4.alarm[4]=1;
            obj_controller.cooldown=10;
            instance_destroy();
        }
        if (target_comp>=9) or (target_comp=7){// NOPE
            scr_return_ship(obj_temp4.loc,obj_temp4,obj_temp4.num);
            var man_size,ship_id,comp,plan,i;
            i=0;ship_id=0;man_size=0;comp=0;plan=0;
            repeat(30){i+=1;if (obj_ini.ship[i]=obj_temp4.loc) then ship_id=i;}i=0;
            obj_controller.menu=0;obj_controller.managing=0;
            obj_controller.cooldown=10;
            with(obj_temp4){instance_destroy();}
            instance_destroy();exit;
        }
    }
    
    if (image="artifact2"){
            scr_return_ship(obj_temp4.loc,obj_temp4,obj_temp4.num);
            var man_size,ship_id,comp,plan,i;
            i=0;ship_id=0;man_size=0;comp=0;plan=0;
            repeat(30){i+=1;if (obj_ini.ship[i]=obj_temp4.loc) then ship_id=i;}i=0;
            obj_controller.menu=0;obj_controller.managing=0;
            obj_controller.cooldown=10;
            with(obj_temp4){instance_destroy();}
            instance_destroy();exit;
    }
    
    obj_controller.cooldown=10;
    
    if (obj_controller.complex_event=false){
        if (number!=0) then obj_turn_end.alarm[1]=4;instance_destroy();
    }
}




if (press=3) and (option3!=""){
    if (title="Artifact Offered"){
        with(obj_en_fleet){
            if (trade_goods="male_her") or (trade_goods="female_her"){
                action_x=choose(room_width*-1,room_width*2);action_y=choose(room_height*-1,room_height*2);
                alarm[4]=1;trade_goods="|DELETE|";action_spd=256;action="";
            }
        }
        if (obj_ini.fleet_type!=1) then scr_add_artifact("random","",4,obj_ini.ship[1],501);
        if (obj_ini.fleet_type=1) then scr_add_artifact("random","",4,obj_ini.home_name,2);
        var i,last_artifact;i=0;last_artifact=0;
        repeat(100){if (last_artifact=0){i+=1;if (obj_ini.artifact[i]="") then last_artifact=i-1;}}
        option1="";option2="";option3="";
        title="Inquisition Mission Completed";
        text="Your ship sends over a boarding party, who retrieve the offered artifact- ";
        text+=" some form of "+string(obj_ini.artifact[last_artifact])+".  As promised you allow the Inquisitor to leave, hoping for the best.  What's the worst that could happen?";
        image="artifact_recovered";
        option1="";option2="";option3="";
        scr_event_log("","Artifact Recovered from radical Inquisitor.");
        scr_event_log("","Inquisition Mission Completed: The radical Inquisitor has been purged.");
        
        var v=0,ev=0;
        repeat(99){v+=1;if (ev=0) and (obj_controller.event[v]="") then ev=v;}
        obj_controller.event[ev]="inquisitor_spared1";obj_controller.event_duration[ev]=floor(random_range(6,18))+1;
        
        exit;
    }
    if (title="Mercy Plea"){
        with(obj_en_fleet){
            if (trade_goods="male_her") or (trade_goods="female_her"){
                action_x=choose(room_width*-1,room_width*2);action_y=choose(room_height*-1,room_height*2);
                trade_goods="|DELETE|";alarm[4]=1;action_spd=256;action="";
            }
        }
        title="Inquisition Mission Completed";
        text="You allow the Inquisitor to leave, trusting in their words.  If they truly do have key information it is a risk you are willing to take.  What's the worst that could happen?";
        image="artifact_recovered";
        option1="";option2="";option3="";
        
        scr_event_log("","Inquisition Mission Completed?: The radical Inquisitor has been allowed to flee in order to weaken the forces of Chaos, as they promised.");
        
        var v=0,ev=0;
        repeat(99){v+=1;if (ev=0) and (obj_controller.event[v]="") then ev=v;}
        obj_controller.event[ev]="inquisitor_spared2";obj_controller.event_duration[ev]=floor(random_range(6,18))+1;
        
        exit;
    }


    if (image="artifact"){
        if (target_comp<9) and (target_comp!=7){// This returns the marines to the ship
            scr_return_ship(obj_temp4.loc,obj_temp4,obj_temp4.num);
            var man_size,ship_id,comp,plan,i;
            i=0;ship_id=0;man_size=0;comp=0;plan=0;
            repeat(30){i+=1;if (obj_ini.ship[i]=obj_temp4.loc) then ship_id=i;}i=0;
        }
        
        if (target_comp!=3) and (target_comp!=4){
            // Here, have this gift
            var plan;plan=instance_nearest(obj_temp4.x,obj_temp4.y,obj_star);
			var planet_arti = search_planet_features(plan.p_feature[obj_temp4.num], P_features.Artifact)
			if (array_length(planet_arti) >0){
				array_delete(plan.p_feature[obj_temp4.num], planet_arti[0], planet_arti[0]+1)
			}
            
            scr_return_ship(obj_temp4.loc,obj_temp4,obj_temp4.num);
            var man_size,ship_id,comp,plan,i;
            i=0;ship_id=0;man_size=0;comp=0;plan=0;
            repeat(30){i+=1;if (obj_ini.ship[i]=obj_temp4.loc) then ship_id=i;}i=0;
            obj_controller.menu=0;obj_controller.managing=0;
            obj_controller.cooldown=10;
            
            // Set disposition
            // 135
            
            obj_controller.menu=20;
            obj_controller.cooldown=10;
            obj_controller.diplomacy=target_comp;
            with(obj_controller){scr_dialogue("artifact_thanks");}
            obj_controller.force_goodbye=2;
            obj_controller.exit_all=1;
            
            // 135
            /*there should be a chance for things to go terribly wrong when you give a gift
            
            Imperium: if chaos, increase the global corruption of imperial planets a bit?
            Imperium: if daemonic, the commander goes chaos after a few turns?
            Mechanicus: if daemonic vastly increases corruption on forge worlds?
            Ecclesiarchy: if daemonic they get really pissed at you?
            Eldar: if daemonic they get really pissed at you?
            Tau: if daemonic all their worlds get big corruption boosts?*/
            
            with(obj_temp4){instance_destroy();}
            instance_destroy();exit;
        }
        
        if (target_comp=3) or (target_comp=4){// Not worth it, mang
            obj_controller.menu=0;obj_controller.managing=0;
            obj_controller.cooldown=10;
            with(obj_temp4){instance_destroy();}
            instance_destroy();
        }
    }
    
    obj_controller.cooldown=10;
    if (obj_controller.complex_event=false){
        if (number!=0) then obj_turn_end.alarm[1]=4;instance_destroy();
    }
}

/* */
/*  */
