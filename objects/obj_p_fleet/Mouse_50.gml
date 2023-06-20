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

/*if (obj_controller.popup=1) or (obj_controller.popup=2) or (obj_controller.popup=3){
    if (obj_controller.fleet_minimized=0) and (mouse_x>view_xview[0]+32) and (mouse_y>view_yview[0]+48) and (mouse_x<view_xview[0]+298) and (mouse_y<view_yview[0]+416){
    exi=1;}
    if (obj_controller.fleet_minimized=1) and (mouse_x>view_xview[0]+32) and (mouse_y>view_yview[0]+48) and (mouse_x<view_xview[0]+298) and (mouse_y<view_yview[0]+66){
    exi=1;}
}*/
/*if (obj_controller.popup=3){
    if (mouse_x>view_xview[0]+32) and (mouse_y>view_yview[0]+42) and (mouse_x<view_xview[0]+351) and (mouse_y<view_yview[0]+281) then exit;
}*/

if (exi=1) then exit;


if (obj_controller.popup=1) and (obj_controller.cooldown<=0){obj_controller.selected=0;obj_controller.popup=0;selected=0;}
if (m_dist>24) and (selected=1){obj_controller.selected=0;obj_controller.popup=0;selected=0;}

if (m_dist<=24) and (obj_controller.menu=0) then alarm[3]=1;

/*if (!instance_exists(obj_fleet_select)){instance_create(x,y,obj_fleet_select);obj_fleet_select.owner=self.owner;}
if (instance_exists(obj_fleet_select)){obj_fleet_select.owner=self.owner;obj_fleet_select.x=self.x;obj_fleet_select.y=self.y;}*/


/* */
}
}
/*  */
