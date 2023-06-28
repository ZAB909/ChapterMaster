function scr_weapons_equip() {

	// gets the weapons for the particular slot
	// dude=6 is dreadnought I think

	var tc,tb,dude;
	tc=0;tb=0;dude=0;

	var i;i=-1;
	repeat(50){i+=1;item_name[i]="";}

	if (instance_exists(obj_controller)) and (instance_exists(obj_popup)) and (!instance_exists(obj_mass_equip)){
	    tc=target_comp;
	    tb=tab;
	    dude=0;// This is for equiping the selected marines in management
    
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




	if (tc<3) and (tb=1){var i;i=0;
	    i+=1;item_name[i]="(None)";
    
	    if (dude!=6){
	        i+=1;item_name[i]="Archeotech Laspistol";
	        i+=1;item_name[i]="Assault Cannon";
	        i+=1;item_name[i]="Bolt Pistol";
	        i+=1;item_name[i]="Bolter";
	        i+=1;item_name[i]="Combiflamer";
	        i+=1;item_name[i]="Flamer";
	    }
	    i+=1;item_name[i]="Heavy Bolter";
	    i+=1;item_name[i]="Heavy Flamer";
		i+=1;item_name[i]="Twin Linked Heavy Bolters";
		i+=1;item_name[i]="Twin Linked Heavy Lascannon";
		i+=1;item_name[i]="Twin Linked Bolters";
	    if (dude!=6){
	        i+=1;item_name[i]="Hellrifle";
	        i+=1;item_name[i]="Incinerator";
	        i+=1;item_name[i]="Integrated Bolters";
	    }
	    i+=1;item_name[i]="Lascannon";
	    i+=1;item_name[i]="Meltagun";
	    i+=1;item_name[i]="Missile Launcher";
	    i+=1;item_name[i]="Multi-Melta";
		i+=1;item_name[i]="Inferno Cannon";
		i+=1;item_name[i]="Autocannon";
		i+=1;item_name[i]="Flamestorm Cannon";
		i+=1;item_name[i]="Twin-Linked Assault Cannon";
	    if (dude!=6){
	        i+=1;item_name[i]="Plasma Gun";
	        i+=1;item_name[i]="Plasma Pistol";
	        i+=1;item_name[i]="Sniper Rifle";
	        i+=1;item_name[i]="Storm Bolter";
	        i+=1;item_name[i]="Webber";
	    }
	}

	if (tc<3) and (tb=2){var i;i=0;
	    if (!instance_exists(obj_creation)) and (!instance_exists(obj_controller)){i+=1;item_name[i]="(None)";}
    
	    if (dude!=6){
	        i+=1;item_name[i]="Boarding Shield";
	        i+=1;item_name[i]="Chainaxe";
	        i+=1;item_name[i]="Chainfist";
	        i+=1;item_name[i]="Chainsword";
	    }
	    i+=1;item_name[i]="Close Combat Weapon";
	    if (dude!=6){
	        i+=1;item_name[i]="Combat Knife";
	        i+=1;item_name[i]="Company Standard";
	        if (!instance_exists(obj_creation)){i+=1;item_name[i]="Eldar Power Sword";}
	        i+=1;item_name[i]="Eviscerator";
	    }
	    i+=1;item_name[i]="Force Weapon";
	    if (dude!=6){
	        i+=1;item_name[i]="Lascutter";
	        i+=1;item_name[i]="Lightning Claw";
	        i+=1;item_name[i]="Power Axe";
	        i+=1;item_name[i]="Power Fist";
	        i+=1;item_name[i]="Power Sword";
	        i+=1;item_name[i]="Storm Shield";
	        i+=1;item_name[i]="Thunder Hammer";
	    }
	}

	/*
	if (tc<3) and (tb=1){
	    var i;i=0;
	    i+=1;item_name[i]="(None)";
	    if (dude!=6){
	        i+=1;item_name[i]="Combat Knife";
	        i+=1;item_name[i]="Chainsword";
	        i+=1;item_name[i]="Chainaxe";
	        i+=1;item_name[i]="Eviscerator";
	        i+=1;item_name[i]="Power Sword";
	        i+=1;item_name[i]="Power Axe";
	        i+=1;item_name[i]="Power Fist";
	        i+=1;item_name[i]="Chainfist";
	        i+=1;item_name[i]="Force Weapon";
	        i+=1;item_name[i]="Thunder Hammer";
	        i+=1;item_name[i]="Boarding Shield";
	        i+=1;item_name[i]="Storm Shield";
	        i+=1;item_name[i]="Bolt Pistol";
	        i+=1;item_name[i]="Bolter";
	    }
	    i+=1;item_name[i]="Heavy Bolter";
	    if (dude!=6){
	        i+=1;item_name[i]="Storm Bolter";
	        i+=1;item_name[i]="Flamer";
	        i+=1;item_name[i]="Combiflamer";
	        i+=1;item_name[i]="Meltagun";
	    }
	    i+=1;item_name[i]="Multi-Melta";
	    if (dude!=6){
	        i+=1;item_name[i]="Plasma Pistol";
	        i+=1;item_name[i]="Plasma Gun";
	        i+=1;item_name[i]="Sniper Rifle";
	    }
	    i+=1;item_name[i]="Assault Cannon";
	    i+=1;item_name[i]="Missile Launcher";
	    i+=1;item_name[i]="Lascannon";
	    bad=0;if (instance_exists(obj_creation_popup)){if ((obj_creation_popup.type-100)!=6) then bad=1;}
	    if (bad=0){i+=1;item_name[i]="Close Combat Weapon";}
	    if (instance_exists(obj_mass_equip)){i+=1;item_name[i]="Company Standard";}
	}
	if (tc<3) and (tb=2){var i;i=0;
	    i+=1;item_name[i]="(None)";
	    if (dude!=6){
	        var bad;bad=0;if (instance_exists(obj_creation_popup)) then bad=1;
	        if (bad=0){i+=1;item_name[i]="Company Standard";}
	        i+=1;item_name[i]="Webber";
	        i+=1;item_name[i]="Incinerator";
	        i+=1;item_name[i]="Heavy Flamer";
	        i+=1;item_name[i]="Hellrifle";
	        i+=1;item_name[i]="Lascutter";
	        i+=1;item_name[i]="Integrated Bolters";
	        i+=1;item_name[i]="Archeotech Laspistol";
			i += 1;item_name[i] = "Twin Linked Heavy Bolter"; // Added option for Twin Linked Heavy Bolter
            i += 1;item_name[i] = "Twin Linked Lascannon"; // Added option for Twin Linked Lascannon
	    }
	}*/

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


	if (tc=3){
	    var i;i=0;
    
	    if (!instance_exists(obj_creation)) and (!instance_exists(obj_mass_equip)){
	        i+=1;item_name[i]="(None)";
	        i+=1;item_name[i]="Scout Armor";
	        i+=1;item_name[i]="Power Armor";
	        i+=1;item_name[i]="MK3 Iron Armor";
	        i+=1;item_name[i]="MK4 Maximus";
	        i+=1;item_name[i]="MK6 Corvus";
	        i+=1;item_name[i]="MK7 Aquila";
	        i+=1;item_name[i]="MK8 Errant";
	        i+=1;item_name[i]="Artificer Armor";
	        i+=1;item_name[i]="Terminator Armor";
	        i+=1;item_name[i]="Tartaros";
	    }
    
	    if (instance_exists(obj_creation)) or (instance_exists(obj_mass_equip)){
	        var bub;bub=0;
	        i+=1;item_name[i]="Scout Armor";
        
	        if (instance_exists(obj_creation)){if (type=112) then bub=1;}
	        if (instance_exists(obj_mass_equip)){if (obj_controller.settings=12) then bub=1;}
        
	        // if (bub=0){
	            i+=1;item_name[i]="Power Armor";
	            i+=1;item_name[i]="Terminator Armor";
            
	        // }
	    }
    
	    if (instance_exists(obj_controller))/* and (instance_exists(obj_popup))*/ then i+=2;
	    else i+=1;
    
	    // var bad;bad=0;if (instance_exists(obj_creation_popup)){if ((obj_creation_popup.type-100)!=6) then bad=1;}
	    // if (bad=0){item_name[i]="Dreadnought";}
	}
	if (tc=4){
	    var i;i=0;
	    i+=1;item_name[i]="(None)";
	    if (dude!=6){
	        // i+=1;item_name[i]="Bionics";
	        i+=1;item_name[i]="Iron Halo";
	        i+=1;item_name[i]="Master Servo Arms";
	        i+=1;item_name[i]="Narthecium";
	        i+=1;item_name[i]="Psychic Hood";
	        i+=1;item_name[i]="Rosarius";
	        i+=1;item_name[i]="Servo Arms";
	        i+=1;
	        if (!instance_exists(obj_creation)){i+=1;item_name[i]="Exterminatus";}
	        if (!instance_exists(obj_creation)){i+=1;item_name[i]="Plasma Bomb";}
	    }
	}
	if (tc=5){
	    var i;i=0;
	    i+=1;item_name[i]="(None)";
	    if (dude!=6){
	        i+=1;item_name[i]="Bike";
	        i+=1;item_name[i]="Jump Pack";
	    }
	}


}
