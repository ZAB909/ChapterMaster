function scr_weapons_equip() {

	// gets the weapons for the particular slot
	// dude=6 is dreadnought I think

	var tc,tb,dude;
	tc=0;tb=0;dude=0;

	var i=-1;
	repeat(50){i+=1;item_name[i]="";}

	if (instance_exists(obj_controller)) and (instance_exists(obj_popup)) and (!instance_exists(obj_mass_equip)){
	    tc=target_comp;
	    tb=tab;
	    dude=vehicle_equipment; // This is for equipping the selected marines in management

	}
	if (instance_exists(obj_creation)){
	    tc=target_gear;tb=tab;
	    dude=obj_creation_popup.type-100;
	}
	if (instance_exists(obj_mass_equip)){
	    // tc=tab;tb=1;
	    tb=tab;tc=tab;
	    dude=obj_controller.settings;
	}

	if (dude<50) and (dude!=6) then dude=1

// dude=1 for normal infantry gear
// dude=6 for dread
// dude=50 for Land Raider
// dude=51 for Rhino
// dude=52 for Predator
// dude=53 for Land Speeder
// dude=54 for Whirlwind
	var equip_data;
	if (tc<3) and (dude=1){
		if(tb=1){ // Infantry Ranged
			item_name[1]="(None)";
			item_name[2]="(any)";
			var valid=3;
			for (i=1;i<array_length(obj_ini.equipment);i++){
				equip_data=gear_weapon_data("weapon",obj_ini.equipment[i],"all", false, "standard");
				if (is_struct(equip_data) && obj_ini.equipment_number[i]>0){
					if (equip_data.range>1.1){
						item_name[valid]=equip_data.name;
						valid++;
					}
				}
			}
		}
	
		//if (tb=2) and (!instance_exists(obj_creation)) and (!instance_exists(obj_controller)){ // Infantry Melee
		if (tb=2){
			item_name[1]="(None)";
			item_name[1]="(None)";
			item_name[2]="(any)";
			var valid=3;	
			for (i=1;i<array_length(obj_ini.equipment);i++){
				equip_data=gear_weapon_data("weapon",obj_ini.equipment[i],"all", false, "standard");
				if (is_struct(equip_data) && obj_ini.equipment_number[i]>0){
					if (equip_data.range<=1.1){
						item_name[valid]=equip_data.name;
						valid++;
					}
				}
			}
			if (instance_exists(obj_mass_equip)){
				item_name[valid]="Company Standard";
				valid++;
			}		
		}
	}

	if (tc<3) and (tb=1) and (dude=6){var i=0; // Dreadnought Ranged
	    i+=1;item_name[i]="(None)";
      i+=1;item_name[i]="Assault Cannon";
	    i+=1;item_name[i]="Missile Launcher";
	    i+=1;item_name[i]="Multi-Melta";
			i+=1;item_name[i]="Autocannon";
			i+=1;item_name[i]="Twin Linked Heavy Bolter";
			i+=1;item_name[i]="Twin Linked Lascannon";
			i+=1;item_name[i]="Twin Linked Bolters";
			i+=1;item_name[i]="Inferno Cannon";
	}

	if (tc<3) and (tb=2) and (dude=6){var i;i=0; // Dreadnought Melee
			if (!instance_exists(obj_creation)) and (!instance_exists(obj_controller)){i+=1;item_name[i]="(None)";}
					i+=1;item_name[i]="Close Combat Weapon";
	}

	if (tc=1) and (tb=1) and (dude=50){var i;i=0; // Land Raider Regular Front Weapon
	    i+=1;item_name[i]="(None)";
			i+=1;item_name[i]="Twin Linked Heavy Bolter Mount";
			i+=1;item_name[i]="Twin Linked Lascannon Mount";
			i+=1;item_name[i]="Twin Linked Assault Cannon Mount";
			i+=1;item_name[i]="Whirlwind Missiles";
	}

	if (tc=1) and (tb=2) and (dude=50){var i;i=0; // Land Raider Relic Front Weapon
			i+=1;item_name[i]="(None)";
			//i+=1;item_name[i]="Thunderfire Cannon Mount";
			i+=1;item_name[i]="Twin Linked Lascannon Mount";
			i+=1;item_name[i]="Reaper Autocannon Mount";
			//i+=1;item_name[i]="Twin Linked Helfrost Cannon Mount";
			//i+=1;item_name[i]="Graviton Cannon Mount";
	}

	if (tc=2) and (tb=1) and (dude=50){var i;i=0; // Land Raider Regular Sponsons
			i+=1;item_name[i]="(None)";
			i+=1;item_name[i]="Twin Linked Lascannon Sponsons";
			i+=1;item_name[i]="Hurricane Bolter Sponsons";
			i+=1;item_name[i]="Flamestorm Cannon Sponsons";
	}

	if (tc=2) and (tb=2) and (dude=50){var i;i=0; // Land Raider Relic Sponsons
			i+=1;item_name[i]="(None)";
			i+=1;item_name[i]="Quad Linked Heavy Bolter Sponsons";
			i+=1;item_name[i]="Twin Linked Heavy Flamer Sponsons";
			i+=1;item_name[i]="Twin Linked Multi-Melta Sponsons";
			i+=1;item_name[i]="Twin Linked Volkite Culverin Sponsons";
	}

	if (tc=3) and (tb=1) and (dude=50){var i;i=0; // Land Raider Pintle
			i+=1;item_name[i]="(None)";
			i+=1;item_name[i]="Bolter";
			i+=1;item_name[i]="Combiflamer";
			i+=1;item_name[i]="Twin Linked Bolters";
			i+=1;item_name[i]="Storm Bolter";
			i+=1;item_name[i]="HK Missile";
	}

	if (tc<3) and (tb=1) and (dude=51){var i;i=0; // Rhino Weapons
	    i+=1;item_name[i]="(None)";
		  i+=1;item_name[i]="Bolter";
			i+=1;item_name[i]="Combiflamer";
			i+=1;item_name[i]="Twin Linked Bolters";
			i+=1;item_name[i]="Storm Bolter";
			i+=1;item_name[i]="HK Missile";
	}

	if (tc=1) and (tb=1) and (dude=52){var i;i=0; // Predator Turret
			i+=1;item_name[i]="(None)";
			i+=1;item_name[i]="Autocannon Turret";
			i+=1;item_name[i]="Twin Linked Lascannon Turret";
			i+=1;item_name[i]="Flamestorm Cannon Turret";
			i+=1;item_name[i]="Twin Linked Assault Cannon Turret";
			i+=1;item_name[i]="Magna-Melta Turret";
			i+=1;item_name[i]="Plasma Destroyer Turret";
			i+=1;item_name[i]="Heavy Conversion Beamer Turret";
			i+=1;item_name[i]="Neutron Blaster Turret";
			i+=1;item_name[i]="Volkite Saker Turret";
			//i+=1;item_name[i]="Graviton Cannon Turret";
	}
	if (tc=2) and (tb=1) and (dude=52){var i;i=0; // Predator Sponsons
			i+=1;item_name[i]="(None)";
			i+=1;item_name[i]="Heavy Bolter Sponsons";
			i+=1;item_name[i]="Lascannon Sponsons";
			i+=1;item_name[i]="Heavy Flamer Sponsons";
			i+=1;item_name[i]="Volkite Culverin Sponsons";
	}
	if (tc=3) and (tb=1) and (dude=52){var i;i=0; // Predator Pintle
			i+=1;item_name[i]="(None)";
			i+=1;item_name[i]="Bolter";
			i+=1;item_name[i]="Combiflamer";
			i+=1;item_name[i]="Twin Linked Bolters";
			i+=1;item_name[i]="Storm Bolter";
			i+=1;item_name[i]="HK Missile";
	}
	if (tc=1) and (tb=1) and (dude=53){var i;i=0; // Land Speeder Primary
			i+=1;item_name[i]="(None)";
	    i+=1;item_name[i]="Multi-Melta";
			i+=1;item_name[i]="Heavy Bolter";
	}

	if (tc=2) and (tb=1) and (dude=53){var i;i=0; // Land Speeder Secondary
			i+=1;item_name[i]="(None)";
	    i+=1;item_name[i]="Assault Cannon";
			i+=1;item_name[i]="Heavy Flamer";
	}

	if (tc=1) and (tb=1) and (dude=54){var i;i=0; // Whirlwind Missiles
			i+=1;item_name[i]="(None)";
	    i+=1;item_name[i]="Whirlwind Missiles";
	}

	if (tc=2) and (tb=1) and (dude=54){var i;i=0; // Whirlwind Pintle
		i+=1;item_name[i]="(None)";
		i+=1;item_name[i]="Bolter";
		i+=1;item_name[i]="Combiflamer";
		i+=1;item_name[i]="Twin Linked Bolters";
		i+=1;item_name[i]="Storm Bolter";
		i+=1;item_name[i]="HK Missile";
	}

	if (tc=4) and (tb=1) and ((dude=50) or (dude=51) or (dude=52) or (dude=54)){var i=0; // Tank Upgrade
			i+=1;item_name[i]="(None)";
	    i+=1;item_name[i]="Armoured Ceramite";
	    i+=1;item_name[i]="Artificer Hull";
	    i+=1;item_name[i]="Heavy Armour";
			if dude!=50{i+=1;item_name[i]="Lucifer Pattern Engine";} //not available for Land Raiders
	}
	if (tc=5) and (tb=1) and ((dude=50) or (dude=51) or (dude=52) or (dude=54)){var i;i=0; // Tank Accessory
			i+=1;item_name[i]="(None)";
	    i+=1;item_name[i]="Dozer Blades";
	    i+=1;item_name[i]="Searchlight";
	    i+=1;item_name[i]="Smoke Launchers";
	}

	if (tc<3){
	    if (instance_exists(obj_popup)){
	        if (obj_popup.type=6) and (obj_popup.master_crafted=1){
	            var e;e=0;
	            repeat(40){e+=1;
	                if (item_name[e]!="(None") and (item_name[e]!="") and (string_count("Master Crafted",item_name[e])=0){
	                    item_name[e]="Master Crafted "+string(item_name[e]);
	                }
	            }
	        }
	        if (obj_popup.type=6) and (obj_popup.master_crafted=0){
	            var e;e=0;
	            repeat(40){e+=1;
	                if (item_name[e]!="(None") and (item_name[e]!="") and (string_count("Master Crafted",item_name[e])>0){
	                    item_name[e]=string_replace(item_name[e],"Master Crafted ","");
	                }
	            }
	        }
	    }
	}


	if (tc=3) and (dude=1){ // dude=1 for normal infantry gear
	    var i=0;

	    if (!instance_exists(obj_creation)) and (!instance_exists(obj_mass_equip)){
			item_name[1]="(None)";
			item_name[2]="(any)";
			var valid=3;		
			for (i=1;i<array_length(obj_ini.equipment);i++){
				equip_data=gear_weapon_data("armour",obj_ini.equipment[i],"all", false, "standard");
				if (is_struct(equip_data) && obj_ini.equipment_number[i]>0){
					item_name[valid]=equip_data.name;
					valid++;
				}
			}
	    }

	    if (instance_exists(obj_creation)) or (instance_exists(obj_mass_equip)){
	    	var valid=1
	        var bub=0;
	        if (instance_exists(obj_creation)){if (type=112) then bub=1;}
	        if (instance_exists(obj_mass_equip)){if (obj_controller.settings=12) then bub=1;}
	        item_name[valid]="Power Armour";
	        valid++;
	        item_name[valid]="Terminator Armour";
	        valid++;
	    }

	    else i+=1;

	    // var bad;bad=0;if (instance_exists(obj_creation_popup)){if ((obj_creation_popup.type-100)!=6) then bad=1;}
	    // if (bad=0){item_name[i]="Dreadnought";}
	}
	if (tc=4) and (dude=1){ // dude=1 for normal infantry gear
		item_name[1]="(None)";
		item_name[2]="(any)";
		var valid=3;		
		for (i=1;i<array_length(obj_ini.equipment);i++){
			equip_data=gear_weapon_data("gear",obj_ini.equipment[i],"all", false, "standard");
			if (is_struct(equip_data) && obj_ini.equipment_number[i]>0){
				item_name[valid]=equip_data.name;
				valid++;
			}
		}
	}
	if (tc=5) and (dude=1){ // dude=1 for normal infantry gear
		item_name[1]="(None)";
		item_name[2]="(any)";
		var valid=3;		
		for (i=1;i<array_length(obj_ini.equipment);i++){
			equip_data=gear_weapon_data("mobility",obj_ini.equipment[i],"all", false, "standard");
			if (is_struct(equip_data) && obj_ini.equipment_number[i]>0){
				item_name[valid]=equip_data.name;
				valid++;
			}
		}
	}


}
