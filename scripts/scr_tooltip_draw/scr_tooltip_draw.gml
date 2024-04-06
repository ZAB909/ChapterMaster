function tooltip_draw(_tooltip="", _width=350, _coords=[mouse_x+20,mouse_y+20], _text_color=#50a076, _font=fnt_40k_14, _header="", _header_font=fnt_40k_14b, _force_width=false){
	draw_set_halign(fa_left);
	draw_set_alpha(1)
	// Calculate padding and rectangle size
	static _text_padding_x = 12;
	static _text_padding_y = 12;
	// Convert hash to newline in strings
	_header = string_hash_to_newline(string(_header));
	_tooltip = string_hash_to_newline(string(_tooltip));
	// Set the font for the tooltip text and calculate its size
	draw_set_font(_font);
	if _force_width = false{
		var _text_w = min(string_width(_tooltip), _width);
	} else{
		var _text_w = _width;
	}
	var text_h = string_height_ext(_tooltip, DEFAULT_LINE_GAP, _text_w);
	// Calculate rectangle size
	var _rect_w = _text_w + _text_padding_x * 2;
	var _rect_h = text_h + _text_padding_y * 2;
	// If a header is provided, calculate its size and adjust the rectangle size
	if (_header != "") {
		// Set the font for the header and calculate its size
		draw_set_font(_header_font);
		if _force_width = false{
			var _header_w = min(string_width(_header), _width);
		} else{
			var _header_w = _width;
		}
		var header_h = string_height_ext(_header, DEFAULT_LINE_GAP, _header_w);
		// Adjust rectangle size
		_rect_w = max(_header_w, _text_w) + _text_padding_x * 2;
		_rect_h += header_h;
	}
	// Get view coordinates
	var xx = __view_get(e__VW.XView, 0);
	var yy = __view_get(e__VW.YView, 0);
	// Define tooltip position
	var _rect_x = _coords[0];
	var _rect_y = _coords[1];
	// Check if the tooltip goes over the right part of the screen and flip left if so
	if (_rect_x + _rect_w > xx + __view_get(e__VW.WView, 0) - 20) {
		_rect_x = _coords[0] - _rect_w - 40;
	}
	// Check if the tooltip goes over the bottom part of the screen and flip up if so
	if (_rect_y + _rect_h > yy + __view_get(e__VW.HView, 0) - 60) {
		_rect_y = _coords[1] - _rect_h - 40;
	}
	// Draw the tooltip background
	// draw_sprite_ext(spr_tooltip1, 0, _rect_x, _rect_y, x_scale, y_scale, 0, c_white, 1);
	// draw_sprite_ext(spr_tooltip1, 1, _rect_x, _rect_y, x_scale, y_scale, 0, c_white, 1);
	draw_sprite_stretched(spr_data_slate_back, 0, _rect_x, _rect_y, _rect_w, _rect_h);
	draw_rectangle_color_simple(_rect_x, _rect_y, _rect_w + _rect_x, _rect_h + _rect_y, 1, c_gray);
	draw_rectangle_color_simple(_rect_x + 1, _rect_y + 1, _rect_w + _rect_x - 1, _rect_h + _rect_y - 1, 1, c_black);
	draw_rectangle_color_simple(_rect_x + 2, _rect_y + 2, _rect_w + _rect_x - 2, _rect_h + _rect_y - 2, 1, c_gray);
	// Draw header text if it exists
	if (_header != "") {
		draw_set_font(_header_font);
		draw_text_ext_colour(_rect_x + _text_padding_x, _rect_y + _text_padding_y, _header, DEFAULT_LINE_GAP, _header_w, _text_color, _text_color, _text_color, _text_color, 1);
		_rect_y += header_h + DEFAULT_LINE_GAP; // Adjust y-coordinate for tooltip text
	}
	// Draw tooltip text
	draw_set_font(_font);
	draw_text_ext_colour(_rect_x + _text_padding_x, _rect_y + _text_padding_y, _tooltip, DEFAULT_LINE_GAP, _text_w, _text_color, _text_color, _text_color, _text_color, 1);
}