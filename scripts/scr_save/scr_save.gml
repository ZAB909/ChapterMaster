function scr_save(save_process_stage, save_id, save_file) {
var num = instance_number(obj_star);
    instance_array[0] = 0;

	// HMMMMMMMM
// Maybe https://manual.yoyogames.com/GameMaker_Language/GML_Reference/File_Handling/Encoding_And_Hashing/json_stringify.htm
// will allow to just copy all data that I need with minimal changes?
// or at least create Save(), Load() in relevant objects/scripts, to simplify everything?

// also https://manual.yoyogames.com/GameMaker_Language/GML_Reference/File_Handling/Encoding_And_Hashing/Encoding_And_Hashing.htm
// https://manual.yoyogames.com/GameMaker_Language/GML_Reference/File_Handling/Encoding_And_Hashing/json_encode.htm

	// TODO enums
	if (save_process_stage = 1) or(save_process_stage = 0) { // TODO why 0?
		debugl("Saving to slot " + string(save_id));
        var _save_file_handle = file_text_open_write(save_file);
		if(_save_file_handle == - 1){
			debugl("Saving to slot " + string(save_id) + " error, could not create/open file: " + save_file);
			return;
		}

        //file_text_write_string(_save_file_handle, json_stringify(global.chapter_name, true));
		file_text_write_string(_save_file_handle, json_stringify(new SavedGameData(), true));
		file_text_close(_save_file_handle);
		obj_saveload.save[save_id] = 1;
        debugl("Saving to slot " + string(save_id) + " complete");
	}
}

function SavedGameData() constructor
{
	game_version= global.version;
	timestamp = date_datetime_string(date_current_datetime());
	global_data = {
		chapter_name: global.chapter_name,		
		game_seed: global.game_seed,
		founding_secret: global.founding_secret,
		is_custom_chapter: global.custom,
		cheats:{
			req: global.cheat_req,
			gene: global.cheat_gene,
			debug: global.cheat_debug,
			disp: global.cheat_disp,
		},
		sod: random_get_seed() // TODO what? looks like a checksum?
	}
	controller =  obj_controller.serialize();
	ini = obj_ini.serialize();
}