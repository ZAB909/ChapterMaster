/// @function draw_text_color_simple(_x, _y, _string, _color, _alpha=1)
/// @description
function draw_text_color_simple(_x, _y, _string, _color, _alpha=1){
    var _cur_color = draw_get_color();
    var _cur_alpha = draw_get_alpha();
    draw_set_color(_color);
    draw_set_alpha(_alpha);
    draw_text(_x, _y, _string);
    draw_set_color(_cur_color);
    draw_set_alpha(_cur_alpha);
}