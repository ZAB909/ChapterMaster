function scr_hit(argument0, argument1, argument2, argument3) {

	// argument0: x1
	// argument1: y1
	// argument2: x2
	// argument3: y2

	var result;result=false;
	if (mouse_x>=argument0) and (mouse_y>=argument1) and (mouse_x<argument2) and (mouse_y<argument3) then result=true;
	return(result);


}
