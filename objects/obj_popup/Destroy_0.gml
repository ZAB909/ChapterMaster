
if (image="debug_banshee") then obj_controller.cooldown=8;
if (image="chaos_symbol") and (title="Concealed Heresy") and (instance_exists(obj_drop_select)){
    obj_drop_select.alarm[5]=1;
}

if (instance_exists(obj_controller)){
    if (obj_controller.current_eventing="chaos_meeting_1"){
        obj_controller.menu=20;
        obj_controller.diplomacy=10;
        obj_controller.cooldown=5000;
        with(obj_controller){scr_dialogue("cs_meeting1");}
    }
    
    if (obj_controller.current_eventing="chaos_trap"){
        instance_create(0,0,obj_ncombat);
        obj_ncombat.battle_special="cs_meeting_battle10";
        
        with(obj_temp4){instance_destroy();}
        with(obj_star){
            var run,s;run=0;s=0;
            repeat(4){run+=1;s=0;
                repeat(4){s+=1;
                    if (p_problem[run,s]="meeting") or (p_problem[run,s]="meeting_trap"){
                        repeat(run){instance_create(x,y,obj_temp4);}
                    }
                }
            }
        }
        if (instance_number(obj_temp4)=0){
            with(obj_star){
                if (string_count(name,scr_master_loc())>0){
                    repeat(obj_ini.wid[0][1]){instance_create(x,y,obj_temp4);}
                }
            }
        }
        
        obj_ncombat.battle_object=instance_nearest(obj_temp4.x,obj_temp4.y,obj_star);
        obj_ncombat.battle_loc=instance_nearest(obj_temp4.x,obj_temp4.y,obj_star).name;
        obj_ncombat.battle_id=instance_number(obj_temp4);
        with(obj_temp4){instance_destroy();}
        obj_ncombat.dropping=0;
        obj_ncombat.attacking=1;
        obj_ncombat.local_forces=0;
        obj_ncombat.enemy=10;obj_ncombat.threat=3;
        
        with(obj_star){
            var run,s;run=0;s=0;
            repeat(4){run+=1;s=0;
                repeat(4){s+=1;
                    if (p_problem[run,s]="meeting") or (p_problem[run,s]="meeting_trap"){p_problem[run,s]="";p_timer[run,s]=-1;}
                }
            }
        }
        
        obj_controller.useful_info+="CHTRP|";
        
        var v;v=0;
        repeat(obj_temp_meeting.dudes){v+=1;
            if (obj_temp_meeting.present[v]=1){
                obj_ncombat.fighting[obj_temp_meeting.co[v],obj_temp_meeting.ide[v]]=1;
            }
        }
        
        
        scr_civil_roster(obj_ncombat.battle_loc,obj_ncombat.battle_id,true);
        
        instance_deactivate_all(true);
        instance_activate_object(obj_controller);
        instance_activate_object(obj_ini);
        instance_activate_object(obj_temp_meeting);
        instance_activate_object(obj_ncombat);
        instance_activate_object(obj_centerline);
        instance_activate_object(obj_pnunit);
        instance_activate_object(obj_enunit);
        
        exit;
    }
    
    
    if (obj_controller.current_eventing="chaos_meeting_end") and (instance_exists(obj_turn_end)){
        obj_turn_end.alarm[1]=1;obj_controller.current_eventing="";
    }
}

