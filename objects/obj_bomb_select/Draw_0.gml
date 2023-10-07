// Sets the bombard target, its forces and draws the ships wich will bombard said target
var xx, yy;
xx=__view_get( e__VW.XView, 0 );
yy=__view_get( e__VW.YView, 0 );

// Draws the bombard option menu
if (max_ships>0)and (instance_exists(obj_star_select)){
    draw_set_halign(fa_center);
    draw_set_font(fnt_fancy);
    draw_set_color(38144);
    
    draw_text_transformed(xx+270,yy+49,string_hash_to_newline("Bombard!"),1.5,1.5,0);
    draw_text_transformed(xx+270,yy+80,string_hash_to_newline("Planet "+string(p_target.name)+" "+string(obj_controller.selecting_planet)),1,1,0);    
    
    draw_set_halign(fa_left);
    draw_set_font(fnt_menu);
    if (all_sel==0){
        draw_set_alpha(0.5);
        draw_text(xx+76,yy+81,string_hash_to_newline("[ ]"));
    }
    if (all_sel==1){
        draw_set_alpha(1);
        draw_text(xx+76,yy+81,string_hash_to_newline("[X]"));
    }
    draw_set_alpha(1);
    draw_set_font(fnt_info);
    
    draw_text(xx+310,yy+218,string_hash_to_newline("Current Selection:"));
    draw_text(xx+310.5,yy+218.5,string_hash_to_newline("Current Selection:"));
    
    var hers, influ, poppy;

    hers=p_target.p_heresy[obj_controller.selecting_planet]+p_target.p_heresy_secret[obj_controller.selecting_planet];
    influ=p_target.p_influence[obj_controller.selecting_planet];
    if (p_target.p_large[obj_controller.selecting_planet]==1) then poppy=string(p_target.p_population[obj_controller.selecting_planet])+"B";
    if (p_target.p_large[obj_controller.selecting_planet]==0) then poppy=string(scr_display_number(p_target.p_population[obj_controller.selecting_planet]));
    
    draw_text(xx+310,yy+283,string_hash_to_newline("Pop.: "+string(poppy)));
    draw_text(xx+310.5,yy+283.5,string_hash_to_newline("Pop.:"));
    
    if (p_target.sprite_index!=spr_star_hulk){
        draw_text(xx+310,yy+317,string_hash_to_newline("Target: "));
        draw_text(xx+310,yy+317.5,string_hash_to_newline("Target: "));
        
        draw_set_halign(fa_center);
        // TODO a centralised point to be able to fetch display names from factions identifying number
        var t_name = "";
        switch (target) {
            case 2:
                t_name = "Imperial Forces";
                break;
            case 2.5:
                if (p_target.p_owner[obj_controller.selecting_planet] == 8) {t_name = "Gue'la Forces";}
                break;
            case 3:
                t_name = "Mechanicus";
                break;
            case 5:
                t_name = "Ecclesiarchy";
                break;
            case 6:
                t_name = "Eldar";
                break;
            case 7:
                t_name = "Orks";
                break;
            case 8:
                t_name = "Tau";
                break;
            case 9:
                t_name = "Tyranids";
                break;
            case 10:
                t_name = "Chaos";
                break;
            case 13:
                t_name = "Necrons";
                break;
            default:
                t_name = "";
                break;
        }
        
        draw_text(xx+408,yy+317,string_hash_to_newline(string(t_name)));
        draw_set_halign(fa_left);
        
        var str=0,str_string="";
        // TODO a centralised point to be able to fetch display names from factions identifying number
        switch (target) {
            case 2:
                str = imp;
                break;
            case 2.5:
                str = pdf;
                break;
            case 3:
                str = mechanicus;
                break;
            case 5:
                str = sisters;
                break;
            case 6:
                str = eldar;
                break;
            case 7:
                str = ork;
                break;
            case 8:
                str = tau;
                break;
            case 9:
                str = tyranids;
                break;
            case 10:
                str = max(traitors, chaos);
                break;
            case 13:
                str = necrons;
                break;
            default:
                str = 0;
                break;
        }

        switch (str) {
            case 1:
                str_string = "Minimal";
                break;
            case 2:
                str_string = "Sparse";
                break;
            case 3:
                str_string = "Moderate";
                break;
            case 4:
                str_string = "Numerous";
                break;
            case 5:
                str_string = "Very Numerous";
                break;
            case 6:
                str_string = "Overwhelming";
                break;
            default:
                str_string = "";
                break;
        }
        
        draw_text(xx+310,yy+351,string_hash_to_newline("Strength: "+string(str_string)));
        draw_text(xx+310.5,yy+351.5,string_hash_to_newline("Strength:"));
        
        if (targets>1){
            draw_sprite_ext(spr_arrow,0,xx+309,yy+332,0.75,0.75,0,c_white,1);
            draw_sprite_ext(spr_arrow,1,xx+493,yy+332,0.75,0.75,0,c_white,1);
        }
    }
        
    draw_set_font(fnt_tiny);
    
    var sel="";
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

var ship_index=0,why=0,num="";

for (var j = 0; j < 6; j++) {
    for (var k = 0; k < 4; k++) {
        if (ship[ship_index] != "") {
            if (ship_all[ship_index] == 0) {
                draw_set_alpha(0.35);
            }
            draw_rectangle(xx + 47 + k * 113, yy + 107 + why, xx + 161 + k * 113, yy + 122 + why, 1);
            num = string_delete(ship[ship_index], 20, 999);
            draw_text(xx + 49 + k * 113, yy + 109 + why, string_hash_to_newline(string(num)));
            draw_set_alpha(1);
        }
        ship_index++;
    }
    why += 18;
}
