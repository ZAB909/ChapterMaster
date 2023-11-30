function scr_draw_rainbow(argument0, argument1, argument2, argument3, argument4) {

	// argument0: x1
	// argument1: y1
	// argument2: x2
	// argument3: y2
	// argument4: ratio

	// Draws a variable length and color rectangle based on a ratio of two variables

	var wid,rat;wid=argument2-argument0;rat=argument4;

	if (menu!=20) or (diplomacy!=0){
	    if (argument4<=0.15) then draw_set_color(c_red);
	    if (argument4>=0.15) and (argument4<=0.4) then draw_set_color(c_orange);
	    if (argument4>=0.4) and (argument4<=0.7) then draw_set_color(c_yellow);
	    if (argument4>=0.7) then draw_set_color(c_green);
	}
	if (menu=20) and (diplomacy=0){
	    if (argument4<=0.5) then draw_set_color(c_red);
	    if (argument4>=0.5) and (argument4<=0.65) then draw_set_color(c_orange);
	    if (argument4>=0.65) and (argument4<=0.85) then draw_set_color(c_yellow);
	    if (argument4>=0.85) then draw_set_color(c_green);
	}
	if (rat>1) then rat=1;if (rat<-1) then rat=-1;
	draw_rectangle(argument0,argument1,argument0+(wid*rat),argument3,0);
	draw_set_color(c_gray);
	draw_rectangle(argument0,argument1,argument2,argument3,1);


}
