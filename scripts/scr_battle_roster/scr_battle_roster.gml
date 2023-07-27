function scr_battle_roster(_battle_loci, _loci_specific, _is_planet) {

	// argument 0 : planet or ship name
	// argument 1 : world number (wid)
	// argument 2 : is it a planet?  boolean

	// Determines who all will be present for the battle



	// show_message("Container:"+string(_battle_loci)+", number:"+string(_loci_specific)+", planet?:"+string(_is_planet));


	var fiy, secc, stop,okay,sofar, man_limit_reached,man_size_count;
	fiy=_battle_loci;
	secc=_loci_specific;
	stop=0;okay=0;sofar=0;man_limit_reached=false;man_size_count=0;


	// Formation here




	obj_controller.bat_devastator_column=obj_controller.bat_deva_for[obj_ncombat.formation_set];
	obj_controller.bat_assault_column=obj_controller.bat_assa_for[obj_ncombat.formation_set];
	obj_controller.bat_tactical_column=obj_controller.bat_tact_for[obj_ncombat.formation_set];
	obj_controller.bat_veteran_column=obj_controller.bat_vete_for[obj_ncombat.formation_set];
	obj_controller.bat_hire_column=obj_controller.bat_hire_for[obj_ncombat.formation_set];
	obj_controller.bat_librarian_column=obj_controller.bat_libr_for[obj_ncombat.formation_set];
	obj_controller.bat_command_column=obj_controller.bat_comm_for[obj_ncombat.formation_set];
	obj_controller.bat_techmarine_column=obj_controller.bat_tech_for[obj_ncombat.formation_set];
	obj_controller.bat_terminator_column=obj_controller.bat_term_for[obj_ncombat.formation_set];
	obj_controller.bat_honor_column=obj_controller.bat_hono_for[obj_ncombat.formation_set];
	obj_controller.bat_dreadnought_column=obj_controller.bat_drea_for[obj_ncombat.formation_set];
	obj_controller.bat_rhino_column=obj_controller.bat_rhin_for[obj_ncombat.formation_set];
	obj_controller.bat_predator_column=obj_controller.bat_pred_for[obj_ncombat.formation_set];
	obj_controller.bat_landraider_column=obj_controller.bat_land_for[obj_ncombat.formation_set];
	obj_controller.bat_scout_column=obj_controller.bat_scou_for[obj_ncombat.formation_set];




	// if (_is_planet=true){
	    var company, v, meat;
	    company=-1;v=0;meat=false;

	    instance_activate_object(obj_pnunit);

	    repeat(11){
			if (man_limit_reached == true){break;}
	        company+=1;v=0;okay=0;
	        repeat(300){
				if (man_limit_reached == true){break;}
				v+=1;

	            if (stop=0){
	                if (!instance_exists(obj_drop_select)){// Only when attacked
	                    if (_is_planet=true) and (obj_ini.loc[company,v]=fiy) and (obj_ini.wid[company,v]=secc) and (obj_ini.hp[company,v]>0) and (obj_ini.god[company,v]<10) then okay=1;
	                    if (_is_planet=false) and (obj_ini.lid[company,v]=_loci_specific) and (_loci_specific=_loci_specific) and (obj_ini.hp[company,v]>0) and (obj_ini.god[company,v]<10) then okay=1;
	                }
	                if (instance_exists(obj_drop_select)){
	                    if (obj_drop_select.attack=1){
	                        if (_is_planet=true) and (obj_ini.loc[company,v]=fiy) and (obj_ini.wid[company,v]=secc) and (obj_ini.hp[company,v]>0) and (obj_ini.god[company,v]<10) then okay=1;
	                        if (_is_planet=false) and (obj_ini.lid[company,v]=_loci_specific) and (_loci_specific=_loci_specific) and (obj_ini.hp[company,v]>0) and (obj_ini.god[company,v]<10) then okay=1;
	                    }
	                }

	                if (string_count("spyrer",obj_ncombat.battle_special)>0) or (obj_ncombat.battle_special="space_hulk") or (string_count("chaos_meeting",obj_ncombat.battle_special)>0){
	                    if (string_count("Dread",obj_ini.armor[company,v])>0) then okay=-1;
	                }
	                if (string_count("spyrer",obj_ncombat.battle_special)>0){
	                    if (okay=1) and (sofar>2) then okay = -1;
	                }

	                /*if (!instance_exists(obj_drop_select)){// Only when attacked
	                    if (_is_planet=true) and (obj_ncombat.local_forces=1){
	                        var world_name,p_num;world_name="";p_num=obj_controller.selecting_planet;
	                        if (instance_exists(obj_drop_select)){world_name=obj_drop_select.p_target.name;}

	                        if (obj_ini.loc[company,v]=world_name) and (obj_ini.wid[company,v]=p_num) then okay=2;
	                    }
	                }*/

	                if (okay<= -1) then obj_ncombat.fighting[company,v]=0;


	                if (instance_exists(obj_drop_select)){
	                    if (obj_drop_select.fighting[company,v]=1) and (obj_ini.lid[company,v]=_loci_specific) and (okay!=-1) then okay=1;
	                    if (obj_drop_select.fighting[company,v]=0) then okay=0;
	                }
	                if (!instance_exists(obj_drop_select)) and (instance_exists(obj_temp_meeting)){meat=true;
	                    if (company=0) and (v<=obj_temp_meeting.dudes){
	                        if (obj_temp_meeting.present[v]=1){
	                            okay=1;
	                        }
	                    }
	                    if (company>0) then okay=0;
	                    if (v>obj_temp_meeting.dudes) then okay=0;
	                }
					if (instance_exists(obj_temp4)){
						if  (obj_ini.wid[company,v]==_loci_specific) and  (obj_ini.loc[company,v]==_battle_loci) and (obj_ini.hp[company,v]>0){
							okay=1;
						}else {okay=0;}
					}


	                if (okay>=1){
						var man_size = 1;
						show_debug_message("marine {0},{1}, {2},{3}", company, v, obj_ini.name[company, v],obj_ini.loc[company, v])
	                    var cooh,va;
	                    cooh=0;va=0;

	                    if (meat=false){cooh=company;va=v;}
	                    if (meat=true){if (v<=obj_temp_meeting.dudes){
	                        cooh=obj_temp_meeting.company[v];
	                        va=obj_temp_meeting.ide[v];
	                    }}

	                    var col,moov,targ;col=0;targ=0;moov=0;

	                    if (obj_ncombat.battle_special="space_hulk") then obj_ncombat.player_starting_dudes+=1;

	                    if (obj_ini.role[cooh,va]=obj_ini.role[100,12]){col=obj_controller.bat_scout_column;obj_ncombat.scouts+=1;}
	                    if (obj_ini.role[cooh,va]=obj_ini.role[100,8]){col=obj_controller.bat_tactical_column;obj_ncombat.tacticals+=1;}
	                    if (obj_ini.role[cooh,va]=obj_ini.role[100,3]){col=obj_controller.bat_veteran_column;obj_ncombat.veterans+=1;}
	                    if (obj_ini.role[cooh,va]=obj_ini.role[100,9]){col=obj_controller.bat_devastator_column;obj_ncombat.devastators+=1;}
	                    if (obj_ini.role[cooh,va]=obj_ini.role[100,10]){col=obj_controller.bat_assault_column;obj_ncombat.assaults+=1;}
	                    if (obj_ini.role[cooh,va]=obj_ini.role[100,17]){col=obj_controller.bat_librarian_column;obj_ncombat.librarians+=1;moov=1;}
	                    if (obj_ini.role[cooh,va]=string(obj_ini.role[100,17])+" Aspirant"){col=obj_controller.bat_librarian_column;obj_ncombat.librarians+=1;moov=1;}

	                    if (obj_ini.role[cooh,va]="Codiciery"){col=obj_controller.bat_librarian_column;obj_ncombat.librarians+=1;moov=1;}
	                    if (obj_ini.role[cooh,va]="Epistolary"){col=obj_controller.bat_librarian_column;obj_ncombat.librarians+=1;moov=1;}
	                    if (obj_ini.role[cooh,va]="Lexicanum"){col=obj_controller.bat_librarian_column;obj_ncombat.librarians+=1;moov=1;}
	                    if (obj_ini.role[cooh,va]=obj_ini.role[100,16]){col=obj_controller.bat_techmarine_column;obj_ncombat.techmarines+=1;moov=2;}

	                    if (obj_ini.role[cooh,va]=obj_ini.role[100,2]){col=obj_controller.bat_honor_column;obj_ncombat.honors+=1;}
	                    if (obj_ini.role[cooh,va]=obj_ini.role[100,6]){col=obj_controller.bat_dreadnought_column;obj_ncombat.dreadnoughts+=1;}
	                    if (obj_ini.role[cooh,va]="Venerable "+string(obj_ini.role[100,6])){col=obj_controller.bat_dreadnought_column;obj_ncombat.dreadnoughts+=1;}
	                    if (obj_ini.role[cooh,va]=obj_ini.role[100,4]){col=obj_controller.bat_terminator_column;obj_ncombat.terminators+=1;}

	                    if (moov>0){
	                        if ((moov=1) and (obj_controller.command_set[8]=1)) or ((moov=2) and (obj_controller.command_set[9]=1)){
	                            if (company>=2) then col=obj_controller.bat_tactical_column;
	                            if (company=10) then col=obj_controller.bat_scout_column;
	                            if (obj_ini.mobi[cooh,va]="Jump Pack"){ col=obj_controller.bat_assault_column;}
	                        }
	                    }

	                    if (obj_ini.role[cooh,va]=obj_ini.role[100,15]) or (obj_ini.role[cooh,va]=obj_ini.role[100,14]) or (string_count("Aspirant",obj_ini.role[cooh,va])>0){
	                        if (obj_ini.role[cooh,va]=string(obj_ini.role[100,15])+" Aspirant"){col=obj_controller.bat_tactical_column;obj_ncombat.tacticals+=1;}
	                        if (obj_ini.role[cooh,va]=string(obj_ini.role[100,14])+" Aspirant"){col=obj_controller.bat_tactical_column;obj_ncombat.tacticals+=1;}

	                        if (obj_ini.role[cooh,va]=obj_ini.role[100,15]) then obj_ncombat.apothecaries+=1;
	                        if (obj_ini.role[cooh,va]=obj_ini.role[100,14]){obj_ncombat.chaplains+=1;if (obj_ncombat.big_mofo>5) then obj_ncombat.big_mofo=5;}

	                        col=obj_controller.bat_tactical_column;
	                        if (obj_ini.armor[cooh,va]="Terminator Armor")or (obj_ini.armor[cooh,va]="Tartaros Armor"){col=obj_controller.bat_terminator_column;}
	                        if (company=10) then col=obj_controller.bat_scout_column;
	                    }

	                    if (obj_ini.role[cooh,va]=obj_ini.role[100,5]) or (obj_ini.role[cooh,va]="Standard Bearer") or (obj_ini.role[cooh,va]=obj_ini.role[100,7]){
	                        if (obj_ini.role[cooh,va]=obj_ini.role[100,5]){obj_ncombat.captains+=1;if (obj_ncombat.big_mofo>5) then obj_ncombat.big_mofo=5;}
	                        if (obj_ini.role[cooh,va]="Standard Bearer") then obj_ncombat.standard_bearers+=1;

	                        if (company=1){
	                            col=obj_controller.bat_veteran_column;
	                            if (obj_ini.armor[cooh,va]="Terminator Armor") then col=obj_controller.bat_terminator_column;
	                            if (obj_ini.armor[cooh,va]="Tartaros Armor") then col=obj_controller.bat_terminator_column;
	                        }
	                        if (company>=2) then col=obj_controller.bat_tactical_column;
	                        if (company=10) then col=obj_controller.bat_scout_column;
	                        if (obj_ini.mobi[cooh,va]="Jump Pack") then col=obj_controller.bat_assault_column;
	                    }

	                    if (obj_ini.role[cooh,va]="Chapter Master"){
	                        col=obj_controller.bat_command_column;obj_ncombat.important_dudes+=1;obj_ncombat.big_mofo=1;
	                        if (string_count("0",obj_ini.spe[cooh,va])>0) then obj_ncombat.chapter_master_psyker=1;
	                        else{obj_ncombat.chapter_master_psyker=0;}
	                    }
	                    if (obj_ini.role[cooh,va]="Forge Master"){col=obj_controller.bat_command_column;obj_ncombat.important_dudes+=1;}
	                    if (obj_ini.role[cooh,va]="Master of Sanctity"){col=obj_controller.bat_command_column;obj_ncombat.important_dudes+=1;if (obj_ncombat.big_mofo>2) then obj_ncombat.big_mofo=2;}
	                    if (obj_ini.role[cooh,va]="Master of the Apothecarion"){col=obj_controller.bat_command_column;obj_ncombat.important_dudes+=1;}
	                    if (obj_ini.role[cooh,va]="Chief "+string(obj_ini.role[100,17])){col=obj_controller.bat_command_column;obj_ncombat.important_dudes+=1;if (obj_ncombat.big_mofo>3) then obj_ncombat.big_mofo=3;}

	                    if (col=0) then col=obj_controller.bat_hire_column;

	                    targ=instance_nearest(col*10,240,obj_pnunit);
	                    targ.men+=1;
	                    targ.marine_co[targ.men]=company;
	                    targ.marine_id[targ.men]=v;
	                    targ.marine_type[targ.men]=obj_ini.role[cooh,va];
	                    targ.marine_wep1[targ.men]=obj_ini.wep1[cooh,va];
	                    targ.marine_wep2[targ.men]=obj_ini.wep2[cooh,va];
	                    targ.marine_armor[targ.men]=obj_ini.armor[cooh,va];
	                    targ.marine_gear[targ.men]=obj_ini.gear[cooh,va];
	                    targ.marine_mobi[targ.men]=obj_ini.mobi[cooh,va];
	                    targ.marine_hp[targ.men]=obj_ini.hp[cooh,va];
	                    targ.marine_exp[targ.men]=obj_ini.experience[cooh,va];
	                    targ.marine_powers[targ.men]=obj_ini.spe[cooh,va];
	                    if (okay=2) then targ.marine_local[targ.men]=1;


	                    if (obj_ini.role[cooh,va]="Death Company"){// Ahahahahah
	                        var really;really=false;
	                        if (string_count("Dreadnought",targ.marine_armor[targ.men])>0) then really=true;
	                        if (really=false) then obj_ncombat.thirsty+=1;if (really=true) then obj_ncombat.really_thirsty+=1;
	                        col=max(obj_controller.bat_assault_column,obj_controller.bat_command_column,obj_controller.bat_honor_column,obj_controller.bat_dreadnought_column,obj_controller.bat_veteran_column);
	                    }

	                    if (targ.marine_armor[targ.men]="Scout Armor") then targ.marine_ac[targ.men]=8;
	                    if (targ.marine_armor[targ.men]="MK3 Iron Armor"){targ.marine_ac[targ.men]=20;targ.marine_ranged[targ.men]-=0.1;}
	                    if (targ.marine_armor[targ.men]="MK4 Maximus"){targ.marine_ac[targ.men]=19;targ.marine_ranged[targ.men]+=0.05;targ.marine_attack[targ.men]+=0.05;}
	                    if (targ.marine_armor[targ.men]="MK6 Corvus"){targ.marine_ac[targ.men]=18;targ.marine_ranged[targ.men]+=0.1;}
	                    if (targ.marine_armor[targ.men]="MK7 Aquila") then targ.marine_ac[targ.men]=18;
	                    if (targ.marine_armor[targ.men]="MK8 Errant") then targ.marine_ac[targ.men]=19;
	                    if (targ.marine_armor[targ.men]="Power Armor") then targ.marine_ac[targ.men]=19;
	                    if (targ.marine_armor[targ.men]="Artificer Armor"){targ.marine_ac[targ.men]=35;targ.marine_attack[targ.men]+=0.1;}
	                    if (targ.marine_armor[targ.men]="Terminator Armor"){targ.marine_ac[targ.men]=40;targ.marine_ranged[targ.men]-=0.1;targ.marine_attack[targ.men]+=0.2;man_size = 2;}
	                    if (targ.marine_armor[targ.men]="Tartaros"){targ.marine_ac[targ.men]=44;targ.marine_ranged[targ.men]-=0.05;targ.marine_attack[targ.men]+=0.2;man_size = 2;}
	                    if (targ.marine_armor[targ.men]="Dreadnought") then targ.marine_ac[targ.men]=40;man_size = 10;
	                    if (targ.marine_armor[targ.men]="Ork Armor") then targ.marine_ac[targ.men]=15;

	                    if (obj_ini.role[cooh,va]="Chapter Master"){
	                        if (obj_ini.adv[1]="Paragon") or (obj_ini.adv[2]="Paragon") or (obj_ini.adv[3]="Paragon") or (obj_ini.adv[4]="Paragon"){
	                            targ.marine_attack[targ.men]+=0.2;targ.marine_ranged[targ.men]+=0.2;
	                        }
	                    }


	                    // marine_attack[i]=1;
	                    // marine_ranged[i]=1;
	                    // marine_defense[i]=1;

	                    if (targ.marine_wep1[targ.men]="Boarding Shield") then targ.marine_ac[targ.men]+=4;
	                    if (targ.marine_wep2[targ.men]="Boarding Shield") then targ.marine_ac[targ.men]+=4;
	                    if (targ.marine_wep1[targ.men]="Storm Shield") then targ.marine_ac[targ.men]+=8;
	                    if (targ.marine_wep2[targ.men]="Storm Shield") then targ.marine_ac[targ.men]+=8;


	                    if (string_count("&",targ.marine_armor[targ.men])>0){
	                        // Artifact armor
	                        if (string_count("Power",targ.marine_armor[targ.men])>0) then targ.marine_ac[targ.men]=30;
	                        if (string_count("Artificer",targ.marine_armor[targ.men])>0){targ.marine_ac[targ.men]=37;targ.marine_attack[targ.men]+=0.1;}
	                        if (string_count("Terminator",targ.marine_armor[targ.men])>0){targ.marine_ac[targ.men]=46;targ.marine_ranged[targ.men]-=0.1;targ.marine_attack[targ.men]+=0.2;}
	                        if (string_count("Dreadnought",targ.marine_armor[targ.men])>0) then targ.marine_ac[targ.men]=44;
	                    }
	                    if (targ.marine_armor[targ.men]!=""){// STC Bonuses
	                        if (obj_controller.stc_bonus[1]=5){if (targ.marine_ac[targ.men]>=40) then targ.marine_ac[targ.men]+=2;if (targ.marine_ac[targ.men]<40) then targ.marine_ac[targ.men]+=1;}
	                        if (obj_controller.stc_bonus[2]=3){if (targ.marine_ac[targ.men]>=40) then targ.marine_ac[targ.men]+=2;if (targ.marine_ac[targ.men]<40) then targ.marine_ac[targ.men]+=1;}
	                    }

	                    if (obj_ini.role[cooh,va]=obj_ini.role[100,6]) or (obj_ini.role[cooh,va]="Venerable "+string(obj_ini.role[100,6])){
	                        targ.marine_hp[targ.men]=targ.marine_hp[targ.men]*2;targ.dreads+=1;
	                    }
	                    if (obj_ini.mobi[cooh,va]="Bike"){ targ.marine_hp[targ.men]+=25;man_Size=3;}
					 if (obj_ini.mobi[cooh,va]="Jump Pack"){man_Size=2;}
	                    if (obj_ini.wep1[cooh,va]="Boarding Shield") then targ.marine_hp[targ.men]+=20;
	                    if (obj_ini.wep2[cooh,va]="Boarding Shield") then targ.marine_hp[targ.men]+=20;
	                    if (obj_ini.wep1[cooh,va]="Storm Shield") then targ.marine_hp[targ.men]+=30;
	                    if (obj_ini.wep2[cooh,va]="Storm Shield") then targ.marine_hp[targ.men]+=30;
	                    if (obj_ini.wep2[cooh,va]="Iron Halo") then targ.marine_hp[targ.men]+=20;
						
						//evaluates if there is a limit on the size of men that can be in a battle and only adds the allowable number to roster
						if (obj_ncombat.man_size_limit == 0){
							obj_ncombat.fighting[cooh,va]=1;sofar+=1;
						} else {
							if (man_size_count + man_size <= obj_ncombat.man_size_limit){
								obj_ncombat.fighting[cooh,va]=1;sofar+=1;
								man_size_count += man_size;
								if (man_size_count == obj_ncombat.man_size_limit){
									man_limit_reached = true;
								}
							}
						}
	                }

                
	                if (v<=100) and (string_count("spyrer",obj_ncombat.battle_special)=0) and (company<=10) and (meat=false){
	                    var vokay;vokay=0;

	                    if (obj_ini.veh_race[company,v]!=0) and (obj_ini.veh_loc[company,v]=fiy) and (obj_ini.veh_wid[company,v]=secc) then vokay=1;

	                    if (_is_planet=true) and (obj_ncombat.local_forces=1){
	                        var world_name,p_num;world_name="";p_num=obj_controller.selecting_planet;
	                        if (instance_exists(obj_drop_select)){world_name=obj_drop_select.p_target.name;}
	                        if (obj_ini.veh_race[company,v]!=0) and (obj_ini.veh_loc[company,v]=world_name) and (obj_ini.wid[company,v]=p_num) then vokay=2;
	                    }
	                    if (_is_planet=false) and (obj_ini.veh_lid[company,v]=_loci_specific) and (_loci_specific=_loci_specific) and (obj_ini.veh_hp[company,v]>0) then vokay=1;

	                    if (instance_exists(obj_drop_select)){
	                        if (obj_drop_select.attack=0) then vokay=0;
	                    }


	                    // if (obj_ncombat.veh_fighting[company,v]=1) then vokay=2;// Fuck on me, AI

	                    if (vokay>=1) and (obj_ncombat.dropping=0){
	                        obj_ncombat.veh_fighting[company,v]=1;

	                        var col,targ;col=1;targ=0;

	                        if (obj_ini.veh_role[company,v]="Rhino"){col=obj_controller.bat_rhino_column;obj_ncombat.rhinos+=1;}
	                        if (obj_ini.veh_role[company,v]="Predator"){col=obj_controller.bat_predator_column;obj_ncombat.predators+=1;}
	                        if (obj_ini.veh_role[company,v]="Land Raider"){col=obj_controller.bat_landraider_column;obj_ncombat.land_raiders+=1;}
	                        if (obj_ini.veh_role[company,v]="Whirlwind"){col=1;obj_ncombat.whirlwinds+=1;}

	                        targ=instance_nearest(col*10,room_height/2,obj_pnunit);
	                        targ.veh+=1;
	                        targ.veh_co[targ.veh]=company;
	                        targ.veh_id[targ.veh]=v;
	                        targ.veh_type[targ.veh]=obj_ini.veh_role[company,v];
	                        targ.veh_wep1[targ.veh]=obj_ini.veh_wep1[company,v];
	                        targ.veh_wep2[targ.veh]=obj_ini.veh_wep2[company,v];
	                        targ.veh_wep3[targ.veh]=obj_ini.veh_wep3[company,v];
	                        targ.veh_upgrade[targ.veh]=obj_ini.veh_upgrade[company,v];
	                        targ.veh_acc[targ.veh]=obj_ini.veh_acc[company,v];
	                        if (vokay=2) then targ.veh_local[targ.veh]=1;

	                        if (obj_ini.veh_role[company,v]="Rhino") or (obj_ini.veh_role[company,v]="Whirlwind") or (obj_ini.veh_role[company,v]="Land Speeder"){
	                            targ.veh_hp[targ.veh]=obj_ini.veh_hp[company,v]*2;
	                            targ.veh_hp_multiplier[targ.veh]=2;
	                            targ.veh_ac[targ.veh]=20;
	                        }
	                        if (obj_ini.veh_role[company,v]="Predator"){
	                            targ.veh_hp[targ.veh]=obj_ini.veh_hp[company,v]*3;
	                            targ.veh_hp_multiplier[targ.veh]=3;
	                            targ.veh_ac[targ.veh]=30;
	                        }
	                        if (obj_ini.veh_role[company,v]="Land Raider"){
	                            targ.veh_hp[targ.veh]=obj_ini.veh_hp[company,v]*4;
	                            targ.veh_hp_multiplier[targ.veh]=4;
	                            targ.veh_ac[targ.veh]=40;
	                        }

	                        // STC Bonuses
	                        if (targ.veh_type[targ.veh]!=""){
	                            if (obj_controller.stc_bonus[3]=1){targ.veh_hp[targ.veh]=round(targ.veh_hp[targ.veh]*1.1);targ.veh_hp_multiplier[targ.veh]=targ.veh_hp_multiplier[targ.veh]*1.1;}
	                            if (obj_controller.stc_bonus[3]=2){targ.veh_ranged[targ.veh]=targ.veh_ranged[targ.veh]*1.05;}
	                            if (obj_controller.stc_bonus[3]=5){targ.veh_ac[targ.veh]=round(targ.veh_ac[targ.veh]*1.1);}
	                            if (obj_controller.stc_bonus[4]=1){targ.veh_hp[targ.veh]=round(targ.veh_hp[targ.veh]*1.1);targ.veh_hp_multiplier[targ.veh]=targ.veh_hp_multiplier[targ.veh]*1.1;}
	                            if (obj_controller.stc_bonus[4]=2){targ.veh_ac[targ.veh]=round(targ.veh_ac[targ.veh]*1.1);}
	                        }


	                    }


	                }


	            }

	        }
	    }

	// }


}
