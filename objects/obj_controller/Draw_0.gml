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
// if (instance_exists(obj_turn_end)) then exit;

var xx =__view_get( e__VW.XView, 0 );
var yy =__view_get( e__VW.YView, 0 );
// Main UI

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