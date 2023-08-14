function scr_ship_battle(argument0, argument1) //gml_Script_scr_ship_battle
{
    var co = 0
    var v = 0
    var stop = 0
    var okay = 0
    var sofar = 0
    repeat (3600)
    {
        if (co < 11)
        {
            v += 1
            okay = 0
            if (v > 300)
            {
                co += 1
                v = 1
            }
            if (co > 10)
                stop = 1
            if (stop == 0)
            {
                if (obj_ini.lid[co][v] == argument0 && obj_ini.hp[co][v] > 0)
                    okay = 1
                if (obj_ini.lid[co][v] == argument1 && argument1 == argument1 && obj_ini.hp[co][v] > 0)
                    okay = 1
                if (string_count("spyrer", obj_ncombat.battle_special) > 0 && (obj_ini.role[co][v] == obj_ini.role[100][6] || obj_ini.role[co][v] == ("Venerable " + string(obj_ini.role[100][6]))))
                    okay = 0
                if (string_count("spyrer", obj_ncombat.battle_special) > 0)
                {
                    if (okay == 1 && sofar > 2)
                        okay = 0
                }
                if (string_count("Aspirant", obj_ini.role[co][v]) > 0)
                    okay = 0
                if (okay == 0)
                    obj_ncombat.fighting[co][v] = 0
                if (okay == 1)
                {
                    obj_ncombat.fighting[co][v] = 1
                    sofar += 1
                    var col = 0
                    var targ = obj_fleet
                    if (obj_ini.role[co][v] == obj_ini.role[100][12])
                    {
                        col = obj_controller.bat_scout_column
                        obj_ncombat.scouts += 1
                    }
                    if (obj_ini.role[co][v] == obj_ini.role[100][8])
                    {
                        col = obj_controller.bat_tactical_column
                        obj_ncombat.tacticals += 1
                    }
                    if (obj_ini.role[co][v] == obj_ini.role[100][3])
                    {
                        col = obj_controller.bat_veteran_column
                        obj_ncombat.veterans += 1
                    }
                    if (obj_ini.role[co][v] == obj_ini.role[100][9])
                    {
                        col = obj_controller.bat_devastator_column
                        obj_ncombat.devastators += 1
                    }
                    if (obj_ini.role[co][v] == obj_ini.role[100][10])
                    {
                        col = obj_controller.bat_assault_column
                        obj_ncombat.assaults += 1
                    }
                    if (obj_ini.role[co][v] == obj_ini.role[100][17])
                    {
                        col = obj_controller.bat_librarian_column
                        obj_ncombat.librarians += 1
                    }
                    if (obj_ini.role[co][v] == "Codiciery")
                    {
                        col = obj_controller.bat_librarian_column
                        obj_ncombat.librarians += 1
                    }
                    if (obj_ini.role[co][v] == "Epistolary")
                    {
                        col = obj_controller.bat_librarian_column
                        obj_ncombat.librarians += 1
                    }
                    if (obj_ini.role[co][v] == "Lexicanum")
                    {
                        col = obj_controller.bat_librarian_column
                        obj_ncombat.librarians += 1
                    }
                    if (obj_ini.role[co][v] == obj_ini.role[100][16])
                    {
                        col = obj_controller.bat_techmarine_column
                        obj_ncombat.techmarines += 1
                    }
                    if (obj_ini.role[co][v] == obj_ini.role[100][2])
                    {
                        col = obj_controller.bat_honor_column
                        obj_ncombat.honors += 1
                    }
                    if (obj_ini.role[co][v] == obj_ini.role[100][6])
                    {
                        col = obj_controller.bat_dreadnought_column
                        obj_ncombat.dreadnoughts += 1
                    }
                    if (obj_ini.role[co][v] == ("Venerable " + string(obj_ini.role[100][6])))
                    {
                        col = obj_controller.bat_dreadnought_column
                        obj_ncombat.dreadnoughts += 1
                    }
                    if (obj_ini.role[co][v] == obj_ini.role[100][4])
                    {
                        col = obj_controller.bat_terminator_column
                        obj_ncombat.terminators += 1
                    }
                    if (obj_ini.role[co][v] == obj_ini.role[100][15] || obj_ini.role[co][v] == obj_ini.role[100][14])
                    {
                        if (obj_ini.role[co][v] == obj_ini.role[100][15])
                            obj_ncombat.apothecaries += 1
                        if (obj_ini.role[co][v] == obj_ini.role[100][14])
                        {
                            obj_ncombat.chaplains += 1
                            if (obj_ncombat.big_mofo > 5)
                                obj_ncombat.big_mofo = 5
                        }
                        col = obj_controller.bat_tactical_column
                        if (obj_ini.armour[co][v] == "Terminator Armour")
                            col = obj_controller.bat_terminator_column
                        if (obj_ini.armour[co][v] == "Tartaros Armour")
                            col = obj_controller.bat_terminator_column
                        if (co == 10)
                            col = obj_controller.bat_scout_column
                    }
                    if (obj_ini.role[co][v] == obj_ini.role[100][5] || obj_ini.role[co][v] == "Standard Bearer")
                    {
                        if (obj_ini.role[co][v] == obj_ini.role[100][5])
                        {
                            obj_ncombat.captains += 1
                            if (obj_ncombat.big_mofo > 5)
                                obj_ncombat.big_mofo = 5
                        }
                        if (obj_ini.role[co][v] == "Standard Bearer")
                            obj_ncombat.standard_bearers += 1
                        if (co == 1)
                        {
                            col = obj_controller.bat_veteran_column
                            if (obj_ini.armour[co][v] == "Terminator Armour")
                                col = obj_controller.bat_terminator_column
                            if (obj_ini.armour[co][v] == "Tartaros Armour")
                                col = obj_controller.bat_terminator_column
                        }
                        if (co >= 2)
                            col = obj_controller.bat_tactical_column
                        if (co == 10)
                            col = obj_controller.bat_scout_column
                        if (obj_ini.mobi[co][v] == "Jump Pack")
                            col = obj_controller.bat_assault_column
                    }
                    if (obj_ini.role[co][v] == "Chapter Master")
                    {
                        col = obj_controller.bat_command_column
                        obj_ncombat.important_dudes += 1
                        obj_ncombat.big_mofo = 1
                    }
                    if (obj_ini.role[co][v] == "Forge Master")
                    {
                        col = obj_controller.bat_command_column
                        obj_ncombat.important_dudes += 1
                    }
                    if (obj_ini.role[co][v] == "Master of Sanctity")
                    {
                        col = obj_controller.bat_command_column
                        obj_ncombat.important_dudes += 1
                        if (obj_ncombat.big_mofo > 2)
                            obj_ncombat.big_mofo = 2
                    }
                    if (obj_ini.role[co][v] == "Master of the Apothecarion")
                    {
                        col = obj_controller.bat_command_column
                        obj_ncombat.important_dudes += 1
                    }
                    if (obj_ini.role[co][v] == ("Chief " + string(obj_ini.role[100][17])))
                    {
                        col = obj_controller.bat_command_column
                        obj_ncombat.important_dudes += 1
                        if (obj_ncombat.big_mofo > 3)
                            obj_ncombat.big_mofo = 3
                    }
                    if (obj_ini.role[co][v] == "Death Company")
                        col = max(obj_controller.bat_assault_column, obj_controller.bat_command_column, obj_controller.bat_honor_column, obj_controller.bat_dreadnought_column, obj_controller.bat_veteran_column)
                    if (col == 0)
                        col = obj_controller.bat_hire_column
                    targ = instance_nearest((col * 10), 240, obj_pnunit)
                    targ.men += 1
                    targ.marine_co[targ.men] = co
                    targ.marine_id[targ.men] = v
                    targ.marine_type[targ.men] = obj_ini.role[co][v]
                    targ.marine_wep1[targ.men] = obj_ini.wep1[co][v]
                    targ.marine_wep2[targ.men] = obj_ini.wep2[co][v]
                    targ.marine_armour[targ.men] = obj_ini.armour[co][v]
                    targ.marine_gear[targ.men] = obj_ini.gear[co][v]
                    targ.marine_mobi[targ.men] = obj_ini.mobi[co][v]
                    targ.marine_hp[targ.men] = obj_ini.hp[co][v]
                    targ.marine_exp[targ.men] = obj_ini.experience[co][v]
                    if (targ.marine_armour[targ.men] == "Scout Armour")
                        targ.marine_ac[targ.men] = 8
                    if (targ.marine_armour[targ.men] == "MK3 Iron Armour" || targ.marine_armour[targ.men] == "MK8 Errant")
                        targ.marine_ac[targ.men] = 21
                    if (targ.marine_armour[targ.men] == "Power Armour" || targ.marine_armour[targ.men] == "MK4 Maximus")
                        targ.marine_ac[targ.men] = 19
                    if (targ.marine_armour[targ.men] == "MK6 Corvus" || targ.marine_armour[targ.men] == "MK7 Aquila")
                        targ.marine_ac[targ.men] = 18
                    if (targ.marine_armour[targ.men] == "Terminator Armour" || targ.marine_armour[targ.men] == "Dreadnought")
                        targ.marine_ac[targ.men] = 40
                    if (targ.marine_armour[targ.men] == "Tartaros")
                        targ.marine_ac[targ.men] = 44
                    if (targ.marine_armour[targ.men] == "Artificer Armour")
                        targ.marine_ac[targ.men] = 35
                    if (targ.marine_wep1[targ.men] == "Boarding Shield")
                        targ.marine_ac[targ.men] += 4
                    if (targ.marine_wep2[targ.men] == "Boarding Shield")
                        targ.marine_ac[targ.men] += 4
                    if (targ.marine_wep1[targ.men] == "Storm Shield")
                        targ.marine_ac[targ.men] += 8
                    if (targ.marine_wep2[targ.men] == "Storm Shield")
                        targ.marine_ac[targ.men] += 8
                    if (string_count("&", targ.marine_armour[targ.men]) > 0 || string_count("|", targ.marine_armour[targ.men]) > 0)
                    {
                        if (string_count("Power", targ.marine_armour[targ.men]) > 0)
                            targ.marine_ac[targ.men] = 20
                        if (string_count("Artificer", targ.marine_armour[targ.men]) > 0)
                            targ.marine_ac[targ.men] = 37
                        if (string_count("Terminator", targ.marine_armour[targ.men]) > 0)
                            targ.marine_ac[targ.men] = 42
                        if (string_count("Dreadnought", targ.marine_armour[targ.men]) > 0)
                            targ.marine_ac[targ.men] = 44
                    }
                    if (obj_ini.role[co][v] == obj_ini.role[100][6] || obj_ini.role[co][v] == ("Venerable " + string(obj_ini.role[100][6])))
                    {
                        targ.marine_hp[targ.men] = (targ.marine_hp[targ.men] * 2)
                        targ.dreads += 1
                    }
                    if (targ.marine_wep1[targ.men] == "Boarding Shield")
                        targ.marine_ac[targ.men] += 4
                    if (targ.marine_wep2[targ.men] == "Boarding Shield")
                        targ.marine_ac[targ.men] += 4
                    if (targ.marine_wep1[targ.men] == "Storm Shield")
                        targ.marine_ac[targ.men] += 8
                    if (targ.marine_wep2[targ.men] == "Storm Shield")
                        targ.marine_ac[targ.men] += 8
                    if (obj_ini.mobi[co][v] == "Bike")
                        targ.marine_hp[targ.men] += 25
                    if (obj_ini.wep1[co][v] == "Boarding Shield")
                        targ.marine_hp[targ.men] += 20
                    if (obj_ini.wep2[co][v] == "Boarding Shield")
                        targ.marine_hp[targ.men] += 20
                    if (obj_ini.wep1[co][v] == "Storm Shield")
                        targ.marine_hp[targ.men] += 30
                    if (obj_ini.wep2[co][v] == "Storm Shield")
                        targ.marine_hp[targ.men] += 30
                    if (obj_ini.gear[co][v] == "Iron Halo")
                        targ.marine_hp[targ.men] += 20
                }
            }
        }
    }
}

