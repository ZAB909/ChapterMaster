xx = __view_get( e__VW.XView, 0 );
yy = __view_get( e__VW.YView, 0 );
ww = __view_get( e__VW.WView, 0 );
hh = __view_get( e__VW.HView, 0 );

// Sets the bombard target, its forces and draws the ships wich will bombard said target
bomb_window = {
    x1: 0,
    y1: 0,
    w: 480,
    h: 365,
    x2: 0,
    y2: 0,
    x3: 0,
    y3: 0,
}
bomb_window.x1 = xx + (ww/2) - bomb_window.w/2;
bomb_window.y1 = yy + (hh/2) - bomb_window.h/2;
bomb_window.x2 = bomb_window.x1 + bomb_window.w;
bomb_window.y2 = bomb_window.y1 + bomb_window.h;
bomb_window.x3 = bomb_window.x1 + (bomb_window.w / 2);
bomb_window.y3 = bomb_window.y1 + (bomb_window.h / 2);

// Draws the bombard option menu
if (max_ships>0)and (instance_exists(obj_star_select)){
    // Draw the background
    draw_set_color(c_white);
    draw_sprite_stretched(spr_data_slate_back, 0, bomb_window.x1, bomb_window.y1, bomb_window.w, bomb_window.h);
    draw_set_color(38144);
    draw_rectangle(bomb_window.x1+1, bomb_window.y1+1, bomb_window.x2-1, bomb_window.y2-1, 1);
    draw_rectangle(bomb_window.x1+2, bomb_window.y1+2, bomb_window.x2-2, bomb_window.y2-2, 1);

    // Draw the header
    draw_set_halign(fa_left);
    draw_set_font(fnt_40k_30b);
    draw_text(bomb_window.x1+12, bomb_window.y1+10,("Bombardment"));
    draw_text(bomb_window.x1+12, bomb_window.y1+50,("Target Planet: "+string(p_target.name)+" "+string(obj_controller.selecting_planet)));    
    
    // Draw the select all button
    draw_set_font(fnt_menu);
    var sel_all_label = ""
    if (all_sel==0){
        sel_all_label = " ";
    }else if (all_sel==1){
        sel_all_label = "x";
    }
    var sel_all_button = draw_unit_buttons([bomb_window.x2-55, bomb_window.y1+80, bomb_window.x2-40, bomb_window.y1+95],sel_all_label,[1,1],38144,fa_center,fnt_40k_14b);
    if (point_and_click(sel_all_button)){
        for(var i=1; i<=30; i++){
            if (obj_ini.ship[i]!="") and (ship_all[i]==all_sel){
                ship_all[i]=!all_sel;
                ships_selected=all_sel?ships_selected-1:ships_selected+1;
            }
        }
        all_sel=!all_sel;
    }
    // Draw the current selection
    draw_set_halign(fa_left);
    draw_set_font(fnt_info);
    var sel="";
    sel=(ships_selected);
    var curr_sel_string = $"Current Selection: {sel} ships"
    draw_text_bold(bomb_window.x1+12, bomb_window.y2-106,curr_sel_string);

    // Draw the target info
    var hers, influ, poppy;

    hers=p_target.p_heresy[obj_controller.selecting_planet]+p_target.p_heresy_secret[obj_controller.selecting_planet];
    influ=p_target.p_influence[obj_controller.selecting_planet];
    if (p_target.p_large[obj_controller.selecting_planet]==1) then poppy=string(p_target.p_population[obj_controller.selecting_planet])+"B";
    if (p_target.p_large[obj_controller.selecting_planet]==0) then poppy=string(scr_display_number(p_target.p_population[obj_controller.selecting_planet]));
    
    draw_text_bold(bomb_window.x1+12, bomb_window.y2-66,("Population: "+string(poppy)));
    
    if (p_target.sprite_index!=spr_star_hulk){
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
        
        var target_string = "Target: " + string(t_name);
        draw_text_bold(bomb_window.x1+12, bomb_window.y2-46, target_string);
        if (targets>1){
            draw_sprite_ext(spr_arrow,0,bomb_window.x1+12+string_width(target_string), bomb_window.y2-46,0.75,0.75,0,c_white,1);
            draw_sprite_ext(spr_arrow,1,bomb_window.x1+12+string_width(target_string), bomb_window.y2-46,0.75,0.75,0,c_white,1);
        }
        var strength_string = $"Strength: {string(str_string)} ({string(target)})";
        draw_text_bold(bomb_window.x1+12, bomb_window.y2-26,strength_string);
        
    }

    
    if (sel!=""){
        bombard_button = draw_unit_buttons([bomb_window.x2-110, bomb_window.y2-40],"Bombard!",[1,1],38144,fa_center,fnt_40k_14b)
    }
    var cancel_button = draw_unit_buttons([bomb_window.x2-180, bomb_window.y2-40],"Cancel",[1,1],38144,fa_center,fnt_40k_14b);
    if (obj_controller.cooldown<=0){
        if( point_and_click(cancel_button)){
            obj_controller.cooldown=8;
            with(obj_bomb_select){instance_destroy();}
            instance_destroy();
        }
    }
}

var ship_index=0,why=0,num="";
var buttonSpacingX = 106; // adjust as needed
var buttonSpacingY = 21; // adjust as needed
var alpha = 1;
var ship_button_pos;
// Iterate over the 6 rows
for (var row = 0; row < 6; row++) {
    // Iterate over the 4 columns in each row
    for (var col = 0; col < 4; col++) {
        // Check if the ship at the current index is not empty
        while (ship_index < array_length(ship) - 1 && ship[ship_index] == "") {
            ship_index++;
        }
        // Check if ship_index is still within range
        if (ship_index < array_length(ship)) && ship[ship_index] != "" {
            // If the ship at the current index is 0, set the drawing alpha to 0.35
            if (ship_all[ship_index] == 0) {
                var alpha = (0.5);
            }
            // Delete the string from the 20th character onwards
            num = string_delete(ship[ship_index], 20, 999);
            // Calculate button position based on row and column
            var buttonX = bomb_window.x1 + 20 + col * buttonSpacingX;
            var buttonY = bomb_window.y1 + 110 + row * buttonSpacingY;
            // Draw the unit buttons
            ship_button_pos = draw_unit_buttons([buttonX, buttonY, buttonX+105, buttonY+20], string_truncate(num, 200), [1,1], 38144, fa_center, fnt_40k_10,alpha)
            if point_and_click(ship_button_pos){
                ship_all[ship_index] = !ship_all[ship_index];
                ships_selected = ship_all[ship_index] ?ships_selected+1: ships_selected-1;
            }
            ship_index++; // Increment the ship index after each iteration            
        }
        // Move to the next ship
    }
}