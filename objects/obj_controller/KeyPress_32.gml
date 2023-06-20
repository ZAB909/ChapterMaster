var __b__;
__b__ = action_if_number(obj_ncombat, 0, 0);
if __b__
{
__b__ = action_if_number(obj_popup, 0, 0);
if __b__
{
__b__ = action_if_variable(cooldown, 500, 1);
if __b__
{



if (obj_controller.menu=0) or ((obj_controller.menu=999) and (instance_exists(obj_ncombat))){




if (instance_exists(obj_ncombat)){
    if (obj_ncombat.start=7) then exit;
}








var onceh;
onceh=0;

if (zoomed=0) and (onceh=0){zoomed=1;onceh=1;__view_set( e__VW.Visible, 0, false );__view_set( e__VW.Visible, 1, true );obj_cursor.image_xscale=2;obj_cursor.image_yscale=2;}
if (zoomed=1) and (onceh=0){zoomed=0;onceh=1;__view_set( e__VW.Visible, 0, true );__view_set( e__VW.Visible, 1, false );obj_cursor.image_xscale=1;obj_cursor.image_yscale=1;}



}

}
}
}
