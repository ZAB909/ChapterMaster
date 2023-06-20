function debugl(argument0) {

	// argument0: string to add to debug log

	if (instance_exists(obj_controller)){
	    obj_controller.debug_lines+=1;
    
	    var numeral;numeral="";
	    if (obj_controller.debug_lines<10) then numeral="0000"+string(obj_controller.debug_lines);
	    if (obj_controller.debug_lines>=10) and (obj_controller.debug_lines<100) then numeral="000"+string(obj_controller.debug_lines);
	    if (obj_controller.debug_lines>=100) and (obj_controller.debug_lines<1000) then numeral="00"+string(obj_controller.debug_lines);
	    if (obj_controller.debug_lines>=1000) and (obj_controller.debug_lines<10000) then numeral="0"+string(obj_controller.debug_lines);
	    if (obj_controller.debug_lines>=10000) and (obj_controller.debug_lines<100000) then numeral=string(obj_controller.debug_lines);
    
	    ini_open("debug_log.ini");
	    ini_write_real("Main","lines",obj_controller.debug_lines);
	    // ini_write_string("Main",string(obj_controller.debug_lines),string(argument0));
	    ini_write_string("Main",string(numeral),string(argument0));
	    ini_close();
	}

	if (!instance_exists(obj_controller)){
	    ini_open("debug_log.ini");
	    var dbl;dbl=ini_read_real("Main","lines",0)+1;
	    ini_write_real("Main","lines",dbl);
	    ini_write_string("Main",string(dbl),string(argument0));
	    ini_close();
	}



}
