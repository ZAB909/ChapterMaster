// Creates the formation bars and draws them according to their designated type (infantry and vehicles)
function scr_ui_formation_bars() {
    var bar = 0,
        ii = 0,
        nbar = 0,
        abar = 0,
        fo = formating,
        te = 4700;

    var x9 = __view_get(e__VW.XView, 0) + 49;
    var y9 = __view_get(e__VW.YView, 0) + 224;

    with(obj_formation_bar) {
        instance_destroy();
    }
    with(obj_temp8) {
        instance_destroy();
    }

    for (bar = 1; bar <= 10; bar++) {
        te += 1;
        ii = 0;
        temp[te] = 0;
        var cu = instance_create(x9, y9, obj_temp8);
        cu.col_parent = bar;

        temp[te] = 0;
        temp[te + 100] = 0;

        // Set up the infantry
        if (bat_comm_for[fo] == bar) {
            init_combat_bars(2, 0, x9, y9, temp, te, "HQ",bar);
        } else if (bat_hono_for[fo] == bar) {
            init_combat_bars(1, 1, x9, y9, temp, te, "Hono",bar);
        } else if (bat_libr_for[fo] == bar) {
            init_combat_bars(1, 8, x9, y9, temp, te, "Lib",bar);
        } else if (bat_tech_for[fo] == bar) {
            init_combat_bars(1, 9, x9, y9, temp, te, "Tech",bar);
        } else if (bat_term_for[fo] == bar) {
            init_combat_bars(1, 10, x9, y9, temp, te, "Term",bar);
        } else if (bat_vete_for[fo] == bar) {
            init_combat_bars(2, 6, x9, y9, temp, te, "Veteran",bar);
        } else if (bat_tact_for[fo] == bar) {
            init_combat_bars(6, 3, x9, y9, temp, te, "Tactical",bar);
        } else if (bat_deva_for[fo] == bar) {
            init_combat_bars(3, 2, x9, y9, temp, te, "Devastator",bar);
        } else if (bat_assa_for[fo] == bar) {
            init_combat_bars(3, 5, x9, y9, temp, te, "Assault",bar);
        } else if (bat_scou_for[fo] == bar) {
            init_combat_bars(1, 4, x9, y9, temp, te, "Sco",bar);
        } else if (bat_drea_for[fo] == bar) {
            init_combat_bars(2, 11, x9, y9, temp, te, "Dread",bar);
        } else if (bat_hire_for[fo] == bar) {
            init_combat_bars(1, 7, x9, y9, temp, te, "???",bar);
        }
        // Set up the vehicles
        if (bat_formation_type[fo] != 2) {
            if (bat_rhin_for[fo] == bar) {
                init_combat_bars(4, 12, x9, y9, temp, te, "Rhino",bar);
            } else if (bat_pred_for[fo] == bar) {
                init_combat_bars(2, 13, x9, y9, temp, te, "Predator",bar);
            } else if (bat_land_for[fo] == bar) {
                init_combat_bars(2, 14, x9, y9, temp, te, "Land Raider",bar);
            }
        }

        if (instance_exists(nbar)) {
            nbar.width = 39;
        }

        if (temp[4800 + bar] > 10) {
            bat_deva_for[bar] = 1;
            bat_assa_for[bar] = 4;
            bat_tact_for[bar] = 2;
            bat_vete_for[bar] = 2;
            bat_hire_for[bar] = 3;
            bat_libr_for[bar] = 3;
            bat_comm_for[bar] = 3;
            bat_tech_for[bar] = 3;
            bat_term_for[bar] = 3;
            bat_hono_for[bar] = 3;
            bat_drea_for[bar] = 5;
            bat_rhin_for[bar] = 6;
            bat_pred_for[bar] = 7;
            bat_land_for[bar] = 7;
            bat_scou_for[bar] = 1;
            bar_fix = 1;
        }

        y9 = __view_get(e__VW.YView, 0) + 224;
        x9 += 50;
    }
}

function init_combat_bars(size, image_index, x9, y9, temp, te, unit_type, parent) {
    nbar = instance_create(x9, y9 + temp[te], obj_formation_bar);
    nbar.size = size;
    nbar.height = nbar.size * 47;
    if (temp[te] > 0) then above_neighbor = abar;
    temp[te] += nbar.height;
    abar = nbar;
    temp[te + 100] += nbar.size;
    nbar.image_index = image_index;
    nbar.unit_type = unit_type;
    //nbar.unit_id = ii;
    nbar.col_parent = parent;
}