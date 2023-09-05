function scr_ui_display_weapons(argument0, argument1, argument2) {

	/*ui_weapon[1]=0;ui_weapon[2]=0;
	ui_arm[1]=true;ui_arm[2]=true;
	ui_above[1]=true;ui_above[2]=true;
	ui_spec[1]=false;ui_spec[2]=false;
	ui_xmod[1]=0;ui_xmod[2]=0;
	ui_ymod[1]=0;ui_ymod[2]=0;*/

	// argument0: left?
	// argument1: termi or tartaros
	// argument2: weapon name

	var rl,wee,display_type;rl=argument0;wee=argument2;
	ui_xmod[rl]=0;ui_ymod[rl]=0;
	ui_arm[rl]=true;
	ui_weapon[rl]=spr_weapon_blank;
	ui_twoh[rl]=false;
	display_type="normal_ranged";

	if (argument0=1) then fix_left=0;
	if (argument0=2) then fix_right=0;



	if (string_count("Bolt Pistol",wee)>0){ui_weapon[rl]=spr_weapon_boltpis;
	    ui_arm[rl]=true;ui_above[rl]=true;ui_spec[rl]=false;display_type="normal_ranged";
	}
	if (string_count("Infernus Pistol",wee)>0){ui_weapon[rl]=spr_weapon_inferno;
	    ui_arm[rl]=true;ui_above[rl]=true;ui_spec[rl]=false;display_type="normal_ranged";
	}
	if (string_count("Bolter",wee)>0) and (string_count("Heavy",wee)=0) and (string_count("Integrated",wee)=0){ui_weapon[rl]=spr_weapon_bolter;
	    if (string_count("Storm",wee)>0) then ui_weapon[rl]=spr_weapon_sbolter;
	    ui_arm[rl]=true;ui_above[rl]=true;ui_spec[rl]=false;display_type="normal_ranged";
	}
	if (string_count("Plasma Pistol",wee)>0){ui_weapon[rl]=spr_weapon_plasg;
	    ui_arm[rl]=true;ui_above[rl]=true;ui_spec[rl]=false;display_type="normal_ranged";
	}
	if (string_count("Plasma Gun",wee)>0) {ui_weapon[rl]=spr_weapon_plasg;
	    ui_arm[rl]=true;ui_above[rl]=true;ui_spec[rl]=false;display_type="normal_ranged";
	}
	if (string_count("Missile Launcher",wee)>0) and (string_count("Whirl",wee)=0){ui_weapon[rl]=spr_weapon_missile;
	    ui_arm[rl]=true;ui_above[rl]=true;ui_spec[rl]=false;display_type="normal_ranged";
	}
	if (string_count("Flamer",wee)>0) {ui_weapon[rl]=spr_weapon_flamer;
	    ui_arm[rl]=true;ui_above[rl]=true;ui_spec[rl]=false;display_type="normal_ranged";
	}
	if (string_count("Meltagun",wee)>0) {ui_weapon[rl]=spr_weapon_melta;
	    ui_arm[rl]=true;ui_above[rl]=true;ui_spec[rl]=false;display_type="normal_ranged";
	}




	if (string_count("Heavy Bolter",wee)>0){ui_weapon[rl]=spr_weapon_hbolt;display_type="ranged_twohand";
	    ui_arm[1]=false;ui_arm[2]=false;ui_above[rl]=true;ui_spec[rl]=true;ui_twoh[rl]=true;
	}
	if (string_count("Lascannon",wee)>0){ui_weapon[rl]=spr_weapon_lasca;display_type="ranged_twohand";
	    ui_arm[1]=false;ui_arm[2]=false;ui_above[rl]=true;ui_spec[rl]=true;ui_twoh[rl]=true;
	}
	if (string_count("Multi-Melta",wee)>0){ui_weapon[rl]=spr_weapon_mmelta;display_type="ranged_twohand";
	    ui_arm[1]=false;ui_arm[2]=false;ui_above[rl]=true;ui_spec[rl]=true;ui_twoh[rl]=true;
	}
	if (wee="Assault Cannon"){ui_weapon[rl]=spr_weapon_assca;display_type="ranged_assault";
	    ui_arm[rl]=false;ui_above[rl]=true;ui_spec[rl]=true;
	}





	if (string_count("Sniper Rifle",wee)>0){ui_weapon[rl]=spr_weapon_sniper;
	    ui_arm[rl]=false;ui_above[rl]=true;ui_spec[rl]=true;display_type="melee_onehand";
	}
	if (string_count("Stalker Pattern Bolter",wee)>0){ui_weapon[rl]=spr_weapon_stalker;
	   ui_arm[rl]=true;ui_above[rl]=true;ui_spec[rl]=false;display_type="normal_ranged";
	}
	if (string_count("Combiflamer",wee)>0){ui_weapon[rl]=spr_weapon_comflamer;
	   ui_arm[rl]=true;ui_above[rl]=true;ui_spec[rl]=false;display_type="normal_ranged";
	}


	if (string_count("Company Standard",wee)>0){ui_weapon[rl]=spr_weapon_standard;
	    ui_arm[rl]=false;ui_above[rl]=true;ui_spec[rl]=true;display_type="melee_onehand";
	}
	if (string_count("Chainsword",wee)>0){ui_weapon[rl]=spr_weapon_chsword;
	    ui_arm[rl]=false;ui_above[rl]=true;ui_spec[rl]=true;display_type="melee_onehand";
	}
	if (string_count("Combat Knife",wee)>0){ui_weapon[rl]=spr_weapon_knife;
	    ui_arm[rl]=true;ui_above[rl]=true;ui_spec[rl]=true;display_type="melee_onehand";
	}
	if (string_count("Power Sword",wee)>0){ui_weapon[rl]=spr_weapon_powswo;
	    ui_arm[rl]=false;ui_above[rl]=true;ui_spec[rl]=true;display_type="melee_onehand";
	}
	    if (string_count("Eldar Power Sword",wee)>0){ui_weapon[rl]=spr_weapon_eldsword;
	        ui_arm[rl]=false;ui_above[rl]=true;ui_spec[rl]=true;display_type="melee_onehand";
	    }

	if (string_count("Power Spear",wee)>0){ui_weapon[rl]=spr_weapon_powspear;
	    ui_arm[rl]=false;ui_above[rl]=true;ui_spec[rl]=true;display_type="melee_onehand";
	}
	if (string_count("Eviscerator",wee)>0){ui_weapon[rl]=spr_weapon_evisc;
	    ui_arm[rl]=false;ui_above[rl]=true;ui_spec[rl]=true;display_type="melee_onehand";
	}
	if (string_count("Thunder Hammer",wee)>0){ui_weapon[rl]=spr_weapon_thhammer;
	    ui_arm[rl]=false;ui_above[rl]=true;ui_spec[rl]=true;display_type="melee_onehand";
	}
	if (string_count("Relic Blade",wee)>0){ui_weapon[rl]=spr_weapon_relbla;
	    ui_arm[rl]=false;ui_above[rl]=true;ui_spec[rl]=true;display_type="melee_onehand";
	}
	if (string_count("Power Axe",wee)>0){ui_weapon[rl]=spr_weapon_powaxe;
	    ui_arm[rl]=false;ui_above[rl]=true;ui_spec[rl]=true;display_type="melee_onehand";
	}
	}
		if (string_count("Chainaxe",wee)>0){ui_weapon[rl]=spr_weapon_chaxe;
	    ui_arm[rl]=false;ui_above[rl]=true;ui_spec[rl]=true;display_type="melee_onehand";
	}
	if (string_count("Force Weapon",wee)>0){ui_weapon[rl]=spr_weapon_force;
	    ui_arm[rl]=false;ui_above[rl]=true;ui_spec[rl]=true;display_type="melee_onehand";
	}


	var clear;clear=false;
	if (string_count("Power Fist",wee)>0) and (string_count("DUB",wee)=0){
	    ui_weapon[rl]=spr_weapon_powfist;display_type="power_fist";
	    ui_arm[rl]=true;ui_above[rl]=true;ui_spec[rl]=true;
	}
	if (string_count("Lightning Claw",wee)>0) and (string_count("DUB",wee)=0){
	    ui_weapon[rl]=spr_weapon_lightning1;display_type="lightning_claw";
	    ui_arm[rl]=true;ui_above[rl]=true;ui_spec[rl]=true;
	}














	if (argument1>=1){// Fix the hands for termi/tartar
	    if (argument0=1) and (ui_arm[1]=false) and (fix_left=0) then fix_left=1;
	    if (argument0=2) and (ui_arm[2]=false) and (fix_right=0) then fix_right=1;
	}



	if (display_type="normal_ranged"){
	    if (argument1=1){ui_xmod[rl]=-22;ui_ymod[rl]=11;}
	    if (argument1=2){ui_xmod[rl]=-14;ui_ymod[rl]=13;}
	}
	if (display_type="melee_onehand"){
	    if (argument1=1){ui_xmod[rl]=-21;ui_ymod[rl]=18;}
	    if (argument1=2){ui_xmod[rl]=-18;ui_ymod[rl]=18;}
	}


	if (display_type="power_fist"){
	    if (argument1>0){ui_arm[rl]=false;ui_above[rl]=true;}

	    if (argument1=1) and (argument0=1){ui_xmod[rl]=-3;ui_ymod[rl]=10;fix_left=8;ui_weapon[rl]=spr_weapon_powfist3;clear=true;}
	    if (argument1=1) and (argument0=2){ui_xmod[rl]=2;ui_ymod[rl]=10;fix_right=8;ui_weapon[rl]=spr_weapon_powfist3;clear=true;}
    
	    if (argument1=2) and (argument0=1){ui_xmod[rl]=0;ui_ymod[rl]=10;fix_left=8;ui_weapon[rl]=spr_weapon_powfist3;clear=true;}
	    if (argument1=2) and (argument0=2){ui_xmod[rl]=-1;ui_ymod[rl]=10;fix_right=8;ui_weapon[rl]=spr_weapon_powfist3;clear=true;}
	}
	if (display_type="lightning_claw"){
	    if (argument1=0) and (argument0=1){ui_xmod[rl]+=11;}
	    if (argument1=0) and (argument0=2){ui_xmod[rl]-=8;}

	    if (argument1>0){ui_arm[rl]=false;ui_above[rl]=true;}

	    if (argument1=1) and (argument0=1){ui_xmod[rl]=-3;ui_ymod[rl]=10;fix_left=8.1;ui_weapon[rl]=spr_weapon_lightning2;clear=true;}
	    if (argument1=1) and (argument0=2){ui_xmod[rl]=2;ui_ymod[rl]=10;fix_right=8.1;ui_weapon[rl]=spr_weapon_lightning2;clear=true;}
    
	    if (argument1=2) and (argument0=1){ui_xmod[rl]=0;ui_ymod[rl]=10;fix_left=8.1;ui_weapon[rl]=spr_weapon_lightning2;clear=true;}
	    if (argument1=2) and (argument0=2){ui_xmod[rl]=-1;ui_ymod[rl]=10;fix_right=8.1;ui_weapon[rl]=spr_weapon_lightning2;clear=true;}
	}




	if (string_count("Storm Shield",wee)>0){ui_weapon[rl]=spr_weapon_storm;
	    ui_arm[rl]=false;ui_above[rl]=true;ui_spec[rl]=false;
	}
		if (string_count("Boarding Shield",wee)>0){ui_weapon[rl]=spr_weapon_boarding;
	    ui_arm[rl]=false;ui_above[rl]=true;ui_spec[rl]=false;
	}

	// Flip for offhand
	if (argument0=2) /*and (argument1=0)*/ and (ui_xmod[rl]<0) and (display_type!="power_fist") and (display_type!="lightning_claw") then ui_xmod[rl]=ui_xmod[rl]*-1;





	exit;


	if (string_count("Bolt Pistol",wee)>0){ui_weapon[rl]=spr_weapon_boltpis;
	    ui_arm[rl]=true;ui_above[rl]=true;ui_spec[rl]=false;
	    if (argument1=1) then ui_xmod[rl]=-10;if (argument1=2) then ui_xmod[rl]=-16;
	}
	if (string_count("Infernus Pistol",wee)>0){ui_weapon[rl]=spr_weapon_inferno;
	    ui_arm[rl]=true;ui_above[rl]=true;ui_spec[rl]=false;
	    if (argument1=1) then ui_xmod[rl]=-10;if (argument1=2) then ui_xmod[rl]=-16;
	}
	if (string_count("Bolter",wee)>0) and (string_count("Heavy",wee)=0) and (string_count("Integrated",wee)=0){ui_weapon[rl]=spr_weapon_bolter;
	    if (string_count("Storm",wee)>0) then ui_weapon[rl]=spr_weapon_sbolter;
	    ui_arm[rl]=true;ui_above[rl]=true;ui_spec[rl]=false;
	    if (argument1=1) then ui_xmod[rl]=-10;if (argument1=2) then ui_xmod[rl]=-16;
	}
	if (string_count("Plasma Gun",wee)>0){ui_weapon[rl]=spr_weapon_plasg;
	    ui_arm[rl]=true;ui_above[rl]=true;ui_spec[rl]=false;
	    if (argument1=1) then ui_xmod[rl]=-10;if (argument1=2) then ui_xmod[rl]=-16;
	}
	if (string_count("Plasma Pistol",wee)>0){ui_weapon[rl]=spr_weapon_plasp;
	    ui_arm[rl]=true;ui_above[rl]=true;ui_spec[rl]=false;
	    if (argument1=1) then ui_xmod[rl]=-10;if (argument1=2){ui_xmod[rl]=-16;ui_ymod[rl]=17;}
	}
	if (string_count("Missile Launcher",wee)>0) and (string_count("Whirl",wee)=0){ui_weapon[rl]=spr_weapon_missile;
	    ui_arm[rl]=true;ui_above[rl]=true;ui_spec[rl]=false;
	    if (argument1=1) then ui_xmod[rl]=-10;if (argument1=2) then ui_xmod[rl]=-16;
	}
	if (string_count("Flamer",wee)>0){ui_weapon[rl]=spr_weapon_flamer;
	    ui_arm[rl]=true;ui_above[rl]=true;ui_spec[rl]=false;
	    if (argument1=1) then ui_xmod[rl]=-10;if (argument1=2) then ui_xmod[rl]=-16;
	}
	if (string_count("Meltagun",wee)>0){ui_weapon[rl]=spr_weapon_melta;
	    ui_arm[rl]=true;ui_above[rl]=true;ui_spec[rl]=false;
	    if (argument1=1) then ui_xmod[rl]=-10;if (argument1=2) then ui_xmod[rl]=-16;
	}


	// All of the modifiers for terminator weapons (namely melee) need to be fixed


	if (string_count("Heavy Bolter",wee)>0){ui_weapon[rl]=spr_weapon_hbolt;
	    ui_arm[1]=false;ui_arm[2]=false;
	    ui_above[rl]=true;ui_spec[rl]=true;ui_twoh[rl]=true;
	    if (argument1=1){ui_xmod[rl]=-3;ui_ymod[rl]=12;}if (argument1=2){ui_xmod[rl]=-13;ui_ymod[rl]=14;}
	}
	if (string_count("Lascannon",wee)>0){ui_weapon[rl]=spr_weapon_lasca;
	    ui_arm[1]=false;ui_arm[2]=false;
	    ui_above[rl]=true;ui_spec[rl]=true;ui_twoh[rl]=true;
	    if (argument1=1){ui_xmod[rl]=-3;ui_ymod[rl]=12;}if (argument1=2){ui_xmod[rl]=-13;ui_ymod[rl]=14;}
	}
	if (string_count("Multi-Melta",wee)>0){ui_weapon[rl]=spr_weapon_mmelta;
	    ui_arm[1]=false;ui_arm[2]=false;
	    ui_above[rl]=true;ui_spec[rl]=true;ui_twoh[rl]=true;
	    if (argument1=1){ui_xmod[rl]=-3;ui_ymod[rl]=12;}if (argument1=2){ui_xmod[rl]=-13;ui_ymod[rl]=14;}
	}
	if (wee="Assault Cannon"){ui_weapon[rl]=spr_weapon_assca;
	    ui_arm[rl]=false;ui_above[rl]=true;ui_spec[rl]=true;
	    if (argument1=1){ui_xmod[rl]=4;ui_ymod[rl]=-4;}if (argument1=2){ui_xmod[rl]=-4;ui_ymod[rl]=-4;}
	}

	if (string_count("Sniper Rifle",wee)>0){ui_weapon[rl]=spr_weapon_sniper;
	    ui_arm[rl]=false;ui_above[rl]=true;ui_spec[rl]=true;
	    if (argument1=1){ui_xmod[rl]=-3+11-13;ui_ymod[rl]=5-12+10;}if (argument1=2){ui_xmod[rl]=-12;ui_ymod[rl]=0;}
	}
	if (string_count("Stalker Pattern Bolter",wee)>0){ui_weapon[rl]=spr_weapon_stalker;
	    ui_arm[rl]=true;ui_above[rl]=true;ui_spec[rl]=false;
	    if (argument1=1) then ui_xmod[rl]=-10;if (argument1=2) then ui_xmod[rl]=-16;
	}
	if (string_count("Combiflamer",wee)>0){ui_weapon[rl]=spr_weapon_comflamer;
	    ui_arm[rl]=true;ui_above[rl]=true;ui_spec[rl]=false;
	    if (argument1=1) then ui_xmod[rl]=-10;if (argument1=2) then ui_xmod[rl]=-16;
	}


	if (string_count("Company Standard",wee)>0){ui_weapon[rl]=spr_weapon_standard;
	    ui_arm[rl]=false;ui_above[rl]=true;ui_spec[rl]=true;
	    if (argument1=1){ui_xmod[rl]=-3+11-13;ui_ymod[rl]=5-12+10;}if (argument1=2){ui_xmod[rl]=-12;ui_ymod[rl]=0;}
	}
	if (string_count("Chainsword",wee)>0){ui_weapon[rl]=spr_weapon_chsword;
	    ui_arm[rl]=false;ui_above[rl]=true;ui_spec[rl]=true;
	    if (argument1=1){ui_xmod[rl]=-3+11-13;ui_ymod[rl]=5-12+10;}if (argument1=2){ui_xmod[rl]=-12;ui_ymod[rl]=0;}
	}
	if (string_count("Combat Knife",wee)>0){ui_weapon[rl]=spr_weapon_knife;
	    ui_arm[rl]=true;ui_above[rl]=true;ui_spec[rl]=true;
	    if (argument1=1){ui_xmod[rl]=-3+11-13;ui_ymod[rl]=5-12+10;}if (argument1=2){ui_xmod[rl]=-12;ui_ymod[rl]=0;}
	}
	if (string_count("Power Sword",wee)>0){ui_weapon[rl]=spr_weapon_powswo;
	    if (string_count("Master Crafted",wee)>0){ui_weapon[rl]=spr_weapon_eldsword;}
	    ui_arm[rl]=false;ui_above[rl]=true;ui_spec[rl]=true;
	    if (argument1=1){ui_xmod[rl]=-3+11-13;ui_ymod[rl]=5-12+10;}if (argument1=2){ui_xmod[rl]=-12;ui_ymod[rl]=0;}
	}
	if (string_count("Eviscerator",wee)>0){ui_weapon[rl]=spr_weapon_evisc;
	    ui_arm[rl]=false;ui_above[rl]=true;ui_spec[rl]=true;
	    if (argument1=1){ui_xmod[rl]=-3+11-13;ui_ymod[rl]=5-12+10;}if (argument1=2){ui_xmod[rl]=-12;ui_ymod[rl]=0;}
	}
	if (string_count("Thunder Hammer",wee)>0){ui_weapon[rl]=spr_weapon_thhammer;
	    ui_arm[rl]=false;ui_above[rl]=true;ui_spec[rl]=true;
	    if (argument1=1){ui_xmod[rl]=-3+11-13;ui_ymod[rl]=5-12+10;}if (argument1=2){ui_xmod[rl]=-12;ui_ymod[rl]=0;}
	}
	if (string_count("Relic Blade",wee)>0){ui_weapon[rl]=spr_weapon_relbla;
	    ui_arm[rl]=false;ui_above[rl]=true;ui_spec[rl]=true;
	    if (argument1=1){ui_xmod[rl]=-3+11-13;ui_ymod[rl]=5-12+10;}if (argument1=2){ui_xmod[rl]=-12;ui_ymod[rl]=0;}
	}
	if (string_count("Power Axe",wee)>0){ui_weapon[rl]=spr_weapon_powaxe;
	    ui_arm[rl]=false;ui_above[rl]=true;ui_spec[rl]=true;
	    if (argument1=1){ui_xmod[rl]=-3+11-13;ui_ymod[rl]=5-12+10;}if (argument1=2){ui_xmod[rl]=-12;ui_ymod[rl]=0;}
	}
	if (string_count("Chainaxe",wee)>0){ui_weapon[rl]=spr_weapon_chaxe;
	    ui_arm[rl]=false;ui_above[rl]=true;ui_spec[rl]=true;
	    if (argument1=1){ui_xmod[rl]=-3+11-13;ui_ymod[rl]=5-12+10;}if (argument1=2){ui_xmod[rl]=-12;ui_ymod[rl]=0;}
	}

	if (string_count("Force Weapon",wee)>0){ui_weapon[rl]=spr_weapon_force;
	    ui_arm[rl]=false;ui_above[rl]=true;ui_spec[rl]=true;
	    if (argument1=1){ui_xmod[rl]=-7+11-13;ui_ymod[rl]=3-12+10;}if (argument1=2){ui_xmod[rl]=-22;ui_ymod[rl]=-2;}
	}


	var clear;clear=false;
	if (string_count("Power Fist",wee)>0) and (string_count("DUB",wee)=0){ui_weapon[rl]=spr_weapon_powfist;
	    ui_arm[rl]=true;ui_above[rl]=true;ui_spec[rl]=true;
    
	    // New powerfist
	    if (argument1=1) and (argument0=1){ui_xmod[rl]=10;ui_ymod[rl]=0;fix_left=2;ui_weapon[rl]=spr_weapon_powfist3;clear=true;}
	    if (argument1=1) and (argument0=2){ui_xmod[rl]=-10;ui_ymod[rl]=0;fix_right=2;ui_weapon[rl]=spr_weapon_powfist3;clear=true;}
    
	    // if (argument1=2){ui_xmod[rl]=-31;ui_ymod[rl]=0;}
	    if (argument1=2){ui_weapon[rl]=spr_weapon_powfist2;ui_xmod[rl]=0;ui_ymod[rl]=0;}
    
	}




	if (argument1=1){
	    if (argument0=1) and (ui_arm[1]=false) and (fix_left=0) then fix_left=1;
	    if (argument0=2) and (ui_arm[2]=false) and (fix_right=0) then fix_right=1;
	}


	/*if (string_count("Power Fist",wee)>0) and (string_count("DUB",wee)>0){
	    ui_weapon[1]=spr_weapon_powfist;ui_weapon[2]=spr_weapon_powfist;
	    ui_arm[1]=true;ui_arm[2]=true;
	    ui_above[1]=true;ui_above[2]=true;
	    ui_spec[1]=true;ui_spec[2]=true;
	    ui_twoh[1]=true;ui_force_both=true;
	    ui_xmod[1]=0;ui_ymod[1]=0;
	    ui_xmod[2]=0;ui_ymod[2]=0;
	    if (argument1=1){ui_xmod[1]=-4;ui_ymod[1]=0;ui_xmod[2]=0;ui_ymod[2]=0;}
	    if (argument1=2){ui_weapon[1]=spr_weapon_powfist2;ui_weapon[2]=spr_weapon_powfist2;}
	    // if (argument1=2){ui_xmod[1]=-31;ui_ymod[1]=0;ui_xmod[2]=26;ui_ymod[2]=0;}
	    exit;
	}*/





	if (string_count("Storm Shield",wee)>0){ui_weapon[rl]=spr_weapon_storm;
	    ui_arm[rl]=false;ui_above[rl]=true;ui_spec[rl]=false;
	}
		if (string_count("Boarding Shield",wee)>0){ui_weapon[rl]=spr_weapon_boarding;
	    ui_arm[rl]=false;ui_above[rl]=true;ui_spec[rl]=false;
	}



	if (argument1=1) and (((argument0=1) and (fix_left=0)) or ((argument0=2) and (fix_right=0))) and (clear=false){ui_xmod[1]-=15;ui_ymod[1]+=10;}
	// if (argument1=1) and (((argument0=1) and (fix_left=0)) or ((argument0=2) and (fix_right=0))) and (clear=false){ui_xmod[1]-=30;ui_ymod[1]+=20;}



	if (argument0=2) and (argument1=0) and (ui_xmod[rl]<0) then ui_xmod[rl]=ui_xmod[rl]*-1;
	// if (rl=2) and (ui_xmod[rl]!=0) then ui_xmod[rl]=ui_xmod[rl]*-1;


}
