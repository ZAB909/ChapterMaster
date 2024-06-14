// Displays weapon based on the armour type to change the art to match the armour type
function scr_ui_display_weapons(left_or_right, current_armor, equiped_weapon) {

    clear = false;
    ui_xmod[left_or_right] = 0;
    ui_ymod[left_or_right] = 0;
    ui_weapon[left_or_right] = spr_weapon_blank;
    ui_twoh[left_or_right] = false;
    display_type = "normal_ranged";
    var sprite_found = false;

    // Handle terminator ranged sprites
    if (!sprite_found && (current_armor == ArmourType.Indomitus || current_armor == ArmourType.Tartaros)){
        var terminator_ranged = {
            "Assault Cannon":spr_weapon_assca,
            "Heavy Flamer":spr_weapon_hflamer_term,
			"Plasma Cannon":spr_weapon_plasma_cannon_term,
        }
        var terminator_ranged_names=struct_get_names(terminator_ranged);
        for (var i=0;i<array_length(terminator_ranged_names);i++){
            if (terminator_ranged_names[i] == equiped_weapon){
                set_as_terminator_ranged(terminator_ranged[$ terminator_ranged_names[i]],left_or_right)
                sprite_found = true;
                break;               
            }
        }
    }

    // Handle terminator melee sprites
    if (!sprite_found && (current_armor == ArmourType.Indomitus || current_armor == ArmourType.Tartaros)){
        var terminator_melee = {
            "Power Fist":spr_weapon_powfist4,
            "Lightning Claw":spr_weapon_lightning2,
            "Chainfist":spr_weapon_chainfist,
            "Power Mace":spr_weapon_powmace,
            "Boltstorm Gauntlet":spr_weapon_boltstorm_gauntlet,
        }
        var terminator_melee_names=struct_get_names(terminator_melee);
        for (var i=0;i<array_length(terminator_melee_names);i++){
            if (terminator_melee_names[i] == equiped_weapon){
                set_as_terminator_melee(terminator_melee[$ terminator_melee_names[i]],left_or_right)
                sprite_found = true;
                break;               
            }
        }
    }

    // Handle one-handed ranged
    if (!sprite_found){
        var normal_ranged ={
            "Bolt Pistol":spr_weapon_boltpis,
            "Infernus Pistol":spr_weapon_inferno,
            "Bolter":spr_weapon_bolter,
            "Storm Bolter":spr_weapon_sbolter,
            "Plasma Pistol":spr_weapon_plasp,
            "Plasma Gun":spr_weapon_plasg,
            "Missile Launcher":spr_weapon_missile,
            "Flamer":spr_weapon_flamer,
            "Meltagun":spr_weapon_melta,
            "Stalker Pattern Bolter":spr_weapon_stalker,
            "Combiflamer":spr_weapon_comflamer,
            "Missile Launcher":spr_weapon_missile,
        }
        var normal_ranged_names = struct_get_names(normal_ranged);
        for (var i=0;i<array_length(normal_ranged_names);i++){
            if (normal_ranged_names[i] == equiped_weapon){
                set_as_normal_ranged(normal_ranged[$ normal_ranged_names[i]],left_or_right)
                sprite_found = true;
                break;
            }
        }
    }

    // Handle two-handed ranged
    if (!sprite_found){
        var heavy_ranged ={
            "Heavy Bolter":spr_weapon_hbolt,
            "Lascannon":spr_weapon_lasca,
            "Multi-Melta":spr_weapon_mmelta,
            "Heavy Flamer":spr_weapon_hflamer,
			"Plasma Cannon":spr_weapon_plasc,
        }
        var heavy_ranged_names=struct_get_names(heavy_ranged);
        for (var i=0;i<array_length(heavy_ranged_names);i++){
            if (heavy_ranged_names[i] == equiped_weapon) {
                set_as_ranged_twohand(heavy_ranged[$ heavy_ranged_names[i]],left_or_right)
                sprite_found = true;
                break;               
            }
        }
    }

    // Handle one-handed melee
    if (!sprite_found){
        var standards = {
            "Dark Angels" : spr_da_standard,
        }
        var chap_name = global.chapter_name;
        var melee_weapons ={
            "Company Standard":struct_exists(standards, chap_name) ? standards[$ chap_name] :spr_weapon_standard2,
            "Chainsword":spr_weapon_chsword,
            "Combat Knife":spr_weapon_knife,
            "Power Sword":spr_weapon_powswo,
            "Eldar Power Sword":spr_weapon_eldsword,
            "Power Spear":spr_weapon_powspear,
            "Thunder Hammer":spr_weapon_thhammer,
            "Relic Blade":spr_weapon_relbla,
            "Power Axe":spr_weapon_powaxe,
			"Crozius Arcanum":spr_weapon_crozarc,
            "Chainaxe":spr_weapon_chaxe,
            "Force Staff":spr_weapon_frcstaff,
			"Force Sword":spr_weapon_powswo,
			"Force Axe":spr_weapon_powaxe,
			"Chainfist":spr_weapon_chainfist_small,
			"Power Weapon":spr_weapon_powswo,
        }
        var melee_weapons_names=struct_get_names(melee_weapons);
        var wep_
        for (var i=0;i<array_length(melee_weapons_names);i++){
            if (melee_weapons_names[i] == equiped_weapon){
                set_as_melee_onehand(melee_weapons[$ melee_weapons_names[i]],left_or_right);
                sprite_found = true;
                break;               
            }                      
        }
    }

    // Handle one-handed special melee
    if (!sprite_found){
        if (string_count("DUB", equiped_weapon) == 0){
            if ("Power Fist" == equiped_weapon) {
                set_as_melee_onehand_special(spr_weapon_powfist, left_or_right);
                sprite_found = !sprite_found;
                display_type="power_fist";
            }if ("Lightning Claw" == equiped_weapon) {
                set_as_melee_onehand_special(spr_weapon_lightning1, left_or_right);
                sprite_found = !sprite_found;
                display_type="lightning_claw";
            }   
        }
    }

    // Handle two-handed melee
    if (!sprite_found){
        var heavy_melee ={
            "Eviscerator":spr_weapon_evisc,
            "Heavy Thunder Hammer":spr_weapon_hthhammer,
        }
        var heavy_melee_names=struct_get_names(heavy_melee);
        for (var i=0;i<array_length(heavy_melee_names);i++){
            if (heavy_melee_names[i] == equiped_weapon) {
                set_as_melee_twohand(heavy_melee[$ heavy_melee_names[i]],left_or_right)
                sprite_found = true;
                break;               
            }
        }
    }

    // Handle special ranged
    if (!sprite_found){
        var special_ranged ={
            "Sniper Rifle":spr_weapon_sniper,
        }
        var special_ranged_names=struct_get_names(special_ranged);
        for (var i=0;i<array_length(special_ranged_names);i++){
            if (special_ranged_names[i] == equiped_weapon){
                set_as_special_ranged(special_ranged[$ special_ranged_names[i]],left_or_right)
                sprite_found = true;
                break;               
            }
        }
    }

    // Offset weapon sprites meant for normal power armor but used on terminators
    if (current_armor != ArmourType.Normal && display_type != "terminator_ranged" && display_type != "terminator_melee"){
        ui_ymod[left_or_right] -= 20;
        if (display_type == "normal_ranged") {
            if (current_armor == ArmourType.Indomitus) {
                ui_xmod[left_or_right] -= 18;
                ui_ymod[left_or_right] += 12;
            }
            if (current_armor == ArmourType.Tartaros) {
                ui_xmod[left_or_right] -= 10;
                ui_ymod[left_or_right] += 16;
            }
        }
        if (display_type == "melee_onehand") {
            ui_arm[left_or_right] = 2;
            ui_hand[left_or_right] = 1;
            if (current_armor == ArmourType.Indomitus) {
                ui_xmod[left_or_right] -= 18;
                ui_ymod[left_or_right] += 24;
            } else if (current_armor == ArmourType.Tartaros) {
                ui_xmod[left_or_right] -= 14;
                ui_ymod[left_or_right] += 38;
            }
        }

        if (display_type == "melee_twohand") {
            ui_arm[1] = 2;
            ui_arm[2] = 2;
            ui_hand[1] = 2;
            ui_hand[2] = 3;
            if (current_armor == ArmourType.Indomitus) {
                ui_ymod[left_or_right] += 25;
            } else if (current_armor == ArmourType.Tartaros) {
                ui_ymod[left_or_right] += 39;
            }
        }

        if (array_contains(["Thunder Hammer", "Chainaxe", "Crozius Arcanum"], equiped_weapon)) {
            ui_hand[left_or_right] = 2;
        }
    }

    // Fix graphics for tremi/tartaros weapons
    // if (display_type == "power_fist") {
    //     if (current_armor != ArmourType.Normal) {
    //         ui_arm[left_or_right] = false;
    //         ui_above[left_or_right] = true;
    //     }
        // if (current_armor == ArmourType.Indomitus) and(left_or_right == 1) {
        //     ui_xmod[left_or_right] = -3;
        //     ui_ymod[left_or_right] = 10;
        //     fix_left = 8;
        //     ui_weapon[left_or_right] = spr_weapon_powfist3;
        //     clear = true;
        // }
        // if (current_armor == ArmourType.Indomitus) and(left_or_right == 2) {
        //     ui_xmod[left_or_right] = 2;
        //     ui_ymod[left_or_right] = 10;
        //     fix_right = 8;
        //     ui_weapon[left_or_right] = spr_weapon_powfist3;
        //     clear = true;
        // }
        // if (current_armor == ArmourType.Tartaros) and(left_or_right == 1) {
        //     ui_xmod[left_or_right] = 0;
        //     ui_ymod[left_or_right] = 10;
        //     fix_left = 8;
        //     ui_weapon[left_or_right] = spr_weapon_powfist3;
        //     clear = true;
        // }
        // if (current_armor == ArmourType.Tartaros) and(left_or_right == 2) {
        //     ui_xmod[left_or_right] = -1;
        //     ui_ymod[left_or_right] = 10;
        //     fix_right = 8;
        //     ui_weapon[left_or_right] = spr_weapon_powfist3;
        //     clear = true;
        // }
    // }
    // if (display_type == "lightning_claw") {
    //     if (current_armor == ArmourType.Normal && left_or_right == 1) {
    //         ui_xmod[left_or_right] += 11;
    //     }
    //     if (current_armor == ArmourType.Normal && left_or_right == 2) {
    //         ui_xmod[left_or_right] -= 8;
    //     }
        // if (current_armor != ArmourType.Normal) {
        //     ui_arm[left_or_right] = false;
        //     ui_above[left_or_right] = true;
        // }
        // if (current_armor == ArmourType.Indomitus) and(left_or_right == 1) {
        //     ui_xmod[left_or_right] = -3;
        //     ui_ymod[left_or_right] = 10;
        //     fix_left = 8.1;
        //     ui_weapon[left_or_right] = spr_weapon_lightning2;
        //     clear = true;
        // }
        // if (current_armor == ArmourType.Indomitus) and(left_or_right == 2) {
        //     ui_xmod[left_or_right] = 2;
        //     ui_ymod[left_or_right] = 10;
        //     fix_right = 8.1;
        //     ui_weapon[left_or_right] = spr_weapon_lightning2;
        //     clear = true;
        // }
    // }
    if (display_type == "terminator_melee") {
        if (current_armor == ArmourType.Tartaros){
            ui_xmod[left_or_right] = 2;
            ui_ymod[left_or_right] = 20;
        }
    }

    if (display_type == "terminator_ranged") {
        if (current_armor == ArmourType.Tartaros){
            ui_xmod[left_or_right] = 0;
            ui_ymod[left_or_right] = 20;
        }
    }

    if ("Storm Shield" == equiped_weapon) {
        if (global.chapter_name == "Dark Angels" && role() == obj_ini.role[100][Role.HONOR_GUARD]){
            ui_weapon[left_or_right] = spr_weapon_storm;
        }
        else {
            ui_weapon[left_or_right] = spr_weapon_storm2;
        }
        ui_arm[left_or_right] = 2;
        ui_above[left_or_right] = true;
        ui_spec[left_or_right] = false;
    }
    if ("Boarding Shield" == equiped_weapon) {
        ui_weapon[left_or_right] = spr_weapon_boarding;
        ui_arm[left_or_right] = 2;
        ui_above[left_or_right] = true;
        ui_spec[left_or_right] = false;
    }

    if ("Power Mace" == equiped_weapon) {
        ui_arm[left_or_right] = 0;
    }

    if ("Company Standard" == equiped_weapon) {
        ui_hand[left_or_right] = 0;
    }

    // Flip the ui_xmod for offhand
    if (left_or_right == 2  && ui_xmod[left_or_right] != 0) {
        /*and (current_armor=0)*/
        ui_xmod[left_or_right] = ui_xmod[left_or_right] * -1;
    }
}

