var __b__;
__b__ = action_if_variable(start, 5, 0);
if __b__
{

if (obj_controller.cooldown<=0){
    obj_controller.cooldown=8;
    with(obj_controller){scr_zoom();}
}


}
