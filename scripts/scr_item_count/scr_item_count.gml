function scr_item_count(argument0) {

	// Argument0: Item name

	// This script checks the equipment variables for the named item and returns the combined quantity

	var i,von;i=0;von=0;
	repeat(50){
	    i+=1;if (obj_ini.equipment[i]=argument0)/* and (obj_ini.equipment_condition[i]>0) */ then von+=obj_ini.equipment_number[i];
	}
	return(von);


}
