
draw_set_alpha(1);
// draw_sprite(spr_defeat,global.defeat,331,73);
scr_image("defeat",global.defeat,331,73,938,554);

var xx,yy,cus;
xx=331;yy=93;
cus=false;

if (string_count("custom",global.icon_name)>0) then cus=true;
if (cus=true){
    var cusl;cusl=string_replace(global.icon_name,"custom","");cusl=real(cusl);
    if (obj_cuicons.spr_custom[cusl]>0) and (obj_cuicons.spr_custom_icon[cusl]!=-1){
        draw_sprite_stretched(obj_cuicons.spr_custom_icon[cusl],0,728,83,135,135);
    }
}
if (cus=false){
    // if (global.icon<=20) then draw_sprite_stretched(spr_icon,global.icon,728,83,135,135);
    if (global.icon<=20) then scr_image("creation",global.icon,728,83,135,135);
    if (global.icon>20) then draw_sprite_stretched(spr_icon_chapters,global.icon-19,728,83,135,135);
}
// 728,103

draw_set_color(c_black);
draw_set_alpha(fade/faded);
draw_rectangle(0,0,room_width,room_height,0);
draw_set_alpha(fadeout/30);
draw_rectangle(0,0,room_width,room_height,0);


