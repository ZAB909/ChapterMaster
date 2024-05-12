enum ShaderType {
    Body,
    Helmet,
    LeftPauldron,
    Lens,
    Trim,
    RightPauldron,
    Weapon
}

function unit_image(unit_surface) constructor{
    u_surface = unit_surface;
    static draw = function (xx, yy, _background=false){
        if (_background){
            draw_rectangle_color_simple(xx-1,yy-1,xx+1+166,yy+271+1,0,c_black);
            draw_rectangle_color_simple(xx-1,yy-1,xx+166+1,yy+271+1,1,c_gray);
            draw_rectangle_color_simple(xx-2,yy-2,xx+166+2,yy+2+271,1,c_black);
            draw_rectangle_color_simple(xx-3,yy-3,xx+166+3,yy+3+271,1,c_gray);
        }      
        if (surface_exists(u_surface)){
            draw_surface(u_surface, xx-200,yy-90);
        }
    }

    static draw_part = function (xx, yy,left,top,width,height, _background=false){
        if (_background){
            draw_rectangle_color_simple(xx-1+left,yy-1+top,xx+1+width,yy+height+1,0,c_black);
            draw_rectangle_color_simple(xx-1+left,yy-1+top,xx+width+1,yy+height+1,1,c_gray);
            draw_rectangle_color_simple(xx-2+left,yy-2+top,xx+width+2,yy+2+height,1,c_black);
            draw_rectangle_color_simple(xx-3+left,yy-3+top,xx+width+3,yy+3+height,1,c_gray);
        }     
        if (surface_exists(u_surface)){
            draw_surface_part(u_surface, left+200, top+90, width,height, xx,yy);
        }       
    }
}

//TODO this is a laxy fix and can be written better
function set_shader_color(shaderType, colorIndex) {
    var findShader, setShader;
    if (instance_exists(obj_controller)){
        with (obj_controller){
            switch (shaderType) {
                case ShaderType.Body:
                    setShader = colour_to_set1;
                    break;
                case ShaderType.Helmet:
                    setShader = colour_to_set2;
                    break;
                case ShaderType.LeftPauldron:
                    setShader = colour_to_set3;
                    break;
                case ShaderType.Lens:
                    setShader = colour_to_set4;
                    break;
                case ShaderType.Trim:
                    setShader = colour_to_set5;
                    break;
                case ShaderType.RightPauldron:
                    setShader = colour_to_set6;
                    break;
                case ShaderType.Weapon:
                    setShader = colour_to_set7;
                    break;
            }
            shader_set_uniform_f(setShader, col_r[colorIndex]/255, col_g[colorIndex]/255, col_b[colorIndex]/255);
        }
    } else if (instance_exists(obj_creation)){
        with (obj_controller){
            switch (shaderType) {
                case ShaderType.Body:
                    setShader = colour_to_set1;
                    break;
                case ShaderType.Helmet:
                    setShader = colour_to_set2;
                    break;
                case ShaderType.LeftPauldron:
                    setShader = colour_to_set3;
                    break;
                case ShaderType.Lens:
                    setShader = colour_to_set4;
                    break;
                case ShaderType.Trim:
                    setShader = colour_to_set5;
                    break;
                case ShaderType.RightPauldron:
                    setShader = colour_to_set6;
                    break;
                case ShaderType.Weapon:
                    setShader = colour_to_set7;
                    break;
            }
            shader_set_uniform_f(setShader, col_r[colorIndex]/255, col_g[colorIndex]/255, col_b[colorIndex]/255);
        }        
    }
}
// Define armour types
enum ArmourType {
    Normal,
    Indomitus,
    Tartaros,
    Dreadnought,
    None
}

    // Define backpack types
    enum BackType {
        None,
        Dev,
        Jump,
    }
function make_colour_from_array(col_array){
    return make_color_rgb(col_array[0] *255, col_array[1] * 255, col_array[2] * 255);
}

function set_shader_to_base_values(){
    with (obj_controller){
            shader_set_uniform_f_array(colour_to_find1, body_colour_find );
            shader_set_uniform_f_array(colour_to_set1, body_colour_replace );
            shader_set_uniform_f_array(colour_to_find2, secondary_colour_find );       
            shader_set_uniform_f_array(colour_to_set2, secondary_colour_replace );
            shader_set_uniform_f_array(colour_to_find3, pauldron_colour_find );       
            shader_set_uniform_f_array(colour_to_set3, pauldron_colour_replace );
            shader_set_uniform_f_array(colour_to_find4, lens_colour_find );       
            shader_set_uniform_f_array(colour_to_set4, lens_colour_replace );
            shader_set_uniform_f_array(colour_to_find5, trim_colour_find );
            shader_set_uniform_f_array(colour_to_set5, trim_colour_replace );
            shader_set_uniform_f_array(colour_to_find6, pauldron2_colour_find );
            shader_set_uniform_f_array(colour_to_set6, pauldron2_colour_replace );
            shader_set_uniform_f_array(colour_to_find7, weapon_colour_find );
            shader_set_uniform_f_array(colour_to_set7, weapon_colour_replace );
        }
        shader_set_uniform_i(shader_get_uniform(sReplaceColor, "u_blend_modes"), 0);   
}

