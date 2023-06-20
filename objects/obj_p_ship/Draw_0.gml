var __b__;
__b__ = action_if_variable(name, "", 0);
if !__b__
{
{

if (selected=1){draw_set_color(38144);
    draw_circle(x,y,(sprite_width/2),1);
    draw_circle(x,y,(sprite_width/2)-1,1);
    draw_circle(x,y,(sprite_width/2)+1,1);
    
    if (boarders>0){
        draw_set_color(c_red);
        draw_set_alpha(0.3);
        draw_circle(x,y,400,1);
        
        
        if (instance_exists(obj_en_ship)){
            var e;e=instance_nearest(mouse_x,mouse_y,obj_en_ship);
            if (point_distance(mouse_x,mouse_y,e.x,e.y)<=32){
                obj_cursor.board=1;
            }
            if (point_distance(mouse_x,mouse_y,e.x,e.y)>32){
                obj_cursor.board=0;obj_cursor.image_alpha=1;
            }
        }
    }
    
    draw_set_alpha(1);
}


draw_self();


draw_set_color(38144);
draw_set_font(fnt_info);
draw_set_halign(fa_center);


if (boarders>0){
    // draw_sprite(spr_force_icon,0,x-16,y+12);
    scr_image("force",0,x-16-32,y+12-32,64,64);
    
    draw_set_color(0);
    draw_text(x-16,y+12,string_hash_to_newline(string(boarders)));
    draw_text(x-16-1,y+12-1,string_hash_to_newline(string(boarders)));
    draw_text(x-16+1,y+12+1,string_hash_to_newline(string(boarders)));
    draw_text(x-16+1,y+12,string_hash_to_newline(string(boarders)));
    draw_set_color(c_white);
    draw_text(x-16,y+12,string_hash_to_newline(string(boarders)));
}
draw_set_color(38144);



if (shields<=0){
    if (obj_controller.zoomed=0){if (maxhp!=0) then draw_text(x,y-(sprite_height/2),string_hash_to_newline(string(floor((hp/maxhp)*100))+"%"));}
    if (obj_controller.zoomed=1){if (maxhp!=0) then draw_text_transformed(x,y-sprite_height,string_hash_to_newline(string(floor((hp/maxhp)*100))+"%"),2,2,0);}
}

if (shields>0){
    draw_set_color(c_blue);
    if (obj_controller.zoomed=0){if (maxhp!=0) then draw_text(x,y-(sprite_height/2),string_hash_to_newline(string(floor((shields/maxshields)*100))+"%"));}
    if (obj_controller.zoomed=1){if (maxhp!=0) then draw_text_transformed(x,y-sprite_height,string_hash_to_newline(string(floor((shields/maxshields)*100))+"%"),2,2,0);}
}

if (master_present!=0) then draw_sprite_ext(spr_popup_select,0,x,y,2,2,0,c_white,1);


}
}
