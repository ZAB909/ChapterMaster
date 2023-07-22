


if (instance_exists(obj_temp1)){
    var tempy, tempy_d, biggy;
    tempy=0;tempy_d=9999;biggy=0;

    tempy=instance_nearest(x,y,obj_temp1);
    tempy_d=point_distance(x,y,tempy.x,tempy.y);
    
    if (tempy_d>10) and (tempy_d<=180){// Nearby star system
        var i;i=0;    
        repeat(4){
            i+=1;
            if (p_type[i]="Forge") and (p_owner[i]=3) then obj_controller.income_forge+=4;
            if (p_type[i]="Agri") and (p_owner[i]=2) then obj_controller.income_agri+=2;
        }
        // if (tempy_d<5) then instance_deactivate_object(self);
    }
    
    biggy=instance_nearest(obj_temp1.x,obj_temp1.y,obj_star);
    if (biggy.owner=1) and (tempy_d>180) and ((biggy.buddy=id) or (buddy=biggy)){
        var i;i=0;
        repeat(4){
            i+=1;
            if (p_type[i]="Forge") and (p_owner[i]=3) then obj_controller.income_forge+=4;
            if (p_type[i]="Agri") and (p_owner[i]=2) then obj_controller.income_agri+=2;
        }
    }
    
    
    
    
}

