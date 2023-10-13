// Displays weapon based on the armour type to change the art to match the armour type
function scr_ui_display_weapons(argument0, termi_tartaros, equiped_weapon) {

    // argument0: left?

    var rl = argument0,
    clear = false;
    ui_xmod[rl] = 0;
    ui_ymod[rl] = 0;
    ui_arm[rl] = true;
    ui_weapon[rl] = spr_weapon_blank;
    ui_twoh[rl] = false;
    var display_type = "normal_ranged";

    // Checks if armour is either termi or tartaros to display proper fix
    if (argument0 == 1) then fix_left = 0;
    if (argument0 == 2) then fix_right = 0;

    // ** Ranged Weapons **
    if (string_count("Bolt Pistol", equiped_weapon) > 0) {
        set_as_normal_ranged(spr_weapon_boltpis, rl);
    }
    if (string_count("Infernus Pistol", equiped_weapon) > 0) {
        set_as_normal_ranged(spr_weapon_inferno, rl);
    }
    if (string_count("Bolter", equiped_weapon) > 0) and(string_count("Heavy", equiped_weapon) == 0) and(string_count("Integrated", equiped_weapon) == 0) {
        var sprite = string_count("Storm", equiped_weapon) > 0 ? spr_weapon_sbolter : spr_weapon_bolter;
        set_as_normal_ranged(sprite, rl);
    }
    if (string_count("Plasma Pistol", equiped_weapon) > 0) {
        set_as_normal_ranged(spr_weapon_plasp, rl);
    }
    if (string_count("Plasma Gun", equiped_weapon) > 0) {
        set_as_normal_ranged(spr_weapon_plasg, rl);
    }
    if (string_count("Missile Launcher", equiped_weapon) > 0) and(string_count("Whirl", equiped_weapon) == 0) {
        set_as_normal_ranged(spr_weapon_missile, rl);
    }
    if (string_count("Flamer", equiped_weapon) > 0) {
        set_as_normal_ranged(spr_weapon_flamer, rl);
    }
    if (string_count("Meltagun", equiped_weapon) > 0) {
        set_as_normal_ranged(spr_weapon_melta, rl);
    }
    if (string_count("Heavy Bolter", equiped_weapon) > 0) {
        set_as_ranged_twohand(spr_weapon_hbolt, rl);
    }
    if (string_count("Lascannon", equiped_weapon) > 0) {
        set_as_ranged_twohand(spr_weapon_lasca, rl);
    }
    if (string_count("Multi-Melta", equiped_weapon) > 0) {
        set_as_ranged_twohand(spr_weapon_mmelta, rl);
    }
    if (equiped_weapon = "Assault Cannon") {
        set_as_ranged_assault(spr_weapon_assca, rl);
    }
    if (string_count("Sniper Rifle", equiped_weapon) > 0) {
        set_as_melee_onehand(spr_weapon_sniper, rl);
    }
    if (string_count("Stalker Pattern Bolter", equiped_weapon) > 0) {
        set_as_normal_ranged(spr_weapon_stalker, rl);
    }
    if (string_count("Combiflamer", equiped_weapon) > 0) {
        set_as_normal_ranged(spr_weapon_comflamer, rl);
    }
    // ** Melee weapons **
    if (string_count("Company Standard", equiped_weapon) > 0) {
        set_as_melee_onehand(spr_weapon_standard, rl);
    }
    if (string_count("Chainsword", equiped_weapon) > 0) {
        set_as_melee_onehand(spr_weapon_chsword, rl);
    }
    if (string_count("Combat Knife", equiped_weapon) > 0) {
        set_as_melee_onehand(spr_weapon_knife, rl);
    }
    if (string_count("Power Sword", equiped_weapon) > 0) {
        set_as_melee_onehand(spr_weapon_powswo, rl);
    }
    if (string_count("Eldar Power Sword", equiped_weapon) > 0) {
        set_as_melee_onehand(spr_weapon_eldsword, rl);
    }
    if (string_count("Power Spear", equiped_weapon) > 0) {
        set_as_melee_onehand(spr_weapon_powspear, rl);
    }
    if (string_count("Eviscerator", equiped_weapon) > 0) {
        set_as_melee_onehand(spr_weapon_evisc, rl);
    }
    if (string_count("Thunder Hammer", equiped_weapon) > 0) {
        set_as_melee_onehand(spr_weapon_thhammer, rl);
    }
    if (string_count("Relic Blade", equiped_weapon) > 0) {
        set_as_melee_onehand(spr_weapon_relbla, rl);
    }
    if (string_count("Power Axe", equiped_weapon) > 0) {
        set_as_melee_onehand(spr_weapon_powaxe, rl);
    }
    if (string_count("Chainaxe", equiped_weapon) > 0) {
        set_as_melee_onehand(spr_weapon_chaxe, rl);
    }
    if (string_count("Force Weapon", equiped_weapon) > 0) {
        set_as_melee_onehand(spr_weapon_force, rl);
    }
    if (string_count("Power Fist", equiped_weapon) > 0) and (string_count("DUB", equiped_weapon) == 0) {
        set_as_melee_onehand_special(spr_weapon_powfist, rl);
    }
    if (string_count("Lightning Claw", equiped_weapon) > 0) and (string_count("DUB", equiped_weapon) == 0) {
        set_as_melee_onehand_special(spr_weapon_lightning1, rl);
    }

    // Fix sprite for termi/tartar
    if (termi_tartaros >= 1) {
        if (argument0 == 1) and(ui_arm[1] == false) and (fix_left == 0) then fix_left = 1;
        if (argument0 == 2) and(ui_arm[2] == false) and (fix_right == 0) then fix_right = 1;
    }

    if (display_type == "normal_ranged") {
        if (termi_tartaros == 1) {
            ui_xmod[rl] = -22;
            ui_ymod[rl] = 11;
        }
        if (termi_tartaros == 2) {
            ui_xmod[rl] = -14;
            ui_ymod[rl] = 13;
        }
    }
    if (display_type == "melee_onehand") {
        if (termi_tartaros == 1) {
            ui_xmod[rl] = -21;
            ui_ymod[rl] = 18;
        }
        if (termi_tartaros == 2) {
            ui_xmod[rl] = -18;
            ui_ymod[rl] = 18;
        }
    }

    // Fix graphics for tremi/tartaros weapons
    if (display_type == "power_fist") {
        if (termi_tartaros > 0) {
            ui_arm[rl] = false;
            ui_above[rl] = true;
        }
        if (termi_tartaros == 1) and(argument0 == 1) {
            ui_xmod[rl] = -3;
            ui_ymod[rl] = 10;
            fix_left = 8;
            ui_weapon[rl] = spr_weapon_powfist3;
            clear = true;
        }
        if (termi_tartaros == 1) and(argument0 == 2) {
            ui_xmod[rl] = 2;
            ui_ymod[rl] = 10;
            fix_right = 8;
            ui_weapon[rl] = spr_weapon_powfist3;
            clear = true;
        }
        if (termi_tartaros == 2) and(argument0 == 1) {
            ui_xmod[rl] = 0;
            ui_ymod[rl] = 10;
            fix_left = 8;
            ui_weapon[rl] = spr_weapon_powfist3;
            clear = true;
        }
        if (termi_tartaros == 2) and(argument0 == 2) {
            ui_xmod[rl] = -1;
            ui_ymod[rl] = 10;
            fix_right = 8;
            ui_weapon[rl] = spr_weapon_powfist3;
            clear = true;
        }
    }
    if (display_type == "lightning_claw") {
        if (termi_tartaros == 0) and(argument0 == 1) {
            ui_xmod[rl] += 11;
        }
        if (termi_tartaros == 0) and(argument0 == 2) {
            ui_xmod[rl] -= 8;
        }
        if (termi_tartaros > 0) {
            ui_arm[rl] = false;
            ui_above[rl] = true;
        }
        if (termi_tartaros == 1) and(argument0 == 1) {
            ui_xmod[rl] = -3;
            ui_ymod[rl] = 10;
            fix_left = 8.1;
            ui_weapon[rl] = spr_weapon_lightning2;
            clear = true;
        }
        if (termi_tartaros == 1) and(argument0 == 2) {
            ui_xmod[rl] = 2;
            ui_ymod[rl] = 10;
            fix_right = 8.1;
            ui_weapon[rl] = spr_weapon_lightning2;
            clear = true;
        }
        if (termi_tartaros == 2) and(argument0 == 1) {
            ui_xmod[rl] = 0;
            ui_ymod[rl] = 10;
            fix_left = 8.1;
            ui_weapon[rl] = spr_weapon_lightning2;
            clear = true;
        }
        if (termi_tartaros == 2) and(argument0 == 2) {
            ui_xmod[rl] = -1;
            ui_ymod[rl] = 10;
            fix_right = 8.1;
            ui_weapon[rl] = spr_weapon_lightning2;
            clear = true;
        }
    }
    if (string_count("Storm Shield", equiped_weapon) > 0) {
        ui_weapon[rl] = spr_weapon_storm;
        ui_arm[rl] = false;
        ui_above[rl] = true;
        ui_spec[rl] = false;
    }
    if (string_count("Boarding Shield", equiped_weapon) > 0) {
        ui_weapon[rl] = spr_weapon_boarding;
        ui_arm[rl] = false;
        ui_above[rl] = true;
        ui_spec[rl] = false;
    }
    // Flip for offhand
    if (argument0 == 2)
        /*and (termi_tartaros=0)*/
        and(ui_xmod[rl] < 0)
    	and(display_type != "power_fist")
    	and(display_type != "lightning_claw")
    	then ui_xmod[rl] = ui_xmod[rl] * -1;
}

function set_as_normal_ranged(sprite, rl) {
    ui_weapon[rl] = sprite;
    ui_arm[rl] = true;
    ui_above[rl] = true;
    ui_spec[rl] = false;
    display_type = "normal_ranged";
}

function set_as_ranged_assault(sprite, rl) {
    ui_weapon[rl] = sprite;
    display_type = "ranged_assault";
    ui_arm[rl] = false;
    ui_above[rl] = true;
    ui_spec[rl] = true;
}

function set_as_ranged_twohand(sprite, rl) {
    ui_weapon[rl] = sprite;
    display_type = "ranged_twohand";
    ui_arm[1] = false;
    ui_arm[2] = false;
    ui_above[rl] = true;
    ui_spec[rl] = true;
    ui_twoh[rl] = true;
}

function set_as_melee_onehand(sprite, rl) {
    ui_weapon[rl] = sprite;
    ui_arm[rl] = false;
    ui_above[rl] = true;
    ui_spec[rl] = true;
    display_type = "melee_onehand";
}

function set_as_melee_onehand_special(sprite, rl) {
    ui_weapon[rl] = sprite;
    ui_arm[rl] = true;
    ui_above[rl] = true;
    ui_spec[rl] = true;
    display_type = "melee_onehand";
}
