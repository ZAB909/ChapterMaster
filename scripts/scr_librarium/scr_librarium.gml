// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_librarium(){
	var blurp="";
	var recruitment_pace = [
        " is currently halted.",
        " is advancing sluggishly.",
        " is advancing slowly.",
        " is advancing moderately fast.",
        " is advancing fast.",
        " is advancing frenetically.",
        " is advancing as fast as possible."
    ];
    var xx = __view_get(e__VW.XView, 0) + 0;
	var yy = __view_get(e__VW.YView, 0) + 0;	
 	draw_sprite(spr_rock_bg, 0, xx, yy);

        draw_set_alpha(0.75);
        draw_set_color(0);
        draw_rectangle(xx + 326 + 16, yy + 66, xx + 887 + 16, yy + 818, 0);
        draw_set_alpha(1);
        draw_set_color(c_gray);
        draw_rectangle(xx + 326 + 16, yy + 66, xx + 887 + 16, yy + 818, 1); // Center librarium box
        draw_line(xx + 326 + 16, yy + 426, xx + 887 + 16, yy + 426);
        draw_set_alpha(0.75);
        draw_set_color(0);
        draw_rectangle(xx + 945, yy + 66, xx + 1580, yy + 818, 0);
        draw_set_alpha(1);
        draw_set_color(c_gray);
        draw_rectangle(xx + 945, yy + 66, xx + 1580, yy + 818, 1); // Right librarium box

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

        if (unused_artifacts = 0) { artif = "no unused artifacts.";}
        else if (unused_artifacts = 1) { artif = "one unused artifact.";}
        else if (unused_artifacts > 1) { artif = string(unused_artifacts) + " unused artifacts.";}

        // Greetings message
        if (menu_adept = 0) then draw_text_ext(xx + 336 + 16, yy + 130, string_hash_to_newline("Chapter Master " + string(obj_ini.name[0, 1]) + ", greetings.#I assume you've come for the report?  The Chapter currently possesses " + string(temp[36]) + " Epistolaries, " + string(temp[37]) + " Codiceries, and " + string(temp[38]) + " Lexicanum.  We are working to identify additional warp-sensitive brothers before they cause harm, and the training is " + string(blurp) + ".##We could likely speed up the identification and application of appropriate training, but we would need more resources...I don't suppose we can spare some?##Our Chapter has " + string(artif)), -1, 536);
        if (menu_adept = 1) then draw_text_ext(xx + 336 + 16, yy + 130, string_hash_to_newline("Your Chapter contains " + string(temp[36]) + " " + string(obj_ini.role[100, 17]) + "s, " + string(temp[37]) + " Codiceries, and " + string(temp[38]) + " Lexicanum.##Training of more " + string(obj_ini.role[100, 17]) + "s is " + string(blurp) + ".##Your chapter has " + string(artif)), -1, 536);

        draw_set_color(881503);
        draw_set_halign(fa_center);
        if (artifacts > 0) {
            var usey =0;
            for (i=0;i<30;i++){
                if (obj_ini.artifact[i]!="") then usey++;
                if (i==menu_artifact) then break;
            }
            draw_text(xx + 622, yy + 440, string_hash_to_newline("[Artifact " + string(usey) + " of " + string(artifacts) + "]"));
            var arrow = [xx+400,yy+437,xx+445,yy+461]
            if (point_and_click(arrow)){
                artifact_namer.allow_input=false;
            	identifiable=0;
                artifact_equip = new shutter_button();
                artifact_gift = new shutter_button();
                artifact_destroy = new shutter_button();  
                if  (menu_artifact>=1){     	
                	while (menu_artifact>=1){
                		menu_artifact--;
                        if (obj_ini.artifact[menu_artifact] != "") then break;
                	}
                }
                if (menu_artifact==0){
                    for (var i=29;i>0;i--){
                        if (obj_ini.artifact[i] != "") then menu_artifact=i;
                    }                    
            	}
            }
            arrow = [xx+790,yy+437,xx+832,yy+461]
            if (point_and_click(arrow)){
                artifact_namer.allow_input=false;
            	identifiable=0;
                artifact_equip = new shutter_button();
                artifact_gift = new shutter_button();
                artifact_destroy = new shutter_button();           	
                if (menu_artifact<30){
                    while(menu_artifact<30){
                        menu_artifact++;
                        if (obj_ini.artifact[menu_artifact] != "") then break;
                    }
                }

                if (menu_artifact==30){
                    for (var i=1;i<30;i++){
                         if (obj_ini.artifact[i] != "") then menu_artifact=i;
                    }
                }
            }

            var artifact_name = obj_ini.artifact_struct[menu_artifact].name;
            obj_ini.artifact_struct[menu_artifact].name = artifact_namer.draw(artifact_name); 
            draw_sprite(spr_arrow, 0, xx + 403, yy + 433);
            draw_sprite(spr_arrow, 1, xx + 795, yy + 433);
            // Artifact description box
            draw_set_color(c_black); 
            draw_rectangle(xx + 402, yy + 500, xx + 842, yy + 685, 0);
            draw_set_color(c_gray);
            draw_rectangle(xx + 402, yy + 500, xx + 842, yy + 685, 1); 

        }
        if (artifacts == 0){
            draw_text(xx + 622, yy + 440, string_hash_to_newline("[No Artifacts]"))
        } else {
        }
        draw_set_color(881503);
        draw_set_halign(fa_center);

        identifiable = 0;
        if (obj_ini.artifact_loc[menu_artifact] == obj_ini.home_name) then identifiable = 1;
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
                    if (mouse_check_button(mb_left)){
				        if (requisition>=150){
				            obj_ini.artifact_identified[menu_artifact]=0;
				            requisition-=150;
				            cooldown=8000;
				            identifiable=0;
				            audio_play_sound(snd_identify,-500,0);
				            audio_sound_gain(snd_identify,master_volume*effect_volume,0);
				        }                    	
                    }
                }

            }
            if (obj_ini.artifact_identified[menu_artifact] = 0) {
                draw_set_color(881503);

                artif_descr = obj_ini.artifact_struct[menu_artifact].description();
                tooltip = "";
                tooltip_stat1 = 0;
                tooltip_stat2 = 0;
                tooltip_stat3 = 0;
                tooltip_stat4 = 0;
                tooltip_other = "";
                var arti_data = gear_weapon_data("any",obj_ini.artifact[menu_artifact], "all", false, obj_ini.artifact_quality[menu_artifact]);

                var hue = 1;
                if (obj_ini.artifact[menu_artifact] = "Statue") then hue = 0;
                if (obj_ini.artifact[menu_artifact] = "Casket") then hue = 0;
                if (obj_ini.artifact[menu_artifact] = "Chalice") then hue = 0;
                if (obj_ini.artifact[menu_artifact] = "Robot") then hue = 0;
                if (obj_ini.artifact_equipped[menu_artifact]==true) then hue = 0;

                if (hue = 1) {
                	if(artifact_equip.draw_shutter(xx + 385, yy + 740, "EQUIP", 0.3, true)){
		                var pop=instance_create(0,0,obj_popup);
		                pop.type=8;
		                cooldown=8;
                	}
                } else {
                	artifact_equip.draw_shutter(xx + 385, yy + 740, "EQUIP", 0.3, false);
                }
                if (artifact_gift.draw_shutter(xx + 575, yy + 740, "GIFT", 0.3, true)){
		            var chick=0;
		            if (known[eFACTION.Imperium]>1) and (faction_defeated[2]==0) then chick=1;
		            if (known[eFACTION.Mechanicus]>1) and (faction_defeated[3]==0) then chick=1;
		            if (known[eFACTION.Inquisition]>1) and (faction_defeated[4]==0) then chick=1;
		            if (known[eFACTION.Ecclesiarchy]>1) and (faction_defeated[5]==0) then chick=1;
		            if (known[eFACTION.Eldar]>1) and (faction_defeated[6]==0) then chick=1;
		            if (known[eFACTION.Tau]>1) and (faction_defeated[8]==0) then chick=1;
		            if (chick!=0){
		                var pop=instance_create(0,0,obj_popup);
		                pop.type=9;
		                cooldown=8;
		            }                	
                }
                if (artifact_destroy.draw_shutter(xx + 765, yy + 740, "DESTROY", 0.3, true)){
					var fun=irandom(100)+1;
		            // Below here cleans up the artifacts
		            var i=menu_artifact;

		            if (menu_artifact==fest_display) then fest_display=0;

		            if (array_contains(obj_ini.artifact_tags[i],"Daemon")){
		                if (obj_ini.artifact_sid[i]>=500){
		                    var demonSummonChance=irandom(100)+1;

		                    if (demonSummonChance<=60) and (obj_ini.ship_carrying[obj_ini.artifact_sid[i]-500]>0){
		                        instance_create(0,0,obj_ncombat);
		                        obj_ncombat.battle_special="ship_demon";
		                        obj_ncombat.formation_set=1;
		                        obj_ncombat.enemy=10;
		                        obj_ncombat.battle_id=obj_ini.artifact_sid[i]-500;
		                        scr_ship_battle(obj_ini.artifact_sid[i]-500,999);
		                    }
		                }
		            }
		            for(var e=1; e<=500; e++){
		                if (obj_ini.artifact_tags[i]==obj_controller.recent_keyword[e]){
		                    obj_controller.recent_keyword[e]="";
		                    obj_controller.recent_type[e]="";
		                    obj_controller.recent_turn[e]=0;
		                    obj_controller.recent_number[e]=0;
		                    scr_recent("artifact_destroyed",obj_controller.recent_keyword,2);
		                    scr_recent("","",0);
		                }
		            }

		            obj_ini.artifact[i]="";
		            obj_ini.artifact_tags[i]=[];
		            obj_ini.artifact_identified[i]=0;
		            obj_ini.artifact_condition[i]=100;
		            obj_ini.artifact_loc[i]="";
		            obj_ini.artifact_sid[i]=0;
		            artifacts-=1;
		            cooldown=12;
		            if (menu_artifact>artifacts) then menu_artifact=artifacts;             	
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
            } else {
            	artifact_destroy.draw_shutter(xx + 765, yy + 740, "DESTROY", 0.3, false);
            	artifact_equip.draw_shutter(xx + 385, yy + 740, "EQUIP", 0.3, false);
            	artifact_gift.draw_shutter(xx + 575, yy + 740, "GIFT", 0.3, false);
            }
	        draw_set_halign(fa_center);
            draw_set_font(fnt_40k_14);
            draw_set_color(c_gray);
            draw_text_ext(xx + 622, yy + 504, string_hash_to_newline(string(artif_descr)), -1, 436);
            draw_set_font(fnt_40k_14b);
            draw_set_color(c_gray);
            var spack = string_height_ext(string_hash_to_newline(string(artif_descr)), -1, 436);
            draw_text_ext(xx + 622, yy + 508 + spack, string_hash_to_newline(string(tip2)), -1, 436);

            // identifiable=0;
        }
}