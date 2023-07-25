function scr_start_load(argument0, argument1, argument2) {
    // argument0: the fleet object
    // argument1: star object
    // argument2: 1 for including escorts, 2 for no escorts

    // this distributes the marines and vehicles to the correct ships if the chapter is fleet-based or a home-based chapter
    /*
    battle_barges
    strike_cruisers
    gladius
    hunters
    */

    var splinter, com, eqp, remove_size, company_size, shyp, shyp_size, companies_loaded;
    splinter = 0;
    com = -1; // all companies for this script
    eqp = 0; //vehicle or armor(equip)
    remove_size = 0;
    company_size = 0;
    shyp = 1;
    shyp_size = obj_ini.ship_size[shyp];
    companies_loaded = 1;

    if (string_count("Splinter", obj_ini.strin2) > 0) then splinter = 1;

    repeat (10) {
        com += 1;
        eqp = 0;

        repeat (500) {
            eqp += 1;

            if (obj_ini.role[com, eqp] != "") {
                var n_size;
                n_size = 1;

                if (obj_ini.armor[com, eqp] == "Terminator Armor") then n_size += 1;
                if (obj_ini.armor[com, eqp] == "Tartaros") then n_size += 1;
                if (obj_ini.armor[com, eqp] == "Dreadnought") then n_size += 5;
                if (obj_ini.role[com, eqp] == "Chapter Master") then n_size += 1;

                if (obj_ini.ship_carrying[shyp] + n_size > obj_ini.ship_capacity[shyp]) {
                    remove_size += company_size;
                    obj_ini.ship_carrying[shyp] += company_size;
                    obj_ini.man_size -= company_size;
                    company_size = 0;
                    shyp += 1;
                    companies_loaded = 1;
                }

                obj_ini.lid[com, eqp] = shyp;
                obj_ini.wid[com, eqp] = 0;
                obj_ini.loc[com, eqp] = obj_ini.ship_location[shyp];
                company_size += 1;

                if (obj_ini.armor[com, eqp] == "Terminator Armor") then company_size += 1;
                if (obj_ini.armor[com, eqp] == "Tartaros") then company_size += 1;
                if (obj_ini.armor[com, eqp] == "Dreadnought") then company_size += 5;

                // Load vehicles onto the ship
                var v;
                for (v = 1; v <= 5; v++) {
                    if (obj_ini.veh_role[com, eqp] == "Rhino") {
                        obj_ini.veh_lid[com, eqp] = shyp;
                        obj_ini.veh_wid[com, eqp] = 0;
                        obj_ini.veh_loc[com, eqp] = obj_ini.ship_location[shyp];
                        break;
                    }
                    if (obj_ini.veh_role[com, eqp] == "Predator") {
                        obj_ini.veh_lid[com, eqp] = shyp;
                        obj_ini.veh_wid[com, eqp] = 1;
                        obj_ini.veh_loc[com, eqp] = obj_ini.ship_location[shyp];
                        break;
                    }
                    if (obj_ini.veh_role[com, eqp] == "Land Raider") {
                        obj_ini.veh_lid[com, eqp] = shyp;
                        obj_ini.veh_wid[com, eqp] = 2;
                        obj_ini.veh_loc[com, eqp] = obj_ini.ship_location[shyp];
                        break;
                    }
                    if (obj_ini.veh_role[com, eqp] == "Land Speeder") {
                        obj_ini.veh_lid[com, eqp] = shyp;
                        obj_ini.veh_wid[com, eqp] = 3;
                        obj_ini.veh_loc[com, eqp] = obj_ini.ship_location[shyp];
                        break;
                    }
                    if (obj_ini.veh_role[com, eqp] == "Whirlwind") {
                        obj_ini.veh_lid[com, eqp] = shyp;
                        obj_ini.veh_wid[com, eqp] = 4;
                        obj_ini.veh_loc[com, eqp] = obj_ini.ship_location[shyp];
                        break;
                    }
                }
            }
        }

        remove_size += company_size;
        obj_ini.ship_carrying[shyp] += company_size;
        obj_ini.man_size -= company_size;
        company_size = 0;
    }

    var first_frigate, next_company, squeeze;
    next_company = 1;
    squeeze = 0;
    first_frigate = shyp + 1;

    repeat (20) {
        next_company += 1;
        squeeze = 0;

        if (next_company <= 9) {
            if (next_company == 2) {
                if (obj_ini.ship_size[1] == 3) {
                    shyp = 1;
                    squeeze = 1;
                }
            }

            if (next_company > 2) {
                if (companies_loaded == 1 && obj_ini.ship_size[shyp] > 2) then squeeze = 1;
            }

            if (squeeze == 0) {
                shyp += 1;
                com += 1;
                eqp = 0;
                company_size = 0;
                companies_loaded = 1;

                repeat (500) {
                    eqp += 1;
  // Check if com and eqp are within valid range
    if (com >= 0 && com <= 100 && eqp >= 0 && eqp <= 500) {
        if (obj_ini.role[com, eqp] != "") {
            obj_ini.lid[com, eqp] = shyp;
            obj_ini.wid[com, eqp] = 0;
            obj_ini.loc[com, eqp] = obj_ini.ship_location[shyp];
            company_size += 1;
			
                    if (obj_ini.role[com, eqp] != "") {
                        obj_ini.lid[com, eqp] = shyp;
                        obj_ini.wid[com, eqp] = 0;
                        obj_ini.loc[com, eqp] = obj_ini.ship_location[shyp];
                        company_size += 1;

                        if (obj_ini.armor[com, eqp] == "Terminator Armor") then company_size += 1;
                        if (obj_ini.armor[com, eqp] == "Tartaros") then company_size += 1;
                        if (obj_ini.armor[com, eqp] == "Dreadnought") then company_size += 5;

                        // Load vehicles onto the ship
                        var v;
                        for (v = 1; v <= 5; v++) {
                            if (obj_ini.veh_role[com, eqp] == "Rhino") {
                                obj_ini.veh_lid[com, eqp] = shyp;
                                obj_ini.veh_wid[com, eqp] = 0;
                                obj_ini.veh_loc[com, eqp] = obj_ini.ship_location[shyp];
                                break;
                            }
                            if (obj_ini.veh_role[com, eqp] == "Predator") {
                                obj_ini.veh_lid[com, eqp] = shyp;
                                obj_ini.veh_wid[com, eqp] = 1;
                                obj_ini.veh_loc[com, eqp] = obj_ini.ship_location[shyp];
                                break;
                            }
                            if (obj_ini.veh_role[com, eqp] == "Land Raider") {
                                obj_ini.veh_lid[com, eqp] = shyp;
                                obj_ini.veh_wid[com, eqp] = 2;
                                obj_ini.veh_loc[com, eqp] = obj_ini.ship_location[shyp];
                                break;
                            }
                            if (obj_ini.veh_role[com, eqp] == "Land Speeder") {
                                obj_ini.veh_lid[com, eqp] = shyp;
                                obj_ini.veh_wid[com, eqp] = 3;
                                obj_ini.veh_loc[com, eqp] = obj_ini.ship_location[shyp];
                                break;
                            }
                            if (obj_ini.veh_role[com, eqp] == "Whirlwind") {
                                obj_ini.veh_lid[com, eqp] = shyp;
                                obj_ini.veh_wid[com, eqp] = 4;
                                obj_ini.veh_loc[com, eqp] = obj_ini.ship_location[shyp];
                                break;
                            }
                        }
                    }
                }

                remove_size += company_size;
                obj_ini.ship_carrying[shyp] += company_size;
                obj_ini.man_size -= company_size;
                company_size = 0;
            }
        }
    }

    var num_of_cruisers, last_company;
    num_of_cruisers = 0;
    last_company = 1;

    if (obj_ini.ship_size[first_frigate] == 4) then num_of_cruisers++;

    if (obj_ini.ship_size[first_frigate + 1] == 4) then num_of_cruisers++;

    if (obj_ini.ship_size[first_frigate + 2] == 4) then num_of_cruisers++;

    if (obj_ini.ship_size[first_frigate + 3] == 4) then num_of_cruisers++;

    if (obj_ini.ship_size[first_frigate + 4] == 4) then num_of_cruisers++;

    if (obj_ini.ship_size[first_frigate + 5] == 4) then num_of_cruisers++;

    if (obj_ini.ship_size[first_frigate + 6] == 4) then num_of_cruisers++;

    if (obj_ini.ship_size[first_frigate + 7] == 4) then num_of_cruisers++;

    if (obj_ini.ship_size[first_frigate + 8] == 4) then num_of_cruisers++;

    if (obj_ini.ship_size[first_frigate + 9] == 4) then num_of_cruisers++;

    last_company = 0;

    if (num_of_cruisers == 1) then last_company = 2;

    if (num_of_cruisers == 2) then last_company = 3;

    if (num_of_cruisers == 3) then last_company = 4;

    if (num_of_cruisers == 4) then last_company = 5;

    if (num_of_cruisers == 5) then last_company = 6;

    if (num_of_cruisers == 6) then last_company = 7;

    if (num_of_cruisers == 7) then last_company = 8;

    if (num_of_cruisers == 8) then last_company = 9;

    if (num_of_cruisers == 9) then last_company = 10;

    var max_fr, max_bl, frigate, barge;
    max_fr = 1;
    max_bl = 1;
    frigate = first_frigate;
    barge = 1;

    repeat (10) {
        frigate += 1;
        barge += 1;

        if (obj_ini.ship_size[frigate] == 3) then max_fr += 1;

        if (obj_ini.ship_size[frigate] == 4) then max_bl += 1;

        if (obj_ini.ship_size[frigate] == 4 && barge == 1 && last_company == 1) {
            shyp += 1;
            remove_size += company_size;
            obj_ini.ship_carrying[shyp] += company_size;
            obj_ini.man_size -= company_size;
            company_size = 0;
            com += 1;
            eqp = 0;
            companies_loaded += 1;

            repeat (500) {
                eqp += 1;

                if (obj_ini.role[com, eqp] != "") {
                    obj_ini.lid[com, eqp] = shyp;
                    obj_ini.wid[com, eqp] = 0;
                    obj_ini.loc[com, eqp] = obj_ini.ship_location[shyp];
                    company_size += 1;

                    if (obj_ini.armor[com, eqp] == "Terminator Armor") then company_size += 1;
                    if (obj_ini.armor[com, eqp] == "Tartaros") then company_size += 1;
                    if (obj_ini.armor[com, eqp] == "Dreadnought") then company_size += 5;

                    // Load vehicles onto the ship
                    var v;
                    for (v = 1; v <= 5; v++) {
                        if (obj_ini.veh_role[com, eqp] == "Rhino") {
                            obj_ini.veh_lid[com, eqp] = shyp;
                            obj_ini.veh_wid[com, eqp] = 0;
                            obj_ini.veh_loc[com, eqp] = obj_ini.ship_location[shyp];
                            break;
                        }
                        if (obj_ini.veh_role[com, eqp] == "Predator") {
                            obj_ini.veh_lid[com, eqp] = shyp;
                            obj_ini.veh_wid[com, eqp] = 1;
                            obj_ini.veh_loc[com, eqp] = obj_ini.ship_location[shyp];
                            break;
                        }
                        if (obj_ini.veh_role[com, eqp] == "Land Raider") {
                            obj_ini.veh_lid[com, eqp] = shyp;
                            obj_ini.veh_wid[com, eqp] = 2;
                            obj_ini.veh_loc[com, eqp] = obj_ini.ship_location[shyp];
                            break;
                        }
                        if (obj_ini.veh_role[com, eqp] == "Land Speeder") {
                            obj_ini.veh_lid[com, eqp] = shyp;
                            obj_ini.veh_wid[com, eqp] = 3;
                            obj_ini.veh_loc[com, eqp] = obj_ini.ship_location[shyp];
                            break;
                        }
                        if (obj_ini.veh_role[com, eqp] == "Whirlwind") {
                            obj_ini.veh_lid[com, eqp] = shyp;
                            obj_ini.veh_wid[com, eqp] = 4;
                            obj_ini.veh_loc[com, eqp] = obj_ini.ship_location[shyp];
                            break;
                        }
                    }
                }
            }

            remove_size += company_size;
            obj_ini.ship_carrying[shyp] += company_size;
            obj_ini.man_size -= company_size;
            company_size = 0;
        }

        if (obj_ini.ship_size[frigate] == 4) {
            com += 1;
            eqp = 0;
            companies_loaded += 1;

            repeat (500) {
                eqp += 1;

                if (obj_ini.role[com, eqp] != "") {
                    obj_ini.lid[com, eqp] = frigate;
                    obj_ini.wid[com, eqp] = 0;
                    obj_ini.loc[com, eqp] = obj_ini.ship_location[frigate];
                    company_size += 1;

                    if (obj_ini.armor[com, eqp] == "Terminator Armor") then company_size += 1;
                    if (obj_ini.armor[com, eqp] == "Tartaros") then company_size += 1;
                    if (obj_ini.armor[com, eqp] == "Dreadnought") then company_size += 5;

                    // Load vehicles onto the ship
                    var v;
                    for (v = 1; v <= 5; v++) {
                        if (obj_ini.veh_role[com, eqp] == "Rhino") {
                            obj_ini.veh_lid[com, eqp] = frigate;
                            obj_ini.veh_wid[com, eqp] = 0;
                            obj_ini.veh_loc[com, eqp] = obj_ini.ship_location[frigate];
                            break;
                        }
                        if (obj_ini.veh_role[com, eqp] == "Predator") {
                            obj_ini.veh_lid[com, eqp] = frigate;
                            obj_ini.veh_wid[com, eqp] = 1;
                            obj_ini.veh_loc[com, eqp] = obj_ini.ship_location[frigate];
                            break;
                        }
                        if (obj_ini.veh_role[com, eqp] == "Land Raider") {
                            obj_ini.veh_lid[com, eqp] = frigate;
                            obj_ini.veh_wid[com, eqp] = 2;
                            obj_ini.veh_loc[com, eqp] = obj_ini.ship_location[frigate];
                            break;
                        }
                        if (obj_ini.veh_role[com, eqp] == "Land Speeder") {
                            obj_ini.veh_lid[com, eqp] = frigate;
                            obj_ini.veh_wid[com, eqp] = 3;
                            obj_ini.veh_loc[com, eqp] = obj_ini.ship_location[frigate];
                            break;
                        }
                        if (obj_ini.veh_role[com, eqp] == "Whirlwind") {
                            obj_ini.veh_lid[com, eqp] = frigate;
                            obj_ini.veh_wid[com, eqp] = 4;
                            obj_ini.veh_loc[com, eqp] = obj_ini.ship_location[frigate];
                            break;
                        }
                    }
                }
            }

            remove_size += company_size;
            obj_ini.ship_carrying[frigate] += company_size;
            obj_ini.man_size -= company_size;
            company_size = 0;
        }

        if (frigate == first_frigate + max_fr) then exit;

        if (obj_ini.ship_size[frigate] == 4 && barge == 2 && last_company == 2) {
            shyp += 1;
            remove_size += company_size;
            obj_ini.ship_carrying[shyp] += company_size;
            obj_ini.man_size -= company_size;
            company_size = 0;
            com += 1;
            eqp = 0;
            companies_loaded += 1;

            repeat (500) {
                eqp += 1;

                if (obj_ini.role[com, eqp] != "") {
                    obj_ini.lid[com, eqp] = shyp;
                    obj_ini.wid[com, eqp] = 0;
                    obj_ini.loc[com, eqp] = obj_ini.ship_location[shyp];
                    company_size += 1;

                    if (obj_ini.armor[com, eqp] == "Terminator Armor") then company_size += 1;
                    if (obj_ini.armor[com, eqp] == "Tartaros") then company_size += 1;
                    if (obj_ini.armor[com, eqp] == "Dreadnought") then company_size += 5;

                    // Load vehicles onto the ship
                    var v;
                    for (v = 1; v <= 5; v++) {
                        if (obj_ini.veh_role[com, eqp] == "Rhino") {
                            obj_ini.veh_lid[com, eqp] = shyp;
                            obj_ini.veh_wid[com, eqp] = 0;
                            obj_ini.veh_loc[com, eqp] = obj_ini.ship_location[shyp];
                            break;
                        }
                        if (obj_ini.veh_role[com, eqp] == "Predator") {
                            obj_ini.veh_lid[com, eqp] = shyp;
                            obj_ini.veh_wid[com, eqp] = 1;
                            obj_ini.veh_loc[com, eqp] = obj_ini.ship_location[shyp];
                            break;
                        }
                        if (obj_ini.veh_role[com, eqp] == "Land Raider") {
                            obj_ini.veh_lid[com, eqp] = shyp;
                            obj_ini.veh_wid[com, eqp] = 2;
                            obj_ini.veh_loc[com, eqp] = obj_ini.ship_location[shyp];
                            break;
                        }
                        if (obj_ini.veh_role[com, eqp] == "Land Speeder") {
                            obj_ini.veh_lid[com, eqp] = shyp;
                            obj_ini.veh_wid[com, eqp] = 3;
                            obj_ini.veh_loc[com, eqp] = obj_ini.ship_location[shyp];
                            break;
                        }
                        if (obj_ini.veh_role[com, eqp] == "Whirlwind") {
                            obj_ini.veh_lid[com, eqp] = shyp;
                            obj_ini.veh_wid[com, eqp] = 4;
                            obj_ini.veh_loc[com, eqp] = obj_ini.ship_location[shyp];
                            break;
                        }
                    }
                }
            }

            remove_size += company_size;
            obj_ini.ship_carrying[shyp] += company_size;
            obj_ini.man_size -= company_size;
            company_size = 0;
        }

        if (obj_ini.ship_size[frigate] == 4 && barge == 2) {
            com += 1;
            eqp = 0;
            companies_loaded += 1;

            repeat (500) {
                eqp += 1;

                if (obj_ini.role[com, eqp] != "") {
                    obj_ini.lid[com, eqp] = frigate;
                    obj_ini.wid[com, eqp] = 0;
                    obj_ini.loc[com, eqp] = obj_ini.ship_location[frigate];
                    company_size += 1;

                    if (obj_ini.armor[com, eqp] == "Terminator Armor") then company_size += 1;
                    if (obj_ini.armor[com, eqp] == "Tartaros") then company_size += 1;
                    if (obj_ini.armor[com, eqp] == "Dreadnought") then company_size += 5;

                    // Load vehicles onto the ship
                    var v;
                    for (v = 1; v <= 5; v++) {
                        if (obj_ini.veh_role[com, eqp] == "Rhino") {
                            obj_ini.veh_lid[com, eqp] = frigate;
                            obj_ini.veh_wid[com, eqp] = 0;
                            obj_ini.veh_loc[com, eqp] = obj_ini.ship_location[frigate];
                            break;
                        }
                        if (obj_ini.veh_role[com, eqp] == "Predator") {
                            obj_ini.veh_lid[com, eqp] = frigate;
                            obj_ini.veh_wid[com, eqp] = 1;
                            obj_ini.veh_loc[com, eqp] = obj_ini.ship_location[frigate];
                            break;
                        }
                        if (obj_ini.veh_role[com, eqp] == "Land Raider") {
                            obj_ini.veh_lid[com, eqp] = frigate;
                            obj_ini.veh_wid[com, eqp] = 2;
                            obj_ini.veh_loc[com, eqp] = obj_ini.ship_location[frigate];
                            break;
                        }
                        if (obj_ini.veh_role[com, eqp] == "Land Speeder") {
                            obj_ini.veh_lid[com, eqp] = frigate;
                            obj_ini.veh_wid[com, eqp] = 3;
                            obj_ini.veh_loc[com, eqp] = obj_ini.ship_location[frigate];
                            break;
                        }
                        if (obj_ini.veh_role[com, eqp] == "Whirlwind") {
                            obj_ini.veh_lid[com, eqp] = frigate;
                            obj_ini.veh_wid[com, eqp] = 4;
                            obj_ini.veh_loc[com, eqp] = obj_ini.ship_location[frigate];
                            break;
                        }
                    }
                }
            }

            remove_size += company_size;
            obj_ini.ship_carrying[frigate] += company_size;
            obj_ini.man_size -= company_size;
            company_size = 0;
        }

        if (frigate == first_frigate + max_fr + max_bl) then exit;
    }

    // Drop unsupported companies
    if (remove_size > 0) {
        if (remove_size == obj_ini.man_size) {
            shyp = first_frigate;

            repeat (10) {
                obj_ini.ship_carrying[shyp] = 0;
                shyp += 1;
            }

            obj_ini.man_size = 0;
        }
    }

    obj_ini.companies_loaded = companies_loaded;
    obj_ini.num_of_cruisers = num_of_cruisers;

    obj_ini.max_bl = max_bl;
    obj_ini.max_fr = max_fr;

    obj_ini.barge = barge;
    obj_ini.frigate = frigate;

    obj_ini.remove_size = remove_size;

    // Final check to ensure no companies are left unsupported
    repeat (10) {
        if (obj_ini.man_size > 0 && obj_ini.ship_carrying[shyp] == 0) {
            obj_ini.man_size = 0;
        }
        shyp += 1;
    }
  }
 }
}
