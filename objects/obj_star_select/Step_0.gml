

if (obj_controller.popup<3) and (loading=0){
    obj_controller.sel_system_x=0;
    obj_controller.sel_system_y=0;
    obj_controller.selecting_planet=0;
    
    with(obj_star_select){
        instance_destroy();
    }
}



if (loading==1){
    var xx, yy, temp1, dist;
    xx=__view_get( e__VW.XView, 0 )+0;
    yy=__view_get( e__VW.YView, 0 )+0;
    dist=999;
    
    obj_controller.selecting_planet=0;
    button1="";button2="";button3="";button4="";

    if (instance_exists(target)){
        if (target.space_hulk=1) then exit;
    }
    
    if (target.planets>=1) and (obj_controller.cooldown<=0){
        dist=point_distance(xx+159,yy+287,mouse_x,mouse_y);   
        if (dist<=22) then obj_controller.selecting_planet=1; 
    }
    if (target.planets>=2) and (obj_controller.cooldown<=0){
        dist=point_distance(xx+200,yy+287,mouse_x,mouse_y);   
        if (dist<=22) then obj_controller.selecting_planet=2; 
    }
    if (target.planets>=3) and (obj_controller.cooldown<=0){
        dist=point_distance(xx+241,yy+287,mouse_x,mouse_y);   
        if (dist<=22) then obj_controller.selecting_planet=3; 
    }
    if (target.planets>=4) and (obj_controller.cooldown<=0){
        dist=point_distance(xx+282,yy+287,mouse_x,mouse_y);   
        if (dist<=22) then obj_controller.selecting_planet=4; 
    }
}

/* */
/*  */
