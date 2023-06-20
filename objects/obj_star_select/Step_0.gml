


if (instance_exists(target)){
    if (target.craftworld=1) then obj_controller.selecting_planet=1;
    if (target.space_hulk=1) then obj_controller.selecting_planet=1;
    x=target.x;y=target.y;
    
    // Buttons that are available
    
    if (obj_controller.selecting_planet>0){
        if (target.present_fleet[1]=0)/* and (target.p_type[obj_controller.selecting_planet]!="Dead")*/{
            var enema;enema=false;
            if (target.p_owner[obj_controller.selecting_planet]>5) then enema=true;
            if (obj_controller.faction_status[target.p_owner[obj_controller.selecting_planet]]="War") then enma=true;
            
            if (target.p_player[obj_controller.selecting_planet]>0){
                if (enema=true){button1="Attack";button2="Purge";}
            }
        }
        if (target.present_fleet[1]>0)/* and (target.p_type[obj_controller.selecting_planet]!="Dead")*/{
            var enema;enema=false;
            if (target.p_owner[obj_controller.selecting_planet]>5) then enema=true;
            if (obj_controller.faction_status[target.p_owner[obj_controller.selecting_planet]]="War") then enma=true;
            
            if (enema=true){button1="Attack";button2="Raid";button3="Bombard";}
            if (enema=false){button1="Attack";button2="Raid";button3="Purge";}
            
            if (torpedo>0){
                var pfleet;pfleet=instance_nearest(x,y,obj_p_fleet);
                if (instance_exists(pfleet)) and (point_distance(pfleet.x,pfleet.y,target.x,target.y)<=40) and (pfleet.action=""){
                    if (pfleet.capital_number+pfleet.frigate_number>0) and (button4="") then button4="Cyclonic Torpedo";
                }
            }
            
        }
    
    
    
    
        /*
    
        if (target.present_fleet[1]>0){
            // if (target.p_player[obj_controller.selecting_planet]>0){button1="Attack";button2="Raid";button3="Purge";}
            // if (target.p_player[obj_controller.selecting_planet]=0){button1="Raid";button2="Purge";}
            button1="Attack";button2="Raid";button3="Purge";
        }
        if (target.present_fleet[1]=0) and (target.p_player[obj_controller.selecting_planet]>0){
            button1="Attack";button2="Purge";
        }*/
        if ((target.p_type[obj_controller.selecting_planet]="Dead") and ((target.present_fleet[1]>0) or (target.p_player[obj_controller.selecting_planet]>0))) or (target.p_upgrades[obj_controller.selecting_planet]!=""){
            if (target.p_feature[obj_controller.selecting_planet]="") or (target.p_upgrades[obj_controller.selecting_planet]!=""){var chock;chock=1;
                if (target.p_orks[obj_controller.selecting_planet]>0) then chock=0;
                if (target.p_chaos[obj_controller.selecting_planet]>0) then chock=0;
                if (target.p_tyranids[obj_controller.selecting_planet]>0) then chock=0;
                if (target.p_necrons[obj_controller.selecting_planet]>0) then chock=0;
                if (target.p_tau[obj_controller.selecting_planet]>0) then chock=0;
                if (target.p_demons[obj_controller.selecting_planet]>0) then chock=0;
                if (chock=1){button1="Build";button2="";button3="";button4="";button5="";}
            }
        }
        
        
        /*
        var pp;pp=obj_controller.selecting_planet;
        if (target.p_orks[pp]+target.p_chaos[pp]+target.p_traitors[pp]+target.p_eldar[pp]+target.p_tau[pp]+target.p_tyranids[pp]>0) or (target.p_owner[pp]=8){
            if (button1="Purge") and (target.present_fleet[1]>0) then button1="Bombard";
            if (button2="Purge") and (target.present_fleet[1]>0) then button2="Bombard";
            if (button3="Purge") and (target.present_fleet[1]>0) then button3="Bombard";
            if (button4="Purge") and (target.present_fleet[1]>0) then button4="Bombard";
        }
        */
        
        if (obj_controller.recruiting_worlds_bought>0) and (target.p_owner[obj_controller.selecting_planet]<=5) and (obj_controller.faction_status[target.p_owner[obj_controller.selecting_planet]]!="War"){
            if (string_count("Recr",target.p_feature[obj_controller.selecting_planet])=0) and (target.p_type[obj_controller.selecting_planet]!="Dead") and (target.space_hulk=0){
                button4="+Recruiting";
            }
        }
        if (target.space_hulk=1){
            if (target.present_fleet[1]>0){
                button1="Raid";button2="Bombard";button3="";button4="";
            }
        }
        
        
    }
}





if (obj_controller.popup<3) and (loading=0){
    obj_controller.sel_system_x=0;
    obj_controller.sel_system_y=0;
    obj_controller.selecting_planet=0;
    
    with(obj_star_select){
        instance_destroy();
    }
}



if (loading=1){
    var xx, yy, temp1, dist;
    xx=__view_get( e__VW.XView, 0 )+0;
    yy=__view_get( e__VW.YView, 0 )+0;
    dist=999;
    
    obj_controller.selecting_planet=0;
    button1="";button2="";button3="";button4="";

    if (instance_exists(target)){
        if (target.space_hulk=1) then exit;
    }
    
    if (target.planets>=1) and (obj_controller.cooldown<=0){
        dist=point_distance(xx+159,yy+287,mouse_x,mouse_y);   
        if (dist<=22) then obj_controller.selecting_planet=1; 
    }
    if (target.planets>=2) and (obj_controller.cooldown<=0){
        dist=point_distance(xx+200,yy+287,mouse_x,mouse_y);   
        if (dist<=22) then obj_controller.selecting_planet=2; 
    }
    if (target.planets>=3) and (obj_controller.cooldown<=0){
        dist=point_distance(xx+241,yy+287,mouse_x,mouse_y);   
        if (dist<=22) then obj_controller.selecting_planet=3; 
    }
    if (target.planets>=4) and (obj_controller.cooldown<=0){
        dist=point_distance(xx+282,yy+287,mouse_x,mouse_y);   
        if (dist<=22) then obj_controller.selecting_planet=4; 
    }
}

/* */
/*  */
