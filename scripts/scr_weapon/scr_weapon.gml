function scr_weapon(equipment_1, equipment_2, base_group, unit_array_position, is_dreadnought, nuum, information_wanted) {

	// equipment_1: name of the first piece of equipment
	// equipment_2: name of second piece of equipment if any
	// base_group: the unit type defualts to true which means a marine (this needs work)
	// unit_array_position: the position of the marine inside the tempory combat array
	// is_dreadnought: is unit a dreadnought
	// nuum: not a good god damn fucking clue
	// information_wanted: what type of information do you want returned

	// More spaghetti code.  This either calculates damage for battle blocks or generates a tooltip for the shop/management.
	// it also gets informatino abou marine equipment for the chapter managment screens
	// let it be known that this represents everything wrong with this code base

	var i,wip,wip1,wip2,attack,arp,acr,att1,apa1,att2,apa2,acr1,acr2,melee_hands,ranged_hands,rang1,rang2,range,ammo1,ammo2,amm,spli1,spli2,spli,rending,thawep,descr,descr2,special_description,statt, weapon_data, weapon_ammo;
	var disk1,rending1,spe_descr1;
	i=0;wip1="";wip2="";wip="";thawep="";descr="";descr2="";special_description="";spe_descr1="";statt=0;rending=0;disk1="";rending1=0;
	melee_hands=0;ranged_hands=0;
	range=0;attack=0;arp=0;acr=0;
	att1=0;apa1=0;att2=0;
	apa2=0;acr1=0;acr2=0;
	rang1=0;rang2=0;
	spli=0;spli1=0;spli2=0;
	ammo1=-1;ammo2=-1;amm=-1;


	thawep=equipment_1;

	obj_controller.temp[9000]="";

	repeat(2){
	    i+=1;amm=-1;spli=0;
	    var emor;emor=0;

	    if (information_wanted="description") or (information_wanted="description_long"){
	        if (i=1) then thawep=equipment_2;
	        if (i=2) then thawep=equipment_1;
	        if (i=2){wip1=thawep;}
	        if (i=1){wip2=equipment_2;}
	    }
	    if (information_wanted!="description") and (information_wanted!="description_long"){
	        if (i=1) then thawep=equipment_1;
	        if (i=2) then thawep=equipment_2;
	        if (i=1){wip1=thawep;}
	        if (i=2){wip2=equipment_2;}
	    }

	    if (string_count("&",thawep)>0) or (string_count("|",thawep)>0){
	        // Artifact Armour
	        var arti_armour;
	        arti_armour=false;
	        if (string_count("Power Armour",thawep)>0){statt=30;emor=1;arti_armour=true;}
	        if (string_count("Artificer",thawep)>0){statt=35;emor=1;arti_armour=true;special_description="+10% Melee";}
	        if (string_count("Terminator",thawep)>0){statt=45;emor=1;arti_armour=true;special_description="+20% Melee, -10% Ranged, Strength";}
	        if (string_count("Dreadnought",thawep)>0){statt=50;emor=1;arti_armour=true;}

	        // Artifact weapons
	        if (arti_armour=false){
	            if (string_count("Bolter",thawep)>0){
	                attack=65;arp=0;range=12;ranged_hands+=2;amm=15;spli=1;
	                if (obj_controller.menu=1) and ((string_count("Terminator",marine_armour[0])>0) or (marine_armour[0]="Tartaros")) then ranged_hands-=1;
	            }
	            if (struct_exists(global.weapons, thawep)){
	            	weapon_data = global.weapons[$ thawep];
	            	attack = weapon_data[$ attack][$ standard];
	            	arp = weapon_data[$ arp];
	            	range = weapon_data[$ range];
	            	melee_hands += weapon_data[$ melee_hands];
	            	ranged_hands += weapon_data[$ ranged_hands];
	            	spli = weapon_data[$ spli];
	            	special_description = weapon_data[$ special_description];
	            	weapon_ammo = weapon_data[$ ammo];
	            }

	            if (string_count("DUB",thawep)>0){attack=floor(attack*1.5);melee_hands+=1;ranged_hands+=1;spli=1;}
	            if (string_count("Dae",thawep)>0){attack=floor(attack*1.5);amm=-1;}
	            if (string_count("VOI",thawep)>0){attack=floor(attack*1.2);}
	            if (string_count("ADA",thawep)>0){attack=floor(attack*1.1);}

	            if (string_count("mnr",thawep)>0){attack=floor(attack*0.85);}
	            if (string_count("MNR",thawep)>0){attack=floor(attack*0.85);}
	        }


	        /*
	        if (string_count("Power",targ.marine_armour[targ.men])>0) then targ.marine_ac[targ.men]=30;
	        if (string_count("Artificer",targ.marine_armour[targ.men])>0){targ.marine_ac[targ.men]=37;targ.marine_attack[targ.men]+=0.1;}
	        if (string_count("Terminator",targ.marine_armour[targ.men])>0){targ.marine_ac[targ.men]=42;targ.marine_ranged[targ.men]-=0.1;targ.marine_attack[targ.men]+=0.2;}
	        if (string_count("Dreadnought",targ.marine_armour[targ.men])>0) then targ.marine_ac[targ.men]=44;
	        */

	    }


	    if (i=1){
	        if (equipment_1="Ork Armour"){statt=15;special_description="";emor=1;}
            
			if (equipment_1="Skitarii Armour"){statt=5;special_description="";emor=1;}

	        if (equipment_1="Scout Armour"){statt=8;special_description="";emor=1;
	            descr="A non-powered suit made up of carapace armour and ballistic nylon.  Includes biohazard shielding, nutrient feed, and camoflauge.";}
	        if (equipment_1="MK3 Iron Armour"){statt=26;special_description="-10% Ranged";emor=1;
	            descr="An ancient set of Armorum Ferrum.  Has thicker armour plating but the added weight slows down the wearer.";}
	        if (equipment_1="MK4 Maximus"){statt=22;special_description="+5% Melee, +5% Ranged";emor=1;
	            descr="Armour dating to the end of the Great Crusade.  Often considered the ultimate Space Marine armour.  The components are no longer reproducable.";}
          if (equipment_1="MK5 Heresy"){statt=15;special_description="+20% Melee, -5% Ranged";emor=1;
	            descr="A Hastily assembled Power armour during the Horus Heresy to act as a stop gap. Excels at melee, alongside some downsides.";}
	        if (equipment_1="MK6 Corvus"){statt=15;special_description="+15% Ranged";emor=1;
	            descr="Relatively old beakie armour, sleek as can be.  Boosted olfactory and auditory sensors increase the ranged accuracy of the wearer. Making it more fragile";}
	        if (equipment_1="MK7 Aquila"){statt=17;special_description="";emor=1;
	            descr="Developed during the Horus Heresy, this Mark of armour is the most commonly used amongst all the Adeptus Astartes.";}
	        if (equipment_1="MK8 Errant"){statt=22;special_description="";emor=1;
	            descr="Highly modified MK7, this armour has additional protection along the neck and cables.  It is oft worn as a symbol of high rank.";}
	        if (equipment_1="Power Armour"){statt=19;special_description="";emor=1;
	            descr="A suit of Adeptus Astartes power armour.  The Mark can no longer be determined- it appears to be a combination of several types.";}
	        if (equipment_1="Artificer Armour"){statt=37;special_description="+10% Melee";emor=1;
	            descr="Heavily modified by the chapter artificers, and decorated without compare, this ancient Power Armour is beyond priceless.";}
	        if (equipment_1="Terminator Armour"){statt=42;special_description="+20% Melee, -10% Ranged, Strength";emor=1;
	            descr="The toughest and most powerful armour designed by humanity.  Only the most veteran of Astartes are allowed to wear these.";}
	        if (equipment_1="Tartaros"){statt=45;special_description="+20% Melee, -5% Ranged, Strength";emor=1;
	            descr="Even more advanced than the Indomitus Terminator Armour, this upgraded armour offer greater mobility at no cost to protection.";}
	        if (equipment_1="Dreadnought"){statt=50;special_description="";emor=1;
	            descr="A massive war-machine that can be piloted by a honored Space Marine, who otherwise would have fallen in combat.";}
	        if (equipment_1="Jump Pack"){special_description="+10% Damage Resistance, Jump Pack";
	            descr="A back mounted device containing turbines or jets powerful enough to lift even a user in Power Armour.";}
	        if (equipment_1="hammer_of_wrath"){attack=120;arp=0;range=1;spli=0;amm=1;}
	        if (equipment_1="Bionics"){
	            special_description="Restores 30HP";if (global.chapter_name="Iron Hands") then special_description="Restores 50 HP";
	            descr="Bionics may be given to wounded marines to quickly get them back into combat-ready status, replacing damaged flesh.";}
	        if (equipment_1="Narthecium"){special_description="Medical field kit";
	            descr="An advanced medical field kit, these allow "+string(obj_ini.role[100,15])+"s to heal or recover Gene-Seed from fallen marines.";}
	        if (equipment_1="Psychic Hood"){special_description="-50% chance of perils*";
	            descr="An arcane hood that protects "+string(obj_ini.role[100,17])+"s from enemy psychic powers and enhances their control.";}
	        if (equipment_1="Rosarius"){special_description="+33% Damage Resistance";
	            descr="Also called the 'Soul's Armour', this amulet has a built-in, powerful shield generator.  They are an icon of the Imperial Creed.";}
	        if (equipment_1="Iron Halo"){special_description="+33% Damage Resistance, +20 HP";
	            descr="An ancient artifact, these powerful conversion field generators are granted to high ranking battle brothers or heroes.  Bearers are oft looked to for guidance.";}
	        if (equipment_1="Plasma Bomb"){special_description="Destroys destructibles";
	            descr="A special plasma charge, this bomb can be used to seal underground caves or destroy enemy structures.";}
	        if (equipment_1="Exterminatus"){special_description="Destroys planets";
	            descr="A weapon of the Emperor, and His divine judgement, this weapon can be placed upon a planet to obliterate it entirely.";}
	        if (equipment_1="Bike"){special_description="+25% HP, Bike";
	            descr="A robust bike that can propel a marine at very high speeds.  Boasts highly responsive controls and Twin Linked Bolters.";}
	        if (thawep="Company Standard"){special_description="Boosts morale";attack=45;arp=0;range=1;melee_hands+=1;ranged_hands+=0;spli=1;
	            descr="A banner that represents the honour of a particular company and will bolster the morale abilities of nearby Space Marines.";}
	        if (equipment_1="Servo Arms"){special_description="Integrated flamer, repairs";
	            descr="A pair of powerful, mechanical arms.  They include several tools that allow trained marines to repair vehicles rapidly.";}
	        if (equipment_1="Master Servo Arms"){special_description="Integrated flamer, repairs";
	            descr="This master servo harness includes additional mechanical arms and tools, allowing a greater capacity and rate of repairs.";}
	    }

	    // Other stuff above
	    if (thawep="Choppa"){attack=28;arp=0;range=1;melee_hands+=1;spli=1;}
	    if (thawep="Snazzgun"){attack=80;arp=0;range=10;ranged_hands+=2;spli=1;}
	    if (thawep="Shuriken Pistol"){attack=25;arp=0;range=2.1;melee_hands+=1;spli=1;}
	    if (thawep="Ranger Long Rifle"){attack=60;arp=0;range=25;ranged_hands+=2;spli=0;}



	    if (thawep="Storm Shield"){melee_hands+=0.9;attack=0;arp=0;range=0;spli=0;
	        descr="Protects twice as well when boarding. A powered shield that must be held with a hand.  While powered by the marines armour it shimmers with blue energy.";
	        special_description="+30% HP, +8 Armour";}
	    if (thawep="Boarding Shield"){melee_hands+=0.9;attack=0;arp=0;range=0;spli=0;
	        descr="Protects twice as well when boarding. Used in siege or boarding operations, this shield offers additional protection.  It may be used with a 2-handed ranged weapon.";
	        special_description="+15% HP, +4 Armour";}
	    if (thawep="Hellgun"){attack=30;arp=0;range=6.1;ranged_hands+=2;amm=10;
	        descr="";}
	    if (thawep="Hellrifle"){attack=150;arp=90;range=8;ranged_hands+=2;
	        descr="Normally used by Radical Inquisitors, it appears an antiquated rifle but fires razor-sharp shards of Daemonic matter.";}
	    if (thawep="Archeotech Laspistol"){attack=120;arp=0;range=3.1;ranged_hands+=1;
	        descr="Known as a Lasrod or Gelt Gun, this pistol is an ancient design of Laspistol with much greater range and power.";}
    
	    if (thawep="Combat Knife"){attack=25;arp=0;range=1;melee_hands+=0;spli=0;
	        descr="More of a sword than knife proper, this tough and thick blade becomes a deadly weapon in the hand of an Astartes.";}
	    if (thawep="Sarissa"){attack=40;arp=0;range=1;spli=1;
	        descr="A vicious combat attachment that is attached to Bolters, in order to allow them to be used in melee combat.";}
	    if (thawep="Chainsword"){atta=50;arp=0;rang=1;melee_hands+=1;spli=1;
	        descr="A standard Chainsword.  It is popular among Assault Marines due to the raw power, even with multiple opponents";}
	    if (thawep="Chainaxe"){attack=90;arp=0;range=1;melee_hands+=1;ranged_hands+=1;spli=1;
	        descr="Able to be duel wielded. A weapon most frequently seen in the hands of Chaos, this Chainaxe uses motorized chainsaw teeth to maim and tear.";}
	    if (thawep="Eviscerator"){attack=180;arp=1;range=1;melee_hands+=2;spli=1;
	        descr="An obscenely large Chainsword, this two-handed weapon can carve through flesh and plasteel with equal ease.";}
	    if (thawep="Power Sword"){attack=125;arp=1;range=1;melee_hands+=1.1;spli=0;special_description="Parry";
	        descr="A preeminent type of Power Weapon.  When active the blade becomes sheathed in a lethal haze of disruptive energy.";}
	    if (thawep="Master Crafted Power Sword"){attack=185;arp=1;range=1;melee_hands+=1;spli=1;special_description="Parry";
	        descr="A master-crafted weapon is usually incredibly ornate and highly decorated compared to standard weapons of the same pattern, while also possessing augmented functionality. Any standard Imperial weapon can be master-crafted. Due to the improved design of a master-crafted weapon, it is more likely that a target will be hit by attacks from this weapon.";}
	    if (thawep="Eldar Power Sword"){attack=170;arp=1;range=1;melee_hands+=1;spli=1;special_description="Parry";
	        descr="Power weapons, infused with arcane energy, are used by Howling Banshees and Dire Avenger Exarchs. Swords such as these are as much artistic statement as weapon, and effective against even heavily armoured troops.";}
	    if (thawep="Power Weapon"){attack=135;arp=1;range=1;melee_hands+=1;spli=1;
	        descr="Often the signature weapons of elite warriors, power swords are perhaps the most dangerous of melee weapons in the galaxy.";}
	    if (thawep="Power Axe"){attack=160;arp=1;range=1;melee_hands+=1;spli=0;
	        descr="Similar to the Power Sword. Able to be duel wielded. This weapon can be activated to sheathe the axe-head in a lethal haze of disruptive energy.";}
	    if (thawep="Power Fist"){attack=275;arp=1;range=1;melee_hands+=1;ranged_hands+=1;spli=1;
	        descr="A large, metal gauntlet surrounded by an energy field.  Though large and slow it dishes out tremendous damage.";}
	    if (thawep="Lightning Claw"){attack=450;arp=0;range=1;melee_hands+=2;ranged_hands+=2;spli=1;
	        descr="Created by attaching several long, energized blades to a standard power fist.  Allows better ripping and tearing.";}
	    if (thawep="Chainfist"){attack=300;arp=1;range=1;melee_hands+=1;ranged_hands+=1;spli=0;
	        descr="Created by mounting a chainsword to a power fist, this weapon is easily able to carve through armoured bulkheads.";}
	    if (thawep="Lascutter"){attack=100;arp=1;range=1;melee_hands+=1;spli=0;
	        descr="Origonally industrial tools used for breaking through bulkheads, this laser weapon is devastating in close combat.";}


	    if (thawep="Force Weapon"){
	        attack=400;arp=1;range=1;melee_hands+=1;spli=1;
	        descr="An advanced, psychically-attuned close combat weapon that is only fully effective in the hands of a psyker.";
	        if (information_wanted!="description") and (information_wanted!="description_long"){
	        if (string_count("0",marine_powers[unit_array_position])>0){attack=400;arp=0;range=1;melee_hands+=1;spli=1;}
	        if (string_count("0",marine_powers[unit_array_position])=0){thawep="Inactive Force Weapon";attack=30;arp=0;range=1;melee_hands+=1;}}
	        // if (obj_controller.menu=1) and ((string_count("Terminator",marine_armour[0])>0) or (marine_armour[0]="Tartaros")) then melee_hands-=1;
	    }
	    if (thawep="Master Crafted Force Weapon"){
	        attack=500;arp=1;range=1;melee_hands+=1;spli=1;
	        descr="A more expertly crafted Force Weapon, the fine craftsmanship confers greater ease and control with disrupting matter.";
	        if (information_wanted!="description") and (information_wanted!="description_long"){
	        if (string_count("0",marine_powers[unit_array_position])>0){attack=480;arp=0;range=1;melee_hands+=1;spli=1;}
	        if (string_count("0",marine_powers[unit_array_position])=0){thawep="Inactive Master Crafted Force Weapon";attack=30;arp=0;range=1;melee_hands+=1;}}
	        // if (obj_controller.menu=1) and ((string_count("Terminator",marine_armour[0])>0) or (marine_armour[0]="Tartaros")) then melee_hands-=1;
	    }

	    if (thawep="Thunder Hammer"){attack=450;arp=1;range=1;melee_hands+=1;spli=1;
	        descr="This weapon unleashes a massive, disruptive field on impact.  Only experienced marines can use Thunder Hammers.";}
	    if (thawep="Master Crafted Thunder Hammer"){attack=560;arp=1;range=1;melee_hands+=1;spli=1;
	        descr="The Master Crafted Thunder Hammer incorporates superior craftsmanship, advanced technology, and special modifications, making it more potent and effective in combat. It possesses all the qualities of a standard Thunder Hammer but with enhanced performance and additional features.";}
    
	    if (thawep="Bolt Pistol"){attack=30;arp=0;range=3.1;amm=18;

	        descr="A smaller, more compact version of the venerable Boltgun.  Standard Godwyn pattern.";}
	    if (thawep="Webber"){attack=35;arp=0;range=4.1;ranged_hands+=2;amm=5;spli=0;
	        descr="The Webber is a close-range weapon that fires strands of sticky web-like substance. It is designed to ensnare and immobilize enemies, restricting their movement and rendering them vulnerable to further attacks. ";}
	    if (thawep="Underslung Bolter"){attack=60;arp=0;range=10;amm=8;spli=1;}// Bursts
            if (thawep="Stalker Pattern Bolter"){attack=100;arp=1;range=15;ranged_hands+=2;amm=20;spli=0;
	        descr="The Stalker Bolter is a scoped long-range variant of the standard Bolter. Depending on the specific modifications made by the wielder, the Stalker Bolter can serve as a precision battle rifle or a high-powered sniper weapon.";}


	    if (thawep="Bolter"){attack=50;arp=0;range=12;ranged_hands+=2;amm=16;spli=1;

	        if (information_wanted!="description") and (information_wanted!="description_long"){
	        if (string_count("Terminator",marine_armour[unit_array_position])>0) then melee_hands-=1;
	        if (marine_armour[unit_array_position]="Tartaros") then melee_hands-=1;}
	        if (obj_controller.menu=1) and ((string_count("Terminator",marine_armour[0])>0) or (marine_armour[0]="Tartaros")) then ranged_hands-=1;
	        descr="A standard Godwyn Pattern Bolter.  This blessed weapon is used by most Adeptus Astartes.";}// Bursts
	    if (thawep="Master Crafted Combiflamer"){attack=200;arp=1;range=12;ranged_hands+=2;amm=15;spli=1;
	        descr="The Master Crafted Combiflamer incorporates superior craftsmanship, advanced modifications, and enhancements compared to its standard counterpart. ";}// Bursts
	    if (thawep="Combiflamer"){attack=100;arp=1;range=10;ranged_hands+=2;amm=15;spli=1;
	        descr="A Boltgun with a one-shot Flamer strapped to the side.  It is useful for close quarters fighting.";}// Bursts
	    if (thawep="Twin Linked Bolters"){attack=70;arp=0;range=12;ranged_hands+=2;amm=30;spli=1;
	        descr="A Twin-linked Bolter consists of two Bolter weapons mounted side by side, typically on a vehicle or a special weapon platform.";}// Bursts

	    if (thawep="Heavy Bolter"){attack=120;arp=0;range=16;ranged_hands+=2;melee_hands+=1;amm=20;spli=1;
	        descr="An enormous Boltgun.This weapon can fire a hail of powerful bolts at the enemy.";}
	    if (thawep="Master Crafted Heavy Bolter"){attack=220;arp=1;range=16;ranged_hands+=2;amm=25;spli=1;
	        descr="A Master Crafted Heavy Bolter incorporates superior craftsmanship, advanced modifications, and enhancements compared to its standard counterpart";}
	    if (thawep="Storm Bolter"){attack=80;arp=0;range=10;ranged_hands+=2;amm=10;spli=1;
	        if (information_wanted!="description") and (information_wanted!="description_long"){
	        if (string_count("Terminator",marine_armour[unit_array_position])>0) then melee_hands-=1;
	        if (marine_armour[unit_array_position]="Tartaros") then melee_hands-=1;}
	        if (obj_controller.menu=1) and ((string_count("Terminator",marine_armour[0])>0) or (marine_armour[0]="Tartaros")) then ranged_hands-=1;
	        descr="Compact, and double barreled, this bolt weapon is inaccurate but grants an enormous amount of firepower.";}
	    if (thawep="Flamer"){attack=350;arp=-1;range=2.1;ranged_hands+=2;amm=4;spli=1;
	        if (information_wanted!="description") and (information_wanted!="description_long"){
	        if (string_count("Terminator",marine_armour[unit_array_position])>0) then melee_hands-=1;
	        if (marine_armour[unit_array_position]="Tartaros") then melee_hands-=1;
	        // if (obj_ncombat.enemy=3) or (obj_ncombat.enemy=13) then attack=40;
	        }
	        if (obj_controller.menu=1) and ((string_count("Terminator",marine_armour[0])>0) or (marine_armour[0]="Tartaros")) then ranged_hands-=1;
	        descr="Blackened at the tip, this weapon unleashes a torrent of burning promethium- all the better to cleanse sin and impurity with.";}
	    if (thawep="Underslung Flamer"){attack=200;arp=-1;range=2.1;amm=4;spli=1;
	        // if (obj_ncombat.enemy=3) or (obj_ncombat.enemy=13) then attack=35;
	    }
	    if (thawep="Incinerator"){attack=200;arp=-1;range=2.1;ranged_hands+=2;amm=4;spli=1;
	        if (information_wanted!="description") and (information_wanted!="description_long"){
	        if (string_count("Terminator",marine_armour[unit_array_position])>0) then melee_hands-=1;
	        if (marine_armour[unit_array_position]="Tartaros") then melee_hands-=1;
	        if (obj_ncombat.enemy=10) and (obj_ncombat.threat=7) then attack=300;
	        }
	        if (obj_controller.menu=1) and ((string_count("Terminator",marine_armour[0])>0) or (marine_armour[0]="Tartaros")) then ranged_hands-=1;
	        descr="This flamer weapon includes special promethium and sacred oils.  It is particularly effective against Daemons and their ilk.";}
	    if (thawep="Heavy Flamer"){attack=500;arp=-1;range=2;ranged_hands+=2;melee_hands+=1;amm=8;spli=1;
	        if (information_wanted!="description") and (information_wanted!="description_long"){
	        // if (obj_ncombat.enemy=3) or (obj_ncombat.enemy=13) then attack=60;
	        }
	        descr="A much larger and bulkier flamer.  Few armies carry them on hand, instead choosing to mount them to vehicles.";}
	    if (thawep="CCW Heavy Flamer"){attack=250;arp=-1;range=2.1;amm=6;spli=1;
	        // if (obj_ncombat.enemy=3) or (obj_ncombat.enemy=13) then attack=60;
	    }
	    if (thawep="Inferno Cannon"){attack=400;arp=-1;range=3.1;spli=1;
	        if (information_wanted!="description") and (information_wanted!="description_long"){
	        // if (obj_ncombat.enemy=3) or (obj_ncombat.enemy=13) then attack=90;
	        }
	        descr="A huge, vehicle mounted flame weapon that fires with explosive force.  The resevoir is liable to explode.";}


	    if (thawep="Meltagun"){attack=250;arp=1;range=2.1;ranged_hands+=2;amm=4;
	        descr="A relatively quiet weapon, this gun vaporizes flesh and armour alike.  Due to heat dissipation it has only a short range.";}
	        if (thawep="Master Crafted Meltagun"){attack=250;arp=1;range=2.1;ranged_hands+=2;amm=4;
	        descr="A Master Crafted Meltagun incorporates superior craftsmanship, advanced modifications, and enhancements compared to its standard counterpart.";}
	    if (thawep="Multi-Melta"){attack=500;arp=1;range=4.1;ranged_hands+=2;melee_hands+=1;amm=8;spli=1;
	        descr="Though bearing longer range than the Meltagun, this weapon's great size usually restricts it to vehicles.";}
	    if (thawep="Plasma Pistol"){attack=90;arp=1;range=3.1;melee_hands+=1;
	        descr="A smaller version of the plasma gun, this dangerous-to-use weapon has exceptional armour-piercing capabilities.";}
	    if (thawep="Master Crafted Plasma Pistol"){attack=120;arp=0;range=3.1;melee_hands+=1;
	        descr="A Master Crafted Plasma Pistol incorporates superior craftsmanship, advanced modifications, and enhancements compared to its standard counterpart.";}
	    if (thawep="Infernus Pistol"){attack=100;arp=1;range=2.1;melee_hands+=1;amm=4;
	        descr="The Infernus Pistol is a compact and portable flamethrower-style weapon. It unleashes a torrent of fiery promethium, which engulfs its targets in flames.";}
	    if (thawep="Plasma Gun"){attack=150;arp=1;range=12;ranged_hands+=2;spli=1;
	        descr="A 2-handed firearm that launches bolts of plasma.  They are considered both sacred and dangerous, occasionally overheating.";}
	    if (thawep="Master Crafted Plasma Gun"){attack=175;arp=1;range=14;ranged_hands+=2;spli=1;
	        descr="A Master Crafted Plasma Gun incorporates superior craftsmanship, advanced modifications, and enhancements compared to its standard counterpart.";}

	    if (thawep="Sniper Rifle"){attack=80;arp=0;range=18;ranged_hands+=2;melee_hands+=1;amm=20;

	        descr="Fires a solid shell and boasts powerful telescopic sights, allowing the user to target enemy weak points and distant foes.";}
	    if (thawep="Assault Cannon"){attack=240;arp=0;range=12;ranged_hands+=2;amm=5;spli=1;
	        descr="A heavy, rotary auto-cannon frequently used by Dreadnoughts and Terminators.  Has an incredible rate of fire.";
	        if (obj_controller.menu=1) and ((string_count("Terminator",marine_armour[0])>0) or (marine_armour[0]="Tartaros")) then ranged_hands-=1;
	    }
	    if (thawep="Autocannon"){attack=180;arp=0;range=18;ranged_hands+=2;amm=25;spli=1;
	        descr="A rapid-firing weapon able to use a wide variety of ammunition, from mass-reactive explosive to solid shells.";
	        if (obj_controller.menu=1) and ((string_count("Terminator",marine_armour[0])>0) or (marine_armour[0]="Tartaros")) then ranged_hands-=1;
	    }
	    if (thawep="Missile Launcher"){attack=250;arp=0;range=24;ranged_hands+=2;melee_hands+=1;amm=6;spli=1;
	        descr="This heavy weapon is capable of firing either armour-piercing or fragmentation rockets.  Has low ammunition count.";}
	    if (thawep="Lascannon"){attack=200;arp=1;range=24;ranged_hands+=2;melee_hands+=1;amm=8;spli=0;
	        descr="A formidable laser weapon, this lascannon can pierce most vehicle or power armour from a tremendous range.";}

	    if (thawep="Conversion Beam Projector"){attack=500;arp=1;range=20;ranged_hands+=1;amm=1;spli=1;
	        descr="The Conversion Beam Projector is a heavy energy weapon that harnesses advanced technology to project a concentrated beam of destructive energy. It is capable of cutting through armour, vehicles, and even heavily fortified structures.";}
	    if (thawep="Integrated Bolters"){attack=75;arp=1;range=8.1;amm=20;spli=1;
	        descr="Integrated Bolters are a set of Bolter weapons that are integrated or built directly into the structure of the vehicle,armour or Dreadnought.";}
	    if (thawep="Power Fists"){attack=425;arp=0;range=1;melee_hands+=2;spli=1;
	        descr="While not quite as strong as two Power Fist, these artifacts allow the use of an additional, third weapon.";}


	    if (thawep="Close Combat Weapon"){attack=250;arp=1;range=1;melee_hands+=1;spli=1;
	        descr="While a variety of melee weapons are used by dreadnoughts, this power fist with flamer is the most common.";}

	    if (thawep="Twin Linked Heavy Bolter"){attack=240;arp=1;range=16;amm=20;spli=1;
	        descr="Twin-linked Heavy Bolters are an upgraded version of the standard Heavy Bolter weapon, which is known for its high rate of fire and effectiveness against infantry and light vehicles. ";}
	    if (thawep="Twin Linked Lascannon"){attack=250;arp=1;range=20;amm=10;
	        descr="Lascannons are powerful anti-armour weapons that fire highly focused and devastating energy beams capable of penetrating even the toughest armour. ";}
	    if (thawep="Lascannons"){attack=300;arp=1;range=20;amm=5;
	        descr="Lascannons are powerful anti-armour weapons that fire highly focused and devastating energy beams capable of penetrating even the toughest armour. ";}
	    if (thawep="Heavy Bolters"){attack=320;arp=1;range=16;amm=10;spli=1;
	        descr="The Heavy Bolter is a heavy weapon that fires larger and more powerful bolt shells compared to the standard Bolter.";}
	    if (thawep="Whirlwind Missiles"){attack=400;arp=1;range=20;amm=6;spli=1;
	        descr="The Whirlwind Missile Launcher is a vehicle-mounted artillery weapon that launches a barrage of powerful missiles at the enemy.";}

					// Vehicle Upgrades
			if (equipment_1="Armoured Ceramite"){statt=20;special_description="";emor=1;
	        descr="Supplemental ceramite armour packages provide protection far beyond stock configurations.";}
			if (equipment_1="Artificer Hull"){statt=20;special_description="";emor=1;
	        descr="Replacing numerous structural members and armour plates with thrice-blessed replacements, the vehicle’s hull is upgraded to be a rare work of mechanical art.";}
			if (equipment_1="Heavy Armour"){statt=10;special_description="";emor=1;
	       	descr="Simple but effective, extra armour plates can be attached to most vehicles to provide extra protection.";}
			if (equipment_1="Lucifer Pattern Engine"){statt=5;special_description="";emor=1;
		    	descr="A significant upgrade over the more common patterns of Rhino-chassis engines, these engines provide greater output.";}

					// Vehicle Accessories
			if (thawep="Dozer Blades"){attack=60;arp=0;range=1;melee_hands+=1;spli=1
			   	descr="An attachment for the front of vehicles, useful for clearing difficult terrain and can be used as an improvised weapon. ";}
			if (thawep="Searchlight"){
					descr="A simple solution for fighting in dark environments, searchlights serve to illuminate enemies for easier targeting. ";}
			if (thawep="Smoke Launchers"){
					descr="Useful for providing concealment in open terrain, these launchers project wide-spectrum concealing smoke to prevent accurate targeting of the vehicle. ";}

					// Vehicle Utility Weapons
			if (thawep="HK Missile"){attack=350;arp=1;range=50;ranged_hands+=1;amm=1;spli=1;
			    descr="A single-use long-range anti-tank missile, this weapon can surgically destroy armoured targets in the opening stages of a battle.";}

					// Land Raider Front Mounts
			if (thawep="Twin Linked Heavy Bolter Mount"){attack=240;arp=0;range=16;amm=20;spli=1;
			    descr="Twin-linked Heavy Bolters are an upgraded version of the standard Heavy Bolter weapon, which is known for its high rate of fire and effectiveness against infantry and light vehicles. ";}
			if (thawep="Twin Linked Lascannon Mount"){attack=250;arp=1;range=20;amm=10;
			    descr="Lascannons are powerful anti-armour weapons that fire highly focused and devastating energy beams capable of penetrating even the toughest armour. ";}
			if (thawep="Twin Linked Assault Cannon Mount"){attack=360;arp=0;range=12;amm=5;spli=1;
			    descr="A twin mount of rotary autocannons, boasting an incredible rate of fire.";}
			if (thawep="Reaper Autocannon Mount"){attack=250;arp=0;range=15;amm=25;spli=1;
			   descr="An archaic twin-linked autocannon design dating back to the Great Crusade. Effective against a variety of targets. ";}

					// Land Raider Sponsons
			if (thawep="Quad Linked Heavy Bolter Sponsons"){attack=480;arp=1;range=16;amm=10;spli=1;
					descr="Quad-linked Heavy Bolters are a significantly upgraded version of the standard Heavy Bolter mount; already punishing in a single mount, this quad mount is devastating against a variety of targets. ";}
			if (thawep="Twin Linked Lascannon Sponsons"){attack=375;arp=1;range=20;amm=5;
			    descr="Lascannons are powerful anti-armour weapons that fire highly focused and devastating energy beams capable of penetrating even the toughest armour. ";}
			if (thawep="Hurricane Bolter Sponsons"){attack=405;arp=0;range=12;amm=20;spli=1;
			    descr="Hurricane Bolters are large hex-mount bolter arrays that are able to deliver a withering hail of anti-infantry fire at short ranges. ";}
			if (thawep="Flamestorm Cannon Sponsons"){attack=600;arp=1;range=3;amm=6;spli=1;
			    descr="A huge vehicle-mounted flamethrower, the heat produced by this terrifying weapon can crack even armoured ceramite. ";}
			if (thawep="Twin Linked Heavy Flamer Sponsons"){attack=550;arp=-1;range=2.1;amm=12;spli=1;
			    descr="A much larger and bulkier flamer.  Few armies carry them on hand, instead choosing to mount them to vehicles.";}
			if (thawep="Twin Linked Multi-Melta Sponsons"){attack=450;arp=1;range=4.1;amm=6;
			    descr="Though bearing longer range than the Meltagun, this weapon's great size usually restricts it to vehicles.";}
			if (thawep="Twin Linked Volkite Culverin Sponsons"){attack=480;arp=0;range=18;amm=25;spli=1;
					descr="An advanced thermal weapon from a bygone era, Volkite Culverins are able to ignite entire formations of enemy forces. ";}


				// Predator Turrets
				if (thawep="Twin Linked Lascannon Turret"){attack=250;arp=1;range=20;amm=10;
						descr="A Predator-compatible turret mounting a pair of anti-armour lascannons. ";}
				if (thawep="Autocannon Turret"){attack=130;arp=0;range=18;amm=50;spli=1;
				    descr="A Predator-compatible turret mounting a reliable all-purpose autocannon. ";}
				if (thawep="Twin Linked Assault Cannon Turret"){attack=360;arp=0;range=12;amm=10;spli=1;
				   	descr="A Predator-compatible turret mounting a pair of short range anti-infantry assault cannons. ";}
				if (thawep="Flamestorm Cannon Turret"){attack=400;arp=1;range=2.1;amm=12;spli=1;
					  descr="A Predator-compatible turret housing a huge flamethrower, the heat produced by this terrifying weapon can crack even armoured ceramite. ";}
				if (thawep="Magna-Melta Turret"){attack=400;arp=1;range=6;amm=12;
					  descr="A Predator-compatible turret housing a magna-melta, a devastating short-range anti-tank weapon. ";}
				if (thawep="Plasma Destroyer Turret"){attack=350;arp=1;range=15;spli=1;
					  descr="A Predator-compatible turret housing a plasma destroyer, sometimes called the plasma executioner after the vehicle variants that mount this terrifying anti-armour weapon. ";}
				if (thawep="Heavy Conversion Beamer Turret"){attack=750;arp=1;range=25;amm=3;spli=1;
				   	descr="A Predator-compatible turret housing a Heavy Conversion Beam Projector, a heavy energy weapon that turns a target's own matter against it by converting it into destructive energy.";}
				if (thawep="Neutron Blaster Turret"){attack=400;arp=1;range=15;amm=10
					  descr="A Predator-compatible turret housing a neutron blaster; a weapon from the Dark Age of Technology, this weapon is capable of destroying enemy armour with impunity. ";}
				if (thawep="Volkite Saker Turret"){attack=400;arp=0;range=18;amm=50;spli=1;
						descr="A Predator-compatible turret housing a Volkite Saker, capable of igniting entire formations of enemy forces with a single sweep. ";}

				// Predator Sponsons
				if (thawep="Lascannon Sponsons"){attack=250;arp=1;range=20;amm=5;
		        descr="Lascannons are powerful anti-armour weapons that fire highly focused and devastating energy beams capable of penetrating even the toughest armour. ";}
				if (thawep="Heavy Bolter Sponsons"){attack=240;arp=0;range=16;amm=20;spli=1;
				    descr="The Heavy Bolter is a heavy weapon that fires larger and more powerful bolt shells compared to the standard Bolter.";}
				if (thawep="Heavy Flamer Sponsons"){attack=375;arp=-1;range=2.1;amm=6;spli=1;
				   	descr="A much larger and bulkier flamer. Few armies carry them on hand, instead choosing to mount them to vehicles. ";}
				if (thawep="Volkite Culverin Sponsons"){attack=320;arp=0;range=18;amm=25;spli=1;
						descr="An advanced thermal weapon from a bygone era, Volkite Culverins are able to ignite entire formations of enemy forces. ";}


	    // STC Bonuses
	    if (obj_controller.stc_bonus[1]>0){
	        if (obj_controller.stc_bonus[1]=1){if (string_count("Bolt",thawep)>0){attack=round(attack*1.07);}}
	        if (obj_controller.stc_bonus[1]=2){if (string_count("Chain",thawep)>0){attack=round(attack*1.07);}}
	        if (obj_controller.stc_bonus[1]=3) and ((thawep="Flamer") or (thawep="Heavy Flamer")
	         or (thawep="Inferno Cannon") or (thawep="CCW Heavy Flamer")){attack=round(attack*1.1);}
	        if (obj_controller.stc_bonus[1]=4){if (thawep="Missile Launcher") or (thawep="Whirlwind Missiles"){attack=round(attack*1.1);}}
	        if (obj_controller.stc_bonus[1]=5) and (emor>0) and (statt>0){if (statt>=40) then statt+=2;if (statt<40) then statt+=1;}
	    }
	    if (obj_controller.stc_bonus[2]>0){
	        if (obj_controller.stc_bonus[2]=1){if (string_count("ist",thawep)>0){attack=round(attack*1.1);}}
	        if (obj_controller.stc_bonus[2]=2){if (string_count("Plasma",thawep)>0){attack=round(attack*1.1);}}
	        if (obj_controller.stc_bonus[2]=3) and (emor>0) and (statt>0){if (statt>=40) then statt+=2;if (statt<40) then statt+=1;}
	    }

	    if (base_group=false) and (obj_controller.stc_bonus[3]=2){
	        if (attack>0) then attack=round(attack*1.05);
	        // if (arp>0) then arp=round(arp*1.05);
	    }








	    if (information_wanted="description") or (information_wanted="description_long"){// was i=2
	        /*if (i=1){
	            disk1=descr;
	            atta1=attack;
	            arp1=arp;
	            rang1=range;
	            ammo1=amm;
	            spli1=spli;
	            rending1=rending;
	            spe_descr1=special_description;
	        }

	        descr=disk1;
	        attack=att1;
	        arp=apa1;
	        range=rang1;
	        amm=ammo1;
	        spli=spli1;
	        rending=rending1;
	        special_description=spe_descr1;*/



	        if (string_count("Bolter",thawep)>0) and (string_count("Drilling",obj_ini.strin)>0){
	            if (attack>0) then attack=round(attack*1.15);
	            // if (arp>0) then arp=round(arp*1.15);
	        }

	        if (instance_exists(obj_shop)){
	            if (attack>0){
	                obj_shop.tooltip_weapon=1;
	                obj_shop.tooltip_stat1=attack;
	                obj_shop.tooltip_stat2=arp;
	                obj_shop.tooltip_stat3=max(ranged_hands,melee_hands);
	                obj_shop.tooltip_stat4=amm;

	                if (range<=1.1){
	                    obj_shop.tooltip_other="Melee";
	                    if (spli=1) then obj_shop.tooltip_other+=", Splash";
	                }
	                if (range>1.1){
	                    obj_shop.tooltip_other=string(round(range))+" Range";
	                    if (spli=1) then obj_shop.tooltip_other+=", Rapid Fire";
	                }

	                if (arp=-1) then obj_shop.tooltip_other+=", Low Penetration";
	                if (arp=1) then obj_shop.tooltip_other+=", Armour Piercing";

	            }
	            if (attack=0) and (statt=0){// Held something
	                obj_shop.tooltip_weapon=2;
	                obj_shop.tooltip_other=special_description;
	            }
	            if (attack=0) and (melee_hands+ranged_hands=0) and (statt>0){// Armour
	                obj_shop.tooltip_weapon=3;
	                obj_shop.tooltip_stat1=statt;
	                obj_shop.tooltip_other=special_description;
	            }
	        }

	        if (!instance_exists(obj_shop)) and (!instance_exists(obj_ncombat)) and (((obj_controller.menu=1) and (obj_controller.managing>0)) or (obj_controller.menu=13)){
	            // 0.6
	            menu_artifact_type=4;

	            if (attack>0){
	                obj_controller.tooltip_stat1=attack;
	                obj_controller.tooltip_stat2=arp;
	                obj_controller.tooltip_stat3=max(ranged_hands,melee_hands);
	                obj_controller.tooltip_stat4=amm;

	                if (range<=1.1){menu_artifact_type=1;
	                    obj_controller.tooltip_other="Melee";
	                    if (spli=1) then obj_controller.tooltip_other+=", Splash";
	                }
	                if (range>1.1){menu_artifact_type=1;
	                    obj_controller.tooltip_other=string(round(range))+" Range";
	                    if (spli=1) then obj_controller.tooltip_other+=", Rapid Fire";
	                }

	                if (arp=-1) then obj_controller.tooltip_other+=", Low Penetration";
	                if (arp=1) then obj_controller.tooltip_other+=", Armour Piercing";
	            }
	            if (attack=0) and (statt=0){// Held something
	                obj_controller.tooltip_other=special_description;
	                menu_artifact_type=3;
	                obj_controller.tooltip_stat1=0;
	                obj_controller.tooltip_stat2=0;
	                obj_controller.tooltip_stat3=max(ranged_hands,melee_hands);
	                obj_controller.tooltip_stat4=0;
	            }
	            if (attack=0) and (statt>0){// Armour
	                obj_controller.tooltip_stat1=statt;
	                obj_controller.tooltip_other=special_description;
	                menu_artifact_type=2;
	            }
	        }

	        // exit;exit;
	    }





	    if (information_wanted!="description") and (information_wanted!="description_long"){
	        if (base_group!=false){if (string_count("Dreadnought",marine_armour[unit_array_position])>0) and (marine_mobi[unit_array_position]="") then amm=-1;}
	        if (thawep="Whirlwind Missiles") then amm=6;

	        if (rending1=1){
	            var rend;rend=choose(1,2,3,4,5,6);
	            if (rend=6){
	                if (attack>0) then attack=attack*2;
	                // if (arm>0) then arp=arp*2;
	            }
	        }
	        if (rang1=1){
	            attack=attack*marine_attack[unit_array_position];// arp=arp*marine_attack[unit_array_position];
	            if (marine_might[unit_array_position]>0){
	                attack=attack*2;// arp=arp*2;
	            }
	            if (marine_spatial[unit_array_position]>0){
	                attack=attack*1.75;// arp=arp*1.75;
	            }
	            if (marine_fiery[unit_array_position]>0){
	                attack=attack*1.3;// arp=arp*1.3;
	            }
	        }
	        if (rang1>1){
	            attack=attack*marine_ranged[unit_array_position];
	            // arp=arp*marine_ranged[unit_array_position];
	        }

	        if (obj_ncombat.bolter_drilling=1) and ((string_count("Bolt",thawep)>0) or (string_count("ombi",thawep)>0)){
	            attack=round(attack*1.15);// arp=round(arp*1.15)
	        }
	        if (obj_ncombat.melee=1) and (range=1){
	            attack=round(attack*1.1);// arp=round(arp*1.1);
	        }
	        if (range=1){
	            attack=round(attack*obj_ncombat.global_melee);
	            // arp=round(arp*obj_ncombat.global_melee);
	        }


	        if (base_group=true){
	            if (marine_exp[unit_array_position]>30){
	                var ttt;ttt=marine_exp[unit_array_position]-30;
	                ttt=(ttt*0.0014)+1;ttt=max(1,(min(ttt,1.5)));// was 1.25
	                if (ttt>=1) then attack=floor(attack*ttt);
	                // if (ttt>=1) then arp=floor(arp*ttt);
	                attack=attack*obj_ncombat.global_attack;
	                // arp=arp*obj_ncombat.global_attack;
	            }
	        }
	        if (base_group=false){
	            attack=attack*obj_ncombat.global_attack;
	            // arp=arp*obj_ncombat.global_attack;
	        }


	        if (ranged_hands>2) and (range>1) and (base_group=true) and (is_dreadnought=false){
	            attack=attack*0.6;// arp=arp*0.6;
	        }
	        if (melee_hands>2) and (range<=1) and (base_group=true) and (is_dreadnought=false){
	            attack=attack*0.6;// arp=arp*0.6;
	        }

	        if (i=1){att1=attack;apa1=arp;rang1=range;ammo1=amm;spli1=spli;}
	        if (i=2){att2=attack;apa2=arp;rang2=range;ammo2=amm;spli2=spli;}


	        // This is giving problems
	        if (melee_hands=0) and (base_group=true) and (is_dreadnought=false) and (i=2){
	            var attack;
	            attack=obj_ncombat.global_attack*10;
	            var b,goody,opn;b=0;goody=0;opn=0;
	            repeat(30){b+=1;
	                if (wep[b]="melee"){
	                    goody=b;att[b]+=attack;range[b]=1;wep_num[b]+=1;splash[b]=0;ammo[b]=-1;
	                }
	                if (wep[b]="") and (opn=0) then opn=b;
	                if (goody=0){
	                    wep[opn]="melee";att[opn]+=attack;range[opn]=1;wep_num[opn]=1;splash[opn]=0;ammo[opn]=-1;
	                }
	            }
	        }





	    }


	    obj_controller.temp[9000]+=string(thawep)+": "+string(melee_hands)+","+string(ranged_hands)+"|";
	}





	// End repeat(2)

	if (argument6="description") or (argument6="description_long"){
	    if ((!instance_exists(obj_shop)) and (!instance_exists(obj_ncombat)) and (obj_controller.menu=1) and (obj_controller.managing>0)) or (obj_controller.squads == true){
	        // obj_controller.temp[9000]="Melee Hands: "+string(melee_hands)+", Ranged Hands: "+string(ranged_hands);
	        var melee_limit = 2
	        var ranged_limit = 2
	        if(array_contains(["Terminator Armour", "Tartaros"], marine_armour[argument3])){
	        	melee_limit+=2;
	        	ranged_limit++;
	        } else if(obj_controller.squads == true){
	        	if(array_contains(["Terminator Armour", "Tartaros"], obj_controller.marine_armour[0])){
	        		melee_limit+=2;
	        		ranged_limit++;
	        	}	
	        }        
	        if (melee_hands<=2) or (argument4=true) then obj_controller.ui_melee_penalty=0;
	        if (ranged_hands<=2) or (argument4=true) then obj_controller.ui_ranged_penalty=0;
	        if (melee_hands>melee_limit) and (argument4=false) then obj_controller.ui_melee_penalty=1;
	        if (ranged_hands>ranged_limit) and (argument4=false) then obj_controller.ui_ranged_penalty=1;
	    }

	    if (information_wanted="description") then return(descr);
	    if (information_wanted="description_long") then return(descr2);
	}


	if (argument6!="description") and (argument6!="description_long"){
	    var b,goody,found,stack;b=0;goody=0;found=0;stack=1;

	    thawep=equipment_1;// 137 135 136 flip fix?


	    if (nuum!="") then stack=0;


	    repeat(60){b+=1;

	        // show_message(string(goody));

	        var canc;canc=false;
	        if (rang1>1) and (marine_ranged[unit_array_position]=0){
	             canc=true;if (floor(rang1)==rang1) then canc=false
	        }if (canc=true) then goody=1;

	        if (goody=0){
	            if (stack=1) and (wep[b]=thawep) and (goody=0){
	                // if (thawep=wip1){
	                    att[b]+=att1;apa[b]=apa1;range[b]=rang1;wep_num[b]+=1;splash[b]=spli1;wep[b]=thawep;goody=1;
	                    // if (marine_type[unit_array_position]="Death Company") and (range[b]=1){att[b]+=att1;wep_num[b]+=1;wep_rnum[b]+=1;}
	                    if (obj_ncombat.started=0) then ammo[b]=ammo1;
	                // }
	            }
	            if (stack=0) and (obj_ncombat.started=0) and (wep[b]="") and (goody=0) and (wep_solo[b]=""){
	                if (goody=0){
	                    att[b]+=att1;apa[b]=apa1;range[b]=rang1;wep_num[b]+=1;splash[b]=spli1;wep[b]=thawep;goody=1;
	                    // if (marine_type[unit_array_position]="Death Company") and (range[b]=1){att[b]+=att1;wep_num[b]+=1;wep_rnum[b]+=1;}
	                    ammo[b]=ammo1;

	                    var title;title=true;
	                    if (marine_type[unit_array_position]="Chapter Master") then title=false;
	                    if (marine_type[unit_array_position]="Master of Sanctity") then title=false;
	                    if (marine_type[unit_array_position]="Chief "+string(obj_ini.role[100,17])) then title=false;
	                    if (marine_type[unit_array_position]="Forge Master") then title=false;
	                    if (marine_type[unit_array_position]="Master of the Apothecarion") then title=false;
	                    if (title=true) then wep_title[b]=string(marine_type[unit_array_position]);
	                    wep_solo[b]=string(obj_ini.name[marine_co[unit_array_position],marine_id[unit_array_position]]);
	                }
	            }

	            if (stack=0) and (obj_ncombat.started=1) and (wep[b]=thawep) and (wep_solo[b]=nuum) and (goody=0){
	                att[b]+=att1;apa[b]=apa1;range[b]=rang1;wep_num[b]+=1;splash[b]=spli1;wep[b]=thawep;goody=1;
	                // if (marine_type[unit_array_position]="Death Company") and (range[b]=1){att[b]+=att1;wep_num[b]+=1;wep_rnum[b]+=1;}

	                var title;title=true;
	                if (marine_type[unit_array_position]="Chapter Master") then title=false;
	                if (marine_type[unit_array_position]="Master of Sanctity") then title=false;
	                if (marine_type[unit_array_position]="Chief "+string(obj_ini.role[100,17])) then title=false;
	                if (marine_type[unit_array_position]="Forge Master") then title=false;
	                if (marine_type[unit_array_position]="Master of the Apothecarion") then title=false;
	                if (title=true) then wep_title[b]=string(marine_type[unit_array_position]);
	                wep_solo[b]=string(obj_ini.name[marine_co[unit_array_position],marine_id[unit_array_position]]);
	            }
	        }
	    }

	    b=0;
	    if (stack=1) and (goody=0){
	        repeat(60){b+=1;
	            var canc;canc=false;
	            if (rang1>1) and (marine_ranged[unit_array_position]=0){
	                 canc=true;if (floor(rang1)==rang1) then canc=false
	            }

	            if (wep[b]="") and (goody=0) and (canc=false){
	                // if (thawep=wip1){
	                    att[b]+=att1;apa[b]=apa1;range[b]=rang1;wep_num[b]+=1;splash[b]=spli1;wep[b]=thawep;goody=1;
	                    // if (marine_type[unit_array_position]="Death Company") and (range[b]=1){att[b]+=att1;wep_num[b]+=1;wep_rnum[b]+=1;}
	                    if (obj_ncombat.started=0) then ammo[b]=ammo1;
	                // }
	            }
	        }
	    }


	}


}
