function scr_en_weapon(name, is_man, man_number, man_type, group) {

	// check if double ranged/melee
	// then add to that weapon
                
	//scr_infantry_weapon
	// name: name
	// is_man: man?
	// man_number: number
	// man_type: owner
	// group: current dudes block

	// Determines combined damage for enemy battle blocks for a single weapon

	var atta,arp,acr,rang,amm,spli,faith_bonus;
	i=0;rang=0;atta=0;spli=0;
	arp=0;acr=0;amm=-1;faith_bonus=0;

	if (string_count("elee",name)>0){
	    var to;to=string_delete(name,0,5);
	    atta=10;arp=0;rang=1;spli=1;
	}

	//if (obj_ncombat.enemy=5) then faith_bonus=faith[man_type];

	if (name="Venom Claws"){atta=200;arp=0;rang=1;spli=0;if (obj_ini.preomnor=1){atta=240;}}
	if (name="Web Spinner"){atta=40;arp=0;rang=2.1;spli=1;amm=1;}
	if (name="Warpsword"){atta=300;arp=1;rang=1;spli=1;}
	if (name="Iron Claw"){atta=400;arp=1;rang=1;spli=0;}
	if (name="Maulerfiend Claws"){atta=300;arp=300;rang=1;spli=1;}

	if (name="Eldritch Fire"){atta=80;arp=1;rang=5.1;}
	if (name="Bloodletter Melee"){atta=70;arp=0;rang=1;spli=1;}
	if (name="Daemonette Melee"){atta=65;arp=0;rang=1;spli=1;}
	if (name="Plaguebearer Melee"){atta=60;arp=0;rang=1;spli=1;if (obj_ini.preomnor=1){atta=70;}}
	if (name="Khorne Demon Melee"){atta=350;arp=1;rang=1;spli=1;}
	if (name="Demon Melee"){atta=250;arp=1;rang=1;spli=1;}
	if (name="Lash Whip"){atta=80;arp=0;rang=2;}
	if (name="Nurgle Vomit"){atta=100;arp=0;rang=2;spli=1;if (obj_ini.preomnor=1){atta=260;}}
	if (name="Multi-Melta"){atta=200;arp=1;rang=4.1;spli=0;amm=6;}


	if (obj_ncombat.enemy=3){
	    if (name="Phased Plasma-fusil"){atta=100;arp=1;rang=7.1;spli=1;}
	    if (name="Lightning Gun"){atta=choose(80,80,80,150);arp=0;rang=5;spli=0;}
	    if (name="Thallax Melee"){atta=80;arp=0;rang=1;spli=1;}
	}



	if (obj_ncombat.enemy=6){

	    if (name="Fusion Gun") or (name="Firepike"){atta=200;arp=1;rang=2;amm=4;}
	    if (name="Singing Spear"){atta=120;arp=0;rang=1;spli=1;}
	    if (name="Singing Spear Throw"){atta=120;arp=1;rang=2;spli=1;}
	    if (name="Witchblade"){atta=100;arp=1;rang=1;}
	    if (name="Psyshock"){atta=50;arp=0;rang=2;}
	    if (name="Wailing Doom"){atta=200;arp=1;rang=1;spli=1;}
	    if (name="Avatar Smite"){atta=300;arp=1;rang=2;amm=2;}
	    if (name="Ranger Long Rifle"){atta=60;arp=0;rang=25;}
	    if (name="Pathfinder Long Rifle"){atta=70;arp=0;rang=25;}
	    if (name="Shuriken Catapult"){atta=35;arp=0;rang=2;}
	    if (name="Twin Linked Shuriken Catapult"){atta=50;arp=0;rang=2;}
	    if (name="Avenger Shuriken Catapult"){atta=40;arp=0;rang=3;}
	    if (name="Power Weapon") or (name="Power Blades"){atta=80;arp=0;rang=1;spli=1;}
	    if (name="Shuriken Pistol"){atta=25;arp=0;rang=2.1;}
	    if (name="Executioner"){atta=200;arp=1;rang=1;}
	    if (name="Scorpion Chainsword"){atta=40;arp=0;rang=1;spli=1;}
	    if (name="Mandiblaster"){atta=20;arp=0;rang=1;}
	    if (name="Biting Blade"){atta=70;arp=0;rang=1;spli=1;}
	    if (name="Scorpian's Claw"){atta=150;arp=1;rang=1;spli=1;}
	    if (name="Meltabomb"){atta=0;arp=200;rang=1;amm=1;}
	    if (name="Deathspinner"){atta=50;arp=0;rang=2;}
	    if (name="Dual Deathspinner"){atta=80;arp=0;rang=2;}
	    if (name="Reaper Launcher"){atta=150;arp=80;rang=20;amm=8;spli=1;}
	    if (name="Eldar Missile Launcher"){atta=200;arp=1;rang=20;amm=4;spli=1;}
	    if (name="Laser Lance"){atta=80;arp=0;rang=2;spli=1;}
	    if (name="Fusion Pistol"){atta=100;arp=1;rang=1.1;amm=4;}
	    if (name="Plasma Pistol"){atta=60;arp=1;rang=3.1;}
	    if (name="Harlequin's Kiss"){atta=350;arp=0;rang=1;amm=1;}
	    if (name="Wraithcannon"){atta=80;arp=1;rang=2.1;}
	    if (name="Pulse Laser"){atta=80;arp=1;rang=15;}
	    if (name="Bright Lance"){atta=100;arp=1;rang=8;}
	    if (name="Shuriken Cannon"){atta=65;arp=0;rang=3;}
	    if (name="Prism Cannon"){atta=250;arp=1;rang=20;}
	    if (name="Twin Linked Doomweaver"){atta=100;arp=0;rang=2;}// Also create difficult terrain?
	    if (name="Starcannon"){atta=140;arp=1;rang=3;spli=1;}
	    if (name="Two Power Fists"){atta=300;arp=1;rang=1;}
	    if (name="Flamer"){atta=250;arp=0;rang=2;amm=4;spli=1;}
	    if (name="Titan Starcannon"){atta=220;arp=1;rang=4;spli=1;}
	    if (name="Phantom Pulsar"){atta=500;arp=1;rang=20;spli=1;}
	}



	if (obj_ncombat.enemy=7){
	    if (name="Choppa"){atta=28;arp=0;rang=1;spli=1;}
	    if (name="Power Klaw"){atta=150;arp=1;rang=1;spli=1;}
	    if (name="Slugga"){atta=30;arp=0;rang=4;amm=4;spli=1;}
	    if (name="Tankbusta Bomb"){atta=260;arp=1;rang=1;amm=2;spli=0;}
	    if (name="Big Shoota"){atta=80;arp=0;rang=18;amm=30;spli=0;}
	    if (name="Dakkagun"){atta=90;arp=1;rang=10;amm=20;spli=0;}
	    if (name="Deffgun"){atta=90;arp=1;rang=6;amm=6;spli=0;}
	    if (name="Snazzgun"){atta=80;arp=0;rang=10;spli=1;}
	    if (name="Grot Blasta"){atta=12;arp=0;rang=2;amm=6;}
	    if (name="Kannon"){atta=200;arp=1;rang=12.1;amm=5;spli=1;}
	    if (name="Shoota"){atta=30;arp=0;rang=8;}
	    if (name="Burna"){atta=200;arp=1;rang=2;amm=4;spli=1;}
	    if (name="Skorcha"){atta=160;arp=1;rang=2;amm=6;spli=1;}
	    if (name="Rokkit Launcha"){atta=130;arp=1;rang=15;spli=0;}
	    if (name="Krooz Missile"){atta=250;arp=1;rang=15;spli=1;}
	}



	if (obj_ncombat.enemy=8){
	    if (name="Fusion Blaster"){atta=200;arp=1;rang=2;amm=4;}
	    if (name="Plasma Rifle"){atta=120;arp=1;rang=10;}
	    if (name="Cyclic Ion Blaster"){atta=180;arp=0;rang=6;spli=1;}// x6
	    if (name="Burst Rifle"){atta=130;arp=0;rang=16;spli=1;}
	    if (name="Missile Pod"){atta=160;arp=1;rang=15;amm=6;spli=1;}
	    if (name="Smart Missile System"){atta=150;arp=1;rang=15;}
	    if (name="Small Railgun"){atta=150;arp=1;rang=18;}
	    if (name="Pulse Rifle"){atta=37;arp=0;rang=12;}
	    if (name="Rail Rifle"){atta=65;arp=0;rang=14;}
	    if (name="Kroot Rifle"){atta=25;arp=0;rang=6;}
	    if (name="Vespid Crystal"){atta=60;arp=0;rang=2.1;}
	    if (name="Railgun"){atta=400;arp=1;rang=20;}
	}




	if (obj_ncombat.enemy=9){
	    if (name="Bonesword"){atta=120;arp=0;rang=1;spli=1;}
	    if (name="Lash Whip"){atta=80;arp=0;rang=2;}
	    if (name="Heavy Venom Cannon"){atta=150;arp=1;rang=8;}
	    if (name="Crushing Claws"){atta=90;arp=1;rang=1;spli=1;}
	    if (name="Rending Claws"){atta=80;arp=1;rang=1;spli=1;}
	    if (name="Devourer"){atta=choose(40,60,80,100);arp=0;rang=5;if (obj_ini.preomnor=1){atta=choose(48,72,96,120);}}
	    if (name="Zoanthrope Blast"){atta=200;arp=1;rang=2;}
	    if (name="Carnifex Claws"){atta=300;arp=1;rang=1;spli=1;}
	    if (name="Venom Cannon"){atta=150;arp=0;rang=5;}
	    if (name="Deathspitter"){atta=100;arp=0;rang=2.1;if (obj_ini.preomnor=1){atta=120;}}
	    if (name="Fleshborer"){atta=15;arp=0;rang=2.1;if (obj_ini.preomnor=1){atta=19;}}
	    if (name="Scything Talons"){atta=30;arp=0;rang=1;}
	    if (name="Genestealer Claws"){atta=choose(105,105,130);arp=1;rang=1;}
	    if (name="Witchfire"){atta=100;arp=1;rang=2;}
	    if (name="Autogun"){atta=20;arp=0;rang=10;amm=12;spli=1;}
	    if (name="Lictor Claws"){atta=300;arp=0;rang=1;}
	    if (name="Flesh Hooks"){atta=50;arp=0;rang=2;amm=1;}
	}


	if (obj_ncombat.enemy>=10) or (obj_ncombat.enemy=2) or (obj_ncombat.enemy=5) or (obj_ncombat.enemy=1){
	    if (name="Plasma Pistol"){atta=70;arp=1;rang=3.1;}
	    if (name="Power Weapon"){atta=120;arp=0;rang=1;}
	    if (name="Power Sword"){atta=120;arp=0;rang=1;}
	    if (name="Force Weapon"){atta=400;arp=1;rang=1;}
	    if (name="Chainfist"){atta=300;arp=1;rang=1;spli=1;}
	    if (name="Meltagun"){atta=300;arp=1;rang=2;amm=4;}
	    if (name="Flamer"){atta=250;arp=0;rang=2.1;amm=4;spli=1;}
	    if (name="Heavy Flamer"){atta=500;arp=0;rang=2.1;amm=6;spli=1;}
	    if (name="Combi-Flamer"){atta=120;arp=0;rang=2.1;amm=1;spli=1;}
	    if (name="Bolter"){atta=45;arp=0;rang=18;amm=16;if (obj_ncombat.enemy=5) then atta=35;}// Bursts
	    if (name="Power Fist"){atta=425;arp=1;rang=1;}
	    if (name="Possessed Claws"){atta=550;arp=1;rang=1;spli=1;}
	    if (name="Missile Launcher"){atta=200;arp=0;rang=20;amm=4;spli=1;}
	    if (name="Chainsword"){atta=60;arp=1;rang=1;}
	    if (name="Bolt Pistol"){atta=35;arp=0;rang=3.1;amm=18;}
	    if (name="Chainaxe"){atta=100;arp=0;rang=1;}
	    if (name="Poisoned Chainsword"){atta=90;arp=0;rang=1;if (obj_ini.preomnor=1){atta=130;}}
	    if (name="Sonic Blaster"){atta=120;arp=0;rang=3;spli=1;}
	    if (name="Rubric Bolter"){atta=80;arp=0;rang=12;amm=15;}// Bursts
	    if (name="Witchfire"){atta=200;arp=1;rang=5.1;}
	    if (name="Autogun"){atta=20;arp=0;rang=12;amm=12;}
	    if (name="Storm Bolter"){atta=90;arp=0;rang=8;amm=10;spli=1;}
	    if (name="Lascannon"){atta=200;arp=1;rang=26;amm=8;}
	    if (name="Twin Linked Heavy Bolters"){atta=240;arp=0;rang=16;spli=1;}
	    if (name="Twin-Linked Heavy Bolters"){atta=240;arp=0;rang=16;spli=1;}
	    if (name="Twin Linked Lascannon"){atta=300;arp=1;rang=20;}
	    if (name="Twin-Linked Lascannon"){atta=300;arp=1;rang=20;}
	    if (name="Battle Cannon"){atta=300;arp=1;rang=12;}
	    if (name="Demolisher Cannon"){atta=500;arp=1;rang=2;if (instance_exists(obj_nfort)) then rang=5;}
	    if (name="Earthshaker Cannon"){atta=300;arp=0;rang=12;spli=1;}
	    if (name="Havoc Launcher"){atta=300;arp=1;rang=12;}
	    if (name="Baleflame"){atta=120;arp=0;rang=2;}
	    if (name="Defiler Claws"){atta=350;arp=1;rang=1;spli=1;}
	    if (name="Reaper Autocannon"){atta=320;arp=0;rang=18;amm=10;spli=1;}
    
	    if (name="Ripper Gun"){atta=40;arp=0;rang=3;amm=5;spli=0;}
	    if (name="Ogryn Melee"){atta=90;arp=0;rang=1;}
	    if (name="Multi-Laser"){atta=choose(60,75,90,105);arp=0;rang=10;}
    
	    if (name="Blessed Weapon"){atta=150;arp=1;rang=1;}
	    if (name="Laser Mace"){atta=200;arp=1;rang=5.1;amm=3;}
	    if (name="Heavy Bolter"){atta=120;arp=0;rang=16;spli=0;if (faith_bonus>0){atta=50;arp=1;}}
    
	    if (name="Lasgun"){atta=20;arp=0;rang=6;amm=30;}
	    if (name="Daemonhost Claws"){atta=350;arp=1;rang=1;spli=1;}
	    if (name="Daemonhost_Powers"){
	        atta=round(random_range(100,300));arp=round(random_range(100,300));rang=round(random_range(1,6));spli=choose(0,1);
	    }
	}

	if (obj_ncombat.enemy=13){// Some of these, like the Gauss Particle Cannon and Particle Whip, used to be more than twice as strong.
	    if (name="Staff of Light"){atta=200;arp=1;rang=1;spli=1;}
	    if (name="Staff of Light Shooting"){atta=180;arp=0;rang=3;spli=1;}
	    if (name="Warscythe"){atta=200;arp=1;rang=1;spli=0;}
	    if (name="Gauss Flayer"){atta=choose(50,50,50,50,50,70);atta=choose(30,30,30,30,30,70);rang=6.1;spli=0;}
	    if (name="Gauss Blaster"){atta=choose(70,70,70,70,70,100);arp=choose(0,0,0,0,0,1);rang=6.1;spli=0;}
	    if (name="Gauss Cannon"){atta=180;arp=1;rang=10;spli=1;}
	    if (name="Gauss Particle Cannon"){atta=300;arp=1;rang=10.1;spli=1;}
	    if (name="Overcharged Gauss Cannon"){atta=250;arp=1;rang=8.1;spli=1;}
	    if (name="Wraith Claws"){atta=80;arp=1;rang=1;spli=0;}
	    if (name="Claws"){atta=300;arp=1;rang=1;spli=0;}
	    if (name="Gauss Flux Arc"){atta=180;arp=1;rang=8;spli=1;}
	    if (name="Particle Whip"){atta=300;arp=1;rang=4.1;spli=1;}
	    if (name="Gauss Flayer Array"){atta=180;arp=1;rang=8.1;spli=1;}
	    if (name="Doomsday Cannon"){atta=300;arp=1;rang=6.1;spli=1;}
	}


	if (faith_bonus=1) then atta=atta*2;
	if (faith_bonus=2) then atta=atta*3;
	atta=round(atta*obj_ncombat.global_defense);
	arp=round(arp*obj_ncombat.global_defense);





	if (obj_ncombat.enemy=1){
	    // more attack crap here
	    if (rang<=1) or (floor(rang)!=rang) then atta=round(atta*dudes_attack[group]);
	    if (rang>1) and (floor(rang)==rang) then atta=round(atta*dudes_ranged[group]);
	}



	if (is_man=false) then amm=-1;

	var b,goody,first;b=0;goody=0;first=0;
	repeat(30){b+=1;
	    if (wep[b]=name) and (goody=0){
	        att[b]+=atta*man_number;apa[b]+=arp*man_number;range[b]=rang;wep_num[b]+=man_number;
	        if (obj_ncombat.started=0) then ammo[b]=amm;goody=1;
        
	        if (wep_owner[b]!="") or (man_number>1) then wep_owner[b]="assorted";
	        if (wep_owner[b]="") and (man_number=1) then wep_owner[b]=man_type;
	    }
	    if (wep[b]="") and (first=0) then first=b;
	}
	if (goody=0){wep[first]=name;splash[first]=spli;
	    att[first]+=atta*man_number;apa[first]+=arp*man_number;range[first]=rang;wep_num[first]+=man_number;
	    if (obj_ncombat.started=0) then ammo[first]=amm;goody=1;
    
	    if (man_number=1) then wep_owner[first]=man_type;
	    if (man_number>1) then wep_owner[first]="assorted";
	}



	/*
	wep[i]="";
	combi[i]=0;
	range[i]=0;
	att[i]=0;
	apa[i]=0;
	*/


}
