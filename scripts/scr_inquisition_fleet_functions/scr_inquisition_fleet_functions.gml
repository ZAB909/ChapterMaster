function base_inquis_fleet (){
	owner=eFACTION.Inquisition;
    frigate_number=1;
    sprite_index=spr_fleet_inquisition;
    image_index=0;
    var roll=irandom(100)+1;
    inquisitor = 0;
    trade_goods="Inqis";
    if (roll>60){
        var inquis_choice = choose(2,3,4,5);
        inquisitor = inquis_choice
    }
}


function inquisition_fleet_inspection_chase(){
	var good=0,acty="";
			
	if (!instance_exists(target)){// Reaquire target
        var target_player_fleet = get_largest_player_fleet();
        if (target_player_fleet != "none"){
            if (target_player_fleet.action == ""){
                set_fleet_target(target_player_fleet.x,target_player_fleet.y, target_player_fleet);
            } else {
                set_fleet_target(target_player_fleet.action_x,target_player_fleet.action_y, target_player_fleet);         
            }                        
        }
	}
	if (instance_exists(target)) {

        var at_star=instance_nearest(target.x,target.y,obj_star).id;
        var target_at_star=instance_nearest(x,y,obj_star).id;
        if (target.action!="") then at_star=555;
    
        if (at_star!=target_at_star){
            trade_goods+="!";
            acty="chase";
            scr_loyalty("Avoiding Inspections","+");
        }
    
        // if (string_count("!",trade_goods)>=3) then demand stop fleet
    
        
        //Inquisitor is pissed as hell
        if (string_count("!",trade_goods)=5){
            obj_controller.alarm[8]=10;
            instance_destroy();
            exit;
        }
    
    
        if (acty="chase"){
            instance_activate_object(obj_star);
            var goal_x,goal_y,target_meet=0;
        
            chase_fleet_target_set();
            target_meet=instance_nearest(action_x,action_y,obj_star);
            if (string_count("!",trade_goods)=4) and (instance_exists(obj_turn_end)){
        
            // color / type / text /x/y
        
                scr_alert("blank","blank","blank",target_meet.x,target_meet.y);
            
                var massa,iq;iq=0;
                massa="Inquisitor ";
                if (inquisitor>0){
                    iq=inquisitor
                }
            
                massa+=string(obj_controller.inquisitor[iq]);
            
                if (target.action="") then massa+=$" DEMANDS that you keep your fleet at {target_meet.name} until ";
                if (target.action!="") then massa+=$" DEMANDS that you station your fleet at {target_meet.name} until ";
        
                scr_event_log("red",string(massa)+" they may inspect it.");
                var gender = obj_controller.inquisitor_gender[iq]==1?"he":"she"
                if (obj_controller.inquisitor_gender[iq]=1) then massa+=$"{gender} is able to complete the inspection.  Further avoidance will be met with harsh action.";

                scr_popup("Fleet Inspection",massa,"inquisition","");
        
            // scr_poup("
            }
        
            exit;
		}
    }
}
// TODO maybe have the inquisitor or his team as an actual entity that goes around and can die, which gives the player time to fix stuff 
// either kill the inquisitor or he dies in combat

// Sets up an inquisitor ship to do an inspection on the HomeWorld
function new_inquisitor_inspection(){
	var inspection_set = false;
	var target_system = "none";
	var new_inquis_fleet;
    if (obj_ini.fleet_type==1){
    	var monestary_system = "none";
        // If player does not own their homeworld than do a fleet inspection instead
        var player_stars = [];
        with(obj_star){
            if (owner==eFACTION.Player) then array_push(player_stars,id);
            if (system_feature_bool(p_feature, P_features.Monastery)){
            	monestary_system=self;
            }
        }
        if (monestary_system!="none"){
        	target_system=monestary_system;
        } else if (array_length(player_stars)==1){
        	target_system=player_stars[0];
        }

        if (target_system!="none"){
            inspection_set = true;
            var target_star = target_system;
            var tar,new_inquis_fleet;
            var xx=target_star.x;
            var yy=target_star.y;

              //get the second or third closest planet to launch inquisitor from
            var from_star = distance_removed_star(target_star.x,target_star.y);            
            new_inquis_fleet=instance_create(from_star.x,from_star.y-24,obj_en_fleet);


            with (new_inquis_fleet){
            	base_inquis_fleet();
            	action_x=xx;
            	action_y=yy;
            	set_fleet_movement();
            }
            var mess=$"Inquisitor {obj_controller.inquisitor[new_inquis_fleet.inquisitor]}";
            mess += " wishes to inspect your chapter base at "+string(target_star.name);
            scr_alert("green","inspect",mess,target_star.x,target_star.y);
            obj_controller.last_world_inspection=obj_controller.turn;
        }
    }
    if  (obj_ini.fleet_type!=1 || !inspection_set){
        // If player does not own their homeworld than do a fleet inspection instead

        var target_player_fleet = get_largest_player_fleet();
        if (target_player_fleet != "none"){

            with(obj_star){
                if (owner==eFACTION.Eldar) then instance_deactivate_object(id);
            }

            //get the second or third closest planet to launch inquisitor from
            var from_star =distance_removed_star(target_player_fleet.x,target_player_fleet.y);

            new_inquis_fleet=instance_create(from_star.x,from_star.y-24,obj_en_fleet);
            var obj;
            with (new_inquis_fleet){
            	base_inquis_fleet();
            	target = target_player_fleet;
            	chase_fleet_target_set();
            	obj=instance_nearest(action_x,action_y,obj_star);
            	trade_goods+="_fleet";
            }              

            var mess=$"Inquisitor {obj_controller.inquisitor[new_inquis_fleet.inquisitor]}";

            mess+=" wishes to inspect your fleet at "+string(obj.name);
            scr_alert("green","inspect",mess,obj.x,obj.y);

            obj_controller.last_fleet_inspection=obj_controller.turn;

            instance_activate_object(obj_star);
        }
    }	
}

