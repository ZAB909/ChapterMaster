/// @function draw_text_glow
/// @description This function will draw text in a similar way to draw_text(), only now the text will have a glow effect.
function draw_text_glow(_x, _y, _text, _text_color, _glow_color){
    var _cur_color = draw_get_color();
    // Draw the glow by repeatedly drawing the text with a slight offset and reduced alpha
    draw_set_color(_glow_color);
    for (var i = -3; i <= 3; i++) {
        for (var j = -3; j <= 3; j++) {
            if (i != 0 || j != 0) { // Avoid drawing the main text here
                draw_set_alpha(0.05); // Adjust the alpha for the desired intensity of the glow
                draw_text(_x+i, _y+j, _text);
            }
        }
    }
    draw_set_alpha(1)
    draw_set_color(_text_color);
    draw_text(_x, _y, _text);
    draw_set_color(_cur_color);
}