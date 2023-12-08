function SectorNameGenerator() constructor {
    static names = [];
    static used_names = [];

    if (array_length(names) == 0) {
        // load names
        var file_buffer = undefined;
        try {
            var file_path = working_directory + "main\\names\\sector.json";
            file_buffer = buffer_load(file_path);

            if (file_buffer == -1) {
                throw ("Could not open file");
            }

            var json_string = buffer_read(file_buffer, buffer_string);
            var raw_data = json_parse(json_string);

            if (is_array(raw_data) == false) {
                throw ("No string array found");
            }

            var data_array = array_unique(raw_data);

            if(array_length(data_array) == 0){
                throw ("No (unique) values found");
            }

            names = array_shuffle(data_array);

            debugl($"Successfully loaded {array_length(names)} unique Sector names");
        } catch (_ex) {
            debugl($"Could not parse {file_path}: {_ex.message}. Using backup name list.");
            names = ["Andromedae"];
        } finally {
            if (is_undefined(file_buffer) == false) {
                buffer_delete(file_buffer);
            }
        }
    }

    function generate_random_name() {
        if(array_length(names) == 0){
            // reset arrays if all names are used up
			debugl("Used up all Sector names, resetting name lists");
            var used_names_length = array_length(used_names);
            names = array_create(used_names_length);
            array_copy(names, 0, used_names, 0, used_names_length);
            used_names = array_create(used_names_length); // to save a few cycles
        }

        var name = array_pop(names);
        array_push(used_names, name);
        return name;
    }
}