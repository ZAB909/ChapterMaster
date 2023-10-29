function scr_add_item(item_name, number_of_items) {
	// item_name = name
	// number_of_items = number

	var i, ok, last_open, match_slot, open_slot=false, matched=false, last_slot;
	ok=0;

	if (string_count("&",item_name)>0){// Tis an artifact
		last_slot=array_length(obj_ini.artifact);
	    var str1=item_name,str2=item_name,artifact_identifier_position=0;
    
	    artifact_identifier_position=string_pos("&",str1);

	    str1=string_delete(str1,artifact_identifier_position,99);
	    str2=string_delete(str2,1,string_length(str1)+1);
    
	   for (i=0;i<last_slot;i++){
	        if (obj_ini.artifact[i]=="") and (open_slot==false){
	        	last_open=i;
	        	open_slot=true;
	        }	   	
	    }
    	if (open_slot){
		    obj_ini.artifact[last_open]=str1;
		    obj_ini.artifact_tags[last_open]=str2;
		    obj_ini.artifact_identified[last_open]=0;
		    obj_ini.artifact_condition[last_open]=100;
	    
		    obj_ini.artifact_loc[last_open]=obj_ini.home_name;
		    obj_ini.artifact_sid[last_open]=2;
		} else {
			array_set(obj_ini.artifact, last_slot, str1);
			array_set(obj_ini.artifact_tags, last_slot, str2);
			array_set(obj_ini.artifact_identified, last_slot, 0);
			array_set(obj_ini.artifact_condition, last_slot, 100);
			array_set(obj_ini.artifact_loc, last_slot, obj_ini.home_name);
			array_set(obj_ini.artifact_sid, last_slot, 2);		
		}
	    // This needs to depend on the fleet type; try for either first capital ship or homeworld
	    // 135
    
	    obj_controller.artifacts+=1;

	} else {
		last_slot=array_length(obj_ini.equipment);
	    for (i=0;i<last_slot;i++){
	        if (obj_ini.equipment[i]=="") and (open_slot==false){
	        	last_open=i;
	        	open_slot=true;
	        }
	        if (obj_ini.equipment[i]==item_name) and (obj_ini.equipment_condition[i]>0) and (matched==false){
	        	matched=true;
	        	match_slot=i;
	        	break;
	        }
	    }

	    if (matched){
	    	obj_ini.equipment_number[match_slot]+=number_of_items;
	    } else if (open_slot){
	        obj_ini.equipment[last_open]=item_name;
	        obj_ini.equipment_number[last_open]=number_of_items;
	        obj_ini.equipment_condition[last_open]=100
	        if (string_count("MK",item_name)>0) or (string_count("Armour",item_name)>0) or (item_name="Tartaros") then obj_ini.equipment_type[last_open]="armour";
	        if (string_count("Bolts",item_name)>0) then obj_ini.equipment_type[last_open]="gear";
	    } else {
	    	array_set(obj_ini.equipment, last_slot, item_name)
	    	array_set(obj_ini.equipment_number, last_slot, number_of_items)
	    	array_set(obj_ini.equipment_condition, last_slot, 100)
	        if (string_count("MK",item_name)>0) or (string_count("Armour",item_name)>0) or (item_name="Tartaros") then obj_ini.equipment_type[last_slot]="armour";
	        if (string_count("Bolts",item_name)>0) then obj_ini.equipment_type[last_slot]="gear";	    	
	    }   
	}
}
