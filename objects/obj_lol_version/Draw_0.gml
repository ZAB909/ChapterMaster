
if (obj_main_menu.stage>2){
    draw_set_alpha(0.5);
    var jg;jg="";
    
    if (global.version!="") jg=global.version;
    else jg= "dev version";
    
    draw_set_font(fnt_cul_14);draw_set_color(c_gray);
    draw_set_halign(fa_right);
    draw_text(1598,878,string_hash_to_newline("v"+jg));
    draw_set_halign(fa_left);
    draw_set_alpha(1);
}



