var __b__;
__b__ = action_if_number(obj_saveload, 0, 0);
if __b__
{
__b__ = action_if_number(obj_drop_select, 0, 0);
if __b__
{
__b__ = action_if_number(obj_bomb_select, 0, 0);
if __b__
{


var m_dist;
m_dist=point_distance(x,y,mouse_x,mouse_y);

if (obj_controller.cooldown>0) then exit;
if ((obj_controller.zoomed=0) and (mouse_y<__view_get( e__VW.YView, 0 )+62)) or (obj_controller.menu!=0) then exit;
if ((obj_controller.zoomed=0) and (mouse_y>__view_get( e__VW.YView, 0 )+830)) or (obj_controller.menu!=0) then exit;
if (p_type[1]="Craftworld") and (obj_controller.known[6]=0) then exit;
if (vision=0) then exit;

/*if (instance_exists(obj_fleet_select)){
    var free,z;free=1;z=obj_fleet_select;
    if (mouse_x>=view_xview[0]+z.void_x) and (mouse_y>=view_yview[0]+z.void_y) 
    and (mouse_x<view_xview[0]+z.void_x+z.void_wid) and (mouse_y<view_yview[0]+z.void_y+z.void_hei) and (obj_controller.fleet_minimized=0) then free=0;
    
    if (mouse_x>=view_xview[0]+z.void_x) and (mouse_y>=view_yview[0]+z.void_y) 
    and (mouse_x<view_xview[0]+z.void_x+z.void_wid) and (mouse_y<view_yview[0]+137) and (obj_controller.fleet_minimized=1) then free=0;
    if (free=0) then exit;
}

if (obj_controller.popup=3){// Prevent hitting through the planet select
    if (mouse_x>view_xview[0]+27) and (mouse_y>view_yview[0]+166) and (mouse_x<view_xview[0]+346) and (mouse_y<view_yview[0]+458) then exit;
}
if (obj_controller.selecting_planet>0){// This prevents clicking onto a new star by pressing the buttons or planet panel
    var xx,yy;xx=view_xview[0]+0;yy=view_yview[0]+0;
    if (scr_hit(xx+27,yy+166,xx+727,yy+458)) and (instance_exists(obj_star_select)){if (obj_star_select.button1!="") then exit;}
    if (scr_hit(xx+348,yy+461,xx+348+246,yy+461+26)) and (instance_exists(obj_star_select)){if (obj_star_select.button1!="") then exit;}
    if (scr_hit(xx+348,yy+489,xx+348+246,yy+489+26)) and (instance_exists(obj_star_select)){if (obj_star_select.button2!="") then exit;}
    if (scr_hit(xx+348,yy+517,xx+348+246,yy+517+26)) and (instance_exists(obj_star_select)){if (obj_star_select.button3!="") then exit;}
    if (scr_hit(xx+348,yy+545,xx+348+246,yy+545+26)) and (instance_exists(obj_star_select)){if (obj_star_select.button4!="") then exit;}
}*/


if (scr_void_click()=false) then exit;


/*if (obj_controller.selecting_planet=0) and (obj_controller.zoomed=1) and (m_dist<40) and (obj_controller.cooldown<=0){
    obj_controller.cooldown=8;
    with(obj_controller){scr_zoom();}
    obj_controller.x=x;
    obj_controller.y=y;
    
    // var mx,my;
    // mx=0;my=0;
    // mx=point_distance(view_xview[0],0,x,0);
    // my=point_distance(0,y,0,view_yview[0]);
    // window_mouse_set(view_xview[0]+mx,view_yview[0]+my);
    
    exit;
}*/





if ((obj_controller.zoomed=0) and (m_dist<20)) or ((obj_controller.zoomed=1) and (m_dist<40)) and (obj_controller.cooldown<=0){
    if (mouse_x<=self.x+24) and (mouse_y>=self.y-24){// This should prevent overlap with fleet object

    
    
    if (obj_controller.zoomed=1){obj_controller.x=self.x;obj_controller.y=self.y;}

    
    alarm[3]=1;
    
    
    
    
    }
    
}


/* */
}
}
}
/*  */
