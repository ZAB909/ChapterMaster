draw_set_alpha(1);

if (dragging==false) then draw_sprite_ext(spr_formation_bars,image_index,x,y,image_xscale,image_yscale,0,c_white,1);
if (dragging==true) then draw_sprite_ext(spr_formation_bars,image_index,x,y+1000,image_xscale,image_yscale,0,c_white,1);

draw_set_alpha(1);
draw_set_color(0);
draw_set_font(fnt_40k_14b);
draw_set_halign(fa_center);

var max_hi=height-4,actual_hi=0;

actual_hi=string_width(string_hash_to_newline(unit_type))*text_xscale;
if (actual_hi>max_hi) {
	for(var i=0; i<10; i++){
		actual_hi=string_width(string_hash_to_newline(unit_type))*text_xscale;
		if (actual_hi>max_hi) then text_xscale-=0.05;
	}
}

if (dragging==false) then draw_text_transformed(x+28,y+(height/2),string_hash_to_newline(string(unit_type)),text_xscale,text_xscale,270);
if (dragging==true) then draw_text_transformed(x+28,y+(height/2)+1000,string_hash_to_newline(string(unit_type)),text_xscale,text_xscale,270);
