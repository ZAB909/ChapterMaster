// Displays weapon based on the armour type to change the art to match the armour type
function scr_ui_display_weapons(left_or_right, termi_tartaros, equiped_weapon) {

    clear = false;
    ui_xmod[left_or_right] = 0;
    ui_ymod[left_or_right] = 0;
    ui_arm[left_or_right] = true;
    ui_weapon[left_or_right] = spr_weapon_blank;
    ui_twoh[left_or_right] = false;
    display_type = "normal_ranged";

    // Checks if armour is either termi or tartaros to display proper fix
    if (left_or_right == 1) then fix_left = 0;
    if (left_or_right == 2) then fix_right = 0;
    var normal_ranged ={
        "Bolt Pistol":spr_weapon_boltpis,
        "Infernus Pistol":spr_weapon_inferno,
        "Bolter":spr_weapon_bolter,
        "Plasma Pistol":spr_weapon_plasp,
        "Plasma Gun":spr_weapon_plasg,
        "Missile Launcher":spr_weapon_missile,
        "Flamer":spr_weapon_flamer,
        "Meltagun":spr_weapon_melta,
        "Stalker Pattern Bolter":spr_weapon_stalker,
        "Combiflamer":spr_weapon_comflamer,
    }

    var sprite_found =false;
    var normal_ranged_names = struct_get_names(normal_ranged);
    for (var i=0;i<array_length(normal_ranged_names);i++){
        if (string_count(normal_ranged_names[i], equiped_weapon) > 0){
            if (normal_ranged_names[i]!="Bolter") && (normal_ranged_names[i]!="Missile Launcher"){
                set_as_normal_ranged(normal_ranged[$ normal_ranged_names[i]],left_or_right)
                sprite_found = !sprite_found;
                break;
            } else if  (normal_ranged_names[i]=="Bolter"){
                if (string_count("Heavy", equiped_weapon) == 0) and(string_count("Integrated", equiped_weapon) == 0){
                    var sprite = string_count("Storm", equiped_weapon) > 0 ? spr_weapon_sbolter : spr_weapon_bolter;
                    set_as_normal_ranged(sprite, left_or_right);
                    sprite_found = !sprite_found;
                    break;
                }
            } else if  (normal_ranged_names[i]=="Missile Launcher"){
                if (string_count("Whileft_or_right", equiped_weapon) == 0){
                    set_as_normal_ranged(spr_weapon_missile, left_or_right);
                    sprite_found = !sprite_found;
                    break;
                }
            }
        }
    }
    if (!sprite_found){
        var heavy_ranged ={
            "Heavy Bolter":spr_weapon_hbolt,
            "Lascannon":spr_weapon_lasca,
            "Multi-Melta":spr_weapon_mmelta,
            "Assault Cannon":spr_weapon_assca,
            "Sniper Rifle":spr_weapon_sniper,
        }
        var heavy_ranged_names=struct_get_names(heavy_ranged);
        for (var i=0;i<array_length(heavy_ranged_names);i++){
            if (string_count(heavy_ranged_names[i], equiped_weapon) > 0){
                set_as_ranged_twohand(heavy_ranged[$ heavy_ranged_names[i]],left_or_right)
                sprite_found = !sprite_found;
                break;               
            }
        }
    }
    if (!sprite_found){
        var melee_weapons ={
            "Company Standard":spr_weapon_standard,
            "Chainsword":spr_weapon_chsword,
            "Combat Knife":spr_weapon_knife,
            "Power Sword":spr_weapon_powswo,
            "Eldar Power Sword":spr_weapon_eldsword,
            "Power Spear":equiped_weapon,
            "Eviscerator":spr_weapon_evisc,
            "Thunder Hammer":spr_weapon_thhammer,
            "Relic Blade":spr_weapon_relbla,
            "Power Axe":spr_weapon_powaxe,
            "Chainaxe":spr_weapon_chaxe,
            "Force Weapon":spr_weapon_force,
        }
        var melee_weapons_names=struct_get_names(melee_weapons);
        var wep_
        for (var i=0;i<array_length(melee_weapons_names);i++){
            if (string_count(melee_weapons_names[i], equiped_weapon) > 0){
                set_as_melee_onehand(melee_weapons[$ melee_weapons_names[i]],left_or_right)
                sprite_found = !sprite_found;
                break;               
            }                      
        }
         if (!sprite_found){
            if (string_count("Power Fist", equiped_weapon) > 0) and (string_count("DUB", equiped_weapon) == 0) {
                set_as_melee_onehand_special(spr_weapon_powfist, left_or_right);
                sprite_found = !sprite_found;
            }else if (string_count("Lightning Claw", equiped_weapon) > 0) and (string_count("DUB", equiped_weapon) == 0) {
                set_as_melee_onehand_special(spr_weapon_lightning1, left_or_right);
                sprite_found = !sprite_found;
            }            
         }
    }


    // Fix sprite for termi/tartar
    if (termi_tartaros >= 1) {
        if (left_or_right == 1) and(ui_arm[1] == false) and (fix_left == 0) then fix_left = 1;
        if (left_or_right == 2) and(ui_arm[2] == false) and (fix_right == 0) then fix_right = 1;
    }

    if (display_type == "normal_ranged") {
        if (termi_tartaros == 1) {
            ui_xmod[left_or_right] = -22;
            ui_ymod[left_or_right] = 11;
        }
        if (termi_tartaros == 2) {
            ui_xmod[left_or_right] = -14;
            ui_ymod[left_or_right] = 13;
        }
    }
    if (display_type == "melee_onehand") {
        if (termi_tartaros == 1) {
            ui_xmod[left_or_right] = -21;
            ui_ymod[left_or_right] = 18;
        }
        if (termi_tartaros == 2) {
            ui_xmod[left_or_right] = -18;
            ui_ymod[left_or_right] = 18;
        }
    }

    // Fix graphics for tremi/tartaros weapons
    if (display_type == "power_fist") {
        if (termi_tartaros > 0) {
            ui_arm[left_or_right] = false;
            ui_above[left_or_right] = true;
        }
        if (termi_tartaros == 1) and(left_or_right == 1) {
            ui_xmod[left_or_right] = -3;
            ui_ymod[left_or_right] = 10;
            fix_left = 8;
            ui_weapon[left_or_right] = spr_weapon_powfist3;
            clear = true;
        }
        if (termi_tartaros == 1) and(left_or_right == 2) {
            ui_xmod[left_or_right] = 2;
            ui_ymod[left_or_right] = 10;
            fix_right = 8;
            ui_weapon[left_or_right] = spr_weapon_powfist3;
            clear = true;
        }
        if (termi_tartaros == 2) and(left_or_right == 1) {
            ui_xmod[left_or_right] = 0;
            ui_ymod[left_or_right] = 10;
            fix_left = 8;
            ui_weapon[left_or_right] = spr_weapon_powfist3;
            clear = true;
        }
        if (termi_tartaros == 2) and(left_or_right == 2) {
            ui_xmod[left_or_right] = -1;
            ui_ymod[left_or_right] = 10;
            fix_right = 8;
            ui_weapon[left_or_right] = spr_weapon_powfist3;
            clear = true;
        }
    }
    if (display_type == "lightning_claw") {
        if (termi_tartaros == 0) and(left_or_right == 1) {
            ui_xmod[left_or_right] += 11;
        }
        if (termi_tartaros == 0) and(left_or_right == 2) {
            ui_xmod[left_or_right] -= 8;
        }
        if (termi_tartaros > 0) {
            ui_arm[left_or_right] = false;
            ui_above[left_or_right] = true;
        }
        if (termi_tartaros == 1) and(left_or_right == 1) {
            ui_xmod[left_or_right] = -3;
            ui_ymod[left_or_right] = 10;
            fix_left = 8.1;
            ui_weapon[left_or_right] = spr_weapon_lightning2;
            clear = true;
        }
        if (termi_tartaros == 1) and(left_or_right == 2) {
            ui_xmod[left_or_right] = 2;
            ui_ymod[left_or_right] = 10;
            fix_right = 8.1;
            ui_weapon[left_or_right] = spr_weapon_lightning2;
            clear = true;
        }
        if (termi_tartaros == 2) and(left_or_right == 1) {
            ui_xmod[left_or_right] = 0;
            ui_ymod[left_or_right] = 10;
            fix_left = 8.1;
            ui_weapon[left_or_right] = spr_weapon_lightning2;
            clear = true;
        }
        if (termi_tartaros == 2) and(left_or_right == 2) {
            ui_xmod[left_or_right] = -1;
            ui_ymod[left_or_right] = 10;
            fix_right = 8.1;
            ui_weapon[left_or_right] = spr_weapon_lightning2;
            clear = true;
        }
    }
    if (string_count("Storm Shield", equiped_weapon) > 0) {
        ui_weapon[left_or_right] = spr_weapon_storm;
        ui_arm[left_or_right] = false;
        ui_above[left_or_right] = true;
        ui_spec[left_or_right] = false;
    }
    if (string_count("Boarding Shield", equiped_weapon) > 0) {
        ui_weapon[left_or_right] = spr_weapon_boarding;
        ui_arm[left_or_right] = false;
        ui_above[left_or_right] = true;
        ui_spec[left_or_right] = false;
    }
    // Flip for offhand
    if (left_or_right == 2)
        /*and (termi_tartaros=0)*/
        and(ui_xmod[left_or_right] < 0)
    	and(display_type != "power_fist")
    	and(display_type != "lightning_claw")
    	then ui_xmod[left_or_right] = ui_xmod[left_or_right] * -1;
}

