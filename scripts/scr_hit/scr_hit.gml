function scr_hit(x1=0, y1=0, x2=0, y2=0) {
	if (is_array(x1)){
		return point_in_rectangle(mouse_x,mouse_y,x1[0],x1[1],x1[2],x1[3]);
	} else {
		return point_in_rectangle(mouse_x,mouse_y,x1, y1, x2, y2);
	}
	return false;

}
