// Counts the number of total vehicles for the player
// TODO this should be function defined in Chapter struct, or something similar
function scr_vehicle_count(role, star_system_num) {

    var vehicle_count = 0,
        company_number = 0,
        company_number_derived_from_star_system_num = -999; // TODO refactor star_system_num to actually represent something logical

    if (star_system_num == "0") then company_number_derived_from_star_system_num = 0;
    else if (star_system_num == "1") then company_number_derived_from_star_system_num = 1;
    else if (star_system_num == "2") then company_number_derived_from_star_system_num = 2;
    else if (star_system_num == "3") then company_number_derived_from_star_system_num = 3;
    else if (star_system_num == "4") then company_number_derived_from_star_system_num = 4;
    else if (star_system_num == "5") then company_number_derived_from_star_system_num = 5;
    else if (star_system_num == "6") then company_number_derived_from_star_system_num = 6;
    else if (star_system_num == "7") then company_number_derived_from_star_system_num = 7;
    else if (star_system_num == "8") then company_number_derived_from_star_system_num = 8;
    else if (star_system_num == "9") then company_number_derived_from_star_system_num = 9;
    else if (star_system_num == "10") then company_number_derived_from_star_system_num = 10;

    if (company_number_derived_from_star_system_num < 0) {
        for (var j = 0; j < 11; j++) {
            for (var i = 1; i <= 100; i++) {
                if (obj_ini.veh_role[company_number, i] == role) and(star_system_num == "") then vehicle_count++;
                if (obj_ini.veh_role[company_number, i] == role) and(obj_ini.veh_loc[company_number, i] == obj_ini.home_name) and(star_system_num = "home") then vehicle_count++;
                if (obj_ini.veh_role[company_number, i] == role) and(star_system_num == "field") and((obj_ini.loc[company_number, i] != obj_ini.home_name) or(obj_ini.veh_lid[company_number, i] > 0)) then vehicle_count++;

                if (star_system_num != "home") and(star_system_num != "field") {
                    if (obj_ini.veh_role[company_number, i] == role) {
                        var t1 = string(obj_ini.veh_loc[company_number, i]) + "|" + string(obj_ini.veh_wid[company_number, i]) + "|";
                        if (star_system_num == t1) then vehicle_count++;
                    }
                }
            }
            company_number++;
        }
    } else {
        company_number = company_number_derived_from_star_system_num;

        for (var i = 1; i <= 100; i++) {
            if (obj_ini.veh_role[company_number, i] = role) then vehicle_count++;
        }
        company_number++;
    }

    return (vehicle_count);
}