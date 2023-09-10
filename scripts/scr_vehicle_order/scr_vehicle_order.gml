// This sorts and crunches the vehicle variables into order for that company
function scr_vehicle_order(company_number) {
    // Once it's actually fucking working it should probably join the scr_company_order script in the Interface folder
    var vehicle_count = 0;
    var temp_race, temp_loc, temp_name, temp_role, temp_wep1, temp_lid, temp_wid, temp_wep1, temp_wep2, temp_armour, temp_gear, temp_hp, temp_chaos, temp_experience, temp_age, temp_uid;

    // init arrays
    for (var i = 0; i < 301; i++) { // TODO why 301?
        temp_race[company_number, i] = 0;
        temp_loc[company_number, i] = "";
        temp_name[company_number, i] = "";
        temp_role[company_number, i] = "";
        temp_lid[company_number, i] = 0;
        temp_wid[company_number, i] = 0;
        temp_wep1[company_number, i] = "";
        temp_wep2[company_number, i] = "";
        temp_wep3[company_number, i] = "";
        temp_upgrade[company_number, i] = "";
        temp_acc[company_number, i] = "";
        temp_hp[company_number, i] = 100;
        temp_chaos[company_number, i] = 0;
        temp_uid[company_number, i] = 0;
    }

	// Check for vehicles
    for (var i = 1; i <= 150; i++) { // TODO why 150?
        var _is_vehicle_role =
        	veh_role[company_number, i] = "Rhino" // TODO change to enums/string ids
        	or veh_role[company_number, i] = "Predator"
        	or veh_role[company_number, i] = "Whirlwind"
        	or veh_role[company_number, i] = "Land Speeder"
        	or veh_role[company_number, i] = "Land Raider";

        if (_is_vehicle_role) {
            vehicle_count++;
            temp_race[company_number, vehicle] = veh_race[co, i];
            temp_loc[company_number, vehicle] = veh_loc[co, i];
            temp_name[company_number, vehicle] = veh_name[co, i];
            temp_role[company_number, vehicle] = veh_role[co, i];
            temp_lid[company_number, vehicle] = veh_lid[co, i];
            temp_wid[company_number, vehicle] = veh_wid[co, i];
            temp_wep1[company_number, vehicle] = veh_wep1[co, i];
            temp_wep2[company_number, vehicle] = veh_wep2[co, i];
            temp_wep3[company_number, vehicle] = veh_wep3[co, i];
            temp_upgrade[company_number, vehicle] = veh_upgrade[co, i];
            temp_acc[company_number, vehicle] = veh_acc[co, i];
            temp_hp[company_number, vehicle] = veh_hp[co, i];
            temp_chaos[company_number, vehicle] = veh_chaos[co, i];
            temp_uid[company_number, vehicle] = veh_uid[co, i];
        }
    }

    // do the ordering
    for (var i = 1; i <= vehicle_count; i++) { // TODO why 150?
        veh_race[company_number, i] = temp_race[co, i];
        veh_loc[company_number, i] = temp_loc[co, i];
        veh_name[company_number, i] = temp_name[co, i];
        veh_role[company_number, i] = temp_role[co, i];
        veh_lid[company_number, i] = temp_lid[co, i];
        veh_wid[company_number, i] = temp_wid[co, i];
        veh_wep1[company_number, i] = temp_wep1[co, i];
        veh_wep2[company_number, i] = temp_wep2[co, i];
        veh_wep3[company_number, i] = temp_wep3[co, i];
        veh_upgrade[company_number, i] = temp_upgrade[co, i];
        veh_acc[company_number, i] = temp_acc[co, i];
        veh_hp[company_number, i] = temp_hp[co, i];
        veh_chaos[company_number, i] = temp_chaos[co, i];
        veh_uid[company_number, i] = temp_uid[co, i];
    }
}