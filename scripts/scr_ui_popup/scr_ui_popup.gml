function tooltip_draw(tooltip, rect_x=mouse_x+DEFAULT_TOOLTIP_MOUSE_X_OFFSET, rect_y=mouse_y, extra_x=0, extra_y=0, max_width=DEFAULT_TOOLTIP_WIDTH, line_gap=DEFAULT_LINE_GAP, draw_color=c_gray){
	var xx = __view_get(e__VW.XView, 0);
	var yy = __view_get(e__VW.YView, 0);
	tooltip = string_hash_to_newline(string(tooltip));
	var width = min(string_width(tooltip) + extra_x, max_width);
	var height = string_height_ext(tooltip, line_gap, width) + extra_y;
	rect_x = clamp(rect_x, xx, xx + __view_get(e__VW.WView, 0) - width - DEFAULT_TOOLTIP_VIEW_OFFSET);
	rect_y = clamp(rect_y, yy, yy + __view_get(e__VW.HView, 0) - height - DEFAULT_TOOLTIP_VIEW_OFFSET);
	draw_rectangle_color_alpha(rect_x, rect_y, width + rect_x + 6, height + rect_y + 6, 0, 0, 1);
	draw_rectangle_color_alpha(rect_x, rect_y, width + rect_x + 6, height + rect_y + 6, 1, draw_color, 1);
	draw_rectangle_color_alpha(rect_x + 1, rect_y + 1, width + rect_x + 5, height + rect_y + 5, 1, draw_color, 0.5);
	draw_text_ext_color_alpha(rect_x + 2.5, rect_y + 2.5, tooltip, line_gap, width, draw_color, 1);
	return [width + 6, height + 6];
}

function draw_rectangle_color_alpha(x, y, width, height, outline, color, alpha){
	draw_set_color(color);
	draw_set_alpha(alpha);
	draw_rectangle(x, y, width, height, outline);
}

function draw_text_ext_color_alpha(x, y, string, sep, w, color, alpha){
	draw_set_color(color);
	draw_set_alpha(alpha);
	draw_text_ext(x, y, string, sep, w);
}

