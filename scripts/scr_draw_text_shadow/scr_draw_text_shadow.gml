/// @function draw_text_shadow
/// @description This function will draw text in a similar way to draw_text(), only now the text will have a diagonal shadow.
function draw_text_shadow(_x, _y, _text){
    var _cur_color = draw_get_color();
    draw_set_color(c_black);
    draw_text(_x-1, _y+1, _text);
    draw_set_color(_cur_color);
    draw_text(_x, _y, _text);
}

/// @function draw_text_ext_shadow
/// @description This function will draw text in a similar way to draw_text_ext(), only now the text will have a diagonal shadow.
function draw_text_ext_shadow(_x, _y, _text, _sep=-1, _w=9999){
    var _cur_color = draw_get_color();
    draw_set_color(c_black);
    draw_text_ext(_x-1, _y+1, _text, _sep, _w);
    draw_set_color(_cur_color);
    draw_text_ext(_x, _y, _text, _sep, _w);
}