function set_as_normal_ranged(sprite, left_or_right) {
    ui_weapon[left_or_right] = sprite;
    ui_arm[left_or_right] = 1;
    ui_above[left_or_right] = true;
    ui_spec[left_or_right] = false;
    display_type = "normal_ranged";
}

function set_as_ranged_assault(sprite, left_or_right) {
    ui_weapon[left_or_right] = sprite;
    display_type = "ranged_assault";
    ui_arm[left_or_right] = 0;
    ui_above[left_or_right] = true;
    ui_spec[left_or_right] = true;
}

function set_as_ranged_twohand(sprite, left_or_right) {
    ui_weapon[left_or_right] = sprite;
    display_type = "ranged_twohand";
    ui_arm[1] = 0;
    ui_arm[2] = 0;
    ui_above[left_or_right] = true;
    ui_spec[left_or_right] = true;
    ui_twoh[left_or_right] = true;
}

function set_as_special_ranged(sprite, left_or_right) {
    ui_weapon[left_or_right] = sprite;
    ui_arm[left_or_right] = 0;
    ui_above[left_or_right] = true;
    ui_spec[left_or_right] = true;
    display_type = "special_ranged";
}

function set_as_terminator_ranged(sprite, left_or_right) {
    ui_weapon[left_or_right] = sprite;
    ui_arm[left_or_right] = 2;
    ui_above[left_or_right] = true;
    ui_spec[left_or_right] = true;
    display_type = "terminator_ranged";
}

