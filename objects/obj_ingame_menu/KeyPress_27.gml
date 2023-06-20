
if (instance_number(obj_saveload)=0) and (settings=0){
    if (instance_exists(obj_controller)){obj_controller.cooldown=20;}
    with(obj_new_button){instance_destroy();}
    instance_destroy();
}

