

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
    
    for (var i =0;i<target.planets;i++){
        if (point_distance(xx+159+(i*41),yy+287,mouse_x,mouse_y)<=22){
            obj_controller.selecting_planet=i+1;
            if (mouse_check_button_pressed(mb_left)){
                if (obj_controller.menu==1 && obj_controller.managing>0 && obj_controller.view_squad && obj_controller.selecting_planet>0){
                    var company_data = obj_controller.company_data;
                    var squad_index = company_data.company_squads[company_data.cur_squad];
                    var current_squad=obj_ini.squads[squad_index];
                    current_squad.set_location(loading_name,0,obj_controller.selecting_planet);
                    current_squad.assignment={
                        type:mission,
                        location:target.name,
                        ident:obj_controller.selecting_planet,
                    };
                    var operation_data = {
                        type:"squad", 
                        reference:squad_index,
                        job:mission,
                        task_time : 0
                    };
                    array_push(target.p_operatives[obj_controller.selecting_planet],operation_data)
                }
                instance_destroy();
            }
        }            
    }
}

/* */
/*  */
