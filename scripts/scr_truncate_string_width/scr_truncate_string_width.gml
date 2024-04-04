/// @function truncate_string_width
/// @description Truncates a string to fit within a specified pixel width, appending "..." if the string was truncated.
/// @param {string} _text The string to be truncated.
/// @param {int} _max_width The maximum allowable pixel width for the string.
/// @returns {string} Original or truncated string.
function truncate_string_width(_text, _max_width) {
    var _ellipsis = "...";
    var _ellipsis_width = string_width(_ellipsis);
    var _text_width = string_width(_text);
    if (_text_width > _max_width) {
        var i = string_length(_text);
        while (_text_width + _ellipsis_width > _max_width && i > 0) {
            i--;
            _text = string_delete(_text, i+1, 1);
            _text_width = string_width(_text);
        }
        return _text + _ellipsis;
    } else {
        return _text;
    }
}