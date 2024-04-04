/// @function string_plural
/// @description This function formats a string into a plural form by adding affixes following common rules.
function string_plural(_string) {
    var _last_char = string_char_at(_string, string_length(_string));
    var _last_two_chars = string_copy(_string, string_length(_string) - 1, 2);
    if (_last_char == "y") {
        return string_copy(_string, 1, string_length(_string) - 1) + "ies";
    }
    else if (array_contains(["s", "x", "z", "ch", "sh"], _last_char)) {
        return _string + "es";
    }
    else if (_last_char == "f" || _last_two_chars == "fe") {
        return string_copy(_string, 1, string_length(_string) - string_length(_last_two_chars)) + "ves";
    }
    else {
        return _string + "s";
    }
}