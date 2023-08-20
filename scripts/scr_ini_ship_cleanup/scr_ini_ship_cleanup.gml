function scr_ini_ship_cleanup() {

	var i,j,meh;
	i=0;j=0;meh=0;
	var co,ide;
	co=0;ide=0;


	/*
	    This is one of the scripts that has given me a lot of trouble
	    over the ages.  Formerly, when ships were destroyed, their
	    array would be crushed.  This meant that marine LID (ship ID)
	    variables had to be changed to take this into account and
	    assign them to the recently changed ship IP.
    
	    As of recent I have simply removed the 'clean and smash' ship
	    script, so that their ID's never change.  Instead of condensing
	    empty slots they are simply left empty.  Ideally this should, 
	    and so far has, prevent marines from teleporting from ship to
	    ship.
    
	    This scripts new purpose is to simply remove all variables
	    formerly assigned to a dead ship within the array.  This (should)
	    prevent the engine from mistaking a dead ship for still being
	    active and alive.
	*/




	// If the ship is dead then make it fucking dead man
	repeat(100){i+=1;
	    if (ship[i]!="") and (ship_hp[i]<=0){
	        ship[i]="";ship_owner[i]=0;ship_class[i]="";ship_size[i]=0;
	        ship_leadership[i]=0;ship_hp[i]=0;ship_maxhp[i]=0;ship_location[i]="";ship_shields[i]=0;
	        ship_conditions[i]="";ship_speed[i]=0;ship_turning[i]=0;
	        ship_front_armour[i]=0;ship_other_armour[i]=0;ship_weapons[i]=0;ship_shields[i]=0;
	        ship_wep[i,0]="";ship_wep_facing[i,0]="";ship_wep_condition[i,0]="";
	        ship_wep[i,1]="";ship_wep_facing[i,1]="";ship_wep_condition[i,1]="";
	        ship_wep[i,2]="";ship_wep_facing[i,2]="";ship_wep_condition[i,2]="";
	        ship_wep[i,3]="";ship_wep_facing[i,3]="";ship_wep_condition[i,3]="";
	        ship_wep[i,4]="";ship_wep_facing[i,4]="";ship_wep_condition[i,4]="";
	        ship_wep[i,5]="";ship_wep_facing[i,5]="";ship_wep_condition[i,5]="";
	        ship_capacity[i]=0;ship_carrying[i]=0;ship_contents[i]="";ship_turrets[i]=0;
	        capital[i]="";capital_num[i]=0;
	    }
	}

	// Crush the ship arrays           136 ; temporarily removing this
	/*repeat(30){i=0;
	    repeat(100){i+=1;
	        if (ship[i]="") and (ship[i+1]!=""){
	            ship[i]=ship[i+1];
            
	            ship_owner[i]=ship_owner[i+1];
	            ship_class[i]=ship_class[i+1];
	            ship_size[i]=ship_size[i+1];
	            ship_leadership[i]=ship_leadership[i+1];
	            ship_hp[i]=ship_hp[i+1];
	            ship_maxhp[i]=ship_maxhp[i+1];
	            ship_location[i]=ship_location[i+1];
	            ship_shields[i]=ship_shields[i+1];
	            ship_conditions[i]=ship_conditions[i+1];
	            ship_speed[i]=ship_speed[i+1];
	            ship_turning[i]=ship_turning[i+1];
	            ship_front_armour[i]=ship_front_armour[i+1];
	            ship_other_armour[i]=ship_other_armour[i+1];
	            ship_weapons[i]=ship_weapons[i+1];
	            ship_shields[i]=ship_shields[i+1];
	            ship_wep[i,0]=ship_wep[i+1,0];
	            ship_wep_facing[i,0]=ship_wep_facing[i+1,0];
	            ship_wep_condition[i,0]=ship_wep_condition[i+1,0];
	            ship_wep[i,1]=ship_wep[i+1,1];
	            ship_wep_facing[i,1]=ship_wep_facing[i+1,1];
	            ship_wep_condition[i,1]=ship_wep_condition[i+1,1];
	            ship_wep[i,2]=ship_wep[i+1,2];
	            ship_wep_facing[i,2]=ship_wep_facing[i+1,2];
	            ship_wep_condition[i,2]=ship_wep_condition[i+1,2];
	            ship_wep[i,3]=ship_wep[i+1,3];
	            ship_wep_facing[i,3]=ship_wep_facing[i+1,3];
	            ship_wep_condition[i,3]=ship_wep_condition[i+1,3];
	            ship_wep[i,4]=ship_wep[i+1,4];
	            ship_wep_facing[i,4]=ship_wep_facing[i+1,4];
	            ship_wep_condition[i,4]=ship_wep_condition[i+1,4];
	            ship_wep[i,5]=ship_wep[i+1,5];
	            ship_wep_facing[i,5]=ship_wep_facing[i+1,5];
	            ship_wep_condition[i,5]=ship_wep_condition[i+1,5];
	            ship_capacity[i]=ship_capacity[i+1];
	            ship_carrying[i]=ship_carrying[i+1];
	            ship_contents[i]=ship_contents[i+1];
	            ship_turrets[i]=ship_turrets[i+1];
	            ship_uid[i]=ship_uid[i+1]
            
	            ship[i+1]="";
	            ship_owner[i+1]=0;
	            ship_class[i+1]="";
	            ship_size[i+1]=0;
	            ship_leadership[i+1]=0;
	            ship_hp[i+1]=0;
	            ship_maxhp[i+1]=0;
	            ship_location[i+1]="";
	            ship_shields[i+1]=0;
	            ship_conditions[i+1]="";
	            ship_speed[i+1]=0;
	            ship_turning[i+1]=0;
	            ship_front_armour[i+1]=0;
	            ship_other_armour[i+1]=0;
	            ship_weapons[i+1]=0;
	            ship_shields[i+1]=0;
	            ship_wep[i+1,0]="";
	            ship_wep_facing[i+1,0]="";
	            ship_wep_condition[i+1,0]="";
	            ship_wep[i+1,1]="";
	            ship_wep_facing[i+1,1]="";
	            ship_wep_condition[i+1,1]="";
	            ship_wep[i+1,2]="";
	            ship_wep_facing[i+1,2]="";
	            ship_wep_condition[i+1,2]="";
	            ship_wep[i+1,3]="";
	            ship_wep_facing[i+1,3]="";
	            ship_wep_condition[i+1,3]="";
	            ship_wep[i+1,4]="";
	            ship_wep_facing[i+1,4]="";
	            ship_wep_condition[i+1,4]="";
	            ship_wep[i+1,5]="";
	            ship_wep_facing[i+1,5]="";
	            ship_wep_condition[i+1,5]="";
	            ship_capacity[i+1]=0;
	            ship_carrying[i+1]=0;
	            ship_contents[i+1]="";
	            ship_turrets[i+1]=0;
	            ship_uid[i+1]=0;
	        }
	    }
	}

	*/


	/*var last_uid;last_uid=0;
	co=0;ide=0;
	repeat(3600){
	    if (co<=10){
	        ide+=1;
	        if (ide=300){ide=1;co+=1;}
	        if (co<=10){var case1;case1=0;
	            if (obj_ini.ship_uid[obj_ini.lid[co,ide]]!=obj_ini.uid[co,ide]){
	                // If the last_uid LID is the correct one for this marine then transfer that to the marine LID
	                if (obj_ini.ship_uid[last_uid]=obj_ini.uid[co,ide]){case1=1;obj_ini.lid[co,ide]=last_uid;}
	                if (obj_ini.ship_uid[last_uid]!=obj_ini.uid[co,ide]) and (case1!=1){
	                    // The last_uid LID is not the correct one for this marine
	                    // Find the correct one
                    
	                    var sap,e;sap=0;e=0;
	                    repeat(40){e+=1;
	                        if (sap=0){
	                            if (obj_ini.ship[e]!="") and (obj_ini.ship_uid[e]=obj_ini.uid[co,ide]){
	                                // Found the correct ship UID
	                                last_uid=e;sap=e;obj_ini.lid[co,ide]=e;
	                            }
	                        }
	                    }
                    
	                }
	            }
	        }
	    }
	}

	last_uid=0;co=0;ide=0;
	repeat(1200){
	    if (co<=10){
	        ide+=1;
	        if (ide=100){ide=1;co+=1;}
	        if (co<=10){var case1;case1=0;
	            if (obj_ini.ship_uid[obj_ini.veh_lid[co,ide]]!=obj_ini.veh_uid[co,ide]){
	                // If the last_uid LID is the correct one for this vehicle then transfer that to the vehicle LID
	                if (obj_ini.ship_uid[last_uid]=obj_ini.veh_uid[co,ide]){case1=1;obj_ini.veh_lid[co,ide]=last_uid;}
	                if (obj_ini.ship_uid[last_uid]!=obj_ini.veh_uid[co,ide]) and (case1!=1){
	                    // The last_uid LID is not the correct one for this marine
	                    // Find the correct one
                    
	                    var sap,e;sap=0;e=0;
	                    repeat(40){e+=1;
	                        if (sap=0){
	                            if (obj_ini.ship[e]!="") and (obj_ini.ship_uid[e]=obj_ini.veh_uid[co,ide]){
	                                // Found the correct ship UID
	                                last_uid=e;sap=e;obj_ini.veh_lid[co,ide]=e;
	                            }
	                        }
	                    }
                    
	                }
	            }
	        }
	    }
	}


	*/




	/*

	exit;





	repeat(40){i+=1;
	    if (ship[i]!="") and (ship_hp[i]<=0){    
	        // if (string_count(string(ship[i]),obj_ini.ship_names)>0) then obj_ini.ship_names=string_replace_all(string(ship[i]),obj_ini.ship_names,"");
        
        
	        meh=i;
        
        
	        co=0;ide=0;
	        repeat(3600){
	            if (co<=10){
	                ide+=1;
	                if (ide=300){ide=1;co+=1;}
	                if (co<=10){
	                    // if (obj_ini.lid[co,ide]=meh) then obj_ini.hp[co,ide]=0;
	                    if (obj_ini.lid[co,ide]>meh) then obj_ini.lid[co,ide]-=1;
	                }
	            }
	        }
        
        
        
	        var a;a=0;
	        repeat(50){a+=1;
	            if (obj_ini.artifact_loc[a]=obj_ini.ship[i]) and (obj_ini.artifact[a]!=""){
	                obj_ini.artifact[a]="";obj_ini.artifact_tags[a]="";obj_ini.artifact_identified[a]=0;
	                obj_ini.artifact_condition[a]=100;obj_ini.artifact_loc[a]="";obj_ini.artifact_sid[a]=0;
	                obj_controller.artifacts-=1;
	                if (obj_controller.menu_artifact>obj_controller.artifacts) then obj_controller.menu_artifact=obj_controller.artifacts;
	            }
	        }
        
        
	        ship[i]="";ship_owner[i]=0;ship_class[i]="";ship_size[i]=0;
	        ship_leadership[i]=0;ship_hp[i]=0;ship_maxhp[i]=0;ship_location[i]="";ship_shields[i]=0;
	        ship_conditions[i]="";ship_speed[i]=0;ship_turning[i]=0;
	        ship_front_armour[i]=0;ship_other_armour[i]=0;ship_weapons[i]=0;ship_shields[i]=0;
	        ship_wep[i,0]="";ship_wep_facing[i,0]="";ship_wep_condition[i,0]="";
	        ship_wep[i,1]="";ship_wep_facing[i,1]="";ship_wep_condition[i,1]="";
	        ship_wep[i,2]="";ship_wep_facing[i,2]="";ship_wep_condition[i,2]="";
	        ship_wep[i,3]="";ship_wep_facing[i,3]="";ship_wep_condition[i,3]="";
	        ship_wep[i,4]="";ship_wep_facing[i,4]="";ship_wep_condition[i,4]="";
	        ship_wep[i,5]="";ship_wep_facing[i,5]="";ship_wep_condition[i,5]="";
	        ship_capacity[i]=0;ship_carrying[i]=0;ship_contents[i]="";ship_turrets[i]=0;
	        capital[i]="";capital_num[i]=0;
        
        
        
        
	        // 135 new
	        if (ship[i]="") and (ship[i+1]!=""){
	            ship[i]=ship[i+1];
            
	            ship_owner[i]=ship_owner[i+1];
	            ship_class[i]=ship_class[i+1];
	            ship_size[i]=ship_size[i+1];
	            ship_leadership[i]=ship_leadership[i+1];
	            ship_hp[i]=ship_hp[i+1];
	            ship_maxhp[i]=ship_maxhp[i+1];
	            ship_location[i]=ship_location[i+1];
	            ship_shields[i]=ship_shields[i+1];
	            ship_conditions[i]=ship_conditions[i+1];
	            ship_speed[i]=ship_speed[i+1];
	            ship_turning[i]=ship_turning[i+1];
	            ship_front_armour[i]=ship_front_armour[i+1];
	            ship_other_armour[i]=ship_other_armour[i+1];
	            ship_weapons[i]=ship_weapons[i+1];
	            ship_shields[i]=ship_shields[i+1];
	            ship_wep[i,0]=ship_wep[i+1,0];
	            ship_wep_facing[i,0]=ship_wep_facing[i+1,0];
	            ship_wep_condition[i,0]=ship_wep_condition[i+1,0];
	            ship_wep[i,1]=ship_wep[i+1,1];
	            ship_wep_facing[i,1]=ship_wep_facing[i+1,1];
	            ship_wep_condition[i,1]=ship_wep_condition[i+1,1];
	            ship_wep[i,2]=ship_wep[i+1,2];
	            ship_wep_facing[i,2]=ship_wep_facing[i+1,2];
	            ship_wep_condition[i,2]=ship_wep_condition[i+1,2];
	            ship_wep[i,3]=ship_wep[i+1,3];
	            ship_wep_facing[i,3]=ship_wep_facing[i+1,3];
	            ship_wep_condition[i,3]=ship_wep_condition[i+1,3];
	            ship_wep[i,4]=ship_wep[i+1,4];
	            ship_wep_facing[i,4]=ship_wep_facing[i+1,4];
	            ship_wep_condition[i,4]=ship_wep_condition[i+1,4];
	            ship_wep[i,5]=ship_wep[i+1,5];
	            ship_wep_facing[i,5]=ship_wep_facing[i+1,5];
	            ship_wep_condition[i,5]=ship_wep_condition[i+1,5];
	            ship_capacity[i]=ship_capacity[i+1];
	            ship_carrying[i]=ship_carrying[i+1];
	            ship_contents[i]=ship_contents[i+1];
	            ship_turrets[i]=ship_turrets[i+1];
            
	            ship[i+1]="";
	            ship_owner[i+1]=0;
	            ship_class[i+1]="";
	            ship_size[i+1]=0;
	            ship_leadership[i+1]=0;
	            ship_hp[i+1]=0;
	            ship_maxhp[i+1]=0;
	            ship_location[i+1]="";
	            ship_shields[i+1]=0;
	            ship_conditions[i+1]="";
	            ship_speed[i+1]=0;
	            ship_turning[i+1]=0;
	            ship_front_armour[i+1]=0;
	            ship_other_armour[i+1]=0;
	            ship_weapons[i+1]=0;
	            ship_shields[i+1]=0;
	            ship_wep[i+1,0]="";
	            ship_wep_facing[i+1,0]="";
	            ship_wep_condition[i+1,0]="";
	            ship_wep[i+1,1]="";
	            ship_wep_facing[i+1,1]="";
	            ship_wep_condition[i+1,1]="";
	            ship_wep[i+1,2]="";
	            ship_wep_facing[i+1,2]="";
	            ship_wep_condition[i+1,2]="";
	            ship_wep[i+1,3]="";
	            ship_wep_facing[i+1,3]="";
	            ship_wep_condition[i+1,3]="";
	            ship_wep[i+1,4]="";
	            ship_wep_facing[i+1,4]="";
	            ship_wep_condition[i+1,4]="";
	            ship_wep[i+1,5]="";
	            ship_wep_facing[i+1,5]="";
	            ship_wep_condition[i+1,5]="";
	            ship_capacity[i+1]=0;
	            ship_carrying[i+1]=0;
	            ship_contents[i+1]="";
	            ship_turrets[i+1]=0;
            
            
            
	        }
        
        
        
        
        
        
        
	    }
	}

	// This is currently breaking the LID when ships are removed- need to somehow ensure that marine LIDs are taken into account here
	// 135

	*/


}