function set_as_melee_onehand(sprite, left_or_right) {
    ui_weapon[left_or_right] = sprite;
    ui_arm[left_or_right] = 0;
    ui_above[left_or_right] = true;
    ui_spec[left_or_right] = true;
    display_type = "melee_onehand";
}

function set_as_melee_onehand_special(sprite, left_or_right) {
    ui_weapon[left_or_right] = sprite;
    ui_arm[left_or_right] = 1;
    ui_above[left_or_right] = true;
    ui_spec[left_or_right] = true;
    display_type = "melee_onehand";
}

function set_as_melee_twohand(sprite, left_or_right) {
    ui_weapon[left_or_right] = sprite;
    display_type = "melee_twohand";
    ui_arm[1] = 0;
    ui_arm[2] = 0;
    ui_above[left_or_right] = true;
    ui_spec[left_or_right] = true;
    ui_twoh[left_or_right] = true;
}

function set_as_terminator_melee(sprite, left_or_right) {
    ui_weapon[left_or_right] = sprite;
    ui_arm[left_or_right] = 1;
    ui_above[left_or_right] = true;
    ui_spec[left_or_right] = true;
    display_type = "terminator_melee";
}

function dreadnought_sprite_components(component){
    var components = {
        "Assualt Cannon" : spr_dread_assault_cannon,
        "Lascannon" : spr_dread_lascannon,
        "Close Combat Weapon":spr_dread_claw,
        "Twin Linked Heavy Bolter":spr_dread_heavy_bolter,
        "Plasma Cannon" : spr_dread_plasma_cannon,
        "Autocannon" : spr_dread_autocannon,
        "Missile Launcher" :spr_dread_missile
    };
    if (struct_exists(components, component)){
        return components[$ component]
    } else {
        return spr_weapon_blank;
    }
}
