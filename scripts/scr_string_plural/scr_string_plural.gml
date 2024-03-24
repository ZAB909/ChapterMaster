function string_plural(str) {
    str = string(str)
    var last_char = string_char_at(str, string_length(str));
    var last_two_chars = string_copy(str, string_length(str) - 1, 2);

    if (last_char == "y") {
        return string_copy(str, 1, string_length(str) - 1) + "ies";
    }
    else if (array_contains(["s", "x", "z", "ch", "sh"], last_char)) {
        return str + "es";
    }
    else if (last_char == "f" || last_two_chars == "fe") {
        return string_copy(str, 1, string_length(str) - string_length(last_two_chars)) + "ves";
    }
    else {
        return str + "s";
    }
}
