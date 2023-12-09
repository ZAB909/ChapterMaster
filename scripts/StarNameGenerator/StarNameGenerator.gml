function StarNameGenerator() constructor {
    static names = [];
    static used_names = [];

    if (array_length(names) == 0) {
        var file_loader = new JsonFileListLoader();

        var load_result = file_loader.load_list_from_json_file("main\\names\\star.json",["names"]);

        if(load_result.is_success){
            names = load_result.values[$ "names"];
        }
        else{
            names = ["Star 1"];
        }
    }

    function generate_random_name(){
        if(array_length(names) == 0){
            // reset arrays if all names are used up
			debugl("Used up all Star names, resetting name lists");
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