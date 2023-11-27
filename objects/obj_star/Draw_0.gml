// Draws the system name and color codes it based on ownership
if (p_type[1]="Craftworld") and (obj_controller.known[6]=0){
    draw_set_alpha(0);
    draw_set_color(255);
    draw_circle(old_x,old_y,5,0);
    draw_set_alpha(1);
    exit;
}
//big ol temporary way
system_player_ground_forces = array_reduce(p_player, function(prev, curr) {
	return prev + curr	
})
var show=name;

if (global.cheat_debug=true) then show=string(name)+"#"+string(p_problem[1,1])+":"+string(p_timer[1,1])+"#"+string(p_problem[1,2])+":"+string(p_timer[1,2])+"#"+string(p_problem[1,3])+":"+string(p_timer[1,3]);

draw_set_color(c_white);
draw_set_alpha(0.25);
if (x2!=0) then draw_line(x,y,x2,y2);
if (craftworld==0) and (vision==1) then draw_self();
if (craftworld==1) then draw_sprite_ext(spr_craftworld,0,x,y,1,1,point_direction(x,y,room_width/2,room_height/2)+90,c_white,1);
if (space_hulk==1) then draw_sprite_ext(spr_star_hulk,0,x,y,1,1,0,c_white,1);

if (storm>0) then draw_sprite_ext(spr_warp_storm,storm_image,x,y,0.75,0.75,0,c_white,1);

// if (vision=1) then draw_set_alpha(0.5);
// if (vision=0) then draw_set_alpha(0.3);

/*
draw_set_halign(fa_center);
draw_set_font(fnt_menu);
draw_set_color(38144);

// Checks the owner of the planet
switch (owner) {
    case 1:
        draw_set_color(c_white);
        break;
    case 2:
        draw_set_color(c_gray);
        break;
    case 3:
        draw_set_color(c_red); // toaster fuckers
        break;
    case 5:
        draw_set_color(c_white);
        break;
    case 6:
        draw_set_color(33023);
        break;
    case 7:
        draw_set_color(38144); // waagh
        break;
    case 8:
        draw_set_color(117758); // the greater good
        break;
    case 9:
        draw_set_color(7492269); // bug boys
        break;
    case 10:
        draw_set_color(c_purple); // chaos
        break;
    case 13:
        draw_set_color(65408); // Sleepy robots
        break;
}
// if (explored=0){draw_set_color(38144);show="???";}

if (owner!=1){
    draw_set_alpha(0.5);
    if (obj_controller.zoomed==0) then draw_text_transformed(x,y+16,string_hash_to_newline(string(show)),1.3,1.3,0);
    if (obj_controller.zoomed==1) then draw_text_transformed(x,y+16,string_hash_to_newline(string(show)),2,2,0);// was 1.65
}
if (owner==1){
    var siz;
    draw_set_alpha(1);
    if (obj_controller.zoomed==0) then siz=1.3;
    if (obj_controller.zoomed==1) then siz=2;
    
    draw_set_color(c_blue);
    draw_text_transformed(x-1,y+15,string_hash_to_newline(show),siz,siz,0);
    draw_text_transformed(x+1,y+17,string_hash_to_newline(show),siz,siz,0);
    draw_set_color(c_white);
    draw_text_transformed(x,y+16,string_hash_to_newline(show),siz,siz,0);
}
*/

//ad hoc way of determining whether stuff is in view or not...needs work
var cam = view_get_camera(view_current)
var x1 = camera_get_view_x(cam)
var y1 = camera_get_view_y(cam)
var w = x1 + view_get_wport(view_current)
var h = y1 + view_get_hport(view_current)

draw_set_alpha(1);

if rectangle_in_rectangle(ui_node.gui_x, ui_node.gui_y, ui_node.gui_x + ui_node.width , ui_node.gui_y + ui_node.height, x1, y1, w, h) > 0 {
	show_debug_message($"activate {name}")
	ui_node.activate();
} else {
	show_debug_message($"deactivate {name}")
	ui_node.deactivate();
}

ui_node.render(x,y)
draw_set_valign(fa_top)