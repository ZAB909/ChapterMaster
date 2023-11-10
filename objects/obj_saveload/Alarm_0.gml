// SAVE

if(save_part = 1){
    txt = "Praise to the Machine God";
    with(obj_controller) {
        scr_save(1, obj_saveload.save_number, obj_saveload.save_file);
    }
    obj_saveload.save[save_number] = 1;
    trickle = 5;
}

/*

if (save_part = 6) {
    txt = "Praise to the Machine God";
    with(obj_controller) {
        scr_save(5, obj_saveload.save_number, _save_file);
    }
    trickle = 50;
}

if (save_part = 5) {
    txt = "Astartes Registry";
    with(obj_controller) {
        scr_save(4, obj_saveload.save_number, _save_file);
    }
    trickle = 40;
    save_part = 6;
}

if (save_part = 4) {
    txt = "Sacred Anointing of Oil";
    with(obj_controller) {
        scr_save(3, obj_saveload.save_number, _save_file);
    }
    trickle = 10;
    save_part = 5;
}

if (save_part = 3) {
    txt = "Charting Sector";
    with(obj_controller) {
        scr_save(2, obj_saveload.save_number, _save_file);
    }
    trickle = 10;
    save_part = 4;
}

if (save_part = 2) {
    txt = "Finding Servo Skulls";
    with(obj_controller) {
        scr_save(1, obj_saveload.save_number, _save_file);
    }
    trickle = 10;
    save_part = 3;
}

if (save_part = 1) {
    if (file_exists(_save_file)) then file_delete(_save_file);
    if (file_exists("screen" + string(save_number) + ".png")) then file_delete("screen" + string(save_number) + ".png");
    ini_open("saves.ini");
    ini_section_delete(string(save_number));
    ini_close();
    obj_saveload.save[save_number] = 0;
    save_part += 1;
    trickle = 10;
    txt = "Preparing";
}
*/

// LOAD

if (load_part = 6) {
    txt = "Praise to the Machine God";
    if (global.restart > 0) then txt = "Praise be to the Emperor";
    with(obj_controller) {
        scr_load(5, global.load);
    }
    trickle = 50;

    if (instance_exists(obj_cuicons)) {
        obj_cuicons.alarm[1] = 30;
    }

}

if (load_part = 5) {
    txt = "Sacred Anointing of Oil";
    if (global.restart > 0) then txt = "Speed Dialing Howling Banshee";
    with(obj_controller) {
        scr_load(4, global.load);
    }
    trickle = 10;
    load_part = 6;
}

if (load_part = 4) {
    with(obj_star) {
        if (x2 > 5) and(y2 > 5) then buddy = instance_nearest(x2, y2, obj_star);
    }
    txt = "Astartes Registry";
    if (global.restart > 0) then txt = "Donning Power Armour";
    with(obj_controller) {
        scr_load(3, global.load);
    }
    trickle = 40;
    load_part = 5;
}

if (load_part = 3) {
    txt = "Charting Sector";
    if (global.restart > 0) then txt = "Rousing the Machine Spirit";
    with(obj_controller) {
        scr_load(2, global.load);
    }
    trickle = 10;
    load_part = 4;
}

if (load_part = 2) {
    txt = "Finding Servo Skulls";
    if (global.restart > 0) then txt = "Turtle Waxing Scalp";
    with(obj_controller) {
        scr_load(1, global.load);
    }
    trickle = 10;
    load_part = 3;
}

if (load_part = 1) {
    if (file_exists("save" + string(global.load) + ".ini")) {
        load_part += 1;
        trickle = 10;
        txt = "Preparing";
    }
}