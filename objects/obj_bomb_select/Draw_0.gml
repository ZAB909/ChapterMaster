
var xx, yy;
xx=__view_get( e__VW.XView, 0 );
yy=__view_get( e__VW.YView, 0 );

// scr_image("purge",0,xx+32,yy+42,497,371);
// draw_sprite(spr_purge_2,0,xx+32,yy+42);

if (max_ships>0)and (instance_exists(obj_star_select)){
    draw_set_halign(fa_center);
    draw_set_font(fnt_fancy);
    draw_set_color(38144);
    
    draw_text_transformed(xx+270,yy+49,string_hash_to_newline("Bombard!"),1.5,1.5,0);
    draw_text_transformed(xx+270,yy+80,string_hash_to_newline("Planet "+string(p_target.name)+" "+string(obj_controller.selecting_planet)),1,1,0);    
    
    draw_set_halign(fa_left);
    draw_set_font(fnt_menu);
    if (all_sel=0){draw_set_alpha(0.5);draw_text(xx+76,yy+81,string_hash_to_newline("[ ]"));}
    if (all_sel=1){draw_set_alpha(1);draw_text(xx+76,yy+81,string_hash_to_newline("[X]"));}
    draw_set_alpha(1);
    draw_set_font(fnt_info);
    
    draw_text(xx+310,yy+218,string_hash_to_newline("Current Selection:"));
    draw_text(xx+310.5,yy+218.5,string_hash_to_newline("Current Selection:"));
    
    
    var hers;
    var influ;
    var poppy;
    hers=p_target.p_heresy[obj_controller.selecting_planet]+p_target.p_heresy_secret[obj_controller.selecting_planet];
    influ=p_target.p_influence[obj_controller.selecting_planet];
    if (p_target.p_large[obj_controller.selecting_planet]=1) then poppy=string(p_target.p_population[obj_controller.selecting_planet])+"B";
    if (p_target.p_large[obj_controller.selecting_planet]=0) then poppy=string(scr_display_number(p_target.p_population[obj_controller.selecting_planet]));
    
    
    
    
    draw_text(xx+310,yy+283,string_hash_to_newline("Pop.: "+string(poppy)));
    draw_text(xx+310.5,yy+283.5,string_hash_to_newline("Pop.:"));
    
    
    
    if (p_target.sprite_index!=spr_star_hulk){
        draw_text(xx+310,yy+317,string_hash_to_newline("Target: "));
        draw_text(xx+310,yy+317.5,string_hash_to_newline("Target: "));
        
        draw_set_halign(fa_center);
        
        var t_name;t_name="";
        if (target=2) then t_name="Imperial Forces";
        if (target=2.5) and (p_target.p_owner[obj_controller.selecting_planet]=8) then t_name="Gue'la Forces";
        if (target=3) then t_name="Mechanicus";
        if (target=5) then t_name="Ecclesiarchy";
        if (target=6) then t_name="Eldar";
        if (target=7) then t_name="Orks";
        if (target=8) then t_name="Tau";
        if (target=9) then t_name="Tyranids";
        if (target=10) then t_name="Chaos";
        if (target=13) then t_name="Necrons";
        
        draw_text(xx+408,yy+317,string_hash_to_newline(string(t_name)));
        draw_set_halign(fa_left);
        
        var str, str_string;str=0;str_string="";
        // if (target=2) then str=max(imp,pdf);
        if (target=2) then str=imp;
        if (target=2.5) then str=pdf;
        if (target=3) then str=mechanicus;
        if (target=5) then str=sisters;
        if (target=6) then str=eldar;
        if (target=7) then str=ork;
        if (target=8) then str=tau;
        if (target=9) then str=tyranids;
        if (target=10) then str=max(traitors,chaos);
        if (target=13) then str=necrons;
        
        if (str=1) then str_string="Minimal";
        if (str=2) then str_string="Sparse";
        if (str=3) then str_string="Moderate";
        if (str=4) then str_string="Numerous";
        if (str=5) then str_string="Very Numerous";
        if (str=6) then str_string="Overwhelming";
        
        draw_text(xx+310,yy+351,string_hash_to_newline("Strength: "+string(str_string)));
        draw_text(xx+310.5,yy+351.5,string_hash_to_newline("Strength:"));
        
        if (targets>1){
            draw_sprite_ext(spr_arrow,0,xx+309,yy+332,0.75,0.75,0,c_white,1);
            draw_sprite_ext(spr_arrow,1,xx+493,yy+332,0.75,0.75,0,c_white,1);
        }
    }
    
    
    draw_set_font(fnt_tiny);
    
    var sel;sel="";
    sel=string(ships_selected)+" ships";
    draw_text_ext(xx+310,yy+234,string_hash_to_newline(string(sel)),-1,206);
    
    
    draw_set_font(fnt_small);
    draw_set_halign(fa_left);
    
    
    
    
    if (sel!=""){
        draw_set_halign(fa_center);
        draw_set_font(fnt_menu);
        draw_set_color(38144);
        
        draw_rectangle(xx+310,yy+378,xx+444,yy+403,1);draw_set_alpha(0.5);
        draw_rectangle(xx+311,yy+379,xx+443,yy+402,1);draw_set_alpha(1);
        
        draw_text(xx+379,yy+382,string_hash_to_newline("Bombard!"));
        draw_set_halign(fa_left);
    }
    
}


draw_set_font(fnt_tiny);
draw_set_halign(fa_left);

var i, why, num;i=-3;why=0;num="";
repeat(6){i+=4;
    if (ship[i]!=""){
        if (ship_all[i]=0) then draw_set_alpha(0.35);
        draw_rectangle(xx+47,yy+107+why,xx+161,yy+122+why,1);
        num=string_delete(ship[i],20,999);
        draw_text(xx+49,yy+109+why,string_hash_to_newline(string(num)));
        draw_set_alpha(1);
    }
    if (ship[i+1]!=""){
        if (ship_all[i+1]=0) then draw_set_alpha(0.35);
        draw_rectangle(xx+164,yy+107+why,xx+278,yy+122+why,1);
        num=string_delete(ship[i+1],20,999);
        draw_text(xx+166,yy+109+why,string_hash_to_newline(string(num)));
        draw_set_alpha(1);
    }
    if (ship[i+2]!=""){
        if (ship_all[i+2]=0) then draw_set_alpha(0.35);
        draw_rectangle(xx+281,yy+107+why,xx+395,yy+122+why,1);
        num=string_delete(ship[i+2],20,999);
        draw_text(xx+283,yy+109+why,string_hash_to_newline(string(num)));
        draw_set_alpha(1);
    }
    if (ship[i+3]!=""){
        if (ship_all[i+3]=0) then draw_set_alpha(0.35);
        draw_rectangle(xx+398,yy+107+why,xx+512,yy+122+why,1);
        num=string_delete(ship[i+3],20,999);
        draw_text(xx+400,yy+109+why,string_hash_to_newline(string(num)));
        draw_set_alpha(1);
    }
    why+=18;
}



