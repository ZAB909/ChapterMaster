hover = 0;
shop = "";
click = 0;
click2 = 0;
discount = 0;
construction_started = 0;
eta = 0;
target_comp = obj_controller.new_vehicles;

tooltip_show = 0;
tooltip = "";
tooltip_weapon = 0;
tooltip_stat1 = 0;
tooltip_stat2 = 0;
tooltip_stat3 = 0;
tooltip_stat4 = 0;
tooltip_other = "";
tooltip_x = 0;
tooltip_y = 0;
tooltip_width = 0;
tooltip_height = 0;

shop = "equipment";
/*if (obj_controller.menu=55) then shop="equipment";
if (obj_controller.menu=56) then shop="vehicles";
if (obj_controller.menu=57) then shop="warships";
if (obj_controller.menu=58) then shop="equipment2";*/
if (instance_number(obj_shop) > 1) {
    var war;
    war = instance_nearest(0, 0, obj_shop);
    shop = war.shop;
    with(war) {
        instance_destroy();
    }
    x = 0;
    y = 0;
}


var i, rene;
i = -1;
rene = 0;
repeat(40) {
    i += 1;
    item[i] = "";
    x_mod[i] = 0;
    item_stocked[i] = 0;
    mc_stocked[i] = 0;
    item_cost[i] = 0;
    nobuy[i] = 0;
}
if (obj_controller.faction_status[eFACTION.Imperium] = "War") {
    rene = 1;
    with(obj_temp6) {
        instance_destroy();
    }
    with(obj_star) {
        var u;
        u = 0;
        repeat(4) {
            u += 1;
            if (p_type[u] = "Forge") and(p_owner[u] = 1) then instance_create(x, y, obj_temp6);
        }
    }
    if (instance_exists(obj_temp6)) then rene = 0;
    with(obj_temp6) {
        instance_destroy();
    }
}

if (shop = "equipment") {
    i = 0;
    i += 1;
    item[i] = "Combat Knife";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 1;
    i += 1;
    item[i] = "Chainsword";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 4;
    i += 1;
    x_mod[i] = 9;
    item[i] = "Eviscerator";
    item_stocked[i] = scr_item_count(item[i]);
    nobuy[i] = 1;
    i += 1;
    item[i] = "Chainaxe";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 10;
    i += 1;
    item[i] = "Power Axe";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 40;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    item[i] = "Power Sword";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 25;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    item[i] = "Power Fist";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 60;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    item[i] = "Lightning Claw";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 50;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    item[i] = "Chainfist";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 75;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    item[i] = "Force Weapon";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 65;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    item[i] = "Thunder Hammer";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 90;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    x_mod[i] = 9;
    item[i] = "Lascutter";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 15;
    i += 1;
    x_mod[i] = 9;
    item[i] = "Boarding Shield";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 20;
    i += 1;
    x_mod[i] = 9;
    item[i] = "Storm Shield";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 50;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    x_mod[i] = 9;
    item[i] = "Company Standard";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 400;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }


    i += 1;
    item[i] = "Bolt Pistol";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 5;
    i += 1;
    item[i] = "Bolter";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 10;
    i += 1;
    item[i] = "Stalker Pattern Bolter";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 80;
    i += 1;
    x_mod[i] = 9;
    item[i] = "Combiflamer";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 35;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    item[i] = "Heavy Bolter";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 50;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    item[i] = "Storm Bolter";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 50;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    item[i] = "Flamer";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 25;
    i += 1;
    item[i] = "Heavy Flamer";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 40;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    item[i] = "Incinerator";
    item_stocked[i] = scr_item_count(item[i]);
    nobuy[i] = 1;
    i += 1;
    item[i] = "Integrated Bolters";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 120;
    i += 1;
    item[i] = "Meltagun";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 30;
    i += 1;
    item[i] = "Multi-Melta";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 60;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    item[i] = "Plasma Pistol";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 60;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    item[i] = "Plasma Gun";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 100;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    x_mod[i] = 9;
    item[i] = "Archeotech Laspistol";
    item_stocked[i] = scr_item_count(item[i]);
    nobuy[i] = 1;
    i += 1;
    x_mod[i] = 9;
    item[i] = "Hellrifle";
    item_stocked[i] = scr_item_count(item[i]);
    nobuy[i] = 1;
    i += 1;
    item[i] = "Sniper Rifle";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 10;

    i += 1;
    item[i] = "Missile Launcher";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 70;
    i += 1;
    item[i] = "Lascannon";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 70;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i = 0;
    repeat(39) {
        i += 1;
        if (item[i] != "") then mc_stocked[i] = scr_item_count("Master Crafted " + string(item[i]));
    }
}
if (shop = "equipment2") {
    i = 0;
    i += 1;
    item[i] = "MK3 Iron Armour";
    item_stocked[i] = scr_item_count("MK3 Iron Armour");
    nobuy[i] = 1;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    item[i] = "MK4 Maximus";
    item_stocked[i] = scr_item_count("MK4 Maximus");
    nobuy[i] = 1;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    item[i] = "MK5 Heresy";
    item_stocked[i] = scr_item_count("MK5 Heresy");
    item_cost[i] = 45;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    item[i] = "MK6 Corvus";
    item_stocked[i] = scr_item_count("MK6 Corvus");
    item_cost[i] = 35;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    item[i] = "MK7 Aquila";
    item_stocked[i] = scr_item_count("MK7 Aquila");
    item_cost[i] = 20;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    item[i] = "MK8 Errant";
    item_stocked[i] = scr_item_count("MK8 Errant");
    nobuy[i] = 1;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    item[i] = "Scout Armour";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 5;
    i += 1;
    item[i] = "Artificer Armour";
    item_stocked[i] = scr_item_count("Artificer Armour");
    nobuy[i] = 1;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    item[i] = "Terminator Armour";
    item_stocked[i] = scr_item_count("Terminator Armour");
    nobuy[i] = 1;
    if (obj_controller.stc_wargear >= 6) {
        nobuy[i] = 0;
        item_cost[i] = 350;
    } // if (rene=1){nobuy[i]=1;item_cost[i]=0;}
    i += 1;
    item[i] = "Tartaros";
    item_stocked[i] = scr_item_count("Tartaros");
    nobuy[i] = 1;

    i += 1;
    x_mod[i] = 9;
    item[i] = "Jump Pack";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 20;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }

    i += 1;
    x_mod[i] = 9;
    item[i] = "Servo Arms";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 30;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    x_mod[i] = 9;
    item[i] = "Bionics";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 5;
    i += 1;
    x_mod[i] = 9;
    item[i] = "Narthecium";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 10;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    x_mod[i] = 9;
    item[i] = "Psychic Hood";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 100;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    x_mod[i] = 9;
    item[i] = "Rosarius";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 100;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    x_mod[i] = 9;
    item[i] = "Iron Halo";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 250;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    x_mod[i] = 9;
    item[i] = "Plasma Bomb";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 175;
    i += 1;
    x_mod[i] = 9;
    item[i] = "Exterminatus";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 2500;
}


