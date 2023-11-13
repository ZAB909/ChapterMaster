function scr_ui_manage() {
	var unit,i, tooltip_text,x1,x2,y1,y2, var_text;
	var romanNumerals=scr_roman_numerals();	
	var normal_hp=true, bionic_tooltip="",tooltip_drawing=[];
	var body_augmentations = {mutations:[], bionics:[[],[]]}
	
	// Declare non marine roles here
	var non_marine_roles=[
		"Skitarii", 
		"Techpriest",
		"Crusader", 
		"Ranger", 
		"Sister of Battle", 
		"Sister Hospitaler", 
		"Ork Sniper", 
		"Flash Git",
	];

	if (combat!=0) then exit;

	// This is the draw script for showing the main management screen or individual company screens

	if (menu==1) and (managing>0){
	    var xx=__view_get( e__VW.XView, 0 )+0, yy=__view_get( e__VW.YView, 0 )+0, bb="", img=0;

	    // Draw BG
	    draw_set_alpha(1);
	    draw_sprite(spr_rock_bg,0,xx,yy);
	    draw_set_font(fnt_40k_30b);
	    draw_set_halign(fa_center);
	    draw_set_color(c_gray);// 38144
    
		// Var declarations
	    var c=0,fx="",skin=obj_ini.skin_color;
		
		
	    if (managing>20){
	    	c=managing-10;
	    }else if (managing >= 1) and (managing <=10) {
			fx= romanNumerals[managing - 1] + " Company";
			c=managing;
		} else {
			switch(managing){
				case 11:
					fx="Headquarters"
					break;
				case 12:
					fx="Apothecarion";
					break;
				case 13:
					fx="Librarium";
					break;
				case 14:
					fx="Reclusium";
					break;
				case 15:
					fx="Armamentarium";
					break;
			}
		}

		// Draw the company followed by chapters name
	    draw_text(xx+800,yy+74,string_hash_to_newline(string(fx)+", "+string(global.chapter_name)));

		
	    if (managing<=10){
	        var bar_wid=0,click_check, string_h;
	        draw_set_alpha(0.25);
	        if (obj_ini.company_title[managing]!="") then bar_wid=max(400,string_width(string_hash_to_newline(obj_ini.company_title[managing])));
	        if (obj_ini.company_title[managing]="") then bar_wid=400;
        	string_h = string_height(string_hash_to_newline("LOL"));
	        draw_rectangle(xx+800-(bar_wid/2),yy+108,xx+800+(bar_wid/2),yy+100+string_h,1);
	        click_check = scr_hit(xx+800-(bar_wid/2),yy+108,xx+800+(bar_wid/2),yy+100+string_h);
	        obj_cursor.image_index=0;
	        if (!click_check) and (mouse_left==1) and (cooldown<=0){
	         text_bar=0;
	        }else if(click_check){
	            obj_cursor.image_index=2;
            
	            if (cooldown<=0) and (mouse_left==1) and (text_bar=0){
	                cooldown=8000;
	                text_bar=1;
	                keyboard_string=obj_ini.company_title[managing];
	            }
            
	        }
	        draw_set_alpha(1);
        
	        if (obj_ini.company_title[managing]!="") or (text_bar>0){draw_set_font(fnt_fancy);
	            if (text_bar=0) or (text_bar>31) then draw_text(xx+800,yy+110,string_hash_to_newline("''"+string(obj_ini.company_title[managing])+"'' "));
	            if (text_bar>0) and (text_bar<=31) then draw_text(xx+800,yy+110,string_hash_to_newline("''"+string(obj_ini.company_title[managing])+"|''"));
	        }
	    }
    
	    // var we;we=string_width(string(global.chapter_name)+" "+string(fx))/2;
    
		// Draw arrows
	    draw_sprite_ext(spr_arrow,0,xx+25,yy+70,2,2,0,c_white,1);// Back
	    draw_sprite_ext(spr_arrow,0,xx+429,yy+70,2,2,0,c_white,1);// Left
	    draw_sprite_ext(spr_arrow,1,xx+1110,yy+70,2,2,0,c_white,1);// Right
    
	    draw_set_color(0);
	    draw_rectangle(xx+1005,yy+142,xx+1576,yy+957,0);
    
	    draw_set_color(c_gray);
	    draw_line(xx+1005,yy+519,xx+1576,yy+519);
    
	    draw_set_font(fnt_40k_14b);
    
	    var cn=obj_controller;
		
	    if (instance_exists(cn)) and (is_struct(temp[120])){
	    	var selected_unit = temp[120];				//unit struct
	        if (cn.temp[101]!="") and (cn.temp[100]=="1"){
	            ui_arm[1]=true;
				ui_arm[2]=true;
				
	            ui_xmod[1]=0;
				ui_xmod[2]=0;
				
	            ui_ymod[1]=0;
				ui_ymod[2]=0;
				
	            ui_weapon[1]=spr_weapon_blank;
				ui_weapon[2]=spr_weapon_blank;
				
	            ui_back=true;
				ui_force_both=false;
				
	            var cpec;
				cspec=obj_ini.col_special;
            
	            var terg=0,armour_sprite=spr_weapon_blank,show1,show2;
	            var jump=0,dev=0,hood=0,skull=0,arm=0,halo=0,braz=0,slow=0,brothers=-5,body_part;
            
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
            
	            if (ui_specialist=7) or (ui_specialist=1) or (ui_specialist=111){
					for(var o=1; o<=4; o++){if (obj_ini.adv[o]="Reverent Guardians") then braz=1;}}
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
	                    if (cspec=0) or (cspec>1) then arm=1;
	                    if (cspec=1) then arm=0;
	                }
	                if (mas>0){
	                	switch(cspec){
	                		case 0:
	                			arm=10;
	                			break;
	                		case 1:
	                			arm=11;
	                			break;
	                		case 2:
	                			arm=12;
	                			break;	                				                			
	                	}
	                }
	            }
            
	            // if (terg>0) then ui_back=false;
            
	            if (show_mobi="Jump Pack"){
					ui_back=false;
					jump=1;
				}
				
	            if (string_count(obj_ini.role[100,9],cn.temp[101])>0){
					ui_back=false;
					dev=1;
				}
				
	            if (show_arm="Terminator Armour"){
					ui_back=false;
					terg=1;
				}
				
	            if (show_arm="Tartaros"){
					ui_back=false;
					terg=2;
				}
				
	            if (show_arm="Dreadnought"){
					ui_back=false;
					terg=5;
				}
				
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
	                if (ma_role[sel]=obj_ini.role[100,15]) and ((global.chapter_name="Blood Angels") or (obj_ini.progenitor==5)) then ui_specialist=4;// Sanguinary
	                if (ma_role[sel]=obj_ini.role[100,16]) then ui_specialist=5;// Techmarine
	                if (ma_role[sel]=obj_ini.role[100,17]) then ui_specialist=7;// Librarian
	                */
                
	                ttrim=trim;
					cspec=obj_ini.col_special;
					
					// Chaplain
	                if (ui_specialist=1) or ((ui_specialist=3) and (global.chapter_name="Space Wolves")){
	                    shader_set_uniform_f(colour_to_set1, 30/255,30/255,30/255);
	                    shader_set_uniform_f(colour_to_set2, 30/255,30/255,30/255);
	                    // ttrim=0;
	                    cspec=0;
	                }
					
					// Apothecary
	                if (ui_specialist=3) and (global.chapter_name!="Space Wolves"){
	                    shader_set_uniform_f(colour_to_set1, 255/255,255/255,255/255);
	                    shader_set_uniform_f(colour_to_set2, 255/255,255/255,255/255);
	                    ttrim=0;cspec=0;
	                }
					
					// Techmarine
	                if (ui_specialist=5){
	                    shader_set_uniform_f(colour_to_set1, 150/255,0/255,0/255);
	                    shader_set_uniform_f(colour_to_set2, 150/255,0/255,0/255);
	                    // pauldron
	                    shader_set_uniform_f(colour_to_set4, 0/255,70/255,0/255);
	                    shader_set_uniform_f(colour_to_set5, 200/255,200/255,200/255);
	                    ttrim=1;cspec=0;
	                }
					
					// Death Company
	                if (ui_specialist=15){
	                    shader_set_uniform_f(colour_to_set1, 30/255,30/255,30/255);
	                    shader_set_uniform_f(colour_to_set2, 30/255,30/255,30/255);
	                    shader_set_uniform_f(colour_to_set3, 30/255,30/255,30/255);
	                    shader_set_uniform_f(colour_to_set4, 124/255,0/255,0/255);// Lens
	                    shader_set_uniform_f(colour_to_set5, 30/255,30/255,30/255);
	                    shader_set_uniform_f(colour_to_set6, 30/255,30/255,30/255);
	                    shader_set_uniform_f(colour_to_set7, 124/255,0/255,0/255);// Weapon
	                    ttrim=0;cspec=0;
	                }
					
					// Deathwing
	                if (ui_coloring="bone"){
	                    shader_set_uniform_f(colour_to_set1, 255/255,217/255,193/255);
	                    shader_set_uniform_f(colour_to_set2, 255/255,217/255,193/255);
	                    shader_set_uniform_f(colour_to_set3, 255/255,217/255,193/255);
	                    shader_set_uniform_f(colour_to_set5, 255/255,217/255,193/255);
	                    shader_set_uniform_f(colour_to_set6, 255/255,217/255,193/255);
	                    ttrim=0;cspec=0;
	                }
					
					// Blood Angels
	                if (ui_coloring="gold"){
	                    shader_set_uniform_f(colour_to_set1, 166/255,129/255,0/255);
	                    shader_set_uniform_f(colour_to_set2, 166/255,129/255,0/255);
	                    shader_set_uniform_f(colour_to_set3, 166/255,129/255,0/255);
	                    shader_set_uniform_f(colour_to_set5, 166/255,129/255,0/255);
	                    shader_set_uniform_f(colour_to_set6, 166/255,129/255,0/255);
	                    ttrim=0;cspec=0;
	                }
                
					// Marine draw sequence
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
                
	                var clothing_style=3;
	                if (global.chapter_name=="Dark Angels") or (obj_ini.progenitor==1) then clothing_style=0;
	                if (global.chapter_name=="White Scars") or (obj_ini.progenitor==2) then clothing_style=1; 
	                if (global.chapter_name=="Space Wolves") or (obj_ini.progenitor==3) then clothing_style=2;
	                if (global.chapter_name=="Imperial Fists") or (obj_ini.progenitor==4) then clothing_style=0;
	                if (global.chapter_name=="Iron Hands") or (obj_ini.progenitor==6) then clothing_style=0;
	                if (global.chapter_name=="Salamanders") or (obj_ini.progenitor==8) then clothing_style=4;
	                if (global.chapter_name=="Raven Guard") or (obj_ini.progenitor==9) then clothing_style=0;
	                if (global.chapter_name=="Doom Benefactors") then clothing_style=4;
                
	                // Determine Sprite
	                if (skull=-50) then skull=1;
                
	                if (temp[102]!=""){
	                    var yep=0;
						for(var o=1;o<=4;o++){if (obj_ini.adv[o]="Slow and Purposeful") then slow=1;}
	                    if (ui_specialist=5){
							yep=0;
							for(var o=1;o<=4;o++){if (obj_ini.adv[o]="Tech-Brothers") then brothers=0;}
						}
	                }
                
					// Define armour
	                if (temp[102]="") then armour_sprite=spr_weapon_blank;
					
	                if (temp[102]="Scout Armour"){
						if (slow>0) then slow=10;
						armour_sprite=spr_scout_colors;
						if (hood=-50) then hood=0;
					}
	                if (temp[102]="MK3 Iron Armour"){
						if (slow>0) then slow=13;
						if (brothers>-5) then brothers=3;
						armour_sprite=spr_iron2_colors;
						if (hood=-50) then hood=5;
					}
	                if (temp[102]="MK4 Maximus"){
						if (slow>0) then slow=13;
						if (brothers>-5) then brothers=3;
						armour_sprite=spr_maximus_colors;
						if (hood=-50) then hood=6;
					}
					if (temp[102]="MK5 Heresy"){
						if (slow>0) then slow=13;
						if (brothers>-5) then brothers=3;
						armour_sprite=spr_heresy_colors;
						if (hood=-50) then hood=6;
					}
	                if (temp[102]="MK6 Corvus"){
						if (slow>0) then slow=13;
						if (brothers>-5) then brothers=2;
						armour_sprite=spr_beakie_colors;
						if (hood=-50) then hood=3;
					}
	                if (temp[102]="MK7 Aquila") or (temp[102]="Power Armour"){
						if (brothers>-5) then brothers=0;
						if (slow>0) then slow=13;
						armour_sprite=spr_aquila_colors;
						if (hood=-50) then hood=1;
					}
	                if (temp[102]="MK8 Errant"){
						if (slow>0) then slow=13;
						if (brothers>-5) then brothers=0;
						armour_sprite=spr_errant_colors;
						if (hood=-50) then hood=4;
					}
	                if (show_arm="Artificer Armour"){
						if (slow>0) then slow=13;
						if (brothers>-5) then brothers=1;
						armour_sprite=spr_artificer_colors;
						if (hood=-50) then hood=2;
					}
	                if (temp[102]="Tartaros"){
						armour_sprite=spr_tartaros2_colors;
						if (brothers>-5) then brothers=4;
						if (hood=-50) then hood=8;
						if (skull==1) then skull=3;
					}
	                if (show_arm="Terminator Armour"){
						armour_sprite=spr_terminator2_colors;
						if (brothers>-5) then brothers=5;
						if (hood=-50) then hood=9;
						if (skull==1) then skull=2;
					}
	                if (show_arm="Dreadnought") then armour_sprite=spr_dread_colors;
                
	                if (armour_sprite=spr_weapon_blank) and (temp[102]!=""){
	                    if (string_count("Power Armour",temp[102])>0){
							if (slow>0) then slow=13;
							if (brothers>-5) then brothers=0;
							armour_sprite=spr_aquila_colors;
							if (hood=-50) then hood=1;
						}
	                    if (string_count("Artifi",temp[102])>0){
							if (slow>0) then slow=13;
							if (brothers>-5) then brothers=1;
							armour_sprite=spr_artificer_colors;
							if (hood=-50) then hood=2;
						}
	                    if (string_count("Termi",temp[102])>0){
							if (brothers>-5) then brothers=5;
							armour_sprite=spr_terminator2_colors;
							if (hood=-50) then hood=9;
							if (skull==1) then skull=2;
						}
	                    if (string_count("Dread",temp[102])>0) then armour_sprite=spr_dread_colors;
	                }
	                /*if (show_arm!=0){
	                    if (string_count("Power Armour",temp[102])>0){if (slow>0) then slow=13;if (brothers>-5) then brothers=0;armour_sprite=spr_aquila_colors;if (hood=-50) then hood=1;}
	                    if (string_count("Artifi",temp[102])>0){if (slow>0) then slow=13;if (brothers>-5) then brothers=1;armour_sprite=spr_artificer_colors;if (hood=-50) then hood=2;}
	                    if (string_count("Termi",temp[102])>0){if (brothers>-5) then brothers=5;armour_sprite=spr_terminator2_colors;if (hood=-50) then hood=9;if (skull=1) then skull=2;}
	                    if (string_count("Dread",temp[102])>0) then armour_sprite=spr_dread_colors;
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
	                    if (cspec==0) then draw_sprite(armour_sprite,10,xx+1208,yy+178);
	                    if (cspec==1) then draw_sprite(armour_sprite,11,xx+1208,yy+178);
	                    if (cspec>=2) then draw_sprite(armour_sprite,12,xx+1208,yy+178);
	                }
	                if (ui_back=false) and (terg<5) and (temp[102]!=""){
	                    if (jump==1){
	                        if (cspec==0) then draw_sprite(spr_pack_jump,0,xx+1208,yy+178);
	                        if (cspec==1) then draw_sprite(spr_pack_jump,1,xx+1208,yy+178);
	                        if (cspec>=2) then draw_sprite(spr_pack_jump,2,xx+1208,yy+178);
	                    }
	                    if (dev==1){
	                        if (cspec==0) then draw_sprite(spr_pack_devastator,0,xx+1208,yy+178);
	                        if (cspec==1) then draw_sprite(spr_pack_devastator,1,xx+1208,yy+178);
	                        if (cspec>=2) then draw_sprite(spr_pack_devastator,2,xx+1208,yy+178);
	                    }
	                }
                
	                if (braz=1) and (cn.temp[102]!="") and (blandify=0){
	                    if (terg==0) then draw_sprite(spr_pack_brazier,0,xx+1208,yy+178);
	                    if (terg>0) then draw_sprite(spr_pack_brazier,1,xx+1206,yy+178);
	                }
                
	                // Draw the Iron Halo
	                if (halo=1) and (temp[102]!=""){var st;st=false;
	                    if (hood==0) and (terg<1) and (temp[102]!="") and (ui_specialist=14) and ((obj_ini.progenitor=5) or (global.chapter_name="Blood Angels")) then st=true;
	                    if (st==false) then draw_sprite(spr_gear_halo,0,xx+1208,yy+178);
	                }
                
	                // Weapons for below arms
	                if (ui_weapon[1]!=0) and (sprite_exists(ui_weapon[1])) and (ui_above[1]==false) and (fix_left<8){
	                    if (ui_twoh[1]==false) and (ui_twoh[2]==false) then draw_sprite(ui_weapon[1],0,xx+1208+ui_xmod[1],yy+178+ui_ymod[1]);
	                    if (ui_twoh[1]==true){
	                        if (cspec<=1) then draw_sprite(ui_weapon[1],0,xx+1208+ui_xmod[1],yy+178+ui_ymod[1]);
	                        if (cspec>=2) then draw_sprite(ui_weapon[1],3,xx+1208+ui_xmod[1],yy+178+ui_ymod[1]);
	                        if (ui_force_both==true){
	                            if (cspec<=1) then draw_sprite(ui_weapon[1],0,xx+1208+ui_xmod[1],yy+178+ui_ymod[1]);
	                            if (cspec>=2) then draw_sprite(ui_weapon[1],1,xx+1208+ui_xmod[1],yy+178+ui_ymod[1]);
	                        }
	                    }
	                }
	                if (ui_weapon[2]!=0) and (ui_above[2]==false) and (sprite_exists(ui_weapon[2])) and ((ui_twoh[1]==false) or (ui_force_both==true)) and (fix_right<8){
	                    if (ui_spec[2]==false) then draw_sprite(ui_weapon[2],1,xx+1208+ui_xmod[2],yy+178+ui_ymod[2]);
	                    if (ui_spec[2]==true){
	                        if (cspec<=1) then draw_sprite(ui_weapon[2],2,xx+1208+ui_xmod[2],yy+178+ui_ymod[2]);
	                        if (cspec>=2) then draw_sprite(ui_weapon[2],3,xx+1208+ui_xmod[2],yy+178+ui_ymod[2]);
	                    }
	                }
                
	                if (temp[102]=="") or (temp[102]=="None") or (temp[102]=="(None)"){
	                    if (ui_specialist==111) and (global.chapter_name=="Doom Benefactors") then skin=6;
                    
	                    draw_sprite(spr_marine_base,skin,xx+1208,yy+178);
                    
	                    if (skin!=6) then draw_sprite(spr_clothing_colors,clothing_style,xx+1208,yy+178);
	                }
	                if (temp[102]="Scout Armour"){
	                    draw_sprite(spr_marine_base,skin,xx+1208,yy+178);
	                    draw_sprite(spr_marine_base,5,xx+1208,yy+178);// Kind of crops the 'skin tone' pixels below the scout ones
	                    draw_sprite(armour_sprite,cspec,xx+1208,yy+178);
	                    draw_sprite(spr_facial_colors,clothing_style,xx+1208,yy+178);
	                }
	                if (temp[102]="MK3 Iron Armour"){
	                    draw_sprite(armour_sprite,col_special,xx+1208,yy+178);
	                    if (ttrim==0) and (cspec<=1) then draw_sprite(spr_iron2_colors,4,xx+1208,yy+178);
	                    if (ttrim==0) and (cspec>=2) then draw_sprite(spr_iron2_colors,5,xx+1208,yy+178);
	                }
	                if (temp[102]="MK4 Maximus"){
	                    draw_sprite(armour_sprite,cspec,xx+1208,yy+178);
	                    if (ttrim==0) and (cspec<=1) then draw_sprite(spr_maximus_colors,4,xx+1208,yy+178);
	                    if (ttrim==0) and (cspec>=2) then draw_sprite(spr_maximus_colors,5,xx+1208,yy+178);
	                }
	                if (temp[102]="MK5 Heresy"){
	                    draw_sprite(armour_sprite,cspec,xx+1208,yy+178);
	                    if (ttrim==0) and (cspec<=1) then draw_sprite(spr_heresy_colors,4,xx+1208,yy+178);
	                    if (ttrim==0) and (cspec>=2) then draw_sprite(spr_heresy_colors,5,xx+1208,yy+178);
	                }
	                if (temp[102]="MK6 Corvus"){
	                    draw_sprite(armour_sprite,cspec,xx+1208,yy+178);
	                    if (ttrim==0) and (cspec<=1) then draw_sprite(spr_beakie_colors,4,xx+1208,yy+178);
	                    if (ttrim==0) and (cspec>=2) then draw_sprite(spr_beakie_colors,5,xx+1208,yy+178);
	                }
	                if (temp[102]="MK7 Aquila") or (show_arm="Power Armour"){
	                    draw_sprite(armour_sprite,cspec,xx+1208,yy+178);
	                    if (ttrim==0) and (cspec<=1) then draw_sprite(spr_aquila_colors,4,xx+1208,yy+178);
	                    if (ttrim==0) and (cspec>=2) then draw_sprite(spr_aquila_colors,5,xx+1208,yy+178);
	                }
	                if (temp[102]="MK8 Errant"){
	                    draw_sprite(armour_sprite,cspec,xx+1208,yy+178);
	                    if (ttrim==0) and (cspec<=1) then draw_sprite(spr_errant_colors,4,xx+1208,yy+178);
	                    if (ttrim==0) and (cspec>=2) then draw_sprite(spr_errant_colors,5,xx+1208,yy+178);
	                }
	                if (show_arm="Artificer Armour"){
	                    draw_sprite(armour_sprite,cspec,xx+1208,yy+178);
	                    if (ttrim==0) and (cspec<=1) then draw_sprite(spr_artificer_colors,4,xx+1208,yy+178);
	                    if (ttrim==0) and (cspec>=2) then draw_sprite(spr_artificer_colors,5,xx+1208,yy+178);
	                }
	                if (terg=2){
	                    draw_sprite(armour_sprite,cspec,xx+1208,yy+178);
	                    if (ttrim==0) and (cspec<=1) then draw_sprite(spr_tartaros2_colors,4,xx+1208,yy+178);
	                    if (ttrim==0) and (cspec>=2) then draw_sprite(spr_tartaros2_colors,5,xx+1208,yy+178);
	                }
	                if (terg=1){
	                    draw_sprite(armour_sprite,cspec,xx+1208,yy+178);
	                    if (ttrim==0) and (cspec<=1) then draw_sprite(spr_terminator2_colors,4,xx+1208,yy+178);
	                    if (ttrim==0) and (cspec>=2) then draw_sprite(spr_terminator2_colors,5,xx+1208,yy+178);
	                }
	                if (terg=5){
	                    draw_sprite(spr_dread_colors,cspec,xx+1208,yy+178);
	                }
                
	                if (slow>=10) and (blandify=0) then draw_sprite(armour_sprite,slow,xx+1208,yy+178);// Slow and Purposeful battle damage
	                if (brothers>=0) and (blandify=0) then draw_sprite(spr_gear_techb,brothers,xx+1208,yy+178);// Tech-Brothers bling
                
                
	                // This draws the arms
	                if (show_arm!="Dreadnought") and (cspec<=1) and (temp[102]!=""){
	                    if (ui_arm[1]=true) then draw_sprite(armour_sprite,6,xx+1208,yy+178);if (ui_arm[2]=true) then draw_sprite(armour_sprite,8,xx+1208,yy+178);
	                }
	                if (show_arm!="Dreadnought") and (cspec>=2) and (temp[102]!=""){
	                    if (ui_arm[1]=true) then draw_sprite(armour_sprite,6,xx+1208,yy+178);if (ui_arm[2]=true) then draw_sprite(armour_sprite,9,xx+1208,yy+178);
	                }
                
	                // Apothecary Lens
	                if (ui_specialist=3) and (temp[102]!=""){
	                    if (terg=2) then draw_sprite(spr_gear_apoth,1,xx+1208-2,yy+181);// was 178-4 with old tartar
	                    if (terg=1) then draw_sprite(spr_gear_apoth,1,xx+1208-4,yy+182);
	                    if (terg!=1) and (terg!=2) then draw_sprite(spr_gear_apoth,1,xx+1208,yy+178);
	                }
                
	                // Hood
	                if (hood>0) and (temp[102]!=""){
	                    var yep=0;
						
						for(var o=1;o<=4;o++){if (obj_ini.adv[o]="Daemon Binders") and (blandify=0) then yep=1;}
	                    if (yep=0) or (hood>=7){
	                        if (obj_ini.main_color=obj_ini.secondary_color) then draw_sprite(spr_gear_hood1,hood,xx+1208,yy+178);
	                        if (obj_ini.main_color!=obj_ini.secondary_color) then draw_sprite(spr_gear_hood3,hood,xx+1208,yy+178);
	                    }
	                    if (yep=1) and (hood<7){
	                        if (ttrim=1) then draw_sprite(spr_gear_hood2,0,xx+1206,yy+167);
	                        if (ttrim==0) then draw_sprite(spr_gear_hood2,1,xx+1206,yy+167);
	                    }
	                }
					//Chaplain head and Terminator version
	                if (skull>0) and (ui_specialist=1) and (temp[102]!=""){
	                    if (terg!=2) and (terg!=1) then draw_sprite(spr_gear_chap,skull,xx+1206,yy+167);
	                    if (terg=2) then draw_sprite(spr_gear_chap,skull,xx+1206,yy+167);
	                    if (terg=1) then draw_sprite(spr_gear_chap,skull,xx+1206,yy+167);
	                    if (temp[102]!="Terminator"){
	                      if (terg=2) or (terg=1) then draw_sprite(spr_terminator_chap,1,xx+1206,yy+167);
	                 }
	                }
					
					// bionics
					
					
					for (body_part = 0; body_part<array_length(global.body_parts);body_part++){
						if (struct_exists(selected_unit.body[$ global.body_parts[body_part]], "bionic")){
							bionic_tooltip+=string("standard bionic {0}#",global.body_parts_display[body_part]);
							array_push(body_augmentations.bionics[0], body_part);
							array_push(body_augmentations.bionics[1], global.body_parts[body_part]);
							if (!array_contains(["Dreadnought", "Terminator Armour", "Tartaros"], selected_unit.armour())){
								if (global.body_parts[body_part] == "left_eye") {
									if (selected_unit.armour() == "MK3 Iron Armour"){
										draw_sprite(spr_bionics_eye,0,xx+1203,yy+178)
									} else{
										draw_sprite(spr_bionics_eye,0,xx+1203,yy+174)
									}
								};
								if (global.body_parts[body_part] == "right_eye") {
									if (selected_unit.armour() == "MK3 Iron Armour"){
										draw_sprite(spr_bionics_eye,1,xx+1204,yy+178);
									} else{
										draw_sprite(spr_bionics_eye,1,xx+1204,yy+174);
									}
								};
								if (global.body_parts[body_part] == "left_leg") {draw_sprite(spr_bionics_leg,1,xx+1208,yy+178)};
								if (global.body_parts[body_part] == "right_leg") {draw_sprite(spr_bionics_leg,0,xx+1208,yy+178)};
								if (global.body_parts[body_part] == "left_arm") {draw_sprite(spr_bionics_arm,1,xx+1208,yy+178)};
								if (global.body_parts[body_part] == "right_arm") {draw_sprite(spr_bionics_arm,0,xx+1208,yy+178)};
							}
						}
					}
                
	                // Honor Guard Helm
	                if (hood==0) and (terg<1) and (temp[102]!="") and (ui_specialist==14){
	                    var helm_ii,o,yep;
                    	helm_ii=0;
	                    if (obj_ini.progenitor=7) or (global.chapter_name="Ultramarines") then helm_ii=1;
	                    if (obj_ini.progenitor=5) or (global.chapter_name="Blood Angels") then helm_ii=5;
      
						yep=0;
						for(var p=1; p<=4;p++){
							if (obj_ini.adv[p]="Tech-Brothers") then yep=1;
						}
						if (yep=1) then helm_ii=2;
	          			yep=0;
						for(var q=1; q<=4;q++){
							if (obj_ini.dis[q]="Never Forgive") then yep=1;
						}
						if (yep=1) or (obj_ini.progenitor==1) then helm_ii=3;
	                    yep=0;
						for(var r=1; r<=4;r++){
							if (obj_ini.adv[r]="Reverent Guardians") then yep=1;
						}
						if (yep==1) then helm_ii=4;
	                    draw_sprite(spr_honor_helm,helm_ii,xx+1206,yy+167);
					}
	                // Weapons for above arms
	                if (ui_weapon[1]!=0) and (sprite_exists(ui_weapon[1])) and (ui_above[1]==true) and (fix_left<8){
	                    if (ui_twoh[1]==false) and (ui_twoh[2]==false) then draw_sprite(ui_weapon[1],0,xx+1208+ui_xmod[1],yy+178+ui_ymod[1]);
	                    if (ui_twoh[1]==true){
	                        if (cspec<=1) then draw_sprite(ui_weapon[1],0,xx+1208+ui_xmod[1],yy+178+ui_ymod[1]);
	                        if (cspec>=2) then draw_sprite(ui_weapon[1],3,xx+1208+ui_xmod[1],yy+178+ui_ymod[1]);
	                        if (ui_force_both==true){
	                            if (cspec<=1) then draw_sprite(ui_weapon[1],0,xx+1208+ui_xmod[1],yy+178+ui_ymod[1]);
	                            if (cspec>=2) then draw_sprite(ui_weapon[1],1,xx+1208+ui_xmod[1],yy+178+ui_ymod[1]);
	                        }
	                    }
	                }
	                if (ui_weapon[2]!=0) and (ui_above[2]==true) and (sprite_exists(ui_weapon[2])) and ((ui_twoh[1]==false) or (ui_force_both==true)) and (fix_right<8){
	                    if (ui_spec[2]==false) then draw_sprite(ui_weapon[2],1,xx+1208+ui_xmod[2],yy+178+ui_ymod[2]);
	                    if (ui_spec[2]==true){
	                        if (cspec<=1) then draw_sprite(ui_weapon[2],2,xx+1208+ui_xmod[2],yy+178+ui_ymod[2]);
	                        if (cspec>=2) then draw_sprite(ui_weapon[2],3,xx+1208+ui_xmod[2],yy+178+ui_ymod[2]);
	                    }
	                }
                
	                // New powerfists for termi/tartaros
	                if (ui_weapon[1]!=0){
		                if  (fix_left==8){
		                	draw_sprite(spr_weapon_powfist3,0,xx+1208+ui_xmod[1],yy+178+ui_ymod[1])
		                } else if(fix_left==8.1){
		                	draw_sprite(spr_weapon_lightning2,0,xx+1208+ui_xmod[1],yy+178+ui_ymod[1]);
		                }
		                if (fix_right==8){
		                	draw_sprite(spr_weapon_powfist3,1,xx+1208+ui_xmod[2],yy+178+ui_ymod[2]);
		                } else if(fix_right==8.1){
		                	draw_sprite(spr_weapon_lightning2,1,xx+1208+ui_xmod[2],yy+178+ui_ymod[2]);
		                }
	            	}
                
	                // Draw the fixed upper hands for Terminators or Tartaros
	                if (terg==1){
	                    if (fix_left>0) and (fix_left!=2) and (fix_left!=4) and (fix_left<8) then draw_sprite(spr_termi_wep_fix,4,xx+1208,yy+178);
	                    if (fix_right>0) and (fix_right!=2) and (fix_right!=4) and (fix_right<8){
	                        if (cspec<=1) then draw_sprite(spr_termi_wep_fix,6,xx+1208,yy+178);
	                        if (cspec>=2) then draw_sprite(spr_termi_wep_fix,7,xx+1208,yy+178);
	                    }
	                }
	                if (terg==2){
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
	            if (cn.temp[100]=="3"){
	                if (string_count("Techpriest",cn.temp[101])>0) then draw_sprite(spr_techpriest,0,xx+1208,yy+178);
	            }
	            if (cn.temp[100]=="4"){
	                if (string_count("Crusader",cn.temp[101])>0) then draw_sprite(spr_crusader,0,xx+1208,yy+178);
	            }
	            if (cn.temp[100]=="5"){
	                if (string_count("Sister of Battle",cn.temp[101])>0) then draw_sprite(spr_sororitas,0,xx+1208,yy+178);
	                if (string_count("Sister Hospitaler",cn.temp[101])>0) then draw_sprite(spr_sororitas,1,xx+1208,yy+178);
	            }
	            if (cn.temp[100]=="6"){
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
			// Display information on the marine
	        if (cn.temp[113]!="") then draw_text(xx+1190,yy+420,string_hash_to_newline("Experience: "+string(cn.temp[113])));
	      	if (cn.temp[114]!=""){
        		var_text = string_hash_to_newline(string("Bionics: {0}",selected_unit.bionics()))
	        	x1 = xx+1365;
	        	y1 = yy+420;
	        	x2 = x1+string_width(var_text);
	        	y2 = y1+string_height(var_text);
		        draw_set_color(c_gray);
		        draw_text(x1,y1,var_text);
		        if (bionic_tooltip !=""){
		        	array_push(tooltip_drawing, [bionic_tooltip, [x1,y1,x2,y2]]);
		    	} else{
		    		array_push(tooltip_drawing, ["No bionic Augmentations", [x1,y1,x2,y2]]);
		    	}
	    	}

        	if (cn.temp[112]!=""){
        		var_text = string_hash_to_newline(string("Health: {0}",cn.temp[112]))
	        	tooltip_text = string_hash_to_newline(string("CON : {0}", selected_unit.constitution));
	        	x1 = xx+1015;
	        	y1 = yy+420;
	        	x2 = x1+string_width(var_text);
	        	y2 = y1+string_height(var_text);
		        draw_set_color(c_gray);
		        draw_text(x1,y1,var_text);
		        array_push(tooltip_drawing, [tooltip_text, [x1,y1,x2,y2]]);
	    	}	        
        	
        	if (cn.temp[116]!=""){
        		var_text = string_hash_to_newline(string("Melee Attack: {0}",cn.temp[116]))
	        	tooltip_text = string_hash_to_newline(string("WS : {0}#STR : {1}", selected_unit.weapon_skill, selected_unit.strength));
	        	x1 = xx+1015;
	        	y1 = yy+442;
	        	x2 = x1+string_width(var_text);
	        	y2 = y1+string_height(var_text);
		        draw_set_color(c_gray);
		        if (ui_melee_penalty>0) then draw_set_color(c_red);
		        draw_text(x1,y1,var_text);
		        array_push(tooltip_drawing, [tooltip_text, [x1,y1,x2,y2]]);
	    	}

        	if (cn.temp[117]!=""){
        		var_text = string_hash_to_newline(string("Ranged Attack: {0}",cn.temp[117]))
	        	tooltip_text = string_hash_to_newline(string("BS : {0}#DEX : {1}", selected_unit.ballistic_skill, selected_unit.dexterity));
	        	x1 = xx+1190;
	        	y1 = yy+442;
	        	x2 = x1+string_width(var_text);
	        	y2 = y1+string_height(var_text);
		        draw_set_color(c_gray);
		        if (ui_ranged_penalty>0) then draw_set_color(c_red);
		        draw_text(x1,y1,var_text);
		        array_push(tooltip_drawing, [tooltip_text, [x1,y1,x2,y2]]);
	    	}	 

        	if (cn.temp[118]!=""){
        		var_text = string_hash_to_newline(string("Damage Resistance: {0}",cn.temp[118]))
	        	tooltip_text = string_hash_to_newline(string("CON : {0}", selected_unit.constitution));
	        	x1 = xx+1365;
	        	y1 = yy+442;
	        	x2 = x1+string_width(var_text);
	        	y2 = y1+string_height(var_text);
		        draw_set_color(c_gray);
		        draw_text(x1,y1,var_text);
		        array_push(tooltip_drawing, [tooltip_text, [x1,y1,x2,y2]]);
	    	}
        
	        draw_set_font(fnt_40k_14i);
	        if (cn.temp[119]!="") then draw_text(xx+1020,yy+468,string_hash_to_newline(string(cn.temp[119])));
	    }
    
	    draw_set_font(fnt_40k_14);draw_set_halign(fa_left);
		
	    // Back
	    var top=man_current,sel=top,temp1="",temp2="",temp3="",temp4="",temp5="";
    
		// Var creation
	    var ma_ar="",ma_we1="",ma_we2="",ma_ge="",ma_mb="",ttt=0;
	    var ar_ar=0,ar_we1=0,ar_we2=0,ar_ge=0,ar_mb=0,eventing=false;
	        
	    yy+=77;
		
	    var unit_specialism_option=false, spec_tip="", tooltip_set=[];
		var repetitions=min(man_max,man_see);

		//tooltip text to tell you if a unit is eligible for special roles
		var spec_tips = [string("{0} Potential",obj_ini.role[100,16]),		
						string("{0} potential",obj_ini.role[100,15]),
						string("{0} potential",obj_ini.role[100,14]),
						"Librarium potential"];
	    for(var i=0; i<repetitions;i++){

	    	while (man[sel]=="hide") and (sel<500){sel+=1;}

			eventing=false;
        
	        if (man[sel]=="man"){
				unit = display_unit[sel];
				if (unit.name()==""){continue;}
				var unit_location = unit.marine_location();
	            temp1=unit.name_role();
	            unit_specialism_option=false;
	            // temp1=string(managing)+"."+string(ide[sel]);
            
	            temp2=string(ma_loc[sel]);
	            if (unit_location[0]==location_types.planet){
					temp2 = unit_location[2];
					//get roman numeral for system planet
					temp2 += romanNumerals[unit_location[1]-1];
	            } else if(unit_location[0]==location_types.ship){
					temp2 = obj_ini.ship[unit_location[1]]
				}
	            if (fest_planet==0) and (fest_sid>0) and (fest_repeats>0) and (ma_lid[sel]==fest_sid){
					temp2="=Event=";
					eventing=true;
				}
	            if (fest_planet==1) and (fest_wid>0) and (fest_repeats>0) and (ma_wid[sel]==fest_wid) and (ma_loc[sel]==fest_star){
					temp2="=Event=";
					eventing=true;
				}
	            if (ma_god[sel]>=10) then temp2="=Penitorium=";
                   
	            temp3=string((unit.hp()/unit.max_health())*100)+"% HP";
            
	            temp4=string(ma_exp[sel])+" exp";
            
	            ma_ar="";ma_we1="";ma_we2="";ma_ge="";ma_mb="";ttt=0;
	            ar_ar=0;ar_we1=0;ar_we2=0;ar_ge=0;ar_mb=0;
            
	            if (ma_armour[sel]!=""){
					ma_ar=scr_wep_abbreviate(ma_armour[sel]);
	                // if (string_count("*",ma_ar)>0){ar_ar=2;ma_ar=string_replace(ma_ar,"*","");}
	                if (string_count("^",ma_armour[sel])>0){
						ar_ar=1;
						ma_ar=string_replace(ma_ar,"^","");
					}
	                if (string_count("&",ma_armour[sel])>0){
						ar_ar=2;
						ma_ar="Artifact";
					}
	            }
	            if (ma_gear[sel]!=""){
					ma_ge=scr_wep_abbreviate(ma_gear[sel]);
	                if (string_count("^",ma_gear[sel])>0){
						ar_ge=1;
						ma_ge=string_replace(ma_ge,"^","");
					}
	                if (string_count("&",ma_gear[sel])>0){
						ar_ge=2;
						ma_ge="Artifact";
					}
	            }
	            if (ma_mobi[sel]!=""){
					ma_mb=scr_wep_abbreviate(ma_mobi[sel]);
	                if (string_count("^",ma_mobi[sel])>0){
						ar_mb=1;
						ma_mb=string_replace(ma_mb,"^","");
					}
	                if (string_count("&",ma_mobi[sel])>0){
						ar_mb=2;
						ma_mb="Artifact";
					}
	            }
	            if (ma_wep1[sel]!=""){
					ma_we1=scr_wep_abbreviate(ma_wep1[sel]);
	                if (string_count("^",ma_wep1[sel])>0){
						ar_we1=1;
						ma_we1=string_replace(ma_we1,"^","");
					}
	                if (string_count("&",ma_wep1[sel])>0){
						ar_we1=2;
						ma_we1="Artifact";
					}
	            }
	            if (ma_wep2[sel]!=""){
					ma_we2=scr_wep_abbreviate(ma_wep2[sel]);
	                if (string_count("^",ma_wep2[sel])>0){
						ar_we2=1;
						ma_we2=string_replace(ma_we2,"^","");
					}
	                if (string_count("&",ma_wep2[sel])>0){
						ar_we2=2;
						ma_we2="Artifact";
					}
	            }
	        }else if (man[sel]=="vehicle"){
	            // temp1="v "+string(managing)+"."+string(ide[sel]);
	            temp1=string(ma_role[sel]);
	            temp2=string(ma_loc[sel]);
            
	            if (ma_wid[sel]!=0){
	            	//numeral for vehicle planet
	            	temp2 += romanNumerals[ma_wid[sel]-1];
	            }
	            temp3=string(round(ma_health[sel]))+"% HP";temp4="";
	            // Need abbreviations here

	            ma_ar="";
	            ma_we1="";
	            ma_we2="";
	            ma_ge="";
	            ma_mb="";
	            ttt=0;
	            ar_ar=0;
	            ar_we1=0;
	            ar_we2=0;
	            ar_ge=0;
	            ar_mb=0;

				if (ma_armour[sel]!=""){
					ma_ar=scr_wep_abbreviate(ma_armour[sel]);// vehicle weapon 3
					if (string_count("^",ma_armour[sel])>0){
						ar_ar=1;
						ma_ar=string_replace(ma_ar,"^","");
					}
					if (string_count("&",ma_armour[sel])>0){
						ar_ar=2;
						ma_ar="Artifact";
					}
				}
				if (ma_gear[sel]!=""){
					ma_ge=scr_wep_abbreviate(ma_gear[sel]);// vehicle upgrade
					if (string_count("^",ma_gear[sel])>0){
						ar_ge=1;
						ma_ge=string_replace(ma_ge,"^","");
					}
					if (string_count("&",ma_gear[sel])>0){
						ar_ge=2;
						ma_ge="Artifact";
					}
				}
				if (ma_mobi[sel]!=""){
					ma_mb=scr_wep_abbreviate(ma_mobi[sel]);// vehicle accessory
					if (string_count("^",ma_mobi[sel])>0){
						ar_mb=1;
						ma_mb=string_replace(ma_mb,"^","");
					}
					if (string_count("&",ma_mobi[sel])>0){
						ar_mb=2;
						ma_mb="Artifact";
					}
				}
				if (ma_wep1[sel]!=""){
					ma_we1=scr_wep_abbreviate(ma_wep1[sel]);//vehicle weapon 1
					if (string_count("^",ma_wep1[sel])>0){
						ar_we1=1;
						ma_we1=string_replace(ma_we1,"^","");
					}
					if (string_count("&",ma_wep1[sel])>0){
						ar_we1=2;
						ma_we1="Artifact";
					}
				}
				if (ma_wep2[sel]!=""){
					ma_we2=scr_wep_abbreviate(ma_wep2[sel]);//vehicle weapon 2
					if (string_count("^",ma_wep2[sel])>0){
						ar_we2=1;
						ma_we2=string_replace(ma_we2,"^","");
					}
					if (string_count("&",ma_wep2[sel])>0){
						ar_we2=2;
						ma_we2="Artifact";
					}
				}
	            // temp5=string(ma_wep1[sel])+", "+string(ma_wep2[sel])+" + "+string(ma_gear[sel]);
	        }

	        if (man_sel[sel]==0) then draw_set_color(c_black);
	        if (man_sel[sel]!=0) then draw_set_color(6052956);// was gray
	        draw_rectangle(xx+25,yy+64,xx+974,yy+85,0);

	        unit_specialism_option=false;
	        spec_tip = "";
	        if (man[sel]="man"){
	        	draw_set_color(c_gray);
	        	if (!is_specialist(unit.role())){
			        if (unit.technology>=35){
			        	 //if unit has techmarine potential
			        	draw_set_color(c_orange);
			        	unit_specialism_option=true;
			        	spec_tip = spec_tips[0];
			        //if unit has librarian potential
			    	} else if (unit.psionic>7){
			    		spec_tip = spec_tips[3];
			    		unit_specialism_option=true;
			    		draw_set_color(c_aqua);
			    	}else if (unit.piety>=35){  //if unit has chaplain potential
			    		spec_tip = spec_tips[1];
			    		unit_specialism_option=true;
			    		draw_set_color(c_olive);
			    	}else if (unit.technology>=30) and (unit.intelligence>=45){ //if unit has apothecary potential
			    		spec_tip = spec_tips[2];
			    		unit_specialism_option=true;
			    		draw_set_color(c_fuchsia);
			    	}
		    	} else{
		    		unit_specialism_option=true;
		    		if (array_contains(["Lexicanum", "Codiciery",obj_ini.role[100,17], string("Chief {0}",obj_ini.role[100,17])], unit.role())){
		    			draw_set_color(c_blue);
		    		} else if(array_contains(["Forge Master",obj_ini.role[100,16]],unit.role())){
		    			draw_set_color(c_maroon);
		    		} else if(array_contains([obj_ini.role[100,15],"Master of the Apothecarion"],unit.role())){
		    			draw_set_color(c_red);
		    		} else if(array_contains([obj_ini.role[100,14],"Master of Sanctity"],unit.role())){
		    			draw_set_color(c_teal);
		    		}
		    	}
	    	} else {
	    		draw_set_color(c_gray);
	    	}
	    	if (unit_specialism_option){
	    		array_push(tooltip_set, [spec_tip, [xx+25,yy+64,xx+974,yy+85]]);
	    		draw_rectangle(xx+25+2,yy+64+2,xx+974-2,yy+85-2,1);
	    	} else{
				draw_rectangle(xx+25,yy+64,xx+974,yy+85,1);
	    	}

	        // Squads
	        var sqi="";
	        draw_set_color(c_black);
	        var squad_modulo = squad[sel]%10;
	        switch(squad_modulo){
	        	case 1:
	        		draw_set_color(c_red);
	        		break;
	        	case 2:
	        		draw_set_color(c_green);
	        		break;
	        	case 3:
	        		draw_set_color(c_orange);
	        		break;
	        	case 4:
	        		draw_set_color(c_aqua);
	        		break;
	        	case 5:
	        		draw_set_color(c_fuchsia);
	        		break;
	        	case 6:
	        		draw_set_color(c_green);
	        		break;
	        	case 7:
	        		draw_set_color(c_blue);
	        		break;
	        	case 8:
	        		draw_set_color(c_fuchsia);
	        		break;	
	        	case 9:
	        		draw_set_color(c_maroon);
	        		break;
	        	case 0:
	        		draw_set_color(c_teal);
	        		break;		        			        		        			        			        			        			        			        			        		
	        }
        
	        if (sel>0){
	            if (squad[sel]==squad[sel+1]) and (squad[sel]!=squad[sel-1]){sqi="top"}
	            else if (squad[sel]==squad[sel+1]) and (squad[sel]==squad[sel-1]){sqi="mid"}
	            else if (squad[sel]!=squad[sel+1]) and (squad[sel]==squad[sel-1]) then sqi="bot";
	        }
	        if (sqi==""){
	            draw_rectangle(xx+25,yy+64,xx+25+8,yy+85,0);
	            draw_set_color(c_gray);
	            draw_rectangle(xx+25,yy+64,xx+25+8,yy+85,1);
	        }
	        if (sqi=="mid"){
	            draw_rectangle(xx+25,yy+64,xx+25+8,yy+85,0);
	            draw_set_color(c_gray);
	            draw_line(xx+25,yy+64,xx+25,yy+85);
	            draw_line(xx+25+8,yy+64,xx+25+8,yy+85);
	        }
	        if (sqi=="top"){
	            draw_rectangle(xx+25,yy+64,xx+25+8,yy+85,0);
	            draw_set_color(c_gray);
	            draw_line(xx+25,yy+64,xx+25+28,yy+64);
	            draw_line(xx+25,yy+64,xx+25,yy+85);
	            draw_line(xx+25+8,yy+64,xx+25+8,yy+85);
	        }
	        if (sqi=="bot"){
	            draw_rectangle(xx+25,yy+64,xx+25+8,yy+85,0);
	            draw_set_color(c_gray);
	            draw_line(xx+25,yy+85,xx+25+28,yy+85);
	            draw_line(xx+25,yy+64,xx+25,yy+85);
	            draw_line(xx+25+8,yy+64,xx+25+8,yy+85);
	        }
	        // was 885
	        // 974
			
	        if (man[sel]="man") and (ma_ar="") then draw_set_alpha(0.5);
	        var name_xr=1;
			
			for (var k = 0; k<10; k++){
				if ((string_width(string_hash_to_newline(temp1))*name_xr)>184-8) then name_xr-=0.05;
			}
        
	        if (temp1!="Chapter Master "+string(obj_ini.master_name)){
	            if (man[sel]=="man") and (ma_promote[sel]>0) then draw_set_color(c_yellow);
	            if (man[sel]=="man") and (ma_promote[sel]>=10) then draw_set_color(c_red);
	            draw_text_transformed(xx+27+8,yy+66,string_hash_to_newline(string(temp1)),name_xr,1,0);
	            draw_text_transformed(xx+28+8,yy+67,string_hash_to_newline(string(temp1)),name_xr,1,0);
	            draw_set_color(c_gray);
	        }
	        if (temp1=="Chapter Master "+string(obj_ini.master_name)){
	            draw_text_transformed(xx+27+16+8,yy+66,string_hash_to_newline(string(temp1)),name_xr,1,0);
	            draw_text_transformed(xx+28+16+8,yy+67,string_hash_to_newline(string(temp1)),name_xr,1,0);
	            draw_sprite(spr_inspect_small,0,xx+27+8,yy+68);
	        }
	        draw_set_alpha(1);
        
	        draw_set_color(c_gray);
	        draw_text_transformed(xx+240+8,yy+66,string_hash_to_newline(string(temp3)),1,1,0);// HP
	        draw_text_transformed(xx+330+8,yy+66,string_hash_to_newline(string(temp4)),1,1,0);// EXP
	        if (temp2=="Mechanicus Vessel") or (temp2=="Terra IV") or (temp2=="=Penitorium=") then draw_set_alpha(0.5);
	        draw_text_transformed(xx+430+8,yy+66,string_hash_to_newline(string(temp2)),1,1,0);// LOC
	        draw_set_alpha(1);
        
	        // ma_lid[i]=0;ma_wid[i]=0;
        
	        if (ma_loc[sel]=="Mechanicus Vessel") then draw_sprite(spr_loc_icon,2,xx+427+8,yy+66);
	        if (man[sel]=="man"){
	            if (ma_loc[sel]!="Mechanicus Vessel"){
					var berd=false;
	                if (managing<11) and (obj_ini.age[managing,ide[sel]]!=floor(obj_ini.age[managing,ide[sel]])) then berd=true;
	                if (managing>=11)and (obj_ini.age[0,ide[sel]]!=floor(obj_ini.age[0,ide[sel]])) then berd=true;
                
	                if (ma_lid[sel]==0) and (ma_wid[sel]>0) then draw_sprite(spr_loc_icon,0,xx+427+8,yy+66);
	                if (ma_lid[sel]>0) and (ma_wid[sel]==0) and (berd==false) then draw_sprite(spr_loc_icon,1,xx+427+8,yy+66);
	                if (ma_lid[sel]>0) and (ma_wid[sel]==0) and (berd==true) then draw_sprite(spr_loc_icon,2,xx+427+8,yy+66);
	            }
	        }
	        if (man[sel]!="man"){
	            if (ma_loc[sel]!="Mechanicus Vessel"){
	                if (ma_lid[sel]==0) and (ma_wid[sel]>0) then draw_sprite(spr_loc_icon,0,xx+427+8,yy+66);
	                if (ma_lid[sel]>0) and (ma_wid[sel]==0) then draw_sprite(spr_loc_icon,1,xx+427+8,yy+66);
	            }
	        }
	        if (man[sel]=="man"){
				var xoffset=0;
	            draw_set_color(c_gray);
	            if (ar_ar==1) then draw_set_color(c_gray);
	            if (ar_ar==2) then draw_set_color(881503);
	            draw_text(xx+573,yy+66,string_hash_to_newline(string(ma_ar)));
				

	            xoffset+=string_width(string_hash_to_newline(ma_ar))+15;
	            draw_set_color(c_gray);
	            if (ar_mb==1) then draw_set_color(c_gray);
	            if (ar_mb==2) then draw_set_color(881503);
	            draw_text(xx+573+xoffset,yy+66,string_hash_to_newline(string(ma_mb)));

	            xoffset+=string_width(string_hash_to_newline(ma_mb))+15;
	            draw_set_color(c_gray);
	            if (ar_ge==1) then draw_set_color(c_gray);
	            if (ar_ge==2) then draw_set_color(881503);
	            draw_text(xx+573+xoffset,yy+66,string_hash_to_newline(string(ma_ge)));

	            xoffset+=string_width(string_hash_to_newline(ma_ge))+15;
	            draw_set_color(c_gray);
	            if (ar_we1==1) then draw_set_color(c_gray);
	            if (ar_we1==2) then draw_set_color(881503);
	            draw_text(xx+573+xoffset,yy+66,string_hash_to_newline(string(ma_we1)));

	            xoffset+=string_width(string_hash_to_newline(ma_we1))+15;
	            draw_set_color(c_gray);
	            if (ar_we2==1) then draw_set_color(c_gray);
	            if (ar_we2==2) then draw_set_color(881503);
	            draw_text(xx+573+xoffset,yy+66,string_hash_to_newline(string(ma_we2)));
	        }
	        if (man[sel]!="man"){
				var xoffset=0;
				//Vehicle Upgrade
				draw_set_color(c_gray);
				if (ar_ge==1) then draw_set_color(c_gray);
				if (ar_ge==2) then draw_set_color(881503);
				draw_text(xx+573,yy+66,string_hash_to_newline(string(ma_ge)));
			
				//Vehicle accessory
				xoffset+=string_width(string_hash_to_newline(ma_ge))+15;
				draw_set_color(c_gray);
				if (ar_mb==1) then draw_set_color(c_gray);
				if (ar_mb==2) then draw_set_color(881503);
				draw_text(xx+573+xoffset,yy+66,string_hash_to_newline(string(ma_mb)));
			
				//Vehicle wep 1
				xoffset+=string_width(string_hash_to_newline(ma_mb))+15;
				draw_set_color(c_gray);
				if (ar_we1==1) then draw_set_color(c_gray);
				if (ar_we1==2) then draw_set_color(881503);
				draw_text(xx+573+xoffset,yy+66,string_hash_to_newline(string(ma_we1)));
			
				//Vehicle wep 2
				xoffset+=string_width(string_hash_to_newline(ma_we1))+15;
				draw_set_color(c_gray);
				if (ar_we2==1) then draw_set_color(c_gray);
				if (ar_we2==2) then draw_set_color(881503);
				draw_text(xx+573+xoffset,yy+66,string_hash_to_newline(string(ma_we2)));
			
				//Vehicle wep 3
				xoffset+=string_width(string_hash_to_newline(ma_we2))+15;
				draw_set_color(c_gray);
				if (ar_ar==1) then draw_set_color(c_gray);
				if (ar_ar==2) then draw_set_color(881503);
				draw_text(xx+573+xoffset,yy+66,string_hash_to_newline(string(ma_ar)));
	        }
	        yy+=20;
	        sel+=1;
	        if (man[sel] == ""){break;}
	    }

	    draw_set_color(c_black);
	    xx=__view_get( e__VW.XView, 0 )+0;yy=__view_get( e__VW.YView, 0 )+0;
	    draw_rectangle(xx+974,yy+165,xx+1005,yy+822,0);
	    draw_set_color(c_gray);
	    draw_rectangle(xx+974,yy+165,xx+1005,yy+822,1);

		// Squad outline
	    draw_rectangle(xx+25,yy+142,xx+14+8,yy+822,1);
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
		
		// How much space the selected unit takes
	    draw_set_color(c_gray);
	    draw_set_font(fnt_40k_14b);
		draw_text_transformed(xx+1010,yy+528,string_hash_to_newline("Selection: "+string(man_size)+" space"),1.5,1.5,0);
	    draw_set_font(fnt_40k_14);
		draw_text_ext(xx+1010,yy+552,string_hash_to_newline(selecting_dudes),-1,560);

		// Options for the selected unit
	    draw_set_font(fnt_40k_14b);
		draw_text_transformed(xx+1010,yy+610,string_hash_to_newline("Options:"),1.5,1.5,0);
	    draw_set_font(fnt_40k_14);

	    yy+=8;

	    if (sel_uni[1]!=""){
	        draw_text(xx+1010,yy+636,string_hash_to_newline("All Infantry"));
	        draw_rectangle(xx+1010,yy+634,xx+1010+string_width(string_hash_to_newline("All Infantry")),yy+634+string_height(string_hash_to_newline("All Infantry")),1);
	        if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
	            if (mouse_x>=xx+1010) and (mouse_y>=yy+634) and (mouse_x<xx+1010+string_width(string_hash_to_newline("All Infantry"))) and (mouse_y<yy+634+string_height(string_hash_to_newline("All Infantry"))){
					cooldown=8;
					sel_all="man";
				}
	        }
	        if (sel_uni[1]!=""){
	            draw_text(xx+1016,yy+662,string_hash_to_newline(sel_uni[1]));
				draw_rectangle(xx+1015,yy+661,xx+1016+string_width(string_hash_to_newline(sel_uni[1])),yy+661+string_height(string_hash_to_newline(sel_uni[1])),1);
	            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
	                if (mouse_x>=xx+1015) and (mouse_y>=yy+661) and (mouse_x<xx+1016+string_width(string_hash_to_newline(sel_uni[1]))) and (mouse_y<yy+661+string_height(string_hash_to_newline(sel_uni[1]))){
						cooldown=8;
						sel_all=sel_uni[1];
					}
	            }
	        }
	        if (sel_uni[2]!=""){
	            draw_text(xx+1016,yy+684,string_hash_to_newline(sel_uni[2]));
				draw_rectangle(xx+1015,yy+683,xx+1016+string_width(string_hash_to_newline(sel_uni[2])),yy+683+string_height(string_hash_to_newline(sel_uni[2])),1);
	            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
	                if (mouse_x>=xx+1016) and (mouse_y>=yy+684) and (mouse_x<xx+1016+string_width(string_hash_to_newline(sel_uni[2]))) and (mouse_y<yy+683+string_height(string_hash_to_newline(sel_uni[2]))){
						cooldown=8;
						sel_all=sel_uni[2];
					}
	            }
	        }
	        if (sel_uni[3]!=""){
	            draw_text(xx+1016,yy+706,string_hash_to_newline(sel_uni[3]));
				draw_rectangle(xx+1015,yy+705,xx+1016+string_width(string_hash_to_newline(sel_uni[3])),yy+705+string_height(string_hash_to_newline(sel_uni[3])),1);
	            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
	                if (mouse_x>=xx+1016) and (mouse_y>=yy+706) and (mouse_x<xx+1016+string_width(string_hash_to_newline(sel_uni[3]))) and (mouse_y<yy+705+string_height(string_hash_to_newline(sel_uni[3]))){
						cooldown=8;
						sel_all=sel_uni[3];
					}
	            }
	        }
	        if (sel_uni[4]!=""){
	            draw_text(xx+1016,yy+728,string_hash_to_newline(sel_uni[4]));
				draw_rectangle(xx+1015,yy+727,xx+1016+string_width(string_hash_to_newline(sel_uni[4])),yy+727+string_height(string_hash_to_newline(sel_uni[4])),1);
	            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
	                if (mouse_x>=xx+1016) and (mouse_y>=yy+727) and (mouse_x<xx+1016+string_width(string_hash_to_newline(sel_uni[4]))) and (mouse_y<yy+727+string_height(string_hash_to_newline(sel_uni[4]))){
						cooldown=8;
						sel_all=sel_uni[4];
					}
	            }
	        }
	        if (sel_uni[5]!=""){
	            draw_text(xx+1160,yy+662,string_hash_to_newline(sel_uni[5]));
				draw_rectangle(xx+1015+144,yy+661,xx+1160+string_width(string_hash_to_newline(sel_uni[5])),yy+661+string_height(string_hash_to_newline(sel_uni[5])),1);
	            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
	                if (mouse_x>=xx+1160) and (mouse_y>=yy+661) and (mouse_x<xx+1160+string_width(string_hash_to_newline(sel_uni[5]))) and (mouse_y<yy+661+string_height(string_hash_to_newline(sel_uni[5]))){
						cooldown=8;
						sel_all=sel_uni[5];
					}
	            }
	        }
	        if (sel_uni[6]!=""){
	            draw_text(xx+1160,yy+684,string_hash_to_newline(sel_uni[6]));
				draw_rectangle(xx+1015+144,yy+683,xx+1160+string_width(string_hash_to_newline(sel_uni[6])),yy+683+string_height(string_hash_to_newline(sel_uni[6])),1);
	            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
	                if (mouse_x>=xx+1160) and (mouse_y>=yy+684) and (mouse_x<xx+1160+string_width(string_hash_to_newline(sel_uni[6]))) and (mouse_y<yy+684+string_height(string_hash_to_newline(sel_uni[6]))){
						cooldown=8;
						sel_all=sel_uni[6];
					}
	            }
	        }
	        if (sel_uni[7]!=""){
	            draw_text(xx+1160,yy+706,string_hash_to_newline(sel_uni[7]));
				draw_rectangle(xx+1015+144,yy+705,xx+1160+string_width(string_hash_to_newline(sel_uni[7])),yy+705+string_height(string_hash_to_newline(sel_uni[7])),1);
	            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
	                if (mouse_x>=xx+1160) and (mouse_y>=yy+706) and (mouse_x<xx+1160+string_width(string_hash_to_newline(sel_uni[7]))) and (mouse_y<yy+706+string_height(string_hash_to_newline(sel_uni[7]))){
						cooldown=8;
						sel_all=sel_uni[7];
					}
	            }
	        }
	        if (sel_uni[8]!=""){
	            draw_text(xx+1160,yy+728,string_hash_to_newline(sel_uni[8]));
				draw_rectangle(xx+1015+144,yy+727,xx+1160+string_width(string_hash_to_newline(sel_uni[8])),yy+727+string_height(string_hash_to_newline(sel_uni[8])),1);
	            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
	                if (mouse_x>=xx+1160) and (mouse_y>=yy+728) and (mouse_x<xx+1160+string_width(string_hash_to_newline(sel_uni[8]))) and (mouse_y<yy+727+string_height(string_hash_to_newline(sel_uni[8]))){
						cooldown=8;
						sel_all=sel_uni[8];
					}
	            }
	        }
	    }
	    if (sel_veh[1]!=""){
	        draw_text(xx+1010+288,yy+636,string_hash_to_newline("All Vehicles"));
	        draw_rectangle(xx+1010+288,yy+634,xx+1010+288+string_width(string_hash_to_newline("All Vehicles")),yy+634+string_height(string_hash_to_newline("All Vehicles")),1);
	        if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
	            if (mouse_x>=xx+1010+288) and (mouse_y>=yy+634) and (mouse_x<xx+1010+288+string_width(string_hash_to_newline("All Vehicles"))) and (mouse_y<yy+634+string_height(string_hash_to_newline("All Vehicles"))){
					cooldown=8;
					sel_all="vehicle";
				}
	        }
	        if (sel_veh[1]!=""){
	            draw_text(xx+1016+288,yy+662,string_hash_to_newline(sel_veh[1]));
				draw_rectangle(xx+1015+288,yy+661,xx+1016+288+string_width(string_hash_to_newline(sel_veh[1])),yy+661+string_height(string_hash_to_newline(sel_veh[1])),1);
	            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
	                if (mouse_x>=xx+1015+288) and (mouse_y>=yy+661) and (mouse_x<xx+1016+288+string_width(string_hash_to_newline(sel_veh[1]))) and (mouse_y<yy+661+string_height(string_hash_to_newline(sel_veh[1]))){
						cooldown=8;
						sel_all=sel_veh[1];
					}
	            }
	        }
	        if (sel_veh[2]!=""){
	            draw_text(xx+1016+288,yy+684,string_hash_to_newline(sel_veh[2]));
				draw_rectangle(xx+1015+288,yy+683,xx+1016+288+string_width(string_hash_to_newline(sel_veh[2])),yy+683+string_height(string_hash_to_newline(sel_veh[2])),1);
	            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
	                if (mouse_x>=xx+1015+288) and (mouse_y>=yy+683) and (mouse_x<xx+1016+288+string_width(string_hash_to_newline(sel_veh[2]))) and (mouse_y<yy+683+string_height(string_hash_to_newline(sel_veh[2]))){
						cooldown=8;
						sel_all=sel_veh[2];
					}
	            }
	        }
	        if (sel_veh[3]!=""){
	            draw_text(xx+1016+288,yy+706,string_hash_to_newline(sel_veh[3]));
				draw_rectangle(xx+1015+288,yy+705,xx+1016+288+string_width(string_hash_to_newline(sel_veh[3])),yy+705+string_height(string_hash_to_newline(sel_veh[3])),1);
	            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
	                if (mouse_x>=xx+1015+288) and (mouse_y>=yy+705) and (mouse_x<xx+1016+288+string_width(string_hash_to_newline(sel_veh[3]))) and (mouse_y<yy+705+string_height(string_hash_to_newline(sel_veh[3]))){
						cooldown=8;
						sel_all=sel_veh[3];
					}
	            }
	        }
	        if (sel_veh[4]!=""){
	            draw_text(xx+1016+288,yy+728,string_hash_to_newline(sel_veh[4]));
				draw_rectangle(xx+1015+288,yy+727,xx+1016+288+string_width(string_hash_to_newline(sel_veh[4])),yy+727+string_height(string_hash_to_newline(sel_veh[4])),1);
	            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
	                if (mouse_x>=xx+1015+288) and (mouse_y>=yy+728) and (mouse_x<xx+1016+288+string_width(string_hash_to_newline(sel_veh[4]))) and (mouse_y<yy+727+string_height(string_hash_to_newline(sel_veh[4]))){
						cooldown=8;
						sel_all=sel_veh[4];
					}
	            }
	        }
	        if (sel_veh[5]!=""){
	            draw_text(xx+1160+432,yy+662,string_hash_to_newline(sel_veh[5]));
				draw_rectangle(xx+1015+432,yy+661,xx+1160+432+string_width(string_hash_to_newline(sel_veh[5])),yy+661+string_height(string_hash_to_newline(sel_veh[5])),1);
	            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
	                if (mouse_x>=xx+1160+432) and (mouse_y>=yy+661) and (mouse_x<xx+1160+432+string_width(string_hash_to_newline(sel_veh[5]))) and (mouse_y<yy+661+string_height(string_hash_to_newline(sel_veh[5]))){
						cooldown=8;
						sel_all=sel_veh[5];
					}
	            }
	        }
	        if (sel_veh[6]!=""){
	            draw_text(xx+1160+432,yy+684,string_hash_to_newline(sel_veh[6]));
				draw_rectangle(xx+1015+432,yy+683,xx+1160+432+string_width(string_hash_to_newline(sel_veh[6])),yy+683+string_height(string_hash_to_newline(sel_veh[6])),1);
	            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
	                if (mouse_x>=xx+1160+432) and (mouse_y>=yy+683) and (mouse_x<xx+1160+432+string_width(string_hash_to_newline(sel_veh[6]))) and (mouse_y<yy+683+string_height(string_hash_to_newline(sel_veh[6]))){
						cooldown=8;
						sel_all=sel_veh[6];
					}
	            }
	        }
	        if (sel_veh[7]!=""){
	            draw_text(xx+1160+432,yy+706,string_hash_to_newline(sel_veh[7]));
				draw_rectangle(xx+1015+432,yy+705,xx+1160+432+string_width(string_hash_to_newline(sel_veh[7])),yy+705+string_height(string_hash_to_newline(sel_veh[7])),1);
	            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
	                if (mouse_x>=xx+1160+432) and (mouse_y>=yy+706) and (mouse_x<xx+1160+432+string_width(string_hash_to_newline(sel_veh[7]))) and (mouse_y<yy+705+string_height(string_hash_to_newline(sel_veh[7]))){
						cooldown=8;
						sel_all=sel_veh[7];
					}
	            }
	        }
	        if (sel_veh[8]!=""){
	            draw_text(xx+1160+432,yy+728,string_hash_to_newline(sel_veh[8]));
				draw_rectangle(xx+1015+432,yy+727,xx+1160+432+string_width(string_hash_to_newline(sel_veh[8])),yy+727+string_height(string_hash_to_newline(sel_veh[8])),1);
	            if (mouse_check_button_pressed(mb_left)) and (cooldown<=0){
	                if (mouse_x>=xx+1160+432) and (mouse_y>=yy+728) and (mouse_x<xx+1160+432+string_width(string_hash_to_newline(sel_veh[8]))) and (mouse_y<yy+727+string_height(string_hash_to_newline(sel_veh[8]))){
						cooldown=8;
						sel_all=sel_veh[8];
					}
	            }
	        }
	    }
	    //draws hover overs for specialist potential
	    for (var i=0;i<array_length(tooltip_set);i++){
	    	if (point_in_rectangle(mouse_x, mouse_y, tooltip_set[i][1][0],tooltip_set[i][1][1],tooltip_set[i][1][2],tooltip_set[i][1][3])){
	    		tooltip_draw(mouse_x, mouse_y, tooltip_set[i][0])
	    	}
	    }
    
	    yy-=8;
    
	    draw_set_font(fnt_40k_14b);
	    draw_set_halign(fa_left);
	    draw_set_color(c_gray);
	    draw_text_transformed(xx+1285,yy+610,string_hash_to_newline("Select All"),1.5,1.5,0);
	    draw_rectangle(xx+1281,yy+608,xx+1408,yy+636,1);
	    draw_set_alpha(0.5);
		draw_rectangle(xx+1282,yy+609,xx+1407,yy+635,1);
	    draw_set_alpha(0.25);
	    if (mouse_x>=xx+1281) and (mouse_y>=yy+608) and (mouse_x<xx+1408) and (mouse_y<yy+636) then draw_rectangle(xx+1281,yy+608,xx+1408,yy+636,0);
    
	    draw_set_alpha(1);
	    draw_set_font(fnt_40k_14);
	    draw_set_halign(fa_center);
		
		// Update screen coordinates
	    var x5=xx+1018, y5=yy+831, x6=xx+1018+141, y6=yy+805;
		
		// Load/Unload to ship button
	    draw_set_alpha(1);
		draw_rectangle(x5,y5,x6,y6,1);
	    draw_set_alpha(0.5);
		draw_rectangle(x5+1,y5+1,x6-1,y6-1,1);
	    draw_set_alpha(0.25);
		if (mouse_x>=x5) and (mouse_y>=y6) and (mouse_x<x6) and (mouse_y<y5) then draw_rectangle(x5,y5,x6,y6,0);
	    draw_set_alpha(1);
	    if (sel_loading=0) then draw_text_transformed(xx+1089,yy+805,string_hash_to_newline("Load"),1.5,1.5,0);
	    if (sel_loading!=0) then draw_text_transformed(xx+1089,yy+805,string_hash_to_newline("Unload"),1.5,1.5,0);
    
		// Re equip button
	    x5=xx+1018+141;
		y5=yy+831;
		x6=xx+1297;
		y6=yy+805;
	    draw_set_alpha(1);
		draw_rectangle(x5,y5,x6,y6,1);
	    draw_set_alpha(0.5);
		draw_rectangle(x5+1,y5+1,x6-1,y6-1,1);
	    draw_set_alpha(0.25);
		if (mouse_x>=x5) and (mouse_y>=y6) and (mouse_x<x6) and (mouse_y<y5) then draw_rectangle(x5,y5,x6,y6,0);
	    draw_set_alpha(1);
	    if (otha>0) then draw_set_alpha(0.5);
	    draw_text_transformed(xx+1089+141,yy+805,string_hash_to_newline("Re-equip"),1.5,1.5,0);
    
		// Promote button
	    x5=xx+1297;
		y5=yy+831;
		x6=xx+1436;
		y6=yy+805;
	    draw_set_alpha(1);
		draw_rectangle(x5,y5,x6,y6,1);
	    draw_set_alpha(0.5);
		draw_rectangle(x5+1,y5+1,x6-1,y6-1,1);
	    draw_set_alpha(0.25);
		if (mouse_x>=x5) and (mouse_y>=y6) and (mouse_x<x6) and (mouse_y<y5) then draw_rectangle(x5,y5,x6,y6,0);
	    draw_set_alpha(1);
	    draw_set_alpha(min(sel_promoting+0.5,1));
	    draw_text_transformed(xx+1089+282,yy+805,string_hash_to_newline("Promote"),1.5,1.5,0);
		
		// Put in jail button
	    x5=xx+1297+141;
		y5=yy+831;
		x6=xx+1436+141;
		y6=yy+805;
	    draw_set_alpha(1);
		draw_rectangle(x5,y5,x6,y6,1);
	    draw_set_alpha(0.5);
		draw_rectangle(x5+1,y5+1,x6-1,y6-1,1);
	    draw_set_alpha(0.25);
		if (mouse_x>=x5) and (mouse_y>=y6) and (mouse_x<x6) and (mouse_y<y5) then draw_rectangle(x5,y5,x6,y6,0);
	    draw_set_alpha(1);
		draw_text_transformed(xx+1089+423,yy+805,string_hash_to_newline("Jail"),1.5,1.5,0);
		
		// Reset changes button
	    x5=xx+1018+141;
		y5=yy+831-26;
		x6=xx+1297;
		y6=yy+805-26;
	    draw_set_alpha(1);
		draw_rectangle(x5,y5,x6,y6,1);
	    draw_set_alpha(0.5);
		draw_rectangle(x5+1,y5+1,x6-1,y6-1,1);
	    draw_set_alpha(0.25);
		if (mouse_x>=x5) and (mouse_y>=y6) and (mouse_x<x6) and (mouse_y<y5) then draw_rectangle(x5,y5,x6,y6,0);
	    draw_set_alpha(1);
	    if (otha>0) then draw_set_alpha(0.5);
	    draw_text_transformed(xx+1089+141,yy+805-26,string_hash_to_newline("Reset"),1.5,1.5,0);
    
		// Transfer to another company button
	    x5=xx+1297;
		y5=yy+831-26;
		x6=xx+1436;
		y6=yy+805-26;
	    draw_set_alpha(1);
		draw_rectangle(x5,y5,x6,y6,1);
	    draw_set_alpha(0.5);
		draw_rectangle(x5+1,y5+1,x6-1,y6-1,1);
	    draw_set_alpha(0.25);
		if (mouse_x>=x5) and (mouse_y>=y6) and (mouse_x<x6) and (mouse_y<y5) then draw_rectangle(x5,y5,x6,y6,0);
	    draw_set_alpha(1);
		draw_text_transformed(xx+1089+282,yy+805-26,string_hash_to_newline("Transfer"),1.5,1.5,0);
    
		// Add bionics button
	    draw_set_color(38144);
	    x5=xx+1300+141;
		y5=yy+827-26;
		x6=xx+1436+141;
		y6=yy+805-26;
	    draw_set_alpha(1);
		draw_rectangle(x5,y5,x6,y6,1);
	    draw_set_alpha(0.5);
		draw_rectangle(x5+1,y5+1,x6-1,y6-1,1);
	    draw_set_alpha(0.25);
		if (mouse_x>=x5) and (mouse_y>=y6) and (mouse_x<x6) and (mouse_y<y5) then draw_rectangle(x5,y5,x6,y6,0);
	    draw_set_alpha(1);
		draw_text_transformed(xx+1089+423,yy+807-26,string_hash_to_newline("Add Bionics"),1,1,0);
	    draw_set_color(c_gray);
		
		// Designate as boarder unit
	    draw_set_color(c_red);
	    x5=xx+1018;
		y5=yy+827-26;
		x6=xx+1018+141;
		y6=yy+805-26;
	    draw_set_alpha(1);
		draw_rectangle(x5,y5,x6,y6,1);
	    draw_set_alpha(0.5);
		draw_rectangle(x5+1,y5+1,x6-1,y6-1,1);
	    draw_set_alpha(0.25);
		if (mouse_x>=x5) and (mouse_y>=y6) and (mouse_x<x6) and (mouse_y<y5) then draw_rectangle(x5,y5,x6,y6,0);
	    draw_set_halign(fa_center);
		draw_set_alpha(1);
	    draw_text_transformed(xx+1084,yy+807-26,string_hash_to_newline("Set Boarder"),1,1,0);
	    draw_set_halign(fa_left);
		draw_set_color(c_gray);
    
    
	    scr_scrollbar(974,172,1005,790,34,man_max,man_current);
	    var tip, coords;
		for (i=0;i < array_length(tooltip_drawing); i++){
			tip = tooltip_drawing[i];
			coords=tip[1];
			if (point_in_rectangle(mouse_x, mouse_y, coords[0],coords[1],coords[2],coords[3])){
		        	tooltip_draw(coords[0],coords[3]+4, tip[0]);
			}
		}
		if instance_exists(cn)and (is_struct(temp[120])){
			if (cn.temp[101]!="") and (cn.temp[100]=="1"){
		        if ((point_in_rectangle(mouse_x, mouse_y, xx+1208, yy+168, xx+1374, yy+409)) and (!instance_exists(obj_temp3)) and(!instance_exists(obj_popup))){
		        	draw_set_color(0);
		    		draw_rectangle(xx+1004,yy+519,xx+1576,yy+957,0);
		    		var stat_x = xx+1004;
		    		var stat_y = yy+519;
		    		var stat_display = string_hash_to_newline($"DEX#{selected_unit.dexterity}");
		    		tooltip_draw(stat_x,stat_y, stat_display,2);
		    		tooltip_draw(stat_x,stat_y+string_height(stat_display)+6,$"Warp Level:{selected_unit.psionic}");

		    		stat_x += string_width(stat_display)+3;

		    		stat_display = string_hash_to_newline($"STR#{selected_unit.strength}");
		    		tooltip_draw(stat_x,stat_y, stat_display,2);
		    		stat_x += string_width(stat_display)+3;

		    		stat_display = string_hash_to_newline($"CON#{selected_unit.constitution}");
		    		tooltip_draw(stat_x,stat_y, stat_display,1);
		    		stat_x += string_width(stat_display)+2;	    		

		    		stat_display = string_hash_to_newline($"INT#{selected_unit.intelligence}");
		    		tooltip_draw(stat_x,stat_y, stat_display,2);
		    		stat_x += string_width(stat_display)+3;

		    		stat_display = string_hash_to_newline($"WIS#{selected_unit.wisdom}");
		    		tooltip_draw(stat_x,stat_y, stat_display,2);
		    		stat_x += string_width(stat_display)+3;

		    		stat_display = string_hash_to_newline($"FAI#{selected_unit.piety}");
		    		tooltip_draw(stat_x,stat_y, stat_display,2);
		    		stat_x += string_width(stat_display)+3;

		    		stat_display = string_hash_to_newline($"WS#{selected_unit.weapon_skill}");
		    		tooltip_draw(stat_x,stat_y, stat_display, 5);
		    		stat_x += string_width(stat_display)+6;

		    		stat_display = string_hash_to_newline($"BS#{selected_unit.ballistic_skill}");
		    		tooltip_draw(stat_x,stat_y, stat_display, 6);
		    		stat_x += string_width(stat_display)+7;

		    		stat_display = string_hash_to_newline($"LU#{selected_unit.luck}");
		    		tooltip_draw(stat_x,stat_y, stat_display, 5);
		    		stat_x += string_width(stat_display)+6;

		    		stat_display = string_hash_to_newline($"TEC#{selected_unit.technology}");
		    		tooltip_draw(stat_x,stat_y, stat_display,2);
		    		stat_x += string_width(stat_display)+3;

		    		stat_display = string_hash_to_newline($"CHA#{selected_unit.charisma}");
		    		tooltip_draw(stat_x,stat_y, stat_display,2);
		    		stat_x += string_width(stat_display)+5;
		    		draw_line(stat_x, yy+519, stat_x, yy+957);

		    		draw_set_alpha(0)
		    		draw_set_color(c_gray);

		        	unit_data_string = selected_unit.name_role();
		        	var is_astartes = false;
		        	if(selected_unit.base_group == "astartes"){
		        		is_astartes = true;
		        	}
		        	if (selected_unit.squad != "none"){
		        		var chapter_role = ""
		        		chapter_role += " of the ";
		        		if (selected_unit.company > 0){
		        			chapter_role += scr_convert_company_to_string(selected_unit.company);
		        		} //else{chapter_role = "Command"}
		        		chapter_role += string(" {0} {1}", selected_unit.squad, obj_ini.squad_types[$ obj_ini.squads[selected_unit.squad].type][$ "display_name"]) + "#";
		        		unit_data_string += chapter_role

		        		if (selected_unit.base_group == "astartes"){
		        			unit_data_string += $"He is {selected_unit.age()}, first becoming a marine in {selected_unit.marine_ascension}#"
		        		}

		        		if (array_contains([obj_ini.role[100,18], obj_ini.role[100,19]], selected_unit.role())){
		        			unit_data_string +="#";
		        			if (selected_unit.charisma < 25){
		        				unit_data_string+= "He is generally disliked by the members of his squad.";
		        			}else if(selected_unit.charisma >39){
		        				unit_data_string+= "He is liked grealty by the members of his squad.";
		        			}
		        			if (selected_unit.wisdom < 30){
		        				unit_data_string+= "His squad generally are disatisfied with his tactical decisions";
		        			} else if ((selected_unit.wisdom < 35) and (selected_unit.wisdom >=30)){
		        				unit_data_string+= "His squad do not always have a positive veiw his tactical abilities.";
		        			} else if (selected_unit.wisdom < 45){
		        				unit_data_string+= "He is considered a good tactician.";
		        			}
		        			if (selected_unit.ballistic_skill+selected_unit.weapon_skill>80){
		        				unit_data_string+= "He is respected by those under his command for his skill at arms.";
		        			} else if (selected_unit.ballistic_skill+selected_unit.weapon_skill>100){
		        				unit_data_string+= "He is revered by those under his command and many look to him fo inspiration.";
		        			} else if(selected_unit.ballistic_skill+selected_unit.weapon_skill<70){
		        				unit_data_string+= "His men tend to find his skills as a warrior lacking considereing his position";
		        			}
		        			else if (selected_unit.wisdom >= 45){
		        				unit_data_string+= "His military mind has saved his squad many times.";
		        			}
		        			unit_data_string +="#";
		        		}
		       		} else {unit_data_string+="#"}
		       		var unit_name = selected_unit.name();
		       		if (selected_unit.religion != "none"){
		       			unit_data_string += unit_name+string(" is a follower of the {0}",global.religions[$ selected_unit.religion][$ "name"])
		       			if (selected_unit.religion_sub_cult != "none"){
		       				unit_data_string += $", in particular a sub cult known as {selected_unit.religion_sub_cult}"
		       			}
		       			if ((selected_unit.piety > 25)and (selected_unit.piety <40)){
		       				unit_data_string += " and is a close follower of the faith"
		       			}else if(selected_unit.piety <= 25){
		       				unit_data_string += " however does not put much stock in religion"
		       			}else if(selected_unit.piety >= 40){
		       				unit_data_string += " and is zealous in his worship"
		       			}else if(selected_unit.piety >= 50){
		       				unit_data_string += " and is fanatical in his worship"
		       			}
		       			unit_data_string+="##";
		       		}
		       		unit_data_string += $"{unit_name} Has a Imperial Assignment: Positive Psionic Level value of {global.phy_levels[selected_unit.psionic]} ";
		       		var is_lib = array_contains(["Lexicanum", "Codiciery",obj_ini.role[100,17]], selected_unit.role());
		       		if (selected_unit.psionic<2){
		       			unit_data_string += "as such has almost no presence in the warp";
		       		} else if(selected_unit.psionic<8){
		       			unit_data_string += "and has a limited presence in the warp causing them to be more prone to attacks from the immaterium";
		       		} else if(selected_unit.psionic<11){
		       			unit_data_string += "And is therefore considered a low level psyker with Conscious levels of psionic talent.";
		       			if (is_astartes){
			       			if (!is_lib){
			       				unit_data_string += " He would be eligible for a role in the Librarium however is unlikely to ever exceed the role of Lexicanum";
			       			}
		       			}
		       		}else if(selected_unit.psionic<13){
		       			unit_data_string += "and has a very high level of mental psychic activity, making them a potent psyker, their presence in the warp is obvious to the daemons of the immaterium"
		       			if (is_astartes){
			       			if (!is_lib){
			       				unit_data_string += " He would be eligible for a role in the Librarium capable of wielding his power to good effect";
			       			}
		       			}
		       		}else if(selected_unit.psionic<15){
		       			unit_data_string += "Occurring in approximately one-per-billion human births, they are a very potent psyker."
		       			if (is_astartes){
			       			if (!is_lib){
			       				unit_data_string += " He would be eligible for a role in the Librarium And should be enrolled at once in order to train his abilities and stop his untrained mind causing damage to the chapter";
			       			} else {
			       				unit_data_string += " His rare talent is of great benefit to the chapter and could one day be a candidate for Chief of the librariam"
			       			}
		       			}		       				       			
		       		} else if(selected_unit.psionic<15){
		       			unit_data_string += "Exceedingly rare and dangerous but unfathomably powerful."
		       			if (is_astartes){
		       				unit_data_string += " Their Talents are both a great boon and huge risk to the chapter."
			       			if (!is_lib){
			       				unit_data_string += " He must brought into the guided sphere of the librarium immediately or else dealt with by other methods for the good of the chapter";
			       			} else {
			       				unit_data_string += " His rare talent is of great benefit to the chapter and will likely one day be a candidate for Chief of the librariam if he does not succumb to either the material or immaterium"
			       			}
		       			}
		       		}
		       		unit_data_string += "##"
		       		if (is_astartes){
		       			var bionic_count = selected_unit.bionics();
		       			if (bionic_count ==0){
		       				unit_data_string+= unit_name + " has no bodily augmentations besides his astartes gene seed and organs #"
		       			}else if(bionic_count == 1 && array_length(body_augmentations.bionics[0])>0){
		       				unit_data_string+= unit_name + string(" Has a bionic {0}#", global.body_parts_display[body_augmentations.bionics[0][0]])
		       			}else if((bionic_count >1) and (bionic_count <=4)){
		       				unit_data_string+= unit_name + " Has some bionic replacements #"
		       			}else if((bionic_count >=5) and (bionic_count <8)){
		       				unit_data_string+= unit_name + " Has many bionic replacements #"
		       			}else if (bionic_count >8){
		       				unit_data_string+= unit_name + " Is mostly machine having replaced most of his flesh with bionic replacements."
		       			}
		       			if (array_contains(body_augmentations.bionics[1], "throat")){
		       				unit_data_string+="People tend to find the sound from his augmetic throat unnerving"
		       			}

		       			unit_data_string+="#";

		       			var mutation_names = struct_get_names(selected_unit.gene_seed_mutations);
		       			var pure_seed =true;
		       			var mutation_string = unit_name + " has an impure gene seed."
						for (var mute =0; mute <array_length(mutation_names); mute++){
							if (selected_unit.gene_seed_mutations[$ mutation_names[mute]] == 1){
								pure_seed = false;
								switch(mutation_names[mute]){
									case "preomnor":
										mutation_string += "He lacks the detoxifying gland called the Preomnor- he is more susceptible to poisons and toxins,";
										break;
									case "lyman":
										mutation_string += "Lacks a working Lyman's ear, And therefore struggles with deep strikes and certain other actions";
										break;
									case "omophagea":
										mutation_string += "suffers from a faulty Omophagea,";
										break;
									case "ossmodula":
										mutation_string += "suffers from a faulty Ossmodula, and takes longer to heal from injuries,";
										break;
									case "zygote":
										mutation_string +="One of his Zygotes is faulty or missing.";
										break;
									case "betchers":
										mutation_string +="He is missing his Betchers Gland and therefore cannot spit acid.";
										break;
									case "catalepsean":
										mutation_string +="He has a faulty Catalepsean Node reducing his awareness when tired.";
										break;
									case "occulobe":
										mutation_string += "He suffers from a faulty occulobe limiting his eyesight enhancements.";
										break;
									case "mucranoid":
										mutation_string += "He suffers from a faulty mucranoid reducing his resistance to extreme heat and cold.";
										break;
									case "membrane":
										mutation_string += "He cannot properly activate his Sus-an Membrane, this limits his ability to survive mortal wounds";
										break;
									case "voice":
										mutation_string += "the marine implantation process caused his voice to warp and now produces a sound that the average member of the Imperium finds unnerving to hear.";
								}
							}
						}
						if (pure_seed){
							unit_data_string += "Has a pure gene seed suffering no mutations";
						} else{
							unit_data_string += mutation_string;
						}
		       			unit_data_string+="#";
			       		if (selected_unit.strength > 49){
			       			unit_data_string+= unit_name + "s strength greatly exceeds that of the standard astartes allowing him to wield weapons that normally require two hands in one.#"
			       		} 
			       		if ((selected_unit.technology >=35) and (selected_unit.technology<45)){
			       			if(!array_contains(selected_unit.traits, "mars_trained")){
			       				unit_data_string +="displays a talent with technology that might make him suited to a role within the armentarium.#";
			       			}
			       		} else if(selected_unit.technology >= 45){
			       			unit_data_string +="Is a technological prodigy able to understand and build most anything that takes his interest.#";
			       		} else if (selected_unit.technology <25){
			       			unit_data_string +="Is a technological luddite capable of little more than cleaning his own bolter.#";
			       		} else if (selected_unit.technology <35){
			       			unit_data_string +="Is capable enough with technical skills to carry out basic tasks in the field.#";
			       		}
		       		}
		       		unit_data_string += "#";

		       		tooltip_text = "Traits##";
		       		for (i=0;i<array_length(selected_unit.traits);i++){
		       			unit_data_string += string(global.trait_list[$ selected_unit.traits[i]].flavour_text, unit_name) +"#";
		       			tooltip_text += global.trait_list[$ selected_unit.traits[i]].display_name;
		       			if (struct_exists(global.trait_list[$ selected_unit.traits[i]], "effect")){
		       				tooltip_text += global.trait_list[$ selected_unit.traits[i]].effect;
		       			}
		       			tooltip_text +="#";
		       		}
		       		tooltip_text = string_hash_to_newline(tooltip_text);
		       		tooltip_draw(stat_x+2,stat_y, tooltip_text);
		       		tooltip_draw(xx+25,yy+65, string_hash_to_newline(unit_data_string), 3, 0, 975, 17);
		        }
			}
		}    
	}
	

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
		
	    // Draw Title
	    var c=0,fx="";
	    if (managing<=10) then c=managing;
	    if (managing>20) then c=managing-10;
    
		// Draw companies
	    if (managing >= 1) and (managing <=10) {
			fx= romanNumerals[managing - 1] + " Company";
		}
    
	    if (managing==11) then fx="Headquarters";
	    if (managing==12) then fx="Apothecarion";
	    if (managing==13) then fx="Librarium";
	    if (managing==14) then fx="Reclusium";
	    if (managing==15) then fx="Armamentarium";
    
	    draw_text(xx+800,yy+74,string_hash_to_newline(string(global.chapter_name)+" "+string(fx)));
	    if (obj_ini.company_title[managing]!=""){
			draw_set_font(fnt_fancy);
	        draw_text(xx+800,yy+110,string_hash_to_newline("''"+string(obj_ini.company_title[managing])+"''"));
		}
	    // Back
	    draw_sprite_ext(spr_arrow,0,xx+25,yy+70,2,2,0,c_white,1);
    
	    var top, sel, temp1="", temp2="", temp3="", temp4="", temp5="";
	    top=ship_current;
	    sel=top;
    
	    draw_set_font(fnt_40k_14);
	    draw_set_halign(fa_left);
	    yy+=77;
    
		var repetitions=min(ship_max,ship_see)
	    for(var i=0; i<repetitions; i++){
	        if (sh_name[sel]!=""){
	            temp1=string(sh_name[sel])+" ("+string(sh_class[sel])+")";
	            temp2=string(sh_loc[sel]);
	            temp3=sh_hp[sel];
	            temp4=string(sh_cargo[sel])+" / "+string(sh_cargo_max[sel])+" Space Used";
	        }
        
	        draw_set_color(c_black);
			draw_rectangle(xx+25,yy+64,xx+974,yy+85,0);
	        draw_set_color(c_gray);
			draw_rectangle(xx+25,yy+64,xx+974,yy+85,1);
	        draw_text_transformed(xx+27,yy+66,string_hash_to_newline(string(temp1)),1,1,0);
			draw_text_transformed(xx+27.5,yy+66.5,string_hash_to_newline(string(temp1)),1,1,0);
	        draw_text_transformed(xx+364,yy+66,string_hash_to_newline(string(temp2)),1,1,0);
	        draw_text_transformed(xx+580,yy+66,string_hash_to_newline(string(temp3)),1,1,0);
	        draw_text_transformed(xx+730,yy+66,string_hash_to_newline(string(temp4)),1,1,0);
        
	        yy+=20;sel+=1;
	    }
    
		// Load to selected
	    draw_set_font(fnt_40k_14b);
	    draw_text_transformed(xx+320,yy+402,string_hash_to_newline("Click a Ship to Load Selection (Req. "+string(man_size)+" Space)"),1,1,0);
    
	    xx=__view_get( e__VW.XView, 0 )+0;yy=__view_get( e__VW.YView, 0 )+0;
    
	    // draw_text_transformed(xx+488,yy+426,"Selection Size: "+string(man_size),0.4,0.4,0);
	    scr_scrollbar(974,172,1005,790,34,ship_max,ship_current);
	}

}