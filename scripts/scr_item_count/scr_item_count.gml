function scr_item_count(item_type) {

	// This script checks the equipment variables for the named item and returns the combined quantity

	var i=0;von=0;
	for (i=0;i<array_length(obj_ini.equipment);i++){
	   if (obj_ini.equipment[i]==item_type){
	   		/*in theory we should be able to break here but there seems
	   		to be the implication that an equipment item can be in the 
	   		equipemnt list more than once so will have to leave till I can
	   		find where stuff is added
	   		*/
	   		von+=obj_ini.equipment_number[i];
	   }
	}
	return(von);


}
