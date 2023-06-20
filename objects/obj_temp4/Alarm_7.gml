
// show_message("so far so good, defeat:"+string(defeat));


var obj;obj=0;
with(obj_star){if (name!=obj_temp4.battle_loc) then instance_deactivate_object(id);}
obj=instance_nearest(room_width/2,room_height/2,obj_star);
instance_activate_object(obj_star);


if (defeat=0){
    var dice;dice=floor(random(100))+1;
    if (string_count("Shitty",obj_ini.strin2)>0) then dice+=10;
    if (dice<(battle_threat*10)){
        if (ruins_race=5){
            obj_controller.disposition[5]+=2;
            var o;o=0;repeat(4){if (o<=4){o+=1;if (obj_ini.adv[o]="Reverent Guardians") then o=500;}}if (o>100) then obj_controller.disposition[5]+=1;
        }
        
        
        
        if (ruins_race<5){
            var di;di=choose(2,4);
            if (di=2) then obj_controller.disposition[2]+=2;
            if (di=4) then obj_controller.disposition[4]+=1;
        }
        if (ruins_race=6){
            if (ruins_battle=6) then obj_controller.disposition[6]-=5;
            if (ruins_battle=11) then obj_controller.disposition[6]+=2;
            if (ruins_battle=12) then obj_controller.disposition[6]+=4;
        }
    }
}
if (defeat=1){
    var dice;dice=floor(random(100))+1;
    if (string_count("Shitty",obj_ini.strin2)>0) then dice+=10;
    if (dice<(battle_threat*10)){
        if (ruins_race=5) then obj_controller.disposition[5]-=2;
        if (ruins_race<5){
            var di;di=choose(2,4);
            if (di=2) then obj_controller.disposition[2]-=2;
            if (di=4) then obj_controller.disposition[4]-=1;
        }
    }
    var pop;pop=instance_create(0,0,obj_popup);
    if (ruins_battle=10){obj.p_traitors[num]=battle_threat+1;obj.p_heresy[num]+=10;}
    if (ruins_battle=11){obj.p_traitors[num]=battle_threat+1;obj.p_heresy[num]+=25;}
    if (ruins_battle=12){obj.p_demons[num]=battle_threat+1;obj.p_heresy[num]+=40;}
    
    pop.title="Ancient Ruins";
    pop.text="Your forces within the ancient ruins have been surrounded and destroyed, down to the last man.  ";
    if (ruins_battle=10) then pop.text+="Now that they have been discovered, scans indicate the heretics and mutants are leaving the structures en masse.  ";
    if (ruins_battle=11) then pop.text+="Now that they have been discovered, scans indicate the chaos space marines are leaving the structures, intent on doing damage.  ";
    if (ruins_battle=12) then pop.text+="Scans indicate the foul daemons are leaving the structures en masse, intent on doing damage.  "
    if (ruins_battle=6) then pop.text+="Now that they have been discovered, the Eldar seem to have vanished without a trace.  Scans reveal nothing.";
}

obj.p_feature[num]=string_replace(obj.p_feature[num],"Ancient Ruins|","");


if (defeat=0) then scr_ruins_reward(obj,num,ruins_race);

// argument0: world object
// argument1: planet
// argument2: ruins_race

