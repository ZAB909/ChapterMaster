function scr_zoom() {

	// Zooms the view in or out when executed

    if (zoomed) {
        zoomed=0;
        view_set_visible(0, true);
        view_set_visible(1, false);
        if (instance_exists(obj_cursor)) {
            obj_cursor.image_xscale=1;
            obj_cursor.image_yscale=1;
        }
    } else {
        zoomed=1;
        view_set_visible(0, false);
        view_set_visible(1, true);
        if (instance_exists(obj_cursor)) {
            obj_cursor.image_xscale=2;
            obj_cursor.image_yscale=2;
        }
    }
}
