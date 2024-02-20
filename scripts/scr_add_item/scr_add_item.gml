function scr_add_item(item_name, number_of_items, quality="any") {

	var i, ok, last_open, match_slot, open_slot=false, matched=false, last_slot;
	ok=0;

	if (string_count("&",item_name)>0){// Tis an artifact
		last_slot=array_length(obj_ini.artifact);
	    var str1=item_name,str2=item_name,artifact_identifier_position=0;
    
	    artifact_identifier_position=string_pos("&",str1);

	    str1=string_delete(str1,artifact_identifier_position,99);
	    str2=string_delete(str2,1,string_length(str1)+1);
    
	   for (i=1;i<last_slot;i++){
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
	    for (i=1;i<last_slot;i++){
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
	    	var start_count = obj_ini.equipment_number[match_slot];
	    	obj_ini.equipment_number[match_slot]+=number_of_items;
	    	if (number_of_items>0){
	    		if (quality=="any") then quality="standard"
		    	for (var q=start_count;q<obj_ini.equipment_number[match_slot];q++){
		    		obj_ini.equipment_quality[match_slot][q]=quality;
		    	}
		    } else if (number_of_items<0){
		    	var end_count = obj_ini.equipment_number[match_slot];
		    	if (end_count<0) then end_count=0;
		    	if (number_of_items==-1){
		    		if (quality=="any"){
		    			if (array_length(obj_ini.equipment_quality[match_slot])>0){
		    				return array_pop(obj_ini.equipment_quality[match_slot]);
		    			} else {return "standard"}
		    		}else {
		    			var quality_item_found=false;
		    			for (var q=0;q>array_length(obj_ini.equipment_quality[match_slot]);q++){
		    				if (obj_ini.equipment_quality[match_slot][q]==quality){
		    					array_delete(obj_ini.equipment_quality[match_slot], q, 1);
		    					quality_item_found=true;
		    					break;
		    				}
		    				if(quality_item_found){
		    					return quality;
		    				} else{
		    					equipment_number[match_slot]++;
		    					return "no_item";
		    				}
		    			}
		    		}
		    	} else{
			    	for (var q=start_count-1;q>end_count;q--){
			    		array_delete(obj_ini.equipment_quality[match_slot], q, 1);
			    	}
		    	}
		    }
	    } else if (open_slot){
	        obj_ini.equipment[last_open]=item_name;
	        obj_ini.equipment_number[last_open]=number_of_items;
	        obj_ini.equipment_condition[last_open]=100;
	        if (quality == "any"){
	        	quality = "standard";
	        }
	        for (var q=0;q<number_of_items;q++){
	        	obj_ini.equipment_quality[last_open][q]=quality;
	        }
	        if (string_count("MK",item_name)>0) or (string_count("Armour",item_name)>0) or (item_name="Tartaros") then obj_ini.equipment_type[last_open]="armour";
	        if (string_count("Bolts",item_name)>0) then obj_ini.equipment_type[last_open]="gear";
	    } else {
	    	array_set(obj_ini.equipment, last_slot, item_name);
	    	array_set(obj_ini.equipment_number, last_slot, number_of_items);
	    	array_set(obj_ini.equipment_condition, last_slot, 100);
	    	array_set(obj_ini.equipment_quality, last_slot, []);
	    	if (quality=="any") then quality="standard";
	        for (var q=0;q<number_of_items;q++){
	        	obj_ini.equipment_quality[last_slot][q]=quality;
	        }	    	
	        if (string_count("MK",item_name)>0) or (string_count("Armour",item_name)>0) or (item_name="Tartaros") then obj_ini.equipment_type[last_slot]="armour";
	        if (string_count("Bolts",item_name)>0) then obj_ini.equipment_type[last_slot]="gear";	    	
	    }   
	}
}
