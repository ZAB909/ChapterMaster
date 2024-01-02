function EldarNameGenerator() constructor {
    static first_syllables = [];
    static second_syllables = [];
    static third_syllables = [];

    if (array_length(first_syllables) == 0) {
        var file_loader = new JsonFileListLoader();

        var load_result = file_loader.load_list_from_json_file("main\\names\\eldar.json", ["first_syllables", "second_syllables", "third_syllables"]);

        if(load_result.is_success){
            first_syllables = load_result.values[$ "first_syllables"];
            second_syllables = load_result.values[$ "second_syllables"];
            third_syllables = load_result.values[$ "third_syllables"];
        }
        else{
            first_syllables = ["eldar_syllable_1"];
            second_syllables = ["eldar_syllable_2"];
            third_syllables = ["eldar_syllable_3"];
        }
    }

    function generate_random_name(syllable_amount) {
        var name = first_syllables[irandom(array_length(first_syllables) - 1)];

        if(syllable_amount >= 2){
            name += second_syllables[irandom(array_length(second_syllables) - 1)];
        }
        
        if(syllable_amount >= 3){
            name += third_syllables[irandom(array_length(third_syllables) - 1)];
        }

        return name;
    }
}