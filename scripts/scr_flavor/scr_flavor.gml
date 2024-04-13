function scr_flavor(number_of_attacking_weapons, target, target_type, number_of_shots, casulties) {

	// Generates flavor based on the damage and casualties from scr_shoot, only for the player


	targeh=target_type;
	var p1,p2,p3,mes,targeh;
	mes="";p1=$"";p2="";p3="";

	var wepp;wepp="";
	if (number_of_attacking_weapons>0){wepp=wep[number_of_attacking_weapons];}
	if (number_of_attacking_weapons=-51) then wepp="Heavy Bolter Emplacement";
	if (number_of_attacking_weapons=-52) then wepp="Missile Launcher Emplacement";
	if (number_of_attacking_weapons=-53) then wepp="Missile Silo";


	var target_name=target.dudes[targeh];

	if (target_name="Leader") and (obj_ncombat.enemy<=10){
	    target_name=obj_controller.faction_leader[obj_ncombat.enemy];
	}
	var solod,full_name,cm_kill;solod=false;full_name="";cm_kill=0;

	if (number_of_attacking_weapons>0){
	    if (wep_solo[number_of_attacking_weapons]!=""){
	        solod=true;
	        full_name=wep_solo[number_of_attacking_weapons];
	        if (wep_title[number_of_attacking_weapons]!=""){
	            full_name=wep_title[number_of_attacking_weapons]+" "+wep_solo[number_of_attacking_weapons];
	        }
	        if (wep_solo[number_of_attacking_weapons]=obj_ini.master_name) then cm_kill=1;
	    }
	}


	// show_message("Flavor is being ran");
	// if (cm_kill=1) then show_message("CMKILL1");

	if (string_count("&",wepp)>0) or (string_count("|",wepp)>0){// Artifact description
	    if (string_count("Bolter",wepp)>0) then wepp="Bolter";
	    if (string_count("Plasma Pistol",wepp)>0) then wepp="Plasma Pistol";
	    if (string_count("Plasma Gun",wepp)>0) then wepp="Plasma Gun";
	    if (string_count("Power Sword",wepp)>0) then wepp="Power Sword";
	    if (string_count("Power Spear",wepp)>0) then wepp="Power Spear";
	    if (string_count("Power Axe",wepp)>0) then wepp="Power Axe";
	    if (string_count("Power Fist",wepp)>0) then wepp="Power Fist";
	    if (string_count("Relic Blade",wepp)>0) then wepp="Relic Blade";
	    if (string_count("&",wepp)>0) then wepp=clean_tags(wepp);
	}

	if (obj_ncombat.battle_special="WL10_reveal") or (obj_ncombat.battle_special="WL10_later"){
	    if (target_name="Veteran Chaos Terminator") and (target_name>0) then obj_ncombat.chaos_angry+=casulties*2;
	    if (target_name="Veteran Chaos Chosen") and (target_name>0) then obj_ncombat.chaos_angry+=casulties;
	    if (target_name="Greater Daemon of Slaanesh") then obj_ncombat.chaos_angry+=casulties*5;
	    if (target_name="Greater Daemon of Tzeentch") then obj_ncombat.chaos_angry+=casulties*5;
	}

	if (target.flank=1) and (target.flyer=0) then target_name="flanking "+target_name;
    
	var flavored=0;






	if (string_count("Bolt",wepp)>0) and (solod=false){flavored=1;
	    if (obj_ncombat.bolter_drilling=1) then wepp="Accurate "+wepp;
	    if (number_of_shots<200){
	        if (target.dudes_num[targeh]=1) and (casulties=0) then p1=$"{number_of_shots} {wepp}s fire.";
	        if (target.dudes_num[targeh]=1) and (casulties=1) then p1=$"{number_of_shots} {wepp}s fire.";
	        if (target.dudes_num[targeh]>1) and (casulties=0) then p1=$"{number_of_shots} {wepp} fire strike the enemy ranks (X{casulties} casulties).";
	        if (target.dudes_num[targeh]>1) and (casulties>0) then p1=$"{number_of_shots} {wepp} rip through the enemy ranks (X{casulties} casulties).";
	    }
	    if (number_of_shots>=200){
	        if (target.dudes_num[targeh]=1) and (casulties=0) then p1=$"{number_of_shots} {wepp}s fire.  Explosions clap across the {target_name}.";
	        if (target.dudes_num[targeh]=1) and (casulties=1) then p1=$"{number_of_shots} {wepp}s fire.  Explosions clap around the {target_name}.";
	        if (target.dudes_num[targeh]>1) and (casulties=0) then p1=$"{number_of_shots} {wepp}s rip through the enemy ranks (X{casulties} casulties).";
	        if (target.dudes_num[targeh]>1) and (casulties>0) then p1=$"{number_of_shots} {wepp}s rip through the enemy ranks (X{casulties} casulties).";
	    }
	}
	if (string_count("Bolt",wepp)>0) and (solod=true){flavored=1;
	    if (target.dudes_num[targeh]>1) and (casulties=0) then p1=string(full_name)+" fires his {wepp} into the {target_name} ranks (X{casulties} casulties).";
	    if (target.dudes_num[targeh]>1) and (casulties>0) then p1=string(full_name)+" fires his {wepp} into the {target_name} ranks (X{casulties} casulties).";
	    if (target.dudes_num[targeh]=1) and (casulties=0) then p1=string(full_name)+" fires his {wepp} into a {target_name} but fails to kill it.";
	    if (target.dudes_num[targeh]=1) and (casulties>0) then p1=string(full_name)+" fires his {wepp} into a {target_name}.";
	}



	if (wepp="hammer_of_wrath"){
	    if (solod=false){flavored=1;
	        if (number_of_shots<20) then p1=$"{number_of_shots} Astartes with Jump Packs leap to the skies.  Sputtering and roaring flames herald their advance.  Once at a suitable height they crash back down amongst the enemy- ";
	        if (number_of_shots>=20) and (number_of_shots<100) then p1=$"Several squads of Astartes take to the sky, their Jump Packs roaring and shooting flames.  Once at a suitable height they crash back down amongst the enemy- ";
	        if (number_of_shots>=100) then p1=$"A literal wave of Astartes take to the sky, their Jump Packs roaring like one massive, angry beast.  Almost simultaneously they all crash back down, smashing their enemey- ";
        
	        if (target.dudes_num[targeh]>1) and (casulties=0) then p1+=$"they smash into the {target_name} ranks (X{casulties} casulties).";
	        if (target.dudes_num[targeh]>1) and (casulties>0) then p1+=$"they smash into the {target_name} ranks (X{casulties} casulties).";
	        if (target.dudes_num[targeh]=1) and (casulties=0) then p1+="a {target_name} survives the attack.";
	        if (target.dudes_num[targeh]=1) and (casulties=1) then p1+="a {target_name} takes one of the charges.";
	    }
	    if (solod=true){
	        if (target.dudes_num[targeh]=1) then p1=string(full_name)+" activates his Jump Pack and launches up into the air, and then crashes down into a {target_name}- ";
	        if (target.dudes_num[targeh]>1) then p1=string(full_name)+" activates his Jump Pack and launches up into the air, and then crashes down into the {target_name} ranks (X{casulties} casulties)- ";
	        if (target.dudes_num[targeh]=1) and (casulties=0) then p1+="it survives the attack.";
	        if (target.dudes_num[targeh]>1) and (casulties=0) then p1+="all survive the attack.";
	    }
	}




	if (string_count("Plasma Pistol",wepp)>0) and (solod=false){flavored=1;
	    if (target.dudes_num[targeh]=1) then p1=$"{number_of_shots} {wepp} shoot bolts of energy into a {target_name} (X{casulties} casulties).";
	    if (target.dudes_num[targeh]>1) and (casulties=0) then p1=$"{number_of_shots} {wepp} shoot bolts of energy into the {target_name} ranks (X{casulties} casulties).";
	}
	if (wepp="Assault Cannon") and (solod=false){flavored=1;
	    if (number_of_shots=1) then p1=$"An {wepp} hums and rotates, belching out bullets and flame alike.";
	    if (number_of_shots>1) then p1=$"{number_of_shots} {wepp} hum and rotat, belching out bullets and flame alike.";
	}
	else if (string_count("Flamer",wepp)>0) and (solod=false){flavored=1;
	    if (target.dudes_num[targeh]=1) then p1=$"{number_of_shots} {wepp} bathe the {target_name} in holy promethium.";
	    if (target.dudes_num[targeh]>1) and (casulties>0) then p1=$"{number_of_shots} {wepp} bathe the {target_name} ranks (X{casulties} casulties) in holy promethium.";
	}
	else if (wepp="Missile Launcher") and (solod=false){flavored=1;
	    if (target.dudes_num[targeh]=1) then p1=$"{number_of_shots} {wepp} fire upon the {target_name}.";
	    if (target.dudes_num[targeh]>1) then p1=$"{number_of_shots} {wepp} fire on the {target_name} ranks (X{casulties} casulties).";
	}
	else if (wepp="Whirlwind Missiles") and (solod=false){flavored=1;
	    if (target.dudes_num[targeh]=1) then p1=$"{number_of_shots} Whirlwinds fire upon the {target_name}.";
	    if (target.dudes_num[targeh]>1) then p1=$"{number_of_shots} Whirlwinds fire on the {target_name} ranks (X{casulties} casulties).";
	}
	else if (wepp="Sniper Rifle") and (solod=false){flavored=1;
	    if (target.dudes_num[targeh]=1) then p1=$"{number_of_shots} {wepp} fire upon the {target_name}.";
	    if (target.dudes_num[targeh]>1) then p1=$"{number_of_shots} {wepp} fire on the {target_name} ranks (X{casulties} casulties).";
	}
	else if (wepp="Stalker Pattern Bolter") and (solod=false){flavored=1;
	    if (target.dudes_num[targeh]=1) then p1=$"{number_of_shots} {wepp} fire upon the {target_name}.";
	    if (target.dudes_num[targeh]>1) then p1=$"{number_of_shots} {wepp} fire on the {target_name}.";
	}
	if ((wepp="Lascannon") or (wepp="Twin Linked Lascannon") or (wepp="Lascannons")) and (solod=false){flavored=1;
	    if (wepp="Lascannons"){wepp="Lascannon";number_of_shots=number_of_shots*2;}
	    if (number_of_shots=1) then p1=$"A {target_name} is struck by a {wepp}.";
	    if (number_of_shots>1) then p1=$"{number_of_shots} {wepp} fire upon the {target_name} ranks (X{casulties} casulties).";        
	}
	if (wepp="Webber") and (solod=false){flavored=1;
	    if ((target_name="Termagaunt") or (target_name="Hormagaunt")) and (casulties>0) then obj_ncombat.captured_gaunt+=casulties;
	    if (target.dudes_num[targeh]=1) then p1=$"{number_of_shots} {wepp} spray ooze on the {target_name}.";
	    if (target.dudes_num[targeh]>1) then p1=$"{number_of_shots} {wepp} spray ooze on the {target_name} ranks (X{casulties} casulties).";
	}

	if (wepp=="fists") or (wepp=="fists") and (solod=false){flavored=1;var ra;ra=choose(1,2,3,4);
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
	if (wepp="Close Combat Weapon") and (solod=false){flavored=1;
	    if (number_of_shots=1) then p1=$"A {target_name} is struck by a "+string(obj_ini.role[100][6])+".";
	    if (number_of_shots>1) then p1=$"{number_of_shots} {obj_ini.role[100][6]}s stomp, wrench, and smash at the {target_name} ranks (X{casulties} casulties).";
	}
	if (wepp="Chainsword") and (solod=false){flavored=1;
	    if (number_of_shots=1) then p1=$"A {target_name} is struck by a {wepp}.";
	    if (number_of_shots>1) then p1=$"{number_of_shots} Chainsword motors rev and hack at the {target_name} ranks (X{casulties} casulties).";
	}
	if (wepp="Sarissa") and (solod=false){flavored=1;
	    if (number_of_shots=1) then p1=$"A {target_name} is struck by a Battle Sister's {wepp}.";
	    // if (number_of_shots>1) and (casulties=0) then p1=$"A Battle Sister "+choose("howls out","roars")+" and hacks at the {target_name} ranks (X{casulties} casulties) with her Sarissa.";
	    if (number_of_shots>1) then p1=$"{number_of_shots} Battle Sisters {choose("howl out","roar")} as they hack away at the {target_name} ranks (X{casulties} casulties) with their Sarissas.";
	}
	if (wepp="Eviscerator") and (solod=false){flavored=1;
	    if (number_of_shots=1) then p1=$"A {target_name} is struck by a {wepp}.";
	    if (number_of_shots>1) then p1=$"{number_of_shots} Eviscerators rev and howl, hacking at the {target_name} ranks (X{casulties} casulties).";
	}
	if (wepp="Force Staff") and (solod=false){flavored=1;
	    if (number_of_shots=1) then p1="A "+string(duhs)+" is blasted by a "+string(wepp)+".";
	    if (number_of_shots>1) then p1=string(number_of_shots)+" "+string(wepp)+" crackle and swing into the "+string(duhs)+" ranks (X{casulties} casulties).";
	}
	if (wepp="Inactive Force Staff") and (solod=false){flavored=1;
	    if (number_of_shots=1) then p1="A "+string(duhs)+" is struck by a "+string(wepp)+".";
	    if (number_of_shots>1) then p1=string(number_of_shots)+" "+string(wepp)+" are swung into the "+string(duhs)+" ranks (X{casulties} casulties).";
	}
	if ((string_count("Power",wepp)>0) or (wepp="Lightning Claw")) and (solod=false){flavored=1;
	    if (target.dudes_num[targeh]=1){
	        if (number_of_shots=1) then p1=$"A {target_name} is struck by a {wepp}.";
	        if (number_of_shots>1) then p1=$"A {target_name} is struck by {number_of_shots} {wepp}s.";
	    }
	    if (target.dudes_num[targeh]>1){
	        if (number_of_shots>1) then p1=$"{number_of_shots} {wepp}s crackle and spark, striking at the {target_name} ranks (X{casulties} casulties).";
	    }
	}
	if ((string_count("Power",wepp)>0) or (wepp="Force Staff") or (wepp="Inactive Force Staff") or (wepp="Lightning Claw")) and (solod=true){flavored=1;
	    if (target.dudes_num[targeh]>1) then p1=string(full_name)+" swings his "+string(wepp)+".";
	}


	if (flavored=0) and (solod=false){p1=$"{number_of_shots} {wepp}+"}
	if (flavored=0) and (solod=true){p1=$"("+string(full_name)+".{wepp})|";}




	var j,chunks;j=0;chunks=0;
	repeat(40){j+=1;
	    if (obj_ncombat.dead_ene[j]!="") and (j=1) then p2+="  ";
	    if (obj_ncombat.dead_enemies=1) and (j=1){
	        p2+=string(obj_ncombat.dead_ene[j])+" have been destroyed.";
	    }
	    if (obj_ncombat.dead_enemies=2){
	        if (j=1) then p2+=string(obj_ncombat.dead_ene[j])+" and ";
	        if (j=2) then p2+=string(obj_ncombat.dead_ene[j])+" have been destroyed.";
	    }
	    if (obj_ncombat.dead_enemies>=3){
	        if (obj_ncombat.dead_ene[j]!="") and (obj_ncombat.dead_ene[j+1]!="") then p2+=string(obj_ncombat.dead_ene[j])+", ";
	        if (obj_ncombat.dead_ene[j]!="") and (obj_ncombat.dead_ene[j+1]="") then p2+=" and "+string(obj_ncombat.dead_ene[j])+" have been destroyed.";
	    }
	}
	j=0;repeat(100){j+=1;obj_ncombat.dead_ene[j]="";}
	obj_ncombat.dead_enemies=0;

	mes=p1+p2+p3;





	var led;led=0;
	if (wep[number_of_attacking_weapons]=="hammer_of_wrath") then led=2.1;
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






	exit;









	if (string_count("Bolt",wepp)>0) and (solod=false){flavored=1;
	    if (obj_ncombat.bolter_drilling=1) then wepp="Accurate "+wepp;
	    if (number_of_shots<200){
	        if (target.dudes_num[targeh]=1) and (casulties=0) then p1=$"{number_of_shots} {wepp}s fire.  A {target_name} is rocked by the bolts but survives.";
	        if (target.dudes_num[targeh]=1) and (casulties=1) then p1=$"{number_of_shots} {wepp}s fire.  A {target_name} absorbs most of the bolts and dies instantly.";
	        if (target.dudes_num[targeh]>1) and (casulties=0) then p1=$"{number_of_shots} {wepp} fire strikes the ranks (X{casulties} casulties) of the {target_name} but seemingly does no damage.";
	        if (target.dudes_num[targeh]>1) and (casulties>0) then p1=$"{number_of_shots} {wepp} rip through the {target_name} and purge {casulties}.";
	    }
	    if (number_of_shots>=200){
	        if (target.dudes_num[targeh]=1) and (casulties=0) then p1=$"{number_of_shots} {wepp}s fire.  Explosions clap across the armour of the {target_name}.";
	        if (target.dudes_num[targeh]=1) and (casulties=1) then p1=$"{number_of_shots} {wepp}s fire.  Explosions clap around the {target_name} and kill it instantly.";
	        if (target.dudes_num[targeh]>1) and (casulties=0) then p1=$"{number_of_shots} {wepp}s rip through the ranks (X{casulties} casulties) of {target_name}, seemingly doing no damage.";
	        if (target.dudes_num[targeh]>1) and (casulties>0) then p1=$"{number_of_shots} {wepp}s rip through the ranks (X{casulties} casulties) of {target_name}, {casulties} dying immediately.";
	    }
	}
	if (string_count("Bolt",wepp)>0) and (solod=true){flavored=1;
	    if (target.dudes_num[targeh]>1) and (casulties=0) then p1=+$"{string(full_name)} fires his {wepp} into the {target_name} ranks (X{casulties} casulties).";
	    if (target.dudes_num[targeh]>1) and (casulties>0) then p1=+$"{string(full_name)} into the {target_name} ranks (X{casulties} casulties) and kills {casulties}.";
	    if (target.dudes_num[targeh]=1) and (casulties=0) then p1=+$"{string(full_name)} into a {target_name} but fails to kill it.";
	    if (target.dudes_num[targeh]=1) and (casulties>0) then p1=+$"{string(full_name)} into a {target_name}, killing it.";
	}



	if (wepp="hammer_of_wrath"){
	    if (solod=false){flavored=1;
	        if (number_of_shots<20) then p1=$"{number_of_shots} Astartes with Jump Packs leap to the skies.  Sputtering and roaring flames herald their advance.  Once at a suitable height they crash back down amongst the enemy- ";
	        if (number_of_shots>=20) and (number_of_shots<100) then p1=$"Several squads of Astartes take to the sky, their Jump Packs roaring and shooting flames.  Once at a suitable height they crash back down amongst the enemy- ";
	        if (number_of_shots>=100) then p1=$"A literal wave of Astartes take to the sky, their Jump Packs roaring like one massive, angry beast.  Almost simultaneously they all crash back down, smashing their enemey- ";
        
	        if (target.dudes_num[targeh]>1) and (casulties=0) then p1+=" they smash into the {target_name} ranks (X{casulties} casulties) but fail to kill any.";
	        if (target.dudes_num[targeh]>1) and (casulties>0) then p1+=" they smash into the {target_name} ranks (X{casulties} casulties) and pulverize {casulties}.";
	        if (target.dudes_num[targeh]=1) and (casulties=0) then p1+="a {target_name} survives the attack.";
	        if (target.dudes_num[targeh]=1) and (casulties=1) then p1+="a {target_name} takes one of the charges and dies.";
	    }
	    if (solod=true){
	        if (target.dudes_num[targeh]=1) then p1=string(full_name)+" activates his Jump Pack and launches up into the air, and then crashes down into a {target_name}- ";
	        if (target.dudes_num[targeh]>1) then p1=string(full_name)+" activates his Jump Pack and launches up into the air, and then crashes down into the {target_name} ranks (X{casulties} casulties)- ";
    
	        if (target.dudes_num[targeh]=1) and (casulties=0) then p1+="it survives the attack.";
	        if (target.dudes_num[targeh]=1) and (casulties=1) then p1+="it is crumpled to the ground, dead instantly.";
	    }
	}




	if (string_count("Plasma Pistol",wepp)>0 || wepp=="Plasma Gun") and (solod=false){flavored=1;
	    if (target.dudes_num[targeh]=1) and (casulties=0) then p1=$"{number_of_shots} {wepp} shoot bolts of energy into a {target_name} (X{casulties} casulties).";
	    if (target.dudes_num[targeh]=1) and (casulties=1) then p1=$"{number_of_shots} {wepp} overwhelm a {target_name} with bolts of energy (X{casulties} casulties).";
	    if (target.dudes_num[targeh]>1) and (casulties=0) then p1=$"{number_of_shots} {wepp} shoot bolts of energy into the {target_name} ranks (X{casulties} casulties).";
	    if (target.dudes_num[targeh]>1) and (casulties>0) then p1=$"{number_of_shots} {wepp} shoot bolts of energy into the {target_name}, cleansing {casulties}.";
	}
	else if (wepp=="Assault Cannon") and (solod=false){flavored=1;
	    if (target.dudes_num[targeh]=1) and (casulties=0) then p1=$"{number_of_shots} {wepp}s hum and rotate, belching out bullets and flame alike.  Explosions clap across the armour of the {target_name}.  (X{casulties} casulties)";
	    if (target.dudes_num[targeh]=1) and (casulties=1) then p1=$"{number_of_shots} {wepp}s hum and rotate, belching out bullets and flame alike. A {target_name} is ripped apart by the rounds (X{casulties} casulties).";
	    if (target.dudes_num[targeh]>1) and (casulties=0) then p1=$"{number_of_shots} {wepp}s hum and rotate, belching out bullets and flame alike .  The {target_name}s are rocked but unharmed (X{casulties} casulties).";
	    if (target.dudes_num[targeh]>1) and (casulties>0) then p1=$"{number_of_shots} {wepp}s hum and rotate, belching out bullets and flame alike.  {casulties} {target_name} are purged (X{casulties} casulties).";
	}
	else if (string_count("Flamer",wepp)>0) and (solod=false){flavored=1;
	    if (target.dudes_num[targeh]=1) and (casulties=0) then p1=$"{number_of_shots} {wepp} bathe the {target_name} in holy promethium (X{casulties} casulties).";
	    if (target.dudes_num[targeh]=1) and (casulties=1) then p1=$"{number_of_shots} {wepp} flash-fry the {target_name} inside its armour (X{casulties} casulties).";
	    if (target.dudes_num[targeh]>1) and (casulties=0) then p1=$"{number_of_shots} {wepp} wash over the {target_name} ranks (X{casulties} casulties).";
	    if (target.dudes_num[targeh]>1) and (casulties>0) then p1=$"{number_of_shots} {wepp} bathe the {target_name} ranks (X{casulties} casulties) in holy promethium, cleansing {casulties}.";
	}
	else if (wepp="Missile Launcher") and (solod=false){flavored=1;
	    if (target.dudes_num[targeh]=1) and (casulties=0) then p1=$"{number_of_shots} {wepp} fire upon the {target_name} and fail to do damage (X{casulties} casulties).";
	    if (target.dudes_num[targeh]=1) and (casulties=1) then p1=$"{number_of_shots} {wepp} fire upon the {target_name} and blow it to small pieces (X{casulties} casulties).";
	    if (target.dudes_num[targeh]>1) and (casulties=0) then p1=$"{number_of_shots} {wepp} fire on the {target_name} ranks (X{casulties} casulties).";
	    if (target.dudes_num[targeh]>1) and (casulties>0) then p1=$"{number_of_shots} {wepp} fire upon the {target_name} ranks (X{casulties} casulties) and blow {casulties} to pieces.";
	}
	else if (wepp="Whirlwind Missiles") and (solod=false){flavored=1;
	    if (target.dudes_num[targeh]=1) and (casulties=0) then p1=$"{number_of_shots} Whirlwinds fire upon the {target_name} and fail to do damage.";
	    if (target.dudes_num[targeh]=1) and (casulties=1) then p1=$"{number_of_shots} Whirlwinds fire upon the {target_name} and blow it to small pieces.";
	    if (target.dudes_num[targeh]>1) and (casulties=0) then p1=$"{number_of_shots} Whirlwinds fire on the {target_name} ranks (X{casulties} casulties).";
	    if (target.dudes_num[targeh]>1) and (casulties>0) then p1=$"{number_of_shots} Whirlwinds fire upon the {target_name} ranks (X{casulties} casulties) and blow {casulties} to pieces.";
	}
	if (wepp="Sniper Rifle") and (solod=false){flavored=1;
	    if (target.dudes_num[targeh]=1) and (casulties=0) then p1=$"{number_of_shots} {wepp} fire upon the {target_name} and fail to do damage.";
	    if (target.dudes_num[targeh]=1) and (casulties=1) then p1=$"{number_of_shots} {wepp} fire upon the {target_name} and destroy it.";
	    if (target.dudes_num[targeh]>1) and (casulties=0) then p1=$"{number_of_shots} {wepp} fire on the {target_name} ranks (X{casulties} casulties).";
	    if (target.dudes_num[targeh]>1) and (casulties>0) then p1=$"{number_of_shots} {wepp} fire upon the {target_name} ranks (X{casulties} casulties) and kill {casulties}.";
	}
	if (wepp="Stalker Pattern Bolter") and (solod=false){flavored=1;
	    if (target.dudes_num[targeh]=1) and (casulties=0) then p1=$"{number_of_shots} {wepp} fire upon the {target_name} and fail to do damage.";
	    if (target.dudes_num[targeh]=1) and (casulties=1) then p1=$"{number_of_shots} {wepp} fire upon the {target_name} and destroy it.";
	    if (target.dudes_num[targeh]>1) and (casulties=0) then p1=$"{number_of_shots} {wepp} fire on the {target_name} ranks (X{casulties} casulties).";
	    if (target.dudes_num[targeh]>1) and (casulties>0) then p1=$"{number_of_shots} {wepp} fire upon the {target_name} ranks (X{casulties} casulties) and kill {casulties}.";
	}
	if ((wepp="Lascannon") or (wepp="Twin Linked Lascannon") or (wepp="Lascannons")) and (solod=false){flavored=1;
	    if (wepp="Lascannons"){wepp="Lascannon";number_of_shots=number_of_shots*2;}
	    if (number_of_shots=1) and (casulties=0) then p1=$"A {target_name} is struck by a {wepp} (X{casulties} casulties).";
	    if (number_of_shots=1) and (casulties=1) then p1=$"A {target_name} is struck by a {wepp} and killed instantly (X{casulties} casulties).";
	    if (number_of_shots>1) and (casulties=0) then p1=$"{number_of_shots} {wepp} fire upon a {target_name} and fail to kill it (X{casulties} casulties).";
	    if (number_of_shots>1) and (casulties=1) then p1=$"{number_of_shots} {wepp} fire upon a {target_name} and turn it into paste (X{casulties} casulties).";
	    if (number_of_shots>1) and (casulties>1) then p1=$"{number_of_shots} {wepp} fire and purge {casulties} {target_name}.";        
	}
	if (wepp="Webber") and (solod=false){flavored=1;
	    if ((target_name="Termagaunt") or (target_name="Hormagaunt")) and (casulties>0) then obj_ncombat.captured_gaunt+=casulties;
	    if (target.dudes_num[targeh]=1) and (casulties=0) then p1=$"{number_of_shots} {wepp} spray ooze on the {target_name} but fail to immobilize it.";
	    if (target.dudes_num[targeh]=1) and (casulties=1) then p1=$"{number_of_shots} {wepp} spray ooze on the {target_name} and fully immobilize it.";
	    if (target.dudes_num[targeh]>1) and (casulties=0) then p1=$"{number_of_shots} {wepp} spray ooze on the {target_name} ranks (X{casulties} casulties).";
	    if (target.dudes_num[targeh]>1) and (casulties>0) then p1=$"{number_of_shots} {wepp} spray ooze on the {target_name} ranks (X{casulties} casulties) and immobilize {casulties} of them.";
	}

	if (wepp="melee") or (wepp="Melee") or (wepp="fists")and (solod=false){flavored=1;var ra;ra=choose(1,2,3,4);
	    // This needs to be worked out
	    if (casulties=0) then p2="MELEE";
	    if (casulties>0){
	        p1=casulties+" {target_name} ";
	        if (ra=1) then p2="are struck down with gun-barrels and combat knifes.";
	        if (ra=2) then p2="are killed by your marines in hand-to-hand combat.";
	        if (ra=3) then p2="are smashed aside by your marines.";
	        if (ra=4) then p2="are struck down by your marines in melee.";
	    }
	}
	if (wepp="Close Combat Weapon") and (solod=false){
		flavored=1;
	    if (number_of_shots=1) and (casulties=0) then p1=$"A {target_name} is struck by a "+string(obj_ini.role[100][6])+" but survives.";
	    if (number_of_shots=1) and (casulties=1) then p1=$"A {target_name} is struck down by a "+string(obj_ini.role[100][6])+".";
	    if (number_of_shots>1) and (casulties=0) then p1=$"{number_of_shots} {string(obj_ini.role[100][6])}s wrench and smash at a {target_name} but fail to destroy it.";
	    if (number_of_shots>1) and (casulties>1) then p1=$"{number_of_shots} {string(obj_ini.role[100][6])}s stomp, wrench, and smash {casulties} {target_name} into paste.";
	}
	if (wepp="Chainsword") and (solod=false){flavored=1;
	    if (number_of_shots=1) and (casulties=0) then p1=$"A {target_name} is struck by a {wepp} but survives.";
	    if (number_of_shots=1) and (casulties=1) then p1=$"A {target_name} is cut down by a {wepp}.";
	    if (number_of_shots>1) and (casulties=0) then p1=$"{number_of_shots} Chainsword motors rev and hack at the {target_name} ranks (X{casulties} casulties).";
	    if (number_of_shots>1) and (casulties>0) then p1=$"{number_of_shots} Chainsword motors rev and hack away at the {target_name} ranks (X{casulties} casulties).  {casulties} are cut down.";
	}
	if (wepp="Sarissa") and (solod=false){flavored=1;
	    if (number_of_shots=1) and (casulties=0) then p1=$"A {target_name} is struck by a Battle Sister's {wepp} but survives.";
	    if (number_of_shots=1) and (casulties=1) then p1=$"A {target_name} is struck down by a Battle Sister's {wepp}.";
	    if (number_of_shots>1) and (casulties=0) then p1=$"A Battle Sister "+choose("howls out","roars")+" and hacks at the {target_name} ranks (X{casulties} casulties) with her Sarissa.";
	    if (number_of_shots>1) and (casulties>0) then p1=$"{number_of_shots} Battle Sisters "+choose("howl out","roar")+" as they hack away at the {target_name} ranks (X{casulties} casulties) with their Sarissas.  {casulties} are cut down.";
	}
	if (wepp="Eviscerator") and (solod=false){flavored=1;
	    if (number_of_shots=1) and (casulties=0) then p1=$"A {target_name} is struck by a {wepp} but survives.";
	    if (number_of_shots=1) and (casulties=1) then p1=$"A {target_name} is cut down by a {wepp}.";
	    if (number_of_shots>1) and (casulties=0) then p1=$"{number_of_shots} Eviscerators rev and howl, hacking at the {target_name} ranks (X{casulties} casulties).";
	    if (number_of_shots>1) and (casulties>0) then p1=$"{number_of_shots} Eviscerators rev and howl, hacking at the {target_name} ranks (X{casulties} casulties).  {casulties} are cut down.";
	}
	if (wepp="Force Staff") and (solod=false){flavored=1;
	    if (number_of_shots=1) and (casulties=0) then p1="A "+string(duhs)+" is blasted by a "+string(wepp)+" but survives.";
	    if (number_of_shots=1) and (casulties=1) then p1="A "+string(duhs)+" is incinerated by a "+string(wepp)+".";
	    if (number_of_shots>1) and (casulties=0) then p1=string(number_of_shots)+" "+string(wepp)+" crackle and swing into the "+string(duhs)+" ranks (X{casulties} casulties).";
	    if (number_of_shots>1) and (casulties>0) then p1=string(number_of_shots)+" "+string(wepp)+" crackle and swing into the "+string(duhs)+" ranks (X{casulties} casulties).  "+string(casulties)+" are smashed.";
	}
	if (wepp="Inactive Force Staff") and (solod=false){flavored=1;
	    if (number_of_shots=1) and (casulties=0) then p1="A "+string(duhs)+" is struck by a "+string(wepp)+" but survives.";
	    if (number_of_shots=1) and (casulties=1) then p1="A "+string(duhs)+" is smashed by a "+string(wepp)+".";
	    if (number_of_shots>1) and (casulties=0) then p1=string(number_of_shots)+" "+string(wepp)+" are swung into the "+string(duhs)+" ranks (X{casulties} casulties).";
	    if (number_of_shots>1) and (casulties>0) then p1=string(number_of_shots)+" "+string(wepp)+" are swung into the "+string(duhs)+" ranks (X{casulties} casulties).  "+string(casulties)+" are smashed.";
	}
	if ((string_count("Power",wepp)>0) or (wepp="Lightning Claw")) and (solod=false){flavored=1;
	    if (target.dudes_num[targeh]=1){
	        if (number_of_shots=1) and (casulties=0) then p1=$"A {target_name} is struck by a {wepp} but survives.";
	        if (number_of_shots=1) and (casulties=1) then p1=$"A {target_name} is struck down by a {wepp}.";
        
	        if (number_of_shots>1) and (casulties=0) then p1=$"A {target_name} is struck by {number_of_shots} {wepp}s but survives.";
	        if (number_of_shots>1) and (casulties=1) then p1=$"A {target_name} is struck down by {number_of_shots} {wepp}s.";
	    }
	    if (target.dudes_num[targeh]>1){
	        if (number_of_shots>1) and (casulties=0) then p1=$"{number_of_shots} {wepp}s crackle and spark, striking at the {target_name} ranks (X{casulties} casulties).";
	        if (number_of_shots>1) and (casulties>0) then p1=$"{number_of_shots} {wepp}s crackle and spark, hewing through the {target_name} ranks (X{casulties} casulties).  {casulties} are cut down.";
	    }
	}
	if ((string_count("Power",wepp)>0) or (wepp="Force Staff") or (wepp="Inactive Force Staff") or (wepp="Lightning Claw")) and (solod=true){flavored=1;
	    if (target.dudes_num[targeh]>1) and (casulties=0) then p1=string(full_name)+" swings his "+string(wepp)+" into the "+string(duhs)+" ranks (X{casulties} casulties).";
	    if (target.dudes_num[targeh]>1) and (casulties>0) then p1=string(full_name)+" swings his "+string(wepp)+" into the "+string(duhs)+" ranks (X{casulties} casulties) and kills "+string(casulties)+".";
	    if (target.dudes_num[targeh]=1) and (casulties=0) then p1=string(full_name)+" swings his "+string(wepp)+" into a "+string(duhs)+" but fails to kill it.";
	    if (target.dudes_num[targeh]=1) and (casulties>0) then p1=string(full_name)+" swings his "+string(wepp)+" into a "+string(duhs)+", killing it.";
	}


	if (flavored=0) and (solod=false){p1=$"{number_of_shots} {wepp} {target_name}X {casulties} casulties)";}
	if (flavored=0) and (solod=true){p1=$"("+string(full_name)+".{wepp}) {target_name} {casulties}|";}

	// if (string_length(p1+p2+p3)<8) then show_message(wepp+" is not displaying anything");

	mes=p1+p2+p3;


	var led;led=0;
	if (wep[number_of_attacking_weapons]="hammer_of_wrath") then led=2.1;
	if (obj_ncombat.enemy<=10){
	    if (target_name=obj_controller.faction_leader[obj_ncombat.enemy]){// Cleaning up the message for the enemy leader
	        mes=string_replace(mes,"a "+target_name,target_name);
	        mes=string_replace(mes,"the "+target_name,target_name);
	        mes=string_replace(mes,target_name+" ranks",target_name);
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
