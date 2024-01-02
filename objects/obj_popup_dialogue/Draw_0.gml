
// Relative spot
var xx=__view_get(e__VW.XView, 0) + x;
var yy=__view_get(e__VW.YView, 0) + y;

draw_sprite(spr_popup_dialogue,0,xx,yy);

draw_set_font(fnt_40k_14b);
draw_set_color(c_gray);
draw_set_halign(fa_center);

draw_text_ext(xx+150,yy+7,string_hash_to_newline(question),18,260);

if (instance_exists(obj_cursor)){obj_cursor.image_index=0;}
if (scr_hit(xx+19,yy+46,xx+280,yy+70)=true) and (instance_exists(obj_cursor)){obj_cursor.image_index=2;}


draw_set_font(fnt_40k_14);
draw_set_color(c_gray);if (too_high>0) then draw_set_color(c_red);
if (blink<=30) then draw_text(xx+152,yy+50,string_hash_to_newline(string(inputing)+"|"));
if (blink>30) then draw_text(xx+150,yy+50,string_hash_to_newline(string(inputing)));


// Button 1
draw_set_alpha(0.25);draw_set_color(c_black);
draw_rectangle(xx+26,yy+103,xx+126,yy+123,0);
draw_set_color(c_gray);
draw_set_alpha(0.5);draw_rectangle(xx+26,yy+103,xx+126,yy+123,1);
draw_set_alpha(0.25);draw_rectangle(xx+27,yy+104,xx+125,yy+122,1);
draw_set_alpha(1);draw_text(xx+76,yy+105,string_hash_to_newline("Cancel"));
if (scr_hit(xx+26,yy+103,xx+126,yy+123)=true){
    draw_set_alpha(0.1);draw_set_color(c_white);
    draw_rectangle(xx+26,yy+103,xx+126,yy+123,0);
    draw_set_alpha(1);if (instance_exists(obj_cursor)){obj_cursor.image_index=1;}
    if (left_mouse=1){keyboard_string="0";inputing="0";fin=true;instance_destroy();
    if (instance_exists(obj_controller)){obj_controller.cooldown=8;}}
}

// Button 2
draw_set_alpha(0.25);draw_set_color(c_black);
draw_rectangle(xx+175,yy+103,xx+275,yy+123,0);
draw_set_color(c_gray);
draw_set_alpha(0.5);draw_rectangle(xx+175,yy+103,xx+275,yy+123,1);
draw_set_alpha(0.25);draw_rectangle(xx+176,yy+104,xx+274,yy+122,1);
draw_set_alpha(1);draw_text(xx+225,yy+105,string_hash_to_newline("Accept"));
if (scr_hit(xx+175,yy+103,xx+275,yy+123)=true){
    draw_set_alpha(0.1);draw_set_color(c_white);
    draw_rectangle(xx+175,yy+103,xx+275,yy+123,0);
    draw_set_alpha(1);if (instance_exists(obj_cursor)){obj_cursor.image_index=1;}
    if (left_mouse=1) then fin=true;
}

// 26,93


