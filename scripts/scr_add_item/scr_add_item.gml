function scr_add_item(argument0, argument1) {
	// argument0 = name
	// argument1 = number

	var i, ok, last_open, yk;
	i=0;ok=0;last_open=0;yk=0;

	if (string_count("&",argument0)>0){// Tis an artifact
	    var str1,str2,ti;ti=0;
	    str1=argument0;str2=argument0;
    
	    ti=string_pos("&",str1);
	    str1=string_delete(str1,ti,99);
	    str2=string_delete(str2,1,string_length(str1)+1);
    
	    var last_artifact;i=0;last_artifact=0;
	    repeat(100){if (last_artifact=0){i+=1;if (obj_ini.artifact[i]="") then last_artifact=i;}}
    
	    obj_ini.artifact[last_artifact]=str1;obj_ini.artifact_tags[last_artifact]=str2;
	    obj_ini.artifact_identified[last_artifact]=0;obj_ini.artifact_condition[last_artifact]=100;
    
	    obj_ini.artifact_loc[last_artifact]=obj_ini.home_name;obj_ini.artifact_sid[last_artifact]=2;
	    // This needs to depend on the fleet type; try for either first capital ship or homeworld
	    // 135
    
	    obj_controller.artifacts+=1;
    
	    ok=500;
	}


	if (ok!=500){
	    i=0;
	    repeat(100){i+=1;
	        if (obj_ini.equipment[i]="") and (last_open=0) then last_open=i;
	        if (obj_ini.equipment[i]=argument0) and (obj_ini.equipment_condition[i]>0) and (yk=0) then yk=i;
	    }

	    if (yk>0) then obj_ini.equipment_number[yk]+=argument1;
	    if (yk=0) and (last_open!=0){
	        obj_ini.equipment[last_open]=argument0;
	        obj_ini.equipment_number[last_open]=argument1;
	        obj_ini.equipment_condition[last_open]=100
	        if (string_count("MK",argument0)>0) or (string_count("Armour",argument0)>0) or (argument0="Tartaros") then obj_ini.equipment_type[last_open]="armour";
	        if (string_count("Bolts",argument0)>0) then obj_ini.equipment_type[last_open]="gear";
	    }    
	}



	/*
	if (ok!=500) then repeat(100){i+=1;ok=0;
	    if (obj_ini.equipment[i]="") and (last_open=0) then last_open=i;
	    if (obj_ini.equipment[i]=argument0) and (ok=0){ok=1;obj_ini.equipment_number[i]+=argument1;}   
	}
	if (ok!=500) and (ok!=1){
	    obj_ini.equipment[last_open]=argument0;
	    obj_ini.equipment_number[last_open]=argument1;
	    obj_ini.equipment_condition[last_open]=100
	    if (string_count("MK",argument0)>0) or (string_count("Armour",argument0)>0) or (argument0="Tartaros") then obj_ini.equipment_type[last_open]="armour";
	}

	*/

	/*
	var i, ok, last_open;
	i=0;ok=0;last_open=0;


	if (string_count("&",argument0)>0){// Tis an artifact
	    var str1,str2,ti;ti=0;
	    str1=argument0;str2=argument0;
    
	    ti=string_pos("&",str1);
	    str1=string_delete(str1,ti,99);
	    str2=string_delete(str2,1,string_length(str1)+1);
    
	    var last_artifact;i=0;last_artifact=0;
	    repeat(100){if (last_artifact=0){i+=1;if (obj_ini.artifact[i]="") then last_artifact=i;}}
    
	    obj_ini.artifact[last_artifact]=str1;obj_ini.artifact_tags[last_artifact]=str2;
	    obj_ini.artifact_identified[last_artifact]=0;obj_ini.artifact_condition[last_artifact]=100;
    
	    obj_ini.artifact_loc[last_artifact]=obj_ini.home_name;obj_ini.artifact_sid[last_artifact]=2;
	    // This needs to depend on the fleet type; try for either first capital ship or homeworld
	    // 135
    
	    obj_controller.artifacts+=1;
    
	    ok=500;
	}


	if (ok!=500) then repeat(100){i+=1;ok=0;
	    if (obj_ini.equipment[i]!="") and (obj_ini.equipment[i]!=argument0) and (obj_ini.equipment[i+1]="") then last_open=i+1;
    
	    if (obj_ini.equipment[i]=argument0) and (ok=0){ok=1;obj_ini.equipment_number[i]+=argument1;}
        
	    if (ok=0) and (i=100){
	        obj_ini.equipment[last_open]=argument0;
	        obj_ini.equipment_number[last_open]=argument1;
	        obj_ini.equipment_condition[last_open]=100
	        if (string_count("MK",argument0)>0) or (string_count("Armour",argument0)>0) or (argument0="Tartaros") then obj_ini.equipment_type[last_open]="armour";
	    }

	}*/


}
