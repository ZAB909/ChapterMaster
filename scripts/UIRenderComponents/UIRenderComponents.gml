// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function UIRenderComponent(owner, name) : UIComponent(owner, name) constructor {
	callback = function() {}
	is_visible = true;
	static set_callback = function(cb) {
		if is_callable(cb)
			callback = cb;
		return self
	}
	
	static set_visible = function(val) {
		is_visible = val;
		return self
	}
}

function UITextRendererComponent(owner, name) : UIRenderComponent(owner, name) constructor {
	text = "";
	col1 = c_white
	col2 = c_white
	col3 = c_white
	col4 = c_white
	sep = 16;
	font = fnt_menu;
	xscale = 1;
	yscale = 1;
	angle = 0;
	valign = fa_top
	halign = fa_left
	xoffset = 0;
	yoffset = 0;
	alpha = 255;
	static render = function(x,y) {
		
		if !is_visible
			return;
		callback();
		if draw_get_font() != font {
			draw_set_font(font)	
		}
		var orig_valign = draw_get_valign()
		var orig_halign = draw_get_halign()
		if orig_halign != halign || orig_valign != valign {
			draw_set_valign(valign)
			draw_set_halign(halign)
		}
		draw_text_ext_transformed_color(x + xoffset,y + yoffset,text,sep,owner.width,xscale,yscale,angle ,col1, col2, col3, col4, alpha)
		if orig_halign != halign || orig_valign != valign {
			draw_set_valign(orig_valign)
			draw_set_halign(orig_halign)
		}
	}
	static set_text = function(text) {
		self.text = text;
		return self;
	}
	static set_color_solid = function(color) {
		col1 = color;
		col2 = color;
		col3 = color;
		col4 = color;
		return self;
	}
	static set_vertical_gradient = function(colort, colorb) {
		col1 = colort
		col2 = colort
		col3 = colorb
		col4 = colorb
		return self;
	}
	
	static set_horizontal_gradient = function(colorl, colorr) {
		col1 = colorl
		col2 = colorr
		col3 = colorr
		col4 = colorl
		return self;
	}
	static set_color_direct = function(c1, c2, c3, c4) {
		col1 = c1;
		col2 = c2;
		col3 = c3;
		col4 = c4;
		return self;
	}
	
	static set_string_seperation = function(val) {
		sep = val
		return self;
	}
	static set_xscale = function(val) {
		xscale = val
		return self;
	}
	static set_yscale = function(val) {
		yscale = val;
		return self
	}
	
	static set_font = function(val) {
		font = val
		return self
	}
	
	static set_valign = function(va) {
		valign = va
		if va == fa_top
			yoffset = 0;
		else if va == fa_middle
			yoffset = owner.height/2
		else
			yoffset = owner.height
		return self
	}
	
	static set_halign = function(ha) {
		halign = ha
		if ha == fa_left
			xoffset = 0
		else if ha == fa_center
			xoffset = owner.width/2
		else
			xoffset = owner.width
		return self	
	}
}

function UISpriteRendererComponent(owner, name) : UIRenderComponent(owner, name) constructor {
	sprite = -1;
	img_index = 0;
	img_speed = 1;
	left = 0;
	top = 0;
	width = owner.width;
	height = owner.height;
	rot = 0;
	col1 = c_white
	col2 = c_white
	col3 = c_white
	col4 = c_white
	alpha = 255
	
	static render = function(x,y) {
		if !is_visible
			return;
		var spr_width = sprite_get_width(sprite)
		var spr_height = sprite_get_height(sprite)
		var spr_frames = sprite_get_number(sprite)
		callback();
		draw_sprite_general(
			sprite,
			img_index,
			left,
			top,
			width,
			height,
			x,
			y,
			owner.width/spr_width,
			owner.height/spr_height,
			rot,
			col1,
			col2,
			col3,
			col4,
			alpha
		)
		img_index = (img_index + img_speed) % spr_frames;
	}
	
	static set_sprite = function(sprite) {
		self.sprite = sprite;
		return self;
	}
	

	static set_color_solid = function(color) {
		col1 = color;
		col2 = color;
		col3 = color;
		col4 = color;
		return self;
	}
	static set_vertical_gradient = function(colort, colorb) {
		col1 = colort
		col2 = colort
		col3 = colorb
		col4 = colorb
		return self;
	}
	
	static set_horizontal_gradient = function(colorl, colorr) {
		col1 = colorl
		col2 = colorr
		col3 = colorr
		col4 = colorl
		return self;
	}
	static set_color_direct = function(c1, c2, c3, c4) {
		col1 = c1;
		col2 = c2;
		col3 = c3;
		col4 = c4;
		return self;
	}
	
	static set_image_index = function(val) {
		img_index = val;
		return self;
	}
	
	static set_image_speed = function(val) {
		img_speed = val
		return self;	
	}
	
	static set_top = function(val) {
		top = val
		return self;
	}
	
	static set_left = function(val) {
		left = val;
		return self;
	}
}