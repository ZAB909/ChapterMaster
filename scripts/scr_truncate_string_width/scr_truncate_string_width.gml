/// @function truncate_string_width(str, max_width)
/// @description Truncates a string to fit within a specified pixel width, appending "..." if the string was truncated.
/// @param {string} str The string to be truncated.
/// @param {int} max_width The maximum allowable pixel width for the string.
/// @returns {string} Original or truncated string.
function truncate_string_width(str, max_width) {
    var ellipsis = "...";
    var ellipsis_width = string_width(ellipsis);
    var str_width = string_width(str);
    if (str_width > max_width) {
        var i = string_length(str);
        while (str_width + ellipsis_width > max_width && i > 0) {
            i--;
            str = string_delete(str, i+1, 1);
            str_width = string_width(str);
        }
        return str + ellipsis;
    } else {
        return str;
    }
}