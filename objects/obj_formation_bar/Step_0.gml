
if (dragging==true){
	show_debug_message("Initial Position - x: " + string(x) + ", y: " + string(y));
    x=mouse_x+rel_mousex;
	y=mouse_y+rel_mousey;
	obj_cursor.image_index=3;
    col_target=instance_nearest(x,__view_get( e__VW.YView, 0 )+224,obj_temp8);
    nearest_col=instance_nearest(col_target.x,col_target.y,obj_formation_bar);
	show_debug_message(" DRAGGING TRUE: Col target: "+ string(col_target) + " " + "Col Parent: " + string(col_parent) );
    nobar=false;
	if (point_distance(col_target.x,col_target.y,nearest_col.x,nearest_col.y)>2) then nobar=true;
}
if (dragging==false){
    rel_mousex=0;
	rel_mousey=0;
	old_x=0;
	old_y=0;
    // col_parent=col_target;
	// col_target=0;
	// above_neighbor=0;
    // nearest_col=0;
}
