
function scr_add_man(man_role, target_company, choice_armour, choice_weapons, choice_gear, spawn_exp, spawn_name, corruption, other_gear, home_spot, mobility_items) {

	//all of this will in time be irrelevant as calling new TTRPG_stats() and then calling the correct methods within the new itme will replace this but for
	//now its easy enough to use this as the structs continue to be built.
	// other_gear = gear provided?
	// home_spot = home, shipXY, or default

	// TODO refactor repeats

	// That should be sufficient to add stuff in a highly modifiable fashion


	var non_marine_roles = ["Skitarii","Techpriest","Ranger","Crusader","Sister of Battle","Sister Hospitaler", "Ork Sniper", "Flash Git"]
	var i,good, wep1, wep2, gear, mobi, arm, e, missing;
	i=0;e=0;good=0;wep1="";wep2="";gear="";mobi="";arm="";missing=0;

	repeat(300){
	    i+=1;
	    if (good=0){
	        if (obj_ini.name[target_company,i]="") or (obj_ini.role[target_company,i]="") then good=i;
	    }
	}


	if (good!=0){
	    obj_ini.race[target_company][good]=1;
	    obj_ini.lid[target_company][good]=0;
    
	    if ((home_spot="home") or (home_spot="default")) and (obj_ini.fleet_type=1){
	        var bst;bst=0;
	        bst=instance_nearest(x,y,obj_star);
        
	        obj_ini.loc[target_company][good]=obj_ini.home_name;
	        if (bst.p_owner[4]=1) and (bst.planets>=4) then obj_ini.wid[target_company][good]=4;
	        if (bst.p_owner[3]=1) and (bst.planets>=3) then obj_ini.wid[target_company][good]=3;
	        if (bst.p_owner[2]=1) and (bst.planets>=2) then obj_ini.wid[target_company][good]=2;
	        if (bst.p_owner[1]=1) and (bst.planets>=1) then obj_ini.wid[target_company][good]=1;
	    }
    
	    if (string_count("ship",home_spot)>0) or ((obj_ini.fleet_type!=1) and (home_spot="default")){
	        var wop,loaded;loaded=0;
	        // with(obj_p_fleet){if (action!="") then instance_deactivate_object(id);}
        
        
        
	        /*repeat(10){
	            var good,i,f;good=0;i=0;f=0;
            
	            repeat(20){i+=1;
	                if (good=0){
	                    if (obj_ini.ship[i]!="") and (obj_ini.ship_carrying[i]<obj_ini.ship_capacity[i]){good=1;
	                        obj_ini.ship_carrying[i]+=1;obj_ini.lid[target_company][good]=shiyp;loaded=1;
	                        obj_ini.wid[target_company][good]=0;obj_ini.loc[target_company][good]=obj_ini.ship_location[i];
                        
	                    }
	                }
            
	            }
        
	        }*/
        
        
	        instance_activate_object(obj_p_fleet);
	        wop=instance_nearest(x,y,obj_p_fleet);
        
	        if (wop.capital_number>0) and (loaded=0){
	            var i,f;i=0;f=0;
	            repeat(wop.capital_number){
	                i+=1;
	                if (loaded=0){
	                    f=wop.capital_num[i];
	                    if (obj_ini.ship_capacity[f]>obj_ini.ship_carrying[f]){
	                        obj_ini.ship_carrying[f]+=1;obj_ini.lid[target_company][good]=f;loaded=1;
	                        obj_ini.wid[target_company][good]=0;obj_ini.loc[target_company][good]=obj_ini.ship_location[f];
	                    }
	                }
	            }
	        }
	        if (wop.frigate_number>0) and (loaded=0){
	            var i,f;i=0;f=0;
	            repeat(wop.frigate_number){
	                i+=1;
	                if (loaded=0){
	                    f=wop.frigate_num[i];
	                    if (obj_ini.ship_capacity[f]>obj_ini.ship_carrying[f]){
	                        obj_ini.ship_carrying[f]+=1;obj_ini.lid[target_company][good]=f;loaded=1;
	                        obj_ini.wid[target_company][good]=0;obj_ini.loc[target_company][good]=obj_ini.ship_location[f];
	                    }
	                }
	            }
	        }
	        if (wop.escort_number>0) and (loaded=0){
	            var i,f;i=0;f=0;
	            repeat(wop.escort_number){
	                i+=1;
	                if (loaded=0){
	                    f=wop.escort_num[i];
	                    if (obj_ini.ship_capacity[f]>obj_ini.ship_carrying[f]){
	                        obj_ini.ship_carrying[f]+=1;obj_ini.lid[target_company][good]=f;loaded=1;
	                        obj_ini.wid[target_company][good]=0;obj_ini.loc[target_company][good]=obj_ini.ship_location[f];
	                    }
	                }
	            }
	        }
	    }
	    obj_ini.role[target_company][good]=man_role;
	    obj_ini.wep1[target_company][good]="";
	    obj_ini.wep2[target_company][good]="";
	    obj_ini.armour[target_company][good]="";
	    obj_ini.chaos[target_company][good]=corruption;
	    obj_ini.experience[target_company][good]=spawn_exp;
	    obj_ini.spe[target_company][good]="";
	    obj_ini.god[target_company][good]=0;
		obj_ini.TTRPG[target_company, good] = {};
    
	    if (other_gear=true){
			switch(man_role){
	        case "Skitarii":
	            obj_ini.wep1[target_company][good]="Hellgun";obj_ini.wep2[target_company][good]="";
	            obj_ini.armour[target_company][good]="Skitarii Armour";obj_ini.experience[target_company][good]=10;
	            obj_ini.race[target_company][good]=3;
				obj_ini.TTRPG[target_company, good] = new TTRPG_stats("mechanicus", target_company, good, "skitarii");
				break;
	        case "Techpriest":
	            obj_ini.wep1[target_company][good]="Power Weapon";obj_ini.wep2[target_company][good]="Conversion Beam Projector";
	            obj_ini.armour[target_company][good]="Dragon Scales";obj_ini.gear[target_company][good]="Servo Arms";obj_ini.experience[target_company][good]=100;
	            obj_ini.race[target_company][good]=3;
				obj_ini.TTRPG[target_company, good] = new TTRPG_stats("mechanicus", target_company, good, "tech_priest");
				break
	        case "Ranger":
	            obj_ini.wep1[target_company][good]="Ranger Long Rifle";obj_ini.wep2[target_company][good]="Shuriken Pistol";
	            obj_ini.armour[target_company][good]="";obj_ini.experience[target_company][good]=80;
	            obj_ini.race[target_company][good]=6
				obj_ini.TTRPG[target_company, good] = new TTRPG_stats("mechanicus", target_company, good, "skitarii_ranger");
				break;
	         case "Crusader":
	            obj_ini.wep1[target_company][good]="Power Sword";obj_ini.armuor[target_company][good]="Power Armour";
	            obj_ini.gear[target_company][good]="Storm Shield";obj_ini.experience[target_company][good]=10;
	            obj_ini.race[target_company][good]=4;
				obj_ini.TTRPG[target_company, good] = new TTRPG_stats("inquisition", target_company, good, "inquisition_crusader");				
				break;
	        case "Sister of Battle":
	            obj_ini.wep1[target_company][good]="Bolter";obj_ini.wep2[target_company][good]="Sarissa";
	            obj_ini.armour[target_company][good]="Power Armour";obj_ini.experience[target_company][good]=60;
	            obj_ini.race[target_company][good]=5;
				obj_ini.TTRPG[target_company, good] = new TTRPG_stats("adeptus_sororitas", target_company, good, "sister_of_battle");
				break;
	        case "Sister Hospitaler":
	            obj_ini.wep1[target_company][good]="Bolter";obj_ini.wep2[target_company][good]="Sarissa";
	            obj_ini.armour[target_company][good]="Power Armour";obj_ini.experience[target_company][good]=100;
	            obj_ini.gear[target_company][good]="Sororitas Medkit";
	            obj_ini.hp[target_company][good]=40;obj_ini.race[target_company][good]=5;
				obj_ini.TTRPG[target_company, good] = new TTRPG_stats("adeptus_sororitas", target_company, good, "sister_hospitaler");
				break;
	        case "Ork Sniper":
	            obj_ini.wep1[target_company][good]="Sniper Rifle";obj_ini.wep2[target_company][good]="Choppa";
	            obj_ini.armour[target_company][good]="";obj_ini.experience[target_company][good]=20;
	            obj_ini.hp[target_company][good]=45;
	            obj_ini.race[target_company][good]=7;
				obj_ini.TTRPG[target_company, good] = new TTRPG_stats("ork", target_company, good, "ork_Sniper");
				
				break;
	        
	        case "Flash Git":
	            obj_ini.wep1[target_company][good]="Snazzgun";obj_ini.wep2[target_company][good]="Choppa";
	            obj_ini.armour[target_company][good]="Ork Armour";obj_ini.experience[target_company][good]=40;
	            obj_ini.hp[target_company][good]=65;
	            obj_ini.race[target_company][good]=7;
				obj_ini.TTRPG[target_company, good] = new TTRPG_stats("ork", target_company, good, "flash_git");
				break;
			}
	    }
    

	    obj_ini.age[target_company][good]=((obj_controller.millenium*1000)+obj_controller.year);// Age here
    
	    if (spawn_name="") or (spawn_name="imperial") then obj_ini.name[target_company][good]=scr_marine_name();
	    if (spawn_name!="") and (spawn_name!="imperial") then obj_ini.name[target_company][good]=spawn_name;
	    if (man_role="Ranger") then obj_ini.name[target_company][good]=scr_eldar_name(2);
	    if (man_role="Ork Sniper") or (man_role="Flash Git") then obj_ini.name[target_company][good]=scr_ork_name();
	    if (man_role="Sister of Battle") or (man_role="Sister Hospitaler") then obj_ini.name[target_company][good]=scr_imperial_name(2);
    
    
	    // Weapons
	    if (choice_weapons=obj_ini.role[100][12]){wep2=obj_ini.wep2[100,12];wep1=obj_ini.wep1[100,12];arm=obj_ini.armour[100,12];}
    
	    var good1,good2,good3,good4;
	    good1=0;good2=0;good3=0;good4=0;
    
	    if (other_gear=false){
	        e=0;
	        if (wep1!="") then repeat(100){// First Weapon
	            e+=1;
	            if (e<=100){
	                if (obj_ini.equipment[e]=wep1){
	                    obj_ini.equipment_number[e]-=1;obj_ini.wep1[target_company][good]=obj_ini.equipment[e];
	                    if (obj_ini.equipment_number[e]=0){obj_ini.equipment[e]="";obj_ini.equipment_type[e]="";}
	                    e=1000;
	                }
	            }
	        }
	        e=0;
	        if (wep2!="") then repeat(100){// Second Weapon
	            e+=1;
	            if (e<=100){
	                if (obj_ini.equipment[e]=wep2){
	                    obj_ini.equipment_number[e]-=1;obj_ini.wep2[target_company][good]=obj_ini.equipment[e];
	                    if (obj_ini.equipment_number[e]=0){obj_ini.equipment[e]="";obj_ini.equipment_type[e]="";}
	                    e=1000;
	                }
	            }
	        }
	        e=0;
        
	        // show_message(arm);
        
	        if (arm!="") then repeat(100){// Armour
	            e+=1;
	            if (e<=100){
	                if (obj_ini.equipment[e]=arm){
	                    obj_ini.equipment_number[e]-=1;obj_ini.armour[target_company][good]=arm;
	                    if (obj_ini.equipment_number[e]=0){obj_ini.equipment[e]="";obj_ini.equipment_type[e]="";}
	                    e=1000;
	                }
	            }
	        }
        
	        // show_message(obj_ini.armour[target_company][good]);
        
	        e=0;
	        if (choice_gear!="") then repeat(100){// Gear
	            e+=1;
	            if (e<=100){
	                if (obj_ini.equipment[e]=choice_gear){
	                    obj_ini.equipment_number[e]-=1;obj_ini.gear[target_company][good]=choice_gear;
	                    if (obj_ini.equipment_number[e]=0){obj_ini.equipment[e]="";obj_ini.equipment_type[e]="";}
	                    e=1000;
	                }
	            }
	        }
	        e=0;
	        if (mobility_items!="") then repeat(100){// Mobility
	            e+=1;
	            if (e<=100){
	                if (obj_ini.equipment[e]=mobility_items){
	                    obj_ini.equipment_number[e]-=1;obj_ini.mobi[target_company][good]=mobility_items;
	                    if (obj_ini.equipment_number[e]=0){obj_ini.equipment[e]="";obj_ini.equipment_type[e]="";}
	                    e=1000;
	                }
	            }
	        }
        
	        if (obj_ini.wep1[target_company][good]!=wep1) and (wep1!="") then missing=1;
	        if (obj_ini.wep2[target_company][good]!=wep2) and (wep2!="") then missing=1;
	        if (obj_ini.armour[target_company][good]!=arm) and (arm!="") then missing=1;
	        if (obj_ini.gear[target_company][good]!=choice_gear) and (choice_gear!="") then missing=1;
	        if (obj_ini.mobi[target_company][good]!=mobility_items) and (mobility_items!="") then missing=1;
        
	        if (choice_weapons=obj_ini.role[100][12]) and (corruption>=13) then obj_ini.god[target_company][good]=2;// Khorne!!!1 XDDDDDDD
        
	        if (missing=1) and (argument0="Scout"){
	            if (string_count("has joined the X Company",obj_turn_end.alert_text[obj_turn_end.alerts])=1){

	               scr_alert("red","recruiting","Not enough "+string(obj_ini.role[100][12])+" equipment in the armoury!",0,0);
	            }
	        }
	    }
    
    if (!array_contains(non_marine_roles,man_role)){
		obj_ini.TTRPG[target_company, good] = new TTRPG_stats("chapter", target_company, good);
		marines+=1;
		}    
	    with(obj_ini){scr_company_order(target_company);}
	}

}
