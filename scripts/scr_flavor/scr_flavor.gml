function scr_flavor(id_of_attacking_weapons, target, target_type, number_of_shots, casulties) {

	// Generates flavor based on the damage and casualties from scr_shoot, only for the player


	targeh=target_type;
	var p1,p2,p3,mes,targeh;
	mes="";p1=$"";p2="";p3="";

	var weapon_name="";
	if (id_of_attacking_weapons>0){weapon_name=wep[id_of_attacking_weapons];}
	if (id_of_attacking_weapons=-51) then weapon_name="Heavy Bolter Emplacemelse ent";
	if (id_of_attacking_weapons=-52) then weapon_name="Missile Launcher Emplacement";
	if (id_of_attacking_weapons=-53) then weapon_name="Missile Silo";


	var weapon_data = gear_weapon_data("weapon", weapon_name, "all");
	if (!is_struct(weapon_data)){
		weapon_data = new equipment_struct({
			name:weapon_name
		});
	}

	var target_name=target.dudes[targeh];

	if (target_name="Leader") and (obj_ncombat.enemy<=10){
	    target_name=obj_controller.faction_leader[obj_ncombat.enemy];
	}
	var character_shot=false,full_name="",cm_kill=0;

	if (id_of_attacking_weapons>0){
	    if (array_length(wep_solo[id_of_attacking_weapons])>0){
	        character_shot=true;
	        full_names=wep_solo[id_of_attacking_weapons];
	        if (wep_title[id_of_attacking_weapons]!=""){
	        	if (array_length(full_names)==1){
	            	full_name=wep_title[id_of_attacking_weapons]+" "+wep_solo[id_of_attacking_weapons][0];
	        	} else {
	        		full_name=wep_title[id_of_attacking_weapons]+"'s"
	        	}
	        }
	        if (wep_solo[id_of_attacking_weapons][0]==obj_ini.master_name) then cm_kill=1;
	    }
	}

	if (obj_ncombat.battle_special="WL10_reveal") or (obj_ncombat.battle_special="WL10_later"){
	    if (target_name="Veteran Chaos Terminator") and (target_name>0) then obj_ncombat.chaos_angry+=casulties*2;
	    if (target_name="Veteran Chaos Chosen") and (target_name>0) then obj_ncombat.chaos_angry+=casulties;
	    if (target_name="Greater Daemon of Slaanesh") then obj_ncombat.chaos_angry+=casulties*5;
	    if (target_name="Greater Daemon of Tzeentch") then obj_ncombat.chaos_angry+=casulties*5;
	}

	if (target.flank=1) and (target.flyer=0) then target_name="flanking "+target_name;
    
	var flavored=0;






	if (weapon_data.has_tag("bolt")){
		flavored=1;
		if (!character_shot){
		    if (obj_ncombat.bolter_drilling=1) then weapon_name="Accurate "+weapon_name;
		    if (number_of_shots<200){
		        if (target.dudes_num[targeh]=1) and (casulties=0) then p1=$"{number_of_shots} {weapon_name}s fire.  A {target_name} is rocked by the bolts but survives.";
		        if (target.dudes_num[targeh]=1) and (casulties=1) then p1=$"{number_of_shots} {weapon_name}s fire.  A {target_name} absorbs most of the bolts and dies instantly.";
		        if (target.dudes_num[targeh]>1) and (casulties=0) then p1=$"{number_of_shots} {weapon_name} fire strikes the ranks (X{casulties} casulties) of the {target_name} but seemingly does no damage.";
		        if (target.dudes_num[targeh]>1) and (casulties>0) then p1=$"{number_of_shots} {weapon_name} rip through the {target_name} and purge {casulties}.";
		    }
		    if (number_of_shots>=200){
		        if (target.dudes_num[targeh]=1) and (casulties=0) then p1=$"{number_of_shots} {weapon_name}s fire.  Explosions clap across the armour of the {target_name}.";
		        if (target.dudes_num[targeh]=1) and (casulties=1) then p1=$"{number_of_shots} {weapon_name}s fire.  Explosions clap around the {target_name} and kill it instantly.";
		        if (target.dudes_num[targeh]>1) and (casulties=0) then p1=$"{number_of_shots} {weapon_name}s rip through the ranks (X{casulties} casulties) of {target_name}, seemingly doing no damage.";
		        if (target.dudes_num[targeh]>1) and (casulties>0) then p1=$"{number_of_shots} {weapon_name}s rip through the ranks (X{casulties} casulties) of {target_name}, {casulties} dying immediately.";
		    }
		} else {
			if  (character_shot=true){
				flavored=1;
			    if (target.dudes_num[targeh]>1) and (casulties=0) then p1=+$"{string(full_name)} fires his {weapon_name} into the {target_name} ranks (X{casulties} casulties).";
			    if (target.dudes_num[targeh]>1) and (casulties>0) then p1=+$"{string(full_name)} into the {target_name} ranks (X{casulties} casulties) and kills {casulties}.";
			    if (target.dudes_num[targeh]=1) and (casulties=0) then p1=+$"{string(full_name)} into a {target_name} but fails to kill it.";
			    if (target.dudes_num[targeh]=1) and (casulties>0) then p1=+$"{string(full_name)} into a {target_name}, killing it.";
			}
		}
	}



	else if (weapon_name="hammer_of_wrath"){
	    if (!character_shot){
	    	flavored=1;
	        if (number_of_shots<20) then p1=$"{number_of_shots} Astartes with Jump Packs leap to the skies.  Sputtering and roaring flames herald their advance.  Once at a suitable height they crash back down amongst the enemy- ";
	        if (number_of_shots>=20) and (number_of_shots<100) then p1=$"Several squads of Astartes take to the sky, their Jump Packs roaring and shooting flames.  Once at a suitable height they crash back down amongst the enemy- ";
	        if (number_of_shots>=100) then p1=$"A literal wave of Astartes take to the sky, their Jump Packs roaring like one massive, angry beast.  Almost simultaneously they all crash back down, smashing their enemey- ";
        
	        if (target.dudes_num[targeh]>1) and (casulties=0) then p1+=$"they smash into the {target_name} ranks (X{casulties} casulties).";
	        if (target.dudes_num[targeh]>1) and (casulties>0) then p1+=$"they smash into the {target_name} ranks (X{casulties} casulties).";
	        if (target.dudes_num[targeh]=1) and (casulties=0) then p1+=$"a {target_name} survives the attack.";
	        if (target.dudes_num[targeh]=1) and (casulties=1) then p1+=$"a {target_name} takes one of the charges.";
	    }
	    else if (character_shot){
	        if (target.dudes_num[targeh]=1) then p1=string(full_name)+$" activates his Jump Pack and launches up into the air, and then crashes down into a {target_name}- ";
	        if (target.dudes_num[targeh]>1) then p1=string(full_name)+$" activates his Jump Pack and launches up into the air, and then crashes down into the {target_name} ranks (X{casulties} casulties)- ";
	        if (target.dudes_num[targeh]=1) and (casulties=0) then p1+="it survives the attack.";
	        if (target.dudes_num[targeh]>1) and (casulties=0) then p1+="all survive the attack.";
	    }
	}

	else if (weapon_name="Assault Cannon") and (!character_shot){
		flavored=1;
	    if (number_of_shots=1) then p1=$"An {weapon_name} hums and rotates, belching out bullets and flame alike.";
	    if (number_of_shots>1) then p1=$"{number_of_shots} {weapon_name} hum and rotat, belching out bullets and flame alike.";
	}
	else if (weapon_name="Missile Launcher") and (!character_shot){
		flavored=1;
	    if (target.dudes_num[targeh]=1) then p1=$"{number_of_shots} {weapon_name} fire upon the {target_name}.";
	    if (target.dudes_num[targeh]>1) then p1=$"{number_of_shots} {weapon_name} fire on the {target_name} ranks (X{casulties} casulties).";
	}
	else if (weapon_name="Whirlwind Missiles") and (!character_shot){
		flavored=1;
	    if (target.dudes_num[targeh]=1) then p1=$"{number_of_shots} Whirlwinds fire upon the {target_name}.";
	    if (target.dudes_num[targeh]>1) then p1=$"{number_of_shots} Whirlwinds fire on the {target_name} ranks (X{casulties} casulties).";
	}
	else if (weapon_name="Sniper Rifle") and (!character_shot){
		flavored=1;
	    if (target.dudes_num[targeh]=1) then p1=$"{number_of_shots} {weapon_name} fire upon the {target_name}.";
	    if (target.dudes_num[targeh]>1) then p1=$"{number_of_shots} {weapon_name} fire on the {target_name} ranks (X{casulties} casulties).";
	}
	else if (weapon_name="Stalker Pattern Bolter") and (!character_shot){
		flavored=1;
	    if (target.dudes_num[targeh]=1) then p1=$"{number_of_shots} {weapon_name} fire upon the {target_name}.";
	    if (target.dudes_num[targeh]>1) then p1=$"{number_of_shots} {weapon_name} fire on the {target_name}.";
	}
	else if ((weapon_data.has_tag("las") and weapon_data.has_tags(["heavy_weapon", "dreadnought", "terminator", "vehicle"])) and (!character_shot)){
		flavored=1;
	    if (weapon_name="Lascannons"){weapon_name="Lascannon";number_of_shots=number_of_shots*2;}
	    if (number_of_shots=1) then p1=$"A {target_name} is struck by a {weapon_name}.";
	    if (number_of_shots>1) then p1=$"{number_of_shots} {weapon_name} fire upon the {target_name} ranks (X{casulties} casulties).";        
	}
	else if (weapon_name="Webber") and (!character_shot){
		flavored=1;
	    if ((target_name="Termagaunt") or (target_name="Hormagaunt")) and (casulties>0) then obj_ncombat.captured_gaunt+=casulties;
	    if (target.dudes_num[targeh]=1) then p1=$"{number_of_shots} {weapon_name} spray ooze on the {target_name}.";
	    if (target.dudes_num[targeh]>1) then p1=$"{number_of_shots} {weapon_name} spray ooze on the {target_name} ranks (X{casulties} casulties).";
	}

	else if (weapon_name=="fists") or (weapon_name=="fists") and (!character_shot){
		flavored=1;
		var ra=choose(1,2,3,4);
	    // This needs to be worked out
	    if (casulties=0) then p2="MELEE";
	    if (casulties>0){
	        p1=$"The {target_name} ranks (X{casulties} casulties) ";
	        if (ra=1) then p2="are struck with gun-barrels and combat knifes.";
	        if (ra=2) then p2="are savaged by your marines in hand-to-hand combat.";
	        if (ra=3) then p2="are smashed by your marines.";
	        if (ra=4) then p2="are struck by your marines in melee.";
	    }
	}
	else if (weapon_name="Close Combat Weapon") {
		flavored=1;
	    if (number_of_shots=1) then p1=$"A {target_name} is struck by a "+string(obj_ini.role[100][6])+".";
	    if (number_of_shots>1) then p1=$"{number_of_shots} {obj_ini.role[100][6]}s stomp, wrench, and smash at the {target_name} ranks (X{casulties} casulties).";
	}
	else if (weapon_name="Chainsword") and (!character_shot){
		flavored=1;
	    if (number_of_shots=1) then p1=$"A {target_name} is struck by a {weapon_name}.";
	    if (number_of_shots>1) then p1=$"{number_of_shots} Chainsword motors rev and hack at the {target_name} ranks (X{casulties} casulties).";
	}
	else if (weapon_name="Sarissa") and (!character_shot){
		flavored=1;
	    if (number_of_shots=1) then p1=$"A {target_name} is struck by a Battle Sister's {weapon_name}.";
	    // if (number_of_shots>1) and (casulties=0) then p1=$"A Battle Sister "+choose("howls out","roars")+" and hacks at the {target_name} ranks (X{casulties} casulties) with her Sarissa.";
	    if (number_of_shots>1) then p1=$"{number_of_shots} Battle Sisters {choose("howl out","roar")} as they hack away at the {target_name} ranks (X{casulties} casulties) with their Sarissas.";
	}
	else if (weapon_name="Eviscerator") and (!character_shot){
		flavored=1;
	    if (number_of_shots=1) then p1=$"A {target_name} is struck by a {weapon_name}.";
	    if (number_of_shots>1) then p1=$"{number_of_shots} Eviscerators rev and howl, hacking at the {target_name} ranks (X{casulties} casulties).";
	}
	else if (weapon_name="Force Staff") and (!character_shot){
		flavored=1;
	    if (number_of_shots=1) then p1=$"A {target_name} is blasted by a {weapon_name}.";
	    if (number_of_shots>1) then p1=$"{number_of_shots} {weapon_name} crackle and swing into the {target_name} ranks (X{casulties} casulties).";
	}
	else if (weapon_name="Inactive Force Staff") and (!character_shot){
		flavored=1;
	    if (number_of_shots=1) then p1=$"A {target_name} is struck by a {weapon_name}.";
	    if (number_of_shots>1) then p1=$"{number_of_shots} {weapon_name} are swung into the {target_name} ranks (X{casulties} casulties).";
	}

	if ((string_count("Power",weapon_name)>0) or (weapon_name="Force Staff") or (weapon_name="Inactive Force Staff") or (weapon_name="Lightning Claw")) and (character_shot=true){
		flavored=1;
	    if (target.dudes_num[targeh]>1) then p1=$"{full_name} swings his {weapon_name}.";
	}

	if (weapon_name="hammer_of_wrath"){
	    if (!character_shot){
	    	flavored=1;
	        if (number_of_shots<20) then p1=$"{number_of_shots} Astartes with Jump Packs leap to the skies.  Sputtering and roaring flames herald their advance.  Once at a suitable height they crash back down amongst the enemy- ";
	        if (number_of_shots>=20) and (number_of_shots<100) then p1=$"Several squads of Astartes take to the sky, their Jump Packs roaring and shooting flames.  Once at a suitable height they crash back down amongst the enemy- ";
	        if (number_of_shots>=100) then p1=$"A literal wave of Astartes take to the sky, their Jump Packs roaring like one massive, angry beast.  Almost simultaneously they all crash back down, smashing their enemey- ";
        
	        if (target.dudes_num[targeh]>1) and (casulties=0) then p1+=$" they smash into the {target_name} ranks (X{casulties} casulties) but fail to kill any.";
	        if (target.dudes_num[targeh]>1) and (casulties>0) then p1+=$" they smash into the {target_name} ranks (X{casulties} casulties) and pulverize {casulties}.";
	        if (target.dudes_num[targeh]=1) and (casulties=0) then p1+=$"a {target_name} survives the attack.";
	        if (target.dudes_num[targeh]=1) and (casulties=1) then p1+=$"a {target_name} takes one of the charges and dies.";
	    }
	    if (character_shot=true){
	        if (target.dudes_num[targeh]=1) then p1=string(full_name)+$" activates his Jump Pack and launches up into the air, and then crashes down into a {target_name}- ";
	        if (target.dudes_num[targeh]>1) then p1=string(full_name)+$" activates his Jump Pack and launches up into the air, and then crashes down into the {target_name} ranks (X{casulties} casulties)- ";
    
	        if (target.dudes_num[targeh]=1) and (casulties=0) then p1+="it survives the attack.";
	        if (target.dudes_num[targeh]=1) and (casulties=1) then p1+="it is crumpled to the ground, dead instantly.";
	    }
	}


	else if (weapon_data.has_tag("plasma")) and (!character_shot){
		flavored=1;
	    if (target.dudes_num[targeh]=1) and (casulties=0) then p1=$"{number_of_shots} {weapon_name} shoot bolts of energy into a {target_name} (X{casulties} casulties).";
	    if (target.dudes_num[targeh]=1) and (casulties=1) then p1=$"{number_of_shots} {weapon_name} overwhelm a {target_name} with bolts of energy (X{casulties} casulties).";
	    if (target.dudes_num[targeh]>1) and (casulties=0) then p1=$"{number_of_shots} {weapon_name} shoot bolts of energy into the {target_name} ranks (X{casulties} casulties).";
	    if (target.dudes_num[targeh]>1) and (casulties>0) then p1=$"{number_of_shots} {weapon_name} shoot bolts of energy into the {target_name}, cleansing {casulties}.";
	}
	else if (weapon_name=="Assault Cannon") and (!character_shot){
		flavored=1;
	    if (target.dudes_num[targeh]=1) and (casulties=0) then p1=$"{number_of_shots} {weapon_name}s hum and rotate, belching out bullets and flame alike. Explosions clap across the armour of the {target_name}.  (X{casulties} casulties)";
	    if (target.dudes_num[targeh]=1) and (casulties=1) then p1=$"{number_of_shots} {weapon_name}s hum and rotate, belching out bullets and flame alike. A {target_name} is ripped apart by the rounds (X{casulties} casulties).";
	    if (target.dudes_num[targeh]>1) and (casulties=0) then p1=$"{number_of_shots} {weapon_name}s hum and rotate, belching out bullets and flame alike. The {target_name}s are rocked but unharmed (X{casulties} casulties).";
	    if (target.dudes_num[targeh]>1) and (casulties>0) then p1=$"{number_of_shots} {weapon_name}s hum and rotate, belching out bullets and flame alike. {casulties} {target_name} are purged (X{casulties} casulties).";
	}
	else if (weapon_data.has_tag("flame")) and (!character_shot){
		flavored=1;
	    if (target.dudes_num[targeh]=1) and (casulties=0) then p1=$"{number_of_shots} {weapon_name} bathe the {target_name} in holy promethium (X{casulties} casulties).";
	    if (target.dudes_num[targeh]=1) and (casulties=1) then p1=$"{number_of_shots} {weapon_name} flash-fry the {target_name} inside its armour (X{casulties} casulties).";
	    if (target.dudes_num[targeh]>1) and (casulties=0) then p1=$"{number_of_shots} {weapon_name} wash over the {target_name} ranks (X{casulties} casulties).";
	    if (target.dudes_num[targeh]>1) and (casulties>0) then p1=$"{number_of_shots} {weapon_name} bathe the {target_name} ranks (X{casulties} casulties) in holy promethium, cleansing {casulties}.";
	}
	else if (weapon_name="Missile Launcher") and (!character_shot){
		flavored=1;
	    if (target.dudes_num[targeh]=1) and (casulties=0) then p1=$"{number_of_shots} {weapon_name} fire upon the {target_name} and fail to do damage (X{casulties} casulties).";
	    if (target.dudes_num[targeh]=1) and (casulties=1) then p1=$"{number_of_shots} {weapon_name} fire upon the {target_name} and blow it to small pieces (X{casulties} casulties).";
	    if (target.dudes_num[targeh]>1) and (casulties=0) then p1=$"{number_of_shots} {weapon_name} fire on the {target_name} ranks (X{casulties} casulties).";
	    if (target.dudes_num[targeh]>1) and (casulties>0) then p1=$"{number_of_shots} {weapon_name} fire upon the {target_name} ranks (X{casulties} casulties) and blow {casulties} to pieces.";
	}
	else if (weapon_name="Whirlwind Missiles") and (!character_shot){
		flavored=1;
	    if (target.dudes_num[targeh]=1) and (casulties=0) then p1=$"{number_of_shots} Whirlwinds fire upon the {target_name} and fail to do damage.";
	    if (target.dudes_num[targeh]=1) and (casulties=1) then p1=$"{number_of_shots} Whirlwinds fire upon the {target_name} and blow it to small pieces.";
	    if (target.dudes_num[targeh]>1) and (casulties=0) then p1=$"{number_of_shots} Whirlwinds fire on the {target_name} ranks (X{casulties} casulties).";
	    if (target.dudes_num[targeh]>1) and (casulties>0) then p1=$"{number_of_shots} Whirlwinds fire upon the {target_name} ranks (X{casulties} casulties) and blow {casulties} to pieces.";
	}
	else if (weapon_name="Sniper Rifle") and (!character_shot){
		flavored=1;
	    if (target.dudes_num[targeh]=1) and (casulties=0) then p1=$"{number_of_shots} {weapon_name} fire upon the {target_name} and fail to do damage.";
	    if (target.dudes_num[targeh]=1) and (casulties=1) then p1=$"{number_of_shots} {weapon_name} fire upon the {target_name} and destroy it.";
	    if (target.dudes_num[targeh]>1) and (casulties=0) then p1=$"{number_of_shots} {weapon_name} fire on the {target_name} ranks (X{casulties} casulties).";
	    if (target.dudes_num[targeh]>1) and (casulties>0) then p1=$"{number_of_shots} {weapon_name} fire upon the {target_name} ranks (X{casulties} casulties) and kill {casulties}.";
	}
	else if (weapon_name="Stalker Pattern Bolter") and (!character_shot){
		flavored=1;
	    if (target.dudes_num[targeh]=1) and (casulties=0) then p1=$"{number_of_shots} {weapon_name} fire upon the {target_name} and fail to do damage.";
	    if (target.dudes_num[targeh]=1) and (casulties=1) then p1=$"{number_of_shots} {weapon_name} fire upon the {target_name} and destroy it.";
	    if (target.dudes_num[targeh]>1) and (casulties=0) then p1=$"{number_of_shots} {weapon_name} fire on the {target_name} ranks (X{casulties} casulties).";
	    if (target.dudes_num[targeh]>1) and (casulties>0) then p1=$"{number_of_shots} {weapon_name} fire upon the {target_name} ranks (X{casulties} casulties) and kill {casulties}.";
	}
	else if ((weapon_name="Lascannon") or (weapon_name="Twin Linked Lascannon") or (weapon_name="Lascannons")) and (!character_shot){
		flavored=1;
	    if (weapon_name="Lascannons"){weapon_name="Lascannon";number_of_shots=number_of_shots*2;}
	    if (number_of_shots=1) and (casulties=0) then p1=$"A {target_name} is struck by a {weapon_name} (X{casulties} casulties).";
	    if (number_of_shots=1) and (casulties=1) then p1=$"A {target_name} is struck by a {weapon_name} and killed instantly (X{casulties} casulties).";
	    if (number_of_shots>1) and (casulties=0) then p1=$"{number_of_shots} {weapon_name} fire upon a {target_name} and fail to kill it (X{casulties} casulties).";
	    if (number_of_shots>1) and (casulties=1) then p1=$"{number_of_shots} {weapon_name} fire upon a {target_name} and turn it into paste (X{casulties} casulties).";
	    if (number_of_shots>1) and (casulties>1) then p1=$"{number_of_shots} {weapon_name} fire and purge {casulties} {target_name}.";        
	}
	else if (weapon_name="Webber") and (!character_shot){
		flavored=1;
	    if ((target_name="Termagaunt") or (target_name="Hormagaunt")) and (casulties>0) then obj_ncombat.captured_gaunt+=casulties;
	    if (target.dudes_num[targeh]=1) and (casulties=0) then p1=$"{number_of_shots} {weapon_name} spray ooze on the {target_name} but fail to immobilize it.";
	    if (target.dudes_num[targeh]=1) and (casulties=1) then p1=$"{number_of_shots} {weapon_name} spray ooze on the {target_name} and fully immobilize it.";
	    if (target.dudes_num[targeh]>1) and (casulties=0) then p1=$"{number_of_shots} {weapon_name} spray ooze on the {target_name} ranks (X{casulties} casulties).";
	    if (target.dudes_num[targeh]>1) and (casulties>0) then p1=$"{number_of_shots} {weapon_name} spray ooze on the {target_name} ranks (X{casulties} casulties) and immobilize {casulties} of them.";
	}

	if (weapon_name="melee") or (weapon_name="Melee") or (weapon_name="fists")and (!character_shot){
		flavored=1;var ra=choose(1,2,3,4);
	    // This needs to be worked out
	    if (casulties=0) then p2="MELEE";
	    if (casulties>0){
	        p1=$"{casulties} {target_name} ";
	        if (ra=1) then p2="are struck down with gun-barrels and combat knifes.";
	        if (ra=2) then p2="are killed by your marines in hand-to-hand combat.";
	        if (ra=3) then p2="are smashed aside by your marines.";
	        if (ra=4) then p2="are struck down by your marines in melee.";
	    }
	}
	else if (weapon_name="Close Combat Weapon") and (!character_shot){
		flavored=1;
	    if (number_of_shots=1) and (casulties=0) then p1=$"A {target_name} is struck by a "+string(obj_ini.role[100][6])+" but survives.";
	    if (number_of_shots=1) and (casulties=1) then p1=$"A {target_name} is struck down by a "+string(obj_ini.role[100][6])+".";
	    if (number_of_shots>1) and (casulties=0) then p1=$"{number_of_shots} {string(obj_ini.role[100][6])}s wrench and smash at a {target_name} but fail to destroy it.";
	    if (number_of_shots>1) and (casulties>1) then p1=$"{number_of_shots} {string(obj_ini.role[100][6])}s stomp, wrench, and smash {casulties} {target_name} into paste.";
	}
	else if (weapon_name="Chainsword") and (!character_shot){
		flavored=1;
	    if (number_of_shots=1) and (casulties=0) then p1=$"A {target_name} is struck by a {weapon_name} but survives.";
	    if (number_of_shots=1) and (casulties=1) then p1=$"A {target_name} is cut down by a {weapon_name}.";
	    if (number_of_shots>1) and (casulties=0) then p1=$"{number_of_shots} Chainsword motors rev and hack at the {target_name} ranks (X{casulties} casulties).";
	    if (number_of_shots>1) and (casulties>0) then p1=$"{number_of_shots} Chainsword motors rev and hack away at the {target_name} ranks (X{casulties} casulties).  {casulties} are cut down.";
	}
	else if (weapon_name="Sarissa") and (!character_shot){
		flavored=1;
	    if (number_of_shots=1) and (casulties=0) then p1=$"A {target_name} is struck by a Battle Sister's {weapon_name} but survives.";
	    if (number_of_shots=1) and (casulties=1) then p1=$"A {target_name} is struck down by a Battle Sister's {weapon_name}.";
	    if (number_of_shots>1) and (casulties=0) then p1=$"A Battle Sister "+choose("howls out","roars")+$" and hacks at the {target_name} ranks (X{casulties} casulties) with her Sarissa.";
	    if (number_of_shots>1) and (casulties>0) then p1=$"{number_of_shots} Battle Sisters "+choose("howl out","roar")+$" as they hack away at the {target_name} ranks (X{casulties} casulties) with their Sarissas.  {casulties} are cut down.";
	}
	else if (weapon_name="Eviscerator") and (!character_shot){
		flavored=1;
	    if (number_of_shots=1) and (casulties=0) then p1=$"A {target_name} is struck by a {weapon_name} but survives.";
	    if (number_of_shots=1) and (casulties=1) then p1=$"A {target_name} is cut down by a {weapon_name}.";
	    if (number_of_shots>1) and (casulties=0) then p1=$"{number_of_shots} Eviscerators rev and howl, hacking at the {target_name} ranks (X{casulties} casulties).";
	    if (number_of_shots>1) and (casulties>0) then p1=$"{number_of_shots} Eviscerators rev and howl, hacking at the {target_name} ranks (X{casulties} casulties).  {casulties} are cut down.";
	}
	else if (weapon_name="Force Staff") and (!character_shot){
		flavored=1;
	    if (number_of_shots=1) and (casulties=0) then p1=$"A {target_name} is blasted by a {weapon_name} but survives.";
	    if (number_of_shots=1) and (casulties=1) then p1=$"A {target_name} is incinerated by a {weapon_name}.";
	    if (number_of_shots>1) and (casulties=0) then p1=$"{number_of_shots} {weapon_name} crackle and swing into the {target_name} ranks (X{casulties} casulties).";
	    if (number_of_shots>1) and (casulties>0) then p1=$"{number_of_shots} {weapon_name} crackle and swing into the {target_name} ranks (X{casulties} casulties).  "+string(casulties)+" are smashed.";
	}
	else if (weapon_name="Dozer Blades") and (!character_shot){
		flavored=1;
	    if (number_of_shots=1) and (casulties=0) then p1=$"A {target_name} is rammed but survives.";
	    if (number_of_shots=1) and (casulties=1) then p1=$"A {target_name} is splattered by {weapon_name}.";
	    if (number_of_shots>1) and (casulties=0) then p1=$"{weapon_name} ploughs {target_name} ranks (X{casulties} casulties).";
	    if (number_of_shots>1) and (casulties>0) then p1=$"{weapon_name} hits {target_name} ranks (X{casulties} casulties).  "+string(casulties)+" are smashed.";
	}
	else if (weapon_name="Inactive Force Staff") and (!character_shot){
		flavored=1;
	    if (number_of_shots=1) and (casulties=0) then p1=$"A {target_name} is struck by a {weapon_name} but survives.";
	    if (number_of_shots=1) and (casulties=1) then p1=$"A {target_name} is smashed by a {weapon_name}.";
	    if (number_of_shots>1) and (casulties=0) then p1=$"{number_of_shots} {weapon_name} are swung into the {target_name} ranks (X{casulties} casulties).";
	    if (number_of_shots>1) and (casulties>0) then p1=$"{number_of_shots} {weapon_name} are swung into the {target_name} ranks (X{casulties} casulties).  "+string(casulties)+" are smashed.";
	}
	else if (weapon_data.has_tag("power")) and (!character_shot){
		flavored=1;
	    if (target.dudes_num[targeh]=1){
	        if (number_of_shots=1) and (casulties=0) then p1=$"A {target_name} is struck by a {weapon_name} but survives.";
	        if (number_of_shots=1) and (casulties=1) then p1=$"A {target_name} is struck down by a {weapon_name}.";
        
	        if (number_of_shots>1) and (casulties=0) then p1=$"A {target_name} is struck by {number_of_shots} {weapon_name}s but survives.";
	        if (number_of_shots>1) and (casulties=1) then p1=$"A {target_name} is struck down by {number_of_shots} {weapon_name}s.";
	    }
	    if (target.dudes_num[targeh]>1){
	        if (number_of_shots>1) and (casulties=0) then p1=$"{number_of_shots} {weapon_name}s crackle and spark, striking at the {target_name} ranks (X{casulties} casulties).";
	        if (number_of_shots>1) and (casulties>0) then p1=$"{number_of_shots} {weapon_name}s crackle and spark, hewing through the {target_name} ranks (X{casulties} casulties).  {casulties} are cut down.";
	    }
	}
	else if (weapon_name="Force Staff") or (weapon_name="Inactive Force Staff") and (character_shot=true){
		flavored=1;
	    if (target.dudes_num[targeh]>1) and (casulties=0) then p1=string(full_name)+$" swings his {weapon_name} into the {target_name} ranks (X{casulties} casulties).";
	    if (target.dudes_num[targeh]>1) and (casulties>0) then p1=string(full_name)+$" swings his {weapon_name} into the {target_name} ranks (X{casulties} casulties) and kills "+string(casulties)+".";
	    if (target.dudes_num[targeh]=1) and (casulties=0) then p1=string(full_name)+$" swings his {weapon_name} into a {target_name} but fails to kill it.";
	    if (target.dudes_num[targeh]=1) and (casulties>0) then p1=string(full_name)+$" swings his {weapon_name} into a {target_name}, killing it.";
	}


	if (flavored=0) and (!character_shot){p1=$"{number_of_shots} {weapon_name} {target_name}X {casulties} casulties)";}
	if (flavored=0) and (character_shot){p1=$"({string(full_name)}.{weapon_name}) {target_name} {casulties}|" }

	// if (string_length(p1+p2+p3)<8) then show_message(weapon_name+" is not displaying anything");

	var j=0,chunks=0;
	for (j=1;j<array_length(obj_ncombat.dead_ene);j++){j+=1;
	    if (obj_ncombat.dead_ene[j]!="") and (j=1) then p2+="  ";
	    if (obj_ncombat.dead_enemies==1) and (j==1){
	        p2 += $"{obj_ncombat.dead_ene[j]} have been destroyed.";
	    }
	    if (obj_ncombat.dead_enemies=2){
	        if (j=1) then p2+= $"{obj_ncombat.dead_ene[j]} and ";
	        if (j=2) then p2+= $"{obj_ncombat.dead_ene[j]} have been destroyed.";
	    }
	    if (obj_ncombat.dead_enemies>=3){
	        if (obj_ncombat.dead_ene[j]!="") and (obj_ncombat.dead_ene[j+1]!="") then p2+=string(obj_ncombat.dead_ene[j])+", ";
	        if (obj_ncombat.dead_ene[j]!="") and (obj_ncombat.dead_ene[j+1]="") then p2+=" and "+string(obj_ncombat.dead_ene[j])+" have been destroyed.";
	    }
	}
	for (j=1;j<array_length(obj_ncombat.dead_ene);j++){
		obj_ncombat.dead_ene[j]="";
	}
	obj_ncombat.dead_enemies=0;

	mes=p1+p2+p3;





	var led=0;
	if (wep[id_of_attacking_weapons]=="hammer_of_wrath") then led=2.1;
	if (obj_ncombat.enemy<=10){
	    if (target_name=obj_controller.faction_leader[obj_ncombat.enemy]){// Cleaning up the message for the enemy leader
	        mes=string_replace(mes,"a "+target_name,target_name);
	        mes=string_replace(mes,"the "+target_name,target_name);
	        mes=string_replace(mes,target_name+" ranks (X{casulties} casulties)",target_name);
	        if (enemy=5) then mes=string_replace(mes,"it","her");
	        if (enemy=6) and (obj_controller.faction_gender[6]=1) then mes=string_replace(mes,"it","him");
	        if (enemy=6) and (obj_controller.faction_gender[6]=2) then mes=string_replace(mes,"it","her");
	        if (enemy!=6) and (enemy!=5) then mes=string_replace(mes,"it","him");
	        led=5;
	    }
	}






	if (p1!=""){
	    obj_ncombat.messages+=1;
	    obj_ncombat.message[obj_ncombat.messages]=mes;
    
	    // show_message("Added to message slot: "+string(obj_ncombat.messages)+"#"+string(mes));
	    // show_message(string(obj_ncombat.message[obj_ncombat.messages]));
    
	    if (target.dudes_vehicle[targeh]=1) then obj_ncombat.message_sz[obj_ncombat.messages]=max(number_of_shots,casulties*10)+(0.5-(obj_ncombat.messages/100));
	    else{obj_ncombat.message_sz[obj_ncombat.messages]=max(number_of_shots,casulties)+(0.5-(obj_ncombat.messages/100));}
    
	    obj_ncombat.message_priority[obj_ncombat.messages]=led;
	    if (defenses=1) then obj_ncombat.message_priority[obj_ncombat.messages]+=3;
    
	    obj_ncombat.alarm[3]=2;
	    // need some method of determining who is firing
	}

}
