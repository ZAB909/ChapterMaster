
var yeehaw1, yeehaw2, tstar;
yeehaw1=0;yeehaw2=0;tstar=0;

if (player_started=1){yeehaw1=pla_fleet;yeehaw2=ene_fleet;}

if (player_started=0) and (instance_exists(obj_turn_end)){
    yeehaw1=obj_turn_end.battle_pobject[obj_turn_end.current_battle];
}


if (instance_number(obj_en_ship)>0){
    scr_recent("fleet_defeat",star_name,(capital_lost*6)+(frigate_lost*2)+escort_lost);
}
if (instance_number(obj_en_ship)<=0){
    with(obj_p_ship){
        if (hp<=0) then scr_recent("ship_destroyed",obj_ini.ship[ship_id],ship_id);
    }
}





yeehaw1.capital_number=max(capital,0);
yeehaw1.frigate_number=max(frigate,0);
yeehaw1.escort_number=max(escort,0);
yeehaw1.alarm[6]=1;// Check for low health ships

var op,remove,ii,killer,killer_tg;op=0;remove=0;killer=0;killer_tg="";ii=-50;





if (player_started=0) and (instance_exists(obj_turn_end)) then with(obj_star){if (name!=obj_turn_end.battle_location[obj_turn_end.current_battle]){x-=10000;y-=10000;}}
if (player_started=1) then with(obj_star){if (id!=obj_fleet.ene_fleet){x-=10000;y-=10000;}}
ii=instance_nearest(room_width,room_height,obj_star);
obj_controller.temp[1070]=ii.id;
with(obj_star){if (x<-5000) and (y<-5000){x+=10000;y+=10000;}}







op=0;var ofleet;ofleet=0;
repeat(5){op+=1;
    if (enemy[op]!=0) and (enemy[op]!=4){ofleet=0;
        obj_controller.temp[1071]=enemy[op];
        
        // show_message("Hiding all but the fleet owned by "+string(obj_controller.temp[1071]));
        
        with(obj_en_fleet){if (owner!=obj_controller.temp[1071]) or (orbiting!=obj_controller.temp[1070]){x-=10000;y-=10000;}}
        
        ofleet=instance_nearest(room_width/2,room_height/2,obj_en_fleet);
        // show_message("Fleet: "+string(ofleet.capital_number)+"/"+string(ofleet.frigate_number)+"/"+string(ofleet.escort_number)+", lost "+string(en_capital_lost[op])+"/"+string(en_frigate_lost[op])+"/"+string(en_escort_lost[op]));
        
        repeat(50){
            if (!instance_exists(ofleet)){ofleet=instance_nearest(room_width/2,room_height/2,obj_en_fleet);}
            if (instance_exists(ofleet)){
                if (ofleet.trade_goods="player_hold") then ofleet.trade_goods="";
                // show_message("ofleet x:"+string(ofleet.x)+", ofleet y:"+string(ofleet.y)+", ofleet owner: "+string(ofleet.owner)+" wants "+string(enemy[op]));
                if (ofleet.x>-7000) and (ofleet.y>-7000) and (ofleet.owner=enemy[op]){
                    if (en_capital_lost[op]+en_frigate_lost[op]+en_escort_lost[op]>=ofleet.capital_number+ofleet.frigate_number+ofleet.escort_number){
                        en_capital_lost[op]-=ofleet.capital_number;en_frigate_lost[op]-=ofleet.frigate_number;en_escort_lost[op]-=ofleet.escort_number;
                        // show_message("Fleet baleeted");
                        with(ofleet){instance_destroy();}
                    }
                    if (en_capital_lost[op]+en_frigate_lost[op]+en_escort_lost[op]>0) and (instance_exists(ofleet)){
                        // show_message("Fleet: "+string(ofleet.capital_number)+"/"+string(ofleet.frigate_number)+"/"+string(ofleet.escort_number)+", lost "+string(en_capital_lost[op])+"/"+string(en_frigate_lost[op])+"/"+string(en_escort_lost[op]));
                        if (en_capital_lost[op]>0) and (ofleet.capital_number>0){en_capital_lost[op]-=1;ofleet.capital_number-=1;}
                        if (en_frigate_lost[op]>0) and (ofleet.frigate_number>0){en_frigate_lost[op]-=1;ofleet.frigate_number-=1;}
                        if (en_escort_lost[op]>0) and (ofleet.escort_number>0){en_escort_lost[op]-=1;ofleet.escort_number-=1;}
                        if (ofleet.capital_number+ofleet.frigate_number+ofleet.escort_number<=0) then with(ofleet){instance_destroy();}
                    }
                }
            }
        }
        
        with(obj_en_fleet){if (x<-7000) and (y<-7000){x+=10000;y+=10000;}}
        
        // if (instance_exists(ofleet)){show_message("Fleet: "+string(ofleet.capital_number)+"/"+string(ofleet.frigate_number)+"/"+string(ofleet.escort_number));}
        // if (!instance_exists(ofleet)){show_message("FlEET WAS DELETED");}
    }
    
    // show_message("End ship removing");
    
    if (enemy[op]=4) and (enemy_status[op]<0){
        obj_controller.temp[1071]=enemy[op];
        with(obj_en_fleet){if (owner!=obj_controller.temp[1071]) or (orbiting!=obj_controller.temp[1070]){x-=10000;y-=10000;}}
        ofleet=instance_nearest(room_width/2,room_height/2,obj_en_fleet);
        killer=1;obj_controller.temp[1071]=enemy[op];
        killer_tg=ofleet.trade_goods;
        with(ofleet){instance_destroy();}
        with(obj_en_fleet){{x+=10000;y+=10000;}}
    }
}





