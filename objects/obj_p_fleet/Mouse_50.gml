var __b__;
__b__ = action_if_number(obj_drop_select, 0, 0);
if __b__
{
__b__ = action_if_number(obj_bomb_select, 0, 0);
if __b__
{


var m_dist, exi;exi=0;
if (instance_exists(obj_fleet_show)) and (obj_controller.cooldown<=0){
    m_dist=point_distance(x,y,obj_fleet_show.x,obj_fleet_show.y);
    if (m_dist<=32) then with(obj_fleet_show){instance_destroy();}
}
m_dist=point_distance(x,y,mouse_x,mouse_y);


if (scr_void_click()=false) then exit;


if ((obj_controller.zoomed=0) and (mouse_y<__view_get( e__VW.YView, 0 )+60)) or (obj_controller.menu!=0) then exi=1;
if ((obj_controller.zoomed=0) and (mouse_y>__view_get( e__VW.YView, 0 )+836)) or (obj_controller.menu!=0) then exi=1;

if (exi=1) then exit;


if (obj_controller.popup=1) and (obj_controller.cooldown<=0){obj_controller.selected=0;obj_controller.popup=0;selected=0;}
if (m_dist>24) and (selected=1){obj_controller.selected=0;obj_controller.popup=0;selected=0;}

if (m_dist<=24) and (obj_controller.menu=0) then alarm[3]=1;

}
}
/*  */
                                                             