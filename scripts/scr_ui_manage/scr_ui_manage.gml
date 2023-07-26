function scr_ui_manage() {

	if (combat!=0) then exit;

	// This is the draw script for showing the main management screen or individual company screens

	if (menu=1) and (managing>0){
	    var xx, yy, bb, img;
	    bb="";img=0;
	    xx=__view_get( e__VW.XView, 0 )+0;
	    yy=__view_get( e__VW.YView, 0 )+0;

	    // BG
    
	    draw_set_alpha(1);
	    draw_sprite(spr_rock_bg,0,xx,yy);
	    draw_set_font(fnt_40k_30b);
	    draw_set_halign(fa_center);
	    draw_set_color(c_gray);// 38144
    
	    var c,fx,skin;c=0;fx="";skin=obj_ini.skin_color;
	    if (managing<=10) then c=managing;
	    if (managing>20) then c=managing-10;
    
	    if (managing=1) then fx="1st Company";
	    if (managing=2) then fx="2nd Company";
	    if (managing=3) then fx="3rd Company";
	    if ((managing>=4) and (managing<11)) or (managing>20) then fx=string(c)+"th Company";
    
	    if (managing=11) then fx="Headquarters";
	    if (managing=12) then fx="Apothecarion";
	    if (managing=13) then fx="Librarium";
	    if (managing=14) then fx="Reclusium";
	    if (managing=15) then fx="Armamentarium";
    
    
    
    
    
	    draw_text(xx+800,yy+74,string_hash_to_newline(string(global.chapter_name)+" "+string(fx)));
    
	    if (managing<=10){
	        var bar_wid;bar_wid=0;
	        draw_set_alpha(0.25);
	        if (obj_ini.company_title[managing]!="") then bar_wid=max(400,string_width(string_hash_to_newline(obj_ini.company_title[managing])));
	        if (obj_ini.company_title[managing]="") then bar_wid=400;
        
	        draw_rectangle(xx+800-(bar_wid/2),yy+108,xx+800+(bar_wid/2),yy+100+string_height(string_hash_to_newline("LOL")),1);
	        obj_cursor.image_index=0;
        
	        if (scr_hit(xx+800-(bar_wid/2),yy+108,xx+800+(bar_wid/2),yy+100+string_height(string_hash_to_newline("LOL")))=false) and (mouse_left=1) and (cooldown<=0) then text_bar=0;
	        if (scr_hit(xx+800-(bar_wid/2),yy+108,xx+800+(bar_wid/2),yy+100+string_height(string_hash_to_newline("LOL")))=true){
	            obj_cursor.image_index=2;
            
	            if (cooldown<=0) and (mouse_left=1) and (text_bar=0){
	                cooldown=8000;text_bar=1;keyboard_string=obj_ini.company_title[managing];
	            }
            
	        }
	        draw_set_alpha(1);
        
	        if (obj_ini.company_title[managing]!="") or (text_bar>0){draw_set_font(fnt_fancy);
	            if (text_bar=0) or (text_bar>31) then draw_text(xx+800,yy+110,string_hash_to_newline("''"+string(obj_ini.company_title[managing])+"'' "));
	            if (text_bar>0) and (text_bar<=31) then draw_text(xx+800,yy+110,string_hash_to_newline("''"+string(obj_ini.company_title[managing])+"|''"));
	        }
	    }
    
    
	    // var we;we=string_width(string(global.chapter_name)+" "+string(fx))/2;
    
	    draw_sprite_ext(spr_arrow,0,xx+25,yy+70,2,2,0,c_white,1);// Back
	    draw_sprite_ext(spr_arrow,0,xx+429,yy+70,2,2,0,c_white,1);// Left
	    draw_sprite_ext(spr_arrow,1,xx+1110,yy+70,2,2,0,c_white,1);// Right
    
	    draw_set_color(0);
	    draw_rectangle(xx+1005,yy+142,xx+1576,yy+957,0);
    
	    draw_set_color(c_gray);
	    draw_line(xx+1005,yy+519,xx+1576,yy+519);
    
	    draw_set_font(fnt_40k_14b);
    
	    var cn;cn=obj_controller;
	    if (instance_exists(cn)){
	        if (cn.temp[101]!="") and (cn.temp[100]="1"){
	            ui_arm[1]=true;ui_arm[2]=true;
	            ui_xmod[1]=0;ui_xmod[2]=0;
	            ui_ymod[1]=0;ui_ymod[2]=0;
	            ui_weapon[1]=spr_weapon_blank;ui_weapon[2]=spr_weapon_blank;
	            ui_back=true;ui_force_both=false;
	            var cpec;cspec=obj_ini.col_special;
            
	            var terg,armor_sprite,show1,show2;terg=0;armor_sprite=spr_weapon_blank;
	            var jump,dev,hood,skull,arm,halo,braz,slow,brothers;jump=0;dev=0;hood=0;skull=0;arm=0;halo=0;braz=0;slow=0;brothers=-5;
            
	            var show_wep1,show_wep2,show_arm,show_gear,show_mobi;
	            /*show_wep1=string_pos("&",cn.temp[108]);
	            show_wep2=string_pos("&",cn.temp[110]);
	            show_arm=string_pos("&",cn.temp[102]);
	            show_gear=string_pos("&",cn.temp[104]);
	            show_mobi=string_pos("&",cn.temp[106]);*/
	            show_wep1=string_replace(cn.temp[108],"Arti. ","");
	            show_wep2=string_replace(cn.temp[110],"Arti. ","");
	            show_arm=string_replace(cn.temp[102],"Arti. ","");
	            show_gear=string_replace(cn.temp[104],"Arti. ","");
	            show_mobi=string_replace(cn.temp[106],"Arti. ","");
            
	            if (ui_specialist=7) or (ui_specialist=1) or (ui_specialist=111){var o;o=0;repeat(4){o+=1;if (obj_ini.adv[o]="Reverent Guardians") then braz=1;}}
	            if (show_gear="Psychic Hood") then hood=-50;
            
	            if (show_gear="Iron Halo") then halo=1;
            
	            // if (string_count(obj_ini.role[100,14],cn.temp[101])>0) or (string_count("Master of Sanctity",cn.temp[101])>0) and (global.chapter_name!="Iron Hands") then skull=-50;
	            if (ui_specialist=1) and (global.chapter_name!="Iron Hands") then skull=-50;
            
	            if (show_gear="Servo Arms") or (show_gear="Master Servo Arms"){
	                var mas;
	                // mas=string_count("Master",cn.temp[104]);
	                if (show_gear="Servo Arms") then mas=0;
	                if (show_gear="Master Servo Arms") then mas=1;
                
	                if (mas=0){
	                    if (cspec=0) or (cspec>1) then arm=1;if (cspec=1) then arm=0;
	                }
	                if (mas>0){
	                    if (cspec=0) then arm=10;if (cspec=1) then arm=11;if (cspec>=2) then arm=12;
	                }
	            }
            
            
            
	            // if (terg>0) then ui_back=false;
            
	            if (show_mobi="Jump Pack"){ui_back=false;jump=1;}
	            if (string_count(obj_ini.role[100,9],cn.temp[101])>0){ui_back=false;dev=1;}
	            if (show_arm="Terminator Armor"){ui_back=false;terg=1;}
	            if (show_arm="Tartaros"){ui_back=false;terg=2;}
	            if (show_arm="Dreadnought"){ui_back=false;terg=5;}
	            if (terg>0) then ui_back=false;
            
            
            
            
            
            
	            if (cn.temp[108]!="") and (terg<5){
	                scr_ui_display_weapons(1,terg,cn.temp[108]);
	            }
	            if (cn.temp[110]!="") and (terg<5) and (ui_force_both=false){
	                scr_ui_display_weapons(2,terg,cn.temp[110]);
	            }
            
	            if (ui_twoh[1]=true) and (ui_arm[1]=false) then ui_arm[2]=false;
	            if (ui_twoh[2]=true) and (ui_arm[2]=false) then ui_arm[1]=false;
            
	            draw_set_color(38144);draw_rectangle(xx+1208,yy+178,xx+1374,yy+409,0);
            
	            if( shader_is_compiled(sReplaceColor)){
	                shader_set(sReplaceColor);
                
	                shader_set_uniform_f(colour_to_find1, sourceR1,sourceG1,sourceB1 );       
	                shader_set_uniform_f(colour_to_set1, targetR1,targetG1,targetB1 );
	                shader_set_uniform_f(colour_to_find2, sourceR2,sourceG2,sourceB2 );       
	                shader_set_uniform_f(colour_to_set2, targetR2,targetG2,targetB2 );
	                shader_set_uniform_f(colour_to_find3, sourceR3,sourceG3,sourceB3 );       
	                shader_set_uniform_f(colour_to_set3, targetR3,targetG3,targetB3 );
	                shader_set_uniform_f(colour_to_find4, sourceR4,sourceG4,sourceB4 );       
	                shader_set_uniform_f(colour_to_set4, targetR4,targetG4,targetB4 );
	                shader_set_uniform_f(colour_to_find5, sourceR5,sourceG5,sourceB5 );
	                shader_set_uniform_f(colour_to_set5, targetR5,targetG5,targetB5 );
	                shader_set_uniform_f(colour_to_find6, sourceR6,sourceG6,sourceB6 );
	                shader_set_uniform_f(colour_to_set6, targetR6,targetG6,targetB6 );
	                shader_set_uniform_f(colour_to_find7, sourceR7,sourceG7,sourceB7 );
	                shader_set_uniform_f(colour_to_set7, targetR7,targetG7,targetB7 );
                
	                // Special specialist stuff here
	                /*
	                ui_specialist=0;
	                if (ma_role[sel]=obj_ini.role[100,14]) then ui_specialist=1;// Chaplain
	                if (ma_role[sel]=obj_ini.role[100,15]) then ui_specialist=3;// Apothecary
	                if (ma_role[sel]=obj_ini.role[100,15]) and ((global.chapter_name="Blood Angels") or (obj_ini.progenitor=5)) then ui_specialist=4;// Sanguinary
	                if (ma_role[sel]=obj_ini.role[100,16]) then ui_specialist=5;// Techmarine
	                if (ma_role[sel]=obj_ini.role[100,17]) then ui_specialist=7;// Librarian
	                */
                
	                ttrim=trim;var cpec;cspec=obj_ini.col_special;
	                if (ui_specialist=1) or ((ui_specialist=3) and (global.chapter_name="Space Wolves")){// Chaplain
	                    shader_set_uniform_f(colour_to_set1, 30/255,30/255,30/255);
	                    shader_set_uniform_f(colour_to_set2, 30/255,30/255,30/255);
	                    // ttrim=0;
	                    cspec=0;
	                }
	                if (ui_specialist=3) and (global.chapter_name!="Space Wolves"){// Apothecary
	                    shader_set_uniform_f(colour_to_set1, 255/255,255/255,255/255);
	                    shader_set_uniform_f(colour_to_set2, 255/255,255/255,255/255);
	                    ttrim=0;cspec=0;
	                }
	                if (ui_specialist=5){// Techmarine
	                    shader_set_uniform_f(colour_to_set1, 150/255,0/255,0/255);
	                    shader_set_uniform_f(colour_to_set2, 150/255,0/255,0/255);
	                    // pauldron
	                    shader_set_uniform_f(colour_to_set4, 0/255,70/255,0/255);
	                    shader_set_uniform_f(colour_to_set5, 200/255,200/255,200/255);
	                    ttrim=1;cspec=0;
	                }
	                if (ui_specialist=15){// Death Company
	                    shader_set_uniform_f(colour_to_set1, 30/255,30/255,30/255);
	                    shader_set_uniform_f(colour_to_set2, 30/255,30/255,30/255);
	                    shader_set_uniform_f(colour_to_set3, 30/255,30/255,30/255);
	                    shader_set_uniform_f(colour_to_set4, 124/255,0/255,0/255);// Lens
	                    shader_set_uniform_f(colour_to_set5, 30/255,30/255,30/255);
	                    shader_set_uniform_f(colour_to_set6, 30/255,30/255,30/255);
	                    shader_set_uniform_f(colour_to_set7, 124/255,0/255,0/255);// Weapon
	                    ttrim=0;cspec=0;
	                }
                
	                if (ui_coloring="bone"){// Deathwing
	                    shader_set_uniform_f(colour_to_set1, 255/255,217/255,193/255);
	                    shader_set_uniform_f(colour_to_set2, 255/255,217/255,193/255);
	                    shader_set_uniform_f(colour_to_set3, 255/255,217/255,193/255);
	                    shader_set_uniform_f(colour_to_set5, 255/255,217/255,193/255);
	                    shader_set_uniform_f(colour_to_set6, 255/255,217/255,193/255);
	                    ttrim=0;cspec=0;
	                }
	                if (ui_coloring="gold"){// Blood Angels
	                    shader_set_uniform_f(colour_to_set1, 166/255,129/255,0/255);
	                    shader_set_uniform_f(colour_to_set2, 166/255,129/255,0/255);
	                    shader_set_uniform_f(colour_to_set3, 166/255,129/255,0/255);
	                    shader_set_uniform_f(colour_to_set5, 166/255,129/255,0/255);
	                    shader_set_uniform_f(colour_to_set6, 166/255,129/255,0/255);
	                    ttrim=0;cspec=0;
	                }
                
                
	                /*
	                main
	                secondary
	                pauldron
	                lens
	                trim
	                pauldron2
	                weapon
	                */
                
                
                
	                //Rejoice!
	                // draw_sprite(spr_marine_base,img,xx+1208,yy+178);
                
                
	                var clothing_style;clothing_style=3;                    
	                if (global.chapter_name="Dark Angels") or (obj_ini.progenitor=1) then clothing_style=0;
	                if (global.chapter_name="White Scars") or (obj_ini.progenitor=2) then clothing_style=1; 
	                if (global.chapter_name="Space Wolves") or (obj_ini.progenitor=3) then clothing_style=2;
	                if (global.chapter_name="Imperial Fists") or (obj_ini.progenitor=4) then clothing_style=0;
	                if (global.chapter_name="Iron Hands") or (obj_ini.progenitor=6) then clothing_style=0;
	                if (global.chapter_name="Salamanders") or (obj_ini.progenitor=8) then clothing_style=4;
	                if (global.chapter_name="Raven Guard") or (obj_ini.progenitor=9) then clothing_style=0;
	                if (global.chapter_name="Doom Benefactors") then clothing_style=4;
                
	                // Determine Sprite
	                if (skull=-50) then skull=1;
                
	                if (temp[102]!=""){
	                    var o,yep;o=0;yep=0;repeat(4){o+=1;if (obj_ini.adv[o]="Slow and Purposeful") then slow=1;}
	                    if (ui_specialist=5){var o,yep;o=0;yep=0;repeat(4){o+=1;if (obj_ini.adv[o]="Tech-Brothers") then brothers=0;}}
	                }
                
	                if (temp[102]="") then armor_sprite=spr_weapon_blank;
	                if (temp[102]="Scout Armor"){if (slow>0) then slow=10;armor_sprite=spr_scout_colors;if (hood=-50) then hood=0;}
	                if (temp[102]="MK3 Iron Armor"){if (slow>0) then slow=13;if (brothers>-5) then brothers=3;armor_sprite=spr_iron2_colors;if (hood=-50) then hood=5;}
	                if (temp[102]="MK4 Maximus"){if (slow>0) then slow=13;if (brothers>-5) then brothers=3;armor_sprite=spr_maximus_colors;if (hood=-50) then hood=6;}
	                if (temp[102]="MK6 Corvus"){if (slow>0) then slow=13;if (brothers>-5) then brothers=2;armor_sprite=spr_beakie_colors;if (hood=-50) then hood=3;}
	                if (temp[102]="MK7 Aquila") or (temp[102]="Power Armor"){if (brothers>-5) then brothers=0;if (slow>0) then slow=13;armor_sprite=spr_aquila_colors;if (hood=-50) then hood=1;}
	                if (temp[102]="MK8 Errant"){if (slow>0) then slow=13;if (brothers>-5) then brothers=0;armor_sprite=spr_errant_colors;if (hood=-50) then hood=4;}
	                if (show_arm="Artificer Armor"){if (slow>0) then slow=13;if (brothers>-5) then brothers=1;armor_sprite=spr_artificer_colors;if (hood=-50) then hood=2;}
	                if (temp[102]="Tartaros"){armor_sprite=spr_tartaros2_colors;if (brothers>-5) then brothers=4;if (hood=-50) then hood=8;if (skull=1) then skull=3;}
	                if (show_arm="Terminator Armor"){armor_sprite=spr_terminator2_colors;if (brothers>-5) then brothers=5;if (hood=-50) then hood=9;if (skull=1) then skull=2;}
	                if (show_arm="Dreadnought") then armor_sprite=spr_dread_colors;
                
	                if (armor_sprite=spr_weapon_blank) and (temp[102]!=""){
	                    if (string_count("Power Armor",temp[102])>0){if (slow>0) then slow=13;if (brothers>-5) then brothers=0;armor_sprite=spr_aquila_colors;if (hood=-50) then hood=1;}
	                    if (string_count("Artifi",temp[102])>0){if (slow>0) then slow=13;if (brothers>-5) then brothers=1;armor_sprite=spr_artificer_colors;if (hood=-50) then hood=2;}
	                    if (string_count("Termi",temp[102])>0){if (brothers>-5) then brothers=5;armor_sprite=spr_terminator2_colors;if (hood=-50) then hood=9;if (skull=1) then skull=2;}
	                    if (string_count("Dread",temp[102])>0) then armor_sprite=spr_dread_colors;
	                }
	                /*if (show_arm!=0){
	                    if (string_count("Power Armor",temp[102])>0){if (slow>0) then slow=13;if (brothers>-5) then brothers=0;armor_sprite=spr_aquila_colors;if (hood=-50) then hood=1;}
	                    if (string_count("Artifi",temp[102])>0){if (slow>0) then slow=13;if (brothers>-5) then brothers=1;armor_sprite=spr_artificer_colors;if (hood=-50) then hood=2;}
	                    if (string_count("Termi",temp[102])>0){if (brothers>-5) then brothers=5;armor_sprite=spr_terminator2_colors;if (hood=-50) then hood=9;if (skull=1) then skull=2;}
	                    if (string_count("Dread",temp[102])>0) then armor_sprite=spr_dread_colors;
	                }*/
                
	                // Draw servo arms
	                if (arm>0) and (temp[102]!=""){
	                    if (arm<10) then draw_sprite(spr_pack_arm,arm,xx+1208,yy+178);
	                    if (arm>=10) then draw_sprite(spr_pack_arms,arm-10,xx+1208,yy+178);
	                }
                
	                // Draw the fixed upper arms for Terminators and Tartaros
	                if (terg=1){
	                    if (fix_left>0) then draw_sprite(spr_termi_wep_fix,0,xx+1208,yy+178);
	                    if (fix_right>0){
	                        if (cspec<=1) then draw_sprite(spr_termi_wep_fix,2,xx+1208,yy+178);
	                        if (cspec>=2) then draw_sprite(spr_termi_wep_fix,3,xx+1208,yy+178);
	                    }
	                }
	                if (terg=2){
	                    if (fix_left>0) then draw_sprite(spr_tartaros_wep_fix,0,xx+1208,yy+178);
	                    if (fix_right>0){
	                        if (cspec<=1) then draw_sprite(spr_tartaros_wep_fix,2,xx+1208,yy+178);
	                        if (cspec>=2) then draw_sprite(spr_tartaros_wep_fix,3,xx+1208,yy+178);
	                    }
	                }
                
	                // Draw the lights
	                if (ui_specialist=3) and (temp[102]!=""){
	                    draw_sprite(spr_gear_apoth,0,xx+1208,yy+178);
	                }
                
	                // Draw the backpack
	                if (ui_back=true) and (terg<5) and (temp[102]!=""){
	                    if (cspec=0) then draw_sprite(armor_sprite,10,xx+1208,yy+178);
	                    if (cspec=1) then draw_sprite(armor_sprite,11,xx+1208,yy+178);
	                    if (cspec>=2) then draw_sprite(armor_sprite,12,xx+1208,yy+178);
	                }
	                if (ui_back=false) and (terg<5) and (temp[102]!=""){
	                    if (jump=1){
	                        if (cspec=0) then draw_sprite(spr_pack_jump,0,xx+1208,yy+178);
	                        if (cspec=1) then draw_sprite(spr_pack_jump,1,xx+1208,yy+178);
	                        if (cspec>=2) then draw_sprite(spr_pack_jump,2,xx+1208,yy+178);
	                    }
	                    if (dev=1){
	                        if (cspec=0) then draw_sprite(spr_pack_devastator,0,xx+1208,yy+178);
	                        if (cspec=1) then draw_sprite(spr_pack_devastator,1,xx+1208,yy+178);
	                        if (cspec>=2) then draw_sprite(spr_pack_devastator,2,xx+1208,yy+178);
	                    }
	                }
                
	                if (braz=1) and (cn.temp[102]!="") and (blandify=0){
	                    if (terg=0) then draw_sprite(spr_pack_brazier,0,xx+1208,yy+178);
	                    if (terg>0) then draw_sprite(spr_pack_brazier,1,xx+1206,yy+178);
	                }
                
	                // Draw the Iron Halo
	                if (halo=1) and (temp[102]!=""){var st;st=false;
	                    if (hood=0) and (terg<1) and (temp[102]!="") and (ui_specialist=14) and ((obj_ini.progenitor=5) or (global.chapter_name="Blood Angels")) then st=true;
	                    if (st=false) then draw_sprite(spr_gear_halo,0,xx+1208,yy+178);
	                }
                
	                // Weapons for below arms
	                if (ui_weapon[1]!=0) and (sprite_exists(ui_weapon[1])) and (ui_above[1]=false) and (fix_left<8){
	                    if (ui_twoh[1]=false) and (ui_twoh[2]=false) then draw_sprite(ui_weapon[1],0,xx+1208+ui_xmod[1],yy+178+ui_ymod[1]);
	                    if (ui_twoh[1]=true){
	                        if (cspec<=1) then draw_sprite(ui_weapon[1],0,xx+1208+ui_xmod[1],yy+178+ui_ymod[1]);
	                        if (cspec>=2) then draw_sprite(ui_weapon[1],3,xx+1208+ui_xmod[1],yy+178+ui_ymod[1]);
	                        if (ui_force_both=true){
	                            if (cspec<=1) then draw_sprite(ui_weapon[1],0,xx+1208+ui_xmod[1],yy+178+ui_ymod[1]);
	                            if (cspec>=2) then draw_sprite(ui_weapon[1],1,xx+1208+ui_xmod[1],yy+178+ui_ymod[1]);
	                        }
	                    }
	                }
	                if (ui_weapon[2]!=0) and (ui_above[2]=false) and (sprite_exists(ui_weapon[2])) and ((ui_twoh[1]=false) or (ui_force_both=true)) and (fix_right<8){
	                    if (ui_spec[2]=false) then draw_sprite(ui_weapon[2],1,xx+1208+ui_xmod[2],yy+178+ui_ymod[2]);
	                    if (ui_spec[2]=true){
	                        if (cspec<=1) then draw_sprite(ui_weapon[2],2,xx+1208+ui_xmod[2],yy+178+ui_ymod[2]);
	                        if (cspec>=2) then draw_sprite(ui_weapon[2],3,xx+1208+ui_xmod[2],yy+178+ui_ymod[2]);
	                    }
	                }
                
	                if (temp[102]="") or (temp[102]="None") or (temp[102]="(None)"){
	                    if (ui_specialist=111) and (global.chapter_name="Doom Benefactors") then skin=6;
                    
	                    draw_sprite(spr_marine_base,skin,xx+1208,yy+178);
                    
	                    if (skin!=6) then draw_sprite(spr_clothing_colors,clothing_style,xx+1208,yy+178);
	                }
	                if (temp[102]="Scout Armor"){
	                    draw_sprite(spr_marine_base,skin,xx+1208,yy+178);
	                    draw_sprite(spr_marine_base,5,xx+1208,yy+178);// Kind of crops the 'skin tone' pixels below the scout ones
	                    draw_sprite(armor_sprite,cspec,xx+1208,yy+178);
	                    draw_sprite(spr_facial_colors,clothing_style,xx+1208,yy+178);
	                }
	                if (temp[102]="MK3 Iron Armor"){
	                    draw_sprite(armor_sprite,col_special,xx+1208,yy+178);
	                    if (ttrim=0) and (cspec<=1) then draw_sprite(spr_iron2_colors,4,xx+1208,yy+178);
	                    if (ttrim=0) and (cspec>=2) then draw_sprite(spr_iron2_colors,5,xx+1208,yy+178);
	                }
	                if (temp[102]="MK4 Maximus"){
	                    draw_sprite(armor_sprite,cspec,xx+1208,yy+178);
	                    if (ttrim=0) and (cspec<=1) then draw_sprite(spr_maximus_colors,4,xx+1208,yy+178);
	                    if (ttrim=0) and (cspec>=2) then draw_sprite(spr_maximus_colors,5,xx+1208,yy+178);
	                }
	                if (temp[102]="MK6 Corvus"){
	                    draw_sprite(armor_sprite,cspec,xx+1208,yy+178);
	                    if (ttrim=0) and (cspec<=1) then draw_sprite(spr_beakie_colors,4,xx+1208,yy+178);
	                    if (ttrim=0) and (cspec>=2) then draw_sprite(spr_beakie_colors,5,xx+1208,yy+178);
	                }
	                if (temp[102]="MK7 Aquila") or (show_arm="Power Armor"){
	                    draw_sprite(armor_sprite,cspec,xx+1208,yy+178);
	                    if (ttrim=0) and (cspec<=1) then draw_sprite(spr_aquila_colors,4,xx+1208,yy+178);
	                    if (ttrim=0) and (cspec>=2) then draw_sprite(spr_aquila_colors,5,xx+1208,yy+178);
	                }
	                if (temp[102]="MK8 Errant"){
	                    draw_sprite(armor_sprite,cspec,xx+1208,yy+178);
	                    if (ttrim=0) and (cspec<=1) then draw_sprite(spr_errant_colors,4,xx+1208,yy+178);
	                    if (ttrim=0) and (cspec>=2) then draw_sprite(spr_errant_colors,5,xx+1208,yy+178);
	                }
	                if (show_arm="Artificer Armor"){
	                    draw_sprite(armor_sprite,cspec,xx+1208,yy+178);
	                    if (ttrim=0) and (cspec<=1) then draw_sprite(spr_artificer_colors,4,xx+1208,yy+178);
	                    if (ttrim=0) and (cspec>=2) then draw_sprite(spr_artificer_colors,5,xx+1208,yy+178);
	                }
	                if (terg=2){
	                    draw_sprite(armor_sprite,cspec,xx+1208,yy+178);
	                    if (ttrim=0) and (cspec<=1) then draw_sprite(spr_tartaros2_colors,4,xx+1208,yy+178);
	                    if (ttrim=0) and (cspec>=2) then draw_sprite(spr_tartaros2_colors,5,xx+1208,yy+178);
	                }
	                if (terg=1){
	                    draw_sprite(armor_sprite,cspec,xx+1208,yy+178);
	                    if (ttrim=0) and (cspec<=1) then draw_sprite(spr_terminator2_colors,4,xx+1208,yy+178);
	                    if (ttrim=0) and (cspec>=2) then draw_sprite(spr_terminator2_colors,5,xx+1208,yy+178);
	                }
	                if (terg=5){
	                    draw_sprite(spr_dread_colors,cspec,xx+1208,yy+178);
	                }
                
	                if (slow>=10) and (blandify=0) then draw_sprite(armor_sprite,slow,xx+1208,yy+178);// Slow and Purposeful battle damage
	                if (brothers>=0) and (blandify=0) then draw_sprite(spr_gear_techb,brothers,xx+1208,yy+178);// Tech-Brothers bling
                
                
	                // This draws the arms
	                if (show_arm!="Dreadnought") and (cspec<=1) and (temp[102]!=""){
	                    if (ui_arm[1]=true) then draw_sprite(armor_sprite,6,xx+1208,yy+178);if (ui_arm[2]=true) then draw_sprite(armor_sprite,8,xx+1208,yy+178);
	                }
	                if (show_arm!="Dreadnought") and (cspec>=2) and (temp[102]!=""){
	                    if (ui_arm[1]=true) then draw_sprite(armor_sprite,6,xx+1208,yy+178);if (ui_arm[2]=true) then draw_sprite(armor_sprite,9,xx+1208,yy+178);
	                }
                
	                // Apothecary Lens
	                if (ui_specialist=3) and (temp[102]!=""){
	                    if (terg=2) then draw_sprite(spr_gear_apoth,1,xx+1208-2,yy+181);// was 178-4 with old tartar
	                    if (terg=1) then draw_sprite(spr_gear_apoth,1,xx+1208-4,yy+182);
	                    if (terg!=1) and (terg!=2) then draw_sprite(spr_gear_apoth,1,xx+1208,yy+178);
	                }
                
	                // Hood
	                if (hood>0) and (temp[102]!=""){
	                    var o,yep;o=0;yep=0;repeat(4){o+=1;if (obj_ini.adv[o]="Daemon Binders") and (blandify=0) then yep=1;}
	                    if (yep=0) or (hood>=7){
	                        if (obj_ini.main_color=obj_ini.secondary_color) then draw_sprite(spr_gear_hood1,hood,xx+1208,yy+178);
	                        if (obj_ini.main_color!=obj_ini.secondary_color) then draw_sprite(spr_gear_hood3,hood,xx+1208,yy+178);
	                    }
	                    if (yep=1) and (hood<7){
	                        if (ttrim=1) then draw_sprite(spr_gear_hood2,0,xx+1208,yy+178);
	                        if (ttrim=0) then draw_sprite(spr_gear_hood2,1,xx+1208,yy+178);
	                    }
	                }
	                if (skull>0) and (temp[102]!=""){
	                    if (terg!=2) and (terg!=1) then draw_sprite(spr_gear_chap,skull,xx+1208,yy+178);
	                    if (terg=2) then draw_sprite(spr_gear_chap,skull,xx+1210,yy+178);
	                    if (terg=1) then draw_sprite(spr_gear_chap,skull,xx+1208,yy+184);
	                }
                
	                // Honor Guard Helm
	                if (hood=0) and (terg<1) and (temp[102]!="") and (ui_specialist=14){
	                    var helm_ii,o,yep;helm_ii=0;
	                    if (obj_ini.progenitor=7) or (global.chapter_name="Ultramarines") then helm_ii=1;
	                    if (obj_ini.progenitor=5) or (global.chapter_name="Blood Angels") then helm_ii=5;
	                    o=0;yep=0;repeat(4){o+=1;if (obj_ini.adv[o]="Tech-Brothers") then yep=1;}if (yep=1) then helm_ii=2;
	                    o=0;yep=0;repeat(4){o+=1;if (obj_ini.dis[o]="Never Forgive") then yep=1;}if (yep=1) or (obj_ini.progenitor=1) then helm_ii=3;
	                    o=0;yep=0;repeat(4){o+=1;if (obj_ini.adv[o]="Reverent Guardians") then yep=1;}if (yep=1) then helm_ii=4;
	                    draw_sprite(spr_honor_helm,helm_ii,xx+1210,yy+178);
	                }
                
	                // Weapons for above arms
	                if (ui_weapon[1]!=0) and (sprite_exists(ui_weapon[1])) and (ui_above[1]=true) and (fix_left<8){
	                    if (ui_twoh[1]=false) and (ui_twoh[2]=false) then draw_sprite(ui_weapon[1],0,xx+1208+ui_xmod[1],yy+178+ui_ymod[1]);
	                    if (ui_twoh[1]=true){
	                        if (cspec<=1) then draw_sprite(ui_weapon[1],0,xx+1208+ui_xmod[1],yy+178+ui_ymod[1]);
	                        if (cspec>=2) then draw_sprite(ui_weapon[1],3,xx+1208+ui_xmod[1],yy+178+ui_ymod[1]);
	                        if (ui_force_both=true){
	                            if (cspec<=1) then draw_sprite(ui_weapon[1],0,xx+1208+ui_xmod[1],yy+178+ui_ymod[1]);
	                            if (cspec>=2) then draw_sprite(ui_weapon[1],1,xx+1208+ui_xmod[1],yy+178+ui_ymod[1]);
	                        }
	                    }
	                }
	                if (ui_weapon[2]!=0) and (ui_above[2]=true) and (sprite_exists(ui_weapon[2])) and ((ui_twoh[1]=false) or (ui_force_both=true)) and (fix_right<8){
	                    if (ui_spec[2]=false) then draw_sprite(ui_weapon[2],1,xx+1208+ui_xmod[2],yy+178+ui_ymod[2]);
	                    if (ui_spec[2]=true){
	                        if (cspec<=1) then draw_sprite(ui_weapon[2],2,xx+1208+ui_xmod[2],yy+178+ui_ymod[2]);
	                        if (cspec>=2) then draw_sprite(ui_weapon[2],3,xx+1208+ui_xmod[2],yy+178+ui_ymod[2]);
	                    }
	                }
                
	                // New powerfists for termi/tartaros
	                if (ui_weapon[1]!=0) and (fix_left=8) then draw_sprite(spr_weapon_powfist3,0,xx+1208+ui_xmod[1],yy+178+ui_ymod[1]);
	                if (ui_weapon[2]!=0) and (fix_right=8) then draw_sprite(spr_weapon_powfist3,1,xx+1208+ui_xmod[2],yy+178+ui_ymod[2]);
	                if (ui_weapon[1]!=0) and (fix_left=8.1) then draw_sprite(spr_weapon_lightning2,0,xx+1208+ui_xmod[1],yy+178+ui_ymod[1]);
	                if (ui_weapon[2]!=0) and (fix_right=8.1) then draw_sprite(spr_weapon_lightning2,1,xx+1208+ui_xmod[2],yy+178+ui_ymod[2]);
                
	                // Draw the fixed upper hands for Terminators or Tartaros
	                if (terg=1){
	                    if (fix_left>0) and (fix_left!=2) and (fix_left!=4) and (fix_left<8) then draw_sprite(spr_termi_wep_fix,4,xx+1208,yy+178);
	                    if (fix_right>0) and (fix_right!=2) and (fix_right!=4) and (fix_right<8){
	                        if (cspec<=1) then draw_sprite(spr_termi_wep_fix,6,xx+1208,yy+178);
	                        if (cspec>=2) then draw_sprite(spr_termi_wep_fix,7,xx+1208,yy+178);
	                    }
	                }
	                if (terg=2){
	                    if (fix_left>0) and (fix_left!=2) and (fix_left!=4) and (fix_left<8) then draw_sprite(spr_tartaros_wep_fix,4,xx+1208,yy+178);
	                    if (fix_right>0) and (fix_right!=2) and (fix_right!=4) and (fix_right<8){
	                        if (cspec<=1) then draw_sprite(spr_tartaros_wep_fix,6,xx+1208,yy+178);
	                        if (cspec>=2) then draw_sprite(spr_tartaros_wep_fix,7,xx+1208,yy+178);
	                    }
	                }
                
                
	                // if (braz=1) then draw_sprite(spr_pack_brazier,1,xx+1208,yy+178);
                
                
                
	                shader_reset();
                
	            }else{
	                draw_set_color(c_gray);
	                draw_text(xx+1208,yy+178,string_hash_to_newline("Color swap shader#did not compile"));
	            }
            
	            // if (cn.temp[100]!="1"){draw_set_color(38144);draw_rectangle(xx+1208,yy+178,xx+1374,yy+409,0);}
	        }
        
	        draw_set_alpha(1);
        
	        if (cn.temp[101]!=""){
	            if (cn.temp[100]="3"){
	                if (string_count("Techpriest",cn.temp[101])>0) then draw_sprite(spr_techpriest,0,xx+1208,yy+178);
	            }
	            if (cn.temp[100]="4"){
	                if (string_count("Crusader",cn.temp[101])>0) then draw_sprite(spr_crusader,0,xx+1208,yy+178);
	            }
	            if (cn.temp[100]="5"){
	                if (string_count("Sister of Battle",cn.temp[101])>0) then draw_sprite(spr_sororitas,0,xx+1208,yy+178);
	                if (string_count("Sister Hospitaler",cn.temp[101])>0) then draw_sprite(spr_sororitas,1,xx+1208,yy+178);
	            }
	            if (cn.temp[100]="6"){
	                if (string_count("Ranger",cn.temp[101])>0) then draw_sprite(spr_eldar_hire,0,xx+1208,yy+178);
	                if (string_count("Howling Banshee",cn.temp[101])>0) then draw_sprite(spr_eldar_hire,1,xx+1208,yy+178);
	            }
	        }
        
        
        
	        // Crop anything sticking out of the display
	        draw_set_color(0);
	        draw_rectangle(xx+1178,yy+168,xx+1208,yy+419,0);// Left
	        draw_rectangle(xx+1374,yy+168,xx+1404,yy+419,0);// Right
	        draw_rectangle(xx+1198,yy+168,xx+1384,yy+158,0);// Top
	        draw_rectangle(xx+1198,yy+409,xx+1384,yy+419,0);// Bottom
        
	        draw_set_color(c_gray);draw_rectangle(xx+1208,yy+178,xx+1374,yy+409,1);
	        draw_text_transformed(xx+1290,yy+145,string_hash_to_newline(string(cn.temp[101])),1.5,1.5,0);
        
	        draw_set_font(fnt_40k_14);
	        draw_set_halign(fa_left);
        
	        if (cn.temp[102]!="") then draw_text_ext(xx+1015,yy+215,string_hash_to_newline(string(cn.temp[102])+"#"+string(cn.temp[103])),-1,187);
	        if (cn.temp[102]!="") then draw_text_ext(xx+1016,yy+216,string_hash_to_newline(string(cn.temp[102])),-1,187);
        
	        if (cn.temp[104]!="") then draw_text_ext(xx+1015,yy+280,string_hash_to_newline(string(cn.temp[104])+"#"+string(cn.temp[105])),-1,187);
	        if (cn.temp[104]!="") then draw_text_ext(xx+1016,yy+281,string_hash_to_newline(string(cn.temp[104])),-1,187);
        
	        if (cn.temp[106]!="") then draw_text_ext(xx+1015,yy+345,string_hash_to_newline(string(cn.temp[106])+"#"+string(cn.temp[107])),-1,187);
	        if (cn.temp[106]!="") then draw_text_ext(xx+1016,yy+346,string_hash_to_newline(string(cn.temp[106])),-1,187);
        
	        if (cn.temp[108]!="") then draw_text_ext(xx+1387,yy+215,string_hash_to_newline(string(cn.temp[108])+"#"+string(cn.temp[109])),-1,187);
	        if (cn.temp[108]!="") then draw_text_ext(xx+1388,yy+216,string_hash_to_newline(string(cn.temp[108])),-1,187);
        
	        if (cn.temp[110]!="") then draw_text_ext(xx+1387,yy+345,string_hash_to_newline(string(cn.temp[110])+"#"+string(cn.temp[111])),-1,187);
	        if (cn.temp[110]!="") then draw_text_ext(xx+1388,yy+346,string_hash_to_newline(string(cn.temp[110])),-1,187);
        
	        if (cn.temp[112]!="") then draw_text(xx+1015,yy+420,string_hash_to_newline("Health: "+string(cn.temp[112])));
	        if (cn.temp[113]!="") then draw_text(xx+1190,yy+420,string_hash_to_newline("Experience: "+string(cn.temp[113])));
	        if (cn.temp[114]!="") then draw_text(xx+1365,yy+420,string_hash_to_newline("Bionics: "+string(cn.temp[114])));
        
	        draw_set_color(c_gray);if (ui_melee_penalty>0) then draw_set_color(c_red);
	        if (cn.temp[116]!="") then draw_text(xx+1015,yy+442,string_hash_to_newline("Melee Attack: "+string(cn.temp[116])));
        
	        draw_set_color(c_gray);if (ui_ranged_penalty>0) then draw_set_color(c_red);
	        if (cn.temp[117]!="") then draw_text(xx+1190,yy+442,string_hash_to_newline("Ranged Attack: "+string(cn.temp[117])));
        
	        draw_set_color(c_gray);
	        if (cn.temp[118]!="") then draw_text(xx+1365,yy+442,string_hash_to_newline("Damage Resistance: "+string(cn.temp[118])));
        
	        draw_set_font(fnt_40k_14i);
	        if (cn.temp[119]!="") then draw_text(xx+1020,yy+468,string_hash_to_newline(string(cn.temp[119])));
        
        
        
	    }
    
    
    
	    draw_set_font(fnt_40k_14);draw_set_halign(fa_left);
	    // Back
    
    
	    var top,sel,temp1,temp2,temp3,temp4,temp5;
	    temp1="";temp2="";temp3="";temp4="";temp5="";
    
	    top=man_current;
	    sel=top;
    
	    var ma_ar,ma_we1,ma_we2,ma_ge,ma_mb,ttt;
	    var ar_ar,ar_we1,ar_we2,ar_ge,ar_mb,eventing;
	    ma_ar="";ma_we1="";ma_we2="";ma_ge="";ma_mb="";ttt=0;
	    ar_ar=0;ar_we1=0;ar_we2=0;ar_ge=0;ar_mb=0;eventing=false;
    
	    yy+=77;
    
	    repeat(min(man_max,man_see)){
	        repeat(500){if (man[sel]="hide") then sel+=1;}eventing=false;
        
	        if (man[sel]="man"){
	            temp1=string(ma_role[sel])+" "+string(ma_name[sel]);
	            // temp1=string(managing)+"."+string(ide[sel]);
            
	            temp2=string(ma_loc[sel]);
	            if (ma_wid[sel]!=0){
	                if (ma_wid[sel]=1) then temp2+=" I";
	                if (ma_wid[sel]=2) then temp2+=" II";
	                if (ma_wid[sel]=3) then temp2+=" III";
	                if (ma_wid[sel]=4) then temp2+=" IV";
	            }
	            if (fest_planet=0) and (fest_sid>0) and (fest_repeats>0) and (ma_lid[sel]=fest_sid){temp2="=Event=";eventing=true;}
	            if (fest_planet=1) and (fest_wid>0) and (fest_repeats>0) and (ma_wid[sel]=fest_wid) and (ma_loc[sel]=fest_star){temp2="=Event=";eventing=true;}
	            if (ma_god[sel]>=10) then temp2="=Penitorium=";
            
	            var normal_hp;normal_hp="yes";
	            if (ma_role[sel]="Skitarii") then normal_hp="no";
	            if (ma_role[sel]="Techpriest") then normal_hp="no";
	            if (ma_role[sel]="Crusader") then normal_hp="no";
	            if (ma_role[sel]="Ranger") then normal_hp="no";
	            if (ma_role[sel]="Sister of Battle") then normal_hp="no";
	            if (ma_role[sel]="Sister Hospitaler") then normal_hp="no";
	            if (ma_role[sel]="Ork Sniper") then normal_hp="no";
	            if (ma_role[sel]="Flash Git") then normal_hp="no";
            
            
            
            
            
            
	            if (normal_hp="yes") then temp3=string(ma_health[sel])+"% HP";
            
            
	            if (normal_hp="no"){
	                var mixhp, ratio;mixhp=0;ratio=0;
	                if (ma_role[sel]="Skitarii") or (ma_role[sel]="Sister of Battle") or (ma_role[sel]="Sister Hospitaler") then mixhp=40;
	                if (ma_role[sel]="Techpriest") then mixhp=50;
	                if (ma_role[sel]="Ranger") then mixhp=40;
	                if (ma_role[sel]="Crusader") then mixhp=30;
	                if (ma_role[sel]="Ork Sniper") then mixhp=45;
	                if (ma_role[sel]="Flash Git") then mixhp=65;
	                if (mixhp>0) then ratio=(ma_health[sel]/mixhp)*100;
	                // if (mixhp=0) then ratio=100;
	                /*if (ratio>=100) then temp3="Unwounded";
	                if (ratio>=70) and (ratio<100) then temp3="Lightly Wounded";
	                if (ratio>=40) and (ratio<70) then temp3="Wounded";if (ratio>=8) and (ratio<40) then temp3="Badly Wounded";*/
	                // if (ratio<8) then temp3="CRITICAL";
	                temp3=string(ratio)+"% HP";
	            }
            
	            temp4=string(ma_exp[sel])+" exp";
            
            
	            ma_ar="";ma_we1="";ma_we2="";ma_ge="";ma_mb="";ttt=0;
	            ar_ar=0;ar_we1=0;ar_we2=0;ar_ge=0;ar_mb=0;
            
	            if (ma_armor[sel]!=""){ma_ar=scr_wep_abbreviate(ma_armor[sel]);
	                // if (string_count("*",ma_ar)>0){ar_ar=2;ma_ar=string_replace(ma_ar,"*","");}
	                if (string_count("^",ma_armor[sel])>0){ar_ar=1;ma_ar=string_replace(ma_ar,"^","");}
	                if (string_count("&",ma_armor[sel])>0){ar_ar=2;ma_ar="Artifact";}
	            }
	            if (ma_gear[sel]!=""){ma_ge=scr_wep_abbreviate(ma_gear[sel]);
	                // if (string_count("*",ma_ge)>0){ar_ge=2;ma_ge=string_replace(ma_ge,"*","");}
	                if (string_count("^",ma_gear[sel])>0){ar_ge=1;ma_ge=string_replace(ma_ge,"^","");}
	                if (string_count("&",ma_gear[sel])>0){ar_ge=2;ma_ge="Artifact";}
	            }
	            if (ma_mobi[sel]!=""){ma_mb=scr_wep_abbreviate(ma_mobi[sel]);
	                // if (string_count("*",ma_mb)>0){ar_mb=2;ma_mb=string_replace(ma_mb,"*","");}
	                if (string_count("^",ma_mobi[sel])>0){ar_mb=1;ma_mb=string_replace(ma_mb,"^","");}
	                if (string_count("&",ma_mobi[sel])>0){ar_mb=2;ma_mb="Artifact";}
	            }
	            if (ma_wep1[sel]!=""){ma_we1=scr_wep_abbreviate(ma_wep1[sel]);
	                // if (string_count("*",ma_we1)>0){ar_we1=2;ma_we1=string_replace(ma_we1,"*","");}
	                if (string_count("^",ma_wep1[sel])>0){ar_we1=1;ma_we1=string_replace(ma_we1,"^","");}
	                if (string_count("&",ma_wep1[sel])>0){ar_we1=2;ma_we1="Artifact";}
	            }
	            if (ma_wep2[sel]!=""){ma_we2=scr_wep_abbreviate(ma_wep2[sel]);
	                // if (string_count("*",ma_we2)>0){ar_we2=2;ma_we2=string_replace(ma_we2,"*","");}
	                if (string_count("^",ma_wep2[sel])>0){ar_we2=1;ma_we2=string_replace(ma_we2,"^","");}
	                if (string_count("&",ma_wep2[sel])>0){ar_we2=2;ma_we2="Artifact";}
	            }
            
	        }
	        if (man[sel]="vehicle"){
	            // temp1="v "+string(managing)+"."+string(ide[sel]);
	            temp1=string(ma_role[sel]);
	            temp2=string(ma_loc[sel]);
            
            
	            if (ma_wid[sel]!=0){
	                if (ma_wid[sel]=1) then temp2+=" I";
	                if (ma_wid[sel]=2) then temp2+=" II";
	                if (ma_wid[sel]=3) then temp2+=" III";
	                if (ma_wid[sel]=4) then temp2+=" IV";
	            }
	            temp3=string(round(ma_health[sel]))+"% HP";temp4="";
	            // Need abbreviations here



	            ma_ar="";ma_we1="";ma_we2="";ma_ge="";ma_mb="";ttt=0;
	            ar_ar=0;ar_we1=0;ar_we2=0;ar_ge=0;ar_mb=0;

							if (ma_armor[sel]!=""){ma_ar=scr_wep_abbreviate(ma_armor[sel]);
	                // if (string_count("*",ma_ar)>0){ar_ar=2;ma_ar=string_replace(ma_ar,"*","");}
	                if (string_count("^",ma_armor[sel])>0){ar_ar=1;ma_ar=string_replace(ma_ar,"^","");}
	                if (string_count("&",ma_armor[sel])>0){ar_ar=2;ma_ar="Artifact";}
	            }
	            if (ma_gear[sel]!=""){ma_ge=scr_wep_abbreviate(ma_gear[sel]);
	                // if (string_count("*",ma_ge)>0){ar_ge=2;ma_ge=string_replace(ma_ge,"*","");}
	                if (string_count("^",ma_gear[sel])>0){ar_ge=1;ma_ge=string_replace(ma_ge,"^","");}
	                if (string_count("&",ma_gear[sel])>0){ar_ge=2;ma_ge="Artifact";}
	            }
	            if (ma_mobi[sel]!=""){ma_mb=scr_wep_abbreviate(ma_mobi[sel]);
	                // if (string_count("*",ma_mb)>0){ar_mb=2;ma_mb=string_replace(ma_mb,"*","");}
	                if (string_count("^",ma_mobi[sel])>0){ar_mb=1;ma_mb=string_replace(ma_mb,"^","");}
	                if (string_count("&",ma_mobi[sel])>0){ar_mb=2;ma_mb="Artifact";}
	            }
	            if (ma_wep1[sel]!=""){ma_we1=scr_wep_abbreviate(ma_wep1[sel]);
	                // if (string_count("*",ma_we1)>0){ar_we1=2;ma_we1=string_replace(ma_we1,"*","");}
	                if (string_count("^",ma_wep1[sel])>0){ar_we1=1;ma_we1=string_replace(ma_we1,"^","");}
	                if (string_count("&",ma_wep1[sel])>0){ar_we1=2;ma_we1="Artifact";}
	            }
	            if (ma_wep2[sel]!=""){ma_we2=scr_wep_abbreviate(ma_wep2[sel]);
	                // if (string_count("*",ma_we2)>0){ar_we2=2;ma_we2=string_replace(ma_we2,"*","");}
	                if (string_count("^",ma_wep2[sel])>0){ar_we2=1;ma_we2=string_replace(ma_we2,"^","");}
	                if (string_count("&",ma_wep2[sel])>0){ar_we2=2;ma_we2="Artifact";}
	            }

	            // temp5=string(ma_wep1[sel])+", "+string(ma_wep2[sel])+" + "+string(ma_gear[sel]);
	        }


	        if (man_sel[sel]=0) then draw_set_color(c_black);
	        if (man_sel[sel]!=0) then draw_set_color(6052956);// was gray
	        draw_rectangle(xx+25,yy+64,xx+974,yy+85,0);
	        draw_set_color(c_gray);draw_rectangle(xx+25,yy+64,xx+974,yy+85,1);

	        // Squads
	        var sqi;sqi="";
	        draw_set_color(c_black);
	        if (squad[sel]=1) or (squad[sel]=11) or (squad[sel]=21) then draw_set_color(c_red);
	        if (squad[sel]=2) or (squad[sel]=12) or (squad[sel]=22) then draw_set_color(c_green);
	        if (squad[sel]=3) or (squad[sel]=13) or (squad[sel]=23) then draw_set_color(c_orange);
	        if (squad[sel]=4) or (squad[sel]=14) or (squad[sel]=24) then draw_set_color(c_aqua);
	        if (squad[sel]=5) or (squad[sel]=15) or (squad[sel]=25) then draw_set_color(c_fuchsia);
	        if (squad[sel]=6) or (squad[sel]=16) or (squad[sel]=26) then draw_set_color(c_green);
	        if (squad[sel]=7) or (squad[sel]=17) or (squad[sel]=27) then draw_set_color(c_blue);
	        if (squad[sel]=8) or (squad[sel]=18) or (squad[sel]=28) then draw_set_color(c_fuchsia);
	        if (squad[sel]=9) or (squad[sel]=19) or (squad[sel]=29) then draw_set_color(c_maroon);
	        if (squad[sel]=10) or (squad[sel]=20) or (squad[sel]=30) then draw_set_color(c_teal);
        
	        if (sel>0){
	            if (squad[sel]=squad[sel+1]) and (squad[sel]!=squad[sel-1]) then sqi="top";
	            if (squad[sel]=squad[sel+1]) and (squad[sel]=squad[sel-1]) then sqi="mid";
	            if (squad[sel]!=squad[sel+1]) and (squad[sel]=squad[sel-1]) then sqi="bot";
	        }
        
	        if (sqi=""){
	            draw_rectangle(xx+25,yy+64,xx+25+8,yy+85,0);
	            draw_set_color(c_gray);
	            draw_rectangle(xx+25,yy+64,xx+25+8,yy+85,1);
	        }
        
	        if (sqi="mid"){
	            draw_rectangle(xx+25,yy+64,xx+25+8,yy+85,0);
	            draw_set_color(c_gray);
	            draw_line(xx+25,yy+64,xx+25,yy+85);
	            draw_line(xx+25+8,yy+64,xx+25+8,yy+85);
	        }
	        if (sqi="top"){
	            draw_rectangle(xx+25,yy+64,xx+25+8,yy+85,0);
	            draw_set_color(c_gray);
	            draw_line(xx+25,yy+64,xx+25+28,yy+64);
	            draw_line(xx+25,yy+64,xx+25,yy+85);
	            draw_line(xx+25+8,yy+64,xx+25+8,yy+85);
	        }
	        if (sqi="bot"){
	            draw_rectangle(xx+25,yy+64,xx+25+8,yy+85,0);
	            draw_set_color(c_gray);
	            draw_line(xx+25,yy+85,xx+25+28,yy+85);
	            draw_line(xx+25,yy+64,xx+25,yy+85);
	            draw_line(xx+25+8,yy+64,xx+25+8,yy+85);
	        }
        
        
	        // was 885
	        // 974
        
        
        
        
	        if (man[sel]="man") and (ma_ar="") then draw_set_alpha(0.5);
	        var name_xr;name_xr=1;repeat(10){if ((string_width(string_hash_to_newline(temp1))*name_xr)>184-8) then name_xr-=0.05;}
        
	        if (temp1!="Chapter Master "+string(obj_ini.master_name)){
	            if (man[sel]="man") and (ma_promote[sel]>0) then draw_set_color(c_yellow);
	            if (man[sel]="man") and (ma_promote[sel]>=10) then draw_set_color(c_red);
	            draw_text_transformed(xx+27+8,yy+66,string_hash_to_newline(string(temp1)),name_xr,1,0);
	            draw_text_transformed(xx+28+8,yy+67,string_hash_to_newline(string(temp1)),name_xr,1,0);
	            draw_set_color(c_gray);
	        }
	        if (temp1="Chapter Master "+string(obj_ini.master_name)){
	            draw_text_transformed(xx+27+16+8,yy+66,string_hash_to_newline(string(temp1)),name_xr,1,0);
	            draw_text_transformed(xx+28+16+8,yy+67,string_hash_to_newline(string(temp1)),name_xr,1,0);
	            draw_sprite(spr_inspect_small,0,xx+27+8,yy+68);
	        }
	        draw_set_alpha(1);
        
	        draw_set_color(c_gray);
	        draw_text_transformed(xx+240+8,yy+66,string_hash_to_newline(string(temp3)),1,1,0);// HP
	        draw_text_transformed(xx+330+8,yy+66,string_hash_to_newline(string(temp4)),1,1,0);// EXP
	        if (temp2="Mechanicus Vessel") or (temp2="Terra IV") or (temp2="=Penitorium=") then draw_set_alpha(0.5);
	        draw_text_transformed(xx+430+8,yy+66,string_hash_to_newline(string(temp2)),1,1,0);// LOC
	        draw_set_alpha(1);
        
        
	        // ma_lid[i]=0;ma_wid[i]=0;
        
	        if (ma_loc[sel]="Mechanicus Vessel") then draw_sprite(spr_loc_icon,2,xx+427+8,yy+66);
	        if (man[sel]="man"){
	            if (ma_loc[sel]!="Mechanicus Vessel"){var berd;berd=false;
	                if (managing<11){if (obj_ini.age[managing,ide[sel]]!=floor(obj_ini.age[managing,ide[sel]])) then berd=true;}
	                if (managing>=11){if (obj_ini.age[0,ide[sel]]!=floor(obj_ini.age[0,ide[sel]])) then berd=true;}
                
	                if (ma_lid[sel]=0) and (ma_wid[sel]>0) then draw_sprite(spr_loc_icon,0,xx+427+8,yy+66);
	                if (ma_lid[sel]>0) and (ma_wid[sel]=0) and (berd=false) then draw_sprite(spr_loc_icon,1,xx+427+8,yy+66);
	                if (ma_lid[sel]>0) and (ma_wid[sel]=0) and (berd=true) then draw_sprite(spr_loc_icon,2,xx+427+8,yy+66);
	            }
	        }
	        if (man[sel]!="man"){
	            if (ma_loc[sel]!="Mechanicus Vessel"){
	                if (ma_lid[sel]=0) and (ma_wid[sel]>0) then draw_sprite(spr_loc_icon,0,xx+427+8,yy+66);
	                if (ma_lid[sel]>0) and (ma_wid[sel]=0) then draw_sprite(spr_loc_icon,1,xx+427+8,yy+66);
	            }
	        }


	        /*if (man[sel]="man"){
	            if (ma_lid[sel]=0) then draw_text_transformed(xx+430,yy+66,string(temp2),1,1,0);
	        }
	        if (man[sel]="vehicle"){
	            if (ma_lid[sel]=0) then draw_text_transformed(xx+430,yy+66,string(temp2),1,1,0);
	        }*/

	        /*draw_set_color(38144);// Equipment
	        if (string_count("Artifact",temp5)>0) then draw_set_color(881503);
	        draw_text_transformed(xx+573,yy+66,string(temp5),1,1,0);draw_set_color(38144);*/

	        if (man[sel]="man"){var x5;x5=0;
	            draw_set_color(c_gray);
	            if (ar_ar=1) then draw_set_color(c_gray);
	            if (ar_ar=2) then draw_set_color(881503);
	            draw_text(xx+573,yy+66,string_hash_to_newline(string(ma_ar)));

	            x5+=string_width(string_hash_to_newline(ma_ar))+15;
	            draw_set_color(c_gray);
	            if (ar_mb=1) then draw_set_color(c_gray);
	            if (ar_mb=2) then draw_set_color(881503);
	            draw_text(xx+573+x5,yy+66,string_hash_to_newline(string(ma_mb)));

	            x5+=string_width(string_hash_to_newline(ma_mb))+15;
	            draw_set_color(c_gray);
	            if (ar_ge=1) then draw_set_color(c_gray);
	            if (ar_ge=2) then draw_set_color(881503);
	            draw_text(xx+573+x5,yy+66,string_hash_to_newline(string(ma_ge)));

	            x5+=string_width(string_hash_to_newline(ma_ge))+15;
	            draw_set_color(c_gray);
	            if (ar_we1=1) then draw_set_color(c_gray);
	            if (ar_we1=2) then draw_set_color(881503);
	            draw_text(xx+573+x5,yy+66,string_hash_to_newline(string(ma_we1)));

	            x5+=string_width(string_hash_to_newline(ma_we1))+15;
	            draw_set_color(c_gray);
	            if (ar_we2=1) then draw_set_color(c_gray);
	            if (ar_we2=2) then draw_set_color(881503);
	            draw_text(xx+573+x5,yy+66,string_hash_to_newline(string(ma_we2)));
	        }

	        if (man[sel]!="man"){var x5;x5=0;

						draw_set_color(c_gray);
						if (ar_ge=1) then draw_set_color(c_gray);
						if (ar_ge=2) then draw_set_color(881503);
						draw_text(xx+573,yy+66,string_hash_to_newline(string(ma_ge)));

						x5+=string_width(string_hash_to_newline(ma_ge))+15;
						draw_set_color(c_gray);
						if (ar_mb=1) then draw_set_color(c_gray);
						if (ar_mb=2) then draw_set_color(881503);
						draw_text(xx+573+x5,yy+66,string_hash_to_newline(string(ma_mb)));

						x5+=string_width(string_hash_to_newline(ma_mb))+15;
						draw_set_color(c_gray);
						if (ar_we1=1) then draw_set_color(c_gray);
						if (ar_we1=2) then draw_set_color(881503);
						draw_text(xx+573+x5,yy+66,string_hash_to_newline(string(ma_we1)));

						x5+=string_width(string_hash_to_newline(ma_we1))+15;
						draw_set_color(c_gray);
						if (ar_we2=1) then draw_set_color(c_gray);
						if (ar_we2=2) then draw_set_color(881503);
						draw_text(xx+573+x5,yy+66,string_hash_to_newline(string(ma_we2)));

						x5+=string_width(string_hash_to_newline(ma_we2))+15;
						draw_set_color(c_gray);
						if (ar_ar=1) then draw_set_color(c_gray);
						if (ar_ar=2) then draw_set_color(881503);
						draw_text(xx+573+x5,yy+66,string_hash_to_newline(string(ma_ar)));
	        }





	        yy+=20;
	        sel+=1;

	    }

	    draw_set_color(c_black);
	    xx=__view_get( e__VW.XView, 0 )+0;yy=__view_get( e__VW.YView, 0 )+0;
	    draw_rectangle(xx+974,yy+165,xx+1005,yy+822,0);
	    draw_set_color(c_gray);
	    draw_rectangle(xx+974,yy+165,xx+1005,yy+822,1);

	    draw_rectangle(xx+25,yy+142,xx+14+8,yy+822,1);// Squad outline



	    // draw_rectangle(xx+577,yy+64,xx+600,yy+85,1);
	    // draw_rectangle(xx+577,yy+379,xx+600,yy+400,1);

	    draw_set_color(0);
	    draw_rectangle(xx+974,yy+141,xx+1005,yy+172,0);
	    draw_rectangle(xx+974,yy+790,xx+1005,yy+822,0);
	    draw_set_color(c_gray);
	    draw_rectangle(xx+974,yy+141,xx+1005,yy+172,1);
	    draw_rectangle(xx+974,yy+790,xx+1005,yy+822,1);


	    draw_sprite_stretched(spr_arrow,2,xx+974,yy+141,31,30);
	    draw_sprite_stretched(spr_arrow,3,xx+974,yy+791,31,30);

	    /*
	    draw_set_color(c_black);draw_rectangle(xx+25,yy+400,xx+600,yy+417,0);
	    draw_set_color(38144);draw_rectangle(xx+25,yy+400,xx+600,yy+417,1);
	    draw_line(xx+160,yy+400,xx+160,yy+417);
	    draw_line(xx+304,yy+400,xx+304,yy+417);
	    draw_line(xx+448,yy+400,xx+448,yy+417);

	    draw_set_font(fnt_menu);
	    draw_set_halign(fa_center);
	    */

	    draw_set_color(c_gray);
	    draw_set_font(fnt_40k_14b);draw_text_transformed(xx+1010,yy+528,string_hash_to_newline("Selection: "+string(man_size)+" space"),1.5,1.5,0);
	    draw_set_font(fnt_40k_14);draw_text_ext(xx+1010,yy+552,string_hash_to_newline(selecting_dudes),-1,560);

	    draw_set_font(fnt_40k_14b);draw_text_transformed(xx+1010,yy+610,string_hash_to_newline("Options:"),1.5,1.5,0);
	    draw_set_font(fnt_40k_14);

	    yy+=8;

	    if (sel_uni[1]!=""){
	        draw_text(xx+1010,yy+636,string_hash_to_newline("All Infantry"));
	        draw_rectangle(xx+1010,yy+634,xx+1010+string_width(string_hash_to_newline("All Infantry")),yy+634+string_height(string_hash_to_newline("All Infantry")),1);
	        if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
	            if (mouse_x>=xx+1010) and (mouse_y>=yy+634) and (mouse_x<xx+1010+string_width(string_hash_to_newline("All Infantry"))) and (mouse_y<yy+634+string_height(string_hash_to_newline("All Infantry"))){cooldown=8;sel_all="man";}
	        }

	        if (sel_uni[1]!=""){
	            draw_text(xx+1016,yy+662,string_hash_to_newline(sel_uni[1]));draw_rectangle(xx+1015,yy+661,xx+1016+string_width(string_hash_to_newline(sel_uni[1])),yy+661+string_height(string_hash_to_newline(sel_uni[1])),1);
	            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
	                if (mouse_x>=xx+1015) and (mouse_y>=yy+661) and (mouse_x<xx+1016+string_width(string_hash_to_newline(sel_uni[1]))) and (mouse_y<yy+661+string_height(string_hash_to_newline(sel_uni[1]))){cooldown=8;sel_all=sel_uni[1];}
	            }
	        }
	        if (sel_uni[2]!=""){
	            draw_text(xx+1016,yy+684,string_hash_to_newline(sel_uni[2]));draw_rectangle(xx+1015,yy+683,xx+1016+string_width(string_hash_to_newline(sel_uni[2])),yy+683+string_height(string_hash_to_newline(sel_uni[2])),1);
	            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
	                if (mouse_x>=xx+1016) and (mouse_y>=yy+684) and (mouse_x<xx+1016+string_width(string_hash_to_newline(sel_uni[2]))) and (mouse_y<yy+683+string_height(string_hash_to_newline(sel_uni[2]))){cooldown=8;sel_all=sel_uni[2];}
	            }
	        }
	        if (sel_uni[3]!=""){
	            draw_text(xx+1016,yy+706,string_hash_to_newline(sel_uni[3]));draw_rectangle(xx+1015,yy+705,xx+1016+string_width(string_hash_to_newline(sel_uni[3])),yy+705+string_height(string_hash_to_newline(sel_uni[3])),1);
	            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
	                if (mouse_x>=xx+1016) and (mouse_y>=yy+706) and (mouse_x<xx+1016+string_width(string_hash_to_newline(sel_uni[3]))) and (mouse_y<yy+705+string_height(string_hash_to_newline(sel_uni[3]))){cooldown=8;sel_all=sel_uni[3];}
	            }
	        }
	        if (sel_uni[4]!=""){
	            draw_text(xx+1016,yy+728,string_hash_to_newline(sel_uni[4]));draw_rectangle(xx+1015,yy+727,xx+1016+string_width(string_hash_to_newline(sel_uni[4])),yy+727+string_height(string_hash_to_newline(sel_uni[4])),1);
	            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
	                if (mouse_x>=xx+1016) and (mouse_y>=yy+727) and (mouse_x<xx+1016+string_width(string_hash_to_newline(sel_uni[4]))) and (mouse_y<yy+727+string_height(string_hash_to_newline(sel_uni[4]))){cooldown=8;sel_all=sel_uni[4];}
	            }
	        }
        
	        if (sel_uni[5]!=""){
	            draw_text(xx+1160,yy+662,string_hash_to_newline(sel_uni[5]));draw_rectangle(xx+1015+144,yy+661,xx+1160+string_width(string_hash_to_newline(sel_uni[5])),yy+661+string_height(string_hash_to_newline(sel_uni[5])),1);
	            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
	                if (mouse_x>=xx+1160) and (mouse_y>=yy+661) and (mouse_x<xx+1160+string_width(string_hash_to_newline(sel_uni[5]))) and (mouse_y<yy+661+string_height(string_hash_to_newline(sel_uni[5]))){cooldown=8;sel_all=sel_uni[5];}
	            }
	        }
	        if (sel_uni[6]!=""){
	            draw_text(xx+1160,yy+684,string_hash_to_newline(sel_uni[6]));draw_rectangle(xx+1015+144,yy+683,xx+1160+string_width(string_hash_to_newline(sel_uni[6])),yy+683+string_height(string_hash_to_newline(sel_uni[6])),1);
	            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
	                if (mouse_x>=xx+1160) and (mouse_y>=yy+684) and (mouse_x<xx+1160+string_width(string_hash_to_newline(sel_uni[6]))) and (mouse_y<yy+684+string_height(string_hash_to_newline(sel_uni[6]))){cooldown=8;sel_all=sel_uni[6];}
	            }
	        }
	        if (sel_uni[7]!=""){
	            draw_text(xx+1160,yy+706,string_hash_to_newline(sel_uni[7]));draw_rectangle(xx+1015+144,yy+705,xx+1160+string_width(string_hash_to_newline(sel_uni[7])),yy+705+string_height(string_hash_to_newline(sel_uni[7])),1);
	            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
	                if (mouse_x>=xx+1160) and (mouse_y>=yy+706) and (mouse_x<xx+1160+string_width(string_hash_to_newline(sel_uni[7]))) and (mouse_y<yy+706+string_height(string_hash_to_newline(sel_uni[7]))){cooldown=8;sel_all=sel_uni[7];}
	            }
	        }
	        if (sel_uni[8]!=""){
	            draw_text(xx+1160,yy+728,string_hash_to_newline(sel_uni[8]));draw_rectangle(xx+1015+144,yy+727,xx+1160+string_width(string_hash_to_newline(sel_uni[8])),yy+727+string_height(string_hash_to_newline(sel_uni[8])),1);
	            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
	                if (mouse_x>=xx+1160) and (mouse_y>=yy+728) and (mouse_x<xx+1160+string_width(string_hash_to_newline(sel_uni[8]))) and (mouse_y<yy+727+string_height(string_hash_to_newline(sel_uni[8]))){cooldown=8;sel_all=sel_uni[8];}
	            }
	        }
	    }
    
	    if (sel_veh[1]!=""){
	        draw_text(xx+1010+288,yy+636,string_hash_to_newline("All Vehicles"));
	        draw_rectangle(xx+1010+288,yy+634,xx+1010+288+string_width(string_hash_to_newline("All Vehicles")),yy+634+string_height(string_hash_to_newline("All Vehicles")),1);
	        if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
	            if (mouse_x>=xx+1010+288) and (mouse_y>=yy+634) and (mouse_x<xx+1010+288+string_width(string_hash_to_newline("All Vehicles"))) and (mouse_y<yy+634+string_height(string_hash_to_newline("All Vehicles"))){cooldown=8;sel_all="vehicle";}
	        }
        
	        if (sel_veh[1]!=""){
	            draw_text(xx+1016+288,yy+662,string_hash_to_newline(sel_veh[1]));draw_rectangle(xx+1015+288,yy+661,xx+1016+288+string_width(string_hash_to_newline(sel_veh[1])),yy+661+string_height(string_hash_to_newline(sel_veh[1])),1);
	            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
	                if (mouse_x>=xx+1015+288) and (mouse_y>=yy+661) and (mouse_x<xx+1016+288+string_width(string_hash_to_newline(sel_veh[1]))) and (mouse_y<yy+661+string_height(string_hash_to_newline(sel_veh[1]))){cooldown=8;sel_all=sel_veh[1];}
	            }
	        }
	        if (sel_veh[2]!=""){
	            draw_text(xx+1016+288,yy+684,string_hash_to_newline(sel_veh[2]));draw_rectangle(xx+1015+288,yy+683,xx+1016+288+string_width(string_hash_to_newline(sel_veh[2])),yy+683+string_height(string_hash_to_newline(sel_veh[2])),1);
	            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
	                if (mouse_x>=xx+1015+288) and (mouse_y>=yy+683) and (mouse_x<xx+1016+288+string_width(string_hash_to_newline(sel_veh[2]))) and (mouse_y<yy+683+string_height(string_hash_to_newline(sel_veh[2]))){cooldown=8;sel_all=sel_veh[2];}
	            }
	        }
	        if (sel_veh[3]!=""){
	            draw_text(xx+1016+288,yy+706,string_hash_to_newline(sel_veh[3]));draw_rectangle(xx+1015+288,yy+705,xx+1016+288+string_width(string_hash_to_newline(sel_veh[3])),yy+705+string_height(string_hash_to_newline(sel_veh[3])),1);
	            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
	                if (mouse_x>=xx+1015+288) and (mouse_y>=yy+705) and (mouse_x<xx+1016+288+string_width(string_hash_to_newline(sel_veh[3]))) and (mouse_y<yy+705+string_height(string_hash_to_newline(sel_veh[3]))){cooldown=8;sel_all=sel_veh[3];}
	            }
	        }
	        if (sel_veh[4]!=""){
	            draw_text(xx+1016+288,yy+728,string_hash_to_newline(sel_veh[4]));draw_rectangle(xx+1015+288,yy+727,xx+1016+288+string_width(string_hash_to_newline(sel_veh[4])),yy+727+string_height(string_hash_to_newline(sel_veh[4])),1);
	            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
	                if (mouse_x>=xx+1015+288) and (mouse_y>=yy+728) and (mouse_x<xx+1016+288+string_width(string_hash_to_newline(sel_veh[4]))) and (mouse_y<yy+727+string_height(string_hash_to_newline(sel_veh[4]))){cooldown=8;sel_all=sel_veh[4];}
	            }
	        }
        
	        if (sel_veh[5]!=""){
	            draw_text(xx+1160+432,yy+662,string_hash_to_newline(sel_veh[5]));draw_rectangle(xx+1015+432,yy+661,xx+1160+432+string_width(string_hash_to_newline(sel_veh[5])),yy+661+string_height(string_hash_to_newline(sel_veh[5])),1);
	            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
	                if (mouse_x>=xx+1160+432) and (mouse_y>=yy+661) and (mouse_x<xx+1160+432+string_width(string_hash_to_newline(sel_veh[5]))) and (mouse_y<yy+661+string_height(string_hash_to_newline(sel_veh[5]))){cooldown=8;sel_all=sel_veh[5];}
	            }
	        }
	        if (sel_veh[6]!=""){
	            draw_text(xx+1160+432,yy+684,string_hash_to_newline(sel_veh[6]));draw_rectangle(xx+1015+432,yy+683,xx+1160+432+string_width(string_hash_to_newline(sel_veh[6])),yy+683+string_height(string_hash_to_newline(sel_veh[6])),1);
	            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
	                if (mouse_x>=xx+1160+432) and (mouse_y>=yy+683) and (mouse_x<xx+1160+432+string_width(string_hash_to_newline(sel_veh[6]))) and (mouse_y<yy+683+string_height(string_hash_to_newline(sel_veh[6]))){cooldown=8;sel_all=sel_veh[6];}
	            }
	        }
	        if (sel_veh[7]!=""){
	            draw_text(xx+1160+432,yy+706,string_hash_to_newline(sel_veh[7]));draw_rectangle(xx+1015+432,yy+705,xx+1160+432+string_width(string_hash_to_newline(sel_veh[7])),yy+705+string_height(string_hash_to_newline(sel_veh[7])),1);
	            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
	                if (mouse_x>=xx+1160+432) and (mouse_y>=yy+706) and (mouse_x<xx+1160+432+string_width(string_hash_to_newline(sel_veh[7]))) and (mouse_y<yy+705+string_height(string_hash_to_newline(sel_veh[7]))){cooldown=8;sel_all=sel_veh[7];}
	            }
	        }
	        if (sel_veh[8]!=""){
	            draw_text(xx+1160+432,yy+728,string_hash_to_newline(sel_veh[8]));draw_rectangle(xx+1015+432,yy+727,xx+1160+432+string_width(string_hash_to_newline(sel_veh[8])),yy+727+string_height(string_hash_to_newline(sel_veh[8])),1);
	            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
	                if (mouse_x>=xx+1160+432) and (mouse_y>=yy+728) and (mouse_x<xx+1160+432+string_width(string_hash_to_newline(sel_veh[8]))) and (mouse_y<yy+727+string_height(string_hash_to_newline(sel_veh[8]))){cooldown=8;sel_all=sel_veh[8];}
	            }
	        }
	    }
    
	    yy-=8;
    
    
    
	    draw_set_font(fnt_40k_14b);
	    draw_set_halign(fa_left);
	    draw_set_color(c_gray);
	    draw_text_transformed(xx+1285,yy+610,string_hash_to_newline("Select All"),1.5,1.5,0);
	    draw_rectangle(xx+1281,yy+608,xx+1408,yy+636,1);
	    draw_set_alpha(0.5);draw_rectangle(xx+1282,yy+609,xx+1407,yy+635,1);
	    draw_set_alpha(0.25);
	    if (mouse_x>=xx+1281) and (mouse_y>=yy+608) and (mouse_x<xx+1408) and (mouse_y<yy+636) then draw_rectangle(xx+1281,yy+608,xx+1408,yy+636,0);
    
	    draw_set_alpha(1);
	    draw_set_font(fnt_40k_14);
	    draw_set_halign(fa_center);
    
	    var x5,y5,x6,y6;
	    x5=xx+1018;y5=yy+831;x6=xx+1018+141;y6=yy+805;
	    draw_set_alpha(1);draw_rectangle(x5,y5,x6,y6,1);
	    draw_set_alpha(0.5);draw_rectangle(x5+1,y5+1,x6-1,y6-1,1);
	    draw_set_alpha(0.25);if (mouse_x>=x5) and (mouse_y>=y6) and (mouse_x<x6) and (mouse_y<y5) then draw_rectangle(x5,y5,x6,y6,0);
	    draw_set_alpha(1);
	    if (sel_loading=0) then draw_text_transformed(xx+1089,yy+805,string_hash_to_newline("Load"),1.5,1.5,0);
	    if (sel_loading!=0) then draw_text_transformed(xx+1089,yy+805,string_hash_to_newline("Unload"),1.5,1.5,0);
    
	    x5=xx+1018+141;y5=yy+831;x6=xx+1297;y6=yy+805;
	    draw_set_alpha(1);draw_rectangle(x5,y5,x6,y6,1);
	    draw_set_alpha(0.5);draw_rectangle(x5+1,y5+1,x6-1,y6-1,1);
	    draw_set_alpha(0.25);if (mouse_x>=x5) and (mouse_y>=y6) and (mouse_x<x6) and (mouse_y<y5) then draw_rectangle(x5,y5,x6,y6,0);
	    draw_set_alpha(1);
	    if (otha>0) then draw_set_alpha(0.5);
	    draw_text_transformed(xx+1089+141,yy+805,string_hash_to_newline("Re-equip"),1.5,1.5,0);
    
	    x5=xx+1297;y5=yy+831;x6=xx+1436;y6=yy+805;
	    draw_set_alpha(1);draw_rectangle(x5,y5,x6,y6,1);
	    draw_set_alpha(0.5);draw_rectangle(x5+1,y5+1,x6-1,y6-1,1);
	    draw_set_alpha(0.25);if (mouse_x>=x5) and (mouse_y>=y6) and (mouse_x<x6) and (mouse_y<y5) then draw_rectangle(x5,y5,x6,y6,0);
	    draw_set_alpha(1);
	    draw_set_alpha(min(sel_promoting+0.5,1));
	    draw_text_transformed(xx+1089+282,yy+805,string_hash_to_newline("Promote"),1.5,1.5,0);
    
	    x5=xx+1297+141;y5=yy+831;x6=xx+1436+141;y6=yy+805;
	    draw_set_alpha(1);draw_rectangle(x5,y5,x6,y6,1);
	    draw_set_alpha(0.5);draw_rectangle(x5+1,y5+1,x6-1,y6-1,1);
	    draw_set_alpha(0.25);if (mouse_x>=x5) and (mouse_y>=y6) and (mouse_x<x6) and (mouse_y<y5) then draw_rectangle(x5,y5,x6,y6,0);
	    draw_set_alpha(1);draw_text_transformed(xx+1089+423,yy+805,string_hash_to_newline("Jail"),1.5,1.5,0);
    
	    x5=xx+1018+141;y5=yy+831-26;x6=xx+1297;y6=yy+805-26;
	    draw_set_alpha(1);draw_rectangle(x5,y5,x6,y6,1);
	    draw_set_alpha(0.5);draw_rectangle(x5+1,y5+1,x6-1,y6-1,1);
	    draw_set_alpha(0.25);if (mouse_x>=x5) and (mouse_y>=y6) and (mouse_x<x6) and (mouse_y<y5) then draw_rectangle(x5,y5,x6,y6,0);
	    draw_set_alpha(1);
	    if (otha>0) then draw_set_alpha(0.5);
	    draw_text_transformed(xx+1089+141,yy+805-26,string_hash_to_newline("Reset"),1.5,1.5,0);
    
	    x5=xx+1297;y5=yy+831-26;x6=xx+1436;y6=yy+805-26;
	    draw_set_alpha(1);draw_rectangle(x5,y5,x6,y6,1);
	    draw_set_alpha(0.5);draw_rectangle(x5+1,y5+1,x6-1,y6-1,1);
	    draw_set_alpha(0.25);if (mouse_x>=x5) and (mouse_y>=y6) and (mouse_x<x6) and (mouse_y<y5) then draw_rectangle(x5,y5,x6,y6,0);
	    draw_set_alpha(1);draw_text_transformed(xx+1089+282,yy+805-26,string_hash_to_newline("Transfer"),1.5,1.5,0);
    
    
	    draw_set_color(38144);
	    x5=xx+1300+141;y5=yy+827-26;x6=xx+1436+141;y6=yy+805-26;
	    draw_set_alpha(1);draw_rectangle(x5,y5,x6,y6,1);
	    draw_set_alpha(0.5);draw_rectangle(x5+1,y5+1,x6-1,y6-1,1);
	    draw_set_alpha(0.25);if (mouse_x>=x5) and (mouse_y>=y6) and (mouse_x<x6) and (mouse_y<y5) then draw_rectangle(x5,y5,x6,y6,0);
	    draw_set_alpha(1);draw_text_transformed(xx+1089+423,yy+807-26,string_hash_to_newline("Add Bionics"),1,1,0);
	    draw_set_color(c_gray);
    
	    draw_set_color(c_red);
	    x5=xx+1018;y5=yy+827-26;x6=xx+1018+141;y6=yy+805-26;
	    draw_set_alpha(1);draw_rectangle(x5,y5,x6,y6,1);
	    draw_set_alpha(0.5);draw_rectangle(x5+1,y5+1,x6-1,y6-1,1);
	    draw_set_alpha(0.25);if (mouse_x>=x5) and (mouse_y>=y6) and (mouse_x<x6) and (mouse_y<y5) then draw_rectangle(x5,y5,x6,y6,0);
	    draw_set_halign(fa_center);draw_set_alpha(1);
	    draw_text_transformed(xx+1084,yy+807-26,string_hash_to_newline("Set Boarder"),1,1,0);
	    draw_set_halign(fa_left);draw_set_color(c_gray);
    
    
    
    
    
	    /*if (scr_hit(x5,y5,x6,y6)=true) and (mouse_left>=1) and (cooldown<=0){
	        var bionics_before,bionics_after,p,cah;
	        p=0;cooldown=8000;cah=managing;if (cah>10) then cah=0;
        
	        bionics_before=scr_item_count("Bionics");
	        bioncs_after=bionics_before;
        
	        if (bionics_before>0) then repeat(300){p+=1;
	            if (man_sel[p]=1) and (man[p]="man") and (ma_health[p]<100) and (bionics_before>0) and (obj_ini.bio[cah,ide[p]]<10){
	                if (string_count("Dread",ma_armor[p])=0){
	                    obj_ini.bio[cah,ide[p]]+=1;bionics_after-=1;
	                    obj_ini.hp[cah,ide[p]]=min(obj_ini.hp[cah,ide[p]]+30,100);
	                    if (global.chapter_name="Iron Hands") then obj_ini.hp[cah,ide[p]]=min(obj_ini.hp[cah,ide[p]]+20,100);
	                }
	            }
	        }
        
	    }*/
    
    
	    scr_scrollbar(974,172,1005,790,34,man_max,man_current);
	}


	// 









	if (menu=30) and (managing>0){// Load to ships
	    var xx, yy, bb, img;
	    bb="";img=0;
	    xx=__view_get( e__VW.XView, 0 )+0;
	    yy=__view_get( e__VW.YView, 0 )+0;

	    // BG
	    draw_set_alpha(1);
	    draw_sprite(spr_rock_bg,0,xx,yy);
	    draw_set_font(fnt_40k_30b);
	    draw_set_halign(fa_center);
	    draw_set_color(c_gray);// 38144
	    // Title
	    var c,fx;c=0;fx="";
	    if (managing<=10) then c=managing;
	    if (managing>20) then c=managing-10;
    
	    if (managing=1) then fx="1st Company";
	    if (managing=2) then fx="2nd Company";
	    if (managing=3) then fx="3rd Company";
	    if ((managing>=4) and (managing<11)) or (managing>20) then fx=string(c)+"th Company";
    
	    if (managing=11) then fx="Headquarters";
	    if (managing=12) then fx="Apothecarion";
	    if (managing=13) then fx="Librarium";
	    if (managing=14) then fx="Reclusium";
	    if (managing=15) then fx="Armamentarium";
    
	    draw_text(xx+800,yy+74,string_hash_to_newline(string(global.chapter_name)+" "+string(fx)));
	    if (obj_ini.company_title[managing]!=""){draw_set_font(fnt_fancy);
	        draw_text(xx+800,yy+110,string_hash_to_newline("''"+string(obj_ini.company_title[managing])+"''"));
	    }
    
	    // Back
	    draw_sprite_ext(spr_arrow,0,xx+25,yy+70,2,2,0,c_white,1);// Back
    
    
	    var top,sel,temp1,temp2,temp3,temp4,temp5;temp1="";temp2="";temp3="";temp4="";temp5="";
	    top=ship_current;
	    sel=top;
    
	    draw_set_font(fnt_40k_14);
	    draw_set_halign(fa_left);
	    yy+=77;
    
	    repeat(min(ship_max,ship_see)){
	        if (sh_name[sel]!=""){
	            temp1=string(sh_name[sel])+" ("+string(sh_class[sel])+")";
	            temp2=string(sh_loc[sel]);
	            temp3=sh_hp[sel];
	            temp4=string(sh_cargo[sel])+" / "+string(sh_cargo_max[sel])+" Space Used";
	        }
        
	        draw_set_color(c_black);draw_rectangle(xx+25,yy+64,xx+974,yy+85,0);
	        draw_set_color(c_gray);draw_rectangle(xx+25,yy+64,xx+974,yy+85,1);
	        draw_text_transformed(xx+27,yy+66,string_hash_to_newline(string(temp1)),1,1,0);draw_text_transformed(xx+27.5,yy+66.5,string_hash_to_newline(string(temp1)),1,1,0);
	        draw_text_transformed(xx+364,yy+66,string_hash_to_newline(string(temp2)),1,1,0);
	        draw_text_transformed(xx+580,yy+66,string_hash_to_newline(string(temp3)),1,1,0);
	        draw_text_transformed(xx+730,yy+66,string_hash_to_newline(string(temp4)),1,1,0);
        
	        yy+=20;sel+=1;
	    }
    
    
	    /*draw_set_color(c_black);
	    xx=view_xview[0]+0;yy=view_yview[0]+0;
	    draw_rectangle(xx+577,yy+64,xx+600,yy+400,0);
	    draw_set_color(38144);
	    draw_rectangle(xx+577,yy+64,xx+600,yy+400,1);
	    draw_rectangle(xx+577,yy+64,xx+600,yy+85,1);
	    draw_rectangle(xx+577,yy+379,xx+600,yy+400,1);
	    draw_sprite_stretched(spr_arrow,2,xx+579,yy+66,20,16);
	    draw_sprite_stretched(spr_arrow,3,xx+579,yy+382,20,16);
    
	    draw_set_color(c_black);draw_rectangle(xx+25,yy+400,xx+600,yy+417,0);
	    draw_set_color(38144);draw_rectangle(xx+25,yy+400,xx+600,yy+417,1);
	    draw_set_color(38144);
	    draw_set_font(fnt_menu);
	    draw_set_halign(fa_center);*/
    
	    draw_set_font(fnt_40k_14b);
	    draw_text_transformed(xx+320,yy+402,string_hash_to_newline("Click a Ship to Load Selection (Req. "+string(man_size)+" Space)"),1,1,0);
    
	    xx=__view_get( e__VW.XView, 0 )+0;yy=__view_get( e__VW.YView, 0 )+0;
    
	    // draw_text_transformed(xx+488,yy+426,"Selection Size: "+string(man_size),0.4,0.4,0);
	    scr_scrollbar(974,172,1005,790,34,ship_max,ship_current);
	}


}