obj_controller.cooldown=20;

if (killer>0){
    scr_loyalty("Inquisitor Killer","+");
    if (obj_controller.loyalty>=85) then obj_controller.last_world_inspection-=44;
    if (obj_controller.loyalty>=70) and (obj_controller.loyalty<85) then obj_controller.last_world_inspection-=32;
    if (obj_controller.loyalty>=50) and (obj_controller.loyalty<70) then obj_controller.last_world_inspection-=20;
    if (obj_controller.loyalty<50) then scr_loyalty("Inquisitor Killer","+");
    
    var msg,msg2,i,remove;msg="";msg2="";i=0;remove=0;
    if (string_count("Inqis1",killer_tg)=1){msg+="Inquisitor "+string(obj_controller.inquisitor[1])+" has been killed!";remove=1;msg2="Inquisitor "+string(obj_controller.inquisitor[1]);}
    if (string_count("Inqis2",killer_tg)=1){msg+="Inquisitor "+string(obj_controller.inquisitor[2])+" has been killed!";remove=2;msg2="Inquisitor "+string(obj_controller.inquisitor[2]);}
    if (string_count("Inqis3",killer_tg)=1){msg+="Inquisitor "+string(obj_controller.inquisitor[3])+" has been killed!";remove=3;msg2="Inquisitor "+string(obj_controller.inquisitor[3]);}
    if (string_count("Inqis4",killer_tg)=1){msg+="Inquisitor "+string(obj_controller.inquisitor[4])+" has been killed!";remove=4;msg2="Inquisitor "+string(obj_controller.inquisitor[4]);}
    if (string_count("Inqis5",killer_tg)=1){msg+="Inquisitor "+string(obj_controller.inquisitor[5])+" has been killed!";remove=5;msg2="Inquisitor "+string(obj_controller.inquisitor[5]);}
    if (obj_controller.inquisitor_type[remove]="Ordo Hereticus") then scr_loyalty("Inquisitor Killer","+");
    
    i=remove;
    repeat(10-remove){
        if (i<10){
            obj_controller.inquisitor_gender[i]=obj_controller.inquisitor_gender[i+1];
            obj_controller.inquisitor_type[i]=obj_controller.inquisitor_type[i+1];
            obj_controller.inquisitor[i]=obj_controller.inquisitor[i+1];
        }
        if (i=10){
            obj_controller.inquisitor_gender[i]=choose(1,1,1,1,2,2,2);
            obj_controller.inquisitor_type[i]=choose("Ordo Malleus","Ordo Xenos","Ordo Hereticus","Ordo Hereticus","Ordo Hereticus","Ordo Hereticus","Ordo Hereticus","Ordo Hereticus");
            obj_controller.inquisitor[i]=scr_imperial_name(obj_controller.inquisitor_gender[i]);// For 'random inquisitor wishes to inspect your fleet
        }
        i+=1;
    }
    
    instance_activate_object(obj_turn_end);
    
    if (instance_exists(obj_turn_end)) then scr_alert("red","inqis",string(msg),ii.x+16,ii.y-24);
    if (!instance_exists(obj_turn_end)) and (obj_controller.faction_status[eFACTION.Inquisition]!="War"){
        var pip;pip=instance_create(0,0,obj_popup);
        pip.title="Inquisitor Killed";pip.text=msg;pip.image="inquisition";pip.cooldown=20;
        
        if (obj_controller.known[eFACTION.Inquisition]<3){
            pip.title="EXCOMMUNICATUS TRAITORUS";
            pip.text="The Inquisition has noticed your uncalled murder of "+string(msg2)+" and declared your chapter Excommunicatus Traitorus.";
            obj_controller.alarm[8]=1;
        }
    }
    
    
    // if (obj_controller.known[eFACTION.Inquisition]<3) then with(obj_popup){instance_destroy();}
    
    
    
    // excommunicatus traitorus
}


// if (yeehaw1.capital_number+yeehaw1.frigate_number+yeehaw1.escort_number<=0) then with(yeehaw1){instance_destroy();}
// if (yeehaw2.capital_number+yeehaw2.frigate_number+yeehaw2.escort_number<=0) or (victory=true) then with(yeehaw2){instance_destroy();}

// instance_deactivate_object(obj_turn_end);
instance_activate_all();

if (instance_exists(obj_p_assra)){obj_p_assra.alarm[0]=1;}
alarm[4]=2;