function scr_ui_popup() {
	// 48,48      over like 256, down to 480-128

	if (obj_controller.menu=60){
		var xx,yy;
	    xx=__view_get( e__VW.XView, 0 )+25;yy=__view_get( e__VW.YView, 0 )+165;
    
	    draw_sprite(spr_popup_large,1,xx,yy);
	    // draw_set_color(0);draw_rectangle(xx+31,yy+29,xx+593,yy+402,0);
	    draw_set_color(c_gray);
	    // draw_rectangle(xx+31,yy+47,xx+593,yy+402,1);
    
	    draw_set_font(fnt_40k_30b);
	    draw_set_halign(fa_center);
	    var planet_upgrades = obj_temp_build.target.p_upgrades[obj_controller.selecting_planet];
	    var un_upgraded = 0,arsenal = 0, gene_vault=0,s_base=0,ttitle="",i=0;

	    if (planet_feature_bool(planet_upgrades, P_features.Secret_Base)==1){s_base=1}
	    if (planet_feature_bool(planet_upgrades, P_features.Arsenal)==1){arsenal=1}
	    if (planet_feature_bool(planet_upgrades, P_features.Gene_Vault)==1){gene_vault=1}
	    un_upgraded = gene_vault+arsenal+s_base;
	    if (obj_temp_build.isnew==1){
	        title="Secret Lair ("+string(obj_temp_build.target.name)+" "+scr_roman(obj_temp_build.planet)+")";
	        draw_text_transformed(xx+312-64,yy+10,string_hash_to_newline(title),0.7,0.7,0);
        
	        draw_set_font(fnt_40k_14b);
	        draw_text(xx+312,yy+45,string_hash_to_newline("Select a Secret Lair style."));
	        draw_set_halign(fa_left);
        
	        var r=0,wob="",word="";
	        for (r=1;r<10;r++){
		        switch(wob){
		        	case "Barbarian":
		        		word="Heavy on leather, hides, and trophy body parts.";
		        		tag="BRB";
		        		break;
		        	case "Disco":
		        		word="Rainbow colored dance floor and steel rafters.";
		        		tag="DIS";
		        		break;
		        	case "Feudal":
		        		word="Lots of stone, metal filigree, and statues.";
		        		tag="FEU";
		        		break;	 
		        	case "Gothic":
		        		word="Heavy on leather, hides, and trophy body parts.";
		        		tag="GTH";
		        		break;
		        	case "Mechanicus":
		        		word="Grates, tubes, gears, and augmented reality.";
		        		tag="MCH";
		        		break;	 
		        	case "Prospero":
		        		word="Marble or standstone surfaces and gold filigree.";
		        		tag="PRS";
		        		break;
		        	case "Rave Club":
		        		word="Large, open area with neon or strobe lights.";
		        		tag="RAV";
		        		break;
		        	case "Steel":
		        		word="Stainless steel surfaces and water fountains.";
		        		tag="STL";
		        		break;
		        	case "Utilitarian":
		        		word="Plaster or concrete surfaces with carpeting.";
		        		tag="UTL"
		        		break;	        			        			        			        		       			        		       			        		
		        }
            
	            draw_set_color(c_gray);draw_rectangle(xx+21,yy+38+(r*30),xx+600,yy+56+(r*30),0);
	            if (scr_hit(xx+21,yy+38+(r*30),xx+600,yy+56+(r*30))=true){
	                draw_set_color(c_black);
	                draw_set_alpha(0.2);
	                draw_rectangle(xx+21,yy+38+(r*30),xx+600,yy+56+(r*30),0);draw_set_alpha(1);
                
	                if (obj_controller.mouse_left=1) and (obj_controller.cooldown<=0){
	                    obj_controller.cooldown=8000;var tag="";
						switch (r) {
						    case 1:
						        tag = "BRB";
						        break;
						    case 2:
						        tag = "DIS";
						        break;
						    case 3:
						        tag = "FEU";
						        break;
						    case 4:
						        tag = "GTH";
						        break;
						    case 5:
						        tag = "MCH";
						        break;
						    case 6:
						        tag = "PRS";
						        break;
						    case 7:
						        tag = "RAV";
						        break;
						    case 8:
						        tag = "STL";
						        break;
						    case 9:
						        tag = "UTL";
						        break;
						    default:
						        break;
						}
						var base_options = {style:tag};
	                    obj_temp_build.isnew=0;
						array_push(planet_upgrades, new new_planet_feature(P_features.Secret_Base, base_options));
	                }
	            }
	            draw_set_color(0);
	            draw_set_font(fnt_40k_14b);
	            draw_text_transformed(xx+23,yy+40+(r*30),string_hash_to_newline(string(wob)),1,0.8,0);
	            draw_set_font(fnt_40k_14);
	            draw_text_transformed(xx+121,yy+40+(r*30),string_hash_to_newline(string(word)),1,0.8,0);
	        }
	    }

    

	    if (un_upgraded==0){
	    	title="Build ("+string(obj_temp_build.target.name)+" "+scr_roman(obj_temp_build.planet)+")";
		}else if(un_upgraded!=0){
	        if (s_base!=0) then title="Secret Lair ("+string(obj_temp_build.target.name)+" "+scr_roman(obj_temp_build.planet)+")";
	        if (arsenal!=0) then title="Secret Arsenal ("+string(obj_temp_build.target.name)+" "+scr_roman(obj_temp_build.planet)+")";
	        if (gene_vault!=0) then title="Secret Gene-Vault ("+string(obj_temp_build.target.name)+" "+scr_roman(obj_temp_build.planet)+")";
	    }

	    draw_text_transformed(xx+312,yy+10,string_hash_to_newline(title),0.7,0.7,0);
    
	    draw_set_halign(fa_left);
    
	    if (s_base>0){
		    var search_list =search_planet_features(planet_upgrades, P_features.Secret_Base);
		    if (array_length(search_list) > 0){
			    var woob="",secret=true;
				var s_base = planet_upgrades[search_list[0]];
				if (s_base.built>obj_controller.turn){
					draw_set_font(fnt_40k_14b);
		        	draw_text(xx+21,yy+65,string_hash_to_newline($"This feature will be constructed in {s_base.built-obj_controller.turn} months."));
		    	}else if (s_base.built<=obj_controller.turn){
					if (s_base.inquis_hidden != 1){secret = false;}
		        
			        var r=0,butt="",alp=1,cost=0,fuck=obj_temp_build,tooltip="",tooltip2="",tooltip3="",tooltip4="",tcost=0;
			        for (r=1;r<13;r++){
			        	alp=1;
			        	cost=0;
			            if (r==1){if (s_base.forge>0) then alp=0.33;cost=1000;butt="Forge";tooltip2="A modest, less elaborate forge able to employ a handful of Astartes or Techpriest.";}
			            else if (r==2){if (s_base.hippo>0) then alp=0.33;cost=1000;butt="Hippodrome";tooltip2="A moderate sized garage fit to hold, service, and display vehicles.";}
			            else if  (r==3){if (s_base.beastarium>0) then alp=0.33;cost=1000;butt="Beastarium";tooltip2="An enclosure with simulated greenery and foilage meant to hold beasts.";}
			            else if  (r==4){if (s_base.torture>0) then alp=0.33;cost=500;butt="Torture Chamber";tooltip2="Only the best for the best.  A room full of torture tools and devices.";}
			            else if  (r==5){if (s_base.narcotics>0) then alp=0.33;cost=500;butt="Narcotics";tooltip2="Several boxes worth of Obscura, Black Lethe, Kyxa... line it up.";}
			            else if  (r==6){if (s_base.relic>0) then alp=10+fuck.relic;cost=500;butt="Relic Room";tooltip2="A room meant for displaying trophies.  May be purchased successive times.";}
			            else if  (r==7){if (s_base.cookery>0) then alp=0.33;cost=250;butt="Cookery";tooltip2="A larger, well-stocked cookery, complete with a number of Imperial Chef servants.";}
			            else if  (r==8){if (s_base.vox>0) then alp=0.33;cost=250;butt="Vox Casters";tooltip2="All the bass one could ever imaginably need.";}
			            else if  (r==9){if (s_base.librarium>0) then alp=0.33;cost=250;butt="Librarium";tooltip2="A study fit to hold a staggering amount of tomes and scrolls.";}
			            else if  (r==10){if (s_base.throne>0) then alp=0.33;cost=250;butt="Throne";tooltip2="A massive, ego boosting throne.";}
			            else if  (r==11){if (s_base.stasis>0) then alp=0.33;cost=200;butt="Stasis Pods";tooltip2="Though they start empty, you may capture and display your foes in these.";}
			            else if  (r==12){if (s_base.swimming>0) then alp=0.33;cost=100;butt="Swimming Pool";tooltip2="A large body of water meant for excersize or relaxation.";}
			            tooltip=butt;
		            
			            draw_set_font(fnt_40k_14);draw_set_alpha(alp);draw_set_color(c_gray);
			            draw_rectangle(xx+494,yy+12+((r-1)*22),xx+614,yy+32+((r-1)*22),0);
			            draw_set_color(c_black);
			            draw_text_transformed(xx+496,yy+14+((r-1)*22),string_hash_to_newline(string(butt)),1,0.9,0);draw_set_alpha(1);
		            
			            if (scr_hit(xx+494,yy+12+((r-1)*22),xx+614,yy+32+((r-1)*22))=true){
			                if (alp<=0.33) then draw_set_alpha(0.1);
			                if (alp>0.33) then draw_set_alpha(0.2);
			                draw_set_color(0);
			                draw_rectangle(xx+494,yy+12+((r-1)*22),xx+614,yy+32+((r-1)*22),0);
			                draw_set_alpha(1);
			                tooltip3=tooltip;
			                tooltip4=tooltip2;
			                tcost=cost;
			                if (obj_controller.mouse_left==1) and (obj_controller.cooldown<=0) and (obj_controller.requisition>=tcost) and (alp!=0.33){
			                    obj_controller.cooldown=8000;obj_controller.requisition-=tcost;
			                    if (r=1){
			                    	s_base.forge=1;
			                    	s_base.forge_data = new player_forge();
			                    }
			                    else if (r==2){s_base.hippo=1;}
			                    else if (r==3){s_base.beastarium=1}
			                    else if (r==4){s_base.torture=1}
			                    else if (r==5){s_base.narcotics=1}
			                    else if (r==6){s_base.relic=1}
			                    else if (r==7){s_base.cookery=1}
			                    else if (r==8){s_base.vox=1}
			                    else if (r==9){s_base.librarium=1}
			                    else if (r==10){s_base.throne=1}
			                    else if (r==11){s_base.stasis=1}
			                    else if (r==12){s_base.swimming=1};
			                }
			            }
			        }
		        
			        woob="Deep beneath the surface of "+string(fuck.target.name)+" "+scr_roman(obj_controller.selecting_planet)+" lays your ";
			        if (secret) { woob+="secret lair.  ";}
			        else if (!secret){ woob+="previously discovered lair.  ";}
		        
			        woob+="It is massive";
			        switch (s_base.style){
			        	case "BRB":
				        	woob+=", the walls decorated with animal hides and leather.  Among the copius body-trophies and bones are torches that hiss and spit.  ";
				        	break;
			        	case "DIS":
				        	woob+="- the main attraction is the rainbow-colored, lit up grid flooring which quickly change color.  Far overhead are metal rafters.  ";
				        	break;
			        	case "FEU":
				        	woob+=", the walls made up of sturdy blocks of stones.  It is heavily decorated with wooden furniture, banners, and medieval weaponry.  ";
				        	break;
			        	case "GTH":
				        	woob+=", the walls made up of lightly-dusty stone.  Mosaics and statues are abundant throughout, giving it that comfortable gothic feel.  ";
				        	break;
			        	case "MCH":
				        	woob+="- at a glance it appears decorated like a factory.  Those with a neural network see the lair as brightly colored and lit, full of knowledge, learning, and chapter iconography.  ";
				        	break;
			        	case "PRS":
				        	woob+=", the walls made up of polished sandstone or marble.  All throughout are chapter iconography and ancient symbols, wrought in gold.  ";
				        	break;
			        	case "RAV":
				        	woob+=" but nearly pitch-black inside.  The only illumination is provided by loopy neon lux-casters, and strobes, which blast out light in random, flickering patterns.  ";
				        	break;
			        	case "STL":
				        	woob+=".  All of the surfaces are made up of highly polished stainless steel.  An occasional small water fountain or plant decorates the place.  ";
				        	break;	
			        	case "UTL":
				        	woob+=" and almost civilian looking in nature- the walls are up of simple concrete or plaster.  A thick carpet covers much of the floor.";
				        	break;					        					        					        				        					        	
			        }
		        
			        if (s_base.throne==1){
			            woob+="  The center chamber is dominated by ";
			            var yep=false,c=0;
		            
			            if (obj_controller.temp[104]=string(obj_temp_build.target.name)+"."+string(obj_controller.selecting_planet)) then yep=true;
			            if (yep) { woob+="a massive throne, which you are currently seated upon.  ";}
			            else if (!yep) {woob+="a massive throne, though it is currently vacant.  ";}
			        }
			        if (s_base.vox>0) and (fuck.target.p_player[obj_controller.selecting_planet]>0) then woob+="Heretical music blasts from the vox-casters, shaking the walls.  ";
			        if (s_base.narcotics>0) then woob+="  Many of the tables have lines of white powder set on paper or bunches of needles.  Plastic straws lay close by.  ";
			        if (s_base.cookery=1){
			            if (fuck.target.p_player[obj_controller.selecting_planet]>0) then woob+="Imperial Chefs are currently bustling to and from the kitchen, cooking savory treats and food for those present.  ";
			            if (fuck.target.p_player[obj_controller.selecting_planet]=0) then woob+="The Imperial Chefs are mostly idle, making use of the other rooms and facilities.  ";
			        }
		        
			        if (s_base.stock==1)  {woob+="  One of the chambers is hollowed out to display war trophies and gear.  ";}
			        else if (s_base.stock==2){woob+="  One of the chambers holds war trophies from recent conquests.  ";}
			        else if (s_base.stock==3){woob+="  War trophies taken from several Xeno races are displayed in the Relic Room.  ";}
			        else if (s_base.stock==4){woob+="  Your Relic Room contains trophies and skulls, taken from every Xeno race.  ";}
			        else if (s_base.stock==5){woob+="  Your Relic Room contains trophies, skulls, and suits of armour taken from Xenos races.  ";}
			        else if (s_base.stock==6) {woob+="  Your Relic Room contains wargear and suits of armour from all races, several Adeptus Astartes suits included.  ";}
			        else if (s_base.stock==7)  {woob+="  One of the chambers holds wargear and suits of armour from all races.  A suit of Terminator armour is included, half of the armour taken off to reveal the inner workings.";}
			        else if (s_base.stock==8)  {woob+="  Your Relic Room's trophies, skulls, and armours now spill out into the hallways, such is their number.  ";}
			        else if (s_base.stock==9) { woob+="  Many of the xenos war trophies and suits of armour are placed around the Lair, filling out spare surfaces.  ";}
			        else if (s_base.stock==10) { woob+="  In addition to the many war trophies your Relic Room also has small amounts of gold coins.  ";}
			        else if (s_base.stock==11) { woob+="  In addition to the many war trophies your Relic Room also has small piles of gold coins and clutter.  ";}
			        else if (s_base.stock==12) { woob+="  In addition to the many war trophies your Relic Room also has sizeable piles of gold.  ";}
			        else if (s_base.stock==13)  {woob+="  In addition to the many war trophies your Relic Room also has chests and cabinets full of gold.  ";}
			        else if (s_base.stock==14)  {woob+="  In addition to the many war trophies your Relic Room also has chests full to the brim of gold and many precious gems.  ";}
			        else if (s_base.stock==15) { woob+="  War trophies, chests of gold, precious gems, your lair has it all.  ";}
			        else if (s_base.stock==16)  {woob+="  War trophies, chests of gold, precious gems, your lair has it all, and in abundance.  ";}
			        else if (s_base.stock==17)  {woob+="  The abundant gold and gem piles have begun to spill out into the hallway.  ";}
			        else if (s_base.stock==18) { woob+="  The abundant gold and gems spill out into the hallway, your forces idly stepping across it.  ";}
			        else if (s_base.stock==19) { woob+="  A sizeable portion of your lair is carelessly covered in gold coins, objects, and gems.  ";}
			        else if (s_base.stock==20)  {woob+="  Much of your lair is carelessly covered in gold coins, objects, and gems.  ";}
			        else if (s_base.stock>=21) and (s_base.stock<25)  {woob+="  Your abundant wealth is evident in your lair- every surface and much of the floor smothered by gold or gems.  ";}
			        else if (s_base.stock>=25) and (s_base.stock<30)  {woob+="  Gold and gems are everywhere, occasionally attached to the walls and ceiling where able.  ";}
			        else if (s_base.stock>=30)  {woob+="  Gold and gems are EVERYWHERE.  The main chamber in particular is a sea of gold and gems, especially deep at the corners.  In all it is nearly three feet deep.  Coins clink and settle as your forces walk through the room.  ";}
		        
			        if (s_base.forge>0) then woob+="  Your lair has a forge, fit to be used by several astartes at once.  ";
			        if (s_base.hippo>0) then woob+="  Your lair has a hippodrome, or garage, that holds luxury vehicles.  ";
			        if (s_base.torture>0) then woob+="  One of the rooms is a well-stocked torture chamber.  ";
			        // if (string_count("forge",upp)>0) then woob+="  Your lair has a forge, fit to be used by several astartes at once.  ";
			        if (s_base.librarium>0) then woob+="  A large librarium makes up one of the wings, holding countless novels, books, scrolls, and documents on various topics.  ";
			        if (s_base.beastarium>0) then woob+="  Your lair has a beastarium, animals native to your homeworld living within.  ";
			        if (s_base.swimming>0) then woob+="  A large swimming pool with chapter-themed floaties is emplaced near the entrance.  ";
			        if (s_base.stasis>0) then woob+="  One of the chambers holds several stasis pods for display.  They are currently empty.  ";
		        
		        
			        draw_set_color(c_gray);draw_set_font(fnt_40k_14);draw_set_halign(fa_left);
			        draw_rectangle(xx+12,yy+45,xx+486,yy+378,1);
		        
			        var hh=1;
			        for(i=0;i<2;i++){if (((string_height_ext(string_hash_to_newline(string(woob)),-1,470))*hh)>330) then hh-=0.1;}
			        draw_text_ext_transformed(xx+14,yy+47,string_hash_to_newline(string(woob)),-1,470*(2+(hh*-1)),hh,hh,0);
		        
			        if (tooltip3!=""){
			            draw_set_alpha(1);
			            draw_set_font(fnt_40k_14);
			            draw_set_halign(fa_left);
			            draw_set_color(0);
			            draw_rectangle(mouse_x+18,mouse_y+20,mouse_x+string_width_ext(string_hash_to_newline(tooltip4),-1,500)+24,mouse_y+64+string_height_ext(string_hash_to_newline(tooltip4),-1,500),0);
			            draw_set_color(c_gray);
			            draw_rectangle(mouse_x+18,mouse_y+20,mouse_x+string_width_ext(string_hash_to_newline(tooltip4),-1,500)+24,mouse_y+64+string_height_ext(string_hash_to_newline(tooltip4),-1,500),1);
			            draw_set_font(fnt_40k_14b);
			            draw_text(mouse_x+22,mouse_y+22,string_hash_to_newline(string(tooltip3)));
			            draw_set_font(fnt_40k_14);draw_text_ext(mouse_x+22,mouse_y+42,string_hash_to_newline(string(tooltip4)),-1,500);
		            
			            draw_set_color(16291875);
			            if (obj_controller.requisition<tcost) then draw_set_color(c_red);
			            draw_sprite(spr_requisition,0,mouse_x+22,mouse_y+45+string_height_ext(string_hash_to_newline(tooltip4),-1,500));
			            draw_text(mouse_x+42,mouse_y+42+string_height_ext(string_hash_to_newline(tooltip4),-1,500),string_hash_to_newline(string(tcost)));
			        }
		    	}
	        
        
	     	}
	    }
	     draw_set_font(fnt_40k_14b);
	     woob=""
	     var arsenal = 0,gene_vault=0;
    		if (planet_feature_bool(planet_upgrades, P_features.Arsenal)==1){
    		  var arsenal = planet_upgrades[search_planet_features(planet_upgrades, P_features.Arsenal)[0]];
 	          if (arsenal.inquis_hidden == 1) then woob="A moderate sized secret Arsenal, this structure has ample holding area to store any number of artifacts and wargear.  Chaos and Daemonic items will be sent here by your Master of Relics, and due to the secret nature of its existance, the Inquisition will not find them during routine inspections.";
	          if (arsenal.inquis_hidden == 0) then woob="A moderate sized Arsenal, this structure has ample holding area to store any number of artifacts and wargear.  Since being discovered it may no longer hide Chaos and Daemonic wargear from routine Inquisition inspections.  You may wish to construct another Arsenal on a different planet.";   			
    		}
    		if (planet_feature_bool(planet_upgrades, P_features.Gene_Vault)==1){
    			var gene_vault = planet_upgrades[search_planet_features(planet_upgrades, P_features.Gene_Vault)[0]];
	          if (gene_vault.inquis_hidden == 1) then woob="A large facility with Gene-Vaults and additional spare rooms, this structure safely stores the majority of your Gene-Seed and is ran by servitors.  Due to its secret nature you may amass Gene-Seed and Test-Slave Incubators without fear of Inquisition reprisal or taking offense.";
	          if (gene_vault.inquis_hidden == 0) then woob="A large facility with Gene-Vaults and additional spare rooms, this structure safely stores the majority of your Gene-Seed and is ran by servitors.  Since being discovered all the contents are known to the Inquisition.  Your Gene-Seed remains protected but you may wish to build a new, secret one.";  
	     }
	     if (arsenal!=0) or (gene_vault!=0){
 			draw_text_ext(xx+21,yy+65,string_hash_to_newline(string(woob)),-1,595);
	     }
	    if (un_upgraded==0 && obj_temp_build.isnew!=1){
	        draw_set_font(fnt_40k_14b);
	        if (s_base==0) then draw_text(xx+21,yy+45,string_hash_to_newline("Lair"));
	        if (arsenal==0) then draw_text(xx+21,yy+110,string_hash_to_newline("Arsenal"));
	        if (gene_vault==0) then draw_text(xx+21,yy+175,string_hash_to_newline("Gene-Vault"));
	        draw_set_font(fnt_40k_14);
    
	        draw_sprite(spr_requisition,0,xx+160,yy+47);
	        draw_set_color(16291875);if (obj_controller.requisition<1000) then draw_set_color(c_red);draw_text(xx+180,yy+47,string_hash_to_newline("1000"));draw_set_color(c_gray);
	        draw_text_ext(xx+21,yy+65,string_hash_to_newline("Customizable hideout that your forces may garrison into.  The Lair may be upgraded further."),-6,600);
	        draw_rectangle(xx+300,yy+45,xx+400,yy+65,0);
	        draw_set_halign(fa_center);draw_set_color(0);
	        draw_text(xx+350,yy+47,string_hash_to_newline("Build"));draw_text(xx+351,yy+48,string_hash_to_newline("Build"));
	        if (scr_hit(xx+300,yy+45,xx+400,yy+65)=true){
	            draw_set_alpha(0.2);draw_rectangle(xx+300,yy+45,xx+400,yy+65,0);draw_set_alpha(1);
            
	            if (obj_controller.cooldown<=0) and (obj_controller.mouse_left=1) and (obj_controller.requisition>=1000){
					obj_temp_build.isnew=1;
	                obj_controller.cooldown=8000;
	                obj_controller.requisition-=1000;
	            }
	        }draw_set_halign(fa_left);
        
	        draw_sprite(spr_requisition,0,xx+160,yy+112);
	        draw_set_color(16291875);if (obj_controller.requisition<1500) then draw_set_color(c_red);draw_text(xx+180,yy+112,string_hash_to_newline("1500"));draw_set_color(c_gray);
	        draw_text_ext(xx+21,yy+130,string_hash_to_newline("Hidden armoury that stores unused Chaos and Daemonic artifacts, preventing them from discovery."),-1,600);
	        draw_rectangle(xx+300,yy+110,xx+400,yy+130,0);
	        draw_set_halign(fa_center);
	        draw_set_color(0);
	        draw_text(xx+350,yy+112,string_hash_to_newline("Build"));draw_text(xx+351,yy+113,string_hash_to_newline("Build"));
	        if (scr_hit(xx+300,yy+110,xx+400,yy+130)){
	            draw_set_alpha(0.2);
	            draw_rectangle(xx+300,yy+110,xx+400,yy+130,0);
	            draw_set_alpha(1);
            
	            if (obj_controller.cooldown<=0) and (obj_controller.mouse_left==1) and (obj_controller.requisition>=1500){
	                array_push(planet_upgrades, new new_planet_feature(P_features.Arsenal));
	                obj_controller.cooldown=8000;obj_controller.requisition-=1500;
	            }
	        }draw_set_halign(fa_left);
        
	        draw_sprite(spr_requisition,0,xx+160,yy+177);
	        draw_set_color(16291875);
	        if (obj_controller.requisition<4000) then draw_set_color(c_red);
	        draw_text(xx+180,yy+177,string_hash_to_newline("4000"));
	        draw_set_color(c_gray);
	        draw_text_ext(xx+21,yy+195,string_hash_to_newline("Hidden gene-vault that off-sources the majority of your Gene-Seed and Test-Slave Incubators."),-1,600);
	        draw_rectangle(xx+300,yy+175,xx+400,yy+195,0);
	        draw_set_halign(fa_center);draw_set_color(0);
	        draw_text(xx+350,yy+177,string_hash_to_newline("Build"));draw_text(xx+351,yy+178,string_hash_to_newline("Build"));
	        if (scr_hit(xx+300,yy+175,xx+400,yy+195)){
	            draw_set_alpha(0.2);draw_rectangle(xx+300,yy+175,xx+400,yy+195,0);draw_set_alpha(1);
            
	            if (obj_controller.cooldown<=0) and (obj_controller.mouse_left=1) and (obj_controller.requisition>=4000){
	                array_push(planet_upgrades, new new_planet_feature(P_features.Gene_Vault));
	                obj_controller.cooldown=8000;obj_controller.requisition-=4000;
	            }
	        }draw_set_halign(fa_left);
        
	    }
    
    
    
	    draw_set_font(fnt_40k_30b);
	    draw_set_color(c_gray);
	    draw_rectangle(xx+312-60,yy+388,xx+312+60,yy+420,0);
	    draw_set_halign(fa_center);
	    draw_set_color(0);
	    draw_text(xx+312,yy+388,string_hash_to_newline("Back"));
	    if (scr_hit(xx+312-60,yy+388,xx+312+60,yy+420)=true){
	        draw_set_alpha(0.2);
	        draw_rectangle(xx+312-60,yy+388,xx+312+60,yy+420,0);draw_set_alpha(1);
        
	        if (obj_controller.cooldown<=0) and (obj_controller.mouse_left=1){
	            obj_controller.menu=0;obj_controller.cooldown=8000;
	        }

	    }draw_set_halign(fa_left);
	}






	if (selected!=0) and (!instance_exists(selected)) then selected=0;



	if (popup>0) and (selected!=0) and (zoomed=0) and (sel_system_x+sel_system_y=0) and (diplomacy<=0) and (instance_exists(obj_fleet_select)){
	    var zm=1,tit="",mnz=0;
		var xx=__view_get( e__VW.XView, 0 )+0;
		var yy=__view_get( e__VW.YView, 0 )+0;
	    //if (fleet_minimized=0){
	    //    draw_set_color(c_black);
	    //    draw_rectangle(__view_get( e__VW.XView, 0 )+44,__view_get( e__VW.YView, 0 )+110,__view_get( e__VW.XView, 0 )+267,__view_get( e__VW.YView, 0 )+110+obj_fleet_select.void_hei,0);
	    //    draw_set_color(c_gray);
	    //    draw_rectangle(__view_get( e__VW.XView, 0 )+44,__view_get( e__VW.YView, 0 )+110,__view_get( e__VW.XView, 0 )+267,__view_get( e__VW.YView, 0 )+110+obj_fleet_select.void_hei,1);
	    //}
    	draw_set_color(c_gray);
    	obj_fleet_select.selection_window.inside_method = function(){
    		var mnz=0;
    		var xx = obj_fleet_select.selection_window.XX;
    		var yy = obj_fleet_select.selection_window.YY;
			draw_set_font(fnt_40k_14);
			var center_draw = xx + (obj_fleet_select.selection_window.width/2);
			var width = obj_fleet_select.selection_window.width;
			var height = obj_fleet_select.selection_window.height;
	    
		    // draw_text(view_xview[0]+46,view_yview[0]+117,"Title");
		    // draw_text(view_xview[0]+46,view_yview[0]+142,"1#2#3#4#5#6#7#8#9#10#11#1#13#14#15#16#17#18#19#20#21#22#23#24#25");    
	    
		    var type="capital",lines=0,posi=0,colu=1,x3=48,y3=60,escorts,frigates,capitals,ty=0,current_ship=0,current_fleet=0,name="",sal=0,selection_box,scale=1,void_h=122,shew,ship_health=0;
		    escorts=obj_fleet_select.escort;
		    frigates=obj_fleet_select.frigate;
		    capitals=obj_fleet_select.capital;
	    
		    current_fleet=instance_nearest(obj_fleet_select.x,obj_fleet_select.y,obj_p_fleet);
	    
		    if (escorts>0) then ty++;
		    if (frigates>0) then ty++;
		    if (capitals>0) then ty++;
	    	draw_set_halign(fa_center);
	    	var set = "capitol";
	    	var fleet_sel = "[X]";
		    if (!obj_fleet_select.fleet_all) then fleet_sel = "[ ]";

		    var fleet_all_click = false;
		    if (!obj_fleet_select.fleet_minimized){
    	    	if (point_and_click(draw_unit_buttons([xx+width-60, yy+40], fleet_sel,[1,1],c_red))){
    	    		obj_fleet_select.fleet_all = obj_fleet_select.fleet_all==1?0:1;
    	    		fleet_all_click=true;  		
    	    	}
    	    }
	    	draw_set_halign(fa_center);	    	
	    	var ship_type,current_ship, sel_set, full_id;
	    	if (obj_fleet_select.screen_expansion>0){
			    for(var j=0; j<(escorts+frigates+capitals); j++){
			    	draw_set_color(c_gray);
			        y3+=20;
			        if (y3>height-5) then break;
			        lines++;
			        posi++;
			        scale=1;
			        shew=1;
			        ship_health=100;
			        if (colu==1) then void_h=min(void_h+20,560);
		        
			        if (posi==1){
			            if (mnz=0) then draw_text(center_draw,yy+y3,string_hash_to_newline("=Capital Ships="));
			            y3+=20;
			            if (y3>height-50) then break;
			            set = "capitol";
			        }
	
			        if (posi==capitals+1) and (frigates>0){
			        	y3+=20;
			        	if (y3>height-50) then break;
			        	if (mnz=0) then draw_text(center_draw,yy+y3,string_hash_to_newline("=Frigates="));
			        	y3+=20;
			        	if (y3>height-50) then break;
	
			        	set = "frigate";
			        }
			        if (posi==capitals+frigates+1) and (escorts>0){
			        	y3+=20;
			        	if (y3>height-50) then break;
			        	if (mnz=0) then draw_text(center_draw,yy+y3,string_hash_to_newline("=Escorts="));
			        	y3+=20;
			        	if (y3>height-50) then break;
			        	set = "escort";
			        }
			        switch(set){
			        	case "capitol":
			        		ship_type = current_fleet.capital;
			        		current_ship=posi;
			        		ship_select = current_fleet.capital_sel[current_ship];
			        		full_id = current_fleet.capital_num[current_ship];
			        		break;
			        	case "frigate":
				        	ship_type = current_fleet.frigate;
				        	current_ship=posi-capitals;
				        	ship_select = current_fleet.frigate_sel[current_ship];
				        	full_id = current_fleet.frigate_num[current_ship];
				        	break;	        		
			        	case "escort":
				        	ship_type = current_fleet.escort;
			        		current_ship=posi-(capitals+frigates);
			        		ship_select = current_fleet.escort_sel[current_ship];
			        		full_id = current_fleet.escort_num[current_ship];
				        	break;					        	
			        }
			        if (fleet_all_click) then ship_select=obj_fleet_select.fleet_all;
		        
			        /*if (y3>670) and (posi<=escorts+frigates+capitals){
			            lines=1;
			            y3=30;
			            x3+=223;
			            posi++;
			            colu++;
			        }*/
		        
			        if (posi<=escorts+frigates+capitals){
			            name=ship_type[current_ship];
			            if (string_width(name)*scale>179){
			            	for (i=0;i<9;i++){
			            		if (string_width(name)*scale>179) then scale-=0.05;
			            	}
			            }
			            if (scr_hit(xx+10,yy+y3,xx+width-10,yy+y3+18)){
			                if (string_width(name)*scale>135){
			                	for (i=0;i<9;i++){
			                		if (string_width(name)*scale>135) then scale-=0.05;
			                	}
			                }
			                shew=2;
			            }
			            if (point_and_click([xx+10,yy+y3,xx+width-10,yy+y3+18])){
		                    if (!(obj_controller.fest_scheduled>0 && obj_controller.fest_sid==full_id)){
			                    if (ship_select==1){
			                        ship_select=0;
			                    }else {
			                        ship_select=1;
			                    }
		                	}
			            }
			            if (obj_ini.ship_maxhp[current_ship]>0){
			            	ship_health=round((obj_ini.ship_hp[current_ship]/obj_ini.ship_maxhp[current_ship])*100);
			            }
	
			            if (ship_select==0){
			            	selection_box="[ ]";
			            }else if (ship_select==1){ 
			            	selection_box="[x] ";
			            }
			            if (mnz==0){
			            	draw_text(xx+width-25,yy+y3,selection_box);
			            	if (shew==2) then draw_text(xx+width-60,yy+y3,$"{ship_health}%");
			            }
			            if (ship_health<=60) and (ship_health>40) then draw_set_color(c_yellow);
			            if (ship_health<=40) and (ship_health>20) then draw_set_color(c_orange);
			            if (ship_health<=20) then draw_set_color(c_red);
			            if (mnz=0) then draw_text_transformed(center_draw,yy+y3,name,scale,1,0);
			            draw_set_color(c_gray);
			        }
			        switch(set){
			        	case "capitol":
			        		current_fleet.capital_sel[current_ship] = ship_select;
			        		break;
			        	case "frigate":
				        	current_fleet.frigate_sel[current_ship] = ship_select;
				        	break;	        		
			        	case "escort":
				        	current_fleet.escort_sel[current_ship] = ship_select;
				        	break;					        	
			        }			        
			    }
	    			}
		    obj_fleet_select.currently_entered = point_in_rectangle(mouse_x,mouse_y,xx,yy, xx+width, yy+obj_fleet_select.selection_window.height);
    	}
		var xx=__view_get( e__VW.XView, 0 )+0;
		var yy=__view_get( e__VW.YView, 0 )+0;	    	
    	fleet_min_button = "-"
    	if (obj_fleet_select.fleet_minimized || obj_fleet_select.screen_expansion<20){
    		fleet_min_button = "+"
    		obj_fleet_select.selection_window.draw_cut(xx+60, yy+110, 0.35, 0.8, obj_fleet_select.screen_expansion*5);
    		if (obj_fleet_select.fleet_minimized && obj_fleet_select.screen_expansion>1){
    			obj_fleet_select.screen_expansion--;
    		} else if (!obj_fleet_select.fleet_minimized && obj_fleet_select.screen_expansion<20){
    			obj_fleet_select.screen_expansion++;
    		}
    	} else {
			obj_fleet_select.selection_window.draw(xx+60, yy+110, 0.35, 0.8);
    	}	    
    	xx = obj_fleet_select.selection_window.XX;
    	yy = obj_fleet_select.selection_window.YY;
    	var center_draw = xx + (obj_fleet_select.selection_window.width/2);
    	var width = obj_fleet_select.selection_window.width;
	    draw_set_halign(fa_center);
	    draw_text(center_draw,yy+50,string_hash_to_newline(string(global.chapter_name)+" Fleet"));
	    draw_set_halign(fa_left);
    
	    draw_set_color(c_gray);
	    //draw_rectangle(xx+18+obj_fleet_select.void_wid,yy+116,xx+36+obj_fleet_select.void_wid,yy+134,0);

	    draw_set_color(c_red);
    
	    draw_set_color(c_gray);
	    draw_line(xx+10,yy+75,xx+width-10,yy+75);	    	
	    if (point_and_click(draw_unit_buttons([xx+25,yy+40], fleet_min_button,[1,1],c_red))){
	    	obj_fleet_select.fleet_minimized = !obj_fleet_select.fleet_minimized;
	    	if (obj_fleet_select.fleet_minimized){
	    		obj_fleet_select.screen_expansion--;
	    		fleet_minimized=0;
	    	} else {
	    		obj_fleet_select.screen_expansion++;
	    		fleet_minimized=1;
	    	}
	    }	    	
    

	}
	var xx=__view_get( e__VW.XView, 0 )+0;
	var yy=__view_get( e__VW.YView, 0 )+0;
	if (zoomed == 0){

		if (scr_hit(xx+5,yy+10,xx+137,yy+38)){
		    var tx=0,ty=0,tool1="",tool2="",plu="";
	   		if (income_base>0) then plu="+";
	        tool1+=string("Base Income: {0}{1}", plu, income_base);
	        tool2+="Base Income: ";
		    if (obj_ini.fleet_type=1){
		        plu="";

		        if (income_home>0){
			        tool1+=string("#Fortress Monastery Bonus: +{1}", plu,income_home);
			        tool2+="#Fortress Monastery Bonus: ";
			    }
		        if (income_forge>0){
		        	tool1+=string("#Nearby Forge Worlds: +{0}",income_forge);
		        	tool2+="#Nearby Forge Worlds:";
		        }
		        if (income_agri>0){
		        	tool1+=string("#Nearby Agri Worlds: +{0}",income_agri);
		        	tool2+="#Nearby Agri Worlds:";
		        }
		    }
		    if (obj_ini.fleet_type!=1){
		        plu="";
		        if (income_home>0) then plu="+";
		        tool1+="#Battle Barge Trade: "+string(plu)+string(income_home);
		        tool2+="#Battle Barge Trade: ";
		    }
	        plu="";
	        if (income_recruiting>0) then plu="+";
	        if (income_recruiting!=0){
	        	tool1+=string("#Astartes Recruitment: {0}{1}",plu,income_recruiting);
	        	tool2+="#Astartes Recruitment:";}
	        plu="";
	        if (income_training>0) then plu="+";
	        if (income_training!=0){
	        	tool1+=string("#Specialist Training: {0}{1}",plu,income_training);
	        	tool2+="#Specialist Training:";
	        }
	        plu="";
	        if (income_fleet>0) then plu="+";
	        if (income_fleet!=0){
		        tool1+=string("#Fleet Maintenance: {0}{1}",plu,income_fleet);
		        tool2+="#Fleet Maintenance:";
	    	}
	        plu="";
	        if (income_tribute>0) then plu="+";
	        if (income_tribute!=0){
	        	tool1+=string("#Planet Tithes: {0}{1}",plu,income_tribute);
	        	tool2+="#Planet Tithes:";
	        }		    
	    
		    if (tool1!=""){
		    	tooltip_draw(tool1, xx+10, yy+42);
		    }
		}


		if (scr_hit(xx+153,yy+10,xx+221,yy+38)){
		    var  tx=0,ty=0,tool1="",tool2="",plu="";

		    var d,lines;d=0;lines=0;
		    for(var d=1; d<=20; d++){
		        if (loyal_num[d]>1) and (lines=0){
		            tool1+=string(loyal[d])+": -"+string(loyal_num[d])+"#";
		            tool2+=string(loyal[d])+": #";
		            lines++;
		        }
		        if (loyal_num[d]>1) and (lines>0){
		            tool1+=string(loyal[d])+": -"+string(loyal_num[d])+"#";
		            tool2+=string(loyal[d])+": #";
		            lines++;
		        }
		    }
	    
		    if (tool1="") then tool1="Loyalty";
	    
		    if (tool1!=""){
		        tooltip_draw(tool1, xx+150, yy+42);
		    }
		}


		if (scr_hit(xx+247,yy+10,xx+338,yy+38)){
		    var tx=0,ty=0,tool1="",tool2="",plu="";
		    tool1="Gene-Seed";
		    if (tool1!=""){
		        tooltip_draw(tool1, xx+249, yy+42);
		    }
		}

		if (scr_hit(xx+373,yy+10,xx+463,yy+38)){
		    var tx=0,ty=0,tool1="",tool2="",plu="";
		    tool1="Astartes#(Normal/Command)";
		    tool2="Astartes";
		    if (tool1!=""){
		        tooltip_draw(tool1, xx+373, yy+42);
		    }
		}
		if (menu == 0) and (diplomacy<=0){
			if (scr_hit(xx+1435,yy+40,xx+1580,yy+267)){
			    var tx=0,ty=0,tool1="",tool2="",plu="";
			    tool1=$"Turn :{obj_controller.turn}";
			    tool2="Astartes";
			    if (tool1!=""){
			    	tooltip_draw(tool1, xx+1480, yy+265);
			    }
			}
		}
	    if (point_in_rectangle(mouse_x, mouse_y, xx+3, yy+50, xx+67, yy+114)){
	        tooltip_draw(obj_controller.forge_string, xx+3,yy+114);
	    }		

		if (scr_hit(xx+813,yy+10,xx+960,yy+38)) and (penitent==1) {
		    var tx=0,ty=0,tool1="",tool2="",plu="",hei_bonus;
	    
		    var endb=0,endb2="";
		    endb=min(0,(((penitent_turn+1)*(penitent_turn+1))-512)*-1);
	    
		    if (obj_controller.blood_debt==1){
		        tool1="Blood Spilled: "+string(penitent_current);tool2="Blood Spilled: ";
		        tool1+="#Blood Debt: "+string(penitent_max);tool2+="#Blood Debt: ";
		        tool1+="#Decay Rate: "+string(endb);tool2+="#Decay Rate: ";
	        
		        tool1+="##Attacking enemies, Raiding enemies, and losing Astartes will lower your Chapter's Blood Debt.  Over #time it decays.  Bombarding enemies will prevent decay.";
		        hei_bonus=-20;
		    }
		    if (obj_controller.blood_debt=0){
		        tool1="Current Penitence: "+string(penitent_current);tool2="Current Penitence: ";
		        tool1+="#Required Penitence: "+string(penitent_max);tool2+="#Required Penitence: ";
		        // tool1+="#Each Turn: +1";tool2+="#Each Turn: ";
		        // tool1+="#  ";tool2+="#  ";
	        
		        tool1+="##Penitence will be gained slowly over time.  After the timer runs out your Chapter will no longer be#considered Penitent.";
		        hei_bonus=23;
		    }
	    
		    if (tool1!=""){
		        tooltip_draw(tool1, xx+813, yy+42)
		    }
		}

	}
	exit;


	if (mouse_x>=__view_get( e__VW.XView, 0 )+113) and (mouse_y>=__view_get( e__VW.YView, 0 )+4) and (mouse_x<__view_get( e__VW.XView, 0 )+185) and (mouse_y<__view_get( e__VW.YView, 0 )+19) and (zoomed=0){
	    var blurp,blurp2,lines,i;blurp="";blurp2="";lines=0;i=0;draw_set_halign(fa_left);
    
	    repeat(20){
	        i++;if (loyal_num[i]>1){
	            blurp+=string(loyal[i])+": -"+string(loyal_num[i])+"#";
	            blurp2+=string(loyal[i])+": #";
	            lines++;
	        }
	    }
    
	    if (lines>0){
	        var wi=183+93;
	        if (string_count("Irreverance",blurp)>0) then wi+=51;
        
	        draw_set_color(c_black);
	        draw_rectangle(__view_get( e__VW.XView, 0 )+113,__view_get( e__VW.YView, 0 )+24,__view_get( e__VW.XView, 0 )+wi,__view_get( e__VW.YView, 0 )+30+(lines*10),0);
	        draw_set_color(38144);
	        draw_rectangle(__view_get( e__VW.XView, 0 )+113,__view_get( e__VW.YView, 0 )+24,__view_get( e__VW.XView, 0 )+wi,__view_get( e__VW.YView, 0 )+30+(lines*10),1);
        
	        draw_set_font(fnt_info);
	        draw_text_transformed(__view_get( e__VW.XView, 0 )+24+93,__view_get( e__VW.YView, 0 )+26,string_hash_to_newline(string(blurp)),0.7,0.7,0);
	        draw_text_transformed(__view_get( e__VW.XView, 0 )+24.5+93,__view_get( e__VW.YView, 0 )+26,string_hash_to_newline(string(blurp2)),0.7,0.7,0);
	    }
	}


}
