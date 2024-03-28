
// show_message("so far so good, defeat:"+string(defeat));


var obj, _ruins;obj=0;_ruins=obj_controller.current_planet_feature
ruins_race = _ruins.ruins_race;
ruins_battle = choose(6,7,9,10,11,12);
loc=obj_controller.current_planet_feature.star.name
with(obj_star){if (name!=obj_temp4.battle_loc) then instance_deactivate_object(id);}
obj=instance_nearest(room_width/2,room_height/2,obj_star);
instance_activate_object(obj_star)


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
    pop.text="Your forces within the ancient ruins have been surrounded and destroyed, down to the last man. An immediate expedition must be launched to recover and honour them as well as secure any geneseed or equipment not destroyed";
    if (ruins_battle=10) then pop.text+="Now that they have been discovered, scans indicate the heretics and mutants are leaving the structures en masse.  ";
    if (ruins_battle=11) then pop.text+="Now that they have been discovered, scans indicate the chaos space marines are leaving the structures, intent on doing damage.  ";
    if (ruins_battle=12) then pop.text+="Scans indicate the foul daemons are leaving the structures en masse, intent on doing damage.  "
    if (ruins_battle=6) then pop.text+="Now that they have been discovered, the Eldar seem to have vanished without a trace.  Scans reveal nothing.";
	_ruins.forces_defeated();
	if (post_equipment_lost[1]!=""){
	    var i;i=0;
	    repeat(50){i+=1;
	        if (post_equipment_lost[i]!="") and (post_equipments_lost[i]>0){
				var _new_equip = floor(post_equipments_lost[i]/2)
				if (_new_equip == 0) then _new_equip++
				array_push(_ruins.recoverables, [post_equipment_lost[i],_new_equip])
	        }
	    }
		if (recoverable_gene_seed > 0){
			recoverable_gene_seed = floor(recoverable_gene_seed/2)
			if (recoverable_gene_seed == 0) then recoverable_gene_seed++;
			_ruins.recoverable_gene_seed = recoverable_gene_seed;
		}
		if (array_length(_ruins.recoverables)>0){
			_ruins.unrecovered_items=true;
		}
	}
}


if (defeat=0) then scr_ruins_reward(obj,num,obj_controller.current_planet_feature);

// argument0: world object
// argument1: planet
// argument2: ruins_race

