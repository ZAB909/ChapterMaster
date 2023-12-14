
var battle_o;battle_o=0;
current_battle+=1;
combating=0;

instance_activate_object(obj_star);

if (battles>0) and (current_battle<=battles){
    var ii, good;
    ii=0;good=0;
    
    obj_controller.temp[1060]=battle_location[current_battle];
    with(obj_temp3){instance_destroy();}
    with(obj_star){if (name=obj_controller.temp[1060]) then instance_create(x,y,obj_temp3);}
    battle_o=instance_nearest(obj_temp3.x,obj_temp3.y,obj_star);ii=battle_o;
    with(obj_temp3){instance_destroy();}
    if (ii.name=battle_location[current_battle]) then good=1;
    
    if (good=1){
        obj_controller.x=ii.x;obj_controller.y=ii.y;show=current_battle;
        
        if (battle_world[current_battle]=-50){
            strin[1]=string(battle_pobject[current_battle].capital_number);
            strin[2]=string(battle_pobject[current_battle].frigate_number);
            strin[3]=string(battle_pobject[current_battle].escort_number);
            // pull health values here
            strin[4]=string(battle_pobject[current_battle].capital_health);
            strin[5]=string(battle_pobject[current_battle].frigate_health);
            strin[6]=string(battle_pobject[current_battle].escort_health);
            
            // Here
            strin[7]=string(battle_object[current_battle].capital_number);
            strin[8]=string(battle_object[current_battle].frigate_number);
            strin[9]=string(battle_object[current_battle].escort_number);
            // pull health values here
            strin[10]="100";
            strin[11]="100";
            strin[12]="100";            
        }
        
        
        
        if (battle_world[current_battle]>=1){
        
            scr_count_forces(string(battle_location[current_battle]),battle_world[current_battle],true);
            
            strin[1]=info_mahreens;
            strin[2]=info_vehicles;
            
            if (info_mahreens+info_vehicles=0){
                if (battles>current_battle) then alarm[4]=1;
                if (battles=current_battle) then alarm[1]=1;
            }
            
            strin[3]="";
            
            var tempy;tempy=0;
            tempy=battle_object[current_battle].p_owner[battle_world[current_battle]];
            
            if (tempy=1) or (tempy=2) or (tempy=3){
                if (battle_object[current_battle].p_fortified[battle_world[current_battle]]=1) then strin[3]="Minimally";
                if (battle_object[current_battle].p_fortified[battle_world[current_battle]]=2) then strin[3]="Lightly";
                if (battle_object[current_battle].p_fortified[battle_world[current_battle]]=3) then strin[3]="Moderately";
                if (battle_object[current_battle].p_fortified[battle_world[current_battle]]=4) then strin[3]="Highly";
                if (battle_object[current_battle].p_fortified[battle_world[current_battle]]=5) then strin[3]="Extremely";
                if (battle_object[current_battle].p_fortified[battle_world[current_battle]]=6) then strin[3]="Maximally";
            }
            
            tempy=0;
            if (battle_opponent[current_battle]=7) then tempy=battle_object[current_battle].p_orks[battle_world[current_battle]];
            if (battle_opponent[current_battle]=8) then tempy=battle_object[current_battle].p_tau[battle_world[current_battle]];
            if (battle_opponent[current_battle]=9) then tempy=battle_object[current_battle].p_tyranids[battle_world[current_battle]];
            if (battle_opponent[current_battle]=10) then tempy=battle_object[current_battle].p_traitors[battle_world[current_battle]];
            if (battle_opponent[current_battle]=30){tempy=1;strin[4]="Master Spyrer";}
            
            if (battle_opponent[current_battle]<=20){
                if (tempy=1) then strin[4]="Minimal Forces";
                if (tempy=2) then strin[4]="Sparse Forces";
                if (tempy=3) then strin[4]="Moderate Forces";
                if (tempy=4) then strin[4]="Numerous Forces";
                if (tempy=5) then strin[4]="Very Numerous";
                if (tempy=6) then strin[4]="Overwhelming";
            }
        }
        
        if (obj_controller.zoomed=1) then with(obj_controller){scr_zoom();}
    }
    instance_activate_object(obj_star);
    
}

instance_activate_object(obj_star);






if (battle[1]=0) or (current_battle>battles){//                         This is temporary for the sake of testing
    if (battle[1]=0){obj_controller.x=first_x;obj_controller.y=first_y;}
    alarm[1]=1;
}

