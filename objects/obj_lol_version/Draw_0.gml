
if (obj_main_menu.stage>2){
    draw_set_alpha(0.5);
    var jg;jg="";
    
    if (global.version<1) then jg="0."+string_replace(string(global.version*100),".","");
    if (global.version>=1) then jg=string(global.version);
    
    draw_set_font(fnt_cul_14);draw_set_color(c_gray);
    draw_set_halign(fa_right);
    draw_text(1598,878,string_hash_to_newline("v"+string(jg)));
    draw_set_halign(fa_left);
    draw_set_alpha(1);
}



