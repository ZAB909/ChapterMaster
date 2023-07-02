function scr_start_load(argument0, argument1, argument2) {
    // argument0: the fleet object
    // argument1: star object
    // argument2: 1 for including escorts, 2 for no escorts

    // This massive clusterfuck of a code distributes the marines and vehicles to the correct ships if the chapter is fleet-based

    /*
    battle_barges
    strike_cruisers
    gladius
    hunters
    */

    var splinter, com, ey, remove_size, company_size, shiyp, shiyp_size, companies_loaded;
    splinter = 0;
    com = -1;
    ey = 0;
    remove_size = 0;
    company_size = 0;
    shiyp = 1;
    shiyp_size = obj_ini.ship_size[shiyp];
    companies_loaded = 1;

    if (string_count("Splinter", obj_ini.strin2) > 0) then splinter = 1;

    repeat (10) {
        com += 1;
        ey = 0;

        repeat (500) {
            ey += 1;

            if (obj_ini.role[com, ey] != "") {
                var n_size;
                n_size = 1;

                if (obj_ini.armor[com, ey] == "Terminator Armor") then n_size += 1;
                if (obj_ini.armor[com, ey] == "Tartaros") then n_size += 1;
                if (obj_ini.armor[com, ey] == "Dreadnought") then n_size += 5;
                if (obj_ini.role[com, ey] == "Chapter Master") then n_size += 1;

                if (obj_ini.ship_carrying[shiyp] + n_size > obj_ini.ship_capacity[shiyp]) {
                    remove_size += company_size;
                    obj_ini.ship_carrying[shiyp] += company_size;
                    obj_ini.man_size -= company_size;
                    company_size = 0;
                    shiyp += 1;
                    companies_loaded = 1;
                }

                obj_ini.lid[com, ey] = shiyp;
                obj_ini.wid[com, ey] = 0;
                obj_ini.loc[com, ey] = obj_ini.ship_location[shiyp];
                company_size += 1;

                if (obj_ini.armor[com, ey] == "Terminator Armor") then company_size += 1;
                if (obj_ini.armor[com, ey] == "Tartaros") then company_size += 1;
                if (obj_ini.armor[com, ey] == "Dreadnought") then company_size += 5;

                // Load vehicles onto the ship
                var v;
                for (v = 1; v <= 5; v++) {
                    if (obj_ini.veh_role[com, ey] == "Rhino") {
                        obj_ini.veh_lid[com, ey] = shiyp;
                        obj_ini.veh_wid[com, ey] = 0;
                        obj_ini.veh_loc[com, ey] = obj_ini.ship_location[shiyp];
                        break;
                    }
                    if (obj_ini.veh_role[com, ey] == "Predator") {
                        obj_ini.veh_lid[com, ey] = shiyp;
                        obj_ini.veh_wid[com, ey] = 1;
                        obj_ini.veh_loc[com, ey] = obj_ini.ship_location[shiyp];
                        break;
                    }
                    if (obj_ini.veh_role[com, ey] == "Land Raider") {
                        obj_ini.veh_lid[com, ey] = shiyp;
                        obj_ini.veh_wid[com, ey] = 2;
                        obj_ini.veh_loc[com, ey] = obj_ini.ship_location[shiyp];
                        break;
                    }
                    if (obj_ini.veh_role[com, ey] == "Land Speeder") {
                        obj_ini.veh_lid[com, ey] = shiyp;
                        obj_ini.veh_wid[com, ey] = 3;
                        obj_ini.veh_loc[com, ey] = obj_ini.ship_location[shiyp];
                        break;
                    }
                    if (obj_ini.veh_role[com, ey] == "Whirlwind") {
                        obj_ini.veh_lid[com, ey] = shiyp;
                        obj_ini.veh_wid[com, ey] = 4;
                        obj_ini.veh_loc[com, ey] = obj_ini.ship_location[shiyp];
                        break;
                    }
                }
            }
        }

        remove_size += company_size;
        obj_ini.ship_carrying[shiyp] += company_size;
        obj_ini.man_size -= company_size;
        company_size = 0;
    }

    var first_frigate, next_company, squeeze;
    next_company = 1;
    squeeze = 0;
    first_frigate = shiyp + 1;

    repeat (20) {
        next_company += 1;
        squeeze = 0;

        if (next_company <= 9) {
            if (next_company == 2) {
                if (obj_ini.ship_size[1] == 3) {
                    shiyp = 1;
                    squeeze = 1;
                }
            }

            if (next_company > 2) {
                if (companies_loaded == 1 && obj_ini.ship_size[shiyp] > 2) then squeeze = 1;
            }

            if (squeeze == 0) {
                shiyp += 1;
                com += 1;
                ey = 0;
                company_size = 0;
                companies_loaded = 1;

                repeat (500) {
                    ey += 1;

                    if (obj_ini.role[com, ey] != "") {
                        obj_ini.lid[com, ey] = shiyp;
                        obj_ini.wid[com, ey] = 0;
                        obj_ini.loc[com, ey] = obj_ini.ship_location[shiyp];
                        company_size += 1;

                        if (obj_ini.armor[com, ey] == "Terminator Armor") then company_size += 1;
                        if (obj_ini.armor[com, ey] == "Tartaros") then company_size += 1;
                        if (obj_ini.armor[com, ey] == "Dreadnought") then company_size += 5;

                        // Load vehicles onto the ship
                        var v;
                        for (v = 1; v <= 5; v++) {
                            if (obj_ini.veh_role[com, ey] == "Rhino") {
                                obj_ini.veh_lid[com, ey] = shiyp;
                                obj_ini.veh_wid[com, ey] = 0;
                                obj_ini.veh_loc[com, ey] = obj_ini.ship_location[shiyp];
                                break;
                            }
                            if (obj_ini.veh_role[com, ey] == "Predator") {
                                obj_ini.veh_lid[com, ey] = shiyp;
                                obj_ini.veh_wid[com, ey] = 1;
                                obj_ini.veh_loc[com, ey] = obj_ini.ship_location[shiyp];
                                break;
                            }
                            if (obj_ini.veh_role[com, ey] == "Land Raider") {
                                obj_ini.veh_lid[com, ey] = shiyp;
                                obj_ini.veh_wid[com, ey] = 2;
                                obj_ini.veh_loc[com, ey] = obj_ini.ship_location[shiyp];
                                break;
                            }
                            if (obj_ini.veh_role[com, ey] == "Land Speeder") {
                                obj_ini.veh_lid[com, ey] = shiyp;
                                obj_ini.veh_wid[com, ey] = 3;
                                obj_ini.veh_loc[com, ey] = obj_ini.ship_location[shiyp];
                                break;
                            }
                            if (obj_ini.veh_role[com, ey] == "Whirlwind") {
                                obj_ini.veh_lid[com, ey] = shiyp;
                                obj_ini.veh_wid[com, ey] = 4;
                                obj_ini.veh_loc[com, ey] = obj_ini.ship_location[shiyp];
                                break;
                            }
                        }
                    }
                }

                remove_size += company_size;
                obj_ini.ship_carrying[shiyp] += company_size;
                obj_ini.man_size -= company_size;
                company_size = 0;
            }
        }
    }

    var num_of_cruisers, last_company;
    num_of_cruisers = 0;
    last_company = 1;

    if (obj_ini.ship_size[first_frigate] == 4) then num_of_cruisers += 1;

    if (obj_ini.ship_size[first_frigate + 1] == 4) then num_of_cruisers += 1;

    if (obj_ini.ship_size[first_frigate + 2] == 4) then num_of_cruisers += 1;

    if (obj_ini.ship_size[first_frigate + 3] == 4) then num_of_cruisers += 1;

    if (obj_ini.ship_size[first_frigate + 4] == 4) then num_of_cruisers += 1;

    if (obj_ini.ship_size[first_frigate + 5] == 4) then num_of_cruisers += 1;

    if (obj_ini.ship_size[first_frigate + 6] == 4) then num_of_cruisers += 1;

    if (obj_ini.ship_size[first_frigate + 7] == 4) then num_of_cruisers += 1;

    if (obj_ini.ship_size[first_frigate + 8] == 4) then num_of_cruisers += 1;

    if (obj_ini.ship_size[first_frigate + 9] == 4) then num_of_cruisers += 1;

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
            shiyp += 1;
            remove_size += company_size;
            obj_ini.ship_carrying[shiyp] += company_size;
            obj_ini.man_size -= company_size;
            company_size = 0;
            com += 1;
            ey = 0;
            companies_loaded += 1;

            repeat (500) {
                ey += 1;

                if (obj_ini.role[com, ey] != "") {
                    obj_ini.lid[com, ey] = shiyp;
                    obj_ini.wid[com, ey] = 0;
                    obj_ini.loc[com, ey] = obj_ini.ship_location[shiyp];
                    company_size += 1;

                    if (obj_ini.armor[com, ey] == "Terminator Armor") then company_size += 1;
                    if (obj_ini.armor[com, ey] == "Tartaros") then company_size += 1;
                    if (obj_ini.armor[com, ey] == "Dreadnought") then company_size += 5;

                    // Load vehicles onto the ship
                    var v;
                    for (v = 1; v <= 5; v++) {
                        if (obj_ini.veh_role[com, ey] == "Rhino") {
                            obj_ini.veh_lid[com, ey] = shiyp;
                            obj_ini.veh_wid[com, ey] = 0;
                            obj_ini.veh_loc[com, ey] = obj_ini.ship_location[shiyp];
                            break;
                        }
                        if (obj_ini.veh_role[com, ey] == "Predator") {
                            obj_ini.veh_lid[com, ey] = shiyp;
                            obj_ini.veh_wid[com, ey] = 1;
                            obj_ini.veh_loc[com, ey] = obj_ini.ship_location[shiyp];
                            break;
                        }
                        if (obj_ini.veh_role[com, ey] == "Land Raider") {
                            obj_ini.veh_lid[com, ey] = shiyp;
                            obj_ini.veh_wid[com, ey] = 2;
                            obj_ini.veh_loc[com, ey] = obj_ini.ship_location[shiyp];
                            break;
                        }
                        if (obj_ini.veh_role[com, ey] == "Land Speeder") {
                            obj_ini.veh_lid[com, ey] = shiyp;
                            obj_ini.veh_wid[com, ey] = 3;
                            obj_ini.veh_loc[com, ey] = obj_ini.ship_location[shiyp];
                            break;
                        }
                        if (obj_ini.veh_role[com, ey] == "Whirlwind") {
                            obj_ini.veh_lid[com, ey] = shiyp;
                            obj_ini.veh_wid[com, ey] = 4;
                            obj_ini.veh_loc[com, ey] = obj_ini.ship_location[shiyp];
                            break;
                        }
                    }
                }
            }

            remove_size += company_size;
            obj_ini.ship_carrying[shiyp] += company_size;
            obj_ini.man_size -= company_size;
            company_size = 0;
        }

        if (obj_ini.ship_size[frigate] == 4) {
            com += 1;
            ey = 0;
            companies_loaded += 1;

            repeat (500) {
                ey += 1;

                if (obj_ini.role[com, ey] != "") {
                    obj_ini.lid[com, ey] = frigate;
                    obj_ini.wid[com, ey] = 0;
                    obj_ini.loc[com, ey] = obj_ini.ship_location[frigate];
                    company_size += 1;

                    if (obj_ini.armor[com, ey] == "Terminator Armor") then company_size += 1;
                    if (obj_ini.armor[com, ey] == "Tartaros") then company_size += 1;
                    if (obj_ini.armor[com, ey] == "Dreadnought") then company_size += 5;

                    // Load vehicles onto the ship
                    var v;
                    for (v = 1; v <= 5; v++) {
                        if (obj_ini.veh_role[com, ey] == "Rhino") {
                            obj_ini.veh_lid[com, ey] = frigate;
                            obj_ini.veh_wid[com, ey] = 0;
                            obj_ini.veh_loc[com, ey] = obj_ini.ship_location[frigate];
                            break;
                        }
                        if (obj_ini.veh_role[com, ey] == "Predator") {
                            obj_ini.veh_lid[com, ey] = frigate;
                            obj_ini.veh_wid[com, ey] = 1;
                            obj_ini.veh_loc[com, ey] = obj_ini.ship_location[frigate];
                            break;
                        }
                        if (obj_ini.veh_role[com, ey] == "Land Raider") {
                            obj_ini.veh_lid[com, ey] = frigate;
                            obj_ini.veh_wid[com, ey] = 2;
                            obj_ini.veh_loc[com, ey] = obj_ini.ship_location[frigate];
                            break;
                        }
                        if (obj_ini.veh_role[com, ey] == "Land Speeder") {
                            obj_ini.veh_lid[com, ey] = frigate;
                            obj_ini.veh_wid[com, ey] = 3;
                            obj_ini.veh_loc[com, ey] = obj_ini.ship_location[frigate];
                            break;
                        }
                        if (obj_ini.veh_role[com, ey] == "Whirlwind") {
                            obj_ini.veh_lid[com, ey] = frigate;
                            obj_ini.veh_wid[com, ey] = 4;
                            obj_ini.veh_loc[com, ey] = obj_ini.ship_location[frigate];
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
            shiyp += 1;
            remove_size += company_size;
            obj_ini.ship_carrying[shiyp] += company_size;
            obj_ini.man_size -= company_size;
            company_size = 0;
            com += 1;
            ey = 0;
            companies_loaded += 1;

            repeat (500) {
                ey += 1;

                if (obj_ini.role[com, ey] != "") {
                    obj_ini.lid[com, ey] = shiyp;
                    obj_ini.wid[com, ey] = 0;
                    obj_ini.loc[com, ey] = obj_ini.ship_location[shiyp];
                    company_size += 1;

                    if (obj_ini.armor[com, ey] == "Terminator Armor") then company_size += 1;
                    if (obj_ini.armor[com, ey] == "Tartaros") then company_size += 1;
                    if (obj_ini.armor[com, ey] == "Dreadnought") then company_size += 5;

                    // Load vehicles onto the ship
                    var v;
                    for (v = 1; v <= 5; v++) {
                        if (obj_ini.veh_role[com, ey] == "Rhino") {
                            obj_ini.veh_lid[com, ey] = shiyp;
                            obj_ini.veh_wid[com, ey] = 0;
                            obj_ini.veh_loc[com, ey] = obj_ini.ship_location[shiyp];
                            break;
                        }
                        if (obj_ini.veh_role[com, ey] == "Predator") {
                            obj_ini.veh_lid[com, ey] = shiyp;
                            obj_ini.veh_wid[com, ey] = 1;
                            obj_ini.veh_loc[com, ey] = obj_ini.ship_location[shiyp];
                            break;
                        }
                        if (obj_ini.veh_role[com, ey] == "Land Raider") {
                            obj_ini.veh_lid[com, ey] = shiyp;
                            obj_ini.veh_wid[com, ey] = 2;
                            obj_ini.veh_loc[com, ey] = obj_ini.ship_location[shiyp];
                            break;
                        }
                        if (obj_ini.veh_role[com, ey] == "Land Speeder") {
                            obj_ini.veh_lid[com, ey] = shiyp;
                            obj_ini.veh_wid[com, ey] = 3;
                            obj_ini.veh_loc[com, ey] = obj_ini.ship_location[shiyp];
                            break;
                        }
                        if (obj_ini.veh_role[com, ey] == "Whirlwind") {
                            obj_ini.veh_lid[com, ey] = shiyp;
                            obj_ini.veh_wid[com, ey] = 4;
                            obj_ini.veh_loc[com, ey] = obj_ini.ship_location[shiyp];
                            break;
                        }
                    }
                }
            }

            remove_size += company_size;
            obj_ini.ship_carrying[shiyp] += company_size;
            obj_ini.man_size -= company_size;
            company_size = 0;
        }

        if (obj_ini.ship_size[frigate] == 4 && barge == 2) {
            com += 1;
            ey = 0;
            companies_loaded += 1;

            repeat (500) {
                ey += 1;

                if (obj_ini.role[com, ey] != "") {
                    obj_ini.lid[com, ey] = frigate;
                    obj_ini.wid[com, ey] = 0;
                    obj_ini.loc[com, ey] = obj_ini.ship_location[frigate];
                    company_size += 1;

                    if (obj_ini.armor[com, ey] == "Terminator Armor") then company_size += 1;
                    if (obj_ini.armor[com, ey] == "Tartaros") then company_size += 1;
                    if (obj_ini.armor[com, ey] == "Dreadnought") then company_size += 5;

                    // Load vehicles onto the ship
                    var v;
                    for (v = 1; v <= 5; v++) {
                        if (obj_ini.veh_role[com, ey] == "Rhino") {
                            obj_ini.veh_lid[com, ey] = frigate;
                            obj_ini.veh_wid[com, ey] = 0;
                            obj_ini.veh_loc[com, ey] = obj_ini.ship_location[frigate];
                            break;
                        }
                        if (obj_ini.veh_role[com, ey] == "Predator") {
                            obj_ini.veh_lid[com, ey] = frigate;
                            obj_ini.veh_wid[com, ey] = 1;
                            obj_ini.veh_loc[com, ey] = obj_ini.ship_location[frigate];
                            break;
                        }
                        if (obj_ini.veh_role[com, ey] == "Land Raider") {
                            obj_ini.veh_lid[com, ey] = frigate;
                            obj_ini.veh_wid[com, ey] = 2;
                            obj_ini.veh_loc[com, ey] = obj_ini.ship_location[frigate];
                            break;
                        }
                        if (obj_ini.veh_role[com, ey] == "Land Speeder") {
                            obj_ini.veh_lid[com, ey] = frigate;
                            obj_ini.veh_wid[com, ey] = 3;
                            obj_ini.veh_loc[com, ey] = obj_ini.ship_location[frigate];
                            break;
                        }
                        if (obj_ini.veh_role[com, ey] == "Whirlwind") {
                            obj_ini.veh_lid[com, ey] = frigate;
                            obj_ini.veh_wid[com, ey] = 4;
                            obj_ini.veh_loc[com, ey] = obj_ini.ship_location[frigate];
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
            shiyp = first_frigate;

            repeat (10) {
                obj_ini.ship_carrying[shiyp] = 0;
                shiyp += 1;
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
        if (obj_ini.man_size > 0 && obj_ini.ship_carrying[shiyp] == 0) {
            obj_ini.man_size = 0;
        }
        shiyp += 1;
    }
}