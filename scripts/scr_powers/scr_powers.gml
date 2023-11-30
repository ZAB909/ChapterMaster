function scr_powers(argument0, argument1, argument2, argument3) {

	// argument0: letter
	// argument1: number
	// argument2: target
	// argument3: marine_id

	// This is a stand-alone script that determines powers based on the POWERS variable,
	// executes them, and applies the effect and flavor.  All in one.  Because I eventually
	// got better at this sort of thing.

	var school,power_name,target_type,enemy5,onc,m1,m2,m3,m4,using,binders,book_powers,book_roll,tome_bad,tome_slot,tome_tags,damnyou;
	school="";
	power_name="";
	target_type="";
	enemy5=argument2;
	onc=argument1;
	using=argument0;
	m1="";m2="";m3="";m4="";
	binders=false;
	book_powers="";
	book_roll=floor(random(100))+1;
	tome_bad=0;tome_slot=0;tome_tags="";damnyou=string(marine_wep1[argument3])+string(marine_wep2[argument3]);

	// In here check if have book

	if (string_count("Tome",damnyou)>0){
	    // Nurge is 2, tzeentch is 3, slaanesh 4
    
	    var tomes,onf;tomes=0;onf=0;
	    if (string_count("Tome",marine_wep1[argument3])>0) and (string_count("Tome",marine_wep2[argument3])=0) then tomes=1;
	    if (string_count("Tome",marine_wep1[argument3])=0) and (string_count("Tome",marine_wep2[argument3])>0) then tomes=2;
	    if (string_count("Tome",marine_wep1[argument3])>0) and (string_count("Tome",marine_wep2[argument3])>0) then tomes=3;
	    if (tomes=1) and (onf=0){onf=1;tomes=1;}
	    if (tomes=2) and (onf=0){onf=1;tomes=2;}
	    if (tomes=3) and (onf=0){onf=1;tomes=choose(1,2);}
	    if (tomes=1) then tome_tags=marine_wep1[argument3];
	    if (tomes=2) then tome_tags=marine_wep2[argument3];
    
	    if (string_count("Tome",tome_tags)>0){
	        if (string_count("PRE",tome_tags)>0) then book_powers="nu";
	        if (string_count("MIN",tome_tags)>0) then book_powers="tz_daemon";
	        if (string_count("2",tome_tags)>0) then book_powers="nu_daemon";
	        if (string_count("3",tome_tags)>0) then book_powers="tz_daemon";
	        if (string_count("4",tome_tags)>0) then book_powers="sl_daemon";
        
	        if (book_powers=""){// Check materials here for non-chaos powers
	            if (string_count("GOLD",tome_tags)>0) then book_powers="default";// gold
	            if (string_count("CRU",tome_tags)>0) then book_powers="telekenesis";// crumbling
	            if (string_count("GLO",tome_tags)>0) then book_powers="default";// blue glow
	            if (string_count("ADA",tome_tags)>0) then book_powers="default";// adamantium
	            if (string_count("PRE",tome_tags)>0) then book_powers="biomancy";// preserved flesh
	            if (string_count("THI",tome_tags)>0) then book_powers="biomancy";// thin
	            if (string_count("FAL",tome_tags)>0) then book_powers="nu";// fallen angle
	            if (string_count("SAL",tome_tags)>0) then book_powers="pyromancy";// salamander
	            if (string_count("TEN",tome_tags)>0) then book_powers="what_the_fuck_man";// tentacles
	            if (string_count("MIN",tome_tags)>0) then book_powers="tz_daemon";// mindfuck
	            if (book_powers="default") and (string_count("BUR",tome_tags)>0) then book_powers="pyromancy";// burning book
            
            
	            // skulls, falling angel, thin, tentacle, mindfuckif (t2!="Statue") then t5=choose("SKU","FAL","THI","TEN","MIN");
            
	        }
        
	    }
	}


	var re;re=0;repeat(4){re+=1;if (obj_ini.adv[re]="Daemon Binders") then binders=true;}

	var p_type, p_rang, p_tar, p_spli, p_att, p_arp, p_duration;
	p_type="";p_rang=0;p_tar=0;p_spli=0;p_att=0;p_arp=0;p_duration=0;


	if (string_count("Z",using)>0){school="hacks";power_name="gather_energy";}

	if (string_count("D",using)>0){school="default";
	    if (onc=0) then power_name="Minor Smite";
	    if (onc=1) then power_name="Smite";
	    if (onc=2) then power_name="Force Dome";
	    if (onc=3) then power_name="Machine Curse";
	    if (onc=4) then power_name="Avenge";
	    if (onc=5) then power_name="Quickening";
	    if (onc=6) then power_name="Might of the Ancients";
	    if (onc=7) then power_name="Vortex of Doom";
	}
	if (string_count("B",using)>0){school="biomancy";
	    if (onc=0) then power_name="Minor Smite";
	    if (onc=1) then power_name="Blood Boil";
	    if (onc=2) then power_name="Iron Arm";
	    if (onc=3) then power_name="Endurance";
	    if (onc=4) then power_name="Regenerate";
	    if (onc=5) then power_name="Haemorrhage";
	}
	if (string_count("P",using)>0){school="pyromancy";
	    if (onc=0) then power_name="Breathe Fire";
	    if (onc=1) then power_name="Fiery Form";
	    if (onc=2) then power_name="Fire Shield";
	    if (onc=3) then power_name="Inferno";
	    if (onc=4) then power_name="Sun Burst";
	    if (onc=5) then power_name="Molten Beam";
	}
	if (string_count("T",using)>0){school="telekinesis";
	    if (onc=0) then power_name="Crush";
	    if (onc=1) then power_name="Shockwave";
	    if (onc=2) then power_name="Wave of Force";
	    if (onc=3) then power_name="Telekinetic Dome";
	    if (onc=4) then power_name="Spatial Distortion";
	    if (onc=5) then power_name="Vortex of Doom";
	}
	if (string_count("R",using)>0){school="rune Magick";
	    if (onc=0) then power_name="Living Lightning";
	    if (onc=1) then power_name="Murderous Hurricane";
	    if (onc=2) then power_name="Stormbringer";
	    if (onc=3) then power_name="Fury of the Wolf";
	    if (onc=4) then power_name="Thunder Clap";
	    if (onc=5) then power_name="Spatial Distortion";
	}


	if (book_powers!="") and (book_roll<=50){power_name="";
	    if (book_powers="nu"){onc=choose(1,2,3);tome_bad=1;
	        if (onc=1) then power_name="Wave of Entropy";
	        if (onc=2) then power_name="Insect Swarm";
	        if (onc=3) then power_name="Blood Dementia";
	    }
	    if (book_powers="nu_daemon"){onc=choose(1,2,3,4);tome_bad=2;
	        if (onc=1) then power_name="Wave of Entropy";
	        if (onc=2) then power_name="Insect Swarm";
	        if (onc=3) then power_name="Blood Dementia";
	        if (onc=4) then power_name="Putrid Vomit";
	    }
	    if (book_powers="tz_daemon"){onc=choose(1,2,3,4);tome_bad=2;
	        if (onc=1) then power_name="Wave of Change";
	        if (onc=2) then power_name="Warp Bolts";
	        if (onc=3) then power_name="Warp Beam";
	        if (onc=4) then power_name="Iron Arm";
	    }
	    if (book_powers="sl_daemon"){onc=choose(1,2,3,4);tome_bad=2;
	        if (onc=1) then power_name="Warp Bolts";
	        if (onc=2) then power_name="Rainbow Beam";
	        if (onc=3) then power_name="Hysterical Frenzy";
	        if (onc=4) then power_name="Symphony of Pain";
	    }
    
	    if (book_powers="default") or (book_powers=""){onc=choose(1,2,3);
	        if (onc=1) then power_name="Avenge";
	        if (onc=2) then power_name="Spatial Distortion";
	        if (onc=3) then power_name="Stormbringer";
	    }
	    if (book_powers="telekenesis"){onc=choose(1,2,3);
	        if (onc=1) then power_name="Spatial Distortion";
	        if (onc=2) then power_name="Telekinetic Dome";
	        if (onc=3) then power_name="Vortex of Doom";
	    }
	    if (book_powers="biomancy"){onc=choose(1,2,3,4);tome_bad=1;
	        if (onc=1) then power_name="Haemorrhage";
	        if (onc=2) then power_name="Regenerate";
	        if (onc=3) then power_name="Iron Arm";
	        if (onc=4) then power_name="Insect Swarm";
	    }
	    if (book_powers="pyromancy"){onc=choose(1,2,3);
	        if (onc=1) then power_name="Inferno";
	        if (onc=2) then power_name="Sun Burst";
	        if (onc=3) then power_name="Molten Beam";
	    }
	    if (book_powers="what_the_fuck_man"){onc=choose(1,2,3,1,3);tome_bad=2;
	        if (onc=1) then power_name="Blood Dementia";
	        if (onc=2) then power_name="Spatial Distortion";
	        if (onc=3) then power_name="Haemorrhage";
	    }
	}

	// Change cases here
	if (power_name="Machine Curse"){
	    with(obj_enunit){if (veh>0) then instance_create(x,y,obj_temp3);}
	    if (instance_number(obj_temp3)=0) then power_name="Smite";
	    if (obj_ncombat.enemy=9) then power_name="Smite";
	    with(obj_temp3){instance_destroy();}
	}

	// show_message(string(power_name));
	// 

	// Chaos powers here

	if (power_name="Wave of Entropy"){p_type="attack";p_rang=3;p_tar=3;p_spli=1;p_att=220;p_arp=0;p_duration=0;
	    m2="- a putrid cone of warp energy splashes outward, ";
	    if (obj_ncombat.enemy=9) then m2+="twisting and rusting everything it touches.  ";
	    if (obj_ncombat.enemy!=9) then m2+="boiling and putrifying flesh.  ";
	    if (obj_ncombat.sorcery_seen<2) and (obj_ncombat.present_inquisitor=1) then obj_ncombat.sorcery_seen=1;
	}
	if (power_name="Wave of Change"){p_type="attack";p_rang=3;p_tar=3;p_spli=1;p_att=220;p_arp=0;p_duration=0;
	    m2="- a wispy cone of warp energy reaches outward, twisting and morphing all that it touches.  ";
	    if (obj_ncombat.sorcery_seen<2) and (obj_ncombat.present_inquisitor=1) then obj_ncombat.sorcery_seen=1;
	}
	if (power_name="Insect Swarm"){p_type="attack";p_rang=3;p_tar=3;p_spli=1;p_att=500;p_arp=1;p_duration=0;
	    var rah;rah=choose(1,2);
	    if (rah=1) then m2="- a massive, black cloud of insects spew from his body.  At once they begin burrowing into your foes.  ";
	    if (rah=2) then m2="- rank, ichory insects spew forth from his body at your foes.  They begin burrowing through flesh and armour alike.  ";
	    if (obj_ncombat.sorcery_seen<2) and (obj_ncombat.present_inquisitor=1) then obj_ncombat.sorcery_seen=1;
	}
	if (power_name="Blood Dementia"){
	    p_type="buff";p_rang=0;p_tar=0;p_spli=0;p_att=0;p_arp=0;p_duration=3;
	    m2=".  He goes absolutely nuts, screaming and raging, his mind and body pulsing with chaotic energy.  ";
	    // marine_dementia[argument3]=1;
	    marine_attack[argument3]+=2;marine_ranged[argument3]=0;
	    if (obj_ncombat.sorcery_seen<2) and (obj_ncombat.present_inquisitor=1) then obj_ncombat.sorcery_seen=1;
	}
	if (power_name="Putrid Vomit"){p_type="attack";p_rang=2.1;p_tar=3;p_spli=1;p_att=600;p_arp=0;p_duration=0;
	    var rah;rah=choose(1,2);
	    m2="- from in front of their mouth a stream of rancid, acidic vomit spews forth at tremendous pressure, splashing over his foes.  ";
	    if (obj_ncombat.enemy=9) then p_att=450;
	    if (obj_ncombat.sorcery_seen<2) and (obj_ncombat.present_inquisitor=1) then obj_ncombat.sorcery_seen=1;
	}
	if (power_name="Warp Bolts"){p_type="attack";p_rang=5;p_tar=3;p_spli=1;p_att=300;p_arp=0;p_duration=0;
	    var rah;rah=choose(1,2,3);
	    if (rah=1) then m2="- several bolts of purple warp energy appear and are flung at the enemy.  ";
	    if (rah=2) then m2="- he launches a series of rapid warp bolts at the enemy.  ";
	    if (rah=3) then m2="- three oozing, shifting bolts of warp energy fly outward from his palms.  ";
	    if (obj_ncombat.sorcery_seen<2) and (obj_ncombat.present_inquisitor=1) then obj_ncombat.sorcery_seen=1;
	}
	if (power_name="Warp Beam"){p_type="attack";p_rang=8;p_tar=4;p_spli=1;p_att=600;p_arp=1;p_duration=0;
	    m2="- a massive beam of purple warp energy shoots forth.  All that it touches is consumed.  ";
	    if (obj_ncombat.sorcery_seen<2) and (obj_ncombat.present_inquisitor=1) then obj_ncombat.sorcery_seen=1;
	}
	if (power_name="Rainbow Beam"){p_type="attack";p_rang=10;p_tar=3;p_spli=1;p_att=500;p_arp=1;p_duration=0;
	    m2="- a massive beam of warp energy hisses at the enemy, the crackling energy shifting through every color imaginable sickeningly fast.  ";
	    if (obj_ncombat.sorcery_seen<2) and (obj_ncombat.present_inquisitor=1) then obj_ncombat.sorcery_seen=1;
	}
	if (power_name="Hysterical Frenzy"){p_type="buff";p_rang=0;p_tar=0;p_spli=0;p_att=0;p_arp=0;p_duration=999;
	    if (obj_ncombat.player_forces>1) then m2=".  Warp energy infuses his body, and several other marines, frenzying them into sensation-seeking destruction.  ";
	    if (obj_ncombat.player_forces=1) then m2=".  Warp energy infuses his body, frenzying him into sensation-seeking destruction.  ";
	    if (obj_ncombat.sorcery_seen<2) and (obj_ncombat.present_inquisitor=1) then obj_ncombat.sorcery_seen=1;
	}
	if (power_name="Symphony of Pain"){p_type="attack";p_rang=2.1;p_tar=3;p_spli=1;p_att=750;p_arp=1;p_duration=0;
	    m2="- mouth stretching unnaturally wide, before letting out a hellish shriek.  ";
	    var rah;rah=choose(1,2);
	    if (rah=1) then m2="The air rumbles and shifts at the sheer magnitude of the sound.  ";
	    if (rah=2) then m2="Armour and flesh tear alike are torn apart by volume of the howl.  ";
	    if (obj_ncombat.sorcery_seen<2) and (obj_ncombat.present_inquisitor=1) then obj_ncombat.sorcery_seen=1;
	}










	if (power_name="gather_energy"){
	    p_type="buff";p_rang=0;p_tar=0;p_spli=0;p_att=0;p_arp=0;p_duration=0;
	    if (obj_ncombat.big_boom<1) then m2=" begins to gather psychic energy.";
	    if (obj_ncombat.big_boom>=1) then m2=" continues to gather psychic energy.";
	    obj_ncombat.big_boom+=1;
	}
	if (power_name="gather_energy") and (obj_ncombat.big_boom=3) then power_name="Imperator Maior";

	if (power_name="Imperator Maior"){obj_ncombat.big_boom=0;
	    p_type="attack";p_rang=5;p_tar=3;p_spli=1;p_att=1000;p_arp=1;p_duration=0;
	    m2="- he unleashes all of the gathered energy in a massive psychic blast.  ";
	}





	// target       0: self     1: ally     2: ally vehicle     3: enemy       4: enemy vehicle
	if (power_name="Minor Smite"){p_type="attack";p_rang=5;p_tar=3;p_spli=1;p_att=160;p_arp=0;p_duration=0;
	    m2="- a coil of warp energy lashes out at the enemy.  ";
	    if (binders=true) then m2="- a green, sickly coil of energy lashes out at the enemy.  ";
	}
	if (power_name="Smite"){p_type="attack";p_rang=5;p_tar=3;p_spli=1;p_att=260;p_arp=0;p_duration=0;
	    var rah;rah=choose(1,2,3);
	    if (rah=1) then m2="- a blast of warp energy smashes into the enemy.  ";
	    if (rah=2) then m2="- warp lightning crackles and leaps to the enemy.  ";
	    if (rah=3) then m2="- a brilliant bolt of lightning crashes into the enemy.  ";
	    if (binders=true) and (rah=1) then m2="-a green blast of sorcery smashes into the enemy.  ";
	    if (binders=true) and (rah>=2) then m2="-a wave of green fire launches forth, made up of hideous faces and claws.  ";
	}
	if (power_name="Force Dome"){p_type="buff";p_rang=1;p_tar=1;p_spli=0;p_att=0;p_arp=0;p_duration=2;
	    m2=".  An oozing, shifting dome of pure energy appears, covering your forces.";
	    if (binders=true) then m2=".  An oozing, shifting dome of sorcerous energy appears, covering your forces.";
	    if (binders=true) and (obj_ncombat.sorcery_seen<2) and (obj_ncombat.present_inquisitor=1) then obj_ncombat.sorcery_seen=1;
	}
	if (power_name="Machine Curse"){p_type="attack";p_rang=5;p_tar=4;p_spli=0;p_att=300;p_arp=1;p_duration=0;
	    m2="- the machine spirit within an enemy vehicle is roused.  ";
	}
	if (power_name="Avenge"){p_type="attack";p_rang=5;p_tar=3;p_spli=1;p_att=500;p_arp=0;p_duration=0;
	    var rah;rah=choose(1,2);
	    if (rah=1) then m2="- a destructive avatar of rolling flame crashes into the enemy.  ";
	    if (rah=2) then m2="- a massive conflagration rises up and then crashes down upon the enemy.  ";
	    if (binders=true) and (rah=1) then m2="- a hideous being of rolling flame crashes into the enemy.  ";
	    if (binders=true) and (rah=2) then m2="- a massive conflagration rises up and then crashes down upon the enemy.  ";
	}
	if (power_name="Quickening"){p_type="buff";p_rang=0;p_tar=0;p_spli=0;p_att=0;p_arp=0;p_duration=3;
	    m2=".  Gaining precognitive powers, he is better able to avoid enemy blows.";
	}
	if (power_name="Might of the Ancients"){p_type="buff";p_rang=0;p_tar=0;p_spli=0;p_att=0;p_arp=0;p_duration=3;
	    m2=".  His physical power and might is increased to unimaginable levels.";
	}
	if (power_name="Vortex of Doom"){p_type="attack";p_rang=5;p_tar=3;p_spli=1;p_att=800;p_arp=1;p_duration=0;
	    m2="- a hole between real and warp space is torn open with deadly effect.  ";
	    if (binders=true) then m2="- a hole bewteen real and worp space is torn, unleashing a myriad of sorcerous energies.  ";
	    if (binders=true) and (obj_ncombat.sorcery_seen<2) and (obj_ncombat.present_inquisitor=1) then obj_ncombat.sorcery_seen=1;
	}


	if (power_name="Breathe Fire"){p_type="attack";p_rang=3;p_tar=3;p_spli=0;p_att=200;p_arp=-1;p_duration=0;
	    m2="- a bright jet of flame shoots forth at the enemy.  ";
	    if (binders=true) then m2="- a greenish, eery jet of flame shoots forth at the enemy.  ";
	}
	if (power_name="Fiery Form"){p_type="buff";p_rang=0;p_tar=0;p_spli=0;p_att=0;p_arp=0;p_duration=3;
	    m2=".  Hissing flames appear and roar around the marine, threatening nearby foes.  ";
	    if (binders=true) then m2=".  Hideous, eery beings of warp fire begin to dance around the marine, threatening nearby foes.  ";
	}
	if (power_name="Fire Shield"){p_type="buff";p_rang=0;p_tar=0;p_spli=0;p_att=0;p_arp=0;p_duration=3;
	    m2=".  Orange sheets of fire shimmer around your forces, protecting them.  ";
	    if (binders=true) then m2="-  Purple sheets of warp fire shimmer around your forces, protecting them.  ";
	}
	if (power_name="Inferno"){p_type="attack";p_rang=4;p_tar=3;p_spli=1;p_att=600;p_arp=0;p_duration=0;
	    var rah;rah=choose(1,2);
	    if (rah=1) then m2="- a massive conflagration rises up and then crashes down upon the enemy.  ";
	    if (rah=2) then m2="- after breathing deeply a massive jet of flame is unleashed.  Smoke billows into the sky.  ";
	    if (binders=true) and (rah=1) then m2="- a hideous being of rolling flame crashes into the enemy.  ";
	    if (binders=true) and (rah=2) then m2="- a massive conflagration rises up and then crashes down upon the enemy.  ";
	}
	if (power_name="Sun Burst"){p_type="attack";p_rang=8;p_tar=4;p_spli=1;p_att=200;p_arp=1;p_duration=0;
	    m2="- a crackling, hissing beam of purple-red flame shoots from him.  ";
	    if (binders=true) then m2="- a crackling, hissing beam of purple warp shoots from him.  ";
	    if (binders=true) and (obj_ncombat.sorcery_seen<2) and (obj_ncombat.present_inquisitor=1) then obj_ncombat.sorcery_seen=1;
	}
	if (power_name="Molten Beam"){p_type="attack";p_rang=8;p_tar=4;p_spli=1;p_att=600;p_arp=1;p_duration=0;
	    m2="- a white-blue beam, blinding to behold, shoots forth.  All that it touches turns to slag.  ";
	    if (binders=true) then m2="- a massive beam of purple warp energy shoots forth.  All that it touches is consumed.  ";
	    if (binders=true) and (obj_ncombat.sorcery_seen<2) and (obj_ncombat.present_inquisitor=1) then obj_ncombat.sorcery_seen=1;
	}

	if (power_name="Blood Boil"){p_type="attack";p_rang=3;p_tar=3;p_spli=0;p_att=220;p_arp=0;p_duration=0;
	    m2="- accelerating the pulse and blood pressure of his foes.  ";
	}
	if (power_name="Iron Arm"){p_type="buff";p_rang=0;p_tar=0;p_spli=0;p_att=0;p_arp=0;p_duration=3;
	    m2=".  His flesh is transmuted into a form of living metal.  ";
	}
	if (power_name="Endurance"){p_type="buff";p_rang=0;p_tar=0;p_spli=0;p_att=0;p_arp=0;p_duration=3;
	    m2=".  He reaches into nearby allies, restoring their flesh and kniting wounds.  ";
	}
	if (power_name="Regenerate"){p_type="buff";p_rang=0;p_tar=0;p_spli=0;p_att=0;p_arp=0;p_duration=0;
	    m2=".  His flesh shimmers and twists back together, sealing up wounds and damage.  ";
	}
	if (power_name="Haemorrhage"){p_type="attack";p_rang=3;p_tar=3;p_spli=1;p_att=800;p_arp=0;p_duration=0;
	    m2="- reaching inside of his foes and lighting their flesh aflame.  ";
	}

	if (power_name="Crush"){p_type="attack";p_rang=4;p_tar=3;p_spli=0;p_att=190;p_arp=0;p_duration=0;
	    m2="- his foes are entraped in a crushing mass of force.  ";
	}
	if (power_name="Shockwave"){p_type="attack";p_rang=4;p_tar=3;p_spli=1;p_att=280;p_arp=0;p_duration=0;
	    var rah;rah=choose(1,2,3);
	    m2="- a massive wave of force smashes aside his foes.  ";
	}
	if (power_name="Telekinetic Dome"){p_type="buff";p_rang=0;p_tar=0;p_spli=0;p_att=0;p_arp=0;p_duration=3;
	    m2=".  Invisible currents of force surround him, ready to deflect bolts or blows.  ";
	}
	if (power_name="Spatial Distortion"){p_type="buff";p_rang=0;p_tar=0;p_spli=0;p_att=0;p_arp=0;p_duration=3;
	    m2=".  His blows, once thrown, are now able to become impossibly heavy and forceful.  ";
	}


	if (power_name="Living Lightning"){p_type="attack";p_rang=5;p_tar=3;p_spli=0;p_att=160;p_arp=0;p_duration=0;
	    m2="- arcs of lightning shoot from hand and strike his foes.  ";
	}
	if (power_name="Stormbringer"){p_type="buff";p_rang=1;p_tar=1;p_spli=0;p_att=0;p_arp=0;p_duration=2;
	    m2=".  A vortex of ice and winds crackle into existance, covering your forces.";
	}
	if (power_name="Murderous Hurricane"){p_type="attack";p_rang=4;p_tar=3;p_spli=1;p_att=320;p_arp=0;p_duration=0;
	    var rah;rah=choose(1,2,3);
	    m2="- a mighty winter gale billows forth, shredding and freezing flesh.  ";
	}
	if (power_name="Fury of the Wolf Spirits"){p_type="attack";p_rang=3;p_tar=3;p_spli=1;p_att=440;p_arp=0;p_duration=0;
	    var rah;rah=choose(1,2);
	    if (rah=1) then m2="- a pair of Thunderwolf revenants sprint outward, running down and overwhelming foes.  ";
	    if (rah=2) then m2="- ghostly visages of Freki and Geri launch into his foes, overwhelming them.  ";
	}
	if (power_name="Thunderclap"){p_type="attack";p_rang=1.1;p_tar=3;p_spli=1;p_att=600;p_arp=0;p_duration=0;
	    m2="- smashing his gauntlets together and unleashing a mighty shockwave.  ";
	}
	if (power_name="Jaws of the World Wolf"){p_type="attack";p_rang=5;p_tar=3;p_spli=1;p_att=800;p_arp=1;p_duration=0;
	    m2="- chasms open up beneath his foes, swallowing them down and crushing them.  ";
	}



	if (power_name="Avenge"){p_type="attack";p_rang=5;p_tar=3;p_spli=1;p_att=500;p_arp=0;p_duration=0;
	    var rah;rah=choose(1,2);
	    if (rah=1) then m2="- a destructive avatar of rolling flame crashes into the enemy.  ";
	    if (rah=2) then m2="- a massive conflagration rises up and then crashes down upon the enemy.  ";
	}
	if (power_name="Quickening"){p_type="buff";p_rang=0;p_tar=0;p_spli=0;p_att=0;p_arp=0;p_duration=3;
	    m2=".  Gaining precognitive powers, he is better able to avoid enemy blows.";
	}
	if (power_name="Might of the Ancients"){p_type="buff";p_rang=0;p_tar=0;p_spli=0;p_att=0;p_arp=0;p_duration=3;
	    m2=".  His physical power and might is increased to unimaginable levels.";
	}
	// if (power_name="Vortex of Doom"){p_type="attack";p_rang=5;p_tar=3;p_spli=1;p_att=800;p_arp=800;p_duration=0;
	//     m2="- a hole between real and warp space is torn open with deadly effect.  ";
	// }

	if (binders=true) and (p_type="attack"){
	    if (p_att>0) then p_att=round(p_att)*1.15;
	    // if (p_arp>0) then p_arp=round(p_arp)*1.15;
	    if (p_rang>0) then p_rang=round(p_rang)*1.2;
	}
	if (marine_type[argument3]="Chapter Master"){
	    if (obj_ini.adv[1]="Paragon") or (obj_ini.adv[2]="Paragon") or (obj_ini.adv[3]="Paragon") or (obj_ini.adv[4]="Paragon"){
	        if (p_att>0) then p_att=round(p_att)*1.25;
	        // if (p_arp>0) then p_arp=round(p_arp)*1.25;
	        if (p_rang>0) then p_rang=round(p_rang)*1.25;
	    }
	}



	m1=string(marine_type[argument3])+" "+string(obj_ini.name[marine_co[argument3],marine_id[argument3]]+" casts '"+string(power_name)+"'");
	if (book_powers!="") and (book_roll<=33) and (power_name!="Imperator Maior") and (power_name!="gather_energy"){
	    m1=string(marine_type[argument3])+" "+string(obj_ini.name[marine_co[argument3],marine_id[argument3]]);
	    if (string_char_at(m1,string_length(m1))="s") then m1+="' tome ";
	    if (string_char_at(m1,string_length(m1))!="s") then m1+="'s tome ";
	    m1+="confers knowledge upon him.  He casts '"+string(power_name)+"'";
    
	    if (tome_bad>0){
	        var tome_roll;tome_roll=floor(random(100))+1;
	        if (tome_roll<=10) and (tome_bad=1) then obj_ini.chaos[marine_co[argument3],marine_id[argument3]]+=choose(1,2);
	        if (tome_roll<=20) and (tome_bad>1) then obj_ini.chaos[marine_co[argument3],marine_id[argument3]]+=choose(3,4,5);
	    }
    
	}

	if (power_name="gather_energy") then m1=string(marine_type[argument3])+" "+string(obj_ini.name[marine_co[argument3],marine_id[argument3]])+" ";
	if (power_name="Imperator Maior") then m1=string(marine_type[argument3])+" "+string(obj_ini.name[marine_co[argument3],marine_id[argument3]]+" casts '"+string(power_name)+"'");





	// determine target here
	var good,good2,peril1,peril2,heh,perils;good=0;good2=0;peril1=0;peril2=0;perils=0;
	heh=choose(0,0,0,2);

	peril1=(marine_exp[argument3]*-0.03)+9;
	// peril1+=30;
	if (string_count("Hood",marine_gear[argument3])>0) then peril1-=5;
	if (peril1<1) then peril1=1;
	if (string_count("Warp Touched",obj_ini.strin2)>0) then peril1+=2;
	if (marine_type[argument3]="Chapter Master") and (peril1>1) then peril1=round(peril1/2);
	if (string_count("Shitty",obj_ini.strin2)>0) then peril1+=3;

	if (book_powers!="") then peril1+=tome_bad;
	if (string_count("daemon",book_powers)>0) then peril1+=3;

	peril1+=obj_ncombat.global_perils;
	peril2=floor(random(100))+1;
	peril3=floor(random(100))+1;

	if (binders=true){heh=choose(0,0,0,0,0,2);peril3+=40;if (peril3<=47) then peril3=48;}// I hope you like demons



	// show_message("Peril of the Warp Chance: "+string(peril1)+"#Roll: "+string(peril2));
	// peril2=1;peril3=88;

	if (peril2<=peril1) and (heh=2){
	    if (obj_ncombat.sorcery_seen=1) then obj_ncombat.sorcery_seen=0;

	    p_type="perils";m3="";
	    if (string_count("Warp Touched",obj_ini.strin2)>0) then peril3+=20;
	    if (string_count("Shitty",obj_ini.strin2)>0) then peril3+=25;
	    if (string_count("daemon",book_powers)>0) then peril1+=25;
	    m1=string(marine_type[argument3])+" "+string(obj_ini.name[marine_co[argument3],marine_id[argument3]])+" suffers Perils of the Warp!  ";
    
	    if (peril3>0) and (peril3<=15){marine_hp[argument3]-=choose(8,12,16,20);m2="He begins to gibber as psychic backlash overtakes him.";obj_ini.chaos[marine_co[argument3],marine_id[argument3]]+=choose(2,4,6,8);}
	    if (peril3>15) and (peril3<=23){marine_hp[argument3]-=choose(30,35,40,45);m2="His mind is burned fiercly by the warp.";}
	    if (peril3>23) and (peril3<=31){marine_hp[argument3]-=5000;m2="Psychic backlash knocks him out entirely, incapacitating the marine.";}
	    if (peril3>31) and (peril3<=39){marine_casting[argument3]-=999;m2="His mind is seared by the warp, now unable to cast more powers this battle.";obj_ini.chaos[marine_co[argument3],marine_id[argument3]]+=choose(7,10,13,15);}
	    if (peril3>39) and (peril3<=47){marine_hp[argument3]-=choose(30,35,40,45);
	        m2="The psychic blast he had prepared runs loose, striking himself!";
	        if (school="biomancy"){m2="The psychic blast he had prepared runs loose, boiling his own blood!";}
	        if (school="pyromancy"){m2="He lights on fire from the inside out, incapacitated in agony!";marine_hp[argument3]-=5000;}
	        if (school="telekinesis"){m2="The blast he had prepared runs loose, smashing himself into the ground!";}
	    }
	    if (peril3>47) and (peril3<=55){
	        m2="Capricious voices eminate from the surrounding area, whispering poisonous lies and horrible truths.";
	        obj_ini.chaos[marine_co[argument3],marine_id[argument3]]+=choose(10,15,20);
	        repeat(6){
	            var t;t=floor(random(men))+1;
	            if (marine_type[t]!="") then obj_ini.chaos[marine_co[t],marine_id[t]]+=choose(6,9,12,15);
	        }
	    }
	    if (peril3>55) and (peril3<=63){
	        m2="Dark, shifting lights form into several ";
	        var dem,d1,d2,d3;dem=choose("Pink Horror","Daemonette","Bloodletter","Plaguebearer");
	        m2+=string(dem)+"s.";d1=0;d2=0;d3=0;d1=instance_nearest(x,y,obj_enunit);
	        var exist;exist=0;
	        repeat(30){if (d3=0){d2+=1;if (d1.dudes[d2]=dem){exist=d2;d3=5;}}}
	        if (exist>0){d2=choose(3,4,5,6);d1.dudes_num[exist]+=d2;obj_ncombat.enemy_forces+=d2;obj_ncombat.enemy_max+=d2;d1.men+=d2;}
	        d2=0;
	        if (exist=0){
	            repeat(30){if (d3=0){d2+=1;if (d1.dudes[d2]=""){d3=d2;}}}
	            d2=choose(3,4,5,6);
	            d1.dudes[d3]=dem;d1.dudes_special[d3]="";d1.dudes_num[d3]=d2;
	            d1.dudes_ac[d3]=15;d1.dudes_hp[d3]=150;d1.dudes_dr[d3]=0.7;
	            d1.dudes_vehicle[d3]=0;d1.dudes_damage[d3]=0;d1.men+=d2;
	            obj_ncombat.enemy_forces+=d2;obj_ncombat.enemy_max+=d2;
	        }
	    }
	    if (peril3>63) and (peril3<=71){
	        m2="There is a massive explosion of warp energy which incapacitates him and injures several other marines!";
	        marine_hp[argument3]-=65;marine_hp[argument3]-=5000;
	        repeat(7){
	            var t;t=floor(random(men))+1;
	            if (marine_type[t]!="") then marine_hp[t]-=choose(10,20,30);
	        }
	    }
	    if (peril3>71) and (peril3<=79){obj_ncombat.global_perils+=25;m2="Wind shrieks and blood pours from the sky!  The warp feels unstable.";}
	    if (peril3>79) and (peril3<=87){
	        marine_casting[argument3]=-999;marine_hp[argument3]-=70;m2="A massive shockwave eminates from the marine, who is knocked out cold!  All of his equipment is destroyed!";
	        marine_wep1[argument3]="";marine_wep2[argument3]="";marine_armour[argument3]="";marine_gear[argument3]="";marine_mobi[argument3]="";
	    }
	    if (peril3>87) and (peril3<=95){marine_hp[argument3]=-150;marine_dead[argument3]=2;
	        var woah;woah=choose(1,2);
	        if (obj_ini.role[marine_co[argument3],marine_id[argument3]]="Chapter Master") then global.defeat=3;
	        if (obj_ini.age[marine_co[argument3],marine_id[argument3]]<=((obj_controller.millenium*1000)+obj_controller.year)-10) and (obj_ini.zygote=0) and (string_count("Doom",obj_ini.strin2)=0) then obj_ncombat.gene_penalty+=1;
	        if (obj_ini.age[marine_co[argument3],marine_id[argument3]]<=((obj_controller.millenium*1000)+obj_controller.year)-5) and (string_count("Doom",obj_ini.strin2)=0) then obj_ncombat.gene_penalty+=1;
	        if (woah=1) then m2="There is a snap, and pop, and he disappears entirely.";
	        if (woah=2) then m2="He explodes into a cloud of gore, splattering guts and ceramite across the battlefield.";
	    }
    
	    if (peril3>95){marine_hp[argument3]=-150;marine_dead[argument3]=2;
	        if (obj_ini.role[marine_co[argument3],marine_id[argument3]]="Chapter Master") then global.defeat=3;
	        m2="The marine's flesh begins to twist and rip, seemingly turning inside out.  His form looms up, and up, and up.  Within seconds a Greater Daemon of ";
	        if (obj_ini.age[marine_co[argument3],marine_id[argument3]]<=((obj_controller.millenium*1000)+obj_controller.year)-10) and (obj_ini.zygote=0) and (string_count("Doom",obj_ini.strin2)=0) then obj_ncombat.gene_penalty+=1;
	        if (obj_ini.age[marine_co[argument3],marine_id[argument3]]<=((obj_controller.millenium*1000)+obj_controller.year)-5) and (string_count("Doom",obj_ini.strin2)=0) then obj_ncombat.gene_penalty+=1;
        
	        var dem,d1,d2,d3;
	        dem=choose("Slaanesh","Nurgle","Tzeentch");
	        if (book_powers!=""){if (string_count("Dae",marine_gear[argument3])>0){
	            if (string_count("2",marine_gear[argument3])>0) then dem="Slaanesh";
	            if (string_count("3",marine_gear[argument3])>0) then dem="Nurgle";
	            if (string_count("4",marine_gear[argument3])>0) then dem="Tzeentch";
	        }}
        
	        m2+=string(dem)+" has taken form.";d1=0;d2=0;d3=0;d1=instance_nearest(x,y,obj_enunit);
	        repeat(30){if (d3=0){d2+=1;if (d1.dudes[d2]=""){d3=d2;}}}
	        d1.dudes[d3]="Greater Daemon of "+string(dem);d1.dudes_special[d3]="";d1.dudes_num[d3]=1;
	        d1.dudes_ac[d3]=30;d1.dudes_hp[d3]=700;d1.dudes_dr[d3]=0.5;
	        d1.dudes_vehicle[d3]=0;d1.dudes_damage[d3]=0;d1.medi+=1;
	        obj_ncombat.enemy_forces+=1;obj_ncombat.enemy_max+=1;
	        d1.neww=1;d1.alarm[1]=1;
        
            
            
	        // show_message(string(d1.dudes[d3])+" "+string(d1.dudes_num[d3]));
        
        
	    }
    
	    if (marine_hp[argument3]<0){
	        if (marine_dead[argument3]=0) then marine_dead[argument3]=1;
	        obj_ncombat.player_forces-=1;
        
	        var units_lost,going_up;
	        units_lost=0;going_up=0;
	        var important,u,hh,stahp;u=-1;hh=0;stahp=0;
	        repeat(50){u+=1;if (u<=20) then important[u]="";lost[u]="";lost_num[u]=0;}
	        var h,good,open;h=0;good=0;open=0;
	        repeat(30){// Need to find the open slot
	            h+=1;
	            if (obj_ncombat.player_forces>6){
	                if (marine_type[argument3]=lost[hh]) and (good=0){lost_num[hh]+=1;good=1;}// If one unit is all the same, and get smashed, this should speed up the repeats
	                if (marine_type[argument3]=lost[h]) and (good=0){lost_num[h]+=1;good=1;hh=h;}
	            }
	            if (lost[h]="") and (open=0) then open=h;// Find the first open
	        }
	        if (good=0) and (open!=0){lost_num[open]=1;lost[open]=marine_type[argument3];}
	        units_lost+=1;men-=1;
        
	        if (marine_type[argument3]=obj_ini.role[100][6]) or (marine_type[argument3]="Venerable "+string(obj_ini.role[100][6])) then dreads-=1;
	        if (obj_ncombat.red_thirst=1) and (marine_type[argument3]!="Death Company") then obj_ncombat.red_thirst=2;
	    }
    
	    obj_ncombat.messages+=1;
	    obj_ncombat.message[obj_ncombat.messages]=m1+m2+m3;
	    // if (enemy5.dudes_vehicle[targeh]=1) then obj_ncombat.message_sz[obj_ncombat.messages]=(casualties*10)+(0.5-(obj_ncombat.messages/100));
	    obj_ncombat.message_sz[obj_ncombat.messages]=999+(0.5-(obj_ncombat.messages/100));
	    obj_ncombat.message_priority[obj_ncombat.messages]=0;
	}

	if (obj_ncombat.sorcery_seen=1) then obj_ncombat.sorcery_seen=2;

	if (p_type="buff") or (power_name="gather_energy"){
	    if (power_name="Force Dome") or (power_name="Stormbringer"){
	        var buf,h;buf=9;h=0;
	        repeat(100){
	            if (buf>0){h=floor(random(men))+1;if (marine_type[h]!="") and (marine_dead[h]=0) and (marine_mshield[h]=0){buf-=1;marine_mshield[h]=2;}}
	            if (buf=0){if (marine_mshield[argument3]<2){buf-=1;marine_mshield[argument3]=2;}}
	        }
	    }
	    if (power_name="Quickening"){if (marine_quick[argument3]<3) then marine_quick[argument3]=3;}
	    if (power_name="Might of the Ancients"){if (marine_might[argument3]<3) then marine_might[argument3]=3;}
    
	    if (power_name="Fiery Form"){if (marine_fiery[argument3]<3) then marine_fiery[argument3]=3;}
	    if (power_name="Fire Shield"){
	        var buf,h;buf=9;h=0;
	        repeat(100){
	            if (buf>0){h=floor(random(men))+1;if (marine_type[h]!="") and (marine_dead[h]=0) and (marine_fshield[h]=0){buf-=1;marine_fshield[h]=2;}}
	            if (buf=0){if (marine_fshield[argument3]<2){buf-=1;marine_fshield[argument3]=2;}}
	        }
	    }
    
	    if (power_name="Iron Arm") then marine_iron[argument3]+=1;
	    if (power_name="Endurance"){
	        var buf,h;buf=5;h=0;
	        repeat(100){
	            if (buf>0){h=floor(random(men))+1;if (marine_type[h]!="") and (marine_hp[h]<=80) and (marine_dead[h]=0){buf-=1;marine_hp[h]+=20;if (marine_hp[h]>100) then marine_hp[h]=100;}}
	        }
	    }
	    if (power_name="Hysterical Frenzy"){
	        var buf,h;buf=5;h=0;
	        repeat(100){
	            if (buf>0){h=floor(random(men))+1;if (marine_type[h]!="") and (marine_attack[h]<2.5) and (marine_dead[h]=0){buf-=1;marine_attack[h]+=1.5;marine_defense[h]-=0.15;}}
	        }
	    }
	    if (power_name="Regenerate"){marine_hp[argument3]+=choose(2,3,4)*5;if (marine_hp[argument3]>100) then marine_hp[argument3]=100;}

	    if (power_name="Telekinetic Dome"){if (marine_dome[argument3]<3) then marine_dome[argument3]=3;}
	    if (power_name="Spatial Distortion"){if (marine_spatial[argument3]<3) then marine_spatial[argument3]=3;}
    
	    /*obj_ncombat.newline=string(m1)+string(m2)+string(m3);
	    obj_ncombat.newline_color="blue";
	    with(obj_ncombat){scr_newtext();}*/
    
	    obj_ncombat.messages+=1;
	    obj_ncombat.message[obj_ncombat.messages]=m1+m2+m3;
	    // if (enemy5.dudes_vehicle[targeh]=1) then obj_ncombat.message_sz[obj_ncombat.messages]=(casualties*10)+(0.5-(obj_ncombat.messages/100));
	    obj_ncombat.message_sz[obj_ncombat.messages]=0.5-(obj_ncombat.messages/100);
	    obj_ncombat.message_priority[obj_ncombat.messages]=0;
    
	    if (power_name="gather_energy"){obj_ncombat.message_priority[obj_ncombat.messages]=135;obj_ncombat.message_sz[obj_ncombat.messages]=300-(obj_ncombat.messages/100);}
	    // obj_ncombat.alarm[3]=2;
	}




	var shot_web;shot_web=1;
	if (p_type="attack") and (power_name="Imperator Maior") then shot_web=3;

	if (shot_web>1){
	    obj_ncombat.messages+=1;
	    obj_ncombat.message[obj_ncombat.messages]=m1+m2;
	    obj_ncombat.message_priority[obj_ncombat.messages]=136;
	    obj_ncombat.message_sz[obj_ncombat.messages]=2500;
	}



	m4="";

	repeat(shot_web){
	    if (shot_web>1) then m3="";

	    if (p_type="attack"){
	        if (good=0){
        
	            repeat(10){
	                if (good2=0) and (instance_exists(obj_enunit)){
	                    enemy5=instance_nearest(x,y,obj_enunit);
	                    var s;s=0;
                    
	                    repeat(20){
	                        if (point_distance(x,y,enemy5.x,enemy5.y)<(p_rang*10)){
	                            if (p_tar=3) and (good=0){s+=1;
	                                if (enemy5.dudes_hp[s]>0) and (dudes_vehicle[s]=0) then good=s;
	                            }
	                            if (p_tar=4) and (good=0){s+=1;
	                                if (enemy5.dudes_hp[s]>0) and (dudes_vehicle[s]=1) then good=s;
	                            }
	                        }
	                    }
	                    if (good=0) then instance_deactivate_object(enemy5);
	                    if (good!=0) then good2=good;
	                }
	            }
            
	            var onk;onk=0;
	            if (p_tar=3) and (good=0) and (good2=0) and (p_arp>0) and (onk=0){p_tar=4;onk=1;}
	            if (p_tar=4) and (good=0) and (good2=0) and (p_att>0) and (onk=0){p_tar=3;onk=1;}
            
	            instance_activate_object(obj_enunit);
            
	            repeat(10){
	                if (good2=0) and (instance_exists(obj_enunit)){
	                    enemy5=instance_nearest(x,y,obj_enunit);
	                    var s;s=0;
                    
	                    repeat(20){
	                        if (point_distance(x,y,enemy5.x,enemy5.y)<(p_rang*10)){
	                            if (p_tar=3) and (good=0){s+=1;
	                                if (enemy5.dudes_hp[s]>0) and (dudes_vehicle[s]=0) then good=s;
	                            }
	                            if (p_tar=4) and (good=0){s+=1;
	                                if (enemy5.dudes_hp[s]>0) and (dudes_vehicle[s]=1) then good=s;
	                            }
	                        }
	                    }
	                    if (good=0) then instance_deactivate_object(enemy5);
	                    if (good!=0) then good2=good;
	                }
	            }
            
	            instance_activate_object(obj_enunit);
	        }
    
    
    
	    // show_message(string(m1)+string(m2)+"#"+string(enemy5));
        
	        if (good2>0){
	            var damage_type,stap;
	            damage_type="att";stap=0;
            
	            damage_type="att";
	            if (p_arp>0) and (p_att>=100) then damage_type="arp";
            
	            // if (p_tar=3) then damage_type="att";
	            // if (p_tar=4) then damage_type="arp";
            
            
	            if (damage_type="att") and (stap=0) and (instance_exists(enemy5)) and (enemy5.dudes_num[good2]>0){
	                var a,b,c,eac;eac=enemy5.dudes_ac[good2];
	                a=p_att;// Average damage
                
	                // b=a-enemy5.dudes_ac[good2];// Average after armour
                
	                if (enemy5.dudes_vehicle[good2]=0){
	                    if (p_arp=1) then eac=0;
	                    if (p_arp=-1) then eac=eac*6;
	                }
	                if (enemy5.dudes_vehicle[good2]=1){
	                    if (p_arp=-1) then eac=a;
	                    if (p_arp=0) then eac=eac*6;
	                    if (p_arp=-1) then eac=a;
	                }
	                b=a-eac;if (b<=0) then b=0;
                
	                c=b*1;// New damage
                
                
	                if (enemy5.dudes_hp[good2]=0){
	                    show_message(power_name);
	                    show_message("Getting a 0 health error for target "+string(enemy5)+", dudes "+string(good2));
	                    show_message("Dudes: "+string(enemy5.dudes[good2])+", Number: "+string(enemy5.dudes_num[good2]));
	                    show_message("Damage: "+string(c));
	                    show_message(string(enemy5.dudes_hp[good2]));
	                }
                
	                var casualties,ponies,onceh;onceh=0;ponies=0;
	                if (p_spli=0) then casualties=min(floor(c/enemy5.dudes_hp[good2]),1);
	                if (p_spli!=0) then casualties=floor(c/enemy5.dudes_hp[good2]);
                
	                ponies=enemy5.dudes_num[good2];
	                if (enemy5.dudes_num[good2]=1) and ((enemy5.dudes_hp[good2]-c)<=0){casualties=1;}
                
	                if (enemy5.dudes_num[good2]-casualties<0) then casualties=ponies;
	                if (casualties<0) then casualties=0;
                
	                if (enemy5.dudes_num[good2]=1) and (c>0) then enemy5.dudes_hp[good2]-=c;// Need special flavor here for just damaging
                
	                if (casualties>1) then m3=string(casualties)+" "+string(enemy5.dudes[good2])+" are killed.";
	                if (casualties=1) then m3="A "+string(enemy5.dudes[good2])+" is killed.";
	                if (casualties=0) then m3="The "+string(enemy5.dudes[good2])+" survives the attack.";

                
                
	                if (casualties>0){
	                    var duhs;duhs=enemy5.dudes[good2];
	                    if (obj_ncombat.battle_special="WL10_reveal") or (obj_ncombat.battle_special="WL10_later"){
	                        if (duhs="Veteran Chaos Terminator") then obj_ncombat.chaos_angry+=casualties*2;
	                        if (duhs="Veteran Chaos Chosen") then obj_ncombat.chaos_angry+=casualties;
	                        if (duhs="Greater Daemon of Slaanesh") then obj_ncombat.chaos_angry+=casualties*5;
	                        if (duhs="Greater Daemon of Tzeentch") then obj_ncombat.chaos_angry+=casualties*5;
	                    }
	                }
                
	                obj_ncombat.messages+=1;
	                obj_ncombat.message[obj_ncombat.messages]=m1+m2+m3;
	                if (shot_web>1) then obj_ncombat.message[obj_ncombat.messages]=m3;
                
	                    obj_ncombat.message_sz[obj_ncombat.messages]=casualties+1;
	                // if (enemy5.dudes_vehicle[targeh]=1) then obj_ncombat.message_sz[obj_ncombat.messages]=(casualties*10)+(0.5-(obj_ncombat.messages/100));
	                // else{obj_ncombat.message_sz[obj_ncombat.messages]=(casualties)+(0.5-(obj_ncombat.messages/100));}
	                obj_ncombat.message_priority[obj_ncombat.messages]=0;
	                if (shot_web>1){
	                    obj_ncombat.message_priority[obj_ncombat.messages]=135;
	                    obj_ncombat.message_sz[obj_ncombat.messages]=2000+obj_ncombat.messages;
	                }
                
	                // obj_ncombat.alarm[3]=2;
                
	                if (casualties>=1){
	                    enemy5.dudes_num[good2]-=casualties;
	                    obj_ncombat.enemy_forces-=casualties;
	                }
	            }
            
	            if (damage_type="arp") and (stap=0) and (instance_exists(enemy5)) and (enemy5.dudes_num[good2]>0){
	                var a,b,c,eac;eac=enemy5.dudes_ac[good2];
	                a=p_att;// Average damage
	                // b=a-enemy5.dudes_ac[good2];// Average after armour
                
	                if (enemy5.dudes_vehicle[good2]=0){
	                    if (p_arp=1) then eac=0;
	                    if (p_arp=-1) then eac=eac*6;
	                }
	                if (enemy5.dudes_vehicle[good2]=1){
	                    if (p_arp=-1) then eac=a;
	                    if (p_arp=0) then eac=eac*6;
	                    if (p_arp=-1) then eac=a;
	                }
	                b=a-eac;if (b<=0) then b=0;
                
	                c=b*1;// New damage
                
                
	                if (enemy5.dudes_hp[good2]=0){
	                    show_message(power_name);
	                    show_message("Getting a 0 health error for target "+string(enemy5)+", dudes "+string(good2));
	                    show_message("Dudes: "+string(enemy5.dudes[good2])+", Number: "+string(enemy5.dudes_num[good2]));
	                    show_message("Damage: "+string(c));
	                    show_message(string(enemy5.dudes_hp[good2]));
	                }
                
	                var casualties,ponies,onceh;onceh=0;ponies=0;
	                if (p_spli=0) then casualties=min(floor(c/enemy5.dudes_hp[good2]),1);
	                if (p_spli!=0) then casualties=floor(c/enemy5.dudes_hp[good2]);
                
	                ponies=enemy5.dudes_num[good2];
	                if (enemy5.dudes_num[good2]=1) and ((enemy5.dudes_hp[good2]-c)<=0){casualties=1;}
                
	                if (enemy5.dudes_num[good2]-casualties<0) then casualties=ponies;
	                if (casualties<0) then casualties=0;
                
	                if (enemy5.dudes_num[good2]=1) and (c>0) then enemy5.dudes_hp[good2]-=c;// Need special flavor here for just damaging
                
	                if (casualties>1) then m3=string(casualties)+" "+string(enemy5.dudes[good2])+" are destroyed.";
	                if (casualties=1) then m3="A "+string(enemy5.dudes[good2])+" is destroyed.";
	                if (casualties=0) then m3="The "+string(enemy5.dudes[good2])+" survives the attack.";
                
	                /*obj_ncombat.newline=string(m1)+string(m2)+string(m3);
	                obj_ncombat.newline_color="blue";
	                with(obj_ncombat){scr_newtext();}*/
                
	                if (casualties>0){
	                    var duhs;duhs=enemy5.dudes[good2];
	                    if (obj_ncombat.battle_special="WL10_reveal") or (obj_ncombat.battle_special="WL10_later"){
	                        if (duhs="Veteran Chaos Terminator") then obj_ncombat.chaos_angry+=casualties*2;
	                        if (duhs="Veteran Chaos Chosen") then obj_ncombat.chaos_angry+=casualties;
	                        if (duhs="Greater Daemon of Slaanesh") then obj_ncombat.chaos_angry+=casualties*5;
	                        if (duhs="Greater Daemon of Tzeentch") then obj_ncombat.chaos_angry+=casualties*5;
	                    }
	                }
                
	                obj_ncombat.messages+=1;
	                obj_ncombat.message[obj_ncombat.messages]=m1+m2+m3;
	                if (shot_web>1) then obj_ncombat.message[obj_ncombat.messages]=m3;
                
	                    obj_ncombat.message_sz[obj_ncombat.messages]=casualties+1;
	                // if (enemy5.dudes_vehicle[targeh]=1) then obj_ncombat.message_sz[obj_ncombat.messages]=(casualties*10)+(0.5-(obj_ncombat.messages/100));
	                // else{obj_ncombat.message_sz[obj_ncombat.messages]=(casualties)+(0.5-(obj_ncombat.messages/100));}
	                obj_ncombat.message_priority[obj_ncombat.messages]=0;
	                if (shot_web>1){
	                    obj_ncombat.message_priority[obj_ncombat.messages]=135;
	                    obj_ncombat.message_sz[obj_ncombat.messages]=2000+obj_ncombat.messages;
	                }
	                // obj_ncombat.alarm[3]=2;
                
	                if (casualties>=1){
	                    enemy5.dudes_num[good2]-=casualties;
	                    obj_ncombat.enemy_forces-=casualties;
	                }
	            }
            
	            if (stap=0) then with(enemy5){
	                var j,good,open;
	                j=0;good=0;open=0;
	                repeat(20){j+=1;
	                    if (dudes_num[j]<=0){
	                        dudes[j]="";dudes_special[j]="";dudes_num[j]=0;dudes_ac[j]=0;
	                        dudes_hp[j]=0;dudes_vehicle[j]=0;dudes_damage[j]=0;
	                    }
	                    if (dudes[j]="") and (dudes[j+1]!=""){
	                        dudes[j]=dudes[j+1]dudes_special[j]=dudes_special[j+1];
	                        dudes_num[j]=dudes_num[j+1];dudes_ac[j]=dudes_ac[j+1];
	                        dudes_hp[j]=dudes_hp[j+1];dudes_vehicle[j]=dudes_vehicle[j+1];
	                        dudes_damage[j]=dudes_damage[j+1];
                        
	                        dudes[j+1]="";dudes_special[j+1]="";dudes_num[j+1]=0;dudes_ac[j+1]=0;
	                        dudes_hp[j+1]=0;dudes_vehicle[j+1]=0;dudes_damage[j+1]=0;
	                    }
	                }
	                j=0;
	            }
	            if (enemy5.men+enemy5.veh+enemy5.medi=0) and (enemy5.owner!=1) {
	                with(enemy5){instance_destroy();}
	            }
	        }
        
	    }

    
	}// End repeat


	obj_ncombat.alarm[3]=5;


}
