
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
        ui_coloring=""; 
		var specialist_colours=obj_ini.col_special; 
        var specific_armour_sprite = "none";
        if (role()=="Chapter Master") then ui_specialist=111;
        // Honor Guard
        else if (role()==obj_ini.role[100,2]) then ui_specialist=14;
        // Chaplain
        else if (is_specialist(role(),"chap",true)){ui_specialist=1;}
        // Apothecary
        else if (is_specialist(role(),"apoth",true)){ui_specialist=3;}
        // Techmarine
        else if (is_specialist(role(),"forge",true)){  ui_specialist=5;}
        // Librarian
        else if (is_specialist(role(),"lib",true)){
            ui_specialist=7;
        }

        // Death Company
        else if (role()=="Death Company") then ui_specialist=15;
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
    
        var base_sprite=0,armour_sprite=spr_weapon_blank,show1,show2;
        var jump=0,dev=0,hood=0,skull=0,arm=0,halo=0,braz=0,slow=0,brothers=-5,body_part;

        var skin=obj_ini.skin_color;
    
        var show_wep1,show_wep2,show_arm,show_gear,show_mobi;
		
        show_wep1=string_replace(weapon_one(),"Arti. ","");
        show_wep2=string_replace(weapon_two(),"Arti. ","");
        show_arm=string_replace(armour(),"Arti. ","");
        show_gear=string_replace(gear(),"Arti. ","");
        show_mobi=string_replace(mobility_item(),"Arti. ","");
    
        if (ui_specialist=7 || ui_specialist=1 || ui_specialist=111){
            if (array_contains(obj_ini.adv, "Reverent Guardians")){
                braz=1
            }
        }
        if (show_gear="Psychic Hood"){
            hood=-50;
        }else if (show_gear="Iron Halo"){
            halo=1;
        }else if (show_gear="Servo Arms" || show_gear="Master Servo Arms"){
            var mas;
            // mas=string_count("Master",gear());
            if (show_gear="Servo Arms") then mas=0;
            if (show_gear="Master Servo Arms") then mas=1;
        
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
    
        // if (base_sprite>0) then ui_back=false;
    
        if (show_mobi="Jump Pack"){
			ui_back=false;
			jump=1;
		}
		
        if (role()==obj_ini.role[100,9]){
			ui_back=false;
			dev=1;
		}
		
        if (show_arm="Terminator Armour"){
			ui_back=false;
			base_sprite=1;
		}else if (show_arm="Tartaros"){
			ui_back=false;
			base_sprite=2;
		}else if (show_arm="Dreadnought"){
			ui_back=false;
			base_sprite=5;
		}
		
        if (base_sprite>0) then ui_back=false;
        
        if (base_sprite<5){
            if (weapon_one()!=""){
                scr_ui_display_weapons(1,base_sprite,weapon_one());
            }
            
            if (weapon_two()!="") and (ui_force_both==false){
                scr_ui_display_weapons(2,base_sprite,weapon_two());
            }
        }
    
        if (ui_twoh[1]=true) and (ui_arm[1]=false) then ui_arm[2]=false;
        if (ui_twoh[2]=true) and (ui_arm[2]=false) then ui_arm[1]=false;
    
        draw_set_color(38144);
        draw_rectangle(xx+x_draw,yy+y_draw,xx+x_draw+166,yy+y_draw+271,0);
        draw_set_color(c_black);
        draw_rectangle(xx+x_draw,yy+y_draw,xx+x_draw+166,yy+y_draw+271,1); 
        y_draw+=40;   
        if(shader_is_compiled(sReplaceColor)){
            shader_set(sReplaceColor);
            shader_set_uniform_f(obj_controller.colour_to_find1, obj_controller.sourceR1,obj_controller.sourceG1,obj_controller.sourceB1 );//body  
            shader_set_uniform_f(obj_controller.colour_to_set1, obj_controller.targetR1,obj_controller.targetG1,obj_controller.targetB1 );
            shader_set_uniform_f(obj_controller.colour_to_find2, obj_controller.sourceR2,obj_controller.sourceG2,obj_controller.sourceB2 );//helm   
            shader_set_uniform_f(obj_controller.colour_to_set2, obj_controller.targetR2,obj_controller.targetG2,obj_controller.targetB2 );
            shader_set_uniform_f(obj_controller.colour_to_find3, obj_controller.sourceR3,obj_controller.sourceG3,obj_controller.sourceB3 );       
            shader_set_uniform_f(obj_controller.colour_to_set3, obj_controller.targetR3,obj_controller.targetG3,obj_controller.targetB3 );
            shader_set_uniform_f(obj_controller.colour_to_find4, obj_controller.sourceR4,obj_controller.sourceG4,obj_controller.sourceB4 );   //lens   
            shader_set_uniform_f(obj_controller.colour_to_set4, obj_controller.targetR4,obj_controller.targetG4,obj_controller.targetB4 );
            shader_set_uniform_f(obj_controller.colour_to_find5, obj_controller.sourceR5,obj_controller.sourceG5,obj_controller.sourceB5 );
            shader_set_uniform_f(obj_controller.colour_to_set5, obj_controller.targetR5,obj_controller.targetG5,obj_controller.targetB5 );
            shader_set_uniform_f(obj_controller.colour_to_find6, obj_controller.sourceR6,obj_controller.sourceG6,obj_controller.sourceB6 );
            shader_set_uniform_f(obj_controller.colour_to_set6, obj_controller.targetR6,obj_controller.targetG6,obj_controller.targetB6 );
            shader_set_uniform_f(obj_controller.colour_to_find7, obj_controller.sourceR7,obj_controller.sourceG7,obj_controller.sourceB7 );
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
                shader_set_uniform_f(obj_controller.colour_to_set1, 166/255,129/255,0/255);
                shader_set_uniform_f(obj_controller.colour_to_set2, 166/255,129/255,0/255);
                shader_set_uniform_f(obj_controller.colour_to_set3, 166/255,129/255,0/255);
                shader_set_uniform_f(obj_controller.colour_to_set5, 166/255,129/255,0/255);
                shader_set_uniform_f(obj_controller.colour_to_set6, 166/255,129/255,0/255);
                ttrim=0;
                specialist_colours=0;
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
				armour_sprite=spr_scout_colors;
				if (hood=-50) then hood=0;
			}else if (armour()=="MK3 Iron Armour"){
				if (slow>0) then slow=13;
				if (brothers>-5) then brothers=3;
				armour_sprite=spr_iron2_colors;
				if (hood=-50) then hood=5;
			}else if (armour()=="MK4 Maximus"){
				if (slow>0) then slow=13;
				if (brothers>-5) then brothers=3;
				armour_sprite=spr_maximus_colors;
				if (hood=-50) then hood=6;
			}else if (armour()=="MK5 Heresy"){
				if (slow>0) then slow=13;
				if (brothers>-5) then brothers=3;
				armour_sprite=spr_heresy_colors;
				if (hood=-50) then hood=6;
			}else if (armour()=="MK6 Corvus"){
				if (slow>0) then slow=13;
				if (brothers>-5) then brothers=2;
				armour_sprite=spr_beakie_colors;
				if (hood=-50) then hood=3;
			}else if (armour()=="MK7 Aquila" || armour()=="Power Armour"){
				if (brothers>-5) then brothers=0;
				if (slow>0) then slow=13;
				armour_sprite=spr_aquila_colors;
				if (hood=-50) then hood=1;
			}else if (armour()=="MK8 Errant"){
				if (slow>0) then slow=13;
				if (brothers>-5) then brothers=0;
				armour_sprite=spr_errant_colors;
				if (hood=-50) then hood=4;
			}else if (armour()=="Tartaros"){
				armour_sprite=spr_tartaros2_colors;
				if (brothers>-5) then brothers=4;
				if (hood=-50) then hood=8;
				if (skull==1) then skull=3;
			}
            if (show_arm=="Terminator Armour"){
				armour_sprite=spr_terminator2_colors;
				if (brothers>-5) then brothers=5;
				if (hood=-50) then hood=9;
				if (skull==1) then skull=2;
			}else if (show_arm=="Artificer Armour"){
				if (slow>0) then slow=13;
				if (brothers>-5) then brothers=1;
				armour_sprite=spr_artificer_colors;
				if (hood=-50) then hood=2;
			}else if (show_arm=="Dreadnought") then armour_sprite=spr_dread_colors;
        
            if (armour_sprite=spr_weapon_blank) and (armour()!=""){
                if (string_count("Power Armour",armour())>0){
					if (slow>0) then slow=13;
					if (brothers>-5) then brothers=0;
					armour_sprite=spr_aquila_colors;
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
					armour_sprite=spr_terminator2_colors;
					if (hood=-50) then hood=9;
					if (skull==1) then skull=2;
				}
                if (string_count("Dread",armour())>0) then armour_sprite=spr_dread_colors;
            }
        
            // Draw the fixed upper arms for Terminators and Tartaros
            if (base_sprite=1){
                if (fix_left>0) then draw_sprite(spr_termi_wep_fix,0,xx+x_draw,yy+y_draw);
                if (fix_right>0){
                    if (specialist_colours<=1) then draw_sprite(spr_termi_wep_fix,2,xx+x_draw,yy+y_draw);
                    if (specialist_colours>=2) then draw_sprite(spr_termi_wep_fix,3,xx+x_draw,yy+y_draw);
                }
            }else if (base_sprite=2){
                if (fix_left>0) then draw_sprite(spr_tartaros_wep_fix,0,xx+x_draw,yy+y_draw);
                if (fix_right>0){
                    if (specialist_colours<=1) then draw_sprite(spr_tartaros_wep_fix,2,xx+x_draw,yy+y_draw);
                    if (specialist_colours>=2) then draw_sprite(spr_tartaros_wep_fix,3,xx+x_draw,yy+y_draw);
                }
            }
        
            // Draw the lights
            if (ui_specialist=3) and (armour()!=""){
                draw_sprite(spr_gear_apoth,0,xx+x_draw,yy+y_draw);
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
        
            if (armour()=="" || armour()=="None" || armour()=="(None)"){            
                if (ui_specialist==111) and (global.chapter_name=="Doom Benefactors") then skin=6;
            
                draw_sprite(spr_marine_base,skin,xx+x_draw,yy+y_draw);
            
                if (skin!=6) then draw_sprite(spr_clothing_colors,clothing_style,xx+x_draw,yy+y_draw);
            } else {
                if (braz=1) and (blandify=0){
                    if (base_sprite==0) then draw_sprite(spr_pack_brazier,0,xx+x_draw,yy+y_draw);
                    if (base_sprite>0) then draw_sprite(spr_pack_brazier,1,xx+x_draw-2,yy+y_draw);
                }                             
                 // Draw the backpack
                if (base_sprite<5){
                    if (ui_back){
                        if (specialist_colours==0) then draw_sprite(armour_sprite,10,xx+x_draw,yy+y_draw);
                        if (specialist_colours==1) then draw_sprite(armour_sprite,11,xx+x_draw,yy+y_draw);
                        if (specialist_colours>=2) then draw_sprite(armour_sprite,12,xx+x_draw,yy+y_draw);
                    }else{
                        if (jump==1){
                            if (specialist_colours==0) then draw_sprite(spr_pack_jump,0,xx+x_draw,yy+y_draw);
                            if (specialist_colours==1) then draw_sprite(spr_pack_jump,1,xx+x_draw,yy+y_draw);
                            if (specialist_colours>=2) then draw_sprite(spr_pack_jump,2,xx+x_draw,yy+y_draw);
                        }
                        if (dev==1){
                            if (specialist_colours==0) then draw_sprite(spr_pack_devastator,0,xx+x_draw,yy+y_draw);
                            if (specialist_colours==1) then draw_sprite(spr_pack_devastator,1,xx+x_draw,yy+y_draw);
                            if (specialist_colours>=2) then draw_sprite(spr_pack_devastator,2,xx+x_draw,yy+y_draw);
                        }
                    }  
                }                
                var specific_helm = false;
                var helm_draw=[0,0];
                if (armour()=="Scout Armour"){
                    draw_sprite(spr_marine_base,skin,xx+x_draw,yy+y_draw);
                    draw_sprite(spr_marine_base,5,xx+x_draw,yy+y_draw);// Kind of crops the 'skin tone' pixels below the scout ones
                    draw_sprite(armour_sprite,specialist_colours,xx+x_draw,yy+y_draw);
                    draw_sprite(spr_facial_colors,clothing_style,xx+x_draw,yy+y_draw);
                }else if (armour()=="MK3 Iron Armour"){
                    specific_armour_sprite = spr_iron2_colors;
                } else if (armour()=="MK4 Maximus"){
                    specific_armour_sprite = spr_maximus_colors;
                } else if (armour()=="MK5 Heresy"){
                    specific_armour_sprite = spr_heresy_colors;
                    if (global.chapter_name=="Dark Angels" || obj_ini.progenitor==1){specific_helm = spr_da_mk5_helm;}
                    else if (global.chapter_name=="White Scars" || obj_ini.progenitor==2){specific_helm = spr_ws_mk5_helm;}
                    else if (global.chapter_name=="Space Wolves" || obj_ini.progenitor==3){specific_helm = spr_sw_mk5_helm;}
                    else if (global.chapter_name=="Imperial Fists" || obj_ini.progenitor==4){specific_helm = spr_if_mk5_helm;}
                    else if (global.chapter_name=="Blood Angels" || obj_ini.progenitor=5){specific_helm = spr_ba_mk5_helm;}
                    else if (global.chapter_name=="Iron Hands" || obj_ini.progenitor==6){specific_helm = spr_ih_mk5_helm;}
                    else if (global.chapter_name=="Ultramarines" || obj_ini.progenitor==7){specific_helm = spr_um_mk5_helm;}
                    else if (global.chapter_name=="Salamanders" || obj_ini.progenitor==8){specific_helm = spr_sal_mk5_helm;}
                    else if (global.chapter_name=="Raven Guard" || obj_ini.progenitor==9)  {specific_helm = spr_rg_mk5_helm;}
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

                } else if (armour()=="MK7 Aquila" || show_arm="Power Armour"){
                    specific_armour_sprite = spr_aquila_colors;
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
                    specific_armour_sprite = spr_errant_colors;
                } else if (show_arm="Artificer Armour"){
                    specific_armour_sprite = spr_artificer_colors;
                } else if (base_sprite=2){
                    specific_armour_sprite = spr_tartaros2_colors;
                } else if (base_sprite=1){
                    specific_armour_sprite = spr_terminator2_colors;
                }
                var armour_bypass = false;
                var armour_draw =[];
                if (base_sprite<= 0 && ui_specialist==5){
                    if (array_contains(traits, "tinkerer")){
                        specific_armour_sprite="none";
                        armour_draw=[spr_techmarine_core,0];
                        arm=0;
                        armour_bypass=true;
                    }
                }                
                if (arm>0){
                    if (arm<10){
                        draw_sprite(spr_pack_arm,arm,xx+x_draw,yy+y_draw)
                    } else if (arm>=10) then draw_sprite(spr_pack_arms,arm-10,xx+x_draw,yy+y_draw);                    
                }                 
                if (specific_armour_sprite != "none"){
                    // This draws the arms
                    if (show_arm!="Dreadnought"){
                        if (ui_arm[1]){
                            if (struct_exists(body[$ "right_arm"],"bionic") && base_sprite<=0){
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
                                if (struct_exists(body[$ "left_arm"],"bionic") && base_sprite<=0){
                                        if (body[$ "left_arm"][$ "bionic"].variant == 0){
                                            draw_sprite(spr_bionics_arm,1,xx+x_draw,yy+y_draw-4);
                                        } else{
                                            draw_sprite(spr_bionics_arm_2,0,xx+x_draw-8,yy+y_draw-10);
                                        }
                                }else {
                                    draw_sprite(armour_sprite,8,xx+x_draw,yy+y_draw);
                                }
                            }else if(specialist_colours>=2){
                               if (struct_exists(body[$ "left_arm"],"bionic") && base_sprite<=0){
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
                    if (specific_armour_sprite!="none")  and (!armour_bypass){                
                        if (ttrim==0) and (specialist_colours<=1) then draw_sprite(specific_armour_sprite,4,xx+x_draw,yy+y_draw);
                        if (ttrim==0) and (specialist_colours>=2) then draw_sprite(specific_armour_sprite,5,xx+x_draw,yy+y_draw);
                    } else{
                        draw_sprite(armour_draw[0], armour_draw[1],xx+x_draw,yy+y_draw);
                    }
                }
                if (base_sprite=5){
                    draw_sprite(spr_dreadnought_chasis_colors,specialist_colours,xx+x_draw,yy+y_draw);
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
                    if (base_sprite=2) then draw_sprite(spr_gear_apoth,1,xx+x_draw-2,yy+y_draw-3);// was y_draw-4 with old tartar
                    if (base_sprite=1) then draw_sprite(spr_gear_apoth,1,xx+x_draw-4,yy+y_draw-2);
                    if (base_sprite!=1) and (base_sprite!=2) then draw_sprite(spr_gear_apoth,1,xx+x_draw,yy+y_draw);
                }
            
                // Hood
                if (hood>0){
                    var yep=0;
                    if (array_contains(obj_ini.adv,"Daemon Binders") && blandify==0 && hood<7){
                        if (ttrim=1) then draw_sprite(spr_gear_hood2,0,xx+x_draw-2,yy+y_draw-11);
                        if (ttrim==0) then draw_sprite(spr_gear_hood2,1,xx+x_draw-2,yy+y_draw-11);
                    } else {
                        if (obj_ini.main_color=obj_ini.secondary_color) then draw_sprite(spr_gear_hood1,hood,xx+x_draw,yy+y_draw);
                        if (obj_ini.main_color!=obj_ini.secondary_color) then draw_sprite(spr_gear_hood3,hood,xx+x_draw,yy+y_draw);
                    }
                    draw_sprite(spr_psy_hood,2,xx+x_draw,yy+y_draw); 
                } else if (halo=1){ // Draw the Iron Halo
                    if (base_sprite<1) and (ui_specialist=14) and ((obj_ini.progenitor=5 || global.chapter_name="Blood Angels")){
                        draw_sprite(spr_gear_halo,0,xx+x_draw,yy+y_draw);
                    }
                }

                //Chaplain head and Terminator version
                if (skull>0) and (ui_specialist=1){
                    if (armour()!="Terminator"){
                      if (base_sprite==2 || base_sprite==1) then draw_sprite(spr_terminator_chap,1,xx+x_draw-2,yy+y_draw-11);
                    }
                    shader_reset();
                    if (base_sprite!=2 && base_sprite!=1) then draw_sprite(spr_chaplain_skull_helm,0,xx+x_draw,yy+y_draw);
                    if (base_sprite==2 || base_sprite==1) draw_sprite(spr_chaplain_skull_helm,0,xx+x_draw,yy+y_draw);
                    shader_set(sReplaceColor);
                }
            }
            //purity seals/decorations
            if (base_sprite==0){
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
			// bionics
			
			var eye_move = 0;
			for (var part = 0; part<array_length(global.body_parts);part++){
				if (struct_exists(body[$ global.body_parts[part]], "bionic")){
					if (base_sprite<=0){
                        if (armour() == "MK3 Iron Armour"){
                           eye_move = 3;
                        }
                        var body_part = global.body_parts[part];
                        var bionic = body[$ body_part][$"bionic"];
                        switch(body_part){
                            case "left_eye":
                                 if (bionic.variant == 0){
                                    if (armour() == "MK3 Iron Armour"){
                                        draw_sprite(spr_bionics_eye,0,xx+x_draw-2+eye_move,yy+y_draw);
                                    } else{
                                        draw_sprite(spr_bionics_eye,0,xx+x_draw-4+eye_move,yy+y_draw-4);
                                    }
                                } else if(bionic.variant == 1){
                                     draw_sprite(spr_bionic_eye_2,0,xx+x_draw+eye_move,yy+y_draw);
                                }else if(bionic.variant == 2){
                                     draw_sprite(spr_bionic_eye_2,2,xx+x_draw+eye_move,yy+y_draw);
                                }
                                break;
                                
                            case "right_eye":
                                if (bionic.variant ==0){
                                    if (armour() == "MK3 Iron Armour"){
                                        draw_sprite(spr_bionics_eye,1,xx+x_draw-4+eye_move,yy+y_draw);
                                    } else{
                                        draw_sprite(spr_bionics_eye,1,xx+x_draw-4+eye_move,yy+y_draw-4);
                                    }
                                }else if(bionic.variant == 1){
                                     draw_sprite(spr_bionic_eye_2,1,xx+x_draw+eye_move,yy+y_draw);
                                }else if(bionic.variant == 2){
                                     draw_sprite(spr_bionic_eye_2,3,xx+x_draw+eye_move,yy+y_draw);
                                }
                                break;

                            case  "left_leg":
                                var sprite_num=3;
                                 if (specialist_colours>=2){
                                    sprite_num=4;
                                 }                                
                                draw_sprite(spr_bionics_leg_2,sprite_num,xx+x_draw+3,yy+y_draw)
                                break;

                            case "right_leg":
                                draw_sprite(spr_bionics_leg_2,0,xx+x_draw-3,yy+y_draw)
                                break;
                        }
					}
				}
			}
        
            // Honor Guard Helm
            if (hood==0) and (base_sprite<1) and (armour()!="") and (ui_specialist==14){
                var helm_ii,o,yep;
            	helm_ii=0;
                if (obj_ini.progenitor=7 || global.chapter_name="Ultramarines") then helm_ii=1;
                if (obj_ini.progenitor=5 || global.chapter_name="Blood Angels") then helm_ii=5;

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
            if (base_sprite<1){
                var robes_mod=[0,0];
                if (array_contains(["MK7 Aquila","Power Armour","MK4 Maximus","Mk5 Heresy", "Mk3 Iron Armour"], armour())){
                    robes_mod[1]=-8;
                    robes_mod[2]=-1;
                } else if (armour()=="MK6 Corvus"){
                     robes_mod[0]=-1
                     robes_mod[1]=-1
                }

               if (struct_exists(body[$ "head"],"hood")){
                    draw_sprite(spr_marine_cloth_hood,0,xx+x_draw+robes_mod[0],yy+y_draw+robes_mod[1]);     
               }
                if (struct_exists(body[$ "torso"],"robes")){
                    draw_sprite(spr_marine_robes,body[$ "torso"][$ "robes"],xx+x_draw+robes_mod[0],yy+y_draw+robes_mod[1]);     
               }              
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
            if (base_sprite==1){
                if (fix_left>0) and (fix_left!=2) and (fix_left!=4) and (fix_left<8) then draw_sprite(spr_termi_wep_fix,4,xx+x_draw,yy+y_draw);
                if (fix_right>0) and (fix_right!=2) and (fix_right!=4) and (fix_right<8){
                    if (specialist_colours<=1) then draw_sprite(spr_termi_wep_fix,6,xx+x_draw,yy+y_draw);
                    if (specialist_colours>=2) then draw_sprite(spr_termi_wep_fix,7,xx+x_draw,yy+y_draw);
                }
            }else if (base_sprite==2){
                if (fix_left>0) and (fix_left!=2) and (fix_left!=4) and (fix_left<8) then draw_sprite(spr_tartaros_wep_fix,4,xx+x_draw,yy+y_draw);
                if (fix_right>0) and (fix_right!=2) and (fix_right!=4) and (fix_right<8){
                    if (specialist_colours<=1) then draw_sprite(spr_tartaros_wep_fix,6,xx+x_draw,yy+y_draw);
                    if (specialist_colours>=2) then draw_sprite(spr_tartaros_wep_fix,7,xx+x_draw,yy+y_draw);
                }
            }
            // if (braz=1) then draw_sprite(spr_pack_brazier,1,xx+x_draw,yy+y_draw);
			
            shader_reset();
        }else{
            draw_set_color(c_gray);
            draw_text(xx+x_draw,yy+y_draw,string_hash_to_newline("Color swap shader#did not compile"));
        }
        // if (race()!="1"){draw_set_color(38144);draw_rectangle(xx+x_draw,yy+y_draw,xx+x_draw+166,yy+y_draw+231,0);}
    }

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