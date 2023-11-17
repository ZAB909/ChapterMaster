function scr_check_equip(argument0, argument1, argument2, argument3) {

	// argument0: the item in question
	// argument1: planet name, or "" for space
	// argument2: planet or SID
	// argument3: remove?

	// Checks if an item is equip to a marine at the location



	var man_c, man_i, c, i, have, to_remove;
	man_c=0;man_i=0;c=0;i=0;have=0;

	to_remove=argument3;



	i=-1;c=-1;
	repeat(11){
	    c+=1;i=0;
    
	    if (!instance_exists(obj_ncombat)) then repeat(305){i+=1;// man_c[i]=0;man_i[i]=0;
	        if (argument1!="") and (argument2>0){
	            if (obj_ini.name[c][i]!="") and (obj_ini.loc[c][i]=argument1) and (obj_ini.wid[c][i]=argument2){
	                if (obj_ini.wep1[c][i]=argument0){have+=1;if (to_remove>0){to_remove-=1;obj_ini.wep1[c][i]="";}}
	                if (obj_ini.wep2[c][i]=argument0){have+=1;if (to_remove>0){to_remove-=1;obj_ini.wep2[c][i]="";}}
	                if (obj_ini.armour[c][i]=argument0){have+=1;if (to_remove>0){to_remove-=1;obj_ini.armour[c][i]="";}}
	                if (obj_ini.mobi[c][i]=argument0){have+=1;if (to_remove>0){to_remove-=1;obj_ini.mobi[c][i]="";}}
	                if (obj_ini.gear[c][i]=argument0){have+=1;if (to_remove>0){to_remove-=1;obj_ini.gear[c][i]="";}}
	            }
	        }
	        if (argument1="") and (argument2>0){
	            if (obj_ini.name[c][i]!="") and (obj_ini.lid[c][i]=argument1) and (obj_ini.wid[c][i]=0){
	                if (obj_ini.wep1[c][i]=argument0){have+=1;if (to_remove>0){to_remove-=1;obj_ini.wep1[c][i]="";}}
	                if (obj_ini.wep2[c][i]=argument0){have+=1;if (to_remove>0){to_remove-=1;obj_ini.wep2[c][i]="";}}
	                if (obj_ini.armour[c][i]=argument0){have+=1;if (to_remove>0){to_remove-=1;obj_ini.armour[c][i]="";}}
	                if (obj_ini.mobi[c][i]=argument0){have+=1;if (to_remove>0){to_remove-=1;obj_ini.mobi[c][i]="";}}
	                if (obj_ini.gear[c][i]=argument0){have+=1;if (to_remove>0){to_remove-=1;obj_ini.gear[c][i]="";}}
	            }
	        }
	    }
    
	    if (instance_exists(obj_ncombat)) then repeat(305){i+=1;
	        var okay;okay=0;
	        // show_message(string(obj_ini.name[c][i])+" "+string(fighting[c][i]));
    
        
	        // show_message("crash here?");
        
        
	        if (obj_ini.name[c][i]!="") and (obj_ncombat.fighting[c][i]=1){
        
	            // if (obj_ini.gear[c][i]!="") then show_message(string(obj_ini.gear[c][i])+", need "+string(argument0));
        
	            if (obj_ini.wep1[c][i]=argument0){have+=1;if (to_remove>0){to_remove-=1;obj_ini.wep1[c][i]="";}}
	            if (obj_ini.wep2[c][i]=argument0){have+=1;if (to_remove>0){to_remove-=1;obj_ini.wep2[c][i]="";}}
	            if (obj_ini.armour[c][i]=argument0){have+=1;if (to_remove>0){to_remove-=1;obj_ini.armour[c][i]="";}}
	            if (obj_ini.mobi[c][i]=argument0){have+=1;if (to_remove>0){to_remove-=1;obj_ini.mobi[c][i]="";}}
	            if (obj_ini.gear[c][i]=argument0){have+=1;if (to_remove>0){to_remove-=1;obj_ini.gear[c][i]="";}}
	        }
	    }
    
	}

	return(have);


}
