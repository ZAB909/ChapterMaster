/// @function draw_text_bold
/// @description This function will draw text in a similar way to draw_text(), only now the text will be drawn twice with a slight offset, to make it look thicker.
function draw_text_bold(_x, _y, _text){
    draw_text(_x, _y, _text);
    draw_text(_x+0.5, _y+0.5, _text);
}