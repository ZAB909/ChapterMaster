function scr_chapter(argument0) {

	// argument0 = chapter

	// Assigns premade Chapter settings

	if (cooldown<=0){click=1;
	cooldown=8;psy_powers="default";

	company_title[0]="";var i;i=0;repeat(40){i+=1;company_title[i]="";}

	if (argument0="White Scars"){founding="N/A";
	    librarian_name="Stormseer";
	}


	var i;i=-1;
	repeat(21){i+=1;
	    world[i]="";
	    world_type[i]="";
	    world_feature[i]="";
	}



	if (argument0="Dark Angels"){founding="N/A";
	    selected_chapter=1;chapter_name=argument0;icon=1;icon_name="da";fleet_type=2;maximum_size=10;purity=8;stability=10;cooperation=5;
	    custom=0;points_spent=0;points_total=0;keyboard_string=argument0;flash=0;adv_selecting=0;advantage1=8;adv1="Enemy: Fallen";
	    advantage2=0;adv2="";advantage3=0;adv3="";disadvantage1=5;dis1="Never Forgive";disadvantage2=0;dis2="";disadvantage3=0;dis3="";
	    battle_cry="Repent!  For tomorow you may die";monastery_name="The Rock";master_name="Azreal";
	    main_color="Dark Green";secondary_color="None";lens_color="Red";weapon_color="Black";initiate_name="Initiate";scout_name="Scout";tactical_name="Tactical Marine";
	    veteran_name="Veteran";devastator_name="Devastator";assault_name="Assault Marine";apothecary_name="Apothecary";librarian_name="Librarian";
	    tech_name="Techmarine";chaplain_name="Chaplain";role[100][2]="Honor Guard";dreadnought_name="Dreadnought";captain_name="Captain";
	    master_melee=3;master_ranged=999;forbidden_unit1="";forbidden_unit2="";forbidden_unit3="";
	    home_type="Dead";recruiting_type="Death";recruiting_name="Kimmeria";home_name="The Rock";lord_admiral_name=scr_marine_name();
	    chief_librarian_name="Ezekial";high_chaplain_name="Sapphon";high_apothecary_name=scr_marine_name();forge_master_name="";
	    chaplain_melee=1;chaplain_ranged=1;apothecary_melee=1;apothecary_ranged=1;sergeant_melee=1;
	    sergeant_ranged=1;scout_melee=2;scout_ranged=1;honor_melee=3;honor_mobi=1;honor_ranged=1;
	    successor_chapters=9;progenitor_disposition=0;astartes_disposition=15;imperium_disposition=16;guard_disposition=16;
	    inquisition_disposition=15;ecclesiarchy_disposition=15;other1_disposition=11;other1="";other2_disposition=15;other2="Mechanicus";
	    mutations=0;mutations_selected=0;mutation="";
    
	    recruit_trial="Blood Duel";
	    company_title[1]="Deathwing";company_title[2]="Ravenwing";
	}
	if (argument0="Duke Test"){founding="N/A";
	    selected_chapter=1;chapter_name=argument0;icon=1;icon_name="da";fleet_type=1;maximum_size=10;purity=8;stability=10;cooperation=5;
	    custom=0;points_spent=0;points_total=0;keyboard_string=argument0;flash=0;adv_selecting=0;advantage1=8;adv1="Enemy: Fallen";
	    advantage2=0;adv2="";advantage3=0;adv3="";disadvantage1=5;dis1="Never Forgive";disadvantage2=0;dis2="";disadvantage3=0;dis3="";
	    battle_cry="Repent!  For tomorow you may die";monastery_name="Bananajam";master_name="Azreal";
	    main_color="Dark Green";secondary_color="None";lens_color="Red";weapon_color="Black";initiate_name="Initiate";scout_name="Scout";tactical_name="Tactical Marine";
	    veteran_name="Veteran";devastator_name="Devastator";assault_name="Assault Marine";apothecary_name="Apothecary";librarian_name="Librarian";
	    tech_name="Techmarine";chaplain_name="Chaplain";role[100][2]="Honor Guard";dreadnought_name="Dreadnought";captain_name="Captain";
	    master_melee=3;master_ranged=999;forbidden_unit1="";forbidden_unit2="";forbidden_unit3="";
	    home_type="Dead";recruiting_type="Death";recruiting_name="Kimmeria";home_name="The Rock";lord_admiral_name=scr_marine_name();
	    chief_librarian_name="Ezekial";high_chaplain_name="Sapphon";high_apothecary_name=scr_marine_name();forge_master_name="";
	    chaplain_melee=1;chaplain_ranged=1;apothecary_melee=1;apothecary_ranged=1;sergeant_melee=1;
	    sergeant_ranged=1;scout_melee=2;scout_ranged=1;honor_melee=3;honor_mobi=1;honor_ranged=1;
	    successor_chapters=9;progenitor_disposition=0;astartes_disposition=15;imperium_disposition=16;guard_disposition=16;
	    inquisition_disposition=15;ecclesiarchy_disposition=15;other1_disposition=11;other1="";other2_disposition=15;other2="Mechanicus";
	    mutations=0;mutations_selected=0;mutation="";
    
	    recruit_trial="Blood Duel";
	    company_title[1]="Deathwing";company_title[2]="Ravenwing";
	}



	if (argument0="Space Wolves"){founding="N/A";
	    selected_chapter=3;chapter_name=argument0;icon=3;icon_name="sw";fleet_type=2;maximum_size=10;purity=8;stability=5;cooperation=5;
	    custom=0;points_spent=0;points_total=0;keyboard_string=argument0;flash=0;adv_selecting=0;advantage1=18;adv1="Melee Enthusiasts";
	    advantage2=0;adv2="";advantage3=0;adv3="";disadvantage1=1;dis1="Black Rage";disadvantage2=11;dis2="Suspicious";disadvantage3=0;dis3="";
	    battle_cry="For Russ and the Allfather";monastery_name="The Fang";master_name="Logan Grimnar";
	    main_color="Light Blue";secondary_color="Black";lens_color="Black";weapon_color="Black";

	    initiate_name="Initiate";scout_name="Wolf Scout";tactical_name="Grey Hunter";veteran_name="Wolf Guard";devastator_name="Long Fang";
	    assault_name="Blood Claw";apothecary_name="Wolf Priest";librarian_name="Rune Priest";tech_name="Iron Priest";chaplain_name="Wolf Priest";
	    role[100][2]="Wolf Guard";captain_name="Wolf Lord";
    
	    master_melee=3;master_ranged=6;forbidden_unit1="Chaplain";forbidden_unit2="";forbidden_unit3="";
	    home_type="Ice";recruiting_type="Ice";recruiting_name="Fenrir";home_name="Fenrir";lord_admiral_name="Engir Krakendoom";
	    chief_librarian_name="Njal Stormcaller";high_chaplain_name="Ulrik the Slaye";high_apothecary_name="Ranek Icewalker";forge_master_name="Krom Dragongaz";
	    chaplain_melee=1;chaplain_ranged=1;apothecary_melee=1;apothecary_ranged=1;sergeant_melee=1;
	    sergeant_ranged=1;scout_melee=2;scout_ranged=1;honor_melee=1;honor_mobi=1;honor_ranged=2;
	    successor_chapters=1;progenitor_disposition=0;astartes_disposition=15;imperium_disposition=16;guard_disposition=18;
	    inquisition_disposition=15;ecclesiarchy_disposition=13;other1_disposition=12;other1="Imperial Fists";other2_disposition=15;other2="Mechanicus";
	    mutations=0;mutations_selected=0;mutation="";psy_powers="rune Magick";
    
	    recruit_trial="Exposure";
	    company_title[1]="Champions of Fenris";
	    company_title[2]="The Bloodmaws";
	    company_title[3]="The Seawolves";
	    company_title[4]="The Sons of Morkai";
	    company_title[5]="The Red Moons";
	    company_title[6]="The Deathwolves";
	    company_title[7]="The Stormwolves";
	    company_title[8]="The Ironwolves";
	    company_title[9]="The Drakeslayers";
	    company_title[10]="The Blackmanes";
	    company_title[11]="The Firehowlers";
	    company_title[12]="The Grimbloods";
	    company_title[13]="The Wulfen";
	}
	/*
	if (argument0="Imperial Fists"){founding="N/A";
	    selected_chapter=4;chapter_name="Imperial Fists";icon=4;fleet_type=2;maximum_size=8;purity=7;stability=10;cooperation=3;
	    custom=0;points_spent=0;points_total=0;keyboard_string="Imperial Fists";flash=0;adv_selecting=0;advantage1=11;adv1="Siege Masters";
	    advantage2=3;adv2="Bolter Drilling";advantage3=0;adv3="";disadvantage1=0;dis1="";disadvantage2=0;dis2="";disadvantage3=0;dis3="";
	    battle_cry="Primarch-Progenitor, to your glory and the glory of him on earth";master_name="Vorn Hagen";monastery_name="";
	    main_color="Yellow";secondary_color="Yellow";
	    lens_color="Red";weapon_color="Black";initiate_name="Initiate";scout_name="Scout";tactical_name="Tactical Marine";
	    veteran_name="Veteran";devastator_name="Devastator";assault_name="Assault Marine";apothecary_name="Apothecary";librarian_name="Librarian";
	    tech_name="Techmarine";chaplain_name="Chaplain";role[100][2]="Honor Guard";dreadnought_name="Dreadnought";captain_name="Captain";
	    master_melee=2;master_ranged=1;forbidden_unit1="";forbidden_unit2="";forbidden_unit3="";   
    
	    home_name="Terra";
	}


	*/



	if (argument0="Imperial Fists"){
	    founding="N/A";selected_chapter=7;chapter_name="Imperial Fists";icon=4;icon_name="im";
	    fleet_type=1;maximum_size=10;purity=7;stability=10;cooperation=8;
	    custom=0;points_spent=0;points_total=0;keyboard_string=argument0;flash=0;adv_selecting=0;
	    advantage1=16;advantage2=17;advantage3=0;adv1="Siege Masters";adv2="Slow and Purposeful";adv3="";
	    disadvantage1=0;disadvantage2=0;disadvantage3=0;dis1="";dis2="";dis3="";
	    battle_cry="Primarch-Progenitor, to your glory and the glory of him on earth!";
	    monastery_name="Phalanx";master_name="Vorn Hagen";
	    main_color="Gold";secondary_color="Red";lens_color="Red";weapon_color="Black";
	    initiate_name="Initiate";scout_name="Scout";tactical_name="Tactical Marine";veteran_name="Veteran";
	    devastator_name="Devastator";assault_name="Assault Marine";apothecary_name="Apothecary";librarian_name="Librarian";
	    tech_name="Techmarine";chaplain_name="Chaplain";role[100][2]="Honor Guard";dreadnought_name="Dreadnought";
	    captain_name="Captain";master_melee=1;master_ranged=1;
	    forbidden_unit1="";forbidden_unit2="";forbidden_unit3="";
	    home_type="Hive";recruiting_type="Hive";recruiting_name="Terra-";home_name="Terra-";
	    lord_admiral_name="Quirion Octavious";chief_librarian_name="Kurt Kempka";high_chaplain_name="Carnak Cassius";
	    high_apothecary_name="Lakari";forge_master_name="Suprema Lysol Bane";
	    chaplain_melee=1;chaplain_ranged=1;apothecary_melee=1;apothecary_ranged=1;
	    sergeant_melee=1;sergeant_ranged=1;scout_melee=2;scout_ranged=1;
	    honor_melee=1;honor_mobi=1;honor_ranged=1;successor_chapters=27;
	    progenitor_disposition=0;astartes_disposition=17;imperium_disposition=18;guard_disposition=18;
	    inquisition_disposition=16;ecclesiarchy_disposition=15;other1_disposition=12;
	    // other1="Imperial Fists";//
	    other2_disposition=15;
	    other2="Mechanicus";mutations=2;mutations_selected=2;mutation="Betcher's Gland|Sus-an Membrane|";
	    betchers=1;membrane=1;
	}




	if (argument0="Blood Angels"){founding="N/A";
	    selected_chapter=5;chapter_name="Blood Angels";icon=5;icon_name="ba";fleet_type=2;maximum_size=10;purity=10;stability=9;cooperation=7;
	    custom=0;points_spent=0;points_total=0;keyboard_string="Blood Angels";flash=0;adv_selecting=0;advantage1=18;adv1="Melee Enthusiasts";
	    advantage2=0;adv2="";advantage3=0;adv3="";disadvantage1=1;dis1="Black Rage";disadvantage2=0;dis2="";disadvantage3=0;dis3="";
	    battle_cry="For the Emperor and Sanguinius! Death! DEATH";monastery_name="Fortress of Baal";master_name="Dante";
	    main_color="Red";secondary_color="Red";lens_color="Green";weapon_color="Black";initiate_name="Initiate";scout_name="Scout";tactical_name="Tactical Marine";
	    veteran_name="Veteran";devastator_name="Devastator";assault_name="Assault Marine";apothecary_name="Sanguinary Priest";librarian_name="Librarian";
	    tech_name="Techmarine";chaplain_name="Chaplain";role[100][2]="Sanguinary Guard";dreadnought_name="Dreadnought";captain_name="Captain";
	    master_melee=3;master_ranged=2;forbidden_unit1="";forbidden_unit2="";forbidden_unit3="";
	    home_type="Desert";recruiting_type="Desert";recruiting_name="Baal";home_name="Baal";lord_admiral_name="Bellerophon";
	    chief_librarian_name="Mephiston";high_chaplain_name="Astorath the Grim";high_apothecary_name=scr_marine_name();forge_master_name="Incarael";
	    chaplain_melee=1;chaplain_ranged=1;apothecary_melee=1;apothecary_ranged=1;sergeant_melee=1;
	    sergeant_ranged=1;scout_melee=2;scout_ranged=1;honor_melee=3;honor_mobi=2;honor_ranged=5;
	    successor_chapters=3;progenitor_disposition=0;astartes_disposition=17;imperium_disposition=18;guard_disposition=18;
	    inquisition_disposition=16;ecclesiarchy_disposition=15;other1_disposition=11;other1="";other2_disposition=15;other2="Mechanicus";
	    mutations=0;mutations_selected=0;mutation="";
    
	    recruit_trial="Blood Duel";
	    company_title[1]="Archangels";
	    company_title[2]="The Blooded";
	    company_title[3]="Ironhelms";
	    company_title[4]="Knights of Baal";
	    company_title[5]="Daemonbanes";
	    company_title[6]="Eternals";
	    company_title[7]="Unconquerables";
	    company_title[8]="Bloodbanes";
	    company_title[9]="Sunderers";
	    company_title[10]="Redeemers";
	}



	if (argument0="Iron Hands"){founding="N/A";
	    selected_chapter=6;chapter_name=argument0;icon=6;icon_name="ih";fleet_type=2;maximum_size=5;purity=8;stability=8;cooperation=2;
	    custom=0;points_spent=0;points_total=0;keyboard_string=argument0;flash=0;adv_selecting=0;advantage1=15;adv1="Tech-Brothers";
	    advantage2=17;adv2="Slow and Purposeful";advantage3=0;adv3="";disadvantage1=10;dis1="Splintered";disadvantage2=11;dis2="Suspicious";disadvantage3=0;dis3="";
	    battle_cry="The flesh is weak";monastery_name="Medusa";master_name="Kardan Stronos";
	    main_color="Black";secondary_color="None";lens_color="Dark Red";weapon_color="Silver";initiate_name="Initiate";scout_name="Scout";tactical_name="Tactical Marine";
	    veteran_name="Veteran";devastator_name="Devastator";assault_name="Assault Marine";apothecary_name="Apothecary";librarian_name="Librarian";
	    tech_name="Iron Father";chaplain_name="Iron Father";role[100][2]="Honor Guard";dreadnought_name="Dreadnought";captain_name="Captain";
	    master_melee=3;master_ranged=999;forbidden_unit1="Chaplain";forbidden_unit2="";forbidden_unit3="";
	    home_type="Lava";recruiting_type="Lava";recruiting_name="Medusa";home_name="Medusa";lord_admiral_name=scr_marine_name();
	    chief_librarian_name="Lydriik";high_chaplain_name="Shulgaar";high_apothecary_name="Grolvoch";forge_master_name="Feirros";
	    chaplain_melee=1;chaplain_ranged=1;apothecary_melee=1;apothecary_ranged=1;sergeant_melee=1;
	    sergeant_ranged=1;scout_melee=2;scout_ranged=1;honor_melee=3;honor_mobi=1;honor_ranged=1;
	    successor_chapters=6;progenitor_disposition=0;astartes_disposition=13;imperium_disposition=12;guard_disposition=12;
	    inquisition_disposition=14;ecclesiarchy_disposition=12;other1_disposition=15;other1="";other2_disposition=18;other2="Mechanicus";
	    mutations=0;mutations_selected=0;mutation="";
    
	    recruit_trial="Knowledge of Self";
	    company_title[1]="Clan Avernii";
	    company_title[2]="Clan Garrsak";
	    company_title[3]="Clan Felg";
	    company_title[4]="Clan Garrsak";
	    company_title[5]="Clan Kaargul";
	    company_title[6]="Clan Morragul";
	    company_title[7]="Clan Sorrgol";
	    company_title[8]="Clan Borrgar";
	    company_title[9]="Clan Ungavarr";
	    company_title[10]="Clan Dorrvok";
	}




	if (argument0="Ultramarines"){founding="N/A";
	    selected_chapter=7;chapter_name="Ultramarines";icon=7;icon_name="um";fleet_type=2;maximum_size=10;purity=10;stability=10;cooperation=7;
	    custom=0;points_spent=0;points_total=0;keyboard_string="Ultramarines";flash=0;adv_selecting=0;advantage1=0;adv1="";
	    advantage2=0;adv2="";advantage3=0;adv3="";disadvantage1=0;dis1="";disadvantage2=0;dis2="";disadvantage3=0;dis3="";
	    battle_cry="Courage and honor";monastery_name="Fortress of Hera";master_name="Marneus Calgar";
	    main_color="Blue";secondary_color="Gold";lens_color="Red";weapon_color="Black";initiate_name="Initiate";scout_name="Scout";tactical_name="Tactical Marine";
	    veteran_name="Veteran";devastator_name="Devastator";assault_name="Assault Marine";apothecary_name="Apothecary";librarian_name="Librarian";
	    tech_name="Techmarine";chaplain_name="Chaplain";role[100][2]="Honor Guard";dreadnought_name="Dreadnought";captain_name="Captain";
	    master_melee=1;master_ranged=1;forbidden_unit1="";forbidden_unit2="";forbidden_unit3="";
	    home_type="Temperate";recruiting_type="Death";recruiting_name="Parmenio";home_name="Macragge";lord_admiral_name="Lazlo Tiberius";
	    chief_librarian_name="Varro Tigurius";high_chaplain_name="Ortan Cassius";high_apothecary_name="Corpus Helix";forge_master_name="Fennias Maxim";
	    chaplain_melee=1;chaplain_ranged=1;apothecary_melee=1;apothecary_ranged=1;sergeant_melee=1;
	    sergeant_ranged=1;scout_melee=2;scout_ranged=1;honor_melee=1;honor_mobi=1;honor_ranged=1;
	    successor_chapters=27;progenitor_disposition=0;astartes_disposition=17;imperium_disposition=18;guard_disposition=18;
	    inquisition_disposition=16;ecclesiarchy_disposition=15;other1_disposition=12;other1="Imperial Fists";other2_disposition=15;other2="Mechanicus";
	    mutations=0;mutations_selected=0;mutation="";
    
	    recruit_trial="Exposure";
	    company_title[1]="Warriors of Ultramar";
	    company_title[2]="Guardians of the Temple";
	    company_title[3]="Scourge of the Xenos";
	    company_title[4]="Defenders of Ultramar";
	    company_title[5]="Wardens of the Eastern Fringe";
	}




	if (argument0="Salamanders"){founding="N/A";
	    selected_chapter=8;chapter_name="Salamanders";icon=8;icon_name="sl";fleet_type=2;maximum_size=5;purity=8;stability=9;cooperation=10;
	    custom=0;points_spent=0;points_total=0;keyboard_string="Salamanders";flash=0;adv_selecting=0;advantage1=6;adv1="Crafters";
	    advantage2=17;adv2="Slow and Purposeful";advantage3=0;adv3="";disadvantage1=0;dis1="";disadvantage2=0;dis2="";disadvantage3=0;dis3="";
	    battle_cry="Into the fires of battle, unto the anvil of war!";monastery_name="Prometheus";master_name="Tu'Shan";
	    main_color="Green";secondary_color="Black";lens_color="Yellow";weapon_color="Black";initiate_name="Initiate";scout_name="Scout";tactical_name="Tactical Marine";
	    veteran_name="Veteran";devastator_name="Devastator";assault_name="Assault Marine";apothecary_name="Apothecary";librarian_name="Librarian";
	    tech_name="Techmarine";chaplain_name="Chaplain";role[100][2]="Pyre Guard";dreadnought_name="Dreadnought";captain_name="Captain";
	    master_melee=2;master_ranged=3;forbidden_unit1="";forbidden_unit2="";forbidden_unit3="";
	    home_type="Lava";recruiting_type="Lava";recruiting_name="Nocturne";home_name="Nocturne";lord_admiral_name=scr_marine_name();
	    chief_librarian_name=scr_marine_name();high_chaplain_name=scr_marine_name();high_apothecary_name=scr_marine_name();forge_master_name="Vulkan He'stan";
	    chaplain_melee=1;chaplain_ranged=2;apothecary_melee=1;apothecary_ranged=2;sergeant_melee=1;
	    sergeant_ranged=3;scout_melee=2;scout_ranged=1;honor_melee=3;honor_mobi=1;honor_ranged=4;
	    successor_chapters=3;progenitor_disposition=0;astartes_disposition=17;imperium_disposition=18;guard_disposition=18;
	    inquisition_disposition=16;ecclesiarchy_disposition=15;other1_disposition=11;other1="Iron Hands";other2_disposition=15;other2="Mechanicus";
	    mutations=1;mutations_selected=1;mutation="secretions";secretions=1;psy_powers="pyromancy";
    
	    recruit_trial="Apprenticeship";
	    company_title[1]="The Firedrakes";
	}


	/*
	if (argument0="Salamanders"){founding="N/A";
	    selected_chapter=8;chapter_name="Salamanders";icon=8;fleet_type=2;maximum_size=7;purity=7;stability=8;cooperation=9;
	    custom=0;points_spent=0;points_total=0;keyboard_string="Salamanders";flash=0;adv_selecting=0;advantage1=4;adv1="Crafters";
	    advantage2=0;adv2="";advantage3=0;adv3="";disadvantage1=0;dis1="";disadvantage2=0;dis2="";disadvantage3=0;dis3="";
	    battle_cry="Into the fires of battle, unto the anvil of war";master_name="Tu'Shan";monastery_name="";
	    main_color="Green";secondary_color="Black";
	    lens_color="Yellow";weapon_color="Black";initiate_name="Initiate";scout_name="Scout";tactical_name="Tactical Marine";
	    veteran_name="Veteran";devastator_name="Devastator";assault_name="Assault Marine";apothecary_name="Apothecary";librarian_name="Librarian";
	    tech_name="Techmarine";chaplain_name="Chaplain";role[100][2]="Honor Guard";dreadnought_name="Dreadnought";captain_name="Captain";
	    master_melee=2;master_ranged=3;forbidden_unit1="Land Speeder";forbidden_unit2="Bike";forbidden_unit3="";
    
	    home_name="Nocturne"; 
	}


	if (argument0="Lamenters"){founding="Blood Angels";
	    selected_chapter=13;chapter_name="Lamenters";icon=13;fleet_type=3;maximum_size=5;purity=10;stability=10;cooperation=2;
	    custom=0;points_spent=0;points_total=0;keyboard_string="Lamenters";flash=0;adv_selecting=0;advantage1=0;adv1="";
	    advantage2=0;adv2="";advantage3=0;adv3="";disadvantage1=4;dis1="Shitty Luck";disadvantage2=5;dis2="Sieged";disadvantage3=7;dis3="Suspicious";
	    battle_cry="For those we cherish, we die in Glory";master_name="Malakim Phoros";monastery_name="";
	    main_color="Yellow";secondary_color="None";
	    lens_color="Dark Red";weapon_color="Black";initiate_name="Initiate";scout_name="Scout";tactical_name="Tactical Marine";
	    veteran_name="Veteran";devastator_name="Devastator";assault_name="Assault Marine";apothecary_name="Apothecary";librarian_name="Librarian";
	    tech_name="Techmarine";chaplain_name="Chaplain";role[100][2]="Honor Guard";dreadnought_name="Dreadnought";captain_name="Captain";
	    master_melee=3;master_ranged=2;forbidden_unit1="";forbidden_unit2="";forbidden_unit3="";
    
	    home_name="Lacrima Vex";
	}*/



	if (argument0="Lamenters"){founding="Blood Angels";
	    selected_chapter=13;chapter_name="Lamenters";icon=13;icon_name="lam";fleet_type=3;maximum_size=5;purity=10;stability=8;cooperation=3;
	    custom=0;points_spent=0;points_total=0;keyboard_string=chapter_name;flash=0;adv_selecting=0;advantage1=18;adv1="Melee Enthusiasts";
	    advantage2=0;adv2="";advantage3=0;adv3="";disadvantage1=8;dis1="Shitty Luck";disadvantage2=9;dis2="Sieged";disadvantage3=11;dis3="Suspicious";
	    battle_cry="For those we cherish, we die in Glory";monastery_name="Lacrima Vex";master_name="Malakim Phoros";
	    main_color="Yellow";secondary_color="None";lens_color="Dark Red";weapon_color="Black";initiate_name="Initiate";scout_name="Scout";tactical_name="Tactical Marine";
	    veteran_name="Veteran";devastator_name="Devastator";assault_name="Assault Marine";apothecary_name="Apothecary";librarian_name="Librarian";
	    tech_name="Techmarine";chaplain_name="Chaplain";role[100][2]="Honor Guard";dreadnought_name="Dreadnought";captain_name="Captain";
	    master_melee=3;master_ranged=2;forbidden_unit1="";forbidden_unit2="";forbidden_unit3="";
	    home_type="random";recruiting_type="Temperate";recruiting_name="random";home_name="random";lord_admiral_name=scr_marine_name();
	    chief_librarian_name=scr_marine_name();;high_chaplain_name=scr_marine_name();;high_apothecary_name=scr_marine_name();;forge_master_name=scr_marine_name();;
	    chaplain_melee=1;chaplain_ranged=1;apothecary_melee=1;apothecary_ranged=1;sergeant_melee=1;
	    sergeant_ranged=1;scout_melee=2;scout_ranged=1;honor_melee=1;honor_ranged=1;honor_mobi=1;
	    successor_chapters=0;progenitor_disposition=16;astartes_disposition=12;imperium_disposition=11;guard_disposition=11;
	    inquisition_disposition=11;ecclesiarchy_disposition=12;other1_disposition=0;other1="";other2_disposition=12;other2="Mechanicus";
	    mutations=0;mutations_selected=0;mutation="";chapter_year=908;
	    // Badab Sector, need custom map
    
	    recruit_trial="Challenge";
	}


	/*
	if (argument0="Angry Marines"){founding="Desert Fangs";
	    selected_chapter=15;chapter_name="Angry Marines";icon=15;fleet_type=2;maximum_size=5;purity=10;stability=10;cooperation=0;
	    custom=0;points_spent=0;points_total=0;keyboard_string="Angry Marines";flash=0;adv_selecting=0;advantage1=13;adv1="Melee Enthusiasts";
	    advantage2=0;adv2="";advantage3=0;adv3="";disadvantage1=1;dis1="Black Rage";disadvantage2=0;dis2="";disadvantage3=0;dis3="";
	    typing_slot=0;battle_cry="ALWAYS ANGRY ALL THE TIME";main_color="Yellow";secondary_color="Red";monastery_name="";
	    lens_color="Red";weapon_color="Red";initiate_name="Initiate";scout_name="Scout";tactical_name="Tactical Marine";veteran_name="Cock Knockers";
	    devastator_name="Devastator";assault_name="Angrier Marine";apothecary_name="Apothecary";librarian_name="Master of Mindfuckery";
	    tech_name="Techmarine";chaplain_name="Holy Pugilist";role[100][2]="Honor Guard";dreadnought_name="Belligerent Engine";captain_name="Captain";
	    master_name="Temperus Maximus";master_melee=1;master_ranged=1;forbidden_unit1="Devastator";forbidden_unit2="Apothecary";forbidden_unit3="";
    
	    home_name="Angrymar";
	}*/


	}


}
