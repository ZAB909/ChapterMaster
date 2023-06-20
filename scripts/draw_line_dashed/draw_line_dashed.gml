function draw_line_dashed(argument0, argument1, argument2, argument3, argument4, argument5) {
	// Script draw_line_dashed()
	// argument0, argument1: x,y coords of start
	// argument2, argument3: x,y coords of end
	// argument4: Length of dashes
	// argument5: Width of line

	var len, ang, inc_x, inc_y, c, m;
	len = point_distance(argument0,argument1, argument2,argument3);
	ang = point_direction(argument0,argument1, argument2,argument3);
	inc_x = lengthdir_x(argument4,ang);
	inc_y = lengthdir_y(argument4,ang);
	c = 0;
	for( m=0; m<len; m+=argument4*2) {
		draw_line_width(argument0+inc_x*c, argument1+inc_y*c, argument0+inc_x*(c+1), argument1+inc_y*(c+1), argument5);
		c += 2;
	}


}
