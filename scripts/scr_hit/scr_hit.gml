function scr_hit(x1, y1, x2, y2) {

	var result;result=false;
	if (mouse_x>=x1) and (mouse_y>=y1) and (mouse_x<x2) and (mouse_y<y2) then result=true;
	return(result);

}
