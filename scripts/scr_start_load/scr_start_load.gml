function scr_start_load(fleet, load_from_star, escort_load) {
    // fleet: the fleet object
    // load_from_star: star object
    // escort_load: 1 for including escorts, 2 for no escorts

    // this distributes the marines and vehicles to the correct ships if the chapter is fleet-based or a home-based chapter
	
	var _vehicles = ["Rhino", "Predator", "Land Speeder", "Land Raider", "Whirlwind"]
	function load_vehicles(_companies, _equip ,_ship, size){
			obj_ini.veh_wid[_companies, _equip] = 0;
			obj_ini.veh_lid[_companies, _equip] = _ship;
			obj_ini.veh_loc[_companies, _equip] = obj_ini.ship_location[_ship];	
			obj_ini.ship_carrying[_ship] -= size;
	}
	function load_marine(_company, _unit, _ship, size){
             obj_ini.lid[_company, _unit] = _ship;
             obj_ini.wid[_company, _unit] = 0;
			obj_ini.loc[_company, _unit] = obj_ini.ship_location[_ship];
			obj_ini.ship_carrying[_ship] -= size;
	}
    var splinter, company_size, ship, ship_size, companies_loaded;
    splinter = 0;
    _companies = -1; // all companies for this script
    _equip = 0; //vehicle or armour(equip)
    remove_size = 0;
    company_size = 0;
    ship = 1;
    //ship_size = obj_ini.ship_size[ship];
    companies_loaded = 1;
	var ship_return = 1;
	var ship_has_space =true;

    if (string_count("Splinter", obj_ini.strin2) > 0) then splinter = 1;

    repeat (10) {
        _companies += 1;
        _equip = 0;

        repeat (500) {
            _equip += 1;

            if (obj_ini.role[_companies, _equip] != "") {
                var n_size;
                n_size = 1;

                if (obj_ini.armour[_companies, _equip] == "Terminator Armour") then n_size += 1;
                if (obj_ini.armour[_companies, _equip] == "Tartaros") then n_size += 1;
                if (obj_ini.armour[_companies, _equip] == "Dreadnought") then n_size += 5;
                if (obj_ini.role[_companies, _equip] == "Chapter Master") then n_size += 1;

                if (obj_ini.ship_carrying[ship] + n_size > obj_ini.ship_capacity[ship]) {
                    remove_size += company_size;
                    obj_ini.ship_carrying[ship] += company_size;
                    obj_ini.man_size -= company_size;
                    company_size = 0;
                    ship += 1;
                    companies_loaded = 1;
                }

                obj_ini.lid[_companies, _equip] = ship;
                obj_ini.wid[_companies, _equip] = 0;
                obj_ini.loc[_companies, _equip] = obj_ini.ship_location[ship];
                company_size += 1;

                if (obj_ini.armour[_companies, _equip] == "Terminator Armour") then company_size += 1;
                if (obj_ini.armour[_companies, _equip] == "Tartaros") then company_size += 1;
                if (obj_ini.armour[_companies, _equip] == "Dreadnought") then company_size += 5;

                // Load vehicles onto the ship
                var v;
                for (v = 1; v <= 5; v++) {
                    if (obj_ini.veh_role[_companies, _equip] == "Rhino") {
                        obj_ini.veh_lid[_companies, _equip] = ship;
                        obj_ini.veh_wid[_companies, _equip] = 0;
                        obj_ini.veh_loc[_companies, _equip] = obj_ini.ship_location[ship];
                        break;
                    }
                    if (obj_ini.veh_role[_companies, _equip] == "Predator") {
                        obj_ini.veh_lid[_companies, _equip] = ship;
                        obj_ini.veh_wid[_companies, _equip] = 1;
                        obj_ini.veh_loc[_companies, _equip] = obj_ini.ship_location[ship];
                        break;
                    }
                    if (obj_ini.veh_role[_companies, _equip] == "Land Raider") {
                        obj_ini.veh_lid[_companies, _equip] = ship;
                        obj_ini.veh_wid[_companies, _equip] = 2;
                        obj_ini.veh_loc[_companies, _equip] = obj_ini.ship_location[ship];
                        break;
                    }
                    if (obj_ini.veh_role[_companies, _equip] == "Land Speeder") {
                        obj_ini.veh_lid[_companies, _equip] = ship;
                        obj_ini.veh_wid[_companies, _equip] = 3;
                        obj_ini.veh_loc[_companies, _equip] = obj_ini.ship_location[ship];
                        break;
                    }
                    if (obj_ini.veh_role[_companies, _equip] == "Whirlwind") {
                        obj_ini.veh_lid[_companies, _equip] = ship;
                        obj_ini.veh_wid[_companies, _equip] = 4;
                        obj_ini.veh_loc[_companies, _equip] = obj_ini.ship_location[ship];
                        break;
                    }
                }
            }
        }

        remove_size += company_size;
        obj_ini.ship_carrying[ship] += company_size;
        obj_ini.man_size -= company_size;
        company_size = 0;
    }

    var first_frigate, next_company, squeeze;
    next_company = 1;
    squeeze = 0;
    first_frigate = ship + 1;

    repeat (20) {
        next_company += 1;
        squeeze = 0;

        if (next_company <= 9) {
            if (next_company == 2) {
                if (obj_ini.ship_size[1] == 3) {
                    ship = 1;
                    squeeze = 1;
                }
            }

            if (next_company > 2) {
                if (companies_loaded == 1 && obj_ini.ship_size[ship] > 2) then squeeze = 1;
            }

            if (squeeze == 0) {
                ship += 1;
                _companies += 1;
                _equip = 0;
                company_size = 0;
                companies_loaded = 1;

                repeat (500) {
                    _equip += 1;
  // Check if _companies and _equip are within valid range
    if (_companies >= 0 && _companies <= 100 && _equip >= 0 && _equip <= 500) {
        if (obj_ini.role[_companies, _equip] != "") {
            obj_ini.lid[_companies, _equip] = ship;
            obj_ini.wid[_companies, _equip] = 0;
            obj_ini.loc[_companies, _equip] = obj_ini.ship_location[ship];
            company_size += 1;
			
                    if (obj_ini.role[_companies, _equip] != "") {
                        obj_ini.lid[_companies, _equip] = ship;
                        obj_ini.wid[_companies, _equip] = 0;
                        obj_ini.loc[_companies, _equip] = obj_ini.ship_location[ship];
                        company_size += 1;

                        if (obj_ini.armour[_companies, _equip] == "Terminator Armour") then company_size += 1;
                        if (obj_ini.armour[_companies, _equip] == "Tartaros") then company_size += 1;
                        if (obj_ini.armour[_companies, _equip] == "Dreadnought") then company_size += 5;

                        // Load vehicles onto the ship
                        var v;
                        for (v = 1; v <= 5; v++) {
                            if (obj_ini.veh_role[_companies, _equip] == "Rhino") {
                                obj_ini.veh_lid[_companies, _equip] = ship;
                                obj_ini.veh_wid[_companies, _equip] = 0;
                                obj_ini.veh_loc[_companies, _equip] = obj_ini.ship_location[ship];
                                break;
                            }
                            if (obj_ini.veh_role[_companies, _equip] == "Predator") {
                                obj_ini.veh_lid[_companies, _equip] = ship;
                                obj_ini.veh_wid[_companies, _equip] = 1;
                                obj_ini.veh_loc[_companies, _equip] = obj_ini.ship_location[ship];
                                break;
                            }
                            if (obj_ini.veh_role[_companies, _equip] == "Land Raider") {
                                obj_ini.veh_lid[_companies, _equip] = ship;
                                obj_ini.veh_wid[_companies, _equip] = 2;
                                obj_ini.veh_loc[_companies, _equip] = obj_ini.ship_location[ship];
                                break;
                            }
                            if (obj_ini.veh_role[_companies, _equip] == "Land Speeder") {
                                obj_ini.veh_lid[_companies, _equip] = ship;
                                obj_ini.veh_wid[_companies, _equip] = 3;
                                obj_ini.veh_loc[_companies, _equip] = obj_ini.ship_location[ship];
                                break;
                            }
                            if (obj_ini.veh_role[_companies, _equip] == "Whirlwind") {
                                obj_ini.veh_lid[_companies, _equip] = ship;
                                obj_ini.veh_wid[_companies, _equip] = 4;
                                obj_ini.veh_loc[_companies, _equip] = obj_ini.ship_location[ship];
                                break;
                            }
                        }
                    }
                }

                remove_size += company_size;
                obj_ini.ship_carrying[ship] += company_size;
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
            ship += 1;
            remove_size += company_size;
            obj_ini.ship_carrying[ship] += company_size;
            obj_ini.man_size -= company_size;
            company_size = 0;
            _companies += 1;
            _equip = 0;
            companies_loaded += 1;

            repeat (500) {
                _equip += 1;

                if (obj_ini.role[_companies, _equip] != "") {
                    obj_ini.lid[_companies, _equip] = ship;
                    obj_ini.wid[_companies, _equip] = 0;
                    obj_ini.loc[_companies, _equip] = obj_ini.ship_location[ship];
                    company_size += 1;

                    if (obj_ini.armour[_companies, _equip] == "Terminator Armour") then company_size += 1;
                    if (obj_ini.armour[_companies, _equip] == "Tartaros") then company_size += 1;
                    if (obj_ini.armour[_companies, _equip] == "Dreadnought") then company_size += 5;

                    // Load vehicles onto the ship
                    var v;
                    for (v = 1; v <= 5; v++) {
                        if (obj_ini.veh_role[_companies, _equip] == "Rhino") {
                            obj_ini.veh_lid[_companies, _equip] = ship;
                            obj_ini.veh_wid[_companies, _equip] = 0;
                            obj_ini.veh_loc[_companies, _equip] = obj_ini.ship_location[ship];
                            break;
                        }
                        if (obj_ini.veh_role[_companies, _equip] == "Predator") {
                            obj_ini.veh_lid[_companies, _equip] = ship;
                            obj_ini.veh_wid[_companies, _equip] = 1;
                            obj_ini.veh_loc[_companies, _equip] = obj_ini.ship_location[ship];
                            break;
                        }
                        if (obj_ini.veh_role[_companies, _equip] == "Land Raider") {
                            obj_ini.veh_lid[_companies, _equip] = ship;
                            obj_ini.veh_wid[_companies, _equip] = 2;
                            obj_ini.veh_loc[_companies, _equip] = obj_ini.ship_location[ship];
                            break;
                        }
                        if (obj_ini.veh_role[_companies, _equip] == "Land Speeder") {
                            obj_ini.veh_lid[_companies, _equip] = ship;
                            obj_ini.veh_wid[_companies, _equip] = 3;
                            obj_ini.veh_loc[_companies, _equip] = obj_ini.ship_location[ship];
                            break;
                        }
                        if (obj_ini.veh_role[_companies, _equip] == "Whirlwind") {
                            obj_ini.veh_lid[_companies, _equip] = ship;
                            obj_ini.veh_wid[_companies, _equip] = 4;
                            obj_ini.veh_loc[_companies, _equip] = obj_ini.ship_location[ship];
                            break;
                        }
                    }
                }
            }

            remove_size += company_size;
            obj_ini.ship_carrying[ship] += company_size;
            obj_ini.man_size -= company_size;
            company_size = 0;
        }

        if (obj_ini.ship_size[frigate] == 4) {
            _companies += 1;
            _equip = 0;
            companies_loaded += 1;

            repeat (500) {
                _equip += 1;

                if (obj_ini.role[_companies, _equip] != "") {
                    obj_ini.lid[_companies, _equip] = frigate;
                    obj_ini.wid[_companies, _equip] = 0;
                    obj_ini.loc[_companies, _equip] = obj_ini.ship_location[frigate];
                    company_size += 1;

                    if (obj_ini.armour[_companies, _equip] == "Terminator Armour") then company_size += 1;
                    if (obj_ini.armour[_companies, _equip] == "Tartaros") then company_size += 1;
                    if (obj_ini.armour[_companies, _equip] == "Dreadnought") then company_size += 5;

                    // Load vehicles onto the ship
                    var v;
                    for (v = 1; v <= 5; v++) {
                        if (obj_ini.veh_role[_companies, _equip] == "Rhino") {
                            obj_ini.veh_lid[_companies, _equip] = frigate;
                            obj_ini.veh_wid[_companies, _equip] = 0;
                            obj_ini.veh_loc[_companies, _equip] = obj_ini.ship_location[frigate];
                            break;
                        }
                        if (obj_ini.veh_role[_companies, _equip] == "Predator") {
                            obj_ini.veh_lid[_companies, _equip] = frigate;
                            obj_ini.veh_wid[_companies, _equip] = 1;
                            obj_ini.veh_loc[_companies, _equip] = obj_ini.ship_location[frigate];
                            break;
                        }
                        if (obj_ini.veh_role[_companies, _equip] == "Land Raider") {
                            obj_ini.veh_lid[_companies, _equip] = frigate;
                            obj_ini.veh_wid[_companies, _equip] = 2;
                            obj_ini.veh_loc[_companies, _equip] = obj_ini.ship_location[frigate];
                            break;
                        }
                        if (obj_ini.veh_role[_companies, _equip] == "Land Speeder") {
                            obj_ini.veh_lid[_companies, _equip] = frigate;
                            obj_ini.veh_wid[_companies, _equip] = 3;
                            obj_ini.veh_loc[_companies, _equip] = obj_ini.ship_location[frigate];
                            break;
                        }
                        if (obj_ini.veh_role[_companies, _equip] == "Whirlwind") {
                            obj_ini.veh_lid[_companies, _equip] = frigate;
                            obj_ini.veh_wid[_companies, _equip] = 4;
                            obj_ini.veh_loc[_companies, _equip] = obj_ini.ship_location[frigate];
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
            ship += 1;
            remove_size += company_size;
            obj_ini.ship_carrying[ship] += company_size;
            obj_ini.man_size -= company_size;
            company_size = 0;
            _companies += 1;
            _equip = 0;
            companies_loaded += 1;

            repeat (500) {
                _equip += 1;

                if (obj_ini.role[_companies, _equip] != "") {
                    obj_ini.lid[_companies, _equip] = ship;
                    obj_ini.wid[_companies, _equip] = 0;
                    obj_ini.loc[_companies, _equip] = obj_ini.ship_location[ship];
                    company_size += 1;

                    if (obj_ini.armour[_companies, _equip] == "Terminator Armour") then company_size += 1;
                    if (obj_ini.armour[_companies, _equip] == "Tartaros") then company_size += 1;
                    if (obj_ini.armour[_companies, _equip] == "Dreadnought") then company_size += 5;

                    // Load vehicles onto the ship
                    var v;
                    for (v = 1; v <= 5; v++) {
                        if (obj_ini.veh_role[_companies, _equip] == "Rhino") {
                            obj_ini.veh_lid[_companies, _equip] = ship;
                            obj_ini.veh_wid[_companies, _equip] = 0;
                            obj_ini.veh_loc[_companies, _equip] = obj_ini.ship_location[ship];
                            break;
                        }
                        if (obj_ini.veh_role[_companies, _equip] == "Predator") {
                            obj_ini.veh_lid[_companies, _equip] = ship;
                            obj_ini.veh_wid[_companies, _equip] = 1;
                            obj_ini.veh_loc[_companies, _equip] = obj_ini.ship_location[ship];
                            break;
                        }
                        if (obj_ini.veh_role[_companies, _equip] == "Land Raider") {
                            obj_ini.veh_lid[_companies, _equip] = ship;
                            obj_ini.veh_wid[_companies, _equip] = 2;
                            obj_ini.veh_loc[_companies, _equip] = obj_ini.ship_location[ship];
                            break;
                        }
                        if (obj_ini.veh_role[_companies, _equip] == "Land Speeder") {
                            obj_ini.veh_lid[_companies, _equip] = ship;
                            obj_ini.veh_wid[_companies, _equip] = 3;
                            obj_ini.veh_loc[_companies, _equip] = obj_ini.ship_location[ship];
                            break;
                        }
                        if (obj_ini.veh_role[_companies, _equip] == "Whirlwind") {
                            obj_ini.veh_lid[_companies, _equip] = ship;
                            obj_ini.veh_wid[_companies, _equip] = 4;
                            obj_ini.veh_loc[_companies, _equip] = obj_ini.ship_location[ship];
                            break;
                        }
                    }
                }
            }

            remove_size += company_size;
            obj_ini.ship_carrying[ship] += company_size;
            obj_ini.man_size -= company_size;
            company_size = 0;
        }

        if (obj_ini.ship_size[frigate] == 4 && barge == 2) {
            _companies += 1;
            _equip = 0;
            companies_loaded += 1;

            repeat (500) {
                _equip += 1;

                if (obj_ini.role[_companies, _equip] != "") {
                    obj_ini.lid[_companies, _equip] = frigate;
                    obj_ini.wid[_companies, _equip] = 0;
                    obj_ini.loc[_companies, _equip] = obj_ini.ship_location[frigate];
                    company_size += 1;

                    if (obj_ini.armour[_companies, _equip] == "Terminator Armour") then company_size += 1;
                    if (obj_ini.armour[_companies, _equip] == "Tartaros") then company_size += 1;
                    if (obj_ini.armour[_companies, _equip] == "Dreadnought") then company_size += 5;

                    // Load vehicles onto the ship
                    var v;
                    for (v = 1; v <= 5; v++) {
                        if (obj_ini.veh_role[_companies, _equip] == "Rhino") {
                            obj_ini.veh_lid[_companies, _equip] = frigate;
                            obj_ini.veh_wid[_companies, _equip] = 0;
                            obj_ini.veh_loc[_companies, _equip] = obj_ini.ship_location[frigate];
                            break;
                        }
                        if (obj_ini.veh_role[_companies, _equip] == "Predator") {
                            obj_ini.veh_lid[_companies, _equip] = frigate;
                            obj_ini.veh_wid[_companies, _equip] = 1;
                            obj_ini.veh_loc[_companies, _equip] = obj_ini.ship_location[frigate];
                            break;
                        }
                        if (obj_ini.veh_role[_companies, _equip] == "Land Raider") {
                            obj_ini.veh_lid[_companies, _equip] = frigate;
                            obj_ini.veh_wid[_companies, _equip] = 2;
                            obj_ini.veh_loc[_companies, _equip] = obj_ini.ship_location[frigate];
                            break;
                        }
                        if (obj_ini.veh_role[_companies, _equip] == "Land Speeder") {
                            obj_ini.veh_lid[_companies, _equip] = frigate;
                            obj_ini.veh_wid[_companies, _equip] = 3;
                            obj_ini.veh_loc[_companies, _equip] = obj_ini.ship_location[frigate];
                            break;
                        }
                        if (obj_ini.veh_role[_companies, _equip] == "Whirlwind") {
                            obj_ini.veh_lid[_companies, _equip] = frigate;
                            obj_ini.veh_wid[_companies, _equip] = 4;
                            obj_ini.veh_loc[_companies, _equip] = obj_ini.ship_location[frigate];
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
            ship = first_frigate;

            repeat (10) {
                obj_ini.ship_carrying[ship] = 0;
                ship += 1;
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
        if (obj_ini.man_size > 0 && obj_ini.ship_carrying[ship] == 0) {
            obj_ini.man_size = 0;
        }
        ship += 1;
    }
  }
 }
}
