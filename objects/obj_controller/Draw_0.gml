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
if (is_struct(dungeon)){
    dungeon.draw();
} else {
    controller_standard_draw();
}