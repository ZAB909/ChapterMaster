/// @function draw_text_outline
/// @description This function will draw text in a similar way to draw_text(), only now the text will have an outline that may improve readability.
function draw_text_outline(_x, _y, _text, _outl_col=c_black, _text_col=-1){
    var _cur_color = draw_get_color();
    draw_set_color(_outl_col);
    draw_text(_x-1.5, _y, _text);
    draw_text(_x+1.5, _y, _text);
    draw_text(_x, _y-1.5, _text);
    draw_text(_x, _y+1.5, _text);
    if (_text_col != -1) draw_set_color(_text_col);
    else draw_set_color(_cur_color);
    draw_text(_x, _y, _text);
    draw_set_color(_cur_color);
}

/// @function draw_text_ext_outline
/// @description This function will draw text in a similar way to draw_text_ext(), only now the text will have an outline that may improve readability.
function draw_text_ext_outline(_x, _y, _text, _sep=-1, _w=9999, _outl_col=c_black, _text_col=0){
    var _cur_color = draw_get_color();
    draw_set_color(_outl_col);
    draw_text_ext(_x-1.5, _y, _text, _sep, _w);
    draw_text_ext(_x+1.5, _y, _text, _sep, _w);
    draw_text_ext(_x, _y-1.5, _text, _sep, _w);
    draw_text_ext(_x, _y+1.5, _text, _sep, _w);
    if (_text_col != 0) draw_set_color(_text_col);
    else draw_set_color(_cur_color);
    draw_text_ext(_x, _y, _text, _sep, _w);
    draw_set_color(_cur_color);
}

/// @function draw_text_transformed_outline
/// @description This function will draw text in a similar way to draw_text_transformed(), only now the text will have an outline that may improve readability.
function draw_text_transformed_outline(_x, _y, _text, _xscale=-1, _yscale=1, _angle=0, _outl_col=c_black, _text_col=0){
    var _cur_color = draw_get_color();
    draw_set_color(_outl_col);
    draw_text_transformed(_x-1.5, _y, _text, _xscale, _yscale, _angle);
    draw_text_transformed(_x+1.5, _y, _text, _xscale, _yscale, _angle);
    draw_text_transformed(_x, _y-1.5, _text, _xscale, _yscale, _angle);
    draw_text_transformed(_x, _y+1.5, _text, _xscale, _yscale, _angle);
    if (_text_col != 0) draw_set_color(_text_col);
    else draw_set_color(_cur_color);
    draw_text_transformed(_x, _y, _text, _xscale, _yscale, _angle);
    draw_set_color(_cur_color);
}