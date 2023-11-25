

/*if (owner = eFACTION.Chaos){
    show_message("Trade Goods: "+string(trade_goods)+"#Alarms: "+string(alarm[0])+"|"+string(alarm[1])+"|"+string(alarm[2])+"|"+string(alarm[4]));
}*/


if (action="") and (orbiting!=0){
    if (instance_exists(orbiting)){orbiting.present_fleet[owner]-=1;}
    orbiting=0;
}



if (instance_exists(obj_controller)){
    if ((trade_goods="BLOODBLOODBLOOD") or (trade_goods="BLOODBLOODBLOODBLOOD")) and (obj_controller.faction_defeated[10]=0){
        with(obj_temp2){instance_destroy();}
        with(obj_star){
			if system_feature_bool(p_feature, P_features.World_Eaters == 1)then instance_create(x,y,obj_temp2);
        }
        if (!instance_exists(obj_temp2)){
            obj_controller.faction_defeated[10]=1;show_message("WL10 defeated");
            if (instance_exists(obj_turn_end)){
                scr_event_log("","Enemy Leader Assassinated: Chaos Lord");
                scr_alert("","ass","Chaos Lord "+string(obj_controller.faction_leader[eFACTION.Chaos])+" has been killed.",0,0);
                scr_popup("Black Crusade Ended","The Chaos Lord "+string(obj_controller.faction_leader[eFACTION.Chaos])+"'s flagship has been destroyed with him at the helm.  Without his leadership the Black Crusade is destined to crumble apart and disintegrate from infighting.  Sector "+string(obj_ini.sector_name)+" is no longer at threat by the forces of Chaos.","","");
            }
        }
        with(obj_temp2){instance_destroy();}
    }
    if (trade_goods="WL7") and (obj_controller.faction_defeated[7]<=0) and (safe=0){
        obj_controller.faction_defeated[7]=1;
        scr_event_log("","Enemy Leader Assassinated: Ork Warboss");
        if (instance_exists(obj_turn_end)) then scr_alert("","ass","Warboss "+string(obj_controller.faction_leader[eFACTION.Ork])+" has been killed.",0,0);
    }
}

/* */
/*  */
