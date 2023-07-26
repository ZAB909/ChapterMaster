var __b__;
__b__ = action_if_number(obj_saveload, 0, 0);
if __b__
{
var xx, yy;
xx=__view_get( e__VW.XView, 0 );
yy=__view_get( e__VW.YView, 0 );




with(obj_star_select){instance_deactivate_object(id);}


var i, why, num, onceh;i=-3;why=0;onceh=0;
if (obj_controller.cooldown<=0) then repeat(6){i+=4;
    if (ship[i]!=""){onceh=0;
        if (mouse_x>=xx+47) and (mouse_y>=yy+107+why) and (mouse_x<xx+161) and (mouse_y<yy+122+why){
            if (onceh=0) and (ship_all[i]=0){onceh=1;obj_controller.cooldown=8;ship_all[i]=1;ships_selected+=1;}
            if (onceh=0) and (ship_all[i]=1){onceh=1;obj_controller.cooldown=8;ship_all[i]=0;ships_selected-=1;}
        }
    }
    if (ship[i+1]!=""){onceh=0;
        if (mouse_x>=xx+164) and (mouse_y>=yy+107+why) and (mouse_x<xx+278) and (mouse_y<yy+122+why){
            if (onceh=0) and (ship_all[i+1]=0){onceh=1;obj_controller.cooldown=8;ship_all[i+1]=1;ships_selected+=1;}
            if (onceh=0) and (ship_all[i+1]=1){onceh=1;obj_controller.cooldown=8;ship_all[i+1]=0;ships_selected-=1;}
        }
    }
    if (ship[i+2]!=""){onceh=0;
        if (mouse_x>=xx+281) and (mouse_y>=yy+107+why) and (mouse_x<xx+395) and (mouse_y<yy+122+why){
            if (onceh=0) and (ship_all[i+2]=0){onceh=1;obj_controller.cooldown=8;ship_all[i+2]=1;ships_selected+=1;}
            if (onceh=0) and (ship_all[i+2]=1){onceh=1;obj_controller.cooldown=8;ship_all[i+2]=0;ships_selected-=1;}
        }
    }
    if (ship[i+3]!=""){onceh=0;
        if (mouse_x>=xx+398) and (mouse_y>=yy+107+why) and (mouse_x<xx+512) and (mouse_y<yy+122+why){
            if (onceh=0) and (ship_all[i+3]=0){onceh=1;obj_controller.cooldown=8;ship_all[i+3]=1;ships_selected+=1;}
            if (onceh=0) and (ship_all[i+3]=1){onceh=1;obj_controller.cooldown=8;ship_all[i+3]=0;ships_selected-=1;}
        }
    }
    why+=18;
}





/*
if (target=2) then str=max(imp,pdf);
    if (target=3) then str=mechanicus;
    if (target=5) then str=sisters;
    if (target=6) then str=eldar;
    if (target=7) then str=orks;
    if (target=8) then str=tau;
    if (target=9) then str=tyranids;
    if (target=10) then str=max(traitors,chaos);
    
    if (str=1) then str_string="Minimal Forces";
    if (str=2) then str_string="Sparse Forces";
    if (str=3) then str_string="Moderate Forces";
    if (str=4) then str_string="Numerous Forces";
    if (str=5) then str_string="Very Numerous";
    if (str=6) then str_string="Overwhelming";
    
    draw_text(xx+310,yy+351,"Strength: "+string(str_string));
    draw_text(xx+310.5,yy+351.5,"Strength:");
    
    if (targets>1){
        draw_sprite_ext(spr_arrow,0,xx+309,yy+336,0.75,0.75,0,c_white,1);
        draw_sprite_ext(spr_arrow,1,xx+493,yy+336,0.75,0.75,0,c_white,1);
    }
    */
    
if (targets>1) and (obj_controller.cooldown<=0) and (mouse_y>=yy+336) and (mouse_y<yy+351){
    if (mouse_x>=xx+309) and (mouse_x<xx+332){
        target-=1;obj_controller.cooldown=8;
        if (target=1) then target=10;
        if (target=10) and (traitors+chaos=0) then target=9;
        if (target=9) and (tyranids<5) then target=8;
        if (target=8) and (tau=0) then target=7;
        if (target=7) and (ork=0) then target=6;
        if (target=6) and (eldar=0) then target=5;
        if (target=5) and (sisters=0) then target=3;
        if (target=3) and (mechanicus=0) then target=2.5;
        if (target=2.5) and (pdf=0) then target=2;
        if (target=1.5) then target=2;
        if (target=2) and (imp+pdf=0) then target=10;
    }
    if (mouse_x>=xx+493) and (mouse_x<xx+516){
        obj_controller.cooldown=8;
        
        if (target=2.5) and (pdf=0) then target=3;
        if (target=2.5) and (pdf>0) then target+=0.5;
        
        if (target=1) then target=2;
        // if (target=2) and (imp+pdf=0) then target=3;
        if (target=2) and (imp=0) then target=2.5;
        if (target=2.5) and (pdf=0) then target=3;
        if (target=3) and (mechanicus=0) then target=5;
        if (target=5) and (sisters=0) then target=6;
        if (target=6) and (eldar=0) then target=7;
        if (target=7) and (ork=0) then target=8;
        if (target=8) and (tau=0) then target=9;
        if (target=9) and (tyranids<5) then target=10;
        if (target=10) and (chaos+traitors=0) then target=2;
        if (target=2) and (imp=0) then target=2.5;
        if (target=2.5) and (pdf=0) then target=3;
        // if (target=2) and ((imp=0) or (p_target.p_owner[obj_controller.selecting_planet]=8)) then target=2.5;
    }
}    



var i;i=0;bomb_score=0;
repeat(25){
    i+=1;
    if (ship_all[i]=1){
        if (obj_ini.ship[ship_ide[i]].class = SHIP_CLASS.battle_barge) then bomb_score+=3;
        if (obj_ini.ship[ship_ide[i]].class = SHIP_CLASS.strike_cruiser) then bomb_score+=1;
    }
}


if (obj_controller.cooldown<=0){
    if (mouse_x>=xx+456) and (mouse_y>=yy+378) and (mouse_x<xx+519) and (mouse_y<yy+403){
        obj_controller.cooldown=8;
        with(obj_bomb_select){instance_destroy();}
        instance_destroy();
    }
    if (mouse_x>=xx+76) and (mouse_y>=yy+82) and (mouse_x<xx+102) and (mouse_y<yy+95){
        var onceh;once=0;i=0;
        if (all_sel=0) and (onceh=0){
            repeat(30){i+=1;
                if (ship[i]!="") and (ship_all[i]=0){ship_all[i]=1;ships_selected+=1;}
            }
            onceh=1;all_sel=1;
        }
        if (all_sel=1) and (onceh=0){
            repeat(30){i+=1;
                if (ship[i]!="") and (ship_all[i]=1){ship_all[i]=0;ships_selected-=1;}
            }
            onceh=1;all_sel=0;
        }
    }
}



// 
if (obj_controller.cooldown<=0){// Need to change max_ships to something more meaningful to make sure that SOMETHING is dropping
    if (ships_selected>0) and (mouse_x>=xx+310) and (mouse_y>=yy+378) and (mouse_x<xx+444) and (mouse_y<yy+403){
        obj_controller.cooldown=30;
        
        var str;str=0;
        
        
        
        /*if (target=2) and (p_target.p_owner[obj_controller.selecting_planet]<=5) then str=max(imp,pdf);
        if (target=2) and (p_target.p_owner[obj_controller.selecting_planet]>5) then str=imp;
        if (target=2) and (p_target.p_owner[obj_controller.selecting_planet]>5) then str=imp;*/
        
        if (target=2) then str=imp;
        if (target=2.5) then str=pdf;

        if (target=3) then str=mechanicus;
        if (target=5) then str=sisters;
        if (target=6) then str=eldar;
        if (target=7) then str=ork;
        if (target=8) then str=tau;
        if (target=9) then str=tyranids;
        if (target=10) then str=max(traitors,chaos);
        
        // Start bombardment here
        scr_bomb_world(p_target,obj_controller.selecting_planet,target,bomb_score,str);
    }
}

instance_activate_object(obj_star_select);

/* */
}
/*  */
