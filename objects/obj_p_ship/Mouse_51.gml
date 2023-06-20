
if (selected=1) and (!instance_exists(obj_circular)) and (obj_fleet.control!=0){
    var stahp;stahp=0;
    
    if (obj_fleet.start=5) and (obj_controller.zoomed=0){
        if (mouse_x>=__view_get( e__VW.XView, 0 )+12) and (mouse_y>=__view_get( e__VW.YView, 0 )+436) and (mouse_x<__view_get( e__VW.XView, 0 )+48) and (mouse_y<__view_get( e__VW.YView, 0 )+480) then stahp=1;
    }
    if (obj_fleet.start=5) and (obj_controller.zoomed=1){
        if (mouse_x>24) and (mouse_y>872) and (mouse_x<90) and (mouse_y<960) then stahp=1;
    }// and (room_speed<90)
    
    if (stahp=0){
        paction="";
        /*target_x=mouse_x;
        target_y=mouse_y;
        
        if (instance_exists(obj_en_ship)){
            var tee,tee_dis;tee=0;tee_dis=0;
            tee=instance_nearest(mouse_x,mouse_y,obj_en_ship);
            tee_dis=point_distance(mouse_x,mouse_y,tee.x,tee.y);
            
            if (tee_dis<=40){
                paction="attack";
                target=tee;
            }
            if (tee_dis>40){
                paction="turn";
            }
        }
        if (!instance_exists(obj_en_ship)){
            paction="turn";
        }*/
        
        instance_create(20,20,obj_circular);
    }
}


/* */
/*  */
