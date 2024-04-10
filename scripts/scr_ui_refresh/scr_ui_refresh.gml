// Refreshes the UI, reinitializes variables to defaults
function scr_ui_refresh() {

    man_size = 0;
    selecting_location = "";
    selecting_types = "";
    selecting_ship = 0;
    sel_uid = 0;

    reset_manage_arrays();
    for (var i = 0; i < 501; i++) {
        sh_ide[i] = 0;
        sh_uid[i] = 0;
        sh_name[i] = "";
        sh_class[i] = "";
        sh_loc[i] = "";
        sh_hp[i] = "";
        sh_cargo[i] = 0;
        sh_cargo_max[i] = "";
    }
	
    alll = 0;
    sel_loading = 0;
    unload = 0;
    alarm[6] = 7;
}