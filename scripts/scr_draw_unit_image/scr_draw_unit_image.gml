
function scr_draw_unit_image(x_draw, y_draw){
    draw_set_font(fnt_40k_14b);
    draw_set_color(c_gray);
	var xx=__view_get( e__VW.XView, 0 )+0, yy=__view_get( e__VW.YView, 0 )+0, bb="", img=0;
    var blandify = obj_controller.blandify;
    var draw_sequence = [];
    if (name_role()!="") and (base_group=="astartes"){

        ui_weapon[1]=spr_weapon_blank;
        ui_weapon[2]=spr_weapon_blank;
        ui_arm[1]=true;
        ui_arm[2]=true;
        ui_above[1]=true;
        ui_above[2]=true;
        ui_spec[1]=false;
        ui_spec[2]=false;
        ui_twoh[1]=false;
        ui_twoh[2]=false;
        ui_xmod[1]=0;
        ui_xmod[2]=0;
        ui_ymod[1]=0;
        ui_ymod[2]=0;
        fix_left=0;
        fix_right=0;
        ui_back=true;
        ui_force_both=false;
        ui_specialist=0;
        ttrim=0;
        var armour_bypass = false;
        var armour_draw =[];        
        ui_coloring=""; 
		var specialist_colours=obj_ini.col_special; 
        var specific_armour_sprite = "none";
        var unit_is_sniper = false;
        if (role()=="Chapter Master"){ui_specialist=111;}
        // Honor Guard
        else if (role()==obj_ini.role[100,2]){ui_specialist=14;}
        // Chaplain
        else if (is_specialist(role(),"chap",true)){ui_specialist=1;}
        // Apothecary
        else if (is_specialist(role(),"apoth",true)){ui_specialist=3;}
        // Techmarine
        else if (is_specialist(role(),"forge",true)){  ui_specialist=5;}
        // Librarian
        else if (is_specialist(role(),"libs",true)){ui_specialist=7;}
        // Death Company
        else if (role()=="Death Company"){ui_specialist=15;}
        // Dark Angels bone color
        if (global.chapter_name=="Dark Angels" && company=1){
            if (role()==obj_ini.role[100][4])then ui_coloring="bone";
            if (company==1){
                if (string_count("Terminator",armour())>0 || armour()=="Tartaros"){
                    if (array_contains([obj_ini.role[100][5],obj_ini.role[100][7],obj_ini.role[100][19],"Standard Bearer"],role())){
                        ui_coloring="bone";
                    }
                }
            }
        }
        // Blood Angels gold
        if ((ui_specialist==14 || role()=="Chapter Master")) and (global.chapter_name=="Blood Angels") then ui_coloring="gold";
        // Sets up the description for the equipement of current marine            
    
        var armor_type=ArmorType.Normal,armour_sprite=spr_weapon_blank;
        var back_type=BackType.None,hood=0,skull=0,arm=0,halo=0,braz=0,slow=0,brothers=-5,body_part;

        var skin_color=obj_ini.skin_color;

        var unit_wep1=string_replace(weapon_one(),"Arti. ","");
        var unit_wep2=string_replace(weapon_two(),"Arti. ","");
        var unit_armor=string_replace(armour(),"Arti. ","");
        var unit_gear=string_replace(gear(),"Arti. ","");
        var unit_back=string_replace(mobility_item(),"Arti. ","");

        if (ui_specialist=7 || ui_specialist=1 || ui_specialist=111){
            if (array_contains(obj_ini.adv, "Reverent Guardians")){
                braz=1
            }
        }
        if (unit_gear="Psychic Hood"){
            hood=-50;
        }else if (unit_gear="Iron Halo"){
            halo=1;
        }else if (unit_gear="Servo Arms" || unit_gear="Master Servo Arms"){
            var mas;
            // mas=string_count("Master",gear());
            if (unit_gear="Servo Arms") then mas=0;
            if (unit_gear="Master Servo Arms") then mas=1;
        
            if (mas=0){
                if (specialist_colours=0 || specialist_colours>1) then arm=1;
                if (specialist_colours=1) then arm=0;
            }
            if (mas>0){
            	switch(specialist_colours){
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
        if (ui_specialist=1) and (global.chapter_name!="Iron Hands") then skull=-50;
    
        // if (_armor_type!=ArType.Norm) then ui_back=false;

        // Define backpack types
        enum BackType {
            None,
            Jump,
            Dev
        }

        if (unit_back=="Jump Pack"){
			ui_back=false;
			back_type=BackType.Jump;
		}else if (unit_back=="Heavy Weapons Pack"){
            ui_back=false;
			back_type=BackType.Dev;
        }

        // Define armor types
        enum ArmorType {
            Normal,
            Indomitus,
            Tartaros,
            Dreadnought,
            None
        }

        switch(unit_armor){
            case "Terminator Armour":
                ui_back=false;
                armor_type = ArmorType.Indomitus;
                break;
            case "Tartaros":
                ui_back=false;
                armor_type = ArmorType.Tartaros;
                break;
            case "Dreadnought":
                ui_back=false;
                armor_type = ArmorType.Dreadnought;
                break;
            case "(None)":
            case "":
            case "None":
                armor_type = ArmorType.None;
                break;
            }
		
        if (armor_type!=ArmorType.Normal) then ui_back=false;
        
        if (armor_type!=ArmorType.Dreadnought && armor_type!=ArmorType.None){
            if (weapon_one()!=""){
                scr_ui_display_weapons(1,armor_type,weapon_one());
            }
            
            if (weapon_two()!="") and (ui_force_both==false){
                scr_ui_display_weapons(2,armor_type,weapon_two());
            }
        }
    
        if (ui_twoh[1]=true) and (ui_arm[1]=false) then ui_arm[2]=false;
        if (ui_twoh[2]=true) and (ui_arm[2]=false) then ui_arm[1]=false;
    
                y_draw+=40;   
        if(shader_is_compiled(sReplaceColor)){
            shader_set(sReplaceColor);
            shader_set_uniform_f(obj_controller.colour_to_find1, obj_controller.sourceR1,obj_controller.sourceG1,obj_controller.sourceB1 ); //body / blue-origin  
            shader_set_uniform_f(obj_controller.colour_to_set1, obj_controller.targetR1,obj_controller.targetG1,obj_controller.targetB1 );
            shader_set_uniform_f(obj_controller.colour_to_find2, obj_controller.sourceR2,obj_controller.sourceG2,obj_controller.sourceB2 ); //helmet / red-origin
            shader_set_uniform_f(obj_controller.colour_to_set2, obj_controller.targetR2,obj_controller.targetG2,obj_controller.targetB2 );
            shader_set_uniform_f(obj_controller.colour_to_find3, obj_controller.sourceR3,obj_controller.sourceG3,obj_controller.sourceB3 ); //left pauldron / yellow-origin
            shader_set_uniform_f(obj_controller.colour_to_set3, obj_controller.targetR3,obj_controller.targetG3,obj_controller.targetB3 );
            shader_set_uniform_f(obj_controller.colour_to_find4, obj_controller.sourceR4,obj_controller.sourceG4,obj_controller.sourceB4 ); //lens / green-origin
            shader_set_uniform_f(obj_controller.colour_to_set4, obj_controller.targetR4,obj_controller.targetG4,obj_controller.targetB4 );
            shader_set_uniform_f(obj_controller.colour_to_find5, obj_controller.sourceR5,obj_controller.sourceG5,obj_controller.sourceB5 ); // trim / pink-origin
            shader_set_uniform_f(obj_controller.colour_to_set5, obj_controller.targetR5,obj_controller.targetG5,obj_controller.targetB5 );
            shader_set_uniform_f(obj_controller.colour_to_find6, obj_controller.sourceR6,obj_controller.sourceG6,obj_controller.sourceB6 ); //right pauldron / white-origin
            shader_set_uniform_f(obj_controller.colour_to_set6, obj_controller.targetR6,obj_controller.targetG6,obj_controller.targetB6 );
            shader_set_uniform_f(obj_controller.colour_to_find7, obj_controller.sourceR7,obj_controller.sourceG7,obj_controller.sourceB7 ); //weapon / cyan-origin
            shader_set_uniform_f(obj_controller.colour_to_set7, obj_controller.targetR7,obj_controller.targetG7,obj_controller.targetB7 );
            // Special specialist stuff here
            /*
            ui_specialist=0;
            if (role()=obj_ini.role[100,14]) then ui_specialist=1;// Chaplain
            if (role()=obj_ini.role[100,15]) then ui_specialist=3;// Apothecary
            if (role()=obj_ini.role[100,15]) and ((global.chapter_name="Blood Angels" || obj_ini.progenitor==5)) then ui_specialist=4;// Sanguinary
            if (role()=obj_ini.role[100,16]) then ui_specialist=5;// Techmarine
            if (role()=obj_ini.role[100,17]) then ui_specialist=7;// Librarian
            */
        
            ttrim=obj_controller.trim;
			specialist_colours=obj_ini.col_special;
			
			// Chaplain
            if (ui_specialist=1 || (ui_specialist=3) and (global.chapter_name="Space Wolves")){
                shader_set_uniform_f(obj_controller.colour_to_set1, 30/255,30/255,30/255);
                shader_set_uniform_f(obj_controller.colour_to_set2, 30/255,30/255,30/255);
                // ttrim=0;
                specialist_colours=0;
            }
			
			// Apothecary
            else if (ui_specialist=3) and (global.chapter_name!="Space Wolves"){
                shader_set_uniform_f(obj_controller.colour_to_set1, 255/255,255/255,255/255);
                shader_set_uniform_f(obj_controller.colour_to_set2, 255/255,255/255,255/255);
                ttrim=0;
                specialist_colours=0;
            }
			
			// Techmarine
            else if (ui_specialist=5){
                shader_set_uniform_f(obj_controller.colour_to_set1, 150/255,0/255,0/255);
                shader_set_uniform_f(obj_controller.colour_to_set2, 150/255,0/255,0/255);
                // pauldron
                shader_set_uniform_f(obj_controller.colour_to_set4, 0/255,70/255,0/255);
                shader_set_uniform_f(obj_controller.colour_to_set5, 200/255,200/255,200/255);
                ttrim=1;specialist_colours=0;
            }

			// Librarian
            else if (ui_specialist=7){
                shader_set_uniform_f(obj_controller.colour_to_set1, 21/255,92/255,165/255);
                shader_set_uniform_f(obj_controller.colour_to_set2, 21/255,92/255,165/255);
                shader_set_uniform_f(obj_controller.colour_to_set4, 0/255,160/255,0/255);
                shader_set_uniform_f(obj_controller.colour_to_set6, 21/255,92/255,165/255);
                ttrim=0;
                specialist_colours=0;
            }
			
			// Death Company
            else if (ui_specialist=15){
                shader_set_uniform_f(obj_controller.colour_to_set1, 30/255,30/255,30/255);
                shader_set_uniform_f(obj_controller.colour_to_set2, 30/255,30/255,30/255);
                shader_set_uniform_f(obj_controller.colour_to_set3, 30/255,30/255,30/255);
                shader_set_uniform_f(obj_controller.colour_to_set4, 124/255,0/255,0/255);// Lens
                shader_set_uniform_f(obj_controller.colour_to_set5, 30/255,30/255,30/255);
                shader_set_uniform_f(obj_controller.colour_to_set6, 30/255,30/255,30/255);
                shader_set_uniform_f(obj_controller.colour_to_set7, 124/255,0/255,0/255);// Weapon
                ttrim=0;
                specialist_colours=0;
                
            }
			
			// Deathwing
            if (ui_coloring="bone"){
                shader_set_uniform_f(obj_controller.colour_to_set1, 229/255,200/255,123/255);
                shader_set_uniform_f(obj_controller.colour_to_set2, 229/255,200/255,123/255);
                shader_set_uniform_f(obj_controller.colour_to_set3, 229/255,200/255,123/255);
                shader_set_uniform_f(obj_controller.colour_to_set5, 229/255,200/255,123/255);
                shader_set_uniform_f(obj_controller.colour_to_set6, 229/255,200/255,123/255);
                ttrim=0;
                specialist_colours=0;
            }
			
			// Blood Angels
            else if (ui_coloring="gold"){
                shader_set_uniform_f(obj_controller.colour_to_set1, 237/255,150/255,0/255);
                shader_set_uniform_f(obj_controller.colour_to_set2, 237/255,150/255,0/255);
                shader_set_uniform_f(obj_controller.colour_to_set3, 237/255,150/255,0/255);
                shader_set_uniform_f(obj_controller.colour_to_set5, 237/255,150/255,0/255);
                shader_set_uniform_f(obj_controller.colour_to_set6, 237/255,150/255,0/255);
                ttrim=0;
                specialist_colours=0;
            }

            shader_set_uniform_f(obj_controller.colour_to_find8, 46/255,49/255,146/255 );//body
            var main_body_shade = shadow_creator(obj_controller.targetR1*255,obj_controller.targetG1*255,obj_controller.targetB1*255, 0.7);
            shader_set_uniform_f(obj_controller.colour_to_set8, color_get_red(main_body_shade)/255,color_get_green(main_body_shade)/255,color_get_blue(main_body_shade)/255);//body         
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
            // draw_sprite(spr_marine_base,img,xx+x_draw,yy+y_draw);
        
            var clothing_style=3;
            if (global.chapter_name=="Dark Angels" || obj_ini.progenitor==1)  {clothing_style=0;}
            else if (global.chapter_name=="White Scars" || obj_ini.progenitor==2)  {clothing_style=1; }
            else if (global.chapter_name=="Space Wolves" || obj_ini.progenitor==3)  {clothing_style=2;}
            else if (global.chapter_name=="Imperial Fists" || obj_ini.progenitor==4)  {clothing_style=0;}
            else if (global.chapter_name=="Iron Hands" || obj_ini.progenitor==6) { clothing_style=0;}
            else if (global.chapter_name=="Salamanders" || obj_ini.progenitor==8)  {clothing_style=4;}
            else if (global.chapter_name=="Raven Guard" || obj_ini.progenitor==9)  {clothing_style=0;}
            else if (global.chapter_name=="Doom Benefactors")  {clothing_style=4;}
        
            // Determine Sprite
            if (skull=-50) then skull=1;
        
            if (armour()!=""){
                var yep=0;
                if (array_contains(obj_ini.adv,"Slow and Purposeful")){
                    slow=1
                }
                if (ui_specialist=5){
                    if (array_contains(obj_ini.adv,"Tech-Brothers")){
                        brothers=0
                    }
				}
            }else{armour_sprite=spr_weapon_blank;}// Define armour
        
			
			
            if (armour()=="Scout Armour"){
				if (slow>0) then slow=10;
				armour_sprite=spr_scout_colors2;
                if (squad!="none"){
                    if (obj_ini.squads[squad].type=="scout_sniper_squad" || weapon_one()=="Sniper Rifle" || weapon_two()=="Sniper Rifle"){
                        armour_sprite=spr_scout_colors;
                        unit_is_sniper = true;
                    }
                }
				if (hood=-50) then hood=0;
			}else if (armour()=="MK3 Iron Armour"){
				if (slow>0) then slow=13;
				if (brothers>-5) then brothers=3;
				armour_sprite=spr_mk3_colors;
				if (hood=-50) then hood=5;
			}else if (armour()=="MK4 Maximus"){
				if (slow>0) then slow=13;
				if (brothers>-5) then brothers=3;
				armour_sprite=spr_mk4_colors;
				if (hood=-50) then hood=6;
			}else if (armour()=="MK5 Heresy"){
				if (slow>0) then slow=13;
				if (brothers>-5) then brothers=3;
				armour_sprite=spr_mk5_colors;
				if (hood=-50) then hood=6;
			}else if (armour()=="MK6 Corvus"){
				if (slow>0) then slow=13;
				if (brothers>-5) then brothers=2;
				armour_sprite=spr_beakie_colors;
				if (hood=-50) then hood=3;
			}else if (armour()=="MK7 Aquila" || armour()=="Power Armour"){
				if (brothers>-5) then brothers=0;
				if (slow>0) then slow=13;
				armour_sprite=spr_mk7_colors;
				if (hood=-50) then hood=1;
			}else if (armour()=="MK8 Errant"){
				if (slow>0) then slow=13;
				if (brothers>-5) then brothers=0;
				armour_sprite=spr_mk8_colors;
				if (hood=-50) then hood=4;
			}else if (armour()=="Tartaros"){
				armour_sprite=spr_tartaros2_colors;
				if (brothers>-5) then brothers=4;
				if (hood=-50) then hood=8;
				if (skull==1) then skull=3;
			}
            if (unit_armor=="Terminator Armour"){
				armour_sprite=spr_terminator3_colors;
				if (brothers>-5) then brothers=5;
				if (hood=-50) then hood=9;
				if (skull==1) then skull=2;
			}else if (unit_armor=="Artificer Armour"){
				if (slow>0) then slow=13;
				if (brothers>-5) then brothers=1;
				armour_sprite=spr_artificer_colors;
				if (hood=-50) then hood=2;
			}else if (unit_armor=="Dreadnought") then armour_sprite=spr_dread_colors;
        
            if (armour_sprite=spr_weapon_blank) and (armour()!=""){
                if (string_count("Power Armour",armour())>0){
					if (slow>0) then slow=13;
					if (brothers>-5) then brothers=0;
					armour_sprite=spr_mk7_colors;
					if (hood=-50) then hood=1;
				}
                if (string_count("Artifi",armour())>0){
					if (slow>0) then slow=13;
					if (brothers>-5) then brothers=1;
					armour_sprite=spr_artificer_colors;
					if (hood=-50) then hood=2;
				}
                if (string_count("Termi",armour())>0){
					if (brothers>-5) then brothers=5;
					armour_sprite=spr_terminator3_colors;
					if (hood=-50) then hood=9;
					if (skull==1) then skull=2;
				}
                if (string_count("Dread",armour())>0) then armour_sprite=spr_dread_colors;
            }
            if (armor_type!=ArmorType.Normal && armor_type!=ArmorType.Dreadnought){
                ui_ymod[1]-=20;
                ui_ymod[2]-=20;
            }
            // Draw the fixed upper arms for Terminators and Tartaros
            if (armor_type==ArmorType.Indomitus){
                if (fix_left>0) then draw_sprite(spr_termi_wep_fix,0,xx+x_draw,yy+y_draw-20);
                if (fix_right>0){
                    if (specialist_colours<=1) then draw_sprite(spr_termi_wep_fix,2,xx+x_draw,yy+y_draw-20);
                    if (specialist_colours>=2) then draw_sprite(spr_termi_wep_fix,3,xx+x_draw,yy+y_draw-20);
                }
            }else if (armor_type==ArmorType.Tartaros){
                if (fix_left>0) then draw_sprite(spr_tartaros_wep_fix,0,xx+x_draw,yy+y_draw-20);
                if (fix_right>0){
                    if (specialist_colours<=1) then draw_sprite(spr_tartaros_wep_fix,2,xx+x_draw,yy+y_draw-20);
                    if (specialist_colours>=2) then draw_sprite(spr_tartaros_wep_fix,3,xx+x_draw,yy+y_draw-20);
                }
            }
        
            // Draw the lights
            if (ui_specialist=3) and (armour()!=""){
                if (armor_type==ArmorType.Indomitus) then draw_sprite(spr_gear_apoth,0,xx+x_draw,yy+y_draw-22); // for terminators
                else draw_sprite(spr_gear_apoth,0,xx+x_draw,yy+y_draw-6); // for normal power armor
                if (gear() == "Narthecium"){
                    ui_weapon[2]=0;
                }
            }
            
            // Weapons for below arms
            if (ui_weapon[1]!=0) and (sprite_exists(ui_weapon[1])) and (ui_above[1]==false) and (fix_left<8){
                if (ui_twoh[1]==false) and (ui_twoh[2]==false) then draw_sprite(ui_weapon[1],0,xx+x_draw+ui_xmod[1],yy+y_draw+ui_ymod[1]);
                if (ui_twoh[1]==true){
                    if (specialist_colours<=1) then draw_sprite(ui_weapon[1],0,xx+x_draw+ui_xmod[1],yy+y_draw+ui_ymod[1]);
                    if (specialist_colours>=2) then draw_sprite(ui_weapon[1],3,xx+x_draw+ui_xmod[1],yy+y_draw+ui_ymod[1]);
                    if (ui_force_both==true){
                        if (specialist_colours<=1) then draw_sprite(ui_weapon[1],0,xx+x_draw+ui_xmod[1],yy+y_draw+ui_ymod[1]);
                        if (specialist_colours>=2) then draw_sprite(ui_weapon[1],1,xx+x_draw+ui_xmod[1],yy+y_draw+ui_ymod[1]);
                    }
                }
            }
            if (ui_weapon[2]!=0) and (ui_above[2]==false) and (sprite_exists(ui_weapon[2])) and ((ui_twoh[1]==false || ui_force_both==true)) and (fix_right<8){
                if (ui_spec[2]==false) then draw_sprite(ui_weapon[2],1,xx+x_draw+ui_xmod[2],yy+y_draw+ui_ymod[2]);
                if (ui_spec[2]==true){
                    if (specialist_colours<=1) then draw_sprite(ui_weapon[2],2,xx+x_draw+ui_xmod[2],yy+y_draw+ui_ymod[2]);
                    if (specialist_colours>=2) then draw_sprite(ui_weapon[2],3,xx+x_draw+ui_xmod[2],yy+y_draw+ui_ymod[2]);
                }
            }
        
            if (armor_type==ArmorType.None){            
                if (ui_specialist==111 && global.chapter_name=="Doom Benefactors") then skin_color=6;
            
                draw_sprite(spr_marine_base,skin_color,xx+x_draw,yy+y_draw);
            
                if (skin_color!=6) then draw_sprite(spr_clothing_colors,clothing_style,xx+x_draw,yy+y_draw);
            } else {
                if (braz=1) and (blandify=0){
                    if (armor_type==ArmorType.Normal) then draw_sprite(spr_pack_brazier,0,xx+x_draw,yy+y_draw);
                    if (armor_type!=ArmorType.Normal) then draw_sprite(spr_pack_brazier,1,xx+x_draw-2,yy+y_draw);
                }                             
                 // Draw the backpack
                if (armor_type!=ArmorType.Dreadnought){
                    if (ui_back){
                        if (specialist_colours==0) then draw_sprite(armour_sprite,10,xx+x_draw,yy+y_draw);
                        if (specialist_colours==1) then draw_sprite(armour_sprite,11,xx+x_draw,yy+y_draw);
                        if (specialist_colours>=2) then draw_sprite(armour_sprite,12,xx+x_draw,yy+y_draw);
                    }else{
                        if (back_type==BackType.Jump){
                            if (specialist_colours==0) then draw_sprite(spr_pack_jump,0,xx+x_draw,yy+y_draw);
                            if (specialist_colours==1) then draw_sprite(spr_pack_jump,1,xx+x_draw,yy+y_draw);
                            if (specialist_colours>=2) then draw_sprite(spr_pack_jump,2,xx+x_draw,yy+y_draw);
                        }
                        if (back_type==BackType.Dev){
                            if (specialist_colours==0) then draw_sprite(spr_pack_devastator,0,xx+x_draw,yy+y_draw);
                            if (specialist_colours==1) then draw_sprite(spr_pack_devastator,1,xx+x_draw,yy+y_draw);
                            if (specialist_colours>=2) then draw_sprite(spr_pack_devastator,2,xx+x_draw,yy+y_draw);
                        }
                    }  
                }                
                var specific_helm = false;
                var helm_draw=[0,0];
                if (armour()=="Scout Armour"){
                    draw_sprite(spr_marine_base,skin_color,xx+x_draw,yy+y_draw);
                    draw_sprite(spr_marine_base,5,xx+x_draw,yy+y_draw);// Kind of crops the '_skin_color tone' pixels below the scout ones
                    draw_sprite(armour_sprite,specialist_colours,xx+x_draw,yy+y_draw);
                    draw_sprite(spr_facial_colors,clothing_style,xx+x_draw,yy+y_draw);
                    specific_armour_sprite=armour_sprite;
                    armour_bypass=true;
                    if (unit_is_sniper = true){
                        draw_sprite(spr_scout_colors,11,xx+x_draw,yy+y_draw);// Scout Sniper Cloak
                    }
                }else if (armour()=="MK3 Iron Armour"){
                    specific_armour_sprite = spr_mk3_colors;
                } else if (armour()=="MK4 Maximus"){
                    specific_armour_sprite = spr_mk4_colors;
                    if (array_contains(["Company Champion",obj_ini.role[100][2],obj_ini.role[100][5]], role())){
                        if (global.chapter_name=="Ultramarines"){
                            armour_draw=[spr_ultra_honor_guard,body.torso.armour_choice];
                            armour_bypass=true;
                            draw_sprite(spr_ultra_honor_guard,2,xx+x_draw,yy+y_draw);
                        } else {
                            armour_draw=[spr_generic_honor_guard,body.torso.armour_choice];
                            armour_bypass=true;
                        }
                   }        
                } else if (armour()=="MK5 Heresy"){
                    specific_armour_sprite = spr_mk5_colors;
                    if (global.chapter_name=="Dark Angels" || obj_ini.progenitor==1){specific_helm = spr_da_mk5_helm;}
                    else if (global.chapter_name=="White Scars" || obj_ini.progenitor==2){specific_helm = spr_ws_mk5_helm;}
                    else if (global.chapter_name=="Space Wolves" || obj_ini.progenitor==3){specific_helm = spr_sw_mk5_helm;}
                    else if (global.chapter_name=="Imperial Fists" || obj_ini.progenitor==4){specific_helm = spr_if_mk5_helm;}
                    else if (global.chapter_name=="Blood Angels" || obj_ini.progenitor=5){specific_helm = spr_ba_mk5_helm;}
                    else if (global.chapter_name=="Iron Hands" || obj_ini.progenitor==6){specific_helm = spr_ih_mk5_helm;}
                    else if (global.chapter_name=="Ultramarines" || obj_ini.progenitor==7){specific_helm = spr_um_mk5_helm;}
                    else if (global.chapter_name=="Salamanders" || obj_ini.progenitor==8){specific_helm = spr_sal_mk5_helm;}
                    else if (global.chapter_name=="Raven Guard" || obj_ini.progenitor==9) {specific_helm = spr_rg_mk5_helm;}
                    else {
                         specific_helm = spr_um_mk5_helm;
                    }                    
                } else if (armour()=="MK6 Corvus"){
                    specific_armour_sprite = spr_beakie_colors;
                    if (global.chapter_name=="Dark Angels" || obj_ini.progenitor==1){specific_helm = spr_da_mk6_helm;}
                    else if (global.chapter_name=="White Scars" || obj_ini.progenitor==2){specific_helm = spr_ws_mk6_helm;}
                    else if (global.chapter_name=="Space Wolves" || obj_ini.progenitor==3){specific_helm = spr_sw_mk6_helm;}
                    else if (global.chapter_name=="Imperial Fists" || obj_ini.progenitor==4){specific_helm = spr_if_mk6_helm;}
                    else if (global.chapter_name=="Blood Angels" || obj_ini.progenitor=5){specific_helm = spr_ba_mk6_helm;}
                    else if (global.chapter_name=="Iron Hands" || obj_ini.progenitor==6){specific_helm = spr_ih_mk6_helm;}
                    else if (global.chapter_name=="Ultramarines" || obj_ini.progenitor==7){specific_helm = spr_um_mk6_helm;}
                    else if (global.chapter_name=="Salamanders" || obj_ini.progenitor==8){specific_helm = spr_sal_mk6_helm;}
                    else if (global.chapter_name=="Raven Guard" || obj_ini.progenitor==9){specific_helm = spr_rg_mk6_helm;}
                    else {
                        specific_helm = spr_um_mk6_helm;
                    }
                    helm_draw[0] = -5;

                } else if (armour()=="MK7 Aquila" || unit_armor="Power Armour"){
                    specific_armour_sprite = spr_mk7_colors;
                    if (global.chapter_name=="Dark Angels" || obj_ini.progenitor==1){specific_helm = spr_da_mk7_helm;}
                    else if (global.chapter_name=="White Scars" || obj_ini.progenitor==2){specific_helm = spr_ws_mk7_helm;}
                    else if (global.chapter_name=="Space Wolves" || obj_ini.progenitor==3){specific_helm = spr_sw_mk7_helm;}
                    else if (global.chapter_name=="Imperial Fists" || obj_ini.progenitor==4){specific_helm = spr_if_mk7_helm;}
                    else if (global.chapter_name=="Blood Angels" || obj_ini.progenitor=5){specific_helm = spr_ba_mk7_helm;}
                    else if (global.chapter_name=="Iron Hands" || obj_ini.progenitor==6){specific_helm = spr_ih_mk7_helm;}
                    else if (global.chapter_name=="Ultramarines" || obj_ini.progenitor==7){specific_helm = spr_um_mk7_helm;}
                    else if (global.chapter_name=="Salamanders" || obj_ini.progenitor==8){specific_helm = spr_sal_mk7_helm;}
                    else if (global.chapter_name=="Raven Guard" || obj_ini.progenitor==9){specific_helm = spr_rg_mk7_helm;}
                    else {
                        specific_helm = spr_um_mk7_helm;
                    }
                } else if (armour()=="MK8 Errant"){
                    specific_armour_sprite = spr_mk8_colors;
                } else if (unit_armor="Artificer Armour"){
                    specific_armour_sprite = spr_artificer_colors;
                } else if (armor_type==ArmorType.Tartaros){
                    specific_armour_sprite = spr_tartaros2_colors;
                } else if (armor_type==ArmorType.Indomitus){
                    specific_armour_sprite = spr_terminator3_colors;
                }

                if (armor_type==ArmorType.Normal){
                    if (ui_specialist==5){
                        if (array_contains(traits, "tinkerer")){
                            //specific_armour_sprite="none";
                            armour_sprite =spr_techmarine_core;
                            specific_armour_sprite = spr_techmarine_core;
                        }
                    }  if (global.chapter_name=="Blood Angels"){
                        if (role()=="Chapter Master"){
                            //specific_armour_sprite="none";
                            armour_bypass=false;
                            armour_draw=[];
                            armour_sprite = spr_dante;
                            specific_armour_sprite = spr_dante;  
                        } else if (role()==obj_ini.role[100][2] && mobility_item()=="Jump Pack" && armour()!="MK3 Iron Armour"){
                            armour_bypass=false;
                            armour_draw=[];
                            armour_sprite =spr_sanguin_guard;
                            specific_armour_sprite = spr_sanguin_guard;                            
                        }
                    }
                }                
                if (arm>0){
                    draw_sprite(spr_servo_arms,0,xx+x_draw,yy+y_draw);
                    /*if (arm<10){
                        draw_sprite(spr_pack_arm,arm,xx+x_draw,yy+y_draw)
                    } else if (arm>=10) then draw_sprite(spr_pack_arms,arm-10,xx+x_draw,yy+y_draw);  */                  
                }                 
                if (specific_armour_sprite != "none"){
                    // This draws the arms
                    if (unit_armor!="Dreadnought"){
                        if (ui_arm[1]){
                            if (struct_exists(body[$ "right_arm"],"bionic") && armor_type==ArmorType.Normal){
                                if (body[$ "right_arm"][$ "bionic"].variant == 0){
                                    draw_sprite(spr_bionics_arm,0,xx+x_draw,yy+y_draw-4);
                                }else{
                                    draw_sprite(spr_bionics_arm_2,1,xx+x_draw+5,yy+y_draw-10);
                                }
                            } else {
                                draw_sprite(armour_sprite,6,xx+x_draw,yy+y_draw);
                            }
                        }
                        if (ui_arm[2]){
                            if  (specialist_colours<=1){
                                if (struct_exists(body[$ "left_arm"],"bionic") && armor_type==ArmorType.Normal){
                                        if (body[$ "left_arm"][$ "bionic"].variant == 0){
                                            draw_sprite(spr_bionics_arm,1,xx+x_draw,yy+y_draw-4);
                                        } else{
                                            draw_sprite(spr_bionics_arm_2,0,xx+x_draw-8,yy+y_draw-10);
                                        }
                                }else {
                                    draw_sprite(armour_sprite,8,xx+x_draw,yy+y_draw);
                                }
                            }else if(specialist_colours>=2){
                               if (struct_exists(body[$ "left_arm"],"bionic") && armor_type==ArmorType.Normal){
                                        if (body[$ "left_arm"][$ "bionic"].variant == 0){
                                            draw_sprite(spr_bionics_arm,3,xx+x_draw,yy+y_draw-4);
                                        } else{
                                            draw_sprite(spr_bionics_arm_2,2,xx+x_draw-8,yy+y_draw-10);
                                        }
                                }else {
                                    draw_sprite(armour_sprite,9,xx+x_draw,yy+y_draw);
                                }                  
                            }   
                        }
                    }                    
                    draw_sprite(armour_sprite,specialist_colours,xx+x_draw,yy+y_draw);
                    if (armour()=="MK7 Aquila"){
                        if (struct_exists(body.torso, "variation")){
                            if (body.torso.variation%2 == 1){
                                draw_sprite(mk7_chest_variants,0,xx+x_draw,yy+y_draw);
                            }
                        }
                    }
                    if (!armour_bypass){                
                        if (ttrim==0 && specialist_colours<=1) then draw_sprite(specific_armour_sprite,4,xx+x_draw,yy+y_draw);
                        if (ttrim==0 && specialist_colours>=2) then draw_sprite(specific_armour_sprite,5,xx+x_draw,yy+y_draw);
                    } else{
                        if (array_length(armour_draw)){
                             draw_sprite(armour_draw[0], armour_draw[1],xx+x_draw,yy+y_draw);
                        }
                    }
                }else if (armour_bypass && array_length(armour_draw)>1){
                    draw_sprite(armour_draw[0], armour_draw[1],xx+x_draw,yy+y_draw);
                }
            
                if (slow>=10) and (blandify=0) then draw_sprite(armour_sprite,slow,xx+x_draw,yy+y_draw);// Slow and Purposeful battle damage
                if (brothers>=0) and (blandify=0) then draw_sprite(spr_gear_techb,brothers,xx+x_draw,yy+y_draw);// Tech-Brothers bling
                //sgt helms
                if (specific_helm!=false){
                    shader_reset();
                    if (role()==obj_ini.role[100][18]){
                        draw_sprite(specific_helm,0,xx+x_draw+helm_draw[0],yy+y_draw);
                    }else if(role()==obj_ini.role[100][19]){
                        draw_sprite(specific_helm,1,xx+x_draw+helm_draw[0],yy+y_draw);
                    } 
                    shader_set(sReplaceColor);
                }            
                // Apothecary Lens
                if (ui_specialist=3){
                    if (armor_type==ArmorType.Tartaros) then draw_sprite(spr_gear_apoth,1,xx+x_draw-2,yy+y_draw-3);// was y_draw-4 with old tartar
                    if (armor_type==ArmorType.Indomitus) then draw_sprite(spr_gear_apoth,1,xx+x_draw,yy+y_draw-6);
                    if (armor_type!=ArmorType.Indomitus) and (armor_type!=ArmorType.Tartaros) then draw_sprite(spr_gear_apoth,1,xx+x_draw,yy+y_draw);
                    if (gear() == "Narthecium"){
                        if (armor_type==ArmorType.Normal) {
                            draw_sprite(spr_narthecium_2,0,xx+x_draw+62,yy+y_draw+5);
                        } else if (armor_type!=ArmorType.Normal && armor_type!=ArmorType.Dreadnought){
                             draw_sprite(spr_narthecium_2,0,xx+x_draw+70,yy+y_draw+30);
                        }
                    }
                }
            
                // Hood
                if (hood>0){
                    var yep=0;
                    if (array_contains(obj_ini.adv,"Daemon Binders") && blandify==0 && hood<7){
                        if (ttrim=1) then draw_sprite(spr_gear_hood2,0,xx+x_draw-2,yy+y_draw-11);
                        if (ttrim==0) then draw_sprite(spr_gear_hood2,1,xx+x_draw-2,yy+y_draw-11);
                    } else {
                        //if (obj_ini.main_color=obj_ini.secondary_color) then draw_sprite(spr_gear_hood1,hood,xx+x_draw,yy+y_draw);
                        //if (obj_ini.main_color!=obj_ini.secondary_color) then draw_sprite(spr_gear_hood3,hood,xx+x_draw,yy+y_draw);
                        draw_sprite(spr_psy_hood,2,xx+x_draw,yy+y_draw);
                    } 
                } else if (halo=1){ // Draw the Iron Halo
                    if (armor_type==ArmorType.Normal) and (ui_specialist=14) and ((obj_ini.progenitor=5 || global.chapter_name="Blood Angels")){
                        draw_sprite(spr_gear_halo,0,xx+x_draw,yy+y_draw);
                    }
                }

                //Chaplain head and Terminator version
                if (skull>0) and (ui_specialist=1){
                    if (armour()!="Terminator"){
                      //if (_armor_type==ArType.Tart || _armor_type==ArType.Term) then draw_sprite(spr_terminator_chap,1,xx+x_draw-2,yy+y_draw-11);
                    }
                    shader_reset();
                    if (armor_type!=ArmorType.Tartaros && armor_type!=ArmorType.Indomitus) then draw_sprite(spr_chaplain_skull_helm,0,xx+x_draw,yy+y_draw);
                    if (armor_type==ArmorType.Tartaros || armor_type==ArmorType.Indomitus) draw_sprite(spr_chaplain_skull_helm,0,xx+x_draw,yy+y_draw);
                    shader_set(sReplaceColor);
                }
            }
            //purity seals/decorations
            if (armor_type==ArmorType.Normal){
                if (struct_exists(body[$ "torso"],"purity_seal")){
                    if (body[$ "torso"][$"purity_seal"][2]==1){
                        draw_sprite(spr_purity_seal,2,xx+x_draw-24,yy+y_draw+14);
                    }
                    if (body[$ "torso"][$"purity_seal"][0]==1){
                        draw_sprite(spr_purity_seal,0,xx+x_draw-44,yy+y_draw+18);
                    }
                    if (body[$ "torso"][$"purity_seal"][1]==1){
                        draw_sprite(spr_purity_seal,0,xx+x_draw-6,yy+y_draw+16);
                    }                                       
                }
                if (struct_exists(body[$ "left_arm"],"purity_seal")){
                    if (body[$ "left_arm"][$"purity_seal"][0]==1){
                        draw_sprite(spr_purity_seal,1,xx+x_draw+70,yy+y_draw);
                    }
                    if (body[$ "left_arm"][$"purity_seal"][1]==1){
                        draw_sprite(spr_purity_seal,0,xx+x_draw+26,yy+y_draw+7);
                    }
                    if (body[$ "left_arm"][$"purity_seal"][2]==1){
                        draw_sprite(spr_purity_seal,0,xx+x_draw+15,yy+y_draw+10);
                    }                                       
                }
                if (struct_exists(body[$ "right_arm"],"purity_seal")){
                    if (body[$ "right_arm"][$"purity_seal"][0]==1){
                        draw_sprite(spr_purity_seal,2,xx+x_draw-54,yy+y_draw-3);
                    }
                    if (body[$ "right_arm"][$"purity_seal"][0]==1){
                        draw_sprite(spr_purity_seal,0,xx+x_draw-72,yy+y_draw+8);
                    }
                    if (body[$ "right_arm"][$"purity_seal"][0]==1){
                        draw_sprite(spr_purity_seal,0,xx+x_draw-57,yy+y_draw+12);
                    }                    
                }            
            }		

			// Bionics
			var eye_move_x = 0;
            var eye_move_y = 0;
            var eye_spacer = 0;
            if (armor_type == ArmorType.Indomitus) {
                // Adjust eye bionics on chaplain terminator armor
                if (skull > 0 && ui_specialist == 1) {
                    eye_move_y = 2;
                    eye_spacer = -2;
                // Adjust eye bionics on terminator armor
                } else {
                    eye_move_y = -7;
                }
            }
            // Draw bionics
			for (var part = 0; part<array_length(global.body_parts);part++){
				if (struct_exists(body[$ global.body_parts[part]], "bionic")){
					if (armor_type==ArmorType.Normal || armor_type==ArmorType.Indomitus){
                        var body_part = global.body_parts[part];
                        var bionic = body[$ body_part][$"bionic"];
                        switch(body_part){
                            case "left_eye":
                                 if (bionic.variant == 0){
                                    draw_sprite(spr_bionics_eye,1,xx+x_draw+eye_move_x+eye_spacer,yy+y_draw+eye_move_y);
                                } else if(bionic.variant == 1){
                                     draw_sprite(spr_bionic_eye_2,1,xx+x_draw+eye_move_x+eye_spacer,yy+y_draw+eye_move_y);
                                }else if(bionic.variant == 2){
                                     draw_sprite(spr_bionic_eye_2,2,xx+x_draw+eye_move_x+eye_spacer,yy+y_draw+eye_move_y);
                                }
                                break;
                                
                            case "right_eye":
                                if (bionic.variant ==0){
                                    draw_sprite(spr_bionics_eye,0,xx+x_draw+eye_move_x,yy+y_draw+eye_move_y);
                                }else if(bionic.variant == 1){
                                     draw_sprite(spr_bionic_eye_2,0,xx+x_draw+eye_move_x,yy+y_draw+eye_move_y);
                                }else if(bionic.variant == 2){
                                     draw_sprite(spr_bionic_eye_2,4,xx+x_draw+eye_move_x,yy+y_draw+eye_move_y);
                                }
                                break;

                            case  "left_leg":
                                if (armor_type==ArmorType.Normal){
                                    var sprite_num=3;
                                     if (specialist_colours>=2){
                                        sprite_num=4;
                                     }
                                    if(bionic.variant == 0){                             
                                        draw_sprite(spr_bionics_leg_2,sprite_num,xx+x_draw,yy+y_draw)
                                    } else {
                                        draw_sprite(spr_bionics_leg_3,sprite_num,xx+x_draw,yy+y_draw)
                                    }
                                }
                                break;

                            case "right_leg":
                                 if (armor_type==ArmorType.Normal){
                                    if(bionic.variant == 0){  
                                        draw_sprite(spr_bionics_leg_2,0,xx+x_draw,yy+y_draw)
                                    }else{
                                        draw_sprite(spr_bionics_leg_3,0,xx+x_draw,yy+y_draw)
                                    }
                                }
                                break;

                        }
					}
				}
			}
        
            // Honor Guard Helm
            if (hood==0) and (armor_type==ArmorType.Normal) and (armour()!="") and (role()==obj_ini.role[100][2]) && (global.chapter_name!="Ultramarines") && (global.chapter_name!="Blood Angels"){
                var helm_ii,o,yep;
            	helm_ii=0;
				yep=0;
                if (array_contains(obj_ini.adv,"Tech-Brothers")){
                    helm_ii=2;
                }else if (array_contains(obj_ini.adv,"Never Forgive") || obj_ini.progenitor==1){
                    helm_ii=3;
                } else if (array_contains(obj_ini.adv,"Reverent Guardians")) {
                    helm_ii=4;
                }

                draw_sprite(spr_honor_helm,helm_ii,xx+x_draw-2,yy+y_draw-11);     

			}
            // Drawing Robes
            if (armor_type == ArmorType.Normal) {
                var robe_offset_x = 0;
                var robe_offset_y = 0;
                var hood_offset_x = 0;
                var hood_offset_y = 0;
                if (array_contains(["Scout Armour"], armour())) {
                    robe_offset_x = 1;
                    robe_offset_y = 10;
                    hood_offset_x = 1;
                    hood_offset_y = 10;
                }
                if (struct_exists(body[$ "head"],"hood")) {
                    draw_sprite(spr_marine_cloth_hood,0,xx+x_draw+hood_offset_x,yy+y_draw+hood_offset_y);     
                }
                if (struct_exists(body[$ "torso"],"robes")) {
                    draw_sprite(spr_marine_robes,body[$ "torso"][$ "robes"],xx+x_draw+robe_offset_x,yy+y_draw+robe_offset_y);     
                }              
            }
            if (armour_sprite==spr_scout_colors2){
                ui_ymod[1]+=7;
                ui_ymod[2]+=7;
            }
            // Weapons for above arms
            if (ui_weapon[1]!=0) and (sprite_exists(ui_weapon[1])) and (ui_above[1]==true) and (fix_left<8){
                if (ui_twoh[1]==false) and (ui_twoh[2]==false){
                    draw_sprite(ui_weapon[1],0,xx+x_draw+ui_xmod[1],yy+y_draw+ui_ymod[1]);                  
                }
                if (ui_twoh[1]==true){
                    if (specialist_colours<=1) then draw_sprite(ui_weapon[1],0,xx+x_draw+ui_xmod[1],yy+y_draw+ui_ymod[1]);
                    if (specialist_colours>=2) then draw_sprite(ui_weapon[1],3,xx+x_draw+ui_xmod[1],yy+y_draw+ui_ymod[1]);
                    if (ui_force_both==true){
                        if (specialist_colours<=1) then draw_sprite(ui_weapon[1],0,xx+x_draw+ui_xmod[1],yy+y_draw+ui_ymod[1]);
                        if (specialist_colours>=2) then draw_sprite(ui_weapon[1],1,xx+x_draw+ui_xmod[1],yy+y_draw+ui_ymod[1]);
                    }
                }
            }
            if (ui_weapon[2]!=0) and (ui_above[2]==true) and (sprite_exists(ui_weapon[2])) and ((ui_twoh[1]==false || ui_force_both==true)) and (fix_right<8){
                if (ui_spec[2]==false){
                    draw_sprite(ui_weapon[2],1,xx+x_draw+ui_xmod[2],yy+y_draw+ui_ymod[2]);
                }
                if (ui_spec[2]==true){
                    if (specialist_colours<=1) then draw_sprite(ui_weapon[2],2,xx+x_draw+ui_xmod[2],yy+y_draw+ui_ymod[2]);
                    if (specialist_colours>=2) then draw_sprite(ui_weapon[2],3,xx+x_draw+ui_xmod[2],yy+y_draw+ui_ymod[2]);                    
                }
            }
        
            // New powerfists for termi/tartaros
            if (ui_weapon[1]!=0){
                if  (fix_left==8){
                	draw_sprite(spr_weapon_powfist3,0,xx+x_draw+ui_xmod[1],yy+y_draw+ui_ymod[1])
                } else if(fix_left==8.1){
                	draw_sprite(spr_weapon_lightning2,0,xx+x_draw+ui_xmod[1],yy+y_draw+ui_ymod[1]);
                }
                if (fix_right==8){
                	draw_sprite(spr_weapon_powfist3,1,xx+x_draw+ui_xmod[2],yy+y_draw+ui_ymod[2]);
                } else if(fix_right==8.1){
                	draw_sprite(spr_weapon_lightning2,1,xx+x_draw+ui_xmod[2],yy+y_draw+ui_ymod[2]);
                }
        	}
        
            // Draw the fixed upper hands for Terminators or Tartaros
            if (armor_type==ArmorType.Indomitus){
                if (fix_left>0) and (fix_left!=2) and (fix_left!=4) and (fix_left<8) then draw_sprite(spr_termi_wep_fix,4,xx+x_draw,yy+y_draw+ui_ymod[1]-20);
                if (fix_right>0) and (fix_right!=2) and (fix_right!=4) and (fix_right<8){
                    if (specialist_colours<=1) then draw_sprite(spr_termi_wep_fix,6,xx+x_draw,yy+y_draw+ui_ymod[1]-20);
                    if (specialist_colours>=2) then draw_sprite(spr_termi_wep_fix,7,xx+x_draw,yy+y_draw+ui_ymod[1]-20);
                }
            }else if (armor_type==ArmorType.Tartaros){
                if (fix_left>0) and (fix_left!=2) and (fix_left!=4) and (fix_left<8) then draw_sprite(spr_tartaros_wep_fix,4,xx+x_draw,yy+y_draw+ui_ymod[2]-20);
                if (fix_right>0) and (fix_right!=2) and (fix_right!=4) and (fix_right<8){
                    if (specialist_colours<=1) then draw_sprite(spr_tartaros_wep_fix,6,xx+x_draw,yy+y_draw+ui_ymod[2]-20);
                    if (specialist_colours>=2) then draw_sprite(spr_tartaros_wep_fix,7,xx+x_draw,yy+y_draw+ui_ymod[2]-20);
                }
            }
            // if (braz=1) then draw_sprite(spr_pack_brazier,1,xx+x_draw,yy+y_draw);
            if (armor_type==ArmorType.Dreadnought){
                draw_sprite(spr_dreadnought_chasis_colors,specialist_colours,xx+x_draw,yy+y_draw);
                var left_arm = dreadnought_sprite_components(weapon_two());
                var colour_scheme  =  specialist_colours<=1 ? 0 : 1;
                draw_sprite(left_arm,colour_scheme,xx+x_draw,yy+y_draw);
                colour_scheme  += 2;
                var right_arm = dreadnought_sprite_components(weapon_one());
                draw_sprite(right_arm,colour_scheme,xx+x_draw,yy+y_draw);
            } 			
            shader_reset();           
        }else{
            draw_set_color(c_gray);
            draw_text(xx+x_draw,yy+y_draw,string_hash_to_newline("Color swap shader#did not compile"));
        }
        // if (race()!="1"){draw_set_color(38144);draw_rectangle(xx+x_draw,yy+y_draw,xx+x_draw+166,yy+y_draw+231,0);}


    draw_set_alpha(1);

    if (name_role()!=""){
        if (race()=="3"){
            if (string_count("Techpriest",name_role())>0) then draw_sprite(spr_techpriest,0,xx+x_draw,yy+y_draw);
        }else if (race()=="4"){
            if (string_count("Crusader",name_role())>0) then draw_sprite(spr_crusader,0,xx+x_draw,yy+y_draw);
        }else if (race()=="5"){
            if (string_count("Sister of Battle",name_role())>0) then draw_sprite(spr_sororitas,0,xx+x_draw,yy+y_draw);
            if (string_count("Sister Hospitaler",name_role())>0) then draw_sprite(spr_sororitas,1,xx+x_draw,yy+y_draw);
        }else if (race()=="6"){
            if (string_count("Ranger",name_role())>0) then draw_sprite(spr_eldar_hire,0,xx+x_draw,yy+y_draw);
            if (string_count("Howling Banshee",name_role())>0) then draw_sprite(spr_eldar_hire,1,xx+x_draw,yy+y_draw);
        }
    }
}