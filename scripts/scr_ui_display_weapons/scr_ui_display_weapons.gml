// Displays weapon based on the armor type to change the art to match the armor type
function scr_ui_display_weapons(argument0, termi_tartaros, equiped_weapon) {
	/*ui_weapon[1]=0;ui_weapon[2]=0;
	ui_arm[1]=true;ui_arm[2]=true;
	ui_above[1]=true;ui_above[2]=true;
	ui_spec[1]=false;ui_spec[2]=false;
	ui_xmod[1]=0;ui_xmod[2]=0;
	ui_ymod[1]=0;ui_ymod[2]=0;*/

	// argument0: left?

	var display_type,rl=argument0,clear=false;
	ui_xmod[rl]=0;
	ui_ymod[rl]=0;
	ui_arm[rl]=true;
	ui_weapon[rl]=spr_weapon_blank;
	ui_twoh[rl]=false;
	display_type="normal_ranged";

	// Checks if armour is either termi or tartaros to display proper fix
	if (argument0=1) then fix_left=0;
	if (argument0=2) then fix_right=0;

	// ** Ranged Weapons **
	if (string_count("Bolt Pistol",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_boltpis;
	    ui_arm[rl]=true;
		ui_above[rl]=true;
		ui_spec[rl]=false;
		display_type="normal_ranged";
	}
	if (string_count("Infernus Pistol",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_inferno;
	    ui_arm[rl]=true;
		ui_above[rl]=true;
		ui_spec[rl]=false;
		display_type="normal_ranged";
	}
	if (string_count("Bolter",equiped_weapon)>0) and (string_count("Heavy",equiped_weapon)=0) and (string_count("Integrated",equiped_weapon)=0){
		ui_weapon[rl]=spr_weapon_bolter;
	    if (string_count("Storm",equiped_weapon)>0) then ui_weapon[rl]=spr_weapon_sbolter;
	    ui_arm[rl]=true;
		ui_above[rl]=true;
		ui_spec[rl]=false;
		display_type="normal_ranged";
	}
	if (string_count("Plasma Pistol",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_plasg;
	    ui_arm[rl]=true;
		ui_above[rl]=true;
		ui_spec[rl]=false;
		display_type="normal_ranged";
	}
	if (string_count("Plasma Gun",equiped_weapon)>0) {
		ui_weapon[rl]=spr_weapon_plasg;
	    ui_arm[rl]=true;
		ui_above[rl]=true;
		ui_spec[rl]=false;
		display_type="normal_ranged";
	}
	if (string_count("Missile Launcher",equiped_weapon)>0) and (string_count("Whirl",equiped_weapon)=0){
		ui_weapon[rl]=spr_weapon_missile;
	    ui_arm[rl]=true;
		ui_above[rl]=true;
		ui_spec[rl]=false;
		display_type="normal_ranged";
	}
	if (string_count("Flamer",equiped_weapon)>0) {
		ui_weapon[rl]=spr_weapon_flamer;
	    ui_arm[rl]=true;
		ui_above[rl]=true;
		ui_spec[rl]=false;
		display_type="normal_ranged";
	}
	if (string_count("Meltagun",equiped_weapon)>0) {
		ui_weapon[rl]=spr_weapon_melta;
	    ui_arm[rl]=true;
		ui_above[rl]=true;
		ui_spec[rl]=false;
		display_type="normal_ranged";
	}
	if (string_count("Heavy Bolter",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_hbolt;
		display_type="ranged_twohand";
	    ui_arm[1]=false;
		ui_arm[2]=false;
		ui_above[rl]=true;
		ui_spec[rl]=true;
		ui_twoh[rl]=true;
	}
	if (string_count("Lascannon",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_lasca;
		display_type="ranged_twohand";
	    ui_arm[1]=false;
		ui_arm[2]=false;
		ui_above[rl]=true;
		ui_spec[rl]=true;
		ui_twoh[rl]=true;
	}
	if (string_count("Multi-Melta",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_mmelta;
		display_type="ranged_twohand";
	    ui_arm[1]=false;
		ui_arm[2]=false;
		ui_above[rl]=true;
		ui_spec[rl]=true;
		ui_twoh[rl]=true;
	}
	if (equiped_weapon="Assault Cannon"){
		ui_weapon[rl]=spr_weapon_assca;
		display_type="ranged_assault";
	    ui_arm[rl]=false;
		ui_above[rl]=true;
		ui_spec[rl]=true;
	}
	if (string_count("Sniper Rifle",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_sniper;
	    ui_arm[rl]=false;
		ui_above[rl]=true;
		ui_spec[rl]=true;
		display_type="melee_onehand";
	}
	if (string_count("Stalker Pattern Bolter",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_stalker;
		ui_arm[rl]=true;
		ui_above[rl]=true;
		ui_spec[rl]=false;
		display_type="normal_ranged";
	}
	if (string_count("Combiflamer",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_comflamer;
		ui_arm[rl]=true;
		ui_above[rl]=true;
		ui_spec[rl]=false;
		display_type="normal_ranged";
	}
	// ** Melee weapons **
	if (string_count("Company Standard",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_standard;
	    ui_arm[rl]=false;
		ui_above[rl]=true;
		ui_spec[rl]=true;
		display_type="melee_onehand";
	}
	if (string_count("Chainsword",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_chsword;
	    ui_arm[rl]=false;
		ui_above[rl]=true;
		ui_spec[rl]=true;
		display_type="melee_onehand";
	}
	if (string_count("Combat Knife",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_knife;
	    ui_arm[rl]=true;
		ui_above[rl]=true;
		ui_spec[rl]=true;
		display_type="melee_onehand";
	}
	if (string_count("Power Sword",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_powswo;
	    ui_arm[rl]=false;
		ui_above[rl]=true;
		ui_spec[rl]=true;
		display_type="melee_onehand";
	}
	if (string_count("Eldar Power Sword",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_eldsword;
	    ui_arm[rl]=false;
		ui_above[rl]=true;
		ui_spec[rl]=true;
		display_type="melee_onehand";
	}
	if (string_count("Power Spear",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_powspear;
	    ui_arm[rl]=false;
		ui_above[rl]=true;
		ui_spec[rl]=true;
		display_type="melee_onehand";
	}
	if (string_count("Eviscerator",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_evisc;
	    ui_arm[rl]=false;
		ui_above[rl]=true;
		ui_spec[rl]=true;
		display_type="melee_onehand";
	}
	if (string_count("Thunder Hammer",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_thhammer;
	    ui_arm[rl]=false;
		ui_above[rl]=true;
		ui_spec[rl]=true;
		display_type="melee_onehand";
	}
	if (string_count("Relic Blade",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_relbla;
	    ui_arm[rl]=false;
		ui_above[rl]=true;
		ui_spec[rl]=true;
		display_type="melee_onehand";
	}
	if (string_count("Power Axe",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_powaxe;
	    ui_arm[rl]=false;
		ui_above[rl]=true;
		ui_spec[rl]=true;
		display_type="melee_onehand";
	}
	if (string_count("Chainaxe",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_chaxe;
	    ui_arm[rl]=false;
		ui_above[rl]=true;
		ui_spec[rl]=true;
		display_type="melee_onehand";
	}
	if (string_count("Force Weapon",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_force;
	    ui_arm[rl]=false;
		ui_above[rl]=true;
		ui_spec[rl]=true;
		display_type="melee_onehand";
	}
	if (string_count("Power Fist",equiped_weapon)>0) and (string_count("DUB",equiped_weapon)=0){
	    ui_weapon[rl]=spr_weapon_powfist;
		display_type="power_fist";
	    ui_arm[rl]=true;
		ui_above[rl]=true;
		ui_spec[rl]=true;
	}
	if (string_count("Lightning Claw",equiped_weapon)>0) and (string_count("DUB",equiped_weapon)=0){
	    ui_weapon[rl]=spr_weapon_lightning1;
		display_type="lightning_claw";
	    ui_arm[rl]=true;
		ui_above[rl]=true;
		ui_spec[rl]=true;
	}
	// Fix sprite for termi/tartar
	if (termi_tartaros>=1){

	    if (argument0=1) and (ui_arm[1]=false) and (fix_left=0) then fix_left=1;
	    if (argument0=2) and (ui_arm[2]=false) and (fix_right=0) then fix_right=1;
	}
	if (display_type="normal_ranged"){
	    if (termi_tartaros=1){
			ui_xmod[rl]=-22;
			ui_ymod[rl]=11;
		}
	    if (termi_tartaros=2){
			ui_xmod[rl]=-14;
			ui_ymod[rl]=13;
		}
	}
	if (display_type="melee_onehand"){
	    if (termi_tartaros=1){
			ui_xmod[rl]=-21;
			ui_ymod[rl]=18;
		}
	    if (termi_tartaros=2){
			ui_xmod[rl]=-18;
			ui_ymod[rl]=18;
		}
	}
	// Fix graphics for tremi/tartaros weapons
	if (display_type="power_fist"){
	    if (termi_tartaros>0){
			ui_arm[rl]=false;
			ui_above[rl]=true;
		}
	    if (termi_tartaros=1) and (argument0=1){
			ui_xmod[rl]=-3;
			ui_ymod[rl]=10;
			fix_left=8;
			ui_weapon[rl]=spr_weapon_powfist3;
			clear=true;
		}
	    if (termi_tartaros=1) and (argument0=2){
			ui_xmod[rl]=2;
			ui_ymod[rl]=10;
			fix_right=8;
			ui_weapon[rl]=spr_weapon_powfist3;
			clear=true;
		}
	    if (termi_tartaros=2) and (argument0=1){
			ui_xmod[rl]=0;
			ui_ymod[rl]=10;
			fix_left=8;
			ui_weapon[rl]=spr_weapon_powfist3;
			clear=true;
		}
	    if (termi_tartaros=2) and (argument0=2){
			ui_xmod[rl]=-1;
			ui_ymod[rl]=10;
			fix_right=8;
			ui_weapon[rl]=spr_weapon_powfist3;
			clear=true;
		}
	}
	if (display_type="lightning_claw"){
	    if (termi_tartaros=0) and (argument0=1){ui_xmod[rl]+=11;}
	    if (termi_tartaros=0) and (argument0=2){ui_xmod[rl]-=8;}
	    if (termi_tartaros>0){
			ui_arm[rl]=false;
			ui_above[rl]=true;
		}
	    if (termi_tartaros=1) and (argument0=1){
			ui_xmod[rl]=-3;
			ui_ymod[rl]=10;
			fix_left=8.1;
			ui_weapon[rl]=spr_weapon_lightning2;
			clear=true;
		}
	    if (termi_tartaros=1) and (argument0=2){
			ui_xmod[rl]=2;
			ui_ymod[rl]=10;
			fix_right=8.1;
			ui_weapon[rl]=spr_weapon_lightning2;
			clear=true;
		}
	    if (termi_tartaros=2) and (argument0=1){
			ui_xmod[rl]=0;
			ui_ymod[rl]=10;
			fix_left=8.1;
			ui_weapon[rl]=spr_weapon_lightning2;
			clear=true;
		}
	    if (termi_tartaros=2) and (argument0=2){
			ui_xmod[rl]=-1;
			ui_ymod[rl]=10;
			fix_right=8.1;
			ui_weapon[rl]=spr_weapon_lightning2;
			clear=true;
		}
	}
	if (string_count("Storm Shield",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_storm;
	    ui_arm[rl]=false;
		ui_above[rl]=true;
		ui_spec[rl]=false;
	}
	if (string_count("Boarding Shield",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_boarding;
	    ui_arm[rl]=false;
		ui_above[rl]=true;
		ui_spec[rl]=false;
	}
	// Flip for offhand
	if (argument0=2) /*and (termi_tartaros=0)*/ and (ui_xmod[rl]<0) and (display_type!="power_fist") and (display_type!="lightning_claw") then ui_xmod[rl]=ui_xmod[rl]*-1;

	// TODO Why is there an exit here? Do you know why? Is the code bellow a WIP? is the exit supposed to be inside something else?

	exit;

	// ** Ranged Weapon fixes **
	if (string_count("Bolt Pistol",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_boltpis;
	    ui_arm[rl]=true;
		ui_above[rl]=true;
		ui_spec[rl]=false;
	    if (termi_tartaros=1) then ui_xmod[rl]=-10;
		if (termi_tartaros=2) then ui_xmod[rl]=-16;
	}
	if (string_count("Infernus Pistol",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_inferno;
	    ui_arm[rl]=true;
		ui_above[rl]=true;
		ui_spec[rl]=false;
	    if (termi_tartaros=1) then ui_xmod[rl]=-10;if (termi_tartaros=2) then ui_xmod[rl]=-16;
	}
	if (string_count("Bolter",equiped_weapon)>0) and (string_count("Heavy",equiped_weapon)=0) and (string_count("Integrated",equiped_weapon)=0){
		ui_weapon[rl]=spr_weapon_bolter;
	    if (string_count("Storm",equiped_weapon)>0) then ui_weapon[rl]=spr_weapon_sbolter;
	    ui_arm[rl]=true;
		ui_above[rl]=true;
		ui_spec[rl]=false;
	    if (termi_tartaros=1) then ui_xmod[rl]=-10;
		if (termi_tartaros=2) then ui_xmod[rl]=-16;
	}
	if (string_count("Plasma Gun",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_plasg;
	    ui_arm[rl]=true;
		ui_above[rl]=true;
		ui_spec[rl]=false;
	    if (termi_tartaros=1) then ui_xmod[rl]=-10;
		if (termi_tartaros=2) then ui_xmod[rl]=-16;
	}
	if (string_count("Plasma Pistol",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_plasp;
	    ui_arm[rl]=true;
		ui_above[rl]=true;
		ui_spec[rl]=false;
	    if (termi_tartaros=1) then ui_xmod[rl]=-10;
		if (termi_tartaros=2){
			ui_xmod[rl]=-16;
			ui_ymod[rl]=17;
		}
	}
	if (string_count("Missile Launcher",equiped_weapon)>0) and (string_count("Whirl",equiped_weapon)=0){
		ui_weapon[rl]=spr_weapon_missile;
	    ui_arm[rl]=true;
		ui_above[rl]=true;
		ui_spec[rl]=false;
	    if (termi_tartaros=1) then ui_xmod[rl]=-10;
		if (termi_tartaros=2) then ui_xmod[rl]=-16;
	}
	if (string_count("Flamer",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_flamer;
	    ui_arm[rl]=true;
		ui_above[rl]=true;
		ui_spec[rl]=false;
	    if (termi_tartaros=1) then ui_xmod[rl]=-10;
		if (termi_tartaros=2) then ui_xmod[rl]=-16;
	}
	if (string_count("Meltagun",equiped_weapon)>0){ui_weapon[rl]=spr_weapon_melta;
	    ui_arm[rl]=true;
		ui_above[rl]=true;
		ui_spec[rl]=false;
	    if (termi_tartaros=1) then ui_xmod[rl]=-10;
		if (termi_tartaros=2) then ui_xmod[rl]=-16;
	}
	// All of the modifiers for terminator weapons (namely melee) need to be fixed
	if (string_count("Heavy Bolter",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_hbolt;
	    ui_arm[1]=false;
		ui_arm[2]=false;
	    ui_above[rl]=true;
		ui_spec[rl]=true;
		ui_twoh[rl]=true;
	    if (termi_tartaros=1){
			ui_xmod[rl]=-3;
			ui_ymod[rl]=12;
		}
		if (termi_tartaros=2){
			ui_xmod[rl]=-13;
			ui_ymod[rl]=14;
		}
	}
	if (string_count("Lascannon",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_lasca;
	    ui_arm[1]=false;
		ui_arm[2]=false;
	    ui_above[rl]=true;
		ui_spec[rl]=true;
		ui_twoh[rl]=true;
	    if (termi_tartaros=1){
			ui_xmod[rl]=-3;
			ui_ymod[rl]=12;
		}
		if (termi_tartaros=2){
			ui_xmod[rl]=-13;
			ui_ymod[rl]=14;
		}
	}
	if (string_count("Multi-Melta",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_mmelta;
	    ui_arm[1]=false;
		ui_arm[2]=false;
	    ui_above[rl]=true;
		ui_spec[rl]=true;
		ui_twoh[rl]=true;
	    if (termi_tartaros=1){
			ui_xmod[rl]=-3;
			ui_ymod[rl]=12;
		}if (termi_tartaros=2){
			ui_xmod[rl]=-13;
			ui_ymod[rl]=14;
		}
	}
	if (equiped_weapon="Assault Cannon"){
		ui_weapon[rl]=spr_weapon_assca;
	    ui_arm[rl]=false;
		ui_above[rl]=true;
		ui_spec[rl]=true;
	    if (termi_tartaros=1){
			ui_xmod[rl]=4;
			ui_ymod[rl]=-4;
		}
		if (termi_tartaros=2){
			ui_xmod[rl]=-4;
			ui_ymod[rl]=-4;
		}
	}
	if (string_count("Sniper Rifle",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_sniper;
	    ui_arm[rl]=false;
		ui_above[rl]=true;
		ui_spec[rl]=true;
	    if (termi_tartaros=1){
			ui_xmod[rl]=-3+11-13;
			ui_ymod[rl]=5-12+10;
		}if (termi_tartaros=2){
			ui_xmod[rl]=-12;
			ui_ymod[rl]=0;
		}
	}
	if (string_count("Stalker Pattern Bolter",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_stalker;
	    ui_arm[rl]=true;
		ui_above[rl]=true;
		ui_spec[rl]=false;
	    if (termi_tartaros=1) then ui_xmod[rl]=-10;
		if (termi_tartaros=2) then ui_xmod[rl]=-16;
	}
	if (string_count("Combiflamer",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_comflamer;
	    ui_arm[rl]=true;
		ui_above[rl]=true;
		ui_spec[rl]=false;
	    if (termi_tartaros=1) then ui_xmod[rl]=-10;
		if (termi_tartaros=2) then ui_xmod[rl]=-16;
	}
	// ** Melee weapons fixes **
	if (string_count("Company Standard",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_standard;
	    ui_arm[rl]=false;
		ui_above[rl]=true;
		ui_spec[rl]=true;
	    if (termi_tartaros=1){
			ui_xmod[rl]=-3+11-13;
			ui_ymod[rl]=5-12+10;
		}
		if (termi_tartaros=2){
			ui_xmod[rl]=-12;
			ui_ymod[rl]=0;
		}
	}
	if (string_count("Chainsword",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_chsword;
	    ui_arm[rl]=false;
		ui_above[rl]=true;
		ui_spec[rl]=true;
	    if (termi_tartaros=1){
			ui_xmod[rl]=-3+11-13;
			ui_ymod[rl]=5-12+10;
		}
		if (termi_tartaros=2){
			ui_xmod[rl]=-12;
			ui_ymod[rl]=0;
		}
	}
	if (string_count("Combat Knife",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_knife;
	    ui_arm[rl]=true;
		ui_above[rl]=true;
		ui_spec[rl]=true;
	    if (termi_tartaros=1){
			ui_xmod[rl]=-3+11-13;
			ui_ymod[rl]=5-12+10;
		}
		if (termi_tartaros=2){
			ui_xmod[rl]=-12;
			ui_ymod[rl]=0;
		}
	}
	if (string_count("Power Sword",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_powswo;
	    if (string_count("Master Crafted",equiped_weapon)>0){ui_weapon[rl]=spr_weapon_eldsword;}
	    ui_arm[rl]=false;
		ui_above[rl]=true;
		ui_spec[rl]=true;
	    if (termi_tartaros=1){
			ui_xmod[rl]=-3+11-13;
			ui_ymod[rl]=5-12+10;
		}
		if (termi_tartaros=2){
			ui_xmod[rl]=-12;
			ui_ymod[rl]=0;
		}
	}
	if (string_count("Eviscerator",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_evisc;
	    ui_arm[rl]=false;
		ui_above[rl]=true;
		ui_spec[rl]=true;
	    if (termi_tartaros=1){
			ui_xmod[rl]=-3+11-13;
			ui_ymod[rl]=5-12+10;
		}
		if (termi_tartaros=2){
			ui_xmod[rl]=-12;
			ui_ymod[rl]=0;
		}
	}
	if (string_count("Thunder Hammer",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_thhammer;
	    ui_arm[rl]=false;
		ui_above[rl]=true;
		ui_spec[rl]=true;
	    if (termi_tartaros=1){
			ui_xmod[rl]=-3+11-13;
			ui_ymod[rl]=5-12+10;
		}
		if (termi_tartaros=2){
			ui_xmod[rl]=-12;
			ui_ymod[rl]=0;
		}
	}
	if (string_count("Relic Blade",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_relbla;
	    ui_arm[rl]=false;
		ui_above[rl]=true;
		ui_spec[rl]=true;
	    if (termi_tartaros=1){
			ui_xmod[rl]=-3+11-13;
			ui_ymod[rl]=5-12+10;
		}
		if (termi_tartaros=2){
			ui_xmod[rl]=-12;
			ui_ymod[rl]=0;
		}
	}
	if (string_count("Power Axe",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_powaxe;
	    ui_arm[rl]=false;
		ui_above[rl]=true;
		ui_spec[rl]=true;
	    if (termi_tartaros=1){
			ui_xmod[rl]=-3+11-13;
			ui_ymod[rl]=5-12+10;
		}
		if (termi_tartaros=2){
			ui_xmod[rl]=-12;
			ui_ymod[rl]=0;
		}
	}
	if (string_count("Chainaxe",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_chaxe;
	    ui_arm[rl]=false;
		ui_above[rl]=true;
		ui_spec[rl]=true;
	    if (termi_tartaros=1){
		ui_xmod[rl]=-3+11-13;
		ui_ymod[rl]=5-12+10;
		}
		if (termi_tartaros=2){
			ui_xmod[rl]=-12;
			ui_ymod[rl]=0;
		}
	}
	if (string_count("Force Weapon",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_force;
	    ui_arm[rl]=false;
		ui_above[rl]=true;
		ui_spec[rl]=true;
	    if (termi_tartaros=1){
			ui_xmod[rl]=-7+11-13;
			ui_ymod[rl]=3-12+10;
		}
		if (termi_tartaros=2){
			ui_xmod[rl]=-22;
			ui_ymod[rl]=-2;
		}
	}

	clear=false;
	if (string_count("Power Fist",equiped_weapon)>0) and (string_count("DUB",equiped_weapon)=0){
		ui_weapon[rl]=spr_weapon_powfist;
	    ui_arm[rl]=true;
		ui_above[rl]=true;
		ui_spec[rl]=true;
	    // New powerfist
	    if (termi_tartaros=1) and (argument0=1){
			ui_xmod[rl]=10;
			ui_ymod[rl]=0;
			fix_left=2;
			ui_weapon[rl]=spr_weapon_powfist3;
			clear=true;
		}
	    if (termi_tartaros=1) and (argument0=2){
			ui_xmod[rl]=-10;
			ui_ymod[rl]=0;
			fix_right=2;
			ui_weapon[rl]=spr_weapon_powfist3;
			clear=true;
		}
	    // if (termi_tartaros=2){ui_xmod[rl]=-31;ui_ymod[rl]=0;}
	    if (termi_tartaros=2){
			ui_weapon[rl]=spr_weapon_powfist2;
			ui_xmod[rl]=0;
			ui_ymod[rl]=0;
		}
    
	}
	if (termi_tartaros=1){
	    if (argument0=1) and (ui_arm[1]=false) and (fix_left=0) then fix_left=1;
	    if (argument0=2) and (ui_arm[2]=false) and (fix_right=0) then fix_right=1;
	}
	/*if (string_count("Power Fist",equiped_weapon)>0) and (string_count("DUB",equiped_weapon)>0){
	    ui_weapon[1]=spr_weapon_powfist;ui_weapon[2]=spr_weapon_powfist;
	    ui_arm[1]=true;ui_arm[2]=true;
	    ui_above[1]=true;ui_above[2]=true;
	    ui_spec[1]=true;ui_spec[2]=true;
	    ui_twoh[1]=true;ui_force_both=true;
	    ui_xmod[1]=0;ui_ymod[1]=0;
	    ui_xmod[2]=0;ui_ymod[2]=0;
	    if (termi_tartaros=1){ui_xmod[1]=-4;ui_ymod[1]=0;ui_xmod[2]=0;ui_ymod[2]=0;}
	    if (termi_tartaros=2){ui_weapon[1]=spr_weapon_powfist2;ui_weapon[2]=spr_weapon_powfist2;}
	    // if (termi_tartaros=2){ui_xmod[1]=-31;ui_ymod[1]=0;ui_xmod[2]=26;ui_ymod[2]=0;}
	    exit;
	}*/

	//** Shields **
	if (string_count("Storm Shield",equiped_weapon)>0){
		ui_weapon[rl]=spr_weapon_storm;
	    ui_arm[rl]=false;
		ui_above[rl]=true;
		ui_spec[rl]=false;
	}
		if (string_count("Boarding Shield",equiped_weapon)>0){
			ui_weapon[rl]=spr_weapon_boarding;
	    ui_arm[rl]=false;
		ui_above[rl]=true;
		ui_spec[rl]=false;
	}

	if (termi_tartaros=1) and (((argument0=1) and (fix_left=0)) or ((argument0=2) and (fix_right=0))) and (clear=false){
		ui_xmod[1]-=15;
		ui_ymod[1]+=10;
	}
	// if (termi_tartaros=1) and (((argument0=1) and (fix_left=0)) or ((argument0=2) and (fix_right=0))) and (clear=false){ui_xmod[1]-=30;ui_ymod[1]+=20;}

	if (argument0=2) and (termi_tartaros=0) and (ui_xmod[rl]<0) then ui_xmod[rl]=ui_xmod[rl]*-1;
	// if (rl=2) and (ui_xmod[rl]!=0) then ui_xmod[rl]=ui_xmod[rl]*-1;
}
