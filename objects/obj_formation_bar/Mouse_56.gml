// Handles the draggin of formation types
var mah_target=0;

// if (dragging==true) and (nobar==true) then mah_target=col_target;
// if (dragging==true) and (nobar==false) then mah_target=nearest_col;

mah_target=col_target;

if (dragging==true) and (instance_exists(mah_target)){
    if (mah_target.col_parent==col_parent){
        obj_controller.click=1;
		obj_controller.cooldown=20;
		// x=old_x;
		// y=old_y;
        rel_mousex=0;
		rel_mousey=0;
		old_x=0;
		old_y=0;
		col_target=0;
		nearest_col=0;
		nobar=false;
        obj_cursor.dragging=0;
		obj_cursor.image_index=0;
		dragging=false;
		exit;
    }
	col_parent = mah_target.col_parent;
	show_debug_message("mah_target.col_parent = " + string(mah_target.col_parent) + "col_parent = " + string(col_parent));
	
    if (x>=mah_target.x-5) and (x<=mah_target.x+42) and (mouse_y>=__view_get( e__VW.YView, 0 )+222) and (mouse_y<=__view_get( e__VW.YView, 0 )+688){
        var himcol=mah_target.col_parent,te=0;
        te=4800+himcol;
        
        if (obj_controller.temp[te]+size<=10){
            // Perform actions based on unit type.
            // Update the object's position to its new location
            x = mouse_x + rel_mousex;
            y = mouse_y + rel_mousey + 1000;
			
			show_debug_message("Updated Position - x: " + string(x) + ", y: " + string(y));

            obj_controller.temp[4800+col_parent]-=size;
            obj_controller.click=1;
            obj_controller.cooldown=20;
            show_debug_message(string(obj_controller.click) + "Selected UNIT ID OR selected UNIT TYPE");
            switch (unit_id) {
				case 1:
                    obj_controller.bat_comm_for[obj_controller.formating] = mah_target.col_parent;
                    show_debug_message(string(mah_target.col_parent) +"Col parent, unit_id: " + string(unit_id));
                    show_debug_message(string(obj_controller.bat_comm_for[obj_controller.formating]) + " Formation position (1-10 max");
                    break;
                case 2:
                    obj_controller.bat_hono_for[obj_controller.formating] = mah_target.col_parent;
                    break;
                case 3:
                    obj_controller.bat_libr_for[obj_controller.formating] = mah_target.col_parent;
                    break;
                case 4:
                    obj_controller.bat_tech_for[obj_controller.formating] = mah_target.col_parent;
                    break;
                case 5:
                    obj_controller.bat_term_for[obj_controller.formating] = mah_target.col_parent;
                    break;
                case 6:
                    obj_controller.bat_vete_for[obj_controller.formating] = mah_target.col_parent;
                    break;
                case 7:
                    obj_controller.bat_tact_for[obj_controller.formating] = mah_target.col_parent;
                    break;
                case 8:
                    obj_controller.bat_deva_for[obj_controller.formating] = mah_target.col_parent;
                    break;
                case 9:
                    obj_controller.bat_assa_for[obj_controller.formating] = mah_target.col_parent;
                    break;
                case 10:
                    obj_controller.bat_scou_for[obj_controller.formating] = mah_target.col_parent;
                    break;
                case 11:
                    obj_controller.bat_drea_for[obj_controller.formating] = mah_target.col_parent;
                    break;
                case 12:
                    obj_controller.bat_hire_for[obj_controller.formating] = mah_target.col_parent;
                    break;
                case 13:
                    obj_controller.bat_rhin_for[obj_controller.formating] = mah_target.col_parent;
                    break;
                case 14:
                    obj_controller.bat_pred_for[obj_controller.formating] = mah_target.col_parent;
                    break;
                case 15:
                    obj_controller.bat_land_for[obj_controller.formating] = mah_target.col_parent;
                    break;
            }

            obj_cursor.dragging=0;
            obj_cursor.image_index=0;
			var selectedFormation = obj_controller.bat_formation[obj_controller.formating];
			var attackCommand = obj_controller.bat_comm_for[1];
			show_debug_message("Selected Formation: " + string(selectedFormation));
            show_debug_message(string(obj_controller.click=1) + "Selected unit type OR unit ID")
            show_debug_message(string(obj_controller.bat_comm_for[obj_controller.formating]) + " Formation position (1-10 max");
            with(obj_temp8){instance_destroy();}
            with(obj_controller){scr_ui_formation_bars();}
            exit;
        }
        if (obj_controller.temp[te]+size>10){
            dragging=false;
            x=old_x;
            y=old_y;
            obj_controller.cooldown=20;
            obj_cursor.dragging=0;
            obj_cursor.image_index=0;
            if (obj_controller.master_volume>0) and (obj_controller.effect_volume>0){
                audio_play_sound(snd_error,-80,0);
                audio_sound_gain(snd_error,1*obj_controller.master_volume*obj_controller.effect_volume,0);
            }
        }
    }
    if (instance_exists(mah_target)){
        if (x<mah_target.x-5) or (x>mah_target.x+42) or (mouse_y<__view_get( e__VW.YView, 0 )+222) or (mouse_y>__view_get( e__VW.YView, 0 )+688){
            dragging=false;
            x=old_x;
            y=old_y;
            obj_controller.cooldown=20;
            obj_cursor.dragging=0;
            obj_cursor.image_index=0;
            if (obj_controller.master_volume>0) and (obj_controller.effect_volume>0){
                audio_play_sound(snd_error,-80,0);
                audio_sound_gain(snd_error,1*obj_controller.master_volume*obj_controller.effect_volume,0);
            }
        }
    }
}
