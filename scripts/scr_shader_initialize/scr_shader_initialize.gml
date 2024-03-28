function scr_shader_initialize() {

	shader_reset();

	colour_to_find1 = shader_get_uniform(sReplaceColor, "f_Colour1");
	colour_to_set1 = shader_get_uniform(sReplaceColor, "f_Replace1");
	sourceR1 = 0/255;
	sourceG1 = 0/255;
	sourceB1 = 255/255;
	targetR1 = col_r[main_color]/255;
	targetG1 = col_g[main_color]/255;
	targetB1 = col_b[main_color]/255;

	colour_to_find8 = shader_get_uniform(sReplaceColor, "f_Colour8");
	colour_to_set8 = shader_get_uniform(sReplaceColor, "f_Replace8");

	colour_to_find2 = shader_get_uniform(sReplaceColor, "f_Colour2");
	colour_to_set2 = shader_get_uniform(sReplaceColor, "f_Replace2");
	sourceR2 = 255/255;
	sourceG2 = 0/255;
	sourceB2 = 0/255;
	targetR2 = col_r[secondary_color]/255;
	targetG2 = col_g[secondary_color]/255;
	targetB2 = col_b[secondary_color]/255;

	colour_to_find3 = shader_get_uniform(sReplaceColor, "f_Colour3");
	colour_to_set3 = shader_get_uniform(sReplaceColor, "f_Replace3");
	sourceR3 = 255/255;
	sourceG3 = 255/255;
	sourceB3 = 0/255;
	targetR3 = col_r[pauldron_color]/255;
	targetG3 = col_g[pauldron_color]/255;
	targetB3 = col_b[pauldron_color]/255;

	colour_to_find4 = shader_get_uniform(sReplaceColor, "f_Colour4");
	colour_to_set4 = shader_get_uniform(sReplaceColor, "f_Replace4");
	sourceR4 = 0/255;
	sourceG4 = 255/255;
	sourceB4 = 0/255;
	targetR4 = col_r[lens_color]/255;
	targetG4 = col_g[lens_color]/255;
	targetB4 = col_b[lens_color]/255;

	colour_to_find5 = shader_get_uniform(sReplaceColor, "f_Colour5");
	colour_to_set5 = shader_get_uniform(sReplaceColor, "f_Replace5");
	sourceR5 = 255/255;
	sourceG5 = 0/255;
	sourceB5 = 255/255;
	targetR5 = col_r[trim_color]/255;
	targetG5 = col_g[trim_color]/255;
	targetB5 = col_b[trim_color]/255;

	colour_to_find6 = shader_get_uniform(sReplaceColor, "f_Colour6");
	colour_to_set6 = shader_get_uniform(sReplaceColor, "f_Replace6");
	sourceR6 = 250/255;
	sourceG6 = 250/255;
	sourceB6 = 250/255;
	targetR6 = col_r[pauldron2_color]/255;
	targetG6 = col_g[pauldron2_color]/255;
	targetB6 = col_b[pauldron2_color]/255;

	colour_to_find7 = shader_get_uniform(sReplaceColor, "f_Colour7");
	colour_to_set7 = shader_get_uniform(sReplaceColor, "f_Replace7");
	sourceR7 = 0/255;
	sourceG7 = 255/255;
	sourceB7 = 255/255;
	targetR7 = col_r[weapon_color]/255;
	targetG7 = col_g[weapon_color]/255;
	targetB7 = col_b[weapon_color]/255;


}
