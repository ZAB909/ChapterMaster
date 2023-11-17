function scr_ruins_reward(star_system, planet, _ruins) {
	
	var ruins_type = _ruins.ruins_race;
	
	//if there is gear from previoulsy killed marines retrieve instead of a standard reward
	if (_ruins.unrecovered_items != false){
		_ruins.recover_from_dead()
	} else{

	// star_system: world object
	// planet: planet
	// ruins_type: ruins_type

	var dice,loot,flea,sihd;
	dice=floor(random(100))+1;loot="";
	if (string_count("Shitty",obj_ini.strin2)>0) then dice-=10;

	if (dice>0) and (dice<=35) then loot="req";// 
	if (dice>35) and (dice<=50) then loot="gear";// 
	if (dice>50) and (dice<=60) then loot="artifact";// 
	if (dice>60) and (dice<=70) then loot="stc";// 
	if (dice>70) and (dice<=85) then loot="wild_card";// 
	if (dice>85) and (dice<=97) then loot="bunker";// 
	if (dice>97) and (dice<=100) then loot="fortress";// 
	if (dice>100) and (dice<=150) then loot="starship";// 

	if (ruins_type=1) and (loot="wild_card") then loot="gene_seed";// 
	if (ruins_type=2) and (loot="wild_card") then loot="req";// 
	if (ruins_type=6) and (loot="wild_card") then loot="gear";// 
	if (ruins_type>=10) and (loot="wild_card") then loot="req";// 

	var yar;yar=0;sihd=0;
	with(obj_p_fleet){if (action!="") then instance_deactivate_object(id);}
	flea=instance_nearest(star_system.x,star_system.y,obj_p_fleet);
	if (yar=0) and (flea.capital_num[1]!=0){yar=1;sihd=flea.capital_num[1];}
	if (yar=0) and (flea.frigate_num[1]!=0){yar=1;sihd=flea.frigate_num[1];}
	if (yar=0) and (flea.escort_num[1]!=0){yar=1;sihd=flea.escort_num[1];}
	instance_activate_object(obj_p_fleet);

	scr_event_log("","The Ancient Ruins on "+string(star_system.name)+" "+scr_roman(planet)+" has been explored.");

	// loot="artifact";

	if (loot="req"){// Requisition
	    var reqi;reqi=round(random_range(30,60)+1)*10;
	    obj_controller.requisition+=reqi;
    
	    var pop;pop=instance_create(0,0,obj_popup);
	    pop.image="ancient_ruins";pop.title="Ancient Ruins: Resources";
	    pop.text="My lord, your battle brothers have located several precious minerals and supplies within the ancient ruins.  Everything was taken and returned to the ship, granting "+string(reqi)+" Requisition.";
	}
	if (loot="artifact"){
	    scr_add_artifact("random","random",4,loc,sihd+500);
	    var i,last_artifact;
	    i=0;last_artifact=0;
	    repeat(100){if (last_artifact=0){i+=1;if (obj_ini.artifact[i]="") then last_artifact=i-1;}}
    
	    scr_event_log("","Artifact recovered from Ancient Ruins.");
	    var pop;pop=instance_create(0,0,obj_popup);
	    pop.image="ancient_ruins";pop.title="Ancient Ruins: Artifact";
	    pop.text="An Artifact has been found within the ancient ruins.  It appears to be a "+string(obj_ini.artifact[last_artifact])+" but should be brought to the Lexicanum and identified posthaste.";
	    with(obj_star_select){instance_destroy();}
	    with(obj_fleet_select){instance_destroy();}
	    with(obj_temp4){instance_destroy();}
	}

	if (loot="stc"){
	    scr_add_stc_fragment();// STC here
	    var pop;pop=instance_create(0,0,obj_popup);
	    pop.image="ancient_ruins";pop.title="Ancient Ruins: STC Fragment";
	    pop.text="Praise the Omnissiah, an STC Fragment has been retrieved from the ancient ruins and safely stowed away.  It is ready to be decrypted or gifted at your convenience.";
	    scr_event_log("","STC Fragment recovered from Ancient Ruins.");
	}
	if (loot="gear"){
	    var wep1,wen1,wep2,wen2,wep3,wen3;
	    wep1="";wen1=0;wep2="";wen2=0;wep3="";wen3=0;

	    if (ruins_type<=2) or (ruins_type>=10){
	        wep1=choose("Power Fist","Chainfist","Power Axe","Power Sword");wen1=choose(2,3,4,5);
	        wep2=choose("Flamer","Meltagun","Combiflamer","Sniper Rifle");wen2=choose(3,4,5,6,7,8);
	        wep3=choose("Missile Launcher","Heavy Bolter","Lascannon","Plasma Pistol");wen3=choose(1,2,3);
	    }if (ruins_type=3){
			wep1=choose("Terminator Armour");wen1=choose(1,2);
	        wep2=choose("Bionics");wen2=choose(5,6,7);
	        wep3=choose("Narthecium","Psychic Hood","Rosarius");wen3=choose(1);
	    }
		if (ruins_type=4){
			wep1=choose("MK4 Maximus");wen1=choose(2,3);
	        wep2=choose("MK6 Corvus");wen2=choose(4,5,6);
	        wep3=choose("MK8 Errant");wen3=choose(1,2);
	    }
	    if (ruins_type=5){
	        wep1=choose("Eviscerator","Underslung Flamer");wen1=choose(2,3,4,5);
	        wep2=choose("Flamer","Meltagun","Combiflamer");wen2=choose(3,4,5,6,7,8);
	        wep3=choose("Heavy Flamer","Heavy Bolter","Plasma Pistol");wen3=choose(1,2,3);
	    }
	    if (ruins_type=6){
	        wep1=choose("Eldar Power Sword","Power Spear");wen1=choose(1,2);
	        wep2=choose("Storm Shield","Twin Linked Bolters");wen2=choose(1,2);
	        wep3=choose("Archeotech Laspistol","Plasma Pistol");wen3=choose(1,2);
	    }
		if (ruins_type=7){
			wep1=choose("Autocannon");wen1=choose(1,2);
	        wep2=choose("Heavy Bolters","Twin Linked Heavy Bolter");wen2=choose(1,2,3);
	        wep3=choose("Twin Linked Lascannon","Lascannon");wen3=choose(1,2);
	    }if (ruins_type=8){
			wep1=choose("Iron Halo");wen1=choose(1,2);
	        wep2=choose("Company Standard");wen2=choose(1);
	        wep3=choose("Master Servo Arms");wen3=choose(1);
	    }
		
    
	    scr_add_item(wep1,wen1);scr_add_item(wep2,wen2);scr_add_item(wep3,wen3);
    
	    var pop;pop=instance_create(0,0,obj_popup);
	    pop.image="ancient_ruins";pop.title="Ancient Ruins: Gear";
	    pop.text="These ruins were once an armoury. We found some weapons and pieces of wargear.  "+string(wen1)+"x "+string(wep1)+", "+string(wen2)+"x "+string(wep2)+", and "+string(wen3)+"x "+string(wep3)+" have been added to the Armamentarium.";
	}
	if (loot="gene_seed"){// Requisition
	    var gene,pop;gene=floor(random_range(20,40))+1;pop=instance_create(0,0,obj_popup);
	    pop.image="geneseed_lab";pop.title="Ancient Ruins: Gene-seed";
	    pop.text="My lord, your battle brothers have located a hidden, fortified laboratory within the ruins.  Contained are a number of bio-vaults with astartes gene-seed; "+string(gene)+" in number.  Your marines are not able to determine the integrity or origin.";
	    pop.option1="Add the gene-seed to chapter vaults.";
	    pop.option2="Salvage the laboratory for requisition.";
	    pop.option3="Leave the laboratory as is.";
	    pop.estimate=gene;
	}
	if (loot="bunker"){// Bunker
	    var gene,pop;gene=floor(random_range(20,40))+1;pop=instance_create(0,0,obj_popup);
	    pop.image="ruins_bunker";pop.title="Ancient Ruins: Bunker Network";
	    pop.text="Your battle brothers have found several entrances into an ancient bunker network.  Its location has been handed over to the PDF.  The planet's defense rating has increased to ";
	    pop.text+=string(min(star_system.p_fortified[planet]+1,5))+".  ";
	    if (star_system.p_fortified[planet]<5) then pop.text+="("+string(star_system.p_fortified[planet])+"+1)";
	    if (star_system.p_fortified[planet]>=5) then pop.text+="("+string(star_system.p_fortified[planet])+"+0)";
	    star_system.p_fortified[planet]=min(star_system.p_fortified[planet]+1,5);
	}
	if (loot="fortress"){// Fortress
	    var gene,pop;gene=floor(random_range(20,40))+1;pop=instance_create(0,0,obj_popup);
	    pop.image="ruins_fort";pop.title="Ancient Ruins: Fortress";
	    pop.text="Praise the Emperor! We have found a massive, ancient fortress in needs of repairs. The gun batteries are rusted, and the walls are covered in moss with huge hole in it. Such a pity that such a majestic building is now a pale shadow of its former glory.  It is possible to repair the structure.  What is thy will?";
	    pop.option1="Repair the fortress to boost defenses.  (1000 Req)";
	    pop.option2="Salvage raw materials from the fortress.";
	}
	if (loot="starship"){// Starship
	    var pop;pop=instance_create(0,0,obj_popup);
	    pop.image="ruins_ship";pop.title="Ancient Ruins: Starship";
	    pop.text="The ground beneath one of your battle brothers crumbles, and he falls a great height.  The other marines go down in pursuit- within a great chamber they find the remains of an ancient starship.  Though derelict, it is possible to land "+string(obj_ini.role[100][16])+"s onto the planet to repair the ship.  10,000 Requisition will be needed to make it operational.";
		obj_controller.current_planet_feature.find_starship();
	    scr_event_log("","Ancient Starship discovered on "+string(star_system.name)+" "+scr_roman(planet)+".");
	}


	_ruins.ruins_explored()
	// star_system.p_feature[planet]="Ancient Ruins|";

	}
	if( instance_exists(obj_temp4)){
		instance_destroy(obj_temp4);
	}
}
