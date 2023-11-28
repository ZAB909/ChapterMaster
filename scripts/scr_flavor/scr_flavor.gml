function scr_flavor(argument0, argument1, argument2, argument3, argument4) {


	// I forget the arguments for this, you'll have to deal
	// Generates flavor based on the damage and casualties from scr_shoot, only for the player


	targeh=argument2;
	var p1,p2,p3,mes,targeh;
	mes="";p1="";p2="";p3="";

	var wepp;wepp="";
	if (argument0>0){wepp=wep[argument0];}
	if (argument0=-51) then wepp="Heavy Bolter Emplacement";
	if (argument0=-52) then wepp="Missile Launcher Emplacement";
	if (argument0=-53) then wepp="Missile Silo";


	var duhs;duhs=argument1.dudes[targeh];

	if (duhs="Leader") and (obj_ncombat.enemy<=10){
	    duhs=obj_controller.faction_leader[obj_ncombat.enemy];
	}
	var solod,full_name,cm_kill;solod=false;full_name="";cm_kill=0;

	if (argument0>0){
	    if (wep_solo[argument0]!=""){
	        solod=true;full_name=wep_solo[argument0];
	        if (wep_title[argument0]!=""){
	            full_name=wep_title[argument0]+" "+wep_solo[argument0];
	        }
	        if (wep_solo[argument0]=obj_ini.master_name) then cm_kill=1;
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
	    if (duhs="Veteran Chaos Terminator") and (duhs>0) then obj_ncombat.chaos_angry+=argument4*2;
	    if (duhs="Veteran Chaos Chosen") and (duhs>0) then obj_ncombat.chaos_angry+=argument4;
	    if (duhs="Greater Daemon of Slaanesh") then obj_ncombat.chaos_angry+=argument4*5;
	    if (duhs="Greater Daemon of Tzeentch") then obj_ncombat.chaos_angry+=argument4*5;
	}

	if (argument1.flank=1) and (argument1.flyer=0) then duhs="flanking "+string(duhs);
    
	var flavored;flavored=0;






	if (string_count("Bolt",wepp)>0) and (solod=false){flavored=1;
	    if (obj_ncombat.bolter_drilling=1) then wepp="Accurate "+string(wepp);
	    if (argument3<200){
	        if (argument1.dudes_num[targeh]=1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+"s fire.";
	        if (argument1.dudes_num[targeh]=1) and (argument4=1) then p1=string(argument3)+" "+string(wepp)+"s fire.";
	        if (argument1.dudes_num[targeh]>1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+" fire strike the enemy ranks.";
	        if (argument1.dudes_num[targeh]>1) and (argument4>0) then p1=string(argument3)+" "+string(wepp)+" rip through the enemy ranks.";
	    }
	    if (argument3>=200){
	        if (argument1.dudes_num[targeh]=1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+"s fire.  Explosions clap across the "+string(duhs)+".";
	        if (argument1.dudes_num[targeh]=1) and (argument4=1) then p1=string(argument3)+" "+string(wepp)+"s fire.  Explosions clap around the "+string(duhs)+".";
	        if (argument1.dudes_num[targeh]>1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+"s rip through the enemy ranks.";
	        if (argument1.dudes_num[targeh]>1) and (argument4>0) then p1=string(argument3)+" "+string(wepp)+"s rip through the enemy ranks.";
	    }
	}
	if (string_count("Bolt",wepp)>0) and (solod=true){flavored=1;
	    if (argument1.dudes_num[targeh]>1) and (argument4=0) then p1=string(full_name)+" fires his "+string(wepp)+" into the "+string(duhs)+" ranks.";
	    if (argument1.dudes_num[targeh]>1) and (argument4>0) then p1=string(full_name)+" fires his "+string(wepp)+" into the "+string(duhs)+" ranks.";
	    if (argument1.dudes_num[targeh]=1) and (argument4=0) then p1=string(full_name)+" fires his "+string(wepp)+" into a "+string(duhs)+" but fails to kill it.";
	    if (argument1.dudes_num[targeh]=1) and (argument4>0) then p1=string(full_name)+" fires his "+string(wepp)+" into a "+string(duhs)+".";
	}



	if (wepp="hammer_of_wrath"){
	    if (solod=false){flavored=1;
	        if (argument3<20) then p1=string(argument3)+" Astartes with Jump Packs leap to the skies.  Sputtering and roaring flames herald their advance.  Once at a suitable height they crash back down amongst the enemy- ";
	        if (argument3>=20) and (argument3<100) then p1="Several squads of Astartes take to the sky, their Jump Packs roaring and shooting flames.  Once at a suitable height they crash back down amongst the enemy- ";
	        if (argument3>=100) then p1="A literal wave of Astartes take to the sky, their Jump Packs roaring like one massive, angry beast.  Almost simultaneously they all crash back down, smashing their enemey- ";
        
	        if (argument1.dudes_num[targeh]>1) and (argument4=0) then p1+="they smash into the "+string(duhs)+" ranks.";
	        if (argument1.dudes_num[targeh]>1) and (argument4>0) then p1+="they smash into the "+string(duhs)+" ranks.";
	        if (argument1.dudes_num[targeh]=1) and (argument4=0) then p1+="a "+string(duhs)+" survives the attack.";
	        if (argument1.dudes_num[targeh]=1) and (argument4=1) then p1+="a "+string(duhs)+" takes one of the charges.";
	    }
	    if (solod=true){
	        if (argument1.dudes_num[targeh]=1) then p1=string(full_name)+" activates his Jump Pack and launches up into the air, and then crashes down into a "+string(duhs)+"- ";
	        if (argument1.dudes_num[targeh]>1) then p1=string(full_name)+" activates his Jump Pack and launches up into the air, and then crashes down into the "+string(duhs)+" ranks- ";
	        if (argument1.dudes_num[targeh]=1) and (argument4=0) then p1+="it survives the attack.";
	        if (argument1.dudes_num[targeh]>1) and (argument4=0) then p1+="all survive the attack.";
	    }
	}




	if (string_count("Plasma Pistol",wepp)>0) and (solod=false){flavored=1;
	    if (argument1.dudes_num[targeh]=1) then p1=string(argument3)+" "+string(wepp)+" shoot bolts of energy into a "+string(duhs)+".";
	    if (argument1.dudes_num[targeh]>1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+" shoot bolts of energy into the "+string(duhs)+" ranks.";
	}
	if (wepp="Assault Cannon") and (solod=false){flavored=1;
	    if (argument3=1) then p1="An "+string(wepp)+" hums and rotates, belching out bullets and flame alike.";
	    if (argument3>1) then p1=string(argument3)+" "+string(wepp)+" hum and rotat, belching out bullets and flame alike.";
	}
	if (string_count("Flamer",wepp)>0) and (solod=false){flavored=1;
	    if (argument1.dudes_num[targeh]=1) then p1=string(argument3)+" "+string(wepp)+" bathe the "+string(duhs)+" in holy promethium.";
	    if (argument1.dudes_num[targeh]>1) and (argument4>0) then p1=string(argument3)+" "+string(wepp)+" bathe the "+string(duhs)+" ranks in holy promethium.";
	}
	if (wepp="Missile Launcher") and (solod=false){flavored=1;
	    if (argument1.dudes_num[targeh]=1) then p1=string(argument3)+" "+string(wepp)+" fire upon the "+string(duhs)+".";
	    if (argument1.dudes_num[targeh]>1) then p1=string(argument3)+" "+string(wepp)+" fire on the "+string(duhs)+" ranks.";
	}
	if (wepp="Whirlwind Missiles") and (solod=false){flavored=1;
	    if (argument1.dudes_num[targeh]=1) then p1=string(argument3)+" Whirlwinds fire upon the "+string(duhs)+".";
	    if (argument1.dudes_num[targeh]>1) then p1=string(argument3)+" Whirlwinds fire on the "+string(duhs)+" ranks.";
	}
	if (wepp="Sniper Rifle") and (solod=false){flavored=1;
	    if (argument1.dudes_num[targeh]=1) then p1=string(argument3)+" "+string(wepp)+" fire upon the "+string(duhs)+".";
	    if (argument1.dudes_num[targeh]>1) then p1=string(argument3)+" "+string(wepp)+" fire on the "+string(duhs)+" ranks.";
	}
	if (wepp="Stalker Pattern Bolter") and (solod=false){flavored=1;
	    if (argument1.dudes_num[targeh]=1) then p1=$"{string(argument3)} {string(wepp)} fire upon the {string(duhs)}.";
	    if (argument1.dudes_num[targeh]>1) then p1=$"{string(argument3)} {string(wepp)} fire on the {string(duhs)}.";
	}
	if ((wepp="Lascannon") or (wepp="Twin Linked Lascannon") or (wepp="Lascannons")) and (solod=false){flavored=1;
	    if (wepp="Lascannons"){wepp="Lascannon";argument3=argument3*2;}
	    if (argument3=1) then p1="A "+string(duhs)+" is struck by a "+string(wepp)+".";
	    if (argument3>1) then p1=string(argument3)+" "+string(wepp)+" fire upon the "+string(duhs)+" ranks.";        
	}
	if (wepp="Webber") and (solod=false){flavored=1;
	    if ((duhs="Termagaunt") or (duhs="Hormagaunt")) and (argument4>0) then obj_ncombat.captured_gaunt+=argument4;
	    if (argument1.dudes_num[targeh]=1) then p1=string(argument3)+" "+string(wepp)+" spray ooze on the "+string(duhs)+".";
	    if (argument1.dudes_num[targeh]>1) then p1=string(argument3)+" "+string(wepp)+" spray ooze on the "+string(duhs)+" ranks.";
	}

	if (wepp="melee") or (wepp="Melee") and (solod=false){flavored=1;var ra;ra=choose(1,2,3,4);
	    // This needs to be worked out
	    if (argument4=0) then p2="MELEE";
	    if (argument4>0){
	        p1="The "+string(duhs)+" ranks ";
	        if (ra=1) then p2="are struck with gun-barrels and combat knifes.";
	        if (ra=2) then p2="are savaged by your marines in hand-to-hand combat.";
	        if (ra=3) then p2="are smashed by your marines.";
	        if (ra=4) then p2="are struck by your marines in melee.";
	    }
	}
	if (wepp="Close Combat Weapon") and (solod=false){flavored=1;
	    if (argument3=1) then p1="A "+string(duhs)+" is struck by a "+string(obj_ini.role[100][6])+".";
	    if (argument3>1) then p1=string(argument3)+" "+string(obj_ini.role[100][6])+"s stomp, wrench, and smash at the "+string(duhs)+" ranks.";
	}
	if (wepp="Chainsword") and (solod=false){flavored=1;
	    if (argument3=1) then p1="A "+string(duhs)+" is struck by a "+string(wepp)+".";
	    if (argument3>1) then p1=string(argument3)+" Chainsword motors rev and hack at the "+string(duhs)+" ranks.";
	}
	if (wepp="Sarissa") and (solod=false){flavored=1;
	    if (argument3=1) then p1="A "+string(duhs)+" is struck by a Battle Sister's "+string(wepp)+".";
	    // if (argument3>1) and (argument4=0) then p1="A Battle Sister "+choose("howls out","roars")+" and hacks at the "+string(duhs)+" ranks with her Sarissa.";
	    if (argument3>1) then p1=string(argument3)+" Battle Sisters "+choose("howl out","roar")+" as they hack away at the "+string(duhs)+" ranks with their Sarissas.";
	}
	if (wepp="Eviscerator") and (solod=false){flavored=1;
	    if (argument3=1) then p1="A "+string(duhs)+" is struck by a "+string(wepp)+".";
	    if (argument3>1) then p1=string(argument3)+" Eviscerators rev and howl, hacking at the "+string(duhs)+" ranks.";
	}
	if (wepp="Force Weapon") and (solod=false){flavored=1;
	    if (argument3=1) then p1="A "+string(duhs)+" is blasted by a "+string(wepp)+".";
	    if (argument3>1) then p1=string(argument3)+" "+string(wepp)+" crackle and swing into the "+string(duhs)+" ranks.";
	}
	if (wepp="Inactive Force Weapon") and (solod=false){flavored=1;
	    if (argument3=1) then p1="A "+string(duhs)+" is struck by a "+string(wepp)+".";
	    if (argument3>1) then p1=string(argument3)+" "+string(wepp)+" are swung into the "+string(duhs)+" ranks.";
	}
	if ((string_count("Power",wepp)>0) or (wepp="Lightning Claw")) and (solod=false){flavored=1;
	    if (argument1.dudes_num[targeh]=1){
	        if (argument3=1) then p1="A "+string(duhs)+" is struck by a "+string(wepp)+".";
	        if (argument3>1) then p1="A "+string(duhs)+" is struck by "+string(argument3)+" "+string(wepp)+"s.";
	    }
	    if (argument1.dudes_num[targeh]>1){
	        if (argument3>1) then p1=string(argument3)+" "+string(wepp)+"s crackle and spark, striking at the "+string(duhs)+" ranks.";
	    }
	}
	if ((string_count("Power",wepp)>0) or (wepp="Force Weapon") or (wepp="Inactive Force Weapon") or (wepp="Lightning Claw")) and (solod=true){flavored=1;
	    if (argument1.dudes_num[targeh]>1) then p1=string(full_name)+" swings his "+string(wepp)+".";
	}


	if (flavored=0) and (solod=false){p1=string(argument3)+" "+string(wepp)+"|";}
	if (flavored=0) and (solod=true){p1="("+string(full_name)+"."+string(wepp)+")|";}




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
	if (wep[argument0]="hammer_of_wrath") then led=2.1;
	if (obj_ncombat.enemy<=10){
	    if (duhs=obj_controller.faction_leader[obj_ncombat.enemy]){// Cleaning up the message for the enemy leader
	        mes=string_replace(mes,"a "+string(duhs),string(duhs));
	        mes=string_replace(mes,"the "+string(duhs),string(duhs));
	        mes=string_replace(mes,string(duhs)+" ranks",string(duhs));
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
    
	    if (argument1.dudes_vehicle[targeh]=1) then obj_ncombat.message_sz[obj_ncombat.messages]=max(argument3,argument4*10)+(0.5-(obj_ncombat.messages/100));
	    else{obj_ncombat.message_sz[obj_ncombat.messages]=max(argument3,argument4)+(0.5-(obj_ncombat.messages/100));}
    
	    obj_ncombat.message_priority[obj_ncombat.messages]=led;
	    if (defenses=1) then obj_ncombat.message_priority[obj_ncombat.messages]+=3;
    
	    obj_ncombat.alarm[3]=2;
	    // need some method of determining who is firing
	}






	exit;









	if (string_count("Bolt",wepp)>0) and (solod=false){flavored=1;
	    if (obj_ncombat.bolter_drilling=1) then wepp="Accurate "+string(wepp);
	    if (argument3<200){
	        if (argument1.dudes_num[targeh]=1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+"s fire.  A "+string(duhs)+" is rocked by the bolts but survives.";
	        if (argument1.dudes_num[targeh]=1) and (argument4=1) then p1=string(argument3)+" "+string(wepp)+"s fire.  A "+string(duhs)+" absorbs most of the bolts and dies instantly.";
	        if (argument1.dudes_num[targeh]>1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+" fire strikes the ranks of the "+string(duhs)+" but seemingly does no damage.";
	        if (argument1.dudes_num[targeh]>1) and (argument4>0) then p1=string(argument3)+" "+string(wepp)+" rip through the "+string(duhs)+" and purge "+string(argument4)+".";
	    }
	    if (argument3>=200){
	        if (argument1.dudes_num[targeh]=1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+"s fire.  Explosions clap across the armour of the "+string(duhs)+".";
	        if (argument1.dudes_num[targeh]=1) and (argument4=1) then p1=string(argument3)+" "+string(wepp)+"s fire.  Explosions clap around the "+string(duhs)+" and kill it instantly.";
	        if (argument1.dudes_num[targeh]>1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+"s rip through the ranks of "+string(duhs)+", seemingly doing no damage.";
	        if (argument1.dudes_num[targeh]>1) and (argument4>0) then p1=string(argument3)+" "+string(wepp)+"s rip through the ranks of "+string(duhs)+", "+string(argument4)+" dying immediately.";
	    }
	}
	if (string_count("Bolt",wepp)>0) and (solod=true){flavored=1;
	    if (argument1.dudes_num[targeh]>1) and (argument4=0) then p1=string(full_name)+" fires his "+string(wepp)+" into the "+string(duhs)+" ranks.";
	    if (argument1.dudes_num[targeh]>1) and (argument4>0) then p1=string(full_name)+" fires his "+string(wepp)+" into the "+string(duhs)+" ranks and kills "+string(argument4)+".";
	    if (argument1.dudes_num[targeh]=1) and (argument4=0) then p1=string(full_name)+" fires his "+string(wepp)+" into a "+string(duhs)+" but fails to kill it.";
	    if (argument1.dudes_num[targeh]=1) and (argument4>0) then p1=string(full_name)+" fires his "+string(wepp)+" into a "+string(duhs)+", killing it.";
	}



	if (wepp="hammer_of_wrath"){
	    if (solod=false){flavored=1;
	        if (argument3<20) then p1=string(argument3)+" Astartes with Jump Packs leap to the skies.  Sputtering and roaring flames herald their advance.  Once at a suitable height they crash back down amongst the enemy- ";
	        if (argument3>=20) and (argument3<100) then p1="Several squads of Astartes take to the sky, their Jump Packs roaring and shooting flames.  Once at a suitable height they crash back down amongst the enemy- ";
	        if (argument3>=100) then p1="A literal wave of Astartes take to the sky, their Jump Packs roaring like one massive, angry beast.  Almost simultaneously they all crash back down, smashing their enemey- ";
        
	        if (argument1.dudes_num[targeh]>1) and (argument4=0) then p1+=" they smash into the "+string(duhs)+" ranks but fail to kill any.";
	        if (argument1.dudes_num[targeh]>1) and (argument4>0) then p1+=" they smash into the "+string(duhs)+" ranks and pulverize "+string(argument4)+".";
	        if (argument1.dudes_num[targeh]=1) and (argument4=0) then p1+="a "+string(duhs)+" survives the attack.";
	        if (argument1.dudes_num[targeh]=1) and (argument4=1) then p1+="a "+string(duhs)+" takes one of the charges and dies.";
	    }
	    if (solod=true){
	        if (argument1.dudes_num[targeh]=1) then p1=string(full_name)+" activates his Jump Pack and launches up into the air, and then crashes down into a "+string(duhs)+"- ";
	        if (argument1.dudes_num[targeh]>1) then p1=string(full_name)+" activates his Jump Pack and launches up into the air, and then crashes down into the "+string(duhs)+" ranks- ";
    
	        if (argument1.dudes_num[targeh]=1) and (argument4=0) then p1+="it survives the attack.";
	        if (argument1.dudes_num[targeh]=1) and (argument4=1) then p1+="it is crumpled to the ground, dead instantly.";
	    }
	}




	if (string_count("Plasma Pistol",wepp)>0) and (solod=false){flavored=1;
	    if (argument1.dudes_num[targeh]=1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+" shoot bolts of energy into a "+string(duhs)+".";
	    if (argument1.dudes_num[targeh]=1) and (argument4=1) then p1=string(argument3)+" "+string(wepp)+" overwhelm a "+string(duhs)+" with bolts of energy.";
	    if (argument1.dudes_num[targeh]>1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+" shoot bolts of energy into the "+string(duhs)+" ranks.";
	    if (argument1.dudes_num[targeh]>1) and (argument4>0) then p1=string(argument3)+" "+string(wepp)+" shoot bolts of energy into the "+string(duhs)+", cleansing "+string(argument4)+".";
	}
	if (wepp="Assault Cannon") and (solod=false){flavored=1;
	    if (argument1.dudes_num[targeh]=1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+"s hum and rotate, belching out bullets and flame alike.  Explosions clap across the armour of the "+string(duhs)+".";
	    if (argument1.dudes_num[targeh]=1) and (argument4=1) then p1=string(argument3)+" "+string(wepp)+"s hum and rotate, belching out bullets and flame alike. A "+string(duhs)+" is ripped apart by the rounds.";
	    if (argument1.dudes_num[targeh]>1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+"s hum and rotate, belching out bullets and flame alike .  The "+string(duhs)+"s are rocked but unharmed.";
	    if (argument1.dudes_num[targeh]>1) and (argument4>0) then p1=string(argument3)+" "+string(wepp)+"s hum and rotate, belching out bullets and flame alike.  "+string(argument4)+" "+string(duhs)+" are purged.";
	}
	if (string_count("Flamer",wepp)>0) and (solod=false){flavored=1;
	    if (argument1.dudes_num[targeh]=1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+" bathe the "+string(duhs)+" in holy promethium.";
	    if (argument1.dudes_num[targeh]=1) and (argument4=1) then p1=string(argument3)+" "+string(wepp)+" flash-fry the "+string(duhs)+" inside its armour.";
	    if (argument1.dudes_num[targeh]>1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+" wash over the "+string(duhs)+" ranks.";
	    if (argument1.dudes_num[targeh]>1) and (argument4>0) then p1=string(argument3)+" "+string(wepp)+" bathe the "+string(duhs)+" ranks in holy promethium, cleansing "+string(argument4)+".";
	}
	if (wepp="Missile Launcher") and (solod=false){flavored=1;
	    if (argument1.dudes_num[targeh]=1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+" fire upon the "+string(duhs)+" and fail to do damage.";
	    if (argument1.dudes_num[targeh]=1) and (argument4=1) then p1=string(argument3)+" "+string(wepp)+" fire upon the "+string(duhs)+" and blow it to small pieces.";
	    if (argument1.dudes_num[targeh]>1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+" fire on the "+string(duhs)+" ranks.";
	    if (argument1.dudes_num[targeh]>1) and (argument4>0) then p1=string(argument3)+" "+string(wepp)+" fire upon the "+string(duhs)+" ranks and blow "+string(argument4)+" to pieces.";
	}
	if (wepp="Whirlwind Missiles") and (solod=false){flavored=1;
	    if (argument1.dudes_num[targeh]=1) and (argument4=0) then p1=string(argument3)+" Whirlwinds fire upon the "+string(duhs)+" and fail to do damage.";
	    if (argument1.dudes_num[targeh]=1) and (argument4=1) then p1=string(argument3)+" Whirlwinds fire upon the "+string(duhs)+" and blow it to small pieces.";
	    if (argument1.dudes_num[targeh]>1) and (argument4=0) then p1=string(argument3)+" Whirlwinds fire on the "+string(duhs)+" ranks.";
	    if (argument1.dudes_num[targeh]>1) and (argument4>0) then p1=string(argument3)+" Whirlwinds fire upon the "+string(duhs)+" ranks and blow "+string(argument4)+" to pieces.";
	}
	if (wepp="Sniper Rifle") and (solod=false){flavored=1;
	    if (argument1.dudes_num[targeh]=1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+" fire upon the "+string(duhs)+" and fail to do damage.";
	    if (argument1.dudes_num[targeh]=1) and (argument4=1) then p1=string(argument3)+" "+string(wepp)+" fire upon the "+string(duhs)+" and destroy it.";
	    if (argument1.dudes_num[targeh]>1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+" fire on the "+string(duhs)+" ranks.";
	    if (argument1.dudes_num[targeh]>1) and (argument4>0) then p1=string(argument3)+" "+string(wepp)+" fire upon the "+string(duhs)+" ranks and kill "+string(argument4)+".";
	}
	if (wepp="Stalker Pattern Bolter") and (solod=false){flavored=1;
	    if (argument1.dudes_num[targeh]=1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+" fire upon the "+string(duhs)+" and fail to do damage.";
	    if (argument1.dudes_num[targeh]=1) and (argument4=1) then p1=string(argument3)+" "+string(wepp)+" fire upon the "+string(duhs)+" and destroy it.";
	    if (argument1.dudes_num[targeh]>1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+" fire on the "+string(duhs)+" ranks.";
	    if (argument1.dudes_num[targeh]>1) and (argument4>0) then p1=string(argument3)+" "+string(wepp)+" fire upon the "+string(duhs)+" ranks and kill "+string(argument4)+".";
	}
	if ((wepp="Lascannon") or (wepp="Twin Linked Lascannon") or (wepp="Lascannons")) and (solod=false){flavored=1;
	    if (wepp="Lascannons"){wepp="Lascannon";argument3=argument3*2;}
	    if (argument3=1) and (argument4=0) then p1="A "+string(duhs)+" is struck by a "+string(wepp)+".";
	    if (argument3=1) and (argument4=1) then p1="A "+string(duhs)+" is struck by a "+string(wepp)+" and killed instantly.";
	    if (argument3>1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+" fire upon a "+string(duhs)+" and fail to kill it.";
	    if (argument3>1) and (argument4=1) then p1=string(argument3)+" "+string(wepp)+" fire upon a "+string(duhs)+" and turn it into paste.";
	    if (argument3>1) and (argument4>1) then p1=string(argument3)+" "+string(wepp)+" fire and purge "+string(argument4)+" "+string(duhs)+".";        
	}
	if (wepp="Webber") and (solod=false){flavored=1;
	    if ((duhs="Termagaunt") or (duhs="Hormagaunt")) and (argument4>0) then obj_ncombat.captured_gaunt+=argument4;
	    if (argument1.dudes_num[targeh]=1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+" spray ooze on the "+string(duhs)+" but fail to immobilize it.";
	    if (argument1.dudes_num[targeh]=1) and (argument4=1) then p1=string(argument3)+" "+string(wepp)+" spray ooze on the "+string(duhs)+" and fully immobilize it.";
	    if (argument1.dudes_num[targeh]>1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+" spray ooze on the "+string(duhs)+" ranks.";
	    if (argument1.dudes_num[targeh]>1) and (argument4>0) then p1=string(argument3)+" "+string(wepp)+" spray ooze on the "+string(duhs)+" ranks and immobilize "+string(argument4)+" of them.";
	}

	if (wepp="melee") or (wepp="Melee") and (solod=false){flavored=1;var ra;ra=choose(1,2,3,4);
	    // This needs to be worked out
	    if (argument4=0) then p2="MELEE";
	    if (argument4>0){
	        p1=string(argument4)+" "+string(duhs)+" ";
	        if (ra=1) then p2="are struck down with gun-barrels and combat knifes.";
	        if (ra=2) then p2="are killed by your marines in hand-to-hand combat.";
	        if (ra=3) then p2="are smashed aside by your marines.";
	        if (ra=4) then p2="are struck down by your marines in melee.";
	    }
	}
	if (wepp="Close Combat Weapon") and (solod=false){flavored=1;
	    if (argument3=1) and (argument4=0) then p1="A "+string(duhs)+" is struck by a "+string(obj_ini.role[100][6])+" but survives.";
	    if (argument3=1) and (argument4=1) then p1="A "+string(duhs)+" is struck down by a "+string(obj_ini.role[100][6])+".";
	    if (argument3>1) and (argument4=0) then p1=string(argument3)+" "+string(obj_ini.role[100][6])+"s wrench and smash at a "+string(duhs)+" but fail to destroy it.";
	    if (argument3>1) and (argument4>1) then p1=string(argument3)+" "+string(obj_ini.role[100][6])+"s stomp, wrench, and smash "+string(argument4)+" "+string(duhs)+" into paste.";
	}
	if (wepp="Chainsword") and (solod=false){flavored=1;
	    if (argument3=1) and (argument4=0) then p1="A "+string(duhs)+" is struck by a "+string(wepp)+" but survives.";
	    if (argument3=1) and (argument4=1) then p1="A "+string(duhs)+" is cut down by a "+string(wepp)+".";
	    if (argument3>1) and (argument4=0) then p1=string(argument3)+" Chainsword motors rev and hack at the "+string(duhs)+" ranks.";
	    if (argument3>1) and (argument4>0) then p1=string(argument3)+" Chainsword motors rev and hack away at the "+string(duhs)+" ranks.  "+string(argument4)+" are cut down.";
	}
	if (wepp="Sarissa") and (solod=false){flavored=1;
	    if (argument3=1) and (argument4=0) then p1="A "+string(duhs)+" is struck by a Battle Sister's "+string(wepp)+" but survives.";
	    if (argument3=1) and (argument4=1) then p1="A "+string(duhs)+" is struck down by a Battle Sister's "+string(wepp)+".";
	    if (argument3>1) and (argument4=0) then p1="A Battle Sister "+choose("howls out","roars")+" and hacks at the "+string(duhs)+" ranks with her Sarissa.";
	    if (argument3>1) and (argument4>0) then p1=string(argument3)+" Battle Sisters "+choose("howl out","roar")+" as they hack away at the "+string(duhs)+" ranks with their Sarissas.  "+string(argument4)+" are cut down.";
	}
	if (wepp="Eviscerator") and (solod=false){flavored=1;
	    if (argument3=1) and (argument4=0) then p1="A "+string(duhs)+" is struck by a "+string(wepp)+" but survives.";
	    if (argument3=1) and (argument4=1) then p1="A "+string(duhs)+" is cut down by a "+string(wepp)+".";
	    if (argument3>1) and (argument4=0) then p1=string(argument3)+" Eviscerators rev and howl, hacking at the "+string(duhs)+" ranks.";
	    if (argument3>1) and (argument4>0) then p1=string(argument3)+" Eviscerators rev and howl, hacking at the "+string(duhs)+" ranks.  "+string(argument4)+" are cut down.";
	}
	if (wepp="Force Weapon") and (solod=false){flavored=1;
	    if (argument3=1) and (argument4=0) then p1="A "+string(duhs)+" is blasted by a "+string(wepp)+" but survives.";
	    if (argument3=1) and (argument4=1) then p1="A "+string(duhs)+" is incinerated by a "+string(wepp)+".";
	    if (argument3>1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+" crackle and swing into the "+string(duhs)+" ranks.";
	    if (argument3>1) and (argument4>0) then p1=string(argument3)+" "+string(wepp)+" crackle and swing into the "+string(duhs)+" ranks.  "+string(argument4)+" are smashed.";
	}
	if (wepp="Inactive Force Weapon") and (solod=false){flavored=1;
	    if (argument3=1) and (argument4=0) then p1="A "+string(duhs)+" is struck by a "+string(wepp)+" but survives.";
	    if (argument3=1) and (argument4=1) then p1="A "+string(duhs)+" is smashed by a "+string(wepp)+".";
	    if (argument3>1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+" are swung into the "+string(duhs)+" ranks.";
	    if (argument3>1) and (argument4>0) then p1=string(argument3)+" "+string(wepp)+" are swung into the "+string(duhs)+" ranks.  "+string(argument4)+" are smashed.";
	}
	if ((string_count("Power",wepp)>0) or (wepp="Lightning Claw")) and (solod=false){flavored=1;
	    if (argument1.dudes_num[targeh]=1){
	        if (argument3=1) and (argument4=0) then p1="A "+string(duhs)+" is struck by a "+string(wepp)+" but survives.";
	        if (argument3=1) and (argument4=1) then p1="A "+string(duhs)+" is struck down by a "+string(wepp)+".";
        
	        if (argument3>1) and (argument4=0) then p1="A "+string(duhs)+" is struck by "+string(argument3)+" "+string(wepp)+"s but survives.";
	        if (argument3>1) and (argument4=1) then p1="A "+string(duhs)+" is struck down by "+string(argument3)+" "+string(wepp)+"s.";
	    }
	    if (argument1.dudes_num[targeh]>1){
	        if (argument3>1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+"s crackle and spark, striking at the "+string(duhs)+" ranks.";
	        if (argument3>1) and (argument4>0) then p1=string(argument3)+" "+string(wepp)+"s crackle and spark, hewing through the "+string(duhs)+" ranks.  "+string(argument4)+" are cut down.";
	    }
	}
	if ((string_count("Power",wepp)>0) or (wepp="Force Weapon") or (wepp="Inactive Force Weapon") or (wepp="Lightning Claw")) and (solod=true){flavored=1;
	    if (argument1.dudes_num[targeh]>1) and (argument4=0) then p1=string(full_name)+" swings his "+string(wepp)+" into the "+string(duhs)+" ranks.";
	    if (argument1.dudes_num[targeh]>1) and (argument4>0) then p1=string(full_name)+" swings his "+string(wepp)+" into the "+string(duhs)+" ranks and kills "+string(argument4)+".";
	    if (argument1.dudes_num[targeh]=1) and (argument4=0) then p1=string(full_name)+" swings his "+string(wepp)+" into a "+string(duhs)+" but fails to kill it.";
	    if (argument1.dudes_num[targeh]=1) and (argument4>0) then p1=string(full_name)+" swings his "+string(wepp)+" into a "+string(duhs)+", killing it.";
	}


	if (flavored=0) and (solod=false){p1=string(argument3)+" "+string(wepp)+"|"+string(duhs)+"|"+string(argument4)+"|";}
	if (flavored=0) and (solod=true){p1="("+string(full_name)+"."+string(wepp)+") |"+string(duhs)+"|"+string(argument4)+"|";}

	// if (string_length(p1+p2+p3)<8) then show_message(string(wepp)+" is not displaying anything");

	mes=p1+p2+p3;


	var led;led=0;
	if (wep[argument0]="hammer_of_wrath") then led=2.1;
	if (obj_ncombat.enemy<=10){
	    if (duhs=obj_controller.faction_leader[obj_ncombat.enemy]){// Cleaning up the message for the enemy leader
	        mes=string_replace(mes,"a "+string(duhs),string(duhs));
	        mes=string_replace(mes,"the "+string(duhs),string(duhs));
	        mes=string_replace(mes,string(duhs)+" ranks",string(duhs));
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
    
	    if (argument1.dudes_vehicle[targeh]=1) then obj_ncombat.message_sz[obj_ncombat.messages]=max(argument3,argument4*10)+(0.5-(obj_ncombat.messages/100));
	    else{obj_ncombat.message_sz[obj_ncombat.messages]=max(argument3,argument4)+(0.5-(obj_ncombat.messages/100));}
    
	    obj_ncombat.message_priority[obj_ncombat.messages]=led;
	    if (defenses=1) then obj_ncombat.message_priority[obj_ncombat.messages]+=3;
    
	    obj_ncombat.alarm[3]=2;
	    // need some method of determining who is firing
	}











	exit;






	// I forget the arguments for this, you'll have to deal
	// Generates flavor based on the damage and casualties from scr_shoot, only for the player

	targeh=argument2;
	var p1,p2,p3,mes,targeh;
	mes="";p1="";p2="";p3="";

	var wepp;wepp="";
	if (argument0>0){wepp=wep[argument0];}
	if (argument0=-51) then wepp="Heavy Bolter Emplacement";
	if (argument0=-52) then wepp="Missile Launcher Emplacement";
	if (argument0=-53) then wepp="Missile Silo";


	var duhs;duhs=argument1.dudes[targeh];

	if (duhs="Leader") and (obj_ncombat.enemy<=10){
	    duhs=obj_controller.faction_leader[obj_ncombat.enemy];
	}
	var solod,full_name,cm_kill;solod=false;full_name="";cm_kill=0;

	if (argument0>0){
	    if (wep_solo[argument0]!=""){
	        solod=true;full_name=wep_solo[argument0];
	        if (wep_title[argument0]!=""){
	            full_name=wep_title[argument0]+" "+wep_solo[argument0];
	        }
	        if (wep_solo[argument0]=obj_ini.master_name) then cm_kill=1;
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




	if (cm_kill=1) and (argument4>0){
	    if (duhs="Autarch") then obj_ini.master_autarch+=argument4;
	    if (duhs="Farseer") then obj_ini.master_farseer+=argument4;
	    if (duhs="Warlock") then obj_ini.master_warlock+=argument4;
	    if (duhs="Avatar") or (duhs="Mighty Avatar") or (duhs="Godly Avatar") then obj_ini.master_avatar+=argument4;
	    if (duhs="Ranger") then obj_ini.master_aspect+=argument4;
	    if (duhs="Pathfinder") and (enemy=6) then obj_ini.master_aspect+=argument4;
	    if (duhs="Dire Avenger") then obj_ini.master_aspect+=argument4;
	    if (duhs="Dire Avenger Exarch") then obj_ini.master_aspect+=argument4;
	    if (duhs="Howling Banshee") then obj_ini.master_aspect+=argument4;
	    if (duhs="Howling Banshee Exarch") then obj_ini.master_aspect+=argument4;
	    if (duhs="Striking Scorpian") then obj_ini.master_aspect+=argument4;
	    if (duhs="Striking Scorpian Exarch") then obj_ini.master_aspect+=argument4;
	    if (duhs="Warp Spider") then obj_ini.master_aspect+=argument4;
	    if (duhs="Warp Spider Exarch") then obj_ini.master_aspect+=argument4;
	    if (duhs="Dark Reaper") then obj_ini.master_aspect+=argument4;
	    if (duhs="Dark Reaper Exarch") then obj_ini.master_aspect+=argument4;
	    if (duhs="Shining Spear") then obj_ini.master_aspect+=argument4;
	    if (duhs="Wraithguard") then obj_ini.master_aspect+=argument4;
	    if (duhs="Guardian") then obj_ini.master_eldar+=argument4;
	    if (duhs="Grav Platform") then obj_ini.master_eldar_vehicles+=argument4;
	    if (duhs="Trouper") then obj_ini.master_eldar+=argument4;
	    if (duhs="Athair") then obj_ini.master_eldar+=argument4;
	    if (duhs="Vyper") then obj_ini.master_eldar_vehicles+=argument4;
	    if (duhs="Falcon") then obj_ini.master_eldar_vehicles+=argument4;
	    if (duhs="Fire Prism") then obj_ini.master_eldar_vehicles+=argument4;
	    if (duhs="Nightspinner") then obj_ini.master_eldar_vehicles+=argument4;
	    if (duhs="Wraithlord") then obj_ini.master_eldar_vehicles+=argument4;
	    if (duhs="Phantom Titan") then obj_ini.master_eldar_vehicles+=argument4;
    
	    if (duhs="Minor Warboss") then obj_ini.master_ork_nobz+=argument4;
	    if (duhs="Warboss") then obj_ini.master_ork_warboss+=argument4;
	    if (duhs="Big Warboss") then obj_ini.master_ork_warboss+=argument4;
	    if (string_count("oy",duhs)>0) then obj_ini.master_ork_boyz+=argument4;
	    if (duhs="Mekboy") or (duhs="Meganob") or (duhs="Flash Git") or (duhs="Cybork") then obj_ini.master_ork_nobz+=argument4;
	    if (duhs="Ard Boy") or (duhs="Kommando") or (duhs="Tank Busta") then obj_ini.master_ork_boyz+=argument4;
	    if (duhs="Dread") or (duhs="Battle Wagon") then obj_ini.master_ork_vehicles+=argument4;
    
	    if (duhs="Fire Warrior") or ((duhs="Pathfinder") and (enemy=8)) then obj_ini.master_tau+=argument4;
	    if (string_count("XV",duhs)>0) then obj_ini.master_battlesuits+=argument4;
	    if (duhs="Kroot") then obj_ini.master_kroot+=argument4;
	    if (duhs="Devilfish") or (duhs="Hammerhead") then obj_ini.master_tau_vehicles+=argument4;

	    if (duhs="Hive Tyrant") then obj_ini.master_tyrant+=argument4;
	    if (duhs="Zoanthrope") or (duhs="Lictor") then obj_ini.master_synapse+=argument4;
	    if (duhs="Tyrant Guard") or (duhs="Tyranid Warrior") then obj_ini.master_warriors+=argument4;;
	    if (duhs="Cultist") then obj_ini.master_heretics+=argument4;
	    if (duhs="Carnifex") then obj_ini.master_carnifex+=argument4;
	    if (duhs="Termagaunt") or (duhs="Hormagaunt") then obj_ini.master_gaunts+=argument4;
	    if (duhs="Genestealer") or (duhs="Genestealer Patriarch") then obj_ini.master_gene+=argument4;
    
	    if (duhs="Chaos Lord") then obj_ini.master_chaos_marines+=argument4;
	    if (duhs="Chaos Sorcerer") then obj_ini.master_chaos_marines+=argument4;
	    if (duhs="Warpsmith") then obj_ini.master_chaos_marines+=argument4;
	    if (duhs="Chaos Terminator") then obj_ini.master_chaos_marines+=argument4;
	    if (duhs="Obliterator") then obj_ini.master_chaos_marines+=argument4;
	    if (duhs="Chaos Chosen") then obj_ini.master_chaos_marines+=argument4;
	    if (duhs="Possessed") then obj_ini.master_chaos_marines+=argument4;
	    if (duhs="Chaos Space Marine") then obj_ini.master_chaos_marines+=argument4;
	    if (duhs="Havoc") then obj_ini.master_chaos_marines+=argument4;
	    if (duhs="Raptor") then obj_ini.master_chaos_marines+=argument4;
	    if (duhs="Khorne Berzerker") then obj_ini.master_chaos_marines+=argument4;
	    if (duhs="Plague Marine") then obj_ini.master_chaos_marines+=argument4;
	    if (duhs="Noise Marine") then obj_ini.master_chaos_marines+=argument4;
	    if (duhs="Rubric Marine") then obj_ini.master_chaos_marines+=argument4;
	    if (duhs="Cultist") then obj_ini.master_heretics+=argument4;
	    if (duhs="Rhino") then obj_ini.master_chaos_vehicles+=argument4;
	    if (duhs="Predator") then obj_ini.master_chaos_vehicles+=argument4;
	    if (duhs="Vindicator") then obj_ini.master_chaos_vehicles+=argument4;
	    if (duhs="Land Raider") then obj_ini.master_chaos_vehicles+=argument4;
	    if (duhs="Heldrake") then obj_ini.master_chaos_vehicles+=argument4;
	    if (duhs="Defiler") then obj_ini.master_chaos_vehicles+=argument4;
	    if (duhs="Arch Heretic") then obj_ini.master_heretics+=argument4;
	    if (duhs="Cultist Elite") then obj_ini.master_heretics+=argument4;
	    if (duhs="Mutant") then obj_ini.master_heretics+=argument4;
	    if (duhs="Daemonhost") then obj_ini.master_greater_demons+=argument4;
	    if (duhs="Greater Daemon of Khorne") then obj_ini.master_greater_demons+=argument4;
	    if (duhs="Greater Daemon of Slaanesh") then obj_ini.master_greater_demons+=argument4;
	    if (duhs="Greater Daemon of Nurgle") then obj_ini.master_greater_demons+=argument4;
	    if (duhs="Greater Daemon of Tzeentch") then obj_ini.master_greater_demons+=argument4;
	    if (duhs="Technical") then obj_ini.master_chaos_vehicles+=argument4;
	    if (duhs="Chaos Leman Russ") then obj_ini.master_chaos_vehicles+=argument4;
	    if (duhs="Chaos Basilisk") then obj_ini.master_chaos_vehicles+=argument4;
    
	    if (duhs="Necron Overlord") then obj_ini.master_necron_overlord+=argument4;
	    if (duhs="Lychguard") then obj_ini.master_necron+=argument4;
	    if (duhs="Flayed One") then obj_ini.master_necron+=argument4;
	    if (duhs="Necron Warrior") then obj_ini.master_necron+=argument4;
	    if (duhs="Necron Immortal") then obj_ini.master_necron+=argument4;
	    if (duhs="Necron Wraith") then obj_ini.master_wraith+=argument4;
	    if (duhs="Necron Destroyer") then obj_ini.master_destroyer+=argument4;
	    if (duhs="Tomb Stalker") then obj_ini.master_necron_vehicles+=argument4;
	    if (duhs="Canoptek Spyder") then obj_ini.master_necron_vehicles+=argument4;
	    if (duhs="Necron Monolith") then obj_ini.master_monolith+=argument4;
	    if (duhs="Doomsday Arc") then obj_ini.master_necron_vehicles+=argument4;
	}


	if (obj_ncombat.battle_special="WL10_reveal") or (obj_ncombat.battle_special="WL10_later"){
	    if (duhs="Veteran Chaos Terminator") and (duhs>0) then obj_ncombat.chaos_angry+=argument4*2;
	    if (duhs="Veteran Chaos Chosen") and (duhs>0) then obj_ncombat.chaos_angry+=argument4;
	    if (duhs="Greater Daemon of Slaanesh") then obj_ncombat.chaos_angry+=argument4*5;
	    if (duhs="Greater Daemon of Tzeentch") then obj_ncombat.chaos_angry+=argument4*5;
	}



	if (argument1.flank=1) and (argument1.flyer=0) then duhs="flanking "+string(duhs);
    
	var flavored;flavored=0;

	if (string_count("Bolt",wepp)>0) and (solod=false){flavored=1;
	    if (obj_ncombat.bolter_drilling=1) then wepp="Accurate "+string(wepp);
	    if (argument3<200){
	        if (argument1.dudes_num[targeh]=1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+"s fire.  A "+string(duhs)+" is rocked by the bolts but survives.";
	        if (argument1.dudes_num[targeh]=1) and (argument4=1) then p1=string(argument3)+" "+string(wepp)+"s fire.  A "+string(duhs)+" absorbs most of the bolts and dies instantly.";
	        if (argument1.dudes_num[targeh]>1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+" fire strikes the ranks of the "+string(duhs)+" but seemingly does no damage.";
	        if (argument1.dudes_num[targeh]>1) and (argument4>0) then p1=string(argument3)+" "+string(wepp)+" rip through the "+string(duhs)+" and purge "+string(argument4)+".";
	    }
	    if (argument3>=200){
	        if (argument1.dudes_num[targeh]=1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+"s fire.  Explosions clap across the armour of the "+string(duhs)+".";
	        if (argument1.dudes_num[targeh]=1) and (argument4=1) then p1=string(argument3)+" "+string(wepp)+"s fire.  Explosions clap around the "+string(duhs)+" and kill it instantly.";
	        if (argument1.dudes_num[targeh]>1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+"s rip through the ranks of "+string(duhs)+", seemingly doing no damage.";
	        if (argument1.dudes_num[targeh]>1) and (argument4>0) then p1=string(argument3)+" "+string(wepp)+"s rip through the ranks of "+string(duhs)+", "+string(argument4)+" dying immediately.";
	    }
	}
	if (string_count("Bolt",wepp)>0) and (solod=true){flavored=1;
	    if (argument1.dudes_num[targeh]>1) and (argument4=0) then p1=string(full_name)+" fires his "+string(wepp)+" into the "+string(duhs)+" ranks.";
	    if (argument1.dudes_num[targeh]>1) and (argument4>0) then p1=string(full_name)+" fires his "+string(wepp)+" into the "+string(duhs)+" ranks and kills "+string(argument4)+".";
	    if (argument1.dudes_num[targeh]=1) and (argument4=0) then p1=string(full_name)+" fires his "+string(wepp)+" into a "+string(duhs)+" but fails to kill it.";
	    if (argument1.dudes_num[targeh]=1) and (argument4>0) then p1=string(full_name)+" fires his "+string(wepp)+" into a "+string(duhs)+", killing it.";
	}



	if (wepp="hammer_of_wrath"){
	    if (solod=false){flavored=1;
	        if (argument3<20) then p1=string(argument3)+" Astartes with Jump Packs leap to the skies.  Sputtering and roaring flames herald their advance.  Once at a suitable height they crash back down amongst the enemy- ";
	        if (argument3>=20) and (argument3<100) then p1="Several squads of Astartes take to the sky, their Jump Packs roaring and shooting flames.  Once at a suitable height they crash back down amongst the enemy- ";
	        if (argument3>=100) then p1="A literal wave of Astartes take to the sky, their Jump Packs roaring like one massive, angry beast.  Almost simultaneously they all crash back down, smashing their enemey- ";
        
	        if (argument1.dudes_num[targeh]>1) and (argument4=0) then p1+=" they smash into the "+string(duhs)+" ranks but fail to kill any.";
	        if (argument1.dudes_num[targeh]>1) and (argument4>0) then p1+=" they smash into the "+string(duhs)+" ranks and pulverize "+string(argument4)+".";
	        if (argument1.dudes_num[targeh]=1) and (argument4=0) then p1+="a "+string(duhs)+" survives the attack.";
	        if (argument1.dudes_num[targeh]=1) and (argument4=1) then p1+="a "+string(duhs)+" takes one of the charges and dies.";
	    }
	    if (solod=true){
	        if (argument1.dudes_num[targeh]=1) then p1=string(full_name)+" activates his Jump Pack and launches up into the air, and then crashes down into a "+string(duhs)+"- ";
	        if (argument1.dudes_num[targeh]>1) then p1=string(full_name)+" activates his Jump Pack and launches up into the air, and then crashes down into the "+string(duhs)+" ranks- ";
    
	        if (argument1.dudes_num[targeh]=1) and (argument4=0) then p1+="it survives the attack.";
	        if (argument1.dudes_num[targeh]=1) and (argument4=1) then p1+="it is crumpled to the ground, dead instantly.";
	    }
	}




	if (string_count("Plasma Pistol",wepp)>0) and (solod=false){flavored=1;
	    if (argument1.dudes_num[targeh]=1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+" shoot bolts of energy into a "+string(duhs)+".";
	    if (argument1.dudes_num[targeh]=1) and (argument4=1) then p1=string(argument3)+" "+string(wepp)+" overwhelm a "+string(duhs)+" with bolts of energy.";
	    if (argument1.dudes_num[targeh]>1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+" shoot bolts of energy into the "+string(duhs)+" ranks.";
	    if (argument1.dudes_num[targeh]>1) and (argument4>0) then p1=string(argument3)+" "+string(wepp)+" shoot bolts of energy into the "+string(duhs)+", cleansing "+string(argument4)+".";
	}
	if (wepp="Assault Cannon") and (solod=false){flavored=1;
	    if (argument1.dudes_num[targeh]=1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+"s hum and rotate, belching out bullets and flame alike.  Explosions clap across the armour of the "+string(duhs)+".";
	    if (argument1.dudes_num[targeh]=1) and (argument4=1) then p1=string(argument3)+" "+string(wepp)+"s hum and rotate, belching out bullets and flame alike. A "+string(duhs)+" is ripped apart by the rounds.";
	    if (argument1.dudes_num[targeh]>1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+"s hum and rotate, belching out bullets and flame alike .  The "+string(duhs)+"s are rocked but unharmed.";
	    if (argument1.dudes_num[targeh]>1) and (argument4>0) then p1=string(argument3)+" "+string(wepp)+"s hum and rotate, belching out bullets and flame alike.  "+string(argument4)+" "+string(duhs)+" are purged.";
	}
	if (string_count("Flamer",wepp)>0) and (solod=false){flavored=1;
	    if (argument1.dudes_num[targeh]=1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+" bathe the "+string(duhs)+" in holy promethium.";
	    if (argument1.dudes_num[targeh]=1) and (argument4=1) then p1=string(argument3)+" "+string(wepp)+" flash-fry the "+string(duhs)+" inside its armour.";
	    if (argument1.dudes_num[targeh]>1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+" wash over the "+string(duhs)+" ranks.";
	    if (argument1.dudes_num[targeh]>1) and (argument4>0) then p1=string(argument3)+" "+string(wepp)+" bathe the "+string(duhs)+" ranks in holy promethium, cleansing "+string(argument4)+".";
	}
	if (wepp="Missile Launcher") and (solod=false){flavored=1;
	    if (argument1.dudes_num[targeh]=1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+" fire upon the "+string(duhs)+" and fail to do damage.";
	    if (argument1.dudes_num[targeh]=1) and (argument4=1) then p1=string(argument3)+" "+string(wepp)+" fire upon the "+string(duhs)+" and blow it to small pieces.";
	    if (argument1.dudes_num[targeh]>1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+" fire on the "+string(duhs)+" ranks.";
	    if (argument1.dudes_num[targeh]>1) and (argument4>0) then p1=string(argument3)+" "+string(wepp)+" fire upon the "+string(duhs)+" ranks and blow "+string(argument4)+" to pieces.";
	}
	if (wepp="Whirlwind Missiles") and (solod=false){flavored=1;
	    if (argument1.dudes_num[targeh]=1) and (argument4=0) then p1=string(argument3)+" Whirlwinds fire upon the "+string(duhs)+" and fail to do damage.";
	    if (argument1.dudes_num[targeh]=1) and (argument4=1) then p1=string(argument3)+" Whirlwinds fire upon the "+string(duhs)+" and blow it to small pieces.";
	    if (argument1.dudes_num[targeh]>1) and (argument4=0) then p1=string(argument3)+" Whirlwinds fire on the "+string(duhs)+" ranks.";
	    if (argument1.dudes_num[targeh]>1) and (argument4>0) then p1=string(argument3)+" Whirlwinds fire upon the "+string(duhs)+" ranks and blow "+string(argument4)+" to pieces.";
	}
	if (wepp="Sniper Rifle") and (solod=false){flavored=1;
	    if (argument1.dudes_num[targeh]=1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+" fire upon the "+string(duhs)+" and fail to do damage.";
	    if (argument1.dudes_num[targeh]=1) and (argument4=1) then p1=string(argument3)+" "+string(wepp)+" fire upon the "+string(duhs)+" and destroy it.";
	    if (argument1.dudes_num[targeh]>1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+" fire on the "+string(duhs)+" ranks.";
	    if (argument1.dudes_num[targeh]>1) and (argument4>0) then p1=string(argument3)+" "+string(wepp)+" fire upon the "+string(duhs)+" ranks and kill "+string(argument4)+".";
	}
	if (wepp="Stalker Pattern Bolter") and (solod=false){flavored=1;
	    if (argument1.dudes_num[targeh]=1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+" fire upon the "+string(duhs)+" and fail to do damage.";
	    if (argument1.dudes_num[targeh]=1) and (argument4=1) then p1=string(argument3)+" "+string(wepp)+" fire upon the "+string(duhs)+" and destroy it.";
	    if (argument1.dudes_num[targeh]>1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+" fire on the "+string(duhs)+" ranks.";
	    if (argument1.dudes_num[targeh]>1) and (argument4>0) then p1=string(argument3)+" "+string(wepp)+" fire upon the "+string(duhs)+" ranks and kill "+string(argument4)+".";
	}
	if ((wepp="Lascannon") or (wepp="Twin Linked Lascannon") or (wepp="Lascannons")) and (solod=false){flavored=1;
	    if (wepp="Lascannons"){wepp="Lascannon";argument3=argument3*2;}
	    if (argument3=1) and (argument4=0) then p1="A "+string(duhs)+" is struck by a "+string(wepp)+".";
	    if (argument3=1) and (argument4=1) then p1="A "+string(duhs)+" is struck by a "+string(wepp)+" and killed instantly.";
	    if (argument3>1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+" fire upon a "+string(duhs)+" and fail to kill it.";
	    if (argument3>1) and (argument4=1) then p1=string(argument3)+" "+string(wepp)+" fire upon a "+string(duhs)+" and turn it into paste.";
	    if (argument3>1) and (argument4>1) then p1=string(argument3)+" "+string(wepp)+" fire and purge "+string(argument4)+" "+string(duhs)+".";        
	}
	if (wepp="Webber") and (solod=false){flavored=1;
	    if ((duhs="Termagaunt") or (duhs="Hormagaunt")) and (argument4>0) then obj_ncombat.captured_gaunt+=argument4;
	    if (argument1.dudes_num[targeh]=1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+" spray ooze on the "+string(duhs)+" but fail to immobilize it.";
	    if (argument1.dudes_num[targeh]=1) and (argument4=1) then p1=string(argument3)+" "+string(wepp)+" spray ooze on the "+string(duhs)+" and fully immobilize it.";
	    if (argument1.dudes_num[targeh]>1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+" spray ooze on the "+string(duhs)+" ranks.";
	    if (argument1.dudes_num[targeh]>1) and (argument4>0) then p1=string(argument3)+" "+string(wepp)+" spray ooze on the "+string(duhs)+" ranks and immobilize "+string(argument4)+" of them.";
	}

	if (wepp="melee") or (wepp="Melee") and (solod=false){flavored=1;var ra;ra=choose(1,2,3,4);
	    // This needs to be worked out
	    if (argument4=0) then p2="MELEE";
	    if (argument4>0){
	        p1=string(argument4)+" "+string(duhs)+" ";
	        if (ra=1) then p2="are struck down with gun-barrels and combat knifes.";
	        if (ra=2) then p2="are killed by your marines in hand-to-hand combat.";
	        if (ra=3) then p2="are smashed aside by your marines.";
	        if (ra=4) then p2="are struck down by your marines in melee.";
	    }
	}
	if (wepp="Close Combat Weapon") and (solod=false){flavored=1;
	    if (argument3=1) and (argument4=0) then p1="A "+string(duhs)+" is struck by a "+string(obj_ini.role[100][6])+" but survives.";
	    if (argument3=1) and (argument4=1) then p1="A "+string(duhs)+" is struck down by a "+string(obj_ini.role[100][6])+".";
	    if (argument3>1) and (argument4=0) then p1=string(argument3)+" "+string(obj_ini.role[100][6])+"s wrench and smash at a "+string(duhs)+" but fail to destroy it.";
	    if (argument3>1) and (argument4>1) then p1=string(argument3)+" "+string(obj_ini.role[100][6])+"s stomp, wrench, and smash "+string(argument4)+" "+string(duhs)+" into paste.";
	}
	if (wepp="Chainsword") and (solod=false){flavored=1;
	    if (argument3=1) and (argument4=0) then p1="A "+string(duhs)+" is struck by a "+string(wepp)+" but survives.";
	    if (argument3=1) and (argument4=1) then p1="A "+string(duhs)+" is cut down by a "+string(wepp)+".";
	    if (argument3>1) and (argument4=0) then p1=string(argument3)+" Chainsword motors rev and hack at the "+string(duhs)+" ranks.";
	    if (argument3>1) and (argument4>0) then p1=string(argument3)+" Chainsword motors rev and hack away at the "+string(duhs)+" ranks.  "+string(argument4)+" are cut down.";
	}
	if (wepp="Sarissa") and (solod=false){flavored=1;
	    if (argument3=1) and (argument4=0) then p1="A "+string(duhs)+" is struck by a Battle Sister's "+string(wepp)+" but survives.";
	    if (argument3=1) and (argument4=1) then p1="A "+string(duhs)+" is struck down by a Battle Sister's "+string(wepp)+".";
	    if (argument3>1) and (argument4=0) then p1="A Battle Sister "+choose("howls out","roars")+" and hacks at the "+string(duhs)+" ranks with her Sarissa.";
	    if (argument3>1) and (argument4>0) then p1=string(argument3)+" Battle Sisters "+choose("howl out","roar")+" as they hack away at the "+string(duhs)+" ranks with their Sarissas.  "+string(argument4)+" are cut down.";
	}
	if (wepp="Eviscerator") and (solod=false){flavored=1;
	    if (argument3=1) and (argument4=0) then p1="A "+string(duhs)+" is struck by a "+string(wepp)+" but survives.";
	    if (argument3=1) and (argument4=1) then p1="A "+string(duhs)+" is cut down by a "+string(wepp)+".";
	    if (argument3>1) and (argument4=0) then p1=string(argument3)+" Eviscerators rev and howl, hacking at the "+string(duhs)+" ranks.";
	    if (argument3>1) and (argument4>0) then p1=string(argument3)+" Eviscerators rev and howl, hacking at the "+string(duhs)+" ranks.  "+string(argument4)+" are cut down.";
	}
	if (wepp="Force Weapon") and (solod=false){flavored=1;
	    if (argument3=1) and (argument4=0) then p1="A "+string(duhs)+" is blasted by a "+string(wepp)+" but survives.";
	    if (argument3=1) and (argument4=1) then p1="A "+string(duhs)+" is incinerated by a "+string(wepp)+".";
	    if (argument3>1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+" crackle and swing into the "+string(duhs)+" ranks.";
	    if (argument3>1) and (argument4>0) then p1=string(argument3)+" "+string(wepp)+" crackle and swing into the "+string(duhs)+" ranks.  "+string(argument4)+" are smashed.";
	}
	if (wepp="Inactive Force Weapon") and (solod=false){flavored=1;
	    if (argument3=1) and (argument4=0) then p1="A "+string(duhs)+" is struck by a "+string(wepp)+" but survives.";
	    if (argument3=1) and (argument4=1) then p1="A "+string(duhs)+" is smashed by a "+string(wepp)+".";
	    if (argument3>1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+" are swung into the "+string(duhs)+" ranks.";
	    if (argument3>1) and (argument4>0) then p1=string(argument3)+" "+string(wepp)+" are swung into the "+string(duhs)+" ranks.  "+string(argument4)+" are smashed.";
	}
	if ((string_count("Power",wepp)>0) or (wepp="Lightning Claw")) and (solod=false){flavored=1;
	    if (argument1.dudes_num[targeh]=1){
	        if (argument3=1) and (argument4=0) then p1="A "+string(duhs)+" is struck by a "+string(wepp)+" but survives.";
	        if (argument3=1) and (argument4=1) then p1="A "+string(duhs)+" is struck down by a "+string(wepp)+".";
        
	        if (argument3>1) and (argument4=0) then p1="A "+string(duhs)+" is struck by "+string(argument3)+" "+string(wepp)+"s but survives.";
	        if (argument3>1) and (argument4=1) then p1="A "+string(duhs)+" is struck down by "+string(argument3)+" "+string(wepp)+"s.";
	    }
	    if (argument1.dudes_num[targeh]>1){
	        if (argument3>1) and (argument4=0) then p1=string(argument3)+" "+string(wepp)+"s crackle and spark, striking at the "+string(duhs)+" ranks.";
	        if (argument3>1) and (argument4>0) then p1=string(argument3)+" "+string(wepp)+"s crackle and spark, hewing through the "+string(duhs)+" ranks.  "+string(argument4)+" are cut down.";
	    }
	}
	if ((string_count("Power",wepp)>0) or (wepp="Force Weapon") or (wepp="Inactive Force Weapon") or (wepp="Lightning Claw")) and (solod=true){flavored=1;
	    if (argument1.dudes_num[targeh]>1) and (argument4=0) then p1=string(full_name)+" swings his "+string(wepp)+" into the "+string(duhs)+" ranks.";
	    if (argument1.dudes_num[targeh]>1) and (argument4>0) then p1=string(full_name)+" swings his "+string(wepp)+" into the "+string(duhs)+" ranks and kills "+string(argument4)+".";
	    if (argument1.dudes_num[targeh]=1) and (argument4=0) then p1=string(full_name)+" swings his "+string(wepp)+" into a "+string(duhs)+" but fails to kill it.";
	    if (argument1.dudes_num[targeh]=1) and (argument4>0) then p1=string(full_name)+" swings his "+string(wepp)+" into a "+string(duhs)+", killing it.";
	}


	if (flavored=0) and (solod=false){p1=string(argument3)+" "+string(wepp)+"|"+string(duhs)+"|"+string(argument4)+"|";}
	if (flavored=0) and (solod=true){p1="("+string(full_name)+"."+string(wepp)+") |"+string(duhs)+"|"+string(argument4)+"|";}

	// if (string_length(p1+p2+p3)<8) then show_message(string(wepp)+" is not displaying anything");

	mes=p1+p2+p3;


	var led;led=0;
	if (wep[argument0]="hammer_of_wrath") then led=2.1;
	if (obj_ncombat.enemy<=10){
	    if (duhs=obj_controller.faction_leader[obj_ncombat.enemy]){// Cleaning up the message for the enemy leader
	        mes=string_replace(mes,"a "+string(duhs),string(duhs));
	        mes=string_replace(mes,"the "+string(duhs),string(duhs));
	        mes=string_replace(mes,string(duhs)+" ranks",string(duhs));
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
    
	    if (argument1.dudes_vehicle[targeh]=1) then obj_ncombat.message_sz[obj_ncombat.messages]=max(argument3,argument4*10)+(0.5-(obj_ncombat.messages/100));
	    else{obj_ncombat.message_sz[obj_ncombat.messages]=max(argument3,argument4)+(0.5-(obj_ncombat.messages/100));}
    
	    obj_ncombat.message_priority[obj_ncombat.messages]=led;
	    if (defenses=1) then obj_ncombat.message_priority[obj_ncombat.messages]+=3;
    
	    obj_ncombat.alarm[3]=2;
	    // need some method of determining who is firing
	}


}