inquisition_inspection_logic(){
	var inspec_alert_string = "";
	var cur_star=instance_nearest(x,y,obj_star);

	 if (string_count("fleet",trade_goods)==0 && string_count("investigate",trade_goods)=0){
            var cur_star = instance_nearest(x,y,obj_star);
            inspec_alert_string = $"Inquisitor finishes inspection of {cur_star.name}";
            scr_event_log("","Inquisitor finishes inspection of "+string(cur_star.name)+".", cur_star.name);
            scr_loyalty("blarg","inspect_world");// This updates the loyalties
            if (whom=0) then scr_alert("green","duhuhuhu","Inquisitor Ship finishes inspection of "+string(cur_star.name)+".",x,y);
            if (whom>0) then scr_alert("green","duhuhuhu",inquis_string+" finishes inspection of "+string(cur_star.name)+".",x,y);
        } 
        else if (string_count("fleet",trade_goods)>0 && string_count("investigate",trade_goods)=0){
        	inspec_alert_string = $"Inquisitor finishes inspection of your fleet";
            scr_event_log("","Inquisitor finishes inspection of your fleet.");
            scr_loyalty("blarg","inspect_fleet");// This updates the loyalties
            if (whom=0) then scr_alert("green","duhuhuhu","Inquisitor Ship finishes inspection of your fleet.",x,y);
            if (whom>0) then scr_alert("green","duhuhuhu",inquis_string+" finishes inspecting your fleet.",x,y);
            target=noone;
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
                    if (hur=1) then obj_turn_end.popup_text[obj_turn_end.popups]=inquis_string+" has noted your abundant Gene-Seed stores and Test-Slave Incubators.  Your Chapter has plenty enough Gene-Seed to restore itself to full strength and the Incubators on top of that are excessive.  Both have been reported, and you are ordered to remove the Test-Slave Incubators.  Relations with the Inquisition are also more strained than before.";
                    if (hur=2) then obj_turn_end.popup_text[obj_turn_end.popups]=inquis_string+" has noted your abundant Gene-Seed stores and Test-Slave Incubators.  Your Chapter is already at full strength and the Incubators on top of that are excessive.  The Incubators have been reported, and you are ordered to remove them immediately.  Relations with the Inquisition are also slightly more strained than before.";
                }
                if (obj_controller.inqis_flag_gene=2){
                    if (hur=1) then obj_turn_end.popup_text[obj_turn_end.popups]=inquis_string+" has noted your abundant Gene-Seed stores and Test-Slave Incubators.  Both the stores and incubators have been reported, and you are AGAIN ordered to remove the Test-Slave Incubators.  The Inquisitor says this is your final warning.";
                    if (hur=2) then obj_turn_end.popup_text[obj_turn_end.popups]=inquis_string+" has noted your abundant Gene-Seed stores and Test-Slave Incubators.  Your Chapter is already at full strength and the Incubators are unneeded.  The Incubators have been reported, AGAIN, and you are to remove them.  The Inquisitor says this is your final warning.";
                }
                if (obj_controller.inqis_flag_gene=3){
                    if (obj_controller.faction_status[eFACTION.Inquisition]!="War") then obj_controller.alarm[8]=1;
                }
                
            }
        }
}
