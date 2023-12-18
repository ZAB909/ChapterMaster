function scr_target(argument0, argument1) {



	// Argument0 : instance
	// Argument1 : "veh" or "men"

	// This naughty, sexy code is used to return a target for a battle block's any particular weapon


	// wih(ob_ennit){showmeage("targ#"+string(dudes[1])+"|"+string(dudes_num[1])+"|"+string(men+medi)+"|"+string(dudes_hp[1]));}


	var final_target;final_target=0;


	repeat(1){
	    if (final_target=0){
	        var target_num,target_id,target_min,target_max,f;
	        var targets = 0;
			var roll = 0;
			var dice = 0;
        
	        f=-1;
	        repeat(31){f+=1;
	            target_num[f]=0;
	            target_id[f]=0;
	            target_min[f]=0;
	            target_max[f]=0;
	        }
        
	        f=0;
	        repeat(30){f+=1;
	            if (argument1="veh") and (argument0.dudes_vehicle[f]=1) and (argument0.dudes[f]!=""){
	                targets+=1;
	                target_id[targets]=f;
	                target_num[targets]=argument0.dudes_num[f];
	                dice+=target_num[targets];target_max[targets]=dice;
	                if (targets=1) then target_min[targets]=0;
	                if (targets>1){target_min[targets]=target_max[targets-1]+1;}
	            }
	            if (argument1="men") and (argument0.dudes_vehicle[f]=0) and (argument0.dudes[f]!=""){
	                targets+=1;
	                target_id[targets]=f;target_num[targets]=argument0.dudes_num[f];
	                dice+=target_num[targets];target_max[targets]=dice;
	                if (targets=1) then target_min[targets]=0;
	                if (targets>1){target_min[targets]=target_max[targets-1]+1;}
	            }
	        }
        
        
	        f=0;
	        repeat(30){f+=1;
	            if (argument1="medi") and (argument0.dudes_vehicle[f]=1) and (argument0.dudes[f]!=""){
	                targets+=1;
	                target_id[targets]=f;
	                target_num[targets]=argument0.dudes_num[f];
	                dice+=target_num[targets];target_max[targets]=dice;
	                if (targets=1) then target_min[targets]=0;
	                if (targets>1){target_min[targets]=target_max[targets-1]+1;}
	            }
	        }
	        f=0;
	        repeat(30){f+=1;
	            if (argument1="medi") and (argument0.dudes_vehicle[f]=0) and (argument0.dudes[f]!=""){
	                targets+=1;
	                target_id[targets]=f;
	                target_num[targets]=argument0.dudes_num[f];
	                dice+=target_num[targets];target_max[targets]=dice;
	                if (targets=1) then target_min[targets]=0;
	                if (targets>1){target_min[targets]=target_max[targets-1]+1;}
	            }
	        }
        
        
        
        
        
        
        
	        roll=floor(random(dice))+1;f=0;
	        repeat(targets){f+=1;
	            if (roll>=target_min[f]) and (roll<=target_max[f]) and (final_target=0){final_target=f;}
	        }
	    }
	}

	if (final_target!=0) then return(final_target);
	if (final_target=0){
	    return(1);
	}


}
