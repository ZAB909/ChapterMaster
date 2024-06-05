// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_fleet_advisor(){
	//TODO swap this xx yy stuff out for a surface
	var xx = __view_get(e__VW.XView, 0) + 0;
    var yy = __view_get(e__VW.YView, 0) + 0;
	draw_sprite(spr_rock_bg, 0, xx, yy);
    draw_set_alpha(0.75);
    draw_set_color(0);
    draw_rectangle(xx + 326 + 16, yy + 66, xx + 887 + 16, yy + 818, 0);
    draw_set_alpha(1);
    draw_set_color(c_gray);
    draw_rectangle(xx + 326 + 16, yy + 66, xx + 887 + 16, yy + 818, 1);
    draw_line(xx + 326 + 16, yy + 426, xx + 887 + 16, yy + 426);
    draw_set_alpha(0.75);
    draw_set_color(0);
    draw_rectangle(xx + 945, yy + 66, xx + 1580, yy + 818, 0);
    draw_set_alpha(1);
    draw_set_color(c_gray);
    draw_rectangle(xx + 945, yy + 66, xx + 1580, yy + 818, 1);

    if (menu_adept = 0) {
        scr_image("advisor", 6, xx + 16, yy + 43, 310, 828);
        // draw_sprite(spr_advisors,6,xx+16,yy+43);
        draw_set_halign(fa_left);
        draw_set_color(c_gray);
        draw_set_font(fnt_40k_30b);
        draw_text_transformed(xx + 336 + 16, yy + 66, "Flagship Bridge", 1, 1, 0);
        draw_text_transformed(xx + 336 + 16, yy + 100, $"Master of the Fleet {obj_ini.lord_admiral_name}", 0.6, 0.6, 0);
        draw_set_font(fnt_40k_14);
        blurp = "Greetings, Chapter Master.\n\nYou requested a report?  Our fleet contains ";
    }
    if (menu_adept = 1) {
        scr_image("advisor", 0, xx + 16, yy + 43, 310, 828);
        // draw_sprite(spr_advisors,0,xx+16,yy+43);
        draw_set_halign(fa_left);
        draw_set_color(c_gray);
        draw_set_font(fnt_40k_30b);
        draw_text_transformed(xx + 336 + 16, yy + 40, "Flagship Bridge", 1, 1, 0);
        draw_text_transformed(xx + 336 + 16, yy + 100, $"Adept {obj_controller.adept_name}" , 0.6, 0.6, 0);
        draw_set_font(fnt_40k_14);
        blurp = "Your fleet contains ";
    }

    blurp += string(temp[37]) + " Capital Ships, ";
    blurp += string(temp[38]) + " Frigates, and ";
    blurp += string(temp[39]) + " Escorts";

    va = real(temp[41]);

    if (va >= 1) then blurp += ", none of which are damaged.";
    if (va < 1) then blurp += $".  Our most damaged vessel is the {temp[40]} - it has {min(99, round(va * 100))}% Hull Integrity.";

    va = real(temp[42]);
    if (va = 2) then blurp += "  Two of our ships are highly damaged.  You may wish to purchase a Repair License from the Sector Governerner.";
    if (va > 2) then blurp += "  Several of our ships are highly damaged.  It is advisable that you purchase a Repair License from the Sector Governer.";
    blurp += "##Here are the current positions of our ships and their contents:";

    if (menu_adept = 1) {
        blurp = string_replace(blurp, "Our", "Your");
        blurp = string_replace(blurp, " our", " your");
        blurp = string_replace(blurp, "We", "You");
    }

    draw_text_ext(xx + 336 + 16, yy + 130, blurp, -1, 536);

    draw_set_font(fnt_40k_30b);
    draw_set_halign(fa_center);
    draw_text_transformed(xx + 1262, yy + 70, "Fleet", 0.6, 0.6, 0);

    draw_set_font(fnt_40k_14);
    draw_set_halign(fa_left);

    var cn = obj_controller;

    if (instance_exists(cn)) {
        for (var i = ship_current; i < ship_current + 34; i++) {
            if (obj_ini.ship[i] != "") {
                draw_rectangle(xx + 950, yy + 80 + (i * 20), xx + 1546, yy + 100 + (i * 20), 1);
                draw_sprite(spr_view_small, 0, xx + 953, yy + 84 + (i * 20));
                draw_text(xx + 970, yy + 80 + (i * 20), $"{obj_ini.ship[i]}  ( {obj_ini.ship_class[i]} )");
                draw_text(xx + 1222, yy + 80 + (i * 20), obj_ini.ship_location[i]);
                draw_text(xx + 1372, yy + 80 + (i * 20), $"{round((obj_ini.ship_hp[i] / obj_ini.ship_maxhp[i]) * 100)}% HP");
                draw_text(xx + 1450, yy + 80 + (i * 20),$"{obj_ini.ship_carrying[i]} / {obj_ini.ship_capacity[i]} Space");

                if scr_hit(xx + 950,yy + 80 + (i * 20),xx + 1546,yy + 100 + (i * 20)) {
                    if (cn.temp[101] != obj_ini.ship[i]) {
                        cn.temp[101] = obj_ini.ship[i];
                        cn.temp[102] = obj_ini.ship_class[i];

                        cn.temp[103] = string(obj_ini.ship_hp[i]);
                        cn.temp[104] = string(obj_ini.ship_maxhp[i]);
                        cn.temp[105] = string(obj_ini.ship_shields[i] * 100);

                        cn.temp[106] = string(obj_ini.ship_speed[i]);

                        cn.temp[107] = string(obj_ini.ship_front_armour[i]);
                        cn.temp[108] = string(obj_ini.ship_other_armour[i]);

                        cn.temp[109] = string(obj_ini.ship_turrets[i]);

                        cn.temp[110] = obj_ini.ship_wep[i][1];
                        cn.temp[111] = obj_ini.ship_wep_facing[i][1];
                        cn.temp[112] = obj_ini.ship_wep[i][2];
                        cn.temp[113] = obj_ini.ship_wep_facing[i][2];
                        cn.temp[114] = obj_ini.ship_wep[i][3];
                        cn.temp[115] = obj_ini.ship_wep_facing[i][3];
                        cn.temp[116] = obj_ini.ship_wep[i][4];
                        cn.temp[117] = obj_ini.ship_wep_facing[i][4];

                        cn.temp[118] = $"{obj_ini.ship_carrying[i]}/{obj_ini.ship_capacity[i]}";
                        cn.temp[119] = "";
                        if (obj_ini.ship_carrying[i] > 0) then cn.temp[119] = scr_ship_occupants(i);
                    }
                }
            }
        }

        if (cn.temp[101] != "") {
            draw_set_font(fnt_40k_30b);
            draw_set_halign(fa_center);
            draw_text_transformed(xx + 622, yy + 434, cn.temp[101], 0.75, 0.75, 0);
            draw_text_transformed(xx + 622, yy + 460, cn.temp[102], 0.5, 0.5, 0);

            draw_set_color(c_white);
            draw_rectangle(xx + 498, yy + 492, xx + 746, yy + 623, 0);
            var ships = ["Battle Barge", "Strike Cruiser","Gladius","Hunter"];
            var ship_im = 0;
            for (var i=0;i<array_length(ships);i++){
            	if (cn.temp[102]==ships[i]){
            		ship_im=i;
            		break;
            	}
            }
            draw_sprite(spr_ship_back_black, ship_im, xx + 390, yy + 390);
            draw_set_color(c_gray);

            draw_set_font(fnt_40k_14);
            draw_set_halign(fa_left);

            yy -= 34;

            draw_text(xx + 383, yy + 665, $"Health: {cn.temp[103]}/{cn.temp[104]}");
            draw_text(xx + 588, yy + 665, $"Shields: {cn.temp[105]}" );
            draw_text(xx + 768, yy + 665, $"Armour: {cn.temp[107]},{cn.temp[108]}");

            draw_text(xx + 485, yy + 683, $"Speed: {cn.temp[106]}");
            draw_text(xx + 678, yy + 683, $"Turrets: {cn.temp[109]}");

            if (cn.temp[110] != "") {
                draw_text(xx + 383, yy + 701, $"-{cn.temp[110]} ({cn.temp[111]})");
            }
            if (cn.temp[112] != "") {
                draw_text(xx + 383, yy + 719, "-" + cn.temp[112] + " (" + string(cn.temp[113]) + ")");
            }
            if (cn.temp[114] != "") {
                draw_text(xx + 383, yy + 737, "-" + cn.temp[114] + " (" + string(cn.temp[115]) + ")");
            }
            if (cn.temp[116] != "") {
                draw_text(xx + 383, yy + 755, "-" + cn.temp[116] + " (" + string(cn.temp[117]) + ")");
            }

            draw_set_font(fnt_40k_12);
            draw_text_ext(xx + 352, yy + 775, $"Carrying ({cn.temp[118]}): {cn.temp[119]}", -1, 542);
            draw_set_font(fnt_40k_14);

            yy += 34;
        }
    }
    // 31 wide
    scr_scrollbar(1547, 100, 1577, 780, 34, ship_max, ship_current);
}