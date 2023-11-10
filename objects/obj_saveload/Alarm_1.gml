obj_controller.menu = 0;
obj_controller.zui = 0;
obj_controller.invis = false;
obj_cursor.image_alpha = 1;
obj_controller.cooldown = 20;

if (global.restart > 0) {
    instance_create(0, 0, obj_restart_vars);
    scr_restart_variables(3);

    with(obj_ini) {
        instance_destroy();
    }
    room_goto(Creation);
}

instance_destroy();