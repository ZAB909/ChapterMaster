// Refreshes the UI, reinitializes variables to defaults
function scr_ui_refresh() {

    man_size = 0;
    selecting_location = "";
    selecting_types = "";
    selecting_ship = 0;
    sel_uid = 0;

    for (var i = 0; i < 501; i++) {
        man[i] = "";
        ide[i] = 0;
        man_sel[i] = 0;
        ma_lid[i] = 0;
        ma_wid[i] = 0;
        ma_bio[i] = 0;
        ma_race[i] = 0;
        ma_loc[i] = "";
        ma_name[i] = "";
        ma_role[i] = "";
        ma_wep1[i] = "";
        ma_wep2[i] = "";
        ma_armour[i] = "";
        ma_health[i] = 100;
        ma_chaos[i] = 0;
        ma_exp[i] = 0;
        ma_promote[i] = 0;
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