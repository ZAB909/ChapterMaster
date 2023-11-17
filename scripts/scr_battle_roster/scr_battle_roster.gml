function scr_battle_roster(required_location, _target_location, _is_planet) {

    // Determines who all will be present for the battle

    // argument 0 : planet or ship name
    // argument 1 : world number (wid)
    // argument 2 : is it a planet?  boolean

    //--------------------------------------------------------------------------------------------------------------------
    // Global objects used.
    //--------------------------------------------------------------------------------------------------------------------
    deploying_unit = obj_ini;
    new_combat = obj_ncombat;
    //???=obj_drop_select;
    //???=obj_controller
    //--------------------------------------------------------------------------------------------------------------------

    // show_message("Container:"+string(_battle_loci)+", number:"+string(_loci_specific)+", planet?:"+string(_is_planet));

    var stop, okay, sofar, man_limit_reached, man_size_count, unit, unit_location, _u_role;
    stop = 0;
    okay = 0;
    sofar = 0;
    man_limit_reached = false;
    man_size_count = 0;


    // Formation here
    obj_controller.bat_devastator_column = obj_controller.bat_deva_for[new_combat.formation_set];
    obj_controller.bat_assault_column = obj_controller.bat_assa_for[new_combat.formation_set];
    obj_controller.bat_tactical_column = obj_controller.bat_tact_for[new_combat.formation_set];
    obj_controller.bat_veteran_column = obj_controller.bat_vete_for[new_combat.formation_set];
    obj_controller.bat_hire_column = obj_controller.bat_hire_for[new_combat.formation_set];
    obj_controller.bat_librarian_column = obj_controller.bat_libr_for[new_combat.formation_set];
    obj_controller.bat_command_column = obj_controller.bat_comm_for[new_combat.formation_set];
    obj_controller.bat_techmarine_column = obj_controller.bat_tech_for[new_combat.formation_set];
    obj_controller.bat_terminator_column = obj_controller.bat_term_for[new_combat.formation_set];
    obj_controller.bat_honor_column = obj_controller.bat_hono_for[new_combat.formation_set];
    obj_controller.bat_dreadnought_column = obj_controller.bat_drea_for[new_combat.formation_set];
    obj_controller.bat_rhino_column = obj_controller.bat_rhin_for[new_combat.formation_set];
    obj_controller.bat_predator_column = obj_controller.bat_pred_for[new_combat.formation_set];
    obj_controller.bat_landraider_column = obj_controller.bat_land_for[new_combat.formation_set];
    obj_controller.bat_scout_column = obj_controller.bat_scou_for[new_combat.formation_set];

    var company = -1;
    var v = 0;
    var meeting = false;

    instance_activate_object(obj_pnunit);

    //For each company and the HQ
    repeat(11) {
        if (man_limit_reached) {
            break;
        }
        company++;
        v = 0;
		// HACK The below comment + while definition are commented out, since they seem to cause a CTD on battle start. We'll need to take a better look soon.
        // //For each marine in that company, while unit exists (either marine name or vehicle role, vehicles have no names saved)
        // //Marines and vehicles get added AT THE SAME TIME, (index [0][1] adds marine AND vehicle at index at the same time for loop x)
        // //This is possible since array for saving vehicles and marines are separated
        // //v<300 is an arbitrary number, probably linked to a company unit limit somewhere
        // // while ((deploying_unit.name[company][v] != "" ||
        // //         deploying_unit.veh_role[company][v] != "") && v < 300) {
		for (v=1;v<array_length(obj_ini.TTRPG[company]);v++){
            okay = 0;
			unit = obj_ini.TTRPG[company][v];
			if (unit.name() == ""){continue}
            if (man_limit_reached) {
                break;
            }
            unit_location =  unit.marine_location();
            //array[0] set to 0, so the proper array starts at array[1], for some reason

            if (stop == 0) {
                //Special (okay -1) battle cases go here
                if (string_count("spyrer", new_combat.battle_special) > 0) or(new_combat.battle_special == "space_hulk") or(string_count("chaos_meeting", new_combat.battle_special) > 0) {
                    if (string_count("Dread", deploying_unit.armour[company][v]) > 0) then okay = -1;
                }
                if (string_count("spyrer", new_combat.battle_special) > 0) {
                    if (okay == 1) and(sofar > 2) then okay = -1;
                }
                if (okay <= -1) then new_combat.fighting[company][v] = 0;

                //Normal and other battle cases checks go here
                else if (okay >= 0) {
                    if (instance_exists(obj_temp4)) { //Exploring ruins ambush case
                        if (deploying_unit.loc[company][v] == required_location) and(deploying_unit.wid[company][v] == _target_location) and(deploying_unit.hp[company][v] > 0) {
                            okay = 1;
                        } else {
                            okay = 0;
                        }
                    } else if (!instance_exists(obj_drop_select)) { // Only when attacked, normal battle
                        if (_is_planet) and(deploying_unit.loc[company][v] == required_location) and(deploying_unit.wid[company][v] == _target_location) and(deploying_unit.hp[company][v] > 0) and(deploying_unit.god[company][v] < 10) then okay = 1;
                        else if (!_is_planet) and(deploying_unit.lid[company][v] == _target_location) and(deploying_unit.hp[company][v] > 0) and(deploying_unit.god[company][v] < 10) then okay = 1;

                        if (instance_exists(obj_temp_meeting)) {
                            meeting = true;
                            if (company == 0) and(v <= obj_temp_meeting.dudes) and(obj_temp_meeting.present[v] == 1) then okay = 1;
                            else if (company > 0) or(v > obj_temp_meeting.dudes) then okay = 0;
                        }
                    } else if (instance_exists(obj_drop_select)) { // When attacking, normal battle
                        //If not fighting (obj_drop_select pre-check), we skip the unit
                        if (obj_drop_select.fighting[company][v] == 0) then okay = 0;

                        else if (obj_drop_select.attack == 1) {
                            if (_is_planet) and(deploying_unit.loc[company][v] == required_location) and(deploying_unit.wid[company][v] == _target_location) and(deploying_unit.hp[company][v] > 0) and(deploying_unit.god[company][v] < 10) then okay = 1;
                            else if (!_is_planet) and(deploying_unit.lid[company][v] == _target_location) and(deploying_unit.hp[company][v] > 0) and(deploying_unit.god[company][v] < 10) then okay = 1;
                        } else if (obj_drop_select.attack != 1) {
                            //Related to defensive battles (¿?). Without the above check, it duplicates marines on offensive ones.
                            if (obj_drop_select.fighting[company][v] == 1) and(deploying_unit.lid[company][v] == _target_location) then okay = 1;
                        }
                    }
                }

                // Start adding unit to battle
                if (okay >= 1) {
                    var man_size = 1;

                    //Same as co/company and v, but with extra comprovations in case of a meeting (meeting?) 
                    var cooh, va;
                    cooh = 0;
                    va = 0;

                    if (!meeting) {
                        cooh = company;
                        va = v;
                    }else {
                        if (v <= obj_temp_meeting.dudes) {
                            cooh = obj_temp_meeting.company[v];
                            va = obj_temp_meeting.ide[v];
                        }
                    }

                    var col, moov, targ;
                    col = 0;
                    targ = 0;
                    moov = 0;
                    _u_role = unit.role();

                    if (new_combat.battle_special == "space_hulk") then new_combat.player_starting_dudes += 1;
                    if (unit.role() = deploying_unit.role[100, 18]) {
                    	 col = obj_controller.bat_tactical_column;				    //sergeants
                        new_combat.tacticals += 1;
                    }

                    if (unit.role() = deploying_unit.role[100, 12]) {				//scouts
                        col = obj_controller.bat_scout_column;
                        new_combat.scouts += 1;

                    }else if (array_contains( [deploying_unit.role[100][8], $"{deploying_unit.role[100, 15]} Aspirant", $"{deploying_unit.role[100, 14]} Aspirant"] , unit.role())) {
                        col = obj_controller.bat_tactical_column;				    //tactical_marines
                        new_combat.tacticals += 1;
                    }else if (unit.role() = deploying_unit.role[100, 3]) or (unit.role() = deploying_unit.role[100, 19]) {			//veterans and veteran sergeants
                        col = obj_controller.bat_veteran_column;
                        new_combat.veterans += 1;
                    }else if (unit.role() = deploying_unit.role[100, 9]) {			//devestatiors
                        col = obj_controller.bat_devastator_column;
                        new_combat.devastators += 1;
                    }else if(unit.role() = deploying_unit.role[100, 10]) {			//assualt marines
                        col = obj_controller.bat_assault_column;
                        new_combat.assaults += 1;

                        //librarium roles

                    }else if (array_contains(["Codiciery", "Epistolary", "Lexicanum",deploying_unit.role[100, 17], $"{deploying_unit.role[100, 17]} Aspirant"], unit.role())){
                        col = obj_controller.bat_librarian_column;					//librarium
                        new_combat.librarians += 1;
                        moov = 1;
                    }else if (unit.role() = deploying_unit.role[100, 16]) {			//techmarines
                        col = obj_controller.bat_techmarine_column;
                        new_combat.techmarines += 1;
                        moov = 2;
                    } else if (unit.role() = deploying_unit.role[100, 2]) {			//honour guard
                        col = obj_controller.bat_honor_column;
                        new_combat.honors += 1;

                    } else if (array_contains([deploying_unit.role[100, 6],$"Venerable {deploying_unit.role[100, 6]}"],unit.role())) {
                        col = obj_controller.bat_dreadnought_column;				//dreadnoughts
                        new_combat.dreadnoughts += 1;
                    }else if (unit.role() = deploying_unit.role[100, 4]) {			//terminators
                        col = obj_controller.bat_terminator_column;
                        new_combat.terminators += 1;
                    }

                    if (moov > 0) {
                        if ((moov = 1) and(obj_controller.command_set[8] = 1)) or((moov = 2) and(obj_controller.command_set[9] = 1)) {
                            if (company >= 2) then col = obj_controller.bat_tactical_column;
                            if (company = 10) then col = obj_controller.bat_scout_column;
                            if (deploying_unit.mobi[cooh, va] = "Jump Pack") {
                                col = obj_controller.bat_assault_column;
                            }
                        }
                    }

                    if (unit.role() = deploying_unit.role[100, 15]) or(unit.role() = deploying_unit.role[100, 14]) or(string_count("Aspirant", unit.role()) > 0) {
                        if (unit.role() = string(deploying_unit.role[100, 14]) + " Aspirant") {
                            col = obj_controller.bat_tactical_column;
                            new_combat.tacticals += 1;
                        }

                        if (unit.role() = deploying_unit.role[100, 15]) then new_combat.apothecaries += 1;
                        if (unit.role() = deploying_unit.role[100, 14]) {
                            new_combat.chaplains += 1;
                            if (new_combat.big_mofo > 5) then new_combat.big_mofo = 5;
                        }

                        col = obj_controller.bat_tactical_column;
                        if (deploying_unit.armour[cooh, va] = "Terminator Armour") or(deploying_unit.armour[cooh, va] = "Tartaros Armour") {
                            col = obj_controller.bat_terminator_column;
                        }
                        if (company = 10) then col = obj_controller.bat_scout_column;
                    }

                    if (unit.role() = deploying_unit.role[100, 5]) or(unit.role() = "Standard Bearer") or(unit.role() = deploying_unit.role[100, 7]) {
                        if (unit.role() = deploying_unit.role[100, 5]) {
                            new_combat.captains += 1;
                            if (new_combat.big_mofo > 5) then new_combat.big_mofo = 5;
                        }
                        if (unit.role() = "Standard Bearer") then new_combat.standard_bearers += 1;
                        if (unit.role() = deploying_unit.role[100, 7]) then new_combat.champions += 1;

                        if (company = 1) {
                            col = obj_controller.bat_veteran_column;
                            if (deploying_unit.armour[cooh, va] = "Terminator Armour") then col = obj_controller.bat_terminator_column;
                            if (deploying_unit.armour[cooh, va] = "Tartaros Armour") then col = obj_controller.bat_terminator_column;
                        }
                        if (company >= 2) then col = obj_controller.bat_tactical_column;
                        if (company = 10) then col = obj_controller.bat_scout_column;
                        if (deploying_unit.mobi[cooh, va] = "Jump Pack") then col = obj_controller.bat_assault_column;
                    }

                    if (unit.role() = "Chapter Master") {
                        col = obj_controller.bat_command_column;
                        new_combat.important_dudes += 1;
                        new_combat.big_mofo = 1;
                        if (string_count("0", deploying_unit.spe[cooh, va]) > 0) then new_combat.chapter_master_psyker = 1;
                        else {
                            new_combat.chapter_master_psyker = 0;
                        }
                    }
                    if (unit.role() = "Forge Master") {
                        col = obj_controller.bat_command_column;
                        new_combat.important_dudes += 1;
                    }
                    if (unit.role() = "Master of Sanctity") {
                        col = obj_controller.bat_command_column;
                        new_combat.important_dudes += 1;
                        if (new_combat.big_mofo > 2) then new_combat.big_mofo = 2;
                    }
                    if (unit.role() = "Master of the Apothecarion") {
                        col = obj_controller.bat_command_column;
                        new_combat.important_dudes += 1;
                    }
                    if (unit.role() = "Chief " + string(deploying_unit.role[100, 17])) {
                        col = obj_controller.bat_command_column;
                        new_combat.important_dudes += 1;
                        if (new_combat.big_mofo > 3) then new_combat.big_mofo = 3;
                    }

                    if (col = 0) then col = obj_controller.bat_hire_column;

                    targ = instance_nearest(col * 10, 240, obj_pnunit);
                    targ.men += 1;
                    targ.unit_struct = unit;
                    targ.marine_co[targ.men] = company;
                    targ.marine_id[targ.men] = v;
                    targ.marine_type[targ.men] = _u_role;
                    targ.marine_wep1[targ.men] = deploying_unit.wep1[cooh, va];
                    targ.marine_wep2[targ.men] = deploying_unit.wep2[cooh, va];
                    targ.marine_armour[targ.men] = deploying_unit.armour[cooh, va];
                    targ.marine_gear[targ.men] = deploying_unit.gear[cooh, va];
                    targ.marine_mobi[targ.men] = deploying_unit.mobi[cooh, va];
                    targ.marine_hp[targ.men] = deploying_unit.hp[cooh, va];
                    targ.marine_exp[targ.men] = deploying_unit.experience[cooh, va];
                    targ.marine_powers[targ.men] = deploying_unit.spe[cooh, va];
                    targ.marine_ranged[targ.men] = unit.ranged_attack();
                    if (okay = 2) then targ.marine_local[targ.men] = 1;


                    if (unit.role() = "Death Company") { // Ahahahahah
                        var really;
                        really = false;
                        if (string_count("Dreadnought", targ.marine_armour[targ.men]) > 0) then really = true;
                        if (really = false) then new_combat.thirsty += 1;
                        if (really = true) then new_combat.really_thirsty += 1;
                        col = max(obj_controller.bat_assault_column, obj_controller.bat_command_column, obj_controller.bat_honor_column, obj_controller.bat_dreadnought_column, obj_controller.bat_veteran_column);
                    }
                    // info for ai targetting armour and what they think is best. TODO find out what marine_ranged and attack does
                    if (targ.marine_armour[targ.men] = "Scout Armour") then targ.marine_ac[targ.men] = 8;
                    if (targ.marine_armour[targ.men] = "MK3 Iron Armour") {
                        targ.marine_ac[targ.men] = 20;
                        targ.marine_ranged[targ.men] -= 0.1;
                    }
                    if (targ.marine_armour[targ.men] = "MK4 Maximus") {
                        targ.marine_ac[targ.men] = 19;
                        targ.marine_ranged[targ.men] += 0.05;
                        targ.marine_attack[targ.men] += 0.05;
                    }
                    if (targ.marine_armour[targ.men] = "MK5 Heresy") {
                        targ.marine_ac[targ.men] = 17;
                        targ.marine_attack[targ.men] += 0.1;
                    }
                    if (targ.marine_armour[targ.men] = "MK6 Corvus") {
                        targ.marine_ac[targ.men] = 18;
                        targ.marine_ranged[targ.men] += 0.1;
                    }
                    if (targ.marine_armour[targ.men] = "MK7 Aquila") then targ.marine_ac[targ.men] = 18;
                    if (targ.marine_armour[targ.men] = "MK8 Errant") then targ.marine_ac[targ.men] = 19;
                    if (targ.marine_armour[targ.men] = "Power Armour") then targ.marine_ac[targ.men] = 19;
                    if (targ.marine_armour[targ.men] = "Artificer Armour") {
                        targ.marine_ac[targ.men] = 35;
                        targ.marine_attack[targ.men] += 0.1;
                    }
                    if (targ.marine_armour[targ.men] = "Terminator Armour") {
                        targ.marine_ac[targ.men] = 40;
                        targ.marine_ranged[targ.men] -= 0.1;
                        targ.marine_attack[targ.men] += 0.2;
                        man_size = 2;
                    }
                    if (targ.marine_armour[targ.men] = "Tartaros") {
                        targ.marine_ac[targ.men] = 44;
                        targ.marine_ranged[targ.men] -= 0.05;
                        targ.marine_attack[targ.men] += 0.2;
                        man_size = 2;
                    }
                    if (targ.marine_armour[targ.men] = "Dreadnought") then targ.marine_ac[targ.men] = 40;
                    man_size = 10;
                    if (targ.marine_armour[targ.men] = "Ork Armour") then targ.marine_ac[targ.men] = 15;

                    // marine_attack[i]=1;
                    // marine_ranged[i]=1;
                    // marine_defense[i]=1;

                    if (targ.marine_wep1[targ.men] = "Boarding Shield") then targ.marine_ac[targ.men] += 4;
                    if (targ.marine_wep2[targ.men] = "Boarding Shield") then targ.marine_ac[targ.men] += 4;
                    if (targ.marine_wep1[targ.men] = "Storm Shield") then targ.marine_ac[targ.men] += 8;
                    if (targ.marine_wep2[targ.men] = "Storm Shield") then targ.marine_ac[targ.men] += 8;


                    if (string_count("&", targ.marine_armour[targ.men]) > 0) {
                        // Artifact armour
                        if (string_count("Power", targ.marine_armour[targ.men]) > 0) then targ.marine_ac[targ.men] = 30;
                        if (string_count("Artificer", targ.marine_armour[targ.men]) > 0) {
                            targ.marine_ac[targ.men] = 37;
                            targ.marine_attack[targ.men] += 0.1;
                        }
                        if (string_count("Terminator", targ.marine_armour[targ.men]) > 0) {
                            targ.marine_ac[targ.men] = 46;
                            targ.marine_ranged[targ.men] -= 0.1;
                            targ.marine_attack[targ.men] += 0.2;
                        }
                        if (string_count("Dreadnought", targ.marine_armour[targ.men]) > 0) then targ.marine_ac[targ.men] = 44;
                    }
                    if (targ.marine_armour[targ.men] != "") { // STC Bonuses
                        if (obj_controller.stc_bonus[1] = 5) {
                            if (targ.marine_ac[targ.men] >= 40) then targ.marine_ac[targ.men] += 2;
                            if (targ.marine_ac[targ.men] < 40) then targ.marine_ac[targ.men] += 1;
                        }
                        if (obj_controller.stc_bonus[2] = 3) {
                            if (targ.marine_ac[targ.men] >= 40) then targ.marine_ac[targ.men] += 2;
                            if (targ.marine_ac[targ.men] < 40) then targ.marine_ac[targ.men] += 1;
                        }
                    }

                    if (unit.role() = deploying_unit.role[100, 6]) or(unit.role() = "Venerable " + string(deploying_unit.role[100, 6])) {
                        targ.marine_hp[targ.men] = targ.marine_hp[targ.men] * 2;
                        targ.dreads += 1;
                    }
                    if (deploying_unit.mobi[cooh, va] = "Bike") {
                        targ.marine_hp[targ.men] += 25;
                        man_Size = 3;
                    }
                    if (deploying_unit.mobi[cooh, va] = "Jump Pack") {
                        man_Size = 2;
                    }
                    if (deploying_unit.wep1[cooh, va] = "Boarding Shield") then targ.marine_hp[targ.men] += 20;
                    if (deploying_unit.wep2[cooh, va] = "Boarding Shield") then targ.marine_hp[targ.men] += 20;
                    if (deploying_unit.wep1[cooh, va] = "Storm Shield") then targ.marine_hp[targ.men] += 30;
                    if (deploying_unit.wep2[cooh, va] = "Storm Shield") then targ.marine_hp[targ.men] += 30;
                    if (deploying_unit.wep2[cooh, va] = "Iron Halo") then targ.marine_hp[targ.men] += 20;

                    //evaluates if there is a limit on the size of men that can be in a battle and only adds the allowable number to roster
                    if (new_combat.man_size_limit == 0) {
                        new_combat.fighting[cooh, va] = 1;
                        sofar += 1;
                    } else {
                        if (man_size_count + man_size <= new_combat.man_size_limit) {
                            new_combat.fighting[cooh, va] = 1;
                            sofar += 1;
                            man_size_count += man_size;
                            if (man_size_count == new_combat.man_size_limit) {
                                man_limit_reached = true;
                            }
                        }
                    }
                }

                // Vehicle checks
                if (v <= 100) and(string_count("spyrer", new_combat.battle_special) = 0) and(company <= 10) and(meeting = false) {
                    var vokay;
                    vokay = 0;

                    if (deploying_unit.veh_race[company][v] != 0) and(deploying_unit.veh_loc[company][v] = required_location) and(deploying_unit.veh_wid[company][v] = _target_location) then vokay = 1;

                    if (_is_planet) and(new_combat.local_forces = 1) {
                        var world_name, p_num;
                        world_name = "";
                        p_num = obj_controller.selecting_planet;
                        if (instance_exists(obj_drop_select)) {
                            world_name = obj_drop_select.p_target.name;
                        }
                        if (deploying_unit.veh_race[company][v] != 0) and(deploying_unit.veh_loc[company][v] = world_name) and(deploying_unit.wid[company][v] = p_num) then vokay = 2;
                    }
                    if (!_is_planet) and(deploying_unit.veh_lid[company][v] = _target_location) and(deploying_unit.veh_hp[company][v] > 0) then vokay = 1;

                    if (instance_exists(obj_drop_select)) {
                        if (obj_drop_select.attack = 0) then vokay = 0;
                    }


                    // if (obj_ncombat.veh_fighting[company,v]=1) then vokay=2;// Fuck on me, AI

                    if (vokay >= 1) and(new_combat.dropping = 0) {
                        new_combat.veh_fighting[company][v] = 1;

                        var col = 1, targ = 0;

                        switch (deploying_unit.veh_role[company][v]){
                            case "Rhino":
                                col = obj_controller.bat_rhino_column;
                                new_combat.rhinos += 1;
                                break;
                            case "Predator":
                                col = obj_controller.bat_predator_column;
                                new_combat.predators += 1;
                                break;
                             case "Land Raider":
                                col = obj_controller.bat_landraider_column;
                                new_combat.land_raiders += 1;
                                break;
                             case "Whirlwind":
                                col = 1;
                                new_combat.whirlwinds += 1;;
                                break;                                    
                        }

                        targ = instance_nearest(col * 10, room_height / 2, obj_pnunit);
                        targ.veh += 1;
                        targ.veh_co[targ.veh] = company;
                        targ.veh_id[targ.veh] = v;
                        targ.veh_type[targ.veh] = deploying_unit.veh_role[company][v];
                        targ.veh_wep1[targ.veh] = deploying_unit.veh_wep1[company][v];
                        targ.veh_wep2[targ.veh] = deploying_unit.veh_wep2[company][v];
                        targ.veh_wep3[targ.veh] = deploying_unit.veh_wep3[company][v];
                        targ.veh_upgrade[targ.veh] = deploying_unit.veh_upgrade[company][v];
                        targ.veh_acc[targ.veh] = deploying_unit.veh_acc[company][v];
                        if (vokay = 2) then targ.veh_local[targ.veh] = 1;

                        if (deploying_unit.veh_role[company][v] = "Rhino") or(deploying_unit.veh_role[company][v] = "Whirlwind") or(deploying_unit.veh_role[company][v] = "Land Speeder") {
                            targ.veh_hp[targ.veh] = deploying_unit.veh_hp[company][v] * 2;
                            targ.veh_hp_multiplier[targ.veh] = 2;
                            targ.veh_ac[targ.veh] = 20;
                        }
                        if (deploying_unit.veh_role[company][v] = "Predator") {
                            targ.veh_hp[targ.veh] = deploying_unit.veh_hp[company][v] * 3;
                            targ.veh_hp_multiplier[targ.veh] = 3;
                            targ.veh_ac[targ.veh] = 30;
                        }
                        if (deploying_unit.veh_role[company][v] = "Land Raider") {
                            targ.veh_hp[targ.veh] = deploying_unit.veh_hp[company][v] * 4;
                            targ.veh_hp_multiplier[targ.veh] = 4;
                            targ.veh_ac[targ.veh] = 40;
                        }

                        // STC Bonuses
                        if (targ.veh_type[targ.veh] != "") {
                            if (obj_controller.stc_bonus[3] = 1) {
                                targ.veh_hp[targ.veh] = round(targ.veh_hp[targ.veh] * 1.1);
                                targ.veh_hp_multiplier[targ.veh] = targ.veh_hp_multiplier[targ.veh] * 1.1;
                            }
                            if (obj_controller.stc_bonus[3] = 2) {
                                //TODO reimplement STC bonus for ranged vehicle weapons
                                //veh ranged isn't a thing sooooo.... oh well
                                //targ.veh_ranged[targ.veh] = targ.veh_ranged[targ.veh] * 1.05;
                            }
                            if (obj_controller.stc_bonus[3] = 5) {
                                targ.veh_ac[targ.veh] = round(targ.veh_ac[targ.veh] * 1.1);
                            }
                            if (obj_controller.stc_bonus[4] = 1) {
                                targ.veh_hp[targ.veh] = round(targ.veh_hp[targ.veh] * 1.1);
                                targ.veh_hp_multiplier[targ.veh] = targ.veh_hp_multiplier[targ.veh] * 1.1;
                            }
                            if (obj_controller.stc_bonus[4] = 2) {
                                targ.veh_ac[targ.veh] = round(targ.veh_ac[targ.veh] * 1.1);
                            }
                        }
                    }
                }
            }
        }
    }
}