if (shop = "vehicles") {
    i = 0;
    i += 1;
    item[i] = "Rhino";
    item_stocked[i] = scr_vehicle_count(item[i], "");
    item_cost[i] = 120;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    item[i] = "Predator";
    item_stocked[i] = scr_vehicle_count(item[i], "");
    item_cost[i] = 240;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    x_mod[i] = 9;
    item[i] = "Autocannon Turret";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 30;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    x_mod[i] = 9;
    item[i] = "Twin Linked Lascannon Turret";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 60;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    x_mod[i] = 9;
    item[i] = "Heavy Bolter Sponsons";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 38;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    x_mod[i] = 9;
    item[i] = "Heavy Flamer Sponsons";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 50;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    x_mod[i] = 9;
    item[i] = "Lascannon Sponsons";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 60;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    item[i] = "Land Raider";
    item_stocked[i] = scr_vehicle_count(item[i], "");
    nobuy[i] = 1;
    if (obj_controller.stc_vehicles >= 6) {
        nobuy[i] = 0;
        item_cost[i] = 500;
    } // if (rene=1){nobuy[i]=1;item_cost[i]=0;}
    i += 1;
    x_mod[i] = 9;
    item[i] = "Twin Linked Heavy Bolter Mount";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 28;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    x_mod[i] = 9;
    item[i] = "Twin Linked Assault Cannon Mount";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 60;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    x_mod[i] = 9;
    item[i] = "Flamestorm Cannon Sponsons";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 100;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    x_mod[i] = 9;
    item[i] = "Hurricane Bolter Sponsons";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 70;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    x_mod[i] = 9;
    item[i] = "Twin Linked Lascannon Sponsons";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 120;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    item[i] = "Whirlwind";
    item_stocked[i] = scr_vehicle_count(item[i], "");
    item_cost[i] = 180;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    x_mod[i] = 9;
    item[i] = "HK Missile";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 10;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    item[i] = "Land Speeder";
    item_stocked[i] = scr_vehicle_count(item[i], "");
    nobuy[i] = 1;
    i += 1;
    x_mod[i] = 9;
    item[i] = "Twin Linked Bolters";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 8;
    if (obj_controller.stc_vehicles >= 6) {
        nobuy[i] = 0;
        item_cost[i] = 200;
    } // if (rene=1){nobuy[i]=1;item_cost[i]=0;}
    i += 1;
    item[i] = "Bike";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 35;
    i += 1;
    item[i] = "Dreadnought";
    item_stocked[i] = scr_item_count(item[i]);
    nobuy[i] = 1; // if (rene=1){nobuy[i]=1;item_cost[i]=0;}
    if (obj_controller.stc_wargear >= 6) {
        nobuy[i] = 0;
        item_cost[i] = 700;
    } // if (rene=1){nobuy[i]=1;item_cost[i]=0;}
    i += 1;
    x_mod[i] = 9;
    item[i] = "Close Combat Weapon";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 45;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    x_mod[i] = 9;
    item[i] = "Force Weapon";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 80;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    x_mod[i] = 9;
    item[i] = "Twin Linked Heavy Bolter";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 110;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    x_mod[i] = 9;
    item[i] = "Twin Linked Lascannon";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 110;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    x_mod[i] = 9;
    item[i] = "Autocannon";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 80;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    x_mod[i] = 9;
    item[i] = "Inferno Cannon";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 115;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    x_mod[i] = 9;
    item[i] = "Assault Cannon";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 75;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    x_mod[i] = 9;
    item[i] = "Flamestorm Cannon";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 135;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    x_mod[i] = 9;
    item[i] = "Assault Cannon";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 110;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    x_mod[i] = 9;
    item[i] = "Twin-Linked Assault Cannon";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 150;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    x_mod[i] = 9;
    item[i] = "Whirlwind Missile Launcher";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 90;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    x_mod[i] = 9;
    item[i] = "Heavy Conversion Beam Projector";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 100;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    x_mod[i] = 9;
    item[i] = "Void Shield";
    item_stocked[i] = scr_item_count(item[i]);
    item_cost[i] = 250;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
}

