/// @function draw_text_bold
/// @description This function will draw text in a similar way to draw_text(), only now the text will be drawn twice with a slight offset, to make it look thicker.
function draw_text_bold(_x, _y, _text){
    draw_text(_x, _y, _text);
    draw_text(_x+0.5, _y+0.5, _text);
}

function draw_line(x1, y1, y_slide, variable) {
    l_hei = 37;
    l_why = 0;

    if (variable > 0) {
        if (variable > 94) {
            l_hei = 134 - variable;
            l_why = min(variable - 96, 11);
        }

        draw_line(view_xview[0] + variable + x1, view_yview[0] + 10 + 1 + l_why, view_xview[0] + variable + x1, view_yview[0] + 10 + 37 - l_why);
    }
}