function set_as_normal_ranged(sprite, left_or_right) {
    ui_weapon[left_or_right] = sprite;
    ui_arm[left_or_right] = true;
    ui_above[left_or_right] = true;
    ui_spec[left_or_right] = false;
    display_type = "normal_ranged";
}

function set_as_ranged_assault(sprite, left_or_right) {
    ui_weapon[left_or_right] = sprite;
    display_type = "ranged_assault";
    ui_arm[left_or_right] = false;
    ui_above[left_or_right] = true;
    ui_spec[left_or_right] = true;
}

function set_as_ranged_twohand(sprite, left_or_right) {
    ui_weapon[left_or_right] = sprite;
    display_type = "ranged_twohand";
    ui_arm[1] = false;
    ui_arm[2] = false;
    ui_above[left_or_right] = true;
    ui_spec[left_or_right] = true;
    ui_twoh[left_or_right] = true;
}

function set_as_melee_onehand(sprite, left_or_right) {
    ui_weapon[left_or_right] = sprite;
    ui_arm[left_or_right] = false;
    ui_above[left_or_right] = true;
    ui_spec[left_or_right] = true;
    display_type = "melee_onehand";
}

function set_as_melee_onehand_special(sprite, left_or_right) {
    ui_weapon[left_or_right] = sprite;
    ui_arm[left_or_right] = true;
    ui_above[left_or_right] = true;
    ui_spec[left_or_right] = true;
    display_type = "melee_onehand";
}
