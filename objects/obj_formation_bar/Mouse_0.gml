
if (obj_cursor.dragging==0) and (obj_controller.cooldown<=0) and (mouse_check_button_pressed(mb_left)){
    obj_cursor.dragging=1;
    dragging=true;
    obj_controller.cooldown=9999;
    obj_controller.click=1;
    
    // Save the initial position
    initial_drag_x = x;
    initial_drag_y = y;

    // save crap
    rel_mousex=x-mouse_x;
    rel_mousey=y-mouse_y-1000;
    old_x=x;
    old_y=y;    
}
