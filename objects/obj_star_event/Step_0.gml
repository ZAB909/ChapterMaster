

if (instance_exists(obj_controller)){
    if (obj_controller.zoomed=1){image_xscale=2;image_yscale=2;}
}
if (instance_exists(obj_controller)){
    if (obj_controller.zoomed=0){image_xscale=1;image_yscale=1;}
}


if (col="green") then sprite_index=spr_happenings_green;
if (col="red") then sprite_index=spr_happenings_red;
if (col="purple") then sprite_index=spr_happenings_purple;
if (col="blue") then sprite_index=spr_happenings_blue;


