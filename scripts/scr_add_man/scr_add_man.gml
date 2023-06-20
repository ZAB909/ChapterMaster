function scr_add_man(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10) {

	// argument0 = role
	// argument1 = company
	// argument2 = armorset
	// argument3 = weaponset
	// argument4 = gear
	// argument5 = exp
	// argument6 = name
	// argument7 = chaos
	// argument8 = gear provided?
	// argument9 = home, shipXY, or default
	// argument10 = mobility

	// That should be sufficient to add stuff in a highly modifiable fashion


	var i,good, wep1, wep2, gear, mobi, arm, e, missing;
	i=0;e=0;good=0;wep1="";wep2="";gear="";mobi="";arm="";missing=0;

	repeat(300){
	    i+=1;
	    if (good=0){
	        if (obj_ini.name[argument1,i]="") or (obj_ini.role[argument1,i]="") then good=i;
	    }
	}


	if (good!=0){
	    obj_ini.race[argument1,good]=1;
	    obj_ini.lid[argument1,good]=0;
    
	    if ((argument9="home") or (argument9="default")) and (obj_ini.fleet_type=1){
	        var bst;bst=0;
	        bst=instance_nearest(x,y,obj_star);
        
	        obj_ini.loc[argument1,good]=obj_ini.home_name;
	        if (bst.p_owner[4]=1) and (bst.planets>=4) then obj_ini.wid[argument1,good]=4;
	        if (bst.p_owner[3]=1) and (bst.planets>=3) then obj_ini.wid[argument1,good]=3;
	        if (bst.p_owner[2]=1) and (bst.planets>=2) then obj_ini.wid[argument1,good]=2;
	        if (bst.p_owner[1]=1) and (bst.planets>=1) then obj_ini.wid[argument1,good]=1;
	    }
    
	    if (string_count("ship",argument9)>0) or ((obj_ini.fleet_type!=1) and (argument9="default")){
	        var wop,loaded;loaded=0;
	        // with(obj_p_fleet){if (action!="") then instance_deactivate_object(id);}
        
        
        
	        /*repeat(10){
	            var good,i,f;good=0;i=0;f=0;
            
	            repeat(20){i+=1;
	                if (good=0){
	                    if (obj_ini.ship[i]!="") and (obj_ini.ship_carrying[i]<obj_ini.ship_capacity[i]){good=1;
	                        obj_ini.ship_carrying[i]+=1;obj_ini.lid[argument1,good]=shiyp;loaded=1;
	                        obj_ini.wid[argument1,good]=0;obj_ini.loc[argument1,good]=obj_ini.ship_location[i];
                        
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
	                        obj_ini.ship_carrying[f]+=1;obj_ini.lid[argument1,good]=f;loaded=1;
	                        obj_ini.wid[argument1,good]=0;obj_ini.loc[argument1,good]=obj_ini.ship_location[f];
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
	                        obj_ini.ship_carrying[f]+=1;obj_ini.lid[argument1,good]=f;loaded=1;
	                        obj_ini.wid[argument1,good]=0;obj_ini.loc[argument1,good]=obj_ini.ship_location[f];
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
	                        obj_ini.ship_carrying[f]+=1;obj_ini.lid[argument1,good]=f;loaded=1;
	                        obj_ini.wid[argument1,good]=0;obj_ini.loc[argument1,good]=obj_ini.ship_location[f];
	                    }
	                }
	            }
	        }
        
        
        
	        // wop=string_delete(argument9,0,4);
	        // wop2=real(wop);
	        /*obj_ini.lid[argument1,good]=wop2;
	        obj_ini.loc=obj_ini.ship_location[wop2];
	        obj_ini.wid[argument1,good]=0;*/
	    }
	    /*if (argument9="default") and (obj_ini.fleet_type!=1){// Need a more elaborate ship_carrying += here for the different types of units
	        var first,backup;first=0;backup=0;i=0;
	        repeat(30){i+=1;
	            if (obj_ini.ship_class[i]="Battle Barge") and (first=0) and (obj_ini.ship_capacity[i]>obj_ini.ship_carrying[i]) then first=i;
	            if (obj_ini.ship_class[i]="Strike Cruiser") and (backup=0) and (obj_ini.ship_capacity[i]>obj_ini.ship_carrying[i]) then backup=i;
	        }
	        if (first!=0){
	            obj_ini.lid[argument1,good]=first;obj_ini.loc[argument1,good]=obj_ini.ship_location[first];
	            obj_ini.wid[argument1,good]=0;obj_ini.ship_carrying[first]+=1;
	        }
	        if (first=0) and (backup!=0){
	            obj_ini.lid[argument1,good]=backup;obj_ini.loc[argument1,good]=obj_ini.ship_location[backup];
	            obj_ini.wid[argument1,good]=0;obj_ini.ship_carrying[backup]+=1;
	        }
	        if (first=0) and (backup=0){
	            obj_ini.lid[argument1,good]=0;obj_ini.loc[argument1,good]="";obj_ini.wid[argument1,good]=0;exit;
	        }
    
	    }*/
	    obj_ini.role[argument1,good]=argument0;
	    obj_ini.wep1[argument1,good]="";
	    obj_ini.wep2[argument1,good]="";
	    obj_ini.armor[argument1,good]="";
	    obj_ini.hp[argument1,good]=100;
	    obj_ini.chaos[argument1,good]=argument7;
	    obj_ini.experience[argument1,good]=argument5;
	    obj_ini.spe[argument1,good]="";
	    obj_ini.god[argument1,good]=0;
    
	    if (argument8=true){
	        if (argument0="Skitarii"){
	            obj_ini.wep1[argument1,good]="Hellgun";obj_ini.wep2[argument1,good]="";
	            obj_ini.armor[argument1,good]="Skitarii Armor";obj_ini.experience[argument1,good]=10;
	            obj_ini.hp[argument1,good]=40;
	            obj_ini.race[argument1,good]=3;
	        }
	        if (argument0="Techpriest"){
	            obj_ini.wep1[argument1,good]="Power Weapon";obj_ini.wep2[argument1,good]="Conversion Beam Projector";
	            obj_ini.armor[argument1,good]="Dragon Scales";obj_ini.gear[argument1,good]="Servo Arms";obj_ini.experience[argument1,good]=100;
	            obj_ini.hp[argument1,good]=50;
	            obj_ini.race[argument1,good]=3;
	        }
	        if (argument0="Ranger"){
	            obj_ini.wep1[argument1,good]="Ranger Long Rifle";obj_ini.wep2[argument1,good]="Shuriken Pistol";
	            obj_ini.armor[argument1,good]="";obj_ini.experience[argument1,good]=80;
	            obj_ini.hp[argument1,good]=30;
	            obj_ini.race[argument1,good]=6;
	        }
	        if (argument0="Crusader"){
	            obj_ini.wep1[argument1,good]="Power Sword";obj_ini.armor[argument1,good]="Power Armor";
	            obj_ini.gear[argument1,good]="Storm Shield";obj_ini.experience[argument1,good]=10;
	            obj_ini.hp[argument1,good]=30;
	            obj_ini.race[argument1,good]=4;
	        }
	        if (argument0="Sister of Battle"){
	            obj_ini.wep1[argument1,good]="Bolter";obj_ini.wep2[argument1,good]="Sarissa";
	            obj_ini.armor[argument1,good]="Power Armor";obj_ini.experience[argument1,good]=60;
	            obj_ini.hp[argument1,good]=40;obj_ini.race[argument1,good]=5;
	        }
	        if (argument0="Sister Hospitaler"){
	            obj_ini.wep1[argument1,good]="Bolter";obj_ini.wep2[argument1,good]="Sarissa";
	            obj_ini.armor[argument1,good]="Power Armor";obj_ini.experience[argument1,good]=100;
	            obj_ini.gear[argument1,good]="Sororitas Medkit";
	            obj_ini.hp[argument1,good]=40;obj_ini.race[argument1,good]=5;
	        }
	        if (argument0="Ork Sniper"){
	            obj_ini.wep1[argument1,good]="Sniper Rifle";obj_ini.wep2[argument1,good]="Choppa";
	            obj_ini.armor[argument1,good]="";obj_ini.experience[argument1,good]=20;
	            obj_ini.hp[argument1,good]=45;
	            obj_ini.race[argument1,good]=7;
	        }
	        if (argument0="Flash Git"){
	            obj_ini.wep1[argument1,good]="Snazzgun";obj_ini.wep2[argument1,good]="Choppa";
	            obj_ini.armor[argument1,good]="Ork Armor";obj_ini.experience[argument1,good]=40;
	            obj_ini.hp[argument1,good]=65;
	            obj_ini.race[argument1,good]=7;
	        }
	    }
    
    
    
    
    
	    // show_message(string(argument0)+" was added to "+string(argument1)+"."+string(good));
    
    
    
    
	    obj_ini.age[argument1,good]=((obj_controller.millenium*1000)+obj_controller.year);// Age here
    
	    if (argument6="") or (argument6="imperial") then obj_ini.name[argument1,good]=scr_marine_name();
	    if (argument6!="") and (argument6!="imperial") then obj_ini.name[argument1,good]=argument6;
	    if (argument0="Ranger") then obj_ini.name[argument1,good]=scr_eldar_name(2);
	    if (argument0="Ork Sniper") or (argument0="Flash Git") then obj_ini.name[argument1,good]=scr_ork_name();
	    if (argument0="Sister of Battle") or (argument0="Sister Hospitaler") then obj_ini.name[argument1,good]=scr_imperial_name(2);
    
    
	    // Weapons
	    if (argument3=obj_ini.role[100,12]){wep2=obj_ini.wep2[100,12];wep1=obj_ini.wep1[100,12];arm=obj_ini.armor[100,12];}
    
	    var good1,good2,good3,good4;
	    good1=0;good2=0;good3=0;good4=0;
    
	    if (argument8=false){
	        e=0;
	        if (wep1!="") then repeat(100){// First Weapon
	            e+=1;
	            if (e<=100){
	                if (obj_ini.equipment[e]=wep1){
	                    obj_ini.equipment_number[e]-=1;obj_ini.wep1[argument1,good]=obj_ini.equipment[e];
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
	                    obj_ini.equipment_number[e]-=1;obj_ini.wep2[argument1,good]=obj_ini.equipment[e];
	                    if (obj_ini.equipment_number[e]=0){obj_ini.equipment[e]="";obj_ini.equipment_type[e]="";}
	                    e=1000;
	                }
	            }
	        }
	        e=0;
        
	        // show_message(arm);
        
	        if (arm!="") then repeat(100){// Armor
	            e+=1;
	            if (e<=100){
	                if (obj_ini.equipment[e]=arm){
	                    obj_ini.equipment_number[e]-=1;obj_ini.armor[argument1,good]=arm;
	                    if (obj_ini.equipment_number[e]=0){obj_ini.equipment[e]="";obj_ini.equipment_type[e]="";}
	                    e=1000;
	                }
	            }
	        }
        
	        // show_message(obj_ini.armor[argument1,good]);
        
	        e=0;
	        if (argument4!="") then repeat(100){// Gear
	            e+=1;
	            if (e<=100){
	                if (obj_ini.equipment[e]=argument4){
	                    obj_ini.equipment_number[e]-=1;obj_ini.gear[argument1,good]=argument4;
	                    if (obj_ini.equipment_number[e]=0){obj_ini.equipment[e]="";obj_ini.equipment_type[e]="";}
	                    e=1000;
	                }
	            }
	        }
	        e=0;
	        if (argument10!="") then repeat(100){// Mobility
	            e+=1;
	            if (e<=100){
	                if (obj_ini.equipment[e]=argument10){
	                    obj_ini.equipment_number[e]-=1;obj_ini.mobi[argument1,good]=argument10;
	                    if (obj_ini.equipment_number[e]=0){obj_ini.equipment[e]="";obj_ini.equipment_type[e]="";}
	                    e=1000;
	                }
	            }
	        }
        
	        if (obj_ini.wep1[argument1,good]!=wep1) and (wep1!="") then missing=1;
	        if (obj_ini.wep2[argument1,good]!=wep2) and (wep2!="") then missing=1;
	        if (obj_ini.armor[argument1,good]!=arm) and (arm!="") then missing=1;
	        if (obj_ini.gear[argument1,good]!=argument4) and (argument4!="") then missing=1;
	        if (obj_ini.mobi[argument1,good]!=argument10) and (argument10!="") then missing=1;
        
	        if (argument3=obj_ini.role[100,12]) and (argument7>=13) then obj_ini.god[argument1,good]=2;// Khorne!!!1 XDDDDDDD
        
	        if (missing=1) and (argument0="Scout"){
	            if (string_count("has joined the 10th Company",obj_turn_end.alert_text[obj_turn_end.alerts])=1){
	               scr_alert("red","recruiting","Not enough "+string(obj_ini.role[100,12])+" equipment in the armory!",0,0);
	            }
	        }
	    }
    
    
	    if (argument0!="Skitarii") and (argument0!="Techpriest") and (argument0!="Ranger") and (argument0!="Crusader") and (argument0!="Sister of Battle"){
	        if (argument0!="Sister Hospitaler") and (argument0!="Ork Sniper") and (argument0!="Flash Git") then marines+=1;
	    }
    
    
	    with(obj_ini){scr_company_order(argument1);}
	}


}
