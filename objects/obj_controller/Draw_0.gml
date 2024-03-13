// Draws the main UI menu. The function is used to highlight if you selected something in the menu
var l_hei=37,l_why=0;

if (instance_exists(obj_ncombat)) then exit;
if (instance_exists(obj_fleet)) then exit;
if (global.load>0) then exit;
if (invis==true) then exit;

if (is_test_map==true){
    draw_set_color(c_yellow);
    draw_set_alpha(0.5);
    draw_line_width(room_width/2,room_height/2,(room_width/2)+lengthdir_x(3000,terra_direction),(room_height/2)+lengthdir_y(3000,terra_direction),4);
    draw_set_alpha(1);
}
// if (instance_exists(obj_turn_end)) then exit;

script_execute(scr_ui_manage,0,0,0,0,0);
script_execute(scr_ui_advisors,0,0,0,0,0);
script_execute(scr_ui_diplomacy,0,0,0,0,0);
script_execute(scr_ui_settings,0,0,0,0,0);
var xx =__view_get( e__VW.XView, 0 );
var yy =__view_get( e__VW.YView, 0 );
// Main UI
if (zoomed==0) and (zui==0){
    draw_sprite(spr_new_ui,0,xx+0,yy+0);
    draw_set_color(c_white);
    // Buttons here
    draw_sprite(spr_ui_but_4,0,xx+1374,yy+8);
    draw_sprite(spr_ui_but_4,0,xx+1484,yy+8);

    menu_buttons.chapter_manage.draw(xx+34,yy+838+y_slide, "Chapter Management",1,1,145)
    menu_buttons.chapter_settings.draw(xx+179,yy+838+y_slide, "Chapter Settings",1,1,145)
    menu_buttons.apoth.draw(xx+357,yy+838+y_slide, "Apothecarium")
    menu_buttons.reclu.draw(xx+473,yy+838+y_slide, "Reclusium")
    menu_buttons.lib.draw(xx+590,yy+838+y_slide, "Librarium")
    menu_buttons.arm.draw(xx+706,yy+838+y_slide, "Armamentarium")
    menu_buttons.recruit.draw(xx+822,yy+838+y_slide, "Recruitment")
    menu_buttons.fleet.draw(xx+938,yy+838+y_slide, "Fleet")
    menu_buttons .diplo.draw(xx+1130,yy+838+y_slide, "Diplomacy",1,1,145)
    menu_buttons .event.draw(xx+1275,yy+838+y_slide, "Event Log",1,1,145)
    menu_buttons .end_turn.draw(xx+1420,yy+838+y_slide, "End Turn",1,1,145);
    
    // Highlight here
    draw_set_blend_mode(bm_add);
    draw_set_alpha(h_options*2);
    if (h_options>0) then draw_sprite(spr_ui_hov_4,0,xx+1374,yy+8+y_slide);
    draw_set_alpha(h_menu*2);
    if (h_menu>0) then draw_sprite(spr_ui_hov_4,0,xx+1484,yy+8+y_slide);
    draw_set_blend_mode(bm_normal);
    draw_set_alpha(1);
    
    // Text here
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_font(fnt_cul_18);
    
    draw_text(xx+1427,yy+14,string_hash_to_newline("Help"));
    draw_text(xx+1537,yy+14,string_hash_to_newline("Menu"));
    
    if (y_slide>0) then draw_set_alpha((100-(y_slide*2))/100);
    
    draw_set_alpha(1);
    draw_sprite(spr_new_banner,0,xx+1439+new_banner_x,yy+62);
    draw_sprite(spr_new_ui_cover,0,xx+0,yy+(900-17));
    // Handles custom chapters
    if (string_count("custom",obj_ini.icon_name)>0){
        var cusl=string_replace(obj_ini.icon_name,"custom","");
        cusl=real(cusl);
        if (obj_cuicons.spr_custom[cusl]>0) and (obj_cuicons.spr_custom_icon[cusl]!=-1){
            draw_sprite_stretched(obj_cuicons.spr_custom_icon[cusl],0,xx+1451+new_banner_x,yy+73,141,141);
        }
    }
    // Handles icon for normal chapters
    if (string_count("custom",obj_ini.icon_name)==0){
        var icon_sprite=spr_icon,icc=obj_ini.icon;
        if (icc<=20) then scr_image("creation",icc,xx+1451+new_banner_x,yy+73,141,141);
        if (icc>20){
            icon_sprite=spr_icon_chapters;
            icc-=19;
            draw_sprite(icon_sprite,icc,xx+1451+new_banner_x,yy+73);
        }
    }
    
    draw_set_color(38144);
    draw_set_font(fnt_menu);
    draw_set_halign(fa_center);
    // Draws the sector name
    draw_text(xx+775,yy+17,string_hash_to_newline("Sector "+string(obj_ini.sector_name)));
    draw_text(xx+775.5,yy+17.5,string_hash_to_newline("Sector "+string(obj_ini.sector_name)));
    
    // Checks if you are penitent
    if (obj_controller.faction_status[eFACTION.Imperium]!="War"){
        if (penitent_max==0){
            draw_text(xx+998,yy+17,string_hash_to_newline("Loyal"));
            draw_text(xx+998,yy+17.5,string_hash_to_newline("Loyal"));
        }
        if (penitent_max>0){
            var endb=0,endb2="";
            endb=min(0,(((penitent_turn+1)*(penitent_turn+1))-120)*-1);
            if (endb<0) then endb2=" "+string(endb);
            draw_set_color(c_red);
            draw_text(xx+998,yy+17,string_hash_to_newline(string(min(100,floor((penitent_current/penitent_max)*100)))+"% Penitent"));
            draw_text(xx+998,yy+17.5,string_hash_to_newline(string(min(100,floor((penitent_current/penitent_max)*100)))+"% Penitent"));
            draw_set_color(38144);
            // TODO Need a tooltip for here to display the actual amounts
        }
    }
    // Sets you to renegade
    if (obj_controller.faction_status[eFACTION.Imperium]=="War"){
        draw_set_color(255);
        draw_text(xx+998,yy+17,string_hash_to_newline("Renegade"));
        draw_text(xx+998,yy+17.5,string_hash_to_newline("Renegade"));
        draw_set_color(38144);
    }
    // Checks if the chapter name is less than 140 chars, adjusts chapter_master_name_width accordingly
    var chapter_master_name_width=1;
    for(var i=0; i<10; i++){
        if ((string_width(string_hash_to_newline(string(global.chapter_name)))*chapter_master_name_width)>140) then chapter_master_name_width-=0.1;
    }

    draw_text_transformed(xx+1520+new_banner_x,yy+208,string_hash_to_newline(string(global.chapter_name)),chapter_master_name_width,1,0);
    draw_text_transformed(xx+1520.5+new_banner_x,yy+208.5,string_hash_to_newline(string(global.chapter_name)),chapter_master_name_width,1,0);
    // Shows the date to be displayed
    var yf="";
    if (year_fraction<10) then yf="00"+string(year_fraction);
    if (year_fraction>=10) and (year_fraction<100) then yf="0"+string(year_fraction);
    if (year_fraction>=100) then yf=string(year_fraction);
    draw_text(xx+1520+new_banner_x,yy+228,string_hash_to_newline(string(check_number)+" "+string(yf)+" "+string(year)+".M"+string(millenium)));
    // Shows the income on the menu
    var inc="";
    if (income_last>0) then inc="+"+string(round(income_last));
    if (income_last<0) then inc=string(round(income_last));
    draw_set_font(fnt_40k_14);
    draw_set_halign(fa_left);
    // Draws the requisition amount
    draw_sprite(spr_new_resource,0,xx+14,yy+16);
    draw_set_color(16291875);
    draw_text(xx+36,yy+16,string_hash_to_newline(string(floor(requisition))+string(inc)));
    draw_text(xx+36.5,yy+16.5,string_hash_to_newline(string(floor(requisition))+string(inc)));
    // Draws forge points number
    draw_sprite_ext(spr_forge_points_icon, 0, xx+158, yy+15, 0.3, 0.3, 0, c_white, 1)
    draw_set_color(#af5a00)
    draw_text(xx+178,yy+16, string(forge_points));
    draw_text(xx+178.5,yy+16.5, string(forge_points));
    // Draws the current loyalty
    draw_sprite(spr_new_resource,1,xx+267,yy+17);
    draw_set_color(1164001);
    draw_text(xx+290,yy+16,string_hash_to_newline(string(loyalty)));
    draw_text(xx+290.5,yy+16.5,string_hash_to_newline(string(loyalty)));
    // Draws the current gene seed
    draw_sprite(spr_new_resource,2,xx+355,yy+17);
    draw_set_color(c_red);
    draw_text(xx+370,yy+16,string_hash_to_newline(string(gene_seed)));
    draw_text(xx+370.5,yy+16.5,string_hash_to_newline(string(gene_seed)));
    // Draws the current marines on your command
    draw_sprite(spr_new_resource,3,xx+475-10,yy+17);
    draw_set_color(16291875);
    draw_text(xx+495-10,yy+16,string_hash_to_newline(string(marines)+"/"+string(command)));
    draw_text(xx+495.5-10,yy+16.5,string_hash_to_newline(string(marines)+"/"+string(command)));
}

draw_set_font(fnt_40k_14b);
draw_set_color(c_red);
draw_set_halign(fa_left);
draw_set_alpha(1);
// Sets up debut mode
if (global.cheat_debug == true){
    draw_text((__view_get((0 << 0), 0) + 1124), (__view_get((1 << 0), 0) + 7), string_hash_to_newline("DEBUG MODE"));
}

script_execute(scr_ui_popup,0,0,0,0,0);


function draw_line(x1, y1, y_slide, variable) {
    l_hei = 37;
    l_why = 0;

    if (variable > 0) {
        if (variable > 94) {
            l_hei = 134 - variable;
            l_why = min(variable - 96, 11);
        }

        draw_line(view_xview[0] + variable + x1, view_yview[0] + 10 + 1 + l_why, view_xview[0] + variable + x1, view_yview[0] + 10 + 37 - l_why);
    }
}