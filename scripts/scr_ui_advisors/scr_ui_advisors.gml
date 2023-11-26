function scr_ui_advisors() {

    var xx, yy, blurp, eta, va;
    var romanNumerals;
    romanNumerals = scr_roman_numerals();
    var recruitment_rates = [
        "sluggish",
        "slow",
        "moderate",
        "fast",
        "frenetic",
        "hereticly fast"
    ];

    var recruitment_pace = [
        " is currently halted.",
        " is advancing sluggishly.",
        " is advancing slowly.",
        " is advancing moderately fast.",
        " is advancing fast.",
        " is advancing frenetically.",
        " is advancing as fast as possible."
    ];

    var recruitement_rate = [
        "HALTED",
        "SLUGGISH",
        "SLOW",
        "MODERATE",
        "FAST",
        "FRENETIC",
        "MAXIMUM",
    ];


    xx = __view_get(e__VW.XView, 0) + 0;
    yy = __view_get(e__VW.YView, 0) + 0;
    blurp = "";
    eta = 0;

    // This script draws all of the ADVISOR screens

    // ** Fleet **
    if (menu = 16) {
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
            draw_text_transformed(xx + 336 + 16, yy + 66, string_hash_to_newline("Flagship Bridge"), 1, 1, 0);
            draw_text_transformed(xx + 336 + 16, yy + 100, string_hash_to_newline("Master of the Fleet " + string(obj_ini.lord_admiral_name)), 0.6, 0.6, 0);
            draw_set_font(fnt_40k_14);
            blurp = "Greetings, Chapter Master.##You requested a report?  Our fleet contains ";
        }
        if (menu_adept = 1) {
            scr_image("advisor", 0, xx + 16, yy + 43, 310, 828);
            // draw_sprite(spr_advisors,0,xx+16,yy+43);
            draw_set_halign(fa_left);
            draw_set_color(c_gray);
            draw_set_font(fnt_40k_30b);
            draw_text_transformed(xx + 336 + 16, yy + 40, string_hash_to_newline("Flagship Bridge"), 1, 1, 0);
            draw_text_transformed(xx + 336 + 16, yy + 100, string_hash_to_newline("Adept " + string(obj_controller.adept_name)), 0.6, 0.6, 0);
            draw_set_font(fnt_40k_14);
            blurp = "Your fleet contains ";
        }

        blurp += string(temp[37]) + " Capital Ships, ";
        blurp += string(temp[38]) + " Frigates, and ";
        blurp += string(temp[39]) + " Escorts";

        va = real(temp[41]);

        if (va >= 1) then blurp += ", none of which are damaged.";
        if (va < 1) then blurp += ".  Our most damaged vessel is the " + string(temp[40]) + "- it has " + string(min(99, round(va * 100))) + "% Hull Integrity.";

        va = real(temp[42]);
        if (va = 2) then blurp += "  Two of our ships are highly damaged.  You may wish to purchase a Repair License from the Sector Governerner.";
        if (va > 2) then blurp += "  Several of our ships are highly damaged.  It is advisable that you purchase a Repair License from the Sector Governer.";
        blurp += "##Here are the current positions of our ships and their contents:";

        if (menu_adept = 1) {
            blurp = string_replace(blurp, "Our", "Your");
            blurp = string_replace(blurp, " our", " your");
            blurp = string_replace(blurp, "We", "You");
        }

        draw_text_ext(xx + 336 + 16, yy + 130, string_hash_to_newline(string(blurp)), -1, 536);

        draw_set_font(fnt_40k_30b);
        draw_set_halign(fa_center);
        draw_text_transformed(xx + 1262, yy + 70, string_hash_to_newline("Fleet"), 0.6, 0.6, 0);

        draw_set_font(fnt_40k_14);
        draw_set_halign(fa_left);

        var cn = obj_controller;

        if (instance_exists(cn)) {
            for (var i = ship_current; i < ship_current + 34; i++) {
                if (obj_ini.ship[i] != "") {
                    draw_rectangle(xx + 950, yy + 80 + (i * 20), xx + 1546, yy + 100 + (i * 20), 1);
                    draw_sprite(spr_view_small, 0, xx + 953, yy + 84 + (i * 20));
                    draw_text(xx + 970, yy + 80 + (i * 20), string_hash_to_newline(string(obj_ini.ship[i]) + " (" + string(obj_ini.ship_class[i]) + ")"));
                    draw_text(xx + 1222, yy + 80 + (i * 20), string_hash_to_newline(string(obj_ini.ship_location[i])));
                    draw_text(xx + 1372, yy + 80 + (i * 20), string_hash_to_newline(string(round((obj_ini.ship_hp[i] / obj_ini.ship_maxhp[i]) * 100)) + "% HP"));
                    draw_text(xx + 1450, yy + 80 + (i * 20), string_hash_to_newline(string(obj_ini.ship_carrying[i]) + "/" + string(obj_ini.ship_capacity[i]) + " Space"));

                    if (mouse_x >= xx + 950) and(mouse_y >= yy + 80 + (i * 20)) and(mouse_x < xx + 1546) and(mouse_y < yy + 100 + (i * 20)) {
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

                            cn.temp[110] = obj_ini.ship_wep[i, 1];
                            cn.temp[111] = obj_ini.ship_wep_facing[i, 1];
                            cn.temp[112] = obj_ini.ship_wep[i, 2];
                            cn.temp[113] = obj_ini.ship_wep_facing[i, 2];
                            cn.temp[114] = obj_ini.ship_wep[i, 3];
                            cn.temp[115] = obj_ini.ship_wep_facing[i, 3];
                            cn.temp[116] = obj_ini.ship_wep[i, 4];
                            cn.temp[117] = obj_ini.ship_wep_facing[i, 4];

                            cn.temp[118] = string(obj_ini.ship_carrying[i]) + "/" + string(obj_ini.ship_capacity[i]);
                            cn.temp[119] = "";
                            if (obj_ini.ship_carrying[i] > 0) then cn.temp[119] = scr_ship_occupants(i);
                        }
                    }
                }
            }

            if (cn.temp[101] != "") {
                draw_set_font(fnt_40k_30b);
                draw_set_halign(fa_center);
                draw_text_transformed(xx + 622, yy + 434, string_hash_to_newline(string(cn.temp[101])), 0.75, 0.75, 0);
                draw_text_transformed(xx + 622, yy + 460, string_hash_to_newline(string(cn.temp[102])), 0.5, 0.5, 0);

                draw_set_color(c_white);
                draw_rectangle(xx + 498, yy + 492, xx + 746, yy + 623, 0);
                draw_set_color(c_gray);

                draw_set_font(fnt_40k_14);
                draw_set_halign(fa_left);

                yy -= 34;

                draw_text(xx + 383, yy + 665, string_hash_to_newline("Health: " + string(cn.temp[103]) + "/" + string(cn.temp[104])));
                draw_text(xx + 588, yy + 665, string_hash_to_newline("Shields: " + string(cn.temp[105])));
                draw_text(xx + 768, yy + 665, string_hash_to_newline("Armour: " + string(cn.temp[107]) + "," + string(cn.temp[108])));

                draw_text(xx + 485, yy + 683, string_hash_to_newline("Speed: " + string(cn.temp[106])));
                draw_text(xx + 678, yy + 683, string_hash_to_newline("Turrets: " + string(cn.temp[109])));

                if (cn.temp[110] != "") {
                    draw_text(xx + 383, yy + 701, string_hash_to_newline("-" + string(cn.temp[110]) + " (" + string(cn.temp[111]) + ")"));
                }
                if (cn.temp[112] != "") {
                    draw_text(xx + 383, yy + 719, string_hash_to_newline("-" + string(cn.temp[112]) + " (" + string(cn.temp[113]) + ")"));
                }
                if (cn.temp[114] != "") {
                    draw_text(xx + 383, yy + 737, string_hash_to_newline("-" + string(cn.temp[114]) + " (" + string(cn.temp[115]) + ")"));
                }
                if (cn.temp[116] != "") {
                    draw_text(xx + 383, yy + 755, string_hash_to_newline("-" + string(cn.temp[116]) + " (" + string(cn.temp[117]) + ")"));
                }

                draw_set_font(fnt_40k_12);
                draw_text_ext(xx + 352, yy + 775, string_hash_to_newline("Carrying (" + string(cn.temp[118]) + "): " + string(cn.temp[119])), -1, 542);
                draw_set_font(fnt_40k_14);

                yy += 34;
            }
        }
        // 31 wide
        scr_scrollbar(1547, 100, 1577, 780, 34, ship_max, ship_current);
    }


    // ** Apothecarium **
    if (menu = 11) {
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
            scr_image("advisor", 1, xx + 16, yy + 43, 310, 828);
            // draw_sprite(spr_advisors,1,xx+16,yy+43);
            if (global.chapter_name = "Space Wolves") then scr_image("advisor", 11, xx + 16, yy + 43, 310, 828);
            // draw_sprite(spr_advisors,11,xx+16,yy+43);
            draw_set_halign(fa_left);
            draw_set_color(c_gray);
            draw_set_font(fnt_40k_30b);
            draw_text_transformed(xx + 336 + 16, yy + 66, string_hash_to_newline("Apothecarium"), 1, 1, 0);
            draw_text_transformed(xx + 336 + 16, yy + 100, string_hash_to_newline("Master of the Apothecarion " + string(obj_ini.name[0, 4])), 0.6, 0.6, 0);
            draw_set_font(fnt_40k_14);
        }
        if (menu_adept = 1) {
            // draw_sprite(spr_advisors,0,xx+16,yy+43);
            scr_image("advisor", 0, xx + 16, yy + 43, 310, 828);
            draw_set_halign(fa_left);
            draw_set_color(c_gray);
            draw_set_font(fnt_40k_30b);
            draw_text_transformed(xx + 336 + 16, yy + 40, string_hash_to_newline("Apothecarium"), 1, 1, 0);
            draw_text_transformed(xx + 336 + 16, yy + 100, string_hash_to_newline("Adept " + string(obj_controller.adept_name)), 0.6, 0.6, 0);
            draw_set_font(fnt_40k_14);
        }

        blurp = "Milord, I come with a report.  Our Chapter currently boasts " + string(temp[36]) + " " + string(obj_ini.role[100, 15]) + " working on a variety of things, from field-duty to research to administrative duties.  ";

        if (training_apothecary = 0) then blurp += "Our Brothers are currently not assigned to train further " + string(obj_ini.role[100, 15]) + "; no more can be trained until Apothcarium funds are increased.";
        //
        if (training_apothecary > 0) then blurp += "Our Brothers assigned to the training of future " + string(obj_ini.role[100, 15]) + "s have taken up a ";
        if (training_apothecary >= 1 && training_apothecary <= 6) then blurp += recruitment_rates[training_apothecary - 1];
        if (training_apothecary > 0) then blurp += " pace and expect to graduate an additional " + string(obj_ini.role[100, 15]) + " in ";
        // 
        if (training_apothecary = 1) then eta = floor((47 - apothecary_points) / 0.8) + 1;
        if (training_apothecary = 2) then eta = floor((47 - apothecary_points) / 0.9) + 1;
        if (training_apothecary = 3) then eta = floor((47 - apothecary_points) / 1) + 1;
        if (training_apothecary = 4) then eta = floor((47 - apothecary_points) / 1.5) + 1;
        if (training_apothecary = 5) then eta = floor((47 - apothecary_points) / 2) + 1;
        if (training_apothecary = 6) then eta = floor((47 - apothecary_points) / 4) + 1;
        // 
        if (training_apothecary > 0) then blurp += string(eta) + " months.";

        if (gene_seed <= 0) then blurp += "##My lord, our stocks of gene-seed are empty.  It would be best to have some come mechanicus tithe.##Further training of Neophytes is halted until our stocks replenish.";
        if (gene_seed > 0) and(gene_seed <= 10) then blurp += "##My Brother " + string(obj_ini.role[100, 15]) + "s assigned to the gene-vault have informed me that our stocks are nearly gone.  They only number " + string(gene_seed) + "; this includes those recently recovered from our fallen comerades-in-arms.";
        if (gene_seed > 10) then blurp += "##My Brother " + string(obj_ini.role[100, 15]) + "s assigned to the gene-vault have informed me that our stocks of gene-seed currently number " + string(gene_seed) + ".  This includes those recently recovered from our fallen comerades-in-arms.";
        if (gene_seed > 0) then blurp += "##The stocks are stable and show no sign of mutation.";

        if (menu_adept = 1) {
            blurp = "Your Chapter contains " + string(temp[36]) + " " + string(obj_ini.role[100, 15]) + ".##";
            blurp += "Training of further " + string(obj_ini.role[100, 15]) + "s";
            if (training_apothecary >= 0 && training_apothecary <= 6) then blurp += recruitment_pace[training_apothecary];
            if (training_apothecary > 0) then blurp += "  The next " + string(obj_ini.role[100, 15]) + " is expected in " + string(eta) + " months.";
            blurp += "##You have " + string(gene_seed) + " gene-seed stocked.";
        }

        draw_text_ext(xx + 336 + 16, yy + 130, string_hash_to_newline(string(blurp)), -1, 536);

        var blurp2 = "";

        if (obj_ini.zygote = 0) {
            if (obj_controller.marines + obj_controller.gene_seed <= 300) and(obj_ini.slave_batch_num[1] = 0) {
                blurp2 = "Our Chapter is disasterously low in number- it is strongly advised that we make use of test-slaves to breed new gene-seed.  Give me the word andwe can begin installing gestation pods.";
            }
            if (obj_controller.marines + obj_controller.gene_seed > 300) and(obj_ini.slave_batch_num[1] = 0) {
                blurp2 = "Our Chapter is capable of using test-slaves to breed new gene-seed.  Should our number of astartes ever plummet this may prove a valuable method of rapidly bringing our chapter back up to size.";
            }
            if (obj_ini.slave_batch_num[1] > 0) {
                blurp2 = "Our Test-Slave Incubators are working optimally.  As soon as a batch fully matures a second progenoid gland they will be harvested and prepared for use.";
            }
        }
        if (obj_ini.zygote = 1) then blurp2 = "Unfortunantly we cannot make use of Test-Slave Incubators.  Due to our missing Zygote any use of gestation pods is ultimately useless- no new gene-seed may be grown, no matter how long we wait.";

        draw_set_halign(fa_center);
        draw_set_color(c_gray);
        draw_set_font(fnt_40k_30b);
        draw_text_transformed(xx + 622, yy + 440, string_hash_to_newline("Test-Slave Incubators"), 0.6, 0.6, 0);
        draw_set_halign(fa_left);
        draw_set_color(c_gray);
        draw_set_font(fnt_40k_14);
        draw_text_ext(xx + 336 + 16, yy + 477, string_hash_to_newline(string(blurp2)), -1, 536);

        var currently_rendered_slave_index = 0;
        for (var i = 1; i <= 120; i++) { // TODO why go through all batches if we can only display 10?
            if (obj_ini.slave_batch_num[i] > 0 && currently_rendered_slave_index < 10) {
                currently_rendered_slave_index++;
                draw_text(xx + 336 + 16, yy + 513 + (currently_rendered_slave_index * 20), string_hash_to_newline("Batch " + string(currently_rendered_slave_index)));
                draw_text(xx + 336 + 16.5, yy + 513.5 + (currently_rendered_slave_index * 20), string_hash_to_newline("Batch " + string(currently_rendered_slave_index)));
                draw_text(xx + 536, yy + 513 + (currently_rendered_slave_index * 20), string_hash_to_newline("Eta: " + string(obj_ini.slave_batch_eta[currently_rendered_slave_index]) + " months"));
                draw_text(xx + 756, yy + 513 + (currently_rendered_slave_index * 20), string_hash_to_newline(string(obj_ini.slave_batch_num[currently_rendered_slave_index]) + " pods"));
            }
        }
        draw_set_alpha(1);
        if (obj_controller.gene_seed <= 0) or(obj_ini.zygote = 1) then draw_set_alpha(0.5);
        draw_set_color(c_gray);
        draw_rectangle(xx + 407, yy + 788, xx + 529, yy + 811, 0);
        draw_set_color(c_black);
        draw_text(xx + 411, yy + 793, string_hash_to_newline("Add Test-Slave"));
        if (obj_controller.gene_seed > 0) and(mouse_x >= xx + 407) and(mouse_y >= yy + 788) and(mouse_x < xx + 529) and(mouse_y < yy + 811) {
            draw_set_alpha(0.2);
            draw_set_color(c_gray);
            draw_rectangle(xx + 407, yy + 788, xx + 529, yy + 811, 0);
        }
        draw_set_alpha(1);
        if (obj_ini.slave_batch_num[1] <= 0) then draw_set_alpha(0.5);
        draw_set_color(c_gray);
        draw_rectangle(xx + 659, yy + 788, xx + 838, yy + 811, 0);
        draw_set_color(c_black);
        draw_text(xx + 664, yy + 793, string_hash_to_newline("Destroy All Incubators"));
        if (obj_ini.slave_batch_num[1] > 0) and(mouse_x >= xx + 659) and(mouse_y >= yy + 788) and(mouse_x < xx + 838) and(mouse_y < yy + 811) {
            draw_set_alpha(0.2);
            draw_set_color(c_gray);
            draw_rectangle(xx + 659, yy + 788, xx + 838, yy + 811, 0);
        }
        draw_set_alpha(1);
    }

    // ** Reclusium **
    if ((menu = 12) or(menu = 12.1)) {
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
            // draw_sprite(spr_advisors,2,xx+16,yy+43);
            scr_image("advisor", 2, xx + 16, yy + 43, 310, 828);
            if (global.chapter_name = "Space Wolves") then scr_image("advisor", 11, xx + 16, yy + 43, 310, 828);
            // draw_sprite(spr_advisors,11,xx+16,yy+16);
            draw_set_halign(fa_left);
            draw_set_color(c_gray);
            draw_set_font(fnt_40k_30b);
            draw_text_transformed(xx + 336 + 16, yy + 66, string_hash_to_newline("Reclusium"), 1, 1, 0);
            draw_text_transformed(xx + 336 + 16, yy + 100, string_hash_to_newline("Master of Sanctity " + string(obj_ini.name[0, 3])), 0.6, 0.6, 0);
        }
        if (menu_adept = 1) {
            // draw_sprite(spr_advisors,0,xx+16,yy+43);
            scr_image("advisor", 0, xx + 16, yy + 43, 310, 828);
            draw_set_halign(fa_left);
            draw_set_color(c_gray);
            draw_set_font(fnt_40k_30b);
            draw_text_transformed(xx + 336 + 16, yy + 66, string_hash_to_newline("Reclusium"), 1, 1, 0);
            draw_text_transformed(xx + 336 + 16, yy + 100, string_hash_to_newline("Adept " + string(obj_controller.adept_name)), 0.6, 0.6, 0);
        }

        draw_set_font(fnt_40k_14);
        draw_set_alpha(1);
        draw_set_color(c_gray);
        if (temp[36] != "0") then blurp = "Sir!  You requested a report?  Currently, we have deployed " + string(temp[36]) + " " + string(obj_ini.role[100, 14]) + "s to watch over the health of our Battle-Brothers in the field.  We have an additional " + string(temp[37]) + " " + string(obj_ini.role[100, 14]) + "s who await only your order to carry the word to the troops.";
        if (temp[36] = "0") then blurp = "Sir!  You requested a report?  Currently, we have " + string(temp[37]) + " " + string(obj_ini.role[100, 14]) + "s who await only your order to carry the word to the troops.";
        // 
        if (global.chapter_name != "Space Wolves") and(global.chapter_name != "Iron Hands") {
            blurp += "##Currently, we are training additional " + string(obj_ini.role[100, 14]) + " at a ";
            if (training_chaplain = 1) {
                blurp += recruitment_rates[training_chaplain - 1];
                eta = floor((47 - chaplain_points) / 0.8) + 1;
            }
            if (training_chaplain = 2) {
                blurp += recruitment_rates[training_chaplain - 1];
                eta = floor((47 - chaplain_points) / 0.9) + 1;
            }
            if (training_chaplain = 3) {
                blurp += recruitment_rates[training_chaplain - 1];
                eta = floor((47 - chaplain_points) / 1) + 1;
            }
            if (training_chaplain = 4) {
                blurp += recruitment_rates[training_chaplain - 1];
                eta = floor((47 - chaplain_points) / 1.5) + 1;
            }
            if (training_chaplain = 5) {
                blurp += recruitment_rates[training_chaplain - 1];
                eta = floor((47 - chaplain_points) / 2) + 1;
            }
            if (training_chaplain = 6) {
                blurp += recruitment_rates[training_chaplain - 1];
                eta = floor((47 - chaplain_points) / 4) + 1;
            }
            // 
            blurp += " rate";
            if (training_chaplain > 0) then blurp += " and expect to see a new one in " + string(eta) + " month's time.";
            if (training_chaplain < 5) then blurp += "We can increase this rate, but it will require us to requisition additional facilities, as well as upkeep, Sir.";
            if (penitorium = 0) then blurp += "##Our men have been behaving as they should.  Not a single one is scheduled for corrective action of any type.";

            draw_set_font(fnt_40k_30b);
            draw_set_halign(fa_center);
            if (menu = 12) then draw_text_transformed(xx + 1262, yy + 70, string_hash_to_newline("Penitorium"), 0.6, 0.6, 0);
            if (menu = 12.1) then draw_text_transformed(xx + 1262, yy + 70, string_hash_to_newline("Scheduling Event"), 0.6, 0.6, 0);

            if (penitorium > 0) and(menu != 12.1) {
                draw_set_font(fnt_40k_14);
                draw_set_halign(fa_left);

                var behav = 0,
                    r_eta = 0;

                for (var qp = 1; qp <= min(36, penitorium); qp++) {
                    if (obj_ini.chaos[penit_co[qp], penit_id[qp]] > 0) then r_eta = round((obj_ini.chaos[penit_co[qp], penit_id[qp]] * obj_ini.chaos[penit_co[qp], penit_id[qp]]) / 50);
                    if (obj_ini.chaos[penit_co[qp], penit_id[qp]] >= 90) then r_eta = "Never";
                    if (obj_ini.chaos[penit_co[qp], penit_id[qp]] <= 0) then r_eta = "0";
                    draw_rectangle(xx + 947, yy + 100 + ((qp - 1) * 20), xx + 1577, yy + 100 + (qp * 20), 1);
                    draw_text(xx + 950, yy + 100 + ((qp - 1) * 20), string_hash_to_newline(string(obj_ini.role[penit_co[qp], penit_id[qp]]) + " " + string(obj_ini.name[penit_co[qp], penit_id[qp]])));
                    draw_text(xx + 1200, yy + 100 + ((qp - 1) * 20), string_hash_to_newline("ETA: " + string(r_eta)));
                    draw_text(xx + 1432, yy + 100 + ((qp - 1) * 20), string_hash_to_newline("[Execute]  [Release]"));
                }
            }
            draw_set_font(fnt_40k_14);
        }

        draw_set_font(fnt_40k_14);
        draw_set_alpha(1);
        draw_set_color(c_gray);

        if (menu_adept = 1) {
            blurp = "Your Chapter contains " + string(temp[36]) + " " + string(obj_ini.role[100, 14]) + "s.##";
            if (global.chapter_name != "Space Wolves") and(global.chapter_name != "Iron Hands") {
                blurp += "Training of further " + string(obj_ini.role[100, 14]) + "s";
                if (training_chaplain >= 0 && training_chaplain <= 6) then blurp += recruitment_pace[training_chaplain];
                if (training_chaplain > 0) then blurp += "  The next " + string(obj_ini.role[100, 14]) + " is expected in " + string(eta) + " months.";
            }
        }

        draw_set_halign(fa_left);
        draw_text_ext(xx + 336 + 16, yy + 130, string_hash_to_newline(string(blurp)), -1, 536);

        draw_set_halign(fa_center);
        draw_set_color(c_gray);
        draw_set_font(fnt_40k_30b);
        draw_text_transformed(xx + 622, yy + 440, string_hash_to_newline("Chapter Revelry"), 0.6, 0.6, 0);
        draw_set_halign(fa_left);
        draw_set_color(c_gray);
        draw_set_font(fnt_40k_14);

        var blurp2 = "";
        // TODO rename fest_type and fest_scheduled into feast_type and feast_schedule and refactor scripts
        if (menu_adept = 0) {
            if (fest_scheduled = 0) {
                if (global.chapter_name != "Space Wolves") and(global.chapter_name != "Iron Hands") then blurp2 = "As our bolters are charged with death for the Emperor's enemies, our thoughts are charged with his wisdom.  As our bodies are armoured with Adamantium, our souls are protected with our loyalty- loyalty to Him, and loyalty to our brothers.  The bonds of this brotherhood are worth revering, even if a lull in duty invites doubt and heresy.  Should you wish to schedule a rousing event, or challenge, I will make it so.  Under the careful watch of our " + string(obj_ini.role[100, 14]) + "s, our brothers' spirits may be lifted.";
                if (global.chapter_name = "Space Wolves") then blurp2 = "";
                if (global.chapter_name = "Iron Hands") then blurp2 = "";
            }
            if (fest_scheduled = 1) {
                if (fest_type != "Chapter Relic") then blurp2 = "A " + string(fest_type) + " has been scheduled on ";
                if (fest_type = "Chapter Relic") then blurp2 = "Chapter Relic construction has been scheduled on ";

                if (fest_planet = 0) then blurp2 += string(obj_ini.ship[fest_sid]);
                if (fest_planet > 0) then blurp2 += string(fest_star) + " " + scr_roman(fest_wid);

                if (fest_honoring = 0) then blurp2 += ".  ";
                if (fest_honoring = 1) then blurp2 += " in your name.  ";
                // Specific company
                if (fest_honoring = 2) {
                    blurp2 += " in honor of the ";
                }
                if (fest_honoring = 3) {
                    blurp2 += " in honor of ";
                    blurp2 += string(obj_ini.role[fest_honor_co, fest_honor_id]) + " ";
                    blurp2 += string(obj_ini.name[fest_honor_co, fest_honor_id]) + " (" + romanNumerals[fest_honor_co] + " Company).  ";
                }
                if (fest_honoring = 4) { // faction
                    blurp2 += ", honoring ";
                }
                if (fest_honoring = 5) then blurp2 += ", giving praise to The Emperor.  ";
                if (fest_honoring = 6) then blurp2 += " to honor our chapter.  ";

                if (fest_lav <= 1) then blurp2 += "Very little requisiton has been set aside for the event";
                if (fest_lav = 2) then blurp2 += "A minor amount of requisition has been dedicated for the event";
                if (fest_lav = 3) then blurp2 += "Moderate expenses are being made for the event";
                if (fest_lav = 4) then blurp2 += "A great amount of requisiton is set aside for the event";
                if (fest_lav = 5) then blurp2 += "The event is set to be lavish and excessive, with maximum requisition spent";

                if (fest_repeats <= 1) then blurp2 += ".  It is set to run for " + string(fest_repeats) + " month.";
                if (fest_repeats > 1) then blurp2 += ".  It is set to run for " + string(fest_repeats) + " months.";

                if (fest_type = "Great Feast") {
                    if (fest_feature1 = 1) and(fest_feature2 + fest_feature3 = 0) then blurp2 += "  The feast will be made up entirely of a banquet.";
                    if (fest_feature1 = 1) and(fest_feature2 + fest_feature3 > 0) {
                        blurp2 += "  The feast will primarily be made up of a banquet, although ";
                        if (fest_feature2 + fest_feature3 = 2) then blurp2 += "drugs and alcohol will be present for those who wish to partake.";
                        if (fest_feature2 = 1) and(fest_feature3 = 0) then blurp2 += "alcohol will also be present.";
                        if (fest_feature2 = 0) and(fest_feature3 = 1) then blurp2 += "drugs will also be present.";
                    }
                    if (fest_feature1 = 0) {
                        if (fest_feature2 = 1) and(fest_feature3 = 0) then blurp2 = "  The feast will only be such in name, and actually primarily be composed of alcohol consumption and roudy behavior.";
                        if (fest_feature2 = 0) and(fest_feature3 = 1) then blurp2 = "  The feast will only be such in name, and actually primarily be composed of lines of drugs and roudy behavior.";
                    }
                }
                if (fest_type = "Tournament") {
                    if (fest_feature3 = 1) then blurp2 += "  Other Chapters have been invited to partake in the event, although it is not known who, if any, might show.";
                    if (fest_feature2 = 1) then blurp2 += "  Spectators are encouraged, with efforts made to keep attending simple.";
                }
                if (fest_type = "Deathmatch") {
                    if (fest_feature2 = 1) then blurp2 += "  Spectators are encouraged, with efforts made to keep attending simple.";
                    if (fest_feature3 = 1) then blurp2 += "  Smaller, similar deathmatches will be held for Imperial citizens who wish to partake.";
                }
                if (fest_type = "Chapter Relic") {
                    if (fest_feature1 = 1) then blurp2 += "  Our " + string(obj_ini.role[100, 16]) + "s aim to create a weapon.";
                    if (fest_feature2 = 1) then blurp2 += "  Our " + string(obj_ini.role[100, 16]) + "s aim to create a suit of armour.";
                    if (fest_feature3 = 1) then blurp2 += "  Our " + string(obj_ini.role[100, 16]) + "s aim to hone and strengthen an already existing relic.";
                }
                if (fest_type = "Imperial Mass") {
                    if (fest_feature2 = 1) then blurp2 += "  An Ecclesiarchy priest has been requested to lead the sermons.";
                    if (fest_feature3 = 1) then blurp2 += "  Adepta Sororita presence has been requested, to share in praising the Emperor.";
                }
                if (fest_type = "Chapter Sermon") {
                    if (fest_feature1 = 1) and(fest_feature2 + fest_feature3 = 0) then blurp2 += "  The Chapter Cult Sermon is pointedly sanctioned within the bounds of the Codex Astartes and Imperial tradition.";
                    if (fest_feature1 = 0) and(fest_feature2 + fest_feature3 = 0) then blurp2 += "  The Chapter Cult Sermon contains some radical or questionable practices, but such is allowed, as our traditions.";
                    if (fest_feature2 = 1) then blurp2 += "  Blood sacrifices are a primary focus with the sermon, celebrating martial prowess and our semi-divinity.";
                    if (fest_feature2 > 0) and(fest_feature3 = 1) then blurp2 += "  Drugs will also be present for the ceremony.";
                    if (fest_feature2 = 0) and(fest_feature3 > 1) then blurp2 += "  Mind-altering drugs will be a primary focus of the sermon.";
                }
                if (fest_type = "Triumphal March") {
                    if (fest_feature1 = 1) then blurp2 += "  Local Imperials will be required to attend our march- those that attempt to avoid our revelry are clearly heretics and will be dealt with as such.";
                    if (fest_feature2 = 1) then blurp2 += "  Cadences and battle cries will honor our closest allies, giving them due credit where it is needed.";
                    if (fest_feature3 = 1) then blurp2 += "  Bloody trophies of our conquests will be brandished to the populance.";
                }
            }
        }

        draw_text_ext(xx + 336 + 16, yy + 477, string_hash_to_newline(string(blurp2)), -1, 536);

        // draw_set_alpha(1);if (obj_controller.gene_seed<=0) or (obj_ini.zygote=1) then draw_set_alpha(0.5);

        if (menu = 12.1) or(fest_sid + fest_wid > 0) then draw_set_alpha(0.25);
        draw_set_color(c_gray);
        draw_rectangle(xx + 560, yy + 780, xx + 682, yy + 805, 0);
        draw_set_alpha(1);
        draw_set_color(c_black);
        draw_text(xx + 567, yy + 783, string_hash_to_newline("Schedule Event"));

        if (menu != 12.1) and(fest_sid + fest_wid = 0) and(mouse_x >= xx + 560) and(mouse_y >= yy + 780) and(mouse_x < xx + 682) and(mouse_y < yy + 805) {
            draw_set_alpha(0.2);
            draw_set_color(c_gray);
            draw_rectangle(xx + 560, yy + 780, xx + 682, yy + 805, 0);

            if (mouse_left = 1) and(cooldown <= 0) {
                menu = 12.1;
                var dro = 0;
                dro = instance_create(xx + 1064, yy + 124, obj_dropdown_sel);
                dro.target = "event_type";
                dro = instance_create(xx + 1100, yy + 183, obj_dropdown_sel);
                dro.target = "event_loc";
                dro.width = 186;
                dro = instance_create(xx + 1088, yy + 264, obj_dropdown_sel);
                dro.target = "event_lavish";
                dro = instance_create(xx + 1041, yy + 377, obj_dropdown_sel);
                dro.target = "event_display";
                dro = instance_create(xx + 1041, yy + 433, obj_dropdown_sel);
                dro.target = "event_repeat";
                dro = instance_create(xx + 1325, yy + 433, obj_dropdown_sel);
                dro.target = "event_honor";

                dro = instance_create(xx + 1325, yy + 525, obj_dropdown_sel);
                dro.target = "event_public";

                fest_type = "Great Feast";
                fest_star = "";
                fest_sid = 0;
                fest_wid = 0;
                fest_planet = 0;

                if (obj_ini.fleet_type != 1) then fest_planet = -1;
                if (obj_ini.fleet_type = 1) then fest_planet = 1;

                fest_lav = 0;
                fest_locals = 0;
                fest_feature1 = 1;
                fest_feature2 = 0;
                fest_feature3 = 0;
                fest_display = 0;
                fest_repeats = 1;

            }
        }
        draw_set_alpha(1);
        draw_set_font(fnt_40k_14);

        if (menu = 12.1) {
            var che, cx, cy;
            draw_set_font(fnt_40k_14b);
            draw_set_color(c_gray);
            draw_text_transformed(xx + 962, yy + 126, string_hash_to_newline("Event Type: "), 1, 1, 0);
            draw_text_transformed(xx + 962, yy + 185, string_hash_to_newline("Event Location: "), 1, 1, 0);
            draw_text_transformed(xx + 962, yy + 266, string_hash_to_newline("Grandoise: "), 1, 1, 0);
            draw_text_transformed(xx + 962, yy + 324, string_hash_to_newline("Features: "), 1, 1, 0);
            draw_text_transformed(xx + 962, yy + 379, string_hash_to_newline("Display: "), 1, 1, 0);

            draw_text_transformed(xx + 962, yy + 434, string_hash_to_newline("Repeat: "), 1, 1, 0);
            draw_text_transformed(xx + 1225, yy + 434, string_hash_to_newline("Honoring: "), 1, 1, 0);

            draw_text_transformed(xx + 962, yy + 527, string_hash_to_newline("Attendees: "), 1, 1, 0);
            draw_text_transformed(xx + 1246, yy + 527, string_hash_to_newline("Public: "), 1, 1, 0);

            draw_set_font(fnt_40k_14);

            // Attendees
            if (fest_attend != "") then draw_text_ext(xx + 962, yy + 550, string_hash_to_newline(string(fest_attend)), -1, 612);

            // Location type
            if (fest_planet != 1) then che = 1;
            if (fest_planet = 1) then che = 2;

            cx = xx + 990;
            cy = yy + 212;

            draw_text(cx, cy, string_hash_to_newline("Planet"));

            cx -= 35;
            cy -= 4;

            draw_sprite(spr_creation_check, che + 1, cx, cy);
            draw_set_alpha(1);
            // if (scr_hit(cx+31,cy,cx+260,cy+20)=true){tool1="Planet";tool2="Allows the use of vehicles, and bikes, but prevents this formation from being used during Raids.";}
            if (scr_hit(cx, cy, cx + 32, cy + 32) = true) and(mouse_left = 1) and(cooldown <= 0) and(dropdown_open = 0) {
                var onceh = 0;
                cooldown = 8000;
                if (onceh = 0) and((fest_planet = 0)) {
                    onceh = 1;
                    fest_planet = 1;
                    fest_sid = 0;
                    fest_wid = 0;
                    fest_star = "";
                    with(obj_dropdown_sel) {
                        if (target = "event_loc") then option[1] = "";
                    }
                }
            }
            if (fest_planet = 1) then che = 1;
            if (fest_planet = 0) then che = 2;
            if (fest_type = "Triumphal March") then draw_set_alpha(0.5);

            cx = xx + 1100;
            cy = yy + 212;

            draw_text(cx, cy, string_hash_to_newline("Ship"));

            cx -= 35;
            cy -= 4;

            draw_sprite(spr_creation_check, che + 1, cx, cy);
            draw_set_alpha(1);

            // if (scr_hit(cx+31,cy,cx+260,cy+20)=true){tool1="Planet";tool2="Allows the use of vehicles, and bikes, but prevents this formation from being used during Raids.";}
            if (scr_hit(cx, cy, cx + 32, cy + 32) = true) and(mouse_left = 1) and(cooldown <= 0) and(dropdown_open = 0) {
                var onceh = 0;
                cooldown = 8000;
                if (onceh = 0) and(fest_planet = 1) and(fest_type != "Triumphal March") {
                    onceh = 1;
                    fest_planet = 0;
                    fest_sid = 0;
                    fest_wid = 0;
                    fest_star = "";
                    with(obj_dropdown_sel) {
                        if (target = "event_loc") then option[1] = "";
                    }
                }
            }
            draw_set_alpha(1);

            // Features
            var fet_text = "",
                fet_scale = 1;

            if (fest_type = "Great Feast") then fet_text = "Banquet";
            if (fest_type = "Tournament") then fet_text = "Internal";
            if (fest_type = "Deathmatch") then fet_text = "Chapter Only";
            if (fest_type = "Chapter Relic") then fet_text = "Create Wargear";
            if (fest_type = "Chapter Sermon") then fet_text = "Sanctioned";
            if (fest_type = "Imperial Mass") {
                fet_text = "Local";
                fet_scale = 1;
            }
            if (fest_type = "Triumphal March") {
                fet_text = "Mandatory Attendance";
                fet_scale = 0.7;
            }

            if (fest_feature1 = 0) then che = 1;
            if (fest_feature1 = 1) then che = 2;

            cx = xx + 1068 + 22;
            cy = yy + 326;

            draw_text_transformed(cx, cy, string_hash_to_newline(string(fet_text)), fet_scale, 1, 0);

            cx -= 35;
            cy -= 4;

            draw_sprite(spr_creation_check, che + 1, cx, cy);
            draw_set_alpha(1);
            // if (scr_hit(cx+31,cy,cx+260,cy+20)=true){tool1="Planet";tool2="Allows the use of vehicles, and bikes, but prevents this formation from being used during Raids.";}
            if (scr_hit(cx, cy, cx + 32, cy + 32) = true) and(mouse_left = 1) and(cooldown <= 0) and(dropdown_open = 0) {
                var onceh = 0;
                cooldown = 8000;
                if (fest_type = "Tournament") or(fest_type = "Deathmatch") then onceh = 1;
                if (onceh = 0) and(fest_feature1 = 0) {
                    onceh = 1;
                    fest_feature1 = 1;
                }
                if (onceh = 0) and(fest_feature1 = 1) and(fest_type != "Chapter Relic") {
                    onceh = 1;
                    fest_feature1 = 0;
                }
                if (fest_type = "Chapter Relic") and(fest_feature1 = 1) {
                    fest_feature3 = 0;
                    fest_feature2 = 0;
                }
            }
            if (fest_type = "Tournament") or(fest_type = "Deathmatch") and(fest_feature1 = 0) then fest_feature1 = 1;

            if (fest_type = "Great Feast") then fet_text = "Alcohol";
            if (fest_type = "Tournament") then fet_text = "Spectators";
            if (fest_type = "Deathmatch") then fet_text = "Spectators";
            if (fest_type = "Chapter Relic") then fet_text = "Create Armour";
            if (fest_type = "Imperial Mass") {
                fet_text = "Request Ecclesiarchy";
                fet_scale = 0.75;
            }
            if (fest_type = "Chapter Sermon") {
                fet_text = "Blood Sacrifices";
                fet_scale = 0.75;
            }
            if (fest_type = "Triumphal March") {
                fet_text = "Honor to Allies";
                fet_scale = 0.75;
            }

            if (fest_feature2 = 0) then che = 1;
            if (fest_feature2 = 1) then che = 2;
            if (fest_type = "Imperial Mass") and(known[5] = 0) then draw_set_alpha(0.5);

            cx = xx + 1228 + 22;
            cy = yy + 326;

            draw_text_transformed(cx, cy, string_hash_to_newline(string(fet_text)), fet_scale, 1, 0);
            cx -= 35;
            cy -= 4;
            draw_sprite(spr_creation_check, che + 1, cx, cy);
            draw_set_alpha(1);
            // if (scr_hit(cx+31,cy,cx+260,cy+20)=true){tool1="Planet";tool2="Allows the use of vehicles, and bikes, but prevents this formation from being used during Raids.";}
            if (scr_hit(cx, cy, cx + 32, cy + 32) = true) and(mouse_left = 1) and(cooldown <= 0) and(dropdown_open = 0) {
                var onceh = 0;
                cooldown = 8000;
                if (fest_type = "Imperial Mass") and(known[5] = 0) then onceh = 1;
                if (onceh = 0) and(fest_feature2 = 0) {
                    onceh = 1;
                    fest_feature2 = 1;
                }
                if (onceh = 0) and(fest_feature2 = 1) and(fest_type != "Chapter Relic") {
                    onceh = 1;
                    fest_feature2 = 0;
                }
                if (fest_type = "Chapter Relic") and(fest_feature2 = 1) {
                    fest_feature1 = 0;
                    fest_feature3 = 0;
                }
            }

            if (fest_type = "Great Feast") then fet_text = "Drugs";
            if (fest_type = "Chapter Relic") then fet_text = "Upgrade Existing";
            if (fest_type = "Chapter Sermon") then fet_text = "Drugs";
            if (fest_type = "Tournament") {
                fet_text = "Invite Other Chapters";
                fet_scale = 0.75;
            }
            if (fest_type = "Deathmatch") {
                fet_text = "Allow Other Competitors";
                fet_scale = 0.7;
            }
            if (fest_type = "Imperial Mass") {
                fet_text = "Request Sororitas";
                fet_scale = 0.75;
            }
            if (fest_type = "Triumphal March") {
                fet_text = "Brandish Bloody Trophies";
                fet_scale = 0.6;
            }

            if (fest_feature3 = 0) then che = 1;
            if (fest_feature3 = 1) then che = 2;
            if (fest_type = "Imperial Mass") and(known[5] = 0) then draw_set_alpha(0.5);

            cx = xx + 1388 + 22;
            cy = yy + 326;

            draw_text_transformed(cx, cy, string_hash_to_newline(string(fet_text)), fet_scale, 1, 0);
            cx -= 35;
            cy -= 4;
            draw_sprite(spr_creation_check, che + 1, cx, cy);
            draw_set_alpha(1);
            // if (scr_hit(cx+31,cy,cx+260,cy+20)=true){tool1="Planet";tool2="Allows the use of vehicles, and bikes, but prevents this formation from being used during Raids.";}
            if (scr_hit(cx, cy, cx + 32, cy + 32) = true) and(mouse_left = 1) and(cooldown <= 0) and(dropdown_open = 0) {
                var onceh = 0;
                cooldown = 8000;
                if (fest_type = "Imperial Mass") and(known[5] = 0) then onceh = 1;
                if (onceh = 0) and(fest_feature3 = 0) {
                    onceh = 1;
                    fest_feature3 = 1;
                }
                if (onceh = 0) and(fest_feature3 = 1) and(fest_type != "Chapter Relic") {
                    onceh = 1;
                    fest_feature3 = 0;
                }
                if (fest_type = "Chapter Relic") and(fest_feature3 = 1) {
                    fest_feature1 = 0;
                    fest_feature2 = 0;
                }
            }

            // Always at least one feature
            if (fest_type != "Triumphal March") and(fest_type != "Chapter Sermon") {
                if (fest_feature1 = 0) and(fest_feature2 = 0) and(fest_feature3 = 0) then fest_feature1 = 1;
            }

            // TODO Attendants 
            if (fest_attend = "") and((fest_wid > 0) or(fest_sid > 0)) {
                // determine attendants
            }

            draw_set_font(fnt_40k_14);

            var doable;
            doable = true;
            if (requisition < fest_cost) then doable = false;
            if (fest_wid = 0) and(fest_sid = 0) then doable = false;

            // Accept
            draw_set_halign(fa_left);
            draw_set_alpha(1);
            draw_set_color(c_gray);

            if (doable = false) then draw_set_alpha(0.5);

            draw_rectangle(xx + 1302, yy + 780, xx + 1433, yy + 805, 0);
            draw_set_alpha(1);
            draw_set_color(c_black);
            draw_text(xx + 1305, yy + 784, string_hash_to_newline("Schedule"));

            draw_sprite_ext(spr_requisition, 0, xx + 1374, yy + 787, 1, 1, 0, c_white, 1);
            draw_set_color(c_blue);
            // draw_set_color(16291875);

            if (requisition < fest_cost) then draw_set_color(c_red);
            draw_text(xx + 1388, yy + 784, string_hash_to_newline(string(fest_cost)));
            if (scr_hit(xx + 1302, yy + 780, xx + 1423, yy + 805) = true) and(doable = true) {
                draw_set_color(c_white);
                draw_set_alpha(0.2);
                draw_rectangle(xx + 1302, yy + 780, xx + 1433, yy + 805, 0);

                if (mouse_left = 1) and(cooldown <= 0) {
                    requisition -= fest_cost;
                    fest_scheduled = 1;
                    cooldown = 6000;
                    menu = 12;
                    with(obj_dropdown_sel) {
                        instance_destroy();
                    }
                    if (fest_repeats = 0) then fest_repeats = 1;
                    if (fest_display > 0) then fest_display_tags = obj_ini.artifact_tags[fest_display];

                    // show_message(string(fest_display));
                    // show_message(string(fest_display_tags));

                }
            }

            // Cancel
            draw_set_halign(fa_center);
            draw_set_alpha(1);
            draw_set_color(c_gray);
            draw_rectangle(xx + 1132, yy + 780, xx + 1253, yy + 805, 0);
            draw_set_color(c_black);
            draw_text(xx + 1192, yy + 783, string_hash_to_newline("Cancel"));
            if (scr_hit(xx + 1132, yy + 780, xx + 1253, yy + 805) = true) {
                draw_set_color(c_white);
                draw_set_alpha(0.2);
                draw_rectangle(xx + 1132, yy + 780, xx + 1253, yy + 805, 0);
                if (mouse_left = 1) and(cooldown <= 0) {
                    cooldown = 20;
                    fest_type = "";
                    fest_sid = 0;
                    fest_wid = 0;
                    fest_planet = 0;
                    fest_star = "";
                    fest_lav = 0;
                    fest_locals = 0;
                    fest_feature1 = 0;
                    fest_feature2 = 0;
                    fest_attend = "";
                    fest_feature3 = 0;
                    fest_display = 0;
                    fest_repeats = 0;
                    fest_warp = 0;
                    menu = 12;
                    with(obj_dropdown_sel) {
                        instance_destroy();
                    }
                }
            }
            draw_set_halign(fa_left);
            draw_set_alpha(1);
        }
    }

    // ** Librarium **
    if (menu = 13) {
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
            // draw_sprite(spr_advisors,3,xx+16,yy+43);
            scr_image("advisor", 3, xx + 16, yy + 43, 310, 828);
            if (global.chapter_name = "Space Wolves") then scr_image("advisor", 10, xx + 16, yy + 43, 310, 828);
            // draw_sprite(spr_advisors,10,xx+16,yy+43);
            draw_set_halign(fa_left);
            draw_set_color(c_gray);
            draw_set_font(fnt_40k_30b);
            draw_text_transformed(xx + 336 + 16, yy + 66, string_hash_to_newline("Librarium"), 1, 1, 0);
            draw_text_transformed(xx + 336 + 16, yy + 100, string_hash_to_newline("Chief " + string(obj_ini.role[100, 17]) + " " + string(obj_ini.name[0, 5])), 0.6, 0.6, 0);
            draw_set_font(fnt_40k_14);
        }
        if (menu_adept = 1) {
            // draw_sprite(spr_advisors,0,xx+16,yy+43);
            scr_image("advisor", 0, xx + 16, yy + 43, 310, 828);
            draw_set_halign(fa_left);
            draw_set_color(c_gray);
            draw_set_font(fnt_large);
            draw_text_transformed(xx + 336 + 16, yy + 66, string_hash_to_newline("Librarium"), 1, 1, 0);
            draw_text_transformed(xx + 336 + 16, yy + 100, string_hash_to_newline("Adept " + string(obj_controller.adept_name)), 0.6, 0.6, 0);
            draw_set_font(fnt_40k_14);
        }

        var tip2 = "";

        // Set pace of recruitment based on training psyker value
        if (training_psyker >= 0 && training_psyker <= 6) then blurp += recruitment_pace[training_psyker];

        var artif = "",
            artif_descr = "",
            tp = 0;

        if (artifacts = 0) then artif = "no unused artifacts.";
        if (artifacts = 1) then artif = "one unused artifact.";
        if (artifacts > 1) then artif = string(artifacts) + " unused artifacts.";

        // Greetings message
        if (menu_adept = 0) then draw_text_ext(xx + 336 + 16, yy + 130, string_hash_to_newline("Chapter Master " + string(obj_ini.name[0, 1]) + ", greetings.#I assume you've come for the report?  The Chapter currently possesses " + string(temp[36]) + " Epistolaries, " + string(temp[37]) + " Codiceries, and " + string(temp[38]) + " Lexicanum.  We are working to identify additional warp-sensitive brothers before they cause harm, and the training is " + string(blurp) + ".##We could likely speed up the identification and application of appropriate training, but we would need more resources...I don't suppose we can spare some?##Our Chapter has " + string(artif)), -1, 536);
        if (menu_adept = 1) then draw_text_ext(xx + 336 + 16, yy + 130, string_hash_to_newline("Your Chapter contains " + string(temp[36]) + " " + string(obj_ini.role[100, 17]) + "s, " + string(temp[37]) + " Codiceries, and " + string(temp[38]) + " Lexicanum.##Training of more " + string(obj_ini.role[100, 17]) + "s is " + string(blurp) + ".##Your chapter has " + string(artif)), -1, 536);

        draw_set_color(881503);
        draw_set_halign(fa_center);

        if (artifacts > 0) {
            draw_text(xx + 622, yy + 440, string_hash_to_newline("[Artifact " + string(menu_artifact) + " of " + string(artifacts) + "]"));
            draw_sprite(spr_arrow, 0, xx + 515, yy + 433);
            draw_sprite(spr_arrow, 1, xx + 695, yy + 433);

            draw_set_color(c_black);
            draw_rectangle(xx + 482, yy + 466, xx + 762, yy + 620, 0);
            draw_set_color(c_gray);
            draw_rectangle(xx + 482, yy + 466, xx + 762, yy + 620, 1);
        }
        if (artifacts = 0) then draw_text(xx + 622, yy + 440, string_hash_to_newline("[No Artifacts]"));

        identifiable = 0;
        if (obj_ini.artifact_loc[menu_artifact] = obj_ini.home_name) then identifiable = 1;
        if (obj_ini.artifact_sid[menu_artifact] >= 500) {
            if (obj_ini.ship_location[obj_ini.artifact_sid[menu_artifact] - 500] = obj_ini.home_name) then identifiable = 1;
        }

        if (instance_exists(obj_p_fleet)) {
            with(obj_p_fleet) {
                var good = 0;
                for (var i = 1; i <= 20; i++) {
                    if (i <= 9) {
                        if (capital_num[i] = obj_ini.artifact_sid[other.menu_artifact] - 500) then good = 1;
                    }
                    if (frigate_num[i] = obj_ini.artifact_sid[other.menu_artifact] - 500) then good = 1;
                    if (escort_num[i] = obj_ini.artifact_sid[other.menu_artifact] - 500) then good = 1;
                }
                if (good = 1) and(capital_number > 0) then good = 2;
                if (good = 2) then obj_controller.identifiable = 1;
            }
        }
        if (obj_ini.artifact[menu_artifact] != "") {
            if (obj_ini.artifact_sid[menu_artifact] >= 500) {
                for (var i = 1; i <= 30; i++) {
                    if (obj_ini.ship[i] = obj_ini.artifact_loc[menu_artifact]) then tp = i;
                }
            }
            if (obj_ini.artifact_identified[menu_artifact] > 0) and(identifiable = 0) {
                draw_set_color(881503);
                if (obj_ini.artifact_sid[menu_artifact] >= 500) then artif_descr = "This artifact is an unidentified " + string(obj_ini.artifact[menu_artifact]) + ".#It is stored on the ship ‘" + string(obj_ini.ship[tp]) + "’.#To be identified it must be brought to a fleet with a Battle Barge or your Homeworld.";
                if (obj_ini.artifact_sid[menu_artifact] < 500) then artif_descr = "This artifact is an unidentified " + string(obj_ini.artifact[menu_artifact]) + ".#It is stored on " + string(obj_ini.artifact_loc[menu_artifact]) + " " + string(obj_ini.artifact_sid[menu_artifact]) + ".#To be identified it must be brought to a fleet with a Battle Barge or your Homeworld.";
            }
            if (obj_ini.artifact_identified[menu_artifact] > 0) and(identifiable = 1) {
                draw_set_color(881503);
                if (obj_ini.artifact_sid[menu_artifact] >= 500) then artif_descr = "This artifact is an unidentified " + string(obj_ini.artifact[menu_artifact]) + ".#It is stored on the ship ‘" + string(obj_ini.ship[tp]) + "’.#It will be identified in " + string(obj_ini.artifact_identified[menu_artifact]) + " turns.  You may alternatively spend 150 Requisition to";
                if (obj_ini.artifact_sid[menu_artifact] < 500) then artif_descr = "This artifact is an unidentified " + string(obj_ini.artifact[menu_artifact]) + ".#It is stored on " + string(obj_ini.artifact_loc[menu_artifact]) + " " + string(obj_ini.artifact_sid[menu_artifact]) + ".#It will be identified in " + string(obj_ini.artifact_identified[menu_artifact]) + " turns.  You may alternatively spend 150 Requisition to";

                draw_set_color(c_gray);
                draw_rectangle(xx + 532, yy + 715, xx + 709, yy + 733, 0);
                draw_set_color(c_black);
                draw_text(xx + 622, yy + 715, string_hash_to_newline("IDENTIFY NOW"));
                if (mouse_x >= xx + 532) and(mouse_y >= yy + 715) and(mouse_x < xx + 709) and(mouse_y < yy + 733) {
                    draw_set_alpha(0.2);
                    draw_rectangle(xx + 532, yy + 715, xx + 709, yy + 733, 0);
                    draw_set_alpha(1);
                }

            }
            if (obj_ini.artifact_identified[menu_artifact] = 0) {
                draw_set_color(881503);
                artif_descr = scr_arti_descr(menu_artifact);
                tooltip = "";
                tooltip_weapon = 0;
                tooltip_stat1 = 0;
                tooltip_stat2 = 0;
                tooltip_stat3 = 0;
                tooltip_stat4 = 0;
                tooltip_other = "";
                scr_weapon(string(obj_ini.artifact[menu_artifact]) + "&" + string(obj_ini.artifact_tags[menu_artifact]), "", true, 0, false, "", "description");

                var hue = 1;
                if (obj_ini.artifact[menu_artifact] = "Statue") then hue = 0;
                if (obj_ini.artifact[menu_artifact] = "Casket") then hue = 0;
                if (obj_ini.artifact[menu_artifact] = "Chalice") then hue = 0;
                if (obj_ini.artifact[menu_artifact] = "Robot") then hue = 0;

                if (hue = 1) {
                    draw_set_color(c_gray);
                    draw_rectangle(xx + 354, yy + 789, xx + 448, yy + 804, 0);
                    draw_set_color(c_black);
                    draw_text(xx + 401, yy + 789, string_hash_to_newline("EQUIP"));
                    if (mouse_x >= xx + 354) and(mouse_y >= yy + 789) and(mouse_x < xx + 448) and(mouse_y < yy + 804) {
                        draw_set_alpha(0.2);
                        draw_rectangle(xx + 354, yy + 789, xx + 448, yy + 804, 0);
                        draw_set_alpha(1);
                    }
                }

                draw_set_color(c_gray);
                draw_rectangle(xx + 512, yy + 789, xx + 740, yy + 804, 0);
                draw_set_color(c_black);
                draw_text(xx + 626, yy + 789, string_hash_to_newline("GIFT TO FACTION"));
                if (mouse_x >= xx + 512) and(mouse_y >= yy + 789) and(mouse_x < xx + 740) and(mouse_y < yy + 804) {
                    draw_set_alpha(0.2);
                    draw_rectangle(xx + 512, yy + 789, xx + 740, yy + 804, 0);
                    draw_set_alpha(1);
                }

                draw_set_color(c_gray);
                draw_rectangle(xx + 780, yy + 789, xx + 894, yy + 804, 0);
                draw_set_color(c_black);
                draw_text(xx + 837, yy + 789, string_hash_to_newline("DESTROY"));
                if (mouse_x >= xx + 780) and(mouse_y >= yy + 789) and(mouse_x < xx + 894) and(mouse_y < yy + 804) {
                    draw_set_alpha(0.2);
                    draw_rectangle(xx + 780, yy + 789, xx + 894, yy + 804, 0);
                    draw_set_alpha(1);
                }

                if (menu_artifact_type = 1) { // Weapon
                    // tip2=string(tooltip_stat1)+" Attack, "+string(tooltip_stat2)+" Armour Penetration#";
                    tip2 = string(tooltip_stat1) + " Damage#";
                    if (tooltip_stat4 > 0) then tip2 += string(tooltip_stat4) + " Ammunition#";
                    // tip2+=string_replace(string(tooltip_other),",","#");
                    tip2 += string(tooltip_other);
                }
                if (menu_artifact_type = 2) { // Armour
                    if (tooltip_other = "") then tip2 = string(tooltip_stat1) + " Armour Class";
                    if (tooltip_other != "") then tip2 = string(tooltip_stat1) + " Armour Class#" + string(tooltip_other);
                }
                if (menu_artifact_type = 3) { // Gear
                    tip2 = tooltip_other;
                }
            }

            draw_set_font(fnt_40k_14);
            draw_set_color(c_gray);
            draw_text_ext(xx + 622, yy + 628, string_hash_to_newline(string(artif_descr)), -1, 430);
            var spack;
            spack = string_height_ext(string_hash_to_newline(string(artif_descr)), -1, 430);
            draw_set_font(fnt_40k_14b);
            draw_set_color(c_gray);
            draw_text_ext(xx + 622, yy + 648 + spack, string_hash_to_newline(string(tip2)), -1, 430);

            // identifiable=0;
        }
    }

    // ** Armamentarium **
    if (menu = 14) {
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
            // draw_sprite(spr_advisors,4,xx+16,yy+43);
            scr_image("advisor", 4, xx + 16, yy + 43, 310, 828);
            draw_set_halign(fa_left);
            draw_set_color(c_gray);
            draw_set_font(fnt_40k_30b);
            draw_text_transformed(xx + 336 + 16, yy + 66, string_hash_to_newline("Armamentarium"), 1, 1, 0);
            draw_set_font(fnt_40k_30b);
            draw_text_transformed(xx + 336 + 16, yy + 100, string_hash_to_newline("Forge Master " + string(obj_ini.name[0, 2])), 0.6, 0.6, 0);
        }
        if (menu_adept = 1) {
            // draw_sprite(spr_advisors,0,xx+16,yy+43);
            scr_image("advisor", 0, xx + 16, yy + 43, 310, 828);
            draw_set_halign(fa_left);
            draw_set_color(c_gray);
            draw_set_font(fnt_40k_30b);
            draw_text_transformed(xx + 336 + 16, yy + 66, string_hash_to_newline("Armamentarium"), 1, 1, 0);
            draw_set_font(fnt_40k_30b);
            draw_text_transformed(xx + 336 + 16, yy + 100, string_hash_to_newline("Adept " + string(obj_controller.adept_name)), 0.6, 0.6, 0);
        }

        draw_set_font(fnt_40k_30b);
        draw_set_color(c_gray);

        draw_rectangle(xx + 957, yy + 76, xx + 1062, yy + 104, 0);
        draw_rectangle(xx + 1068, yy + 76, xx + 1150, yy + 104, 0);
        draw_rectangle(xx + 1167, yy + 76, xx + 1255, yy + 104, 0);
        draw_rectangle(xx + 1487, yy + 76, xx + 1545, yy + 104, 0);

        draw_set_color(c_black);
        draw_text_transformed(xx + 960, yy + 76, string_hash_to_newline("Equipment"), 0.6, 0.6, 0);
        draw_text_transformed(xx + 1070, yy + 76, string_hash_to_newline("Armour"), 0.6, 0.6, 0);
        draw_text_transformed(xx + 1170, yy + 76, string_hash_to_newline("Vehicles"), 0.6, 0.6, 0);
        draw_text_transformed(xx + 1490, yy + 76, string_hash_to_newline("Ships"), 0.6, 0.6, 0);

        draw_set_alpha(0.2);
        if (mouse_y >= yy + 76) and(mouse_y < yy + 104) {
            if (mouse_x >= xx + 957) and(mouse_x < xx + 1062) then draw_rectangle(xx + 957, yy + 76, xx + 1062, yy + 104, 0);
            if (mouse_x >= xx + 1068) and(mouse_x < xx + 1136) then draw_rectangle(xx + 1068, yy + 76, xx + 1136, yy + 104, 0);
            if (mouse_x >= xx + 1167) and(mouse_x < xx + 1255) then draw_rectangle(xx + 1167, yy + 76, xx + 1255, yy + 104, 0);
            if (mouse_x >= xx + 1487) and(mouse_x < xx + 1545) then draw_rectangle(xx + 1487, yy + 76, xx + 1545, yy + 104, 0);
        }
        draw_set_alpha(1);
        draw_set_color(c_gray);

        draw_set_font(fnt_40k_30b);
        draw_set_halign(fa_center);
        draw_text_transformed(xx + 605, yy + 432, string_hash_to_newline("STC Fragments"), 0.75, 0.75, 0);
        draw_set_font(fnt_40k_14);
        draw_set_halign(fa_left);
        draw_text(xx + 384, yy + 468, string_hash_to_newline(string(stc_wargear_un + stc_vehicles_un + stc_ships_un) + " Unidentified Fragments"));

        draw_set_halign(fa_center);

        if (stc_wargear_un + stc_vehicles_un + stc_ships_un = 0) then draw_set_alpha(0.5);
        draw_set_color(c_gray);
        draw_rectangle(xx + 621, yy + 466, xx + 720, yy + 486, 0);
        draw_set_color(0);
        draw_text(xx + 670, yy + 467, string_hash_to_newline("Identify"));
        if (mouse_x > xx + 621) and(mouse_y > yy + 466) and(mouse_x < xx + 720) and(mouse_y < yy + 486) {
            draw_set_color(0);
            draw_set_alpha(0.2);
            draw_rectangle(xx + 621, yy + 466, xx + 720, yy + 486, 0);
        }
        draw_set_alpha(1);

        if (stc_wargear_un + stc_vehicles_un + stc_ships_un = 0) then draw_set_alpha(0.5);
        draw_set_color(c_gray);
        draw_rectangle(xx + 733, yy + 466, xx + 790, yy + 486, 0);
        draw_set_color(0);
        draw_text(xx + 761, yy + 467, string_hash_to_newline("Gift"));
        if (mouse_x > xx + 733) and(mouse_y > yy + 466) and(mouse_x < xx + 790) and(mouse_y < yy + 486) {
            draw_set_color(0);
            draw_set_alpha(0.2);
            draw_rectangle(xx + 733, yy + 466, xx + 790, yy + 486, 0);
        }
        draw_set_alpha(1);

        draw_set_font(fnt_40k_12);
        draw_set_halign(fa_left);
        draw_set_color(c_gray);

        var max_techs;
        blurp = "";
        max_techs = round((disposition[3] / 2)) + 5;

        var yyy1, yyy;
        yyy1 = max_techs - temp[37];
        if (yyy1 < 0) then yyy1 = yyy1 * -1;
        yyy = (yyy1 * 2);
        if (disposition[3] mod 2 == 0) then yyy += 2;
        else {
            yyy += 1;
        }

        blurp = "Subject ID confirmed.  Rank Identified: Chapter Master.  Salutations Chapter Master.  We have assembled the following Data: ##" + string(obj_ini.role[100, 16]) + "s: " + string(temp[36]) + ".##Summation: ";
        if (max_techs > temp[37]) then blurp += "Our Mechanicus Requisitionary powers are sufficient to train " + string(max_techs - temp[37]) + " additional " + string(obj_ini.role[100, 16]) + ".";
        if (max_techs <= temp[37]) then blurp += "We require " + string(yyy) + " additional Mechanicus Disposition to train one additional " + string(obj_ini.role[100, 16]) + ".";
        blurp += "  The training of new " + string(obj_ini.role[100, 16]) + "s";

        if (menu_adept = 1) {
            blurp = "Your Chapter contains " + string(temp[36]) + " " + string(obj_ini.role[100, 16]) + ".##";
            blurp += "The training of a new " + string(obj_ini.role[100, 16]);
        }

        if (training_techmarine = 0) {
            blurp += recruitment_pace[training_techmarine];
        }
        if (training_techmarine = 1) {
            blurp += recruitment_pace[training_techmarine];
            eta = floor((359 - tech_points) / 1) + 1;
        }
        if (training_techmarine = 2) {
            blurp += recruitment_pace[training_techmarine];
            eta = floor((359 - tech_points) / 2) + 1;
        }
        if (training_techmarine = 3) {
            blurp += recruitment_pace[training_techmarine];
            eta = floor((359 - tech_points) / 4) + 1;
        }
        if (training_techmarine = 4) {
            blurp += recruitment_pace[training_techmarine];
            eta = floor((359 - tech_points) / 6) + 1;
        }
        if (training_techmarine = 5) {
            blurp += recruitment_pace[training_techmarine];
            eta = floor((359 - tech_points) / 8) + 1;
        }
        if (training_techmarine = 6) {
            blurp += recruitment_pace[training_techmarine];
            eta = floor((359 - tech_points) / 16) + 1;
        }

        if (tech_aspirant > 0) and(training_techmarine > 0) and(menu_adept = 1) {
            if (eta = 1) then blurp += "  Your current " + string(obj_ini.role[100, 16]) + " Aspirant will finish training in " + string(eta) + " month.";
            if (eta != 1) then blurp += "  Your current " + string(obj_ini.role[100, 16]) + " Aspirant will finish training in " + string(eta) + " months.";
        }
        if (tech_aspirant > 0) and(training_techmarine > 0) and(menu_adept = 0) {
            if (eta = 1) then blurp += "  The current " + string(obj_ini.role[100, 16]) + " Aspirant will finish training in " + string(eta) + " month.";
            if (eta != 1) then blurp += "  The current " + string(obj_ini.role[100, 16]) + " Aspirant will finish training in " + string(eta) + " months.";
        }
        if (menu_adept = 0) then blurp += "##Data compilation complete.  We currently possess the technology to produce the following:";

        if (menu_adept = 1) {
            if (max_techs > temp[37]) then blurp += "##Mechanicus Requisitionary powers are sufficient to train " + string(max_techs - temp[37]) + " additional " + string(obj_ini.role[100, 16]) + ".";
            if (max_techs <= temp[37]) then blurp += "You require " + string(yyy) + " additional Mechanicus Disposition to train one additional " + string(obj_ini.role[100, 16]) + ".";

            blurp += "##Data compilation complete.  You currently possess the technology to produce the following:";
        }

        draw_text_ext(xx + 336 + 16, yy + 130, string_hash_to_newline(string(blurp)), -1, 536);

        var hi;
        draw_set_color(38144);
        hi = 0;
        if (stc_wargear > 0) then hi = (stc_wargear / 6) * 210;
        draw_rectangle(xx + 351, yy + 539, xx + 368, yy + 539 + hi, 0);
        hi = 0;
        if (stc_vehicles > 0) then hi = (stc_vehicles / 6) * 210;
        draw_rectangle(xx + 531, yy + 539, xx + 548, yy + 539 + hi, 0);
        hi = 0;
        if (stc_ships > 0) then hi = (stc_ships / 6) * 210;
        draw_rectangle(xx + 711, yy + 539, xx + 728, yy + 539 + hi, 0);

        draw_set_color(c_gray);
        draw_rectangle(xx + 351, yy + 539, xx + 368, yy + 749, 1);
        draw_rectangle(xx + 531, yy + 539, xx + 548, yy + 749, 1);
        draw_rectangle(xx + 711, yy + 539, xx + 728, yy + 749, 1);

        draw_set_font(fnt_40k_14);
        draw_text(xx + 386, yy + 517, string_hash_to_newline("Wargear"));
        draw_text(xx + 566, yy + 517, string_hash_to_newline("Vehicles"));
        draw_text(xx + 746, yy + 517, string_hash_to_newline("Ships"));

        draw_set_font(fnt_40k_12);
        draw_set_alpha(1);
        if (stc_wargear < 1) then draw_set_alpha(0.5);
        draw_text(xx + 372, yy + 549, string_hash_to_newline("1) 8% discount"));
        var ta = "Random";
        if (stc_bonus[1] = 1) then ta = "Enhanced Bolts";
        if (stc_bonus[1] = 2) then ta = "Enhanced Chain Weapons";
        if (stc_bonus[1] = 3) then ta = "Enhanced Flame Weapons";
        if (stc_bonus[1] = 4) then ta = "Enhanced Missiles";
        if (stc_bonus[1] = 5) then ta = "Enhanced Armour";
        draw_set_alpha(1);

        if (stc_wargear < 2) then draw_set_alpha(0.5);
        draw_text(xx + 372, yy + 549 + 35, string_hash_to_newline("2) " + string(ta)));
        draw_set_alpha(1);

        if (stc_wargear < 3) then draw_set_alpha(0.5);
        draw_text(xx + 372, yy + 549 + 70, string_hash_to_newline("3) 16% discount"));

        ta = "Random";
        if (stc_bonus[2] = 1) then ta = "Enhanced Fist Weapons";
        if (stc_bonus[2] = 2) then ta = "Enhanced Plasma";
        if (stc_bonus[2] = 3) then ta = "Enhanced Armour";
        draw_set_alpha(1);

        if (stc_wargear < 4) then draw_set_alpha(0.5);
        draw_text(xx + 372, yy + 549 + 105, string_hash_to_newline("4) " + string(ta)));
        draw_set_alpha(1);

        if (stc_wargear < 5) then draw_set_alpha(0.5);
        draw_text(xx + 372, yy + 549 + 140, string_hash_to_newline("5) 25% discount"));
        draw_set_alpha(1);

        if (stc_wargear < 6) then draw_set_alpha(0.5);
        draw_text_ext(xx + 372, yy + 549 + 175, string_hash_to_newline("6) Can produce Terminator Armour and Dreadnoughts."), -1, 140);
        draw_set_alpha(1);

        // 21 right of the gray bar
        draw_set_font(fnt_40k_12);
        draw_set_alpha(1);
        if (stc_vehicles < 1) then draw_set_alpha(0.5);
        draw_text(xx + 552, yy + 549, string_hash_to_newline("1) 8% discount"));

        ta = "Random";
        if (stc_bonus[3] = 1) then ta = "Enhanced Hull";
        if (stc_bonus[3] = 2) then ta = "Enhanced Accuracy";
        if (stc_bonus[3] = 3) then ta = "New Weapons";
        if (stc_bonus[3] = 4) then ta = "Survivability";
        if (stc_bonus[3] = 5) then ta = "Enhanced Armour";
        draw_set_alpha(1);

        if (stc_vehicles < 2) then draw_set_alpha(0.5);
        draw_text(xx + 552, yy + 549 + 35, string_hash_to_newline("2) " + string(ta)));
        draw_set_alpha(1);

        if (stc_vehicles < 3) then draw_set_alpha(0.5);
        draw_text(xx + 552, yy + 549 + 70, string_hash_to_newline("3) 16% discount"));

        ta = "Random";
        if (stc_bonus[4] = 1) then ta = "Enhanced Hull";
        if (stc_bonus[4] = 2) then ta = "Enhanced Armour";
        if (stc_bonus[4] = 3) then ta = "New Weapons";
        draw_set_alpha(1);

        if (stc_vehicles < 4) then draw_set_alpha(0.5);
        draw_text(xx + 552, yy + 549 + 105, string_hash_to_newline("4) " + string(ta)));
        draw_set_alpha(1);

        if (stc_vehicles < 5) then draw_set_alpha(0.5);
        draw_text(xx + 552, yy + 549 + 140, string_hash_to_newline("5) 25% discount"));
        draw_set_alpha(1);

        if (stc_vehicles < 6) then draw_set_alpha(0.5);
        draw_text_ext(xx + 552, yy + 549 + 175, string_hash_to_newline("6) Can produce Land Speeders and Land Raiders."), -1, 140);
        draw_set_alpha(1);

        // 21 right of the gray bar
        draw_set_font(fnt_40k_12);
        draw_set_alpha(1);
        if (stc_ships < 1) then draw_set_alpha(0.5);
        draw_text(xx + 732, yy + 549, string_hash_to_newline("1) 8% discount"));
        ta = "Random";
        if (stc_bonus[5] = 1) then ta = "Enhanced Hull";
        if (stc_bonus[5] = 2) then ta = "Enhanced Accuracy";
        if (stc_bonus[5] = 3) then ta = "Enhanced Turning";
        if (stc_bonus[5] = 4) then ta = "Enhanced Boarding";
        if (stc_bonus[5] = 5) then ta = "Enhanced Armour";
        draw_set_alpha(1);

        if (stc_ships < 2) then draw_set_alpha(0.5);
        draw_text(xx + 732, yy + 549 + 35, string_hash_to_newline("2) " + string(ta)));
        draw_set_alpha(1);

        if (stc_ships < 3) then draw_set_alpha(0.5);
        draw_text(xx + 732, yy + 549 + 70, string_hash_to_newline("3) 16% discount"));

        ta = "Random";
        if (stc_bonus[6] = 1) then ta = "Enhanced Hull";
        if (stc_bonus[6] = 2) then ta = "Enhanced Armour";
        if (stc_bonus[6] = 3) then ta = "Enhanced Speed";
        draw_set_alpha(1);

        if (stc_ships < 4) then draw_set_alpha(0.5);
        draw_text(xx + 732, yy + 549 + 105, string_hash_to_newline("4) " + string(ta)));
        draw_set_alpha(1);

        if (stc_ships < 5) then draw_set_alpha(0.5);
        draw_text(xx + 732, yy + 549 + 140, string_hash_to_newline("5) 25% discount"));
        draw_set_alpha(1);

        if (stc_ships < 6) then draw_set_alpha(0.5);
        draw_text_ext(xx + 732, yy + 549 + 175, string_hash_to_newline("6) Warp Speed is increased and ships self-repair."), -1, 140);
        draw_set_alpha(1);
    }

    // ** Recruiting **
    if (menu = 15) {

        draw_sprite(spr_rock_bg, 0, xx, yy);
        draw_set_alpha(0.75);
        draw_set_color(0);
        draw_rectangle(xx + 326 + 16, yy + 66, xx + 887 + 16, yy + 818, 0);
        draw_set_alpha(1);
        draw_set_color(c_gray);
        draw_rectangle(xx + 326 + 16, yy + 66, xx + 887 + 16, yy + 818, 1);
        draw_line(xx + 326 + 16, yy + 480, xx + 887 + 16, yy + 480);
        draw_set_alpha(0.75);
        draw_set_color(0);
        draw_rectangle(xx + 945, yy + 66, xx + 1580, yy + 818, 0);
        draw_set_alpha(1);
        draw_set_color(c_gray);
        draw_rectangle(xx + 945, yy + 66, xx + 1580, yy + 818, 1);

        if (menu_adept = 0) {
            // draw_sprite(spr_advisors,5,xx+16,yy+43);
            scr_image("advisor", 5, xx + 16, yy + 43, 310, 828);
            draw_set_halign(fa_left);
            draw_set_color(c_gray);
            draw_set_font(fnt_40k_30b);
            draw_text_transformed(xx + 336 + 16, yy + 66, string_hash_to_newline("World " + string(obj_ini.recruiting_name)), 1, 1, 0);
            draw_text_transformed(xx + 336 + 16, yy + 100, string_hash_to_newline("First Sergeant " + string(recruiter_name)), 0.6, 0.6, 0);
            draw_set_font(fnt_40k_14);
        }
        if (menu_adept = 1) {
            // draw_sprite(spr_advisors,0,xx+16,yy+43);
            scr_image("advisor", 0, xx + 16, yy + 43, 310, 828);
            draw_set_halign(fa_left);
            draw_set_color(c_gray);
            draw_set_font(fnt_40k_30b);
            draw_text_transformed(xx + 336 + 16, yy + 40, string_hash_to_newline("World " + string(obj_ini.recruiting_name)), 1, 1, 0);
            draw_text_transformed(xx + 336 + 16, yy + 100, string_hash_to_newline("Adept " + string(obj_controller.adept_name)), 0.6, 0.6, 0);
            draw_set_font(fnt_40k_14);
        }

        if (menu_adept = 0) then blurp = "Hail " + string(obj_ini.name[0, 1]) + "!  You asked for a report?##";

        if (obj_ini.doomed = 0) {
            if (recruits <= 0) and(marines >= 1000) then blurp += "Our Chapter currently has no Neophytes- we are at maximum strength and do not require more marines.  ";
            if (recruits <= 0) and(marines < 1000) and(recruiting = 0) then blurp += "Our Chapter currently has no Neophytes.  Without training more our chapter is doomed to a slow death.";
            if (recruits <= 0) and(marines < 1000) and(recruiting > 0) then blurp += "Our Chapter currently has no Neophytes.  We are doing our utmost best to find suitable recruits.";
            if (recruits = 1) then blurp += "Our Chapter currently has one recruit being trained.  The Neophyte's name is " + string(recruit_name[1]) + " and they are scheduled to become a battle brother in " + string(recruit_training[1] + recruit_distance[1]) + " months' time.  ";
            if (recruits > 1) then blurp += "Our Chapter currently has " + string(recruits) + " recruits being trained.  " + string(recruit_name[1]) + " is the next scheduled Neophyte to become a battle brother in " + string(recruit_training[1] + recruit_distance[1]) + " months' time.  ";
            if (gene_seed > 0) {
                if (recruiting = 0) and(marines >= 1000) then blurp += "##Recruitment" + recruitment_rates[recruiting] + ".  You must only give me the word and I can begin further increasing our numbers... though this would violate the Codex Astartes.  ";
                if (recruiting = 0) and(marines < 1000) then blurp += "##Recruitment " + recruitment_rates[recruiting] + ".  You must only give me the word and I can begin further increasing our numbers.  ";

                if (recruiting = 1) then blurp += "##Recruitment " + recruitment_rates[recruiting] + ".  With an increase of funding I could vastly increase the rate.  ";
                if (recruiting = 2) then blurp += "##Recruitment " + recruitment_rates[recruiting] + ".  With an increase of funding I could vastly increase the rate.  ";
                if (recruiting = 3) then blurp += "##Recruitment " + recruitment_rates[recruiting] + "  ";
                if (recruiting = 4) then blurp += "##Recruitment " + recruitment_rates[recruiting] + "- give me the word when we have enough Neophytes being trained.  ";
                if (recruiting = 5) then blurp += "##Recruitment " + recruitment_rates[recruiting] + "- give me the word when we have enough Neophytes being trained.  ";
                if (recruiting = 6) then blurp += "##Recruitment " + recruitment_rates[recruiting] + "- give me the word when we have enough Neophytes being trained.  ";
            }
        }

        if (obj_ini.doomed = 1) {
            blurp += "Our chapter's mutation currently makes us unable to recruit new Neophytes.  We are doomed to a slowe demise unless the Apothecaries can fix it.##";
        }

        if (gene_seed = 0) {
            blurp += "We have no more gene-seed in our vaults and cannot create more neophytes as a result.  Something must be done, Chapter Master.##";
        }

        if (recruiting > 0) and(string_count("|", obj_controller.recruiting_worlds) = 1) then blurp += "Our Chapter is recruiting from one world- " + string(obj_ini.recruiting_name) + ".  Perhaps we should speak with a planetary governor to acquire another.";
        if (recruiting > 0) and(string_count("|", obj_controller.recruiting_worlds) = 2) then blurp += "Our Chapter is recruiting from two worlds.  Finding recruits is vastly accelerated but incuring more expenses.";
        if (recruiting > 0) and(string_count("|", obj_controller.recruiting_worlds) > 2) then blurp += "Our Chapter is recruiting from several worlds.";



        if (menu_adept = 1) {
            blurp = string_replace(blurp, "Our", "Your");
            blurp = string_replace(blurp, " our", " your");
            blurp = string_replace(blurp, "We", "You");
        }

        draw_text_ext(xx + 336 + 16, yy + 130, string_hash_to_newline(string(blurp)), -1, 536);

        // draw_line(xx+216,yy+252,xx+597,yy+252);draw_line(xx+216,yy+292,xx+597,yy+292);

        var blur = "",
            amo = 0;
        // ** Normal recruiting **
        draw_set_color(16291875);
        if (recruiting = 1) then amo = -2;
        if (recruiting = 2) then amo = -4;
        if (recruiting = 3) then amo = -6;
        if (recruiting = 4) then amo = -8;
        if (recruiting = 5) then amo = -10;
        if (recruiting = 6) then amo = -20;
        amo = amo * (string_count("|", obj_controller.recruiting_worlds));
        if (amo != 0) then draw_sprite(spr_requisition, 0, xx + 336 + 16, yy + 356);
        if (recruiting != 0) then draw_text(xx + 351 + 16, yy + 354, string_hash_to_newline(string(amo)));
        draw_set_color(c_gray);
        if (recruiting >= 0) and(recruiting <= 6) then blur = recruitement_rate[recruiting];
        draw_text(xx + 407, yy + 354, string_hash_to_newline("Space Marine Recruiting: " + string(blur)));
        draw_text(xx + 728, yy + 354, string_hash_to_newline("[-] [+]"));

        amo = 0;
        // ** Apothecary recruitment **
        draw_set_color(16291875);
        if (training_apothecary = 1) then amo = -1;
        if (training_apothecary = 2) then amo = -2;
        if (training_apothecary = 3) then amo = -3;
        if (training_apothecary = 4) then amo = -4;
        if (training_apothecary = 5) then amo = -6;
        if (training_apothecary = 6) then amo = -12;
        if (amo != 0) then draw_sprite(spr_requisition, 0, xx + 336 + 16, yy + 396);
        if (training_apothecary != 0) then draw_text(xx + 351 + 16, yy + 394, string_hash_to_newline(string(amo)));
        draw_set_color(c_gray);
        if (training_apothecary >= 0) and(training_apothecary <= 6) then blur = recruitement_rate[training_apothecary];
        draw_text(xx + 407, yy + 394, string_hash_to_newline("Apothecary Training: " + string(blur)));
        draw_text(xx + 728, yy + 394, string_hash_to_newline("[-] [+]"));

        // TODO implement Spave Wolves and Iron Hands cases
        if (global.chapter_name != "Space Wolves") and(global.chapter_name != "Iron Hands") {
            // ** Chaplain recruitment **
            amo = 0;
            draw_set_color(16291875);
            if (training_chaplain = 1) then amo = -1;
            if (training_chaplain = 2) then amo = -2;
            if (training_chaplain = 3) then amo = -3;
            if (training_chaplain = 4) then amo = -4;
            if (training_chaplain = 5) then amo = -6;
            if (training_chaplain = 6) then amo = -12;
            if (amo != 0) then draw_sprite(spr_requisition, 0, xx + 336 + 16, yy + 416);
            if (training_chaplain != 0) then draw_text(xx + 351 + 16, yy + 414, string_hash_to_newline(string(amo)));
            draw_set_color(c_gray);
            if (training_chaplain >= 0) and(training_chaplain <= 6) then blur = recruitement_rate[training_chaplain];
            draw_text(xx + 407, yy + 414, string_hash_to_newline("Chaplain Training: " + string(blur)));
            draw_text(xx + 728, yy + 414, string_hash_to_newline("[-] [+]"));
        }

        // ** Psyker recruitment **
        amo = 0;
        draw_set_color(16291875);
        if (training_psyker = 1) then amo = -1;
        if (training_psyker = 2) then amo = -2;
        if (training_psyker = 3) then amo = -3;
        if (training_psyker = 4) then amo = -4;
        if (training_psyker = 5) then amo = -6;
        if (training_psyker = 6) then amo = -12;
        if (amo != 0) then draw_sprite(spr_requisition, 0, xx + 336 + 16, yy + 436);
        if (training_psyker != 0) then draw_text(xx + 351 + 16, yy + 434, string_hash_to_newline(string(amo)));
        draw_set_color(c_gray);
        if (training_psyker >= 0) and(training_psyker <= 6) then blur = recruitement_rate[training_psyker];
        draw_text(xx + 407, yy + 434, string_hash_to_newline("Psyker Training: " + string(blur)));
        draw_text(xx + 728, yy + 434, string_hash_to_newline("[-] [+]"));

        // ** Techmarine recruitment **
        amo = 0;
        draw_set_color(16291875);
        if (training_techmarine = 1) then amo = -1;
        if (training_techmarine = 2) then amo = -2;
        if (training_techmarine = 3) then amo = -3;
        if (training_techmarine = 4) then amo = -4;
        if (training_techmarine = 5) then amo = -6;
        if (training_techmarine = 6) then amo = -12;
        if (amo != 0) then draw_sprite(spr_requisition, 0, xx + 336 + 16, yy + 456);
        if (training_techmarine != 0) then draw_text(xx + 351 + 16, yy + 456, string_hash_to_newline(string(amo)));
        draw_set_color(c_gray);
        if (training_techmarine >= 0) and(training_techmarine <= 6) then blur = recruitement_rate[training_techmarine];
        draw_text(xx + 407, yy + 454, string_hash_to_newline("Techmarine Training: " + string(blur)));
        draw_text(xx + 728, yy + 454, string_hash_to_newline("[-] [+]"));

        // ** Neophyte Training types **
        var yyy = 0,
            blurp2 = "",
            blurp3 = "";

        draw_set_halign(fa_center);
        draw_set_font(fnt_40k_30b);
        draw_text_transformed(xx + 622, yy + 491, string_hash_to_newline("Aspirant Trial"), 0.6, 0.6, 0);
        draw_set_font(fnt_40k_14b);

        draw_text_ext(xx + 622, yy + 522, string_hash_to_newline(string(recruit_trial)), -1, 536);
        draw_set_halign(fa_left);
        draw_set_font(fnt_40k_14);

        if (recruit_trial = "Blood Duel") {
            blurp3 = "-10-30% More recruits#-2-4 Years shorter training time#-10% Chance to burn gene-seed per speed";
            blurp2 = "THE BLOOD DUEL?  HAT DO I EVEN NEED TO EXPLAIN, CHAPTER MASTER?  ASPIRANTS ENTER.  NEOPHYTES LEAVE.  Those worthy of serving the Emperor are rewarded justly and those merely pretending at glory are lost in the BLOOD AND THUNDER of the dome.  Do not be alarmed at the carnage.  The Apothecarium has become quite adept at rebuilding those fit to serve.  The others are given to the " + string(obj_ini.role[100, 16]) + "s.  The mind is a terrible thing to waste and the Emperor does hate waste.  Not every man is useful as an Astartes but every man is useful.";
        }
        if (recruit_trial = "Hunting the Hunter") {
            blurp3 = "-Planet Bonus': Desert, Ice, Death#-Up to 15 bonus XP on Neophytes";
            blurp2 = "To be an Astartes is to be a hunter of xenos, of traitors, of heretics, and of all those that dare defy the Emperor.  What better way to test the worthiness of Aspirants than to have to them hunt the most dangerous predator to be found on their planet?  Such a task requires a combination of wits and cunning, in addition to raw martial skill.  When they have received the blessed geneseed and become full battle brothers, they will hunt across the stars with bolter and chainsword. For now, let them hunt with nothing more than a spear and their wits.";
        }
        if (recruit_trial = "Survival of the Fittest") {
            blurp3 = "-Planet Bonus': Desert, Ice, Death, Lava#-(+10-30% recruits)#-Planet Bonus: Feudal (+20-50% recruits)";
            blurp2 = "To become one of the Imperium’s finest warriors, the Space Marines, is the greatest glory that any human can aspire to. And is glory not worth fighting, bleeding or even dying for? It must be, for whole worlds of ice, ash and sand have buried generations of sons in pursuit of this glory and never once called the price too dear.  To ensure the necessary bloodshed, lies, paranoia and psychosis-inducing drugs have been introduced to " + string(obj_ini.recruiting_name) + ".  This trial will seperate the weak from the strong and the chaff from the wheat.";
        }
        if (recruit_trial = "Exposure") {
            blurp3 = "-Planet Bonus':3- Desert, Ice, Forge, Lava, Death#-1-3 Years shorter training time";
            blurp2 = "Few worlds of the Imperium are free from the adversity of pollution or toxic waste.  Still others are bequeathed with flows of lava and choking atmosphere.  The glory of rising to astartes is only granted to those that can tackle and overcome these dangerous environments.  Aspirants are placed upon the most hellish of planet in the sector, and then expected to traverse the continent with only himself to rely upon.  Those who face the impossible without faltering and survive past the point they should have perished are recovered by " + string(obj_ini.role[100, 15]) + "s, judged worthy of becoming a Neophyte.";
        }
        if (recruit_trial = "Knowledge of Self") {
            blurp3 = "-Planet Bonus: Temperate (up to 10 bonus xp)#-1.5-3 Years longer training#-Up to bonus 25 XP on Neophytes.";
            blurp2 = "An Aspirant’s spiritual and mental capability is every bit as important as his physical characteristics.  It is wise to impose Trials not upon their body, but on the mind.  Either through psychic powers, chemical agents, or endurance trials, the Aspirant’s willpower is tested.  Those unworthy do not survive the stress and trauma placed upon their hearts- only those whose minds are proven to be unbreakable are welcomed into our ranks.";
        }
        if (recruit_trial = "Challenge") {
            blurp3 = "-Standard generic choice #-Heroic Neophytes gain bonus 10-20 XP";
            blurp2 = "What better gauge of an Aspirant than in a duel with our astartes?  Our brother, unarmed and unarmoured, will face against the armed challenger until one cannot continue.  It is impossible for the Aspirant to actually succeed these trials, but demonstrates how far they can possibly go, and allow us to judge him accordingly.  As with most trials the Aspirant’s life is in their own hands.  He who has failed the duel- yet proven himself worthy- is rescued from the jaws of death by " + string(obj_ini.role[100, 15]) + " and allowed to progress to the rank of Neophyte.";
        }
        if (recruit_trial = "Apprenticeship") {
            blurp3 = "-Planet Bonus: Lava (+10-50% recruits)#-4-5 Years longer training time#-Almost able for immediate promotion";
            blurp2 = "What better way to cultivate astartes than to raise them from youth?  The capable children of " + string(obj_ini.recruiting_name) + " are apprenticed to our battle brothers.  Beneath their steady guidance the Aspirants spend several years learning the art of the smith.  The most able are judged by our Chapter’s " + string(obj_ini.role[100, 15]) + "s and " + string(obj_ini.role[100, 14]) + " to deem if they are compatible with gene-seed implantation.  If so, the Aspirant’s trial culminates in hunting and slaying a massive beast.  Only the brightest and bravest are added to our ranks.";
        }

        yyy = string_height_ext(string_hash_to_newline(blurp2), -1, 536) + yy + 545;

        draw_text_ext(xx + 336 + 16, yy + 545, string_hash_to_newline(string(blurp2)), -1, 536);
        draw_text_ext(xx + 336 + 16, yy + 565 + string_height_ext(string_hash_to_newline(blurp2), -1, 536), string_hash_to_newline(string(blurp3)), -1, 536);

        draw_sprite(spr_arrow, 0, xx + 494, yy + 515);
        draw_sprite(spr_arrow, 1, xx + 717, yy + 515);

        draw_set_font(fnt_40k_30b);
        draw_set_halign(fa_center);
        draw_text_transformed(xx + 1262, yy + 70, string_hash_to_newline("Neophytes"), 0.6, 0.6, 0);

        if (recruit_name[1] != "") {
            draw_set_font(fnt_40k_14);
            draw_set_halign(fa_left);

            var t_eta = 0;
            for (var qp = 1, n = 0; qp <= 300 && n < 36; qp++) {
                if (recruit_name[qp] != "") {
                    n++;
                    draw_rectangle(xx + 947, yy + 100 + ((n - 1) * 20), xx + 1577, yy + 100 + (n * 20), 1);
                    draw_text(xx + 950, yy + 100 + ((qp - 1) * 20), string_hash_to_newline("Neophyte " + string(recruit_name[qp])));
                    draw_text(xx + 1200, yy + 100 + ((qp - 1) * 20), string_hash_to_newline("Starting EXP: " + string(recruit_exp[qp])));
                    draw_text(xx + 1500, yy + 100 + ((qp - 1) * 20), string_hash_to_newline("ETA: " + string(recruit_training[qp] + recruit_distance[qp])));
                }
            }
        }
    }

    // *** Fleet advisor was here ***

    // ** Chapter Master **
    if (menu = 50) {
        draw_set_color(0);
        draw_sprite(spr_solid_bg, 0, xx, yy);
        draw_sprite(spr_master_splash, 0, xx, yy);

        draw_rectangle(xx + 213, yy + 25, xx + 622, yy + 78, 0);

        draw_set_halign(fa_center);
        draw_set_color(38144);
        draw_line(xx + 213, yy, xx + 213, yy + 640);
        draw_rectangle(xx + 213, yy + 25, xx + 622, yy + 78, 1);

        draw_set_color(0);
        draw_rectangle(xx + 217, yy + 82, xx + 617, yy + 188, 0);
        draw_rectangle(xx + 217, yy + 199, xx + 617, yy + 367, 0);
        draw_rectangle(xx + 217, yy + 380, xx + 617, yy + 411, 0);

        draw_set_color(38144);
        draw_rectangle(xx + 217, yy + 82, xx + 617, yy + 188, 1);
        draw_rectangle(xx + 217, yy + 199, xx + 617, yy + 367, 1);
        draw_rectangle(xx + 217, yy + 380, xx + 617, yy + 411, 1);

        draw_set_font(fnt_large);
        draw_text_transformed(xx + 410, yy + 29, string_hash_to_newline("Chapter Master"), 0.5, 0.5, 0);

        draw_set_font(fnt_fancy);
        draw_text_transformed(xx + 410, yy + 40, string_hash_to_newline(string(obj_ini.master_name)), 1.5, 1.5, 0);
        draw_set_font(fnt_small);
        draw_set_halign(fa_left);

        var eqp = "",
            tempe = "";
			
        draw_text(xx + 222, yy + 83, string_hash_to_newline("Equipment:"));
        draw_text(xx + 222.5, yy + 83.5, string_hash_to_newline("Equipment:"));

        draw_set_font(fnt_tiny);
        draw_text_ext(xx + 222, yy + 99, string_hash_to_newline(string(eqp)), -1, 396);

        draw_set_font(fnt_small);
        draw_text(xx + 222, yy + 200, string_hash_to_newline("Kills:"));
        draw_text(xx + 222.5, yy + 200.5, string_hash_to_newline("Kills:"));

        var her_ki, ork_ki, tau_ki, tyr_ki, eld_ki, tot_ki, nec_ki, comma;
        her_ki = "";
        ork_ki = "";
        tau_ki = "";
        tyr_ki = "";
        eld_ki = "";
        nec_ki = "";
        tot_ki = "";
        comma = 0;

        if (obj_ini.master_heretics = 1) then her_ki += string(obj_ini.master_heretics) + " Heretic, ";
        if (obj_ini.master_heretics > 1) then her_ki += string(obj_ini.master_heretics) + " Heretics, ";
        if (obj_ini.master_chaos_marines = 1) then her_ki += string(obj_ini.master_chaos_marines) + " Chaos Space Marine, ";
        if (obj_ini.master_chaos_marines > 1) then her_ki += string(obj_ini.master_chaos_marines) + " Chaos Space Marines, ";
        if (obj_ini.master_chaos_vehicles = 1) then her_ki += string(obj_ini.master_chaos_vehicles) + " Chaos Vehicle, ";
        if (obj_ini.master_chaos_vehicles > 1) then her_ki += string(obj_ini.master_chaos_vehicles) + " Chaos Vehicles, ";
        if (obj_ini.master_lesser_demons = 1) then her_ki += string(obj_ini.master_lesser_demons) + " Lesser Daemon, ";
        if (obj_ini.master_lesser_demons > 1) then her_ki += string(obj_ini.master_lesser_demons) + " Lesser Daemons, ";
        if (obj_ini.master_greater_demons = 1) then her_ki += string(obj_ini.master_greater_demons) + " Greater Daemon, ";
        if (obj_ini.master_greater_demons > 1) then her_ki += string(obj_ini.master_greater_demons) + " Greater Daemons, ";
        if (her_ki != "") {
            comma = string_length(her_ki);
            her_ki = string_delete(her_ki, comma - 1, 2);
        }
        if (her_ki != "") then tot_ki += string(her_ki) + "#";

        if (obj_ini.master_necron_overlord = 1) then nec_ki += string(obj_ini.master_necron_overlord) + " Necron Overlord, ";
        if (obj_ini.master_necron_overlord > 1) then nec_ki += string(obj_ini.master_necron_overlord) + " Necron Overlords, ";
        if (obj_ini.master_destroyer = 1) then nec_ki += string(obj_ini.master_destroyer) + " Destroyer, ";
        if (obj_ini.master_destroyer > 1) then nec_ki += string(obj_ini.master_destroyer) + " Destroyers, ";
        if (obj_ini.master_necron = 1) then nec_ki += string(obj_ini.master_necron) + " Necron, ";
        if (obj_ini.master_necron > 1) then nec_ki += string(obj_ini.master_necron) + " Necrons, ";
        if (obj_ini.master_necron_vehicles = 1) then nec_ki += string(obj_ini.master_necron_vehicles) + " Necron Vehicle, ";
        if (obj_ini.master_necron_vehicles > 1) then nec_ki += string(obj_ini.master_necron_vehicles) + " Necron Vehicles, ";
        if (obj_ini.master_monolith = 1) then nec_ki += string(obj_ini.master_monolith) + " Monolith, ";
        if (obj_ini.master_monolith > 1) then nec_ki += string(obj_ini.master_monolith) + " Monoliths, ";
        if (nec_ki != "") {
            comma = string_length(nec_ki);
            nec_ki = string_delete(nec_ki, comma - 1, 2);
        }
        if (nec_ki != "") then tot_ki += string(nec_ki) + "#";

        if (obj_ini.master_ork_boyz = 1) then ork_ki += string(obj_ini.master_ork_boyz) + " Ork Boy, ";
        if (obj_ini.master_ork_boyz > 1) then ork_ki += string(obj_ini.master_ork_boyz) + " Ork Boyz, ";
        if (obj_ini.master_ork_nobz = 1) then ork_ki += string(obj_ini.master_ork_nobz) + " Ork Nob, ";
        if (obj_ini.master_ork_nobz > 1) then ork_ki += string(obj_ini.master_ork_nobz) + " Ork Nobz, ";
        if (obj_ini.master_ork_warboss = 1) then ork_ki += string(obj_ini.master_ork_warboss) + " Ork Warboss, ";
        if (obj_ini.master_ork_warboss > 1) then ork_ki += string(obj_ini.master_ork_warboss) + " Ork Warbosses, ";
        if (obj_ini.master_ork_vehicles = 1) then ork_ki += string(obj_ini.master_ork_vehicles) + " Ork Vehicle, ";
        if (obj_ini.master_ork_vehicles > 1) then ork_ki += string(obj_ini.master_ork_vehicles) + " Ork Vehicles, ";
        if (ork_ki != "") {
            comma = string_length(ork_ki);
            ork_ki = string_delete(ork_ki, comma - 1, 2);
        }
        if (ork_ki != "") then tot_ki += string(ork_ki) + "#";

        if (obj_ini.master_tyrant = 1) then tyr_ki += string(obj_ini.master_tyrant) + " Hive Tyrant, ";
        if (obj_ini.master_tyrant > 1) then tyr_ki += string(obj_ini.master_tyrant) + " Hive Tyrants, ";
        if (obj_ini.master_carnifex > 0) then tyr_ki += string(obj_ini.master_carnifex) + " Carnifex, ";
        if (obj_ini.master_synapse > 0) then tyr_ki += string(obj_ini.master_synapse) + " Synapse Tyranid, ";
        if (obj_ini.master_warriors = 1) then tyr_ki += string(obj_ini.master_warriors) + " Warrior, ";
        if (obj_ini.master_warriors > 1) then tyr_ki += string(obj_ini.master_warriors) + " Warriors, ";
        if (obj_ini.master_gene = 1) then tyr_ki += string(obj_ini.master_gene) + " Genestealer, ";
        if (obj_ini.master_gene > 1) then tyr_ki += string(obj_ini.master_gene) + " Genestealers, ";
        if (obj_ini.master_gaunts = 1) then tyr_ki += string(obj_ini.master_gaunts) + " Gaunt, ";
        if (obj_ini.master_gaunts > 1) then tyr_ki += string(obj_ini.master_gaunts) + " Gaunts, ";
        if (tyr_ki != "") {
            comma = string_length(tyr_ki);
            tyr_ki = string_delete(tyr_ki, comma - 1, 2);
        }
        if (tyr_ki != "") then tot_ki += string(tyr_ki) + "#";

        if (obj_ini.master_avatar = 1) then eld_ki += string(obj_ini.master_avatar) + " Avatar, ";
        if (obj_ini.master_avatar > 1) then eld_ki += string(obj_ini.master_avatar) + " Avatars, ";
        if (obj_ini.master_autarch > 0) then eld_ki += string(obj_ini.master_autarch) + " Autarch, ";
        if (obj_ini.master_farseer = 1) then eld_ki += string(obj_ini.master_farseer) + " Farseer, ";
        if (obj_ini.master_farseer > 1) then eld_ki += string(obj_ini.master_farseer) + " Farseers, ";
        if (obj_ini.master_aspect = 1) then eld_ki += string(obj_ini.master_aspect) + " Aspect Warrior, ";
        if (obj_ini.master_aspect > 1) then eld_ki += string(obj_ini.master_aspect) + " Aspect Warriors, ";
        if (obj_ini.master_eldar > 0) then eld_ki += string(obj_ini.master_eldar) + " Eldar, ";
        if (obj_ini.master_eldar_vehicles = 1) then eld_ki += string(obj_ini.master_eldar_vehicles) + " Eldar Vehicle, ";
        if (obj_ini.master_eldar_vehicles > 1) then eld_ki += string(obj_ini.master_eldar_vehicles) + " Eldar Vehicles, ";
        if (eld_ki != "") {
            comma = string_length(eld_ki);
            eld_ki = string_delete(eld_ki, comma - 1, 2);
        }
        if (eld_ki != "") then tot_ki += string(eld_ki) + "#";

        if (obj_ini.master_tau = 1) then tau_ki += string(obj_ini.master_tau) + " Fire Warrior, ";
        if (obj_ini.master_tau > 1) then tau_ki += string(obj_ini.master_tau) + " Fire Warriors, ";
        if (obj_ini.master_battlesuits = 1) then tau_ki += string(obj_ini.master_battlesuits) + " Battlesuit, ";
        if (obj_ini.master_battlesuits > 1) then tau_ki += string(obj_ini.master_battlesuits) + " Battlesuits, ";
        if (obj_ini.master_tau_vehicles = 1) then tau_ki += string(obj_ini.master_tau_vehicles) + " Tau Vehicle, ";
        if (obj_ini.master_tau_vehicles > 1) then tau_ki += string(obj_ini.master_tau_vehicles) + " Tau Vehicles, ";
        if (obj_ini.master_kroot > 0) then tau_ki += string(obj_ini.master_kroot) + " Kroot, ";
        if (tau_ki != "") {
            comma = string_length(tau_ki);
            tau_ki = string_delete(tau_ki, comma - 1, 2);
        }
        if (tau_ki != "") then tot_ki += string(tau_ki) + "#";


        draw_text_ext(xx + 222, yy + 216, string_hash_to_newline(string(tot_ki)), -1, 396);

        if (obj_ini.lid[0, 1] = 0) then draw_text(xx + 222, yy + 380, string_hash_to_newline("Current Location: " + string(obj_ini.loc[0, 1]) + " " + string(obj_ini.wid[0, 1]) + "#Health: " + string(obj_ini.hp[0, 1]) + "%"));
        if (obj_ini.lid[0, 1] > 0) then draw_text(xx + 222, yy + 380, string_hash_to_newline("Current Location: Onboard " + string(obj_ini.ship[obj_ini.lid[0, 1]]) + "#Health: " + string(obj_ini.hp[0, 1]) + "%"));
        draw_text(xx + 222.5, yy + 380.5, string_hash_to_newline("Current Location:#Health:"));

        draw_sprite(spr_arrow, 0, xx + 217, yy + 32);
    }

    // ** Welcome menu **
    if (menu >= 500) and(menu <= 510) {
        draw_sprite(spr_welcome_bg, 0, xx, yy);
        // draw_sprite(spr_advisors,0,xx+16,yy+16);
        scr_image("advisor", 0, xx + 16, yy + 16, 310, 828);
        draw_set_halign(fa_left);
        draw_set_color(0);
        draw_set_font(fnt_40k_14);

        if (menu = 500) then draw_text_ext(xx + 370, yy + 72, string_hash_to_newline(string(temp[65])), -1, 660);
        if (menu = 501) then draw_text_ext(xx + 370, yy + 72, string_hash_to_newline(string(temp[66])), -1, 660);
        if (menu = 502) then draw_text_ext(xx + 370, yy + 72, string_hash_to_newline(string(temp[67])), -1, 660);
        if (menu = 503) then draw_text_ext(xx + 370, yy + 72, string_hash_to_newline(string(temp[68])), -1, 660);
        draw_set_halign(fa_center);
        if (temp[68] = "") then draw_text(xx + 702, yy + 695, string_hash_to_newline(string(menu - 499) + "/4 (Press Any Key)"));
        if (temp[68] != "") then draw_text(xx + 702, yy + 695, string_hash_to_newline(string(menu - 499) + "/4 (Press Any Key)"));
        draw_set_halign(fa_left);

    }

    if (menu = 1) and(managing = 0) {
        draw_set_alpha(1);
        draw_sprite(spr_rock_bg, 0, xx, yy);
        draw_set_font(fnt_40k_30b);
        draw_set_halign(fa_center);
        draw_set_color(c_gray);
        draw_text(xx + 800, yy + 74, string_hash_to_newline(string(global.chapter_name) + " Chapter Organization"));
    }
}