function scr_random_find(argument0, argument1, argument2, argument3) {

	// argument0: owner
	// argument1: planet?
	// argument2: ship_action (if ship)
	// argument3: feature type?

	// This creates obj_temp5 near an object or fleet based on the criteria

	var plane;
	plane=0;

	if (argument1=true) then plane=1;
	if (plane=1){
	    with(obj_star){
	        if ((p_owner[1]=argument0) or (p_owner[2]=argument0) or (p_owner[3]=argument0) or (p_owner[4]=argument0)) and (argument0!=0) and (storm=0){
	            var chi;chi[0]=0;
	            chi[1]=p_owner[1];
	            chi[2]=p_owner[2];
	            chi[3]=p_owner[3];
	            chi[4]=p_owner[4];
            
	            var good;good=0;
	            repeat(100){
	                if (good=0){
	                    var randd;randd=choose(1,2,3,4);
	                    if ((chi[randd]=argument0) and (randd<=planets)) and ((argument3="") or (p_feature[randd]=argument3)){
	                        good=1;instance_create(x,y,obj_temp5);
	                        obj_temp5.planet=randd;
	                    }
	                }
	            }
            
	        }
	    }
	}

	if (plane=0) and (instance_exists(obj_all_fleet)){
	    with(obj_all_fleet){
	        if (owner=argument0) or (argument0=0){
	            if (action=argument2) or (argument2=""){
	                instance_create(x,y,obj_temp5);
	                obj_temp5.planet=0;
	            }
	        }
	    }
	}



	var n,i,target;target=0;
	n = instance_number(obj_temp5);
	do
	{
	i = floor(random(n));
	target = instance_find(obj_temp5, i);
	}until(instance_exists(target) || n = 0)



	if (instance_exists(target)){
	    instance_deactivate_object(target);
	    with(obj_temp5){instance_destroy();}
	    instance_activate_object(target);
	}


}