function set_shader_array(shader_array){
    for (var i=0;i<array_length(shader_array);i++){
        if (shader_array[i]>-1){
            set_shader_color(i, shader_array[i]);
        }
    }
}
function scr_draw_unit_image(_background=false){
    var x_surface_offset = min(200);
    var y_surface_offset = min(110);
    var unit_surface = surface_create(600, 600);
    surface_set_target(unit_surface);
    draw_clear_alpha(c_black, 0);//RESET surface
    draw_set_font(fnt_40k_14b);
    draw_set_color(c_gray);
	var xx=__view_get( e__VW.XView, 0 )+0, yy=__view_get( e__VW.YView, 0 )+0, bb="", img=0;
    var blandify = obj_controller.blandify;
    var draw_sequence = [];
    if (name_role()!="") and (base_group=="astartes"){
        ui_weapon[1]=spr_weapon_blank;
        ui_weapon[2]=spr_weapon_blank;
        ui_arm[1]=1;
        ui_arm[2]=1;
        ui_hand[1]=0;
        ui_hand[2]=0;
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
        ui_back=true;
        ui_force_both=false;
        ui_specialist=0;
        ttrim=0;
        var armour_bypass = false;
        var hide_bionics = false;
        var robe_bypass = false;
        var halo_bypass = false;
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
        // Dark Angels
        if (global.chapter_name=="Dark Angels"){
            // Deathwing
            if ((company == 1 && ui_specialist == 0) || role()==obj_ini.role[100,2]) then ui_coloring="deathwing";
            // Ravenwing
            else if (company == 2 && ui_specialist == 0) {
                ui_coloring="ravenwing";
            }
        }
        // Blood Angels gold
        if ((ui_specialist==14 || role()=="Chapter Master")) and (global.chapter_name=="Blood Angels") then ui_coloring="gold";
        // Sets up the description for the equipement of current marine            
    
        var armour_type=ArmourType.Normal,armour_sprite=spr_weapon_blank;
        var back_type=BackType.None,hood=0,skull=0,arm=0,braz=0,slow=0,brothers=-5,body_part;

        var skin_color=obj_ini.skin_color;

        var unit_wep1=string_replace(weapon_one(),"Arti. ","");
        var unit_wep2=string_replace(weapon_two(),"Arti. ","");
        var unit_armour=string_replace(armour(),"Arti. ","");
        var unit_gear=string_replace(gear(),"Arti. ","");
        var unit_back=string_replace(mobility_item(),"Arti. ","");

        if (ui_specialist=7 || ui_specialist=1 || ui_specialist=111){
            if (array_contains(obj_ini.adv, "Reverent Guardians")){
                braz=1
            }
        }
        if (unit_gear="Psychic Hood"){
            hood=-50;
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
    
        // if (_armour_type!=ArType.Norm) then ui_back=false;

        if (unit_back=="Jump Pack"){
			ui_back=false;
			back_type=BackType.Jump;
		}else if (unit_back=="Heavy Weapons Pack"){
            ui_back=false;
			back_type=BackType.Dev;
        }

        switch(unit_armour){
            case "Terminator Armour":
                ui_back=false;
                armour_type = ArmourType.Indomitus;
                break;
            case "Tartaros":
                ui_back=false;
                armour_type = ArmourType.Tartaros;
                break;
            case "Dreadnought":
                ui_back=false;
                armour_type = ArmourType.Dreadnought;
                break;
            case "(None)":
            case "":
            case "None":
                armour_type = ArmourType.None;
                break;
            }
		
        if (armour_type!=ArmourType.Normal) then ui_back=false;
        
        if (armour_type!=ArmourType.Dreadnought && armour_type!=ArmourType.None){
            if (weapon_one()!=""){
                scr_ui_display_weapons(1,armour_type,weapon_one());
            }
            
            if (weapon_two()!="") and (ui_force_both==false){
                scr_ui_display_weapons(2,armour_type,weapon_two());
            }
        }
    
        if (ui_twoh[1]=true) and (ui_arm[1]==0) then ui_arm[2] = 0;
        if (ui_twoh[2]=true) and (ui_arm[2]==0) then ui_arm[1] = 0;

        if(shader_is_compiled(sReplaceColor)){
            shader_set(sReplaceColor);
         
            set_shader_to_base_values();
                  
            //TODO make some sort of reusable structure to handle this sort of colour logic
            // also not ideal way of creating colour variation but it's a first pass
            var cloth_variation=body.torso.cloth.variation;
            var cloth_col = [201.0/255.0, 178.0/255.0, 147.0/255.0];
            with (obj_controller){
                if (cloth_variation < 2){
                    cloth_col = body_colour_replace;
                } else if (cloth_variation < 4){
                    cloth_col = secondary_colour_replace;
                } else if (cloth_variation < 6){
                    cloth_col = pauldron_colour_replace;
                } else if (cloth_variation < 8){
                    cloth_col = trim_colour_replace;
                }else if (cloth_variation < 10){
                    cloth_col = pauldron2_colour_replace;
                }else if (cloth_variation < 12){
                    cloth_col = weapon_colour_replace;
                }
                shader_set_uniform_f_array(shader_get_uniform(sReplaceColor, "robes_colour_replace"), cloth_col);
            }
            // Special specialist stuff here
            /*
            ui_specialist=0;
            if (role()=obj_ini.role[100,14]) then ui_specialist=1;// Chaplain
            if (role()=obj_ini.role[100,15]) then ui_specialist=3;// Apothecary
            if (role()=obj_ini.role[100,15]) and ((global.chapter_name="Blood Angels" || obj_ini.progenitor==5)) then ui_specialist=4;// Sanguinary
            if (role()=obj_ini.role[100,16]) then ui_specialist=5;// Techmarine
            if (role()=obj_ini.role[100,17]) then ui_specialist=7;// Librarian
            */
            var shader_array_set = array_create(8, -1);
        
            ttrim=obj_controller.trim;
			specialist_colours=obj_ini.col_special;
			
			// Chaplain
            if (ui_specialist=1 || ((ui_specialist=3) and (global.chapter_name="Space Wolves"))){
                shader_array_set[ShaderType.Body] = Colors.Black;
                shader_array_set[ShaderType.Helmet] = Colors.Black;
                shader_array_set[ShaderType.Lens] = Colors.Red;
                shader_array_set[ShaderType.Trim] = Colors.Dark_Gold;
                shader_array_set[ShaderType.RightPauldron] = Colors.Black;
                ttrim=1;
                specialist_colours=0;
                if (global.chapter_name == "Dark Angels") {
                    shader_array_set[ShaderType.Trim] = Colors.Copper;
                    if (role() == "Master of Sanctity") {
                        shader_array_set[ShaderType.Helmet] = Colors.Caliban_Green;
                        ttrim=0;
                    }
                }
            }
			
			// Apothecary
            else if (ui_specialist=3) and (global.chapter_name!="Space Wolves"){
                shader_array_set[ShaderType.Body] = Colors.White;
                shader_array_set[ShaderType.Helmet] = Colors.White;
                shader_array_set[ShaderType.Lens] = Colors.Red;
                shader_array_set[ShaderType.RightPauldron] = Colors.White;
                ttrim=0;
                specialist_colours=0;
            }
			
			// Techmarine
            else if (ui_specialist=5){
                shader_array_set[ShaderType.Body] = Colors.Red;
                shader_array_set[ShaderType.Helmet] = Colors.Red;
                shader_array_set[ShaderType.Lens] = Colors.Lime;
                shader_array_set[ShaderType.Trim] = Colors.Silver;
                shader_array_set[ShaderType.RightPauldron] = Colors.Red;
                ttrim=1;
                specialist_colours=0;
            }

			// Librarian
            else if (ui_specialist=7){
                shader_array_set[ShaderType.Body] = Colors.Ultramarine;
                shader_array_set[ShaderType.Helmet] = Colors.Ultramarine;
                shader_array_set[ShaderType.Lens] = Colors.Cyan;
                shader_array_set[ShaderType.Trim] = Colors.Gold;
                shader_array_set[ShaderType.RightPauldron] = Colors.Ultramarine;
                ttrim=1;
                specialist_colours=0;
            }
			
			// Death Company
            else if (ui_specialist=15){
                shader_array_set[ShaderType.Body] = Colors.Black;
                shader_array_set[ShaderType.Helmet] = Colors.Black;
                shader_array_set[ShaderType.LeftPauldron] = Colors.Black;
                shader_array_set[ShaderType.Lens] = Colors.Red;
                shader_array_set[ShaderType.Trim] = Colors.Black;
                shader_array_set[ShaderType.RightPauldron] = Colors.Black;
                shader_array_set[ShaderType.Weapon] = Colors.Dark_Red;
                ttrim=0;
                specialist_colours=0;
            }
			
			// Deathwing
            if (ui_coloring == "deathwing"){
                shader_array_set[ShaderType.Body] = Colors.Deathwing;
                shader_array_set[ShaderType.LeftPauldron] = Colors.Deathwing;
                shader_array_set[ShaderType.RightPauldron] = Colors.Deathwing;
                if (role() != obj_ini.role[100][2]){
                    shader_array_set[ShaderType.Trim] = Colors.Light_Caliban_Green;
                    shader_array_set[ShaderType.Helmet] = Colors.Deathwing;
                }
                ttrim=0;
                specialist_colours=0;
            }
            
			// Ravenwing
            if (ui_coloring="ravenwing"){
                shader_array_set[ShaderType.Body] = Colors.Black;
                shader_array_set[ShaderType.LeftPauldron] = Colors.Black;
                shader_array_set[ShaderType.RightPauldron] = Colors.Black;
                shader_array_set[ShaderType.Helmet] = Colors.Black;
                ttrim=0;
                specialist_colours=0;
            }

			// Dark Angels Captains
            if (global.chapter_name == "Dark Angels" && role() == obj_ini.role[100][5] && ui_coloring != "deathwing"){
                shader_array_set[ShaderType.RightPauldron] = Colors.Dark_Red;
                shader_array_set[ShaderType.Helmet] = Colors.Deathwing;
                ttrim=0;
                specialist_colours=0;
            }

			// Blood Angels
            else if (ui_coloring="gold"){
                shader_array_set[ShaderType.Body] = Colors.Gold;
                shader_array_set[ShaderType.Helmet] = Colors.Gold;
                shader_array_set[ShaderType.LeftPauldron] = Colors.Gold;
                shader_array_set[ShaderType.Trim] = Colors.Gold;
                ttrim=0;
                specialist_colours=0;
            }
            //We can return to the custom shader values at any time during draw doing this 
            set_shader_array(shader_array_set);
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
            // draw_sprite(spr_marine_base,img,x_surface_offset,y_surface_offset);
            var robe_bypass = false;
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
            if (unit_armour=="Terminator Armour"){
				armour_sprite=spr_terminator3_colors;
				if (brothers>-5) then brothers=5;
				if (hood=-50) then hood=9;
				if (skull==1) then skull=2;
			}else if (unit_armour=="Artificer Armour"){
				if (slow>0) then slow=13;
				if (brothers>-5) then brothers=1;
				armour_sprite=spr_artificer_colors;
				if (hood=-50) then hood=2;
			}else if (unit_armour=="Dreadnought") then armour_sprite=spr_dread_colors;
        
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
        
            // Draw the lights
            if (ui_specialist=3) and (armour()!=""){
                if (armour_type==ArmourType.Indomitus) then draw_sprite(spr_gear_apoth,0,x_surface_offset,y_surface_offset-22); // for terminators
                else draw_sprite(spr_gear_apoth,0,x_surface_offset,y_surface_offset-6); // for normal power armour
            }
            
            // Weapons for below arms
            if (ui_weapon[1]!=0) and (sprite_exists(ui_weapon[1])) and (ui_above[1]==false){
                if (ui_twoh[1]==false) and (ui_twoh[2]==false) then draw_sprite(ui_weapon[1],0,ui_xmod[1],ui_ymod[1]);
                if (ui_twoh[1]==true){
                    if (specialist_colours<=1) then draw_sprite(ui_weapon[1],0,ui_xmod[1],ui_ymod[1]);
                    if (specialist_colours>=2) then draw_sprite(ui_weapon[1],3,ui_xmod[1],ui_ymod[1]);
                    if (ui_force_both==true){
                        if (specialist_colours<=1) then draw_sprite(ui_weapon[1],0,ui_xmod[1],ui_ymod[1]);
                        if (specialist_colours>=2) then draw_sprite(ui_weapon[1],1,ui_xmod[1],ui_ymod[1]);
                    }
                }
            }
            if (ui_weapon[2]!=0) and (ui_above[2]==false) and (sprite_exists(ui_weapon[2])) and ((ui_twoh[1]==false || ui_force_both==true)){
                if (ui_spec[2]==false) then draw_sprite(ui_weapon[2],1,x_surface_offset+ui_xmod[2],y_surface_offset+ui_ymod[2]);
                if (ui_spec[2]==true){
                    if (specialist_colours<=1) then draw_sprite(ui_weapon[2],2,x_surface_offset+ui_xmod[2],y_surface_offset+ui_ymod[2]);
                    if (specialist_colours>=2) then draw_sprite(ui_weapon[2],3,x_surface_offset+ui_xmod[2],y_surface_offset+ui_ymod[2]);
                }
            }
        
            if (armour_type==ArmourType.None){            
                if (ui_specialist==111 && global.chapter_name=="Doom Benefactors") then skin_color=6;
            
                draw_sprite(spr_marine_base,skin_color,x_surface_offset,y_surface_offset);
            
                if (skin_color!=6) then draw_sprite(spr_clothing_colors,clothing_style,x_surface_offset,y_surface_offset);
            } else {
                if (braz=1) and (blandify=0){
                    if (armour_type==ArmourType.Normal) then draw_sprite(spr_pack_brazier,0,x_surface_offset,y_surface_offset);
                    if (armour_type!=ArmourType.Normal) then draw_sprite(spr_pack_brazier,1,0-2,0);
                }                             
                 // Draw the backpack
                if (armour_type!=ArmourType.Dreadnought){
                    if (ui_back){
                        if (global.chapter_name == "Dark Angels") {
                            if (role() == "Chapter Master") {
                                draw_sprite(spr_da_backpack,1,x_surface_offset,y_surface_offset);
                            } else if (role() == "Master of Sanctity") {
                                draw_sprite(spr_da_chaplain,1,x_surface_offset,y_surface_offset);
                            }
                        } else if (body.torso.backpack_variation>2){
                            if (specialist_colours==0) then draw_sprite(armour_sprite,10,x_surface_offset,y_surface_offset);
                            if (specialist_colours==1) then draw_sprite(armour_sprite,11,x_surface_offset,y_surface_offset);
                            if (specialist_colours>=2) then draw_sprite(armour_sprite,12,x_surface_offset,y_surface_offset);
                        } else {
                            if (global.chapter_name=="Dark Angels" || obj_ini.progenitor==1){
                                if array_contains(["MK5 Heresy", "MK6 Corvus","MK7 Aquila", "MK8 Errant", "Artificer Armour"], armour()){
                                    draw_sprite(spr_da_backpack,0,x_surface_offset,y_surface_offset);
                                } else {
                                    if (specialist_colours==0) then draw_sprite(armour_sprite,10,x_surface_offset,y_surface_offset);
                                    if (specialist_colours==1) then draw_sprite(armour_sprite,11,x_surface_offset,y_surface_offset);
                                    if (specialist_colours>=2) then draw_sprite(armour_sprite,12,x_surface_offset,y_surface_offset);
                                }
                            } else{
                                if (specialist_colours==0) then draw_sprite(armour_sprite,10,x_surface_offset,y_surface_offset);
                                if (specialist_colours==1) then draw_sprite(armour_sprite,11,x_surface_offset,y_surface_offset);
                                if (specialist_colours>=2) then draw_sprite(armour_sprite,12,x_surface_offset,y_surface_offset);
                            }
                        }
                    }else{
                        if (back_type==BackType.Jump){
                            if (specialist_colours==0) then draw_sprite(spr_pack_jump,0,x_surface_offset,y_surface_offset);
                            if (specialist_colours==1) then draw_sprite(spr_pack_jump,1,x_surface_offset,y_surface_offset);
                            if (specialist_colours>=2) then draw_sprite(spr_pack_jump,2,x_surface_offset,y_surface_offset);
                        }
                        if (back_type==BackType.Dev){
                            if (specialist_colours==0) then draw_sprite(spr_pack_devastator,0,x_surface_offset,y_surface_offset);
                            if (specialist_colours==1) then draw_sprite(spr_pack_devastator,1,x_surface_offset,y_surface_offset);
                            if (specialist_colours>=2) then draw_sprite(spr_pack_devastator,2,x_surface_offset,y_surface_offset);
                        }
                    }  
                }                
                var specific_helm = true;
                var helm_draw=[0,0];
                if (armour()=="Scout Armour"){
                    if (unit_is_sniper = true){
                        draw_sprite(spr_marine_head,skin_color,x_surface_offset,y_surface_offset);
                        draw_sprite(spr_scout_colors,11,x_surface_offset,y_surface_offset);// Scout Sniper Cloak
                    }
                    draw_sprite(armour_sprite,specialist_colours,x_surface_offset,y_surface_offset);
                    draw_sprite(spr_facial_colors,clothing_style,x_surface_offset,y_surface_offset);
                    specific_armour_sprite=armour_sprite;
                    armour_bypass=true;
                }else if (armour()=="MK3 Iron Armour"){
                    specific_armour_sprite = spr_mk3_colors;
                    if (global.chapter_name=="Dark Angels" || obj_ini.progenitor==1){
                        if (role()==obj_ini.role[100][Role.CAPTAIN]){
                            // specific_armour_sprite = spr_da_mk3;
                            armour_draw=[spr_da_mk3,0];
                            robe_bypass = true;
                            armour_bypass=true;
                        }
                    }
                } else if (armour()=="MK4 Maximus"){
                    specific_armour_sprite = spr_mk4_colors;
                    if (array_contains(["Company Champion",obj_ini.role[100][2],obj_ini.role[100][5]], role())){
                        /*if (global.chapter_name=="Ultramarines"){
                            armour_draw=[spr_ultra_honor_guard,body.torso.armour_choice];
                            armour_bypass=true;
                            draw_sprite(spr_ultra_honor_guard,2,x_surface_offset,y_surface_offset);
                        } else {
                            armour_draw=[spr_generic_honor_guard,body.torso.armour_choice];
                            armour_bypass=true;
                        }*/
                        if (global.chapter_name=="Dark Angels" || obj_ini.progenitor==1){
                            if (role()==obj_ini.role[100][Role.CAPTAIN]){
                                // specific_armour_sprite = spr_da_mk4;
                                armour_draw=[spr_da_mk4,0];
                                robe_bypass = true;
                                armour_bypass=true;
                            }
                        }                        
                   }        
                } else if (armour()=="MK5 Heresy"){
                    specific_armour_sprite = spr_mk5_colors;
                    //TODO sort this mess out streamline system somehow
                    if (global.chapter_name=="Dark Angels" || obj_ini.progenitor==1){
                        specific_helm = spr_generic_sgt_mk7;
                        if (role()==obj_ini.role[100][Role.CAPTAIN]){
                            // specific_armour_sprite = spr_da_mk5;
                            armour_draw=[spr_da_mk5,0];
                            robe_bypass = true;
                            armour_bypass=true;
                        }                        
                    }                   
                } else if (armour()=="MK6 Corvus"){
                    specific_armour_sprite = spr_beakie_colors;
                    if (global.chapter_name=="Dark Angels" || obj_ini.progenitor==1){
                        specific_helm = spr_generic_sgt_mk7;
                        if (role()==obj_ini.role[100][Role.CAPTAIN]){
                            // specific_armour_sprite = spr_da_mk6;
                            armour_draw=[spr_da_mk6,0];
                            robe_bypass = true;
                            armour_bypass=true;
                        }                      
                    }

                } else if (armour()=="MK7 Aquila" || unit_armour="Power Armour"){
                    specific_armour_sprite = spr_generic_sgt_mk7;
                    if (global.chapter_name=="Dark Angels" || obj_ini.progenitor==1){
                        specific_helm = spr_da_mk7_helm;
                        if (role()==obj_ini.role[100][Role.CAPTAIN]){
                            // specific_armour_sprite = spr_da_mk7;
                            armour_draw = [spr_da_mk7,0];
                            robe_bypass = true;
                            armour_bypass = true;
                        }                          
                    }
                } else if (armour()=="MK8 Errant"){
                    specific_armour_sprite = spr_mk8_colors;
                    if (global.chapter_name=="Dark Angels" || obj_ini.progenitor==1){
                        if (role()==obj_ini.role[100][Role.CAPTAIN]){
                            // specific_armour_sprite = spr_da_mk8;
                            armour_draw=[spr_da_mk8,0];
                            robe_bypass = true;
                            armour_bypass=true;
                        }                          
                    }                    
                } else if (unit_armour=="Artificer Armour"){
                    specific_armour_sprite = spr_artificer_colors;
                    if (array_contains(["Company Champion",obj_ini.role[100][2],obj_ini.role[100][5]], role())){
                        if (global.chapter_name=="Ultramarines"){
                            armour_draw=[spr_ultra_honor_guard,body.torso.armour_choice];
                            armour_bypass=true;
                            draw_sprite(spr_ultra_honor_guard,2,x_surface_offset,y_surface_offset);
                        } else {
                            armour_draw=[spr_generic_honor_guard,body.torso.armour_choice];
                            armour_bypass=true;
                        }
                    } 
                    if (global.chapter_name=="Blood Angels"){
                        if (role()=="Chapter Master"){
                            armour_bypass=true;
                            hide_bionics = true;
                            robe_bypass = true;
                            armour_draw=[spr_dante,0];
                            draw_sprite(spr_dante,1,x_surface_offset,y_surface_offset);
                        } else if (role()==obj_ini.role[100][2]){
                            armour_bypass=true;
                            hide_bionics = true;
                            robe_bypass = true;
                            armour_draw=[spr_sanguin_guard,0];
                            draw_sprite(spr_sanguin_guard,1,x_surface_offset,y_surface_offset);
                        }
                    } else if(global.chapter_name=="Dark Angels"){
                        if (role()=="Chapter Master"){
                            armour_bypass=true;
                            hide_bionics = true;
                            robe_bypass = true;
                            armour_draw=[spr_azreal,0];
                        }
                        if (role()=="Master of Sanctity"){
                            armour_bypass=true;
                            hide_bionics = true;
                            robe_bypass = true;
                            skull = 0;
                            armour_draw=[spr_da_chaplain,0];
                        }
                    }
                } else if (unit_armour="Tartaros"){
                    specific_armour_sprite = spr_tartaros2_colors;
                } else if (unit_armour="Terminator Armour"){
                    specific_armour_sprite = spr_terminator3_colors;
                    if(global.chapter_name == "Dark Angels"){
                        if (role() == obj_ini.role[100][2]){
                            armour_bypass=true;
                            armour_draw=[spr_da_term_honor,0];
                            hide_bionics = true;
                        }
                    }
                }

                if (armour_type==ArmourType.Normal){
                    if (ui_specialist==5 && armour_bypass==false){
                        if (array_contains(traits, "tinkerer")){
                            //specific_armour_sprite="none";
                            armour_sprite =spr_techmarine_core;
                            specific_armour_sprite = spr_techmarine_core;
                        }
                    }
                    if (arm>0){
                        draw_sprite(spr_servo_arms,0,x_surface_offset,y_surface_offset);
                        /*if (arm<10){
                            draw_sprite(spr_pack_arm,arm,x_surface_offset,y_surface_offset)
                        } else if (arm>=10) then draw_sprite(spr_pack_arms,arm-10,x_surface_offset,y_surface_offset);  */                  
                    }
                }

                if (unit_gear == "Iron Halo" && !halo_bypass) { // Draw the Iron Halo
                    var halo_color = 0;
                    var halo_type = 0; // 0,2,4...
                    var halo_offset_y = 0;
                    if (array_contains(["Raven Guard", "Dark Angels"], global.chapter_name)) {
                        halo_color = 1;
                    }
                    if (armour()=="Artificer Armour" && !armour_bypass){
                        halo_offset_y -= 14;
                    } else if (armour_type == ArmourType.Indomitus){
                        halo_type = 2;
                        halo_offset_y -= 20;
                    } else if (armour_type == ArmourType.Tartaros){
                        halo_type = 2;
                        halo_offset_y -= 2;
                    }
                    draw_sprite(spr_gear_halo,halo_type+halo_color,x_surface_offset,y_surface_offset+halo_offset_y);
                }

                // Draw arms
                if (armour_type == ArmourType.Normal){
                    if (ui_arm[1] > 0){
                        if (struct_exists(body[$ "right_arm"],"bionic") && armour_type==ArmourType.Normal && !hide_bionics){
                            if (body[$ "right_arm"][$ "bionic"].variant == 0){
                                draw_sprite(spr_bionics_arm,0,x_surface_offset,y_surface_offset);
                            }else{
                                draw_sprite(spr_bionics_arm_2,1,x_surface_offset,y_surface_offset);
                            }
                        } else{
                            draw_sprite(armour_sprite,6,x_surface_offset,y_surface_offset);
                        }
                    }
                    if (ui_arm[2] > 0){
                        if  (specialist_colours<=1){
                            if (struct_exists(body[$ "left_arm"],"bionic") && armour_type==ArmourType.Normal && !hide_bionics){
                                    if (body[$ "left_arm"][$ "bionic"].variant == 0){
                                        draw_sprite(spr_bionics_arm,1,x_surface_offset,y_surface_offset);
                                    } else{
                                        draw_sprite(spr_bionics_arm_2,0,x_surface_offset,y_surface_offset);
                                    }
                            }else {
                                draw_sprite(armour_sprite,8,x_surface_offset,y_surface_offset);
                            }
                        }else if(specialist_colours>=2){
                            if (struct_exists(body[$ "left_arm"],"bionic") && armour_type==ArmourType.Normal && !hide_bionics){
                                    if (body[$ "left_arm"][$ "bionic"].variant == 0){
                                        draw_sprite(spr_bionics_arm,3,x_surface_offset,y_surface_offset);
                                    } else{
                                        draw_sprite(spr_bionics_arm_2,2,x_surface_offset,y_surface_offset);
                                    }
                            }else {
                                draw_sprite(armour_sprite,9,x_surface_offset,y_surface_offset);
                            }                  
                        }   
                    }
                }   
            
                // Draw terminator arms
                if (armour_type == ArmourType.Tartaros || armour_type == ArmourType.Indomitus){
                    if ui_arm[1] == 1 {
                        draw_sprite(armour_sprite,6,x_surface_offset,y_surface_offset);
                    }
                    if ui_arm[1] == 2 {
                        if (armour_type == ArmourType.Tartaros){
                            draw_sprite(spr_tartaros_wep_fix,0,x_surface_offset,y_surface_offset);
                        }
                        else if (armour_type == ArmourType.Indomitus){
                            draw_sprite(spr_termi_wep_fix,0,x_surface_offset,y_surface_offset);
                        }
                    }
                    if ui_arm[2] == 1 {
                        if (specialist_colours <= 1){
                            draw_sprite(armour_sprite,8,x_surface_offset,y_surface_offset);
                        }
                        else if (specialist_colours >= 2){
                            draw_sprite(armour_sprite,9,x_surface_offset,y_surface_offset);
                        }
                    }
                    if ui_arm[2] == 2 {
                        if (armour_type == ArmourType.Tartaros){
                            if (specialist_colours <= 1){
                                draw_sprite(spr_tartaros_wep_fix,2,x_surface_offset,y_surface_offset);
                            }
                            else if (specialist_colours >= 2){
                                draw_sprite(spr_tartaros_wep_fix,3,x_surface_offset,y_surface_offset);
                            }
                        }
                        else if (armour_type == ArmourType.Indomitus){
                            if (specialist_colours <= 1){
                                draw_sprite(spr_termi_wep_fix,2,x_surface_offset,y_surface_offset);
                            }
                            else if (specialist_colours >= 2){
                                draw_sprite(spr_termi_wep_fix,3,x_surface_offset,y_surface_offset);
                            }
                        }
                    }
                }

                // Draw torso
                if (!armour_bypass){
                    draw_sprite(armour_sprite,specialist_colours,x_surface_offset,y_surface_offset);
                    // Draw additional torso decals
                    if (armour()=="MK7 Aquila"){
                        if (struct_exists(body.torso, "variation")){
                            if (body.torso.variation%2 == 1){
                                draw_sprite(mk7_chest_variants,0,x_surface_offset,y_surface_offset);
                            }
                        }
                    }  
                    // Draw pauldron trim
                    if (specific_armour_sprite != "none"){
                        if (ttrim==0 && specialist_colours<=1) then draw_sprite(specific_armour_sprite,4,x_surface_offset,y_surface_offset);
                        if (ttrim==0 && specialist_colours>=2) then draw_sprite(specific_armour_sprite,5,x_surface_offset,y_surface_offset);
                    }
                } else if (array_length(armour_draw)){
                    draw_sprite(armour_draw[0], armour_draw[1],x_surface_offset,y_surface_offset);
                }

                // Draw decals, features and other stuff
                if (slow>=10) and (blandify=0) then draw_sprite(armour_sprite,slow,x_surface_offset,y_surface_offset);// Slow and Purposeful battle damage
                if (brothers>=0) and (blandify=0) then draw_sprite(spr_gear_techb,brothers,x_surface_offset,y_surface_offset);// Tech-Brothers bling
                //sgt helms
                if (specific_helm!=false){
                    with (obj_controller){
                        shader_set_uniform_f_array(colour_to_find1, [30/255,30/255,30/255]);
                        shader_set_uniform_f_array(colour_to_find2, [200/255,0/255,0/255]);
                    }
                    if (role()==obj_ini.role[100][Role.SERGEANT]){
                        with (obj_ini.complex_livery_data.sgt){
                            set_shader_color(0,helm_primary);
                            set_shader_color(1,helm_secondary);
                            set_shader_color(ShaderType.Lens,helm_lens);
                            draw_sprite(specific_helm,helm_pattern,helm_draw[0]+x_surface_offset,y_surface_offset+0);
                        }
                    }else if(role()==obj_ini.role[100][Role.VETERAN_SERGEANT]){
                        with (obj_ini.complex_livery_data.vet_sgt){
                            set_shader_color(0,helm_primary);
                            set_shader_color(1,helm_secondary);
                            set_shader_color(ShaderType.Lens,helm_lens);
                            draw_sprite(specific_helm,helm_pattern,helm_draw[0]+x_surface_offset,y_surface_offset+0);
                        }
                    }else if(role()==obj_ini.role[100][Role.CAPTAIN]){
                        with (obj_ini.complex_livery_data.captain){
                            set_shader_color(0,helm_primary);
                            set_shader_color(1,helm_secondary);
                            set_shader_color(ShaderType.Lens,helm_lens);
                            draw_sprite(specific_helm,helm_pattern,helm_draw[0]+x_surface_offset,y_surface_offset+0);
                        }
                    }
                    set_shader_to_base_values();
                    set_shader_array(shader_array_set);
                }            
                // Apothecary Lens
                if (ui_specialist=3){
                    if (armour_type==ArmourType.Tartaros) then draw_sprite(spr_gear_apoth,1, x_surface_offset+2,y_surface_offset-3);// was y_draw-4 with old tartar
                    if (armour_type==ArmourType.Indomitus) then draw_sprite(spr_gear_apoth,1,x_surface_offset,y_surface_offset-6);
                    if (armour_type!=ArmourType.Indomitus) and (armour_type!=ArmourType.Tartaros) then draw_sprite(spr_gear_apoth,1,x_surface_offset,y_surface_offset);
                    if (gear() == "Narthecium"){
                        if (armour_type==ArmourType.Normal) {
                            draw_sprite(spr_narthecium_2,0,x_surface_offset+66,y_surface_offset+5);
                        } else if (armour_type!=ArmourType.Normal && armour_type!=ArmourType.Dreadnought){
                            draw_sprite(spr_narthecium_2,0,x_surface_offset+92,y_surface_offset+5);
                        }
                    }
                }
            
                // Hood
                if (hood>0){
                    var yep=0;
                    if (array_contains(obj_ini.adv,"Daemon Binders") && blandify==0 && hood<7){
                        if (ttrim=1) then draw_sprite(spr_gear_hood2,0,x_surface_offset-2,y_surface_offset-11);
                        if (ttrim==0) then draw_sprite(spr_gear_hood2,1,x_surface_offset-2,y_surface_offset-11);
                    } else {
                        //if (obj_ini.main_color=obj_ini.secondary_color) then draw_sprite(spr_gear_hood1,hood,x_surface_offset,y_surface_offset);
                        //if (obj_ini.main_color!=obj_ini.secondary_color) then draw_sprite(spr_gear_hood3,hood,x_surface_offset,y_surface_offset);
                        draw_sprite(spr_psy_hood,2,x_surface_offset,y_surface_offset);
                    } 
                }

                //Chaplain head and Terminator version
                if (skull>0) and (ui_specialist=1){
                    if (armour()!="Terminator"){
                      //if (_armour_type==ArType.Tart || _armour_type==ArType.Term) then draw_sprite(spr_terminator_chap,1,0-2,0-11);
                    }
                    shader_reset();
                    if (armour_type == ArmourType.Normal || armour_type==ArmourType.Indomitus) then draw_sprite(spr_chaplain_skull_helm,0,x_surface_offset,y_surface_offset);
                    if (armour_type==ArmourType.Tartaros) then draw_sprite(spr_chaplain_skull_helm,0,x_surface_offset,y_surface_offset+5);
                    shader_set(sReplaceColor);
                }
            }
            //purity seals/decorations
            if (armour_type==ArmourType.Normal){
                if (struct_exists(body[$ "torso"],"purity_seal")){
                    if (body[$ "torso"][$"purity_seal"][2]==1){
                        draw_sprite(spr_purity_seal,2,x_surface_offset-24,y_surface_offset+14);
                    }
                    if (body[$ "torso"][$"purity_seal"][0]==1){
                        draw_sprite(spr_purity_seal,0,x_surface_offset-44,y_surface_offset+18);
                    }
                    if (body[$ "torso"][$"purity_seal"][1]==1){
                        draw_sprite(spr_purity_seal,0,x_surface_offset-6,y_surface_offset+16);
                    }                                       
                }
                if (struct_exists(body[$ "left_arm"],"purity_seal")){
                    if (body[$ "left_arm"][$"purity_seal"][0]==1){
                        draw_sprite(spr_purity_seal,1,x_surface_offset+70,y_surface_offset);
                    }
                    if (body[$ "left_arm"][$"purity_seal"][1]==1){
                        draw_sprite(spr_purity_seal,0,x_surface_offset+26,y_surface_offset+7);
                    }
                    if (body[$ "left_arm"][$"purity_seal"][2]==1){
                        draw_sprite(spr_purity_seal,0,x_surface_offset+15,y_surface_offset+10);
                    }                                       
                }
                if (struct_exists(body[$ "right_arm"],"purity_seal")){
                    if (body[$ "right_arm"][$"purity_seal"][0]==1){
                        draw_sprite(spr_purity_seal,2,x_surface_offset-54,y_surface_offset-3);
                    }
                    if (body[$ "right_arm"][$"purity_seal"][0]==1){
                        draw_sprite(spr_purity_seal,0,x_surface_offset-72,y_surface_offset+8);
                    }
                    if (body[$ "right_arm"][$"purity_seal"][0]==1){
                        draw_sprite(spr_purity_seal,0,x_surface_offset-57,y_surface_offset+12);
                    }                    
                }            
            }		

			// Bionics
            if (!hide_bionics) {
                var eye_move_x = 0;
                var eye_move_y = 0;
                var eye_spacer = 0;
                if (armour_type == ArmourType.Indomitus) {
                    // Adjust eye bionics on chaplain terminator armour
                    if (skull > 0 && ui_specialist == 1) {
                        eye_move_y = 2;
                        eye_spacer = -2;
                    // Adjust eye bionics on terminator armour
                    } else {
                        eye_move_y = -7;
                    }
                }
                // Draw bionics
                surface_reset_target();
                var bionic_surface = surface_create(512,512);             
                surface_set_target(bionic_surface);

                for (var part = 0; part < array_length(global.body_parts); part++) {
                    if (struct_exists(body[$ global.body_parts[part]], "bionic")) {
                        if (armour_type == ArmourType.Normal || armour_type == ArmourType.Indomitus) {
                            var body_part = global.body_parts[part];
                            var bionic = body[$ body_part][$ "bionic"];
                            switch (body_part) {
                                case "left_eye":
                                    if (bionic.variant == 0) {
                                        draw_sprite(spr_bionics_eye, 1,x_surface_offset+ eye_move_x + eye_spacer, y_surface_offset + eye_move_y);
                                    } else if (bionic.variant == 1) {
                                        draw_sprite(spr_bionic_eye_2, 1,x_surface_offset+eye_move_x + eye_spacer, y_surface_offset + eye_move_y);
                                    } else if (bionic.variant == 2) {
                                        draw_sprite(spr_bionic_eye_2, 2,x_surface_offset+eye_move_x + eye_spacer, y_surface_offset + eye_move_y);
                                    }
                                    break;

                                case "right_eye":
                                    if (bionic.variant == 0) {
                                        draw_sprite(spr_bionics_eye, 0,x_surface_offset+eye_move_x, y_surface_offset + eye_move_y);
                                    } else if (bionic.variant == 1) {
                                        draw_sprite(spr_bionic_eye_2, 0,x_surface_offset+eye_move_x, y_surface_offset + eye_move_y);
                                    } else if (bionic.variant == 2) {
                                        draw_sprite(spr_bionic_eye_2, 4,x_surface_offset+eye_move_x, y_surface_offset + eye_move_y);
                                    }
                                    break;

                                case "left_leg":
                                    if (armour_type == ArmourType.Normal) {
                                        var sprite_num = 3;
                                        if (specialist_colours >= 2) {
                                            sprite_num = 4;
                                        }
                                        if (bionic.variant == 0) {
                                            draw_sprite(spr_bionics_leg_2, sprite_num, x_surface_offset, y_surface_offset)
                                        } else {
                                            draw_sprite(spr_bionics_leg_3, sprite_num, x_surface_offset, y_surface_offset)
                                        }
                                    }
                                    break;

                                case "right_leg":
                                    if (armour_type == ArmourType.Normal) {
                                        if (bionic.variant == 0) {
                                            draw_sprite(spr_bionics_leg_2, 0, x_surface_offset, y_surface_offset)
                                        } else {
                                            draw_sprite(spr_bionics_leg_3, 0, x_surface_offset, y_surface_offset)
                                        }
                                    }
                                    break;
                            }
                        }
                    }
                }
                surface_reset_target();
                shader_set_uniform_i(shader_get_uniform(sReplaceColor, "u_blend_modes"), 1);
                texture_set_stage(shader_get_sampler_index(sReplaceColor, "background_texture"), surface_get_texture(unit_surface));                   
                surface_set_target(unit_surface);                
                draw_surface(bionic_surface, 0,0);
                surface_free(bionic_surface);
                shader_set(sReplaceColor);
                shader_set_uniform_i(shader_get_uniform(sReplaceColor, "u_blend_modes"), 0);                
            }
            // Draw Custom Helmets
            if (armour_type==ArmourType.Normal && !armour_bypass){
                if (role() == obj_ini.role[100][7]) {
                    draw_sprite(spr_special_helm,0,x_surface_offset,y_surface_offset);
                    draw_sprite(spr_laurel,0,x_surface_offset,y_surface_offset);
                }
                if (role() == obj_ini.role[100][5]) {
                    draw_sprite(spr_laurel,0,x_surface_offset,y_surface_offset);
                }
            }

            if (hood==0) and (armour_type==ArmourType.Normal) and (armour()!="") and (role()==obj_ini.role[100][2]) && (global.chapter_name!="Ultramarines") && (global.chapter_name!="Blood Angels"){
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
                draw_sprite(spr_honor_helm,helm_ii,x_surface_offset-2,y_surface_offset-11);     
			}

            // Drawing Robes
            if (armour_type == ArmourType.Normal && !robe_bypass) {
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
                    draw_sprite(spr_marine_cloth_hood,0,0+hood_offset_x,y_surface_offset+hood_offset_y);     
                }
                if (struct_exists(body[$ "torso"],"robes")) {
                    if (body.torso.robes<2){
                        draw_sprite(spr_marine_robes,body.torso.robes,x_surface_offset+robe_offset_x,y_surface_offset+robe_offset_y);     
                    } else {
                        draw_sprite(spr_cloth_tabbard,body.torso.robes,x_surface_offset+robe_offset_x,y_surface_offset+robe_offset_y);     
                    }
                }              
            }

            if (armour_sprite==spr_scout_colors2){
                ui_ymod[1]+=7;
                ui_ymod[2]+=7;
            }
            // Weapons for above arms
            if (ui_weapon[1]!=0) and (sprite_exists(ui_weapon[1])) and (ui_above[1]==true){
                if (ui_twoh[1]==false) and (ui_twoh[2]==false){
                    draw_sprite(ui_weapon[1],0,x_surface_offset+ui_xmod[1],y_surface_offset+ui_ymod[1]);                  
                }
                if (ui_twoh[1]==true){
                    if (specialist_colours<=1) then draw_sprite(ui_weapon[1],0,x_surface_offset+ui_xmod[1],y_surface_offset+ui_ymod[1]);
                    if (specialist_colours>=2) then draw_sprite(ui_weapon[1],3,x_surface_offset+ui_xmod[1],y_surface_offset+ui_ymod[1]);
                    if (ui_force_both==true){
                        if (specialist_colours<=1) then draw_sprite(ui_weapon[1],0,x_surface_offset+ui_xmod[1],y_surface_offset+ui_ymod[1]);
                        if (specialist_colours>=2) then draw_sprite(ui_weapon[1],1,x_surface_offset+ui_xmod[1],y_surface_offset+ui_ymod[1]);
                    }
                }
            }
            if (ui_weapon[2]!=0) and (ui_above[2]==true) and (sprite_exists(ui_weapon[2])) and ((ui_twoh[1]==false || ui_force_both==true)){
                if (ui_spec[2]==false){
                    draw_sprite(ui_weapon[2],1,x_surface_offset+ui_xmod[2],y_surface_offset+ui_ymod[2]);
                }
                if (ui_spec[2]==true){
                    if (specialist_colours<=1) then draw_sprite(ui_weapon[2],2,x_surface_offset+ui_xmod[2],y_surface_offset+ui_ymod[2]);
                    if (specialist_colours>=2) then draw_sprite(ui_weapon[2],3,x_surface_offset+ui_xmod[2],y_surface_offset+ui_ymod[2]);                    
                }
            }
        
            // Draw terminator hands
            if ui_hand[1] == 1 {
                if (armour_type == ArmourType.Tartaros){
                    draw_sprite(spr_terminator_hands,0,x_surface_offset+4,y_surface_offset+13);
                }
                else if (armour_type == ArmourType.Indomitus){
                    draw_sprite(spr_terminator_hands,0,x_surface_offset,y_surface_offset);
                }
            }
            if ui_hand[2] == 1 {
                if (armour_type == ArmourType.Tartaros){
                    if (specialist_colours <= 1){
                        var spr_w = sprite_get_width(spr_terminator_hands) - sprite_get_xoffset(spr_terminator_hands) * 2;
                        draw_sprite_ext(spr_terminator_hands,0,x_surface_offset+spr_w-4,y_surface_offset+13,-1,1,0,c_white,1);
                    }
                    else if (specialist_colours >= 2){
                        var spr_w = sprite_get_width(spr_terminator_hands) - sprite_get_xoffset(spr_terminator_hands) * 2;
                        draw_sprite_ext(spr_terminator_hands,1,x_surface_offset+spr_w-4,y_surface_offset+13,-1,1,0,c_white,1);
                    }
                }
                else if (armour_type == ArmourType.Indomitus){
                    if (specialist_colours <= 1){
                        var spr_w = sprite_get_width(spr_terminator_hands) - sprite_get_xoffset(spr_terminator_hands) * 2;
                        draw_sprite_ext(spr_terminator_hands,0,x_surface_offset+spr_w,y_surface_offset,-1,1,0,c_white,1);
                    }
                    else if (specialist_colours >= 2){
                        var spr_w = sprite_get_width(spr_terminator_hands) - sprite_get_xoffset(spr_terminator_hands) * 2;
                        draw_sprite_ext(spr_terminator_hands,1,x_surface_offset+spr_w,y_surface_offset,-1,1,0,c_white,1);
                    }
                }
            }

            if ui_hand[1] == 2 {
                if (armour_type == ArmourType.Tartaros){
                    draw_sprite(spr_terminator_hands,2,x_surface_offset+4,y_surface_offset+13);
                }
                else if (armour_type == ArmourType.Indomitus){
                    draw_sprite(spr_terminator_hands,2,x_surface_offset,y_surface_offset);
                }
            }
            if ui_hand[2] == 2 {
                if (armour_type == ArmourType.Tartaros){
                    if (specialist_colours <= 1){
                        var spr_w = sprite_get_width(spr_terminator_hands) - sprite_get_xoffset(spr_terminator_hands) * 2;
                        draw_sprite_ext(spr_terminator_hands,2,x_surface_offset+spr_w-4,y_surface_offset+13,-1,1,0,c_white,1);
                    }
                    else if (specialist_colours >= 2){
                        var spr_w = sprite_get_width(spr_terminator_hands) - sprite_get_xoffset(spr_terminator_hands) * 2;
                        draw_sprite_ext(spr_terminator_hands,3,x_surface_offset+spr_w-4,y_surface_offset+13,-1,1,0,c_white,1);
                    }
                }
                else if (armour_type == ArmourType.Indomitus){
                    if (specialist_colours <= 1){
                        var spr_w = sprite_get_width(spr_terminator_hands) - sprite_get_xoffset(spr_terminator_hands) * 2;
                        draw_sprite_ext(spr_terminator_hands,2,x_surface_offset+spr_w,y_surface_offset,-1,1,0,c_white,1);
                    }
                    else if (specialist_colours >= 2){
                        var spr_w = sprite_get_width(spr_terminator_hands) - sprite_get_xoffset(spr_terminator_hands) * 2;
                        draw_sprite_ext(spr_terminator_hands,3,x_surface_offset+spr_w,y_surface_offset,-1,1,0,c_white,1);
                    }
                }
            }

            var shield_offset_x = 0;
            var shield_offset_y = 0;
            if (armour_type == ArmourType.Indomitus){
                shield_offset_x = -15;
                shield_offset_y = -10;
            } else if (armour_type == ArmourType.Tartaros) {
                shield_offset_x = -8;
            }
            if (gear() == "Combat Shield") then draw_sprite (spr_gear_combat_shield, 1, x_surface_offset + shield_offset_x, y_surface_offset + shield_offset_y);

            // if (braz=1) then draw_sprite(spr_pack_brazier,1,x_surface_offset,y_surface_offset);
            if (armour_type==ArmourType.Dreadnought){
                draw_sprite(spr_dreadnought_chasis_colors,specialist_colours,x_surface_offset,y_surface_offset);
                var left_arm = dreadnought_sprite_components(weapon_two());
                var colour_scheme  =  specialist_colours<=1 ? 0 : 1;
                draw_sprite(left_arm,colour_scheme,x_surface_offset,y_surface_offset);
                colour_scheme  += 2;
                var right_arm = dreadnought_sprite_components(weapon_one());
                draw_sprite(right_arm,colour_scheme,x_surface_offset,y_surface_offset);
            } 			          
        }else{
            draw_set_color(c_gray);
            draw_text(0,0,string_hash_to_newline("Color swap shader#did not compile"));
        }
        // if (race()!="1"){draw_set_color(38144);draw_rectangle(0,x_surface_offset,y_surface_offset+166,0+231,0);}        
    }

    draw_set_alpha(1);

    if (name_role()!=""){
        if (race()=="3"){
            if (string_count("Techpriest",name_role())>0) then draw_sprite(spr_techpriest,0,x_surface_offset,y_surface_offset);
        }else if (race()=="4"){
            if (string_count("Crusader",name_role())>0) then draw_sprite(spr_crusader,0,x_surface_offset,y_surface_offset);
        }else if (race()=="5"){
            if (string_count("Sister of Battle",name_role())>0) then draw_sprite(spr_sororitas,0,x_surface_offset,y_surface_offset);
            if (string_count("Sister Hospitaler",name_role())>0) then draw_sprite(spr_sororitas,1,x_surface_offset,y_surface_offset);
        }else if (race()=="6"){
            if (string_count("Ranger",name_role())>0) then draw_sprite(spr_eldar_hire,0,x_surface_offset,y_surface_offset);
            if (string_count("Howling Banshee",name_role())>0) then draw_sprite(spr_eldar_hire,1,x_surface_offset,y_surface_offset);
        }
    }
    surface_reset_target();
    /*shader_set_uniform_i(shader_get_uniform(sReplaceColor, "u_blend_modes"), 2);                
    texture_set_stage(shader_get_sampler_index(sReplaceColor, "armour_texture"), sprite_get_texture(spr_leopard_sprite, 0)); */
    //draw_surface(unit_surface, xx+_x1-x_surface_offset,yy+_y1-y_surface_offset);
    //surface_free(unit_surface);
    shader_reset();
    return new unit_image(unit_surface);   
}

function base_colour(R,G,B) constructor{
    r=R;
    g=G;
    b=B;
}