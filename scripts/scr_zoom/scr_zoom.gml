function scr_zoom() {

	// Zooms the view in or out when executed

	var onceh;onceh=0;
	if (zoomed=1) and (onceh=0) {
		was_zoomed=1;zoomed=0;
		onceh=1;
		__view_set( e__VW.Visible, 0, true );
		__view_set( e__VW.Visible, 1, false );
		if (instance_exists(obj_cursor)) {
			obj_cursor.image_xscale=1;
			obj_cursor.image_yscale=1;
		}
	}
	if (was_zoomed=1) and (onceh=0) {
		was_zoomed=0;
		zoomed=1;
		onceh=1;
		__view_set( e__VW.Visible, 0, false );
		__view_set( e__VW.Visible, 1, true );
		if (instance_exists(obj_cursor)) {
			obj_cursor.image_xscale=2;
			obj_cursor.image_yscale=2;
		}
	}

}
