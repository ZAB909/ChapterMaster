/// @function draw_text_bold(x, y, string)
/// @description Draws text two times with x+0.5 and y+0.5 offset on the second time.
function draw_text_bold(x, y, string){
    draw_text(x, y, string);
    draw_text(x+0.5, y+0.5, string);
}