if (obj_controller.stc_wargear >= 6) {
    nobuy[i] = 0;
    item_cost[i] = 700;
}

if (shop = "warships") {
    i = 0;
    i += 1;
    item[i] = "Battle Barge";
    item_stocked[i] = scr_ship_count(item[i]);
    item_cost[i] = 20000;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    item[i] = "Strike Cruiser";
    item_stocked[i] = scr_ship_count(item[i]);
    item_cost[i] = 8000;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    item[i] = "Gladius";
    item_stocked[i] = scr_ship_count(item[i]);
    item_cost[i] = 2250;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    item[i] = "Hunter";
    item_stocked[i] = scr_ship_count(item[i]);
    item_cost[i] = 3000;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
    i += 1;
    x_mod[i] = 9;
    item[i] = "Cyclonic Torpedo";
    item_stocked[i] = scr_item_count(item[i]);
    nobuy[i] = 1;
    if (rene = 1) {
        nobuy[i] = 1;
        item_cost[i] = 0;
    }
}



with(obj_p_fleet) {
    if (capital_number > 0) and(action = "") {
        var you;
        you = instance_nearest(x, y, obj_star);
        if (you.trader > 0) then obj_shop.discount = 1;
    }
}
with(obj_star) {
    if ((p_owner[1] = 1) or(p_owner[2] = 1) or(p_owner[3] = 1) or(p_owner[4] = 1)) and(trader > 0) then obj_shop.discount = 1;
}


if (shop = "equipment") or(shop = "equipment2") {
    var disc;
    disc = 1;
    if (obj_controller.stc_wargear >= 1) then disc = 0.92;
    if (obj_controller.stc_wargear >= 3) then disc = 0.86;
    if (obj_controller.stc_wargear >= 5) then disc = 0.75;
    i = 0;
    repeat(31) {
        i += 1;
        if (item_cost[i] > 1) then item_cost[i] = round(item_cost[i] * disc);
    }
}
if (shop = "vehicles") {
    var disc;
    disc = 1;
    if (obj_controller.stc_vehicles >= 1) then disc = 0.92;
    if (obj_controller.stc_vehicles >= 3) then disc = 0.86;
    if (obj_controller.stc_vehicles >= 5) then disc = 0.75;
    i = 0;
    repeat(31) {
        i += 1;
        var ahuh;
        ahuh = 1;
        if (i >= 7) and(i <= 12) then ahuh = 0;
        if (ahuh = 1) {
            if (item_cost[i] > 1) then item_cost[i] = round(item_cost[i] * disc);
        }
    }
}
if (shop = "warships") {
    var disc;
    disc = 1;
    if (obj_controller.stc_ships >= 1) then disc = 0.92;
    if (obj_controller.stc_ships >= 3) then disc = 0.86;
    if (obj_controller.stc_ships >= 5) then disc = 0.75;
    i = 0;
    repeat(31) {
        i += 1;
        if (item_cost[i] > 1) then item_cost[i] = round(item_cost[i] * disc);
    }
}
if (discount = 1) {
    discount = 2;
    i = 0;
    repeat(31) {
        i += 1;
        if (item_cost[i] >= 5) then item_cost[i] = round(item_cost[i] * 0.8);
        if (item_cost[i] > 1) and(item_cost[i] < 5) then item_cost[i] -= 1;
    }
}

if (rene = 1) {
    i = 0;
    repeat(31) {
        i += 1;
        item_cost[i] = item_cost[i] * 2;
    }
}


/* */
/*  */