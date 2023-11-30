function scr_load(argument0, argument1) {
	
	function load_marine_struct(company, marine){
			var marStruct = ini_read_string("Mar","Struct"+string(company)+"."+string(marine),"");
			if (marStruct != ""){
				marStruct = json_parse(base64_decode(marStruct));
				obj_ini.TTRPG[company, marine] = new TTRPG_stats("chapter", company, marine, "blank");
				obj_ini.TTRPG[company, marine].load_json_data(marStruct);
			} else {obj_ini.TTRPG[company, marine] = new TTRPG_stats("chapter", company, marine,"blank");}		
	};
	var rang,i,g,stars,pfleets,efleets;
	rang=0;i=0;g=0;stars=0;pfleets=0;efleets=0;



	if (argument0=1) or (argument0=0){
		
		debugl("Loading slot "+string(argument1));
		var save_file_name = "save"+string(argument1)+".ini";

		if(file_exists("tsave.ini"))
		{
			// file_copy() will fail if destination file already exists
			file_delete("tsave.ini");
		}

		if(file_exists(save_file_name))
		{
	    	file_copy(save_file_name,"tsave.ini");
		}
		else
		{
			debugl("Could not load save game " + save_file_name + ", file does not exist.");
			game_restart();
		}
	    
		// TODO temporary disabled. Will be reenabled during ironman/autosave feature task
		//file_decrypt("tsave.ini","p");
	    ini_open("tsave.ini");

	    // Global variables
	    global.chapter_name=ini_read_string("Save","chapter_name","Error"); //
	    obj_ini.sector_name=ini_read_string("Save","sector_name","Error"); //

		// TODO make it either throw error (if version is wrong) or try to upgrade the saved game data and version
	    global.version=ini_read_string("Save","version",0);
	    global.game_seed=ini_read_real("Save","game_seed",0);
	    obj_ini.use_custom_icon=ini_read_real("Save","use_custom_icon",0);

	    obj_controller.play_time=ini_read_real("Save","play_time",0);

	    obj_ini.progenitor=ini_read_real("Save","founding",0);
	    // global.founding_secret=ini_read_string("Save","founding_secret","Error");
	    global.custom=ini_read_real("Save","custom",1);
	    stars=ini_read_real("Save","stars",0);
	    // pfleets=ini_read_real("Save","p_fleets",0);
	    // efleets=ini_read_real("Save","en_fleets",0);
	    g=ini_read_real("Save","sod",0);
	    random_set_seed(g);g=0;
	    var corrupt;corrupt=1;
	    corrupt=ini_read_real("Save","corrupt",1);

	    if (corrupt=1){
	        game_restart();
	    }

	    // obj_controller variables here
	    obj_controller.load_game=argument1;
	    global.cheat_req = ini_read_real("boolean", "cheat_req", 0);
	    global.cheat_gene = ini_read_real("boolean", "cheat_gene", 0);
	    global.cheat_debug = ini_read_real("boolean", "cheat_debug", 0);
	    global.cheat_disp = ini_read_real("boolean", "cheat_disp", 0);
	    obj_controller.cheatyface=ini_read_real("Controller","cheatyface",0);
	    obj_controller.x=ini_read_real("Controller","x",obj_controller.x);
	    obj_controller.y=ini_read_real("Controller","y",obj_controller.y);
	    obj_controller.was_zoomed=ini_read_real("Controller","was_zoomed",0);
	    obj_controller.zoomed=ini_read_real("Controller","zoomed",0);
	    obj_controller.chaos_rating=ini_read_real("Controller","chaos_rating",0);
	    obj_controller.fleet_type=ini_read_string("Controller","fleet_type",""); //
	    obj_ini.fleet_type=round(ini_read_real("Controller","ifleet_type",0));
	    obj_controller.homeworld_rule=ini_read_real("Controller","home_rule",1);

	    obj_controller.star_names=ini_read_string("Controller","star_names","Error"); //
	    obj_controller.craftworld=ini_read_real("Controller","craftworld",0);

	    obj_controller.turn=ini_read_real("Controller","turn",0);
	    obj_controller.last_event=ini_read_real("Controller","last_event",0);
	    obj_controller.last_mission=ini_read_real("Controller","last_mission",0);
	    obj_controller.last_world_inspection=ini_read_real("Controller","last_world_inspection",0);
	    obj_controller.last_fleet_inspection=ini_read_real("Controller","last_fleet_inspection",0);
	    obj_controller.chaos_turn=ini_read_real("Controller","chaos_turn",0);
	    obj_controller.chaos_fleets=ini_read_real("Controller","chaos_fleets",0);
	    obj_controller.tau_fleets=ini_read_real("Controller","tau_fleets",0);
	    obj_controller.tau_stars=ini_read_real("Controller","tau_stars",0);
	    obj_controller.tau_messenger=ini_read_real("Controller","tau_messenger",0);
	    obj_controller.fleet_all=ini_read_real("Controller","fleet_all",0);
	    obj_ini.tolerant=ini_read_real("Controller","tolerant",0);
	    obj_ini.stability=ini_read_real("Controller","stability",5);
	    obj_ini.purity=ini_read_real("Controller","purity",5);
	    obj_controller.tolerant=ini_read_real("Controller","tolerant",0);
	    obj_controller.unload=ini_read_real("Controller","unload",0);
	    obj_controller.diplomacy=0;
	    obj_controller.trading=0;
	    obj_controller.audience=0;
	    obj_controller.force_goodbye=0;
	    obj_controller.combat=0;
	    obj_controller.new_vehicles=ini_read_real("Controller","new_vehicles",0);
	    obj_controller.hurssy=ini_read_real("Controller","hurssy",0);
	    obj_controller.hurssy_time=ini_read_real("Controller","hurssy_time",0);
	    obj_controller.artifacts=ini_read_real("Controller","artifacts",0);
	    obj_controller.popup_master_crafted=ini_read_real("Controller","pmc",0);
	    obj_controller.select_wounded=ini_read_real("Controller","wndsel",1);
	    obj_ini.imperium_disposition=ini_read_real("Controller","imdis",40);
	    obj_controller.terra_direction=ini_read_real("Controller","terra_dir",floor(random(360))+1);

	        obj_controller.stc_wargear=ini_read_real("Controller","stc_wargear",0);
	        obj_controller.stc_vehicles=ini_read_real("Controller","stc_vehicles",0);
	        obj_controller.stc_ships=ini_read_real("Controller","stc_ships",0);
	        obj_controller.stc_un_total=ini_read_real("Controller","stc_un_total",0);
	        obj_controller.stc_wargear_un=ini_read_real("Controller","stc_wargear_un",0);
	        obj_controller.stc_vehicles_un=ini_read_real("Controller","stc_vehicles_un",0);
	        obj_controller.stc_ships_un=ini_read_real("Controller","stc_ships_un",0);
	    var j;j=0;repeat(6){j+=1;obj_controller.stc_bonus[j]=ini_read_real("Controller","stc_bonus_"+string(j),0);}
	    j=-1;repeat(5){j+=1;obj_ini.adv[j]=ini_read_string("Controller","adv"+string(j),"");obj_ini.dis[j]=ini_read_string("Controller","dis"+string(j),"");} //



	    // Player scheduled event
	    obj_controller.fest_type=ini_read_string("Controller","f_t",""); //

	    if (obj_controller.fest_type!=""){
	        obj_controller.fest_sid=ini_read_real("Controller","f_si",0);
	        obj_controller.fest_wid=ini_read_real("Controller","f_wi",0);
	        obj_controller.fest_planet=ini_read_real("Controller","f_pl",0);
	        obj_controller.fest_star=ini_read_string("Controller","f_st",""); //
	        obj_controller.fest_cost=ini_read_real("Controller","f_co",0);
	        obj_controller.fest_warp=ini_read_real("Controller","f_wa",0);
	        obj_controller.fest_scheduled=ini_read_real("Controller","f_sch",0);
	        obj_controller.fest_lav=ini_read_real("Controller","f_la",0);
	        obj_controller.fest_locals=ini_read_real("Controller","f_lo",0);
	        obj_controller.fest_feature1=ini_read_real("Controller","f_f1",0);
	        obj_controller.fest_feature2=ini_read_real("Controller","f_f2",0);
	        obj_controller.fest_feature3=ini_read_real("Controller","f_f3",0);
	        obj_controller.fest_display=ini_read_real("Controller","f_di",0);
	        obj_controller.fest_display_tags=ini_read_string("Controller","f_dit",""); //
	        obj_controller.fest_repeats=ini_read_real("Controller","f_re",0);
	        obj_controller.fest_honor_co=ini_read_real("Controller","f_hc",0);
	        obj_controller.fest_honor_id=ini_read_real("Controller","f_hi",0);
	        obj_controller.fest_honoring=ini_read_real("Controller","f_hon",0);
	    }
	    obj_controller.fest_feasts=ini_read_real("Controller","f_fee",0);
	    obj_controller.fest_boozes=ini_read_real("Controller","f_boo",0);
	    obj_controller.fest_drugses=ini_read_real("Controller","f_dru",0);
	    obj_controller.recent_happenings=ini_read_real("Controller","rech",0);
	    var i;i=-1;
	    repeat(obj_controller.recent_happenings+1){i+=1;
	        if (recent_type[i]!=""){
	            obj_controller.recent_type[i]=ini_write_string("Controller","rect"+string(i),"");
	            obj_controller.recent_keyword[i]=ini_write_string("Controller","reck"+string(i),"");
	  //          obj_controller.recent_turn[i]=ini_write_real("Controller","recu"+string(i),0);
	       //     obj_controller.recent_number[i]=ini_write_real("Controller","recn"+string(i),0);
	        }
	    }



	    obj_controller.last_attack_form=ini_read_real("Formation","last_attack",1);if (obj_controller.last_attack_form=0) then obj_controller.last_attack_form=1;
	    obj_controller.last_raid_form=ini_read_real("Formation","last_raid",3);if (obj_controller.last_raid_form=0) then obj_controller.last_raid_form=3;
	    j=0;repeat(16){j+=1;
	        obj_controller.bat_formation[j]=ini_read_string("Formation","form"+string(j),""); //
	        if (obj_controller.bat_formation[j]!="") or (j<=3){
	            obj_controller.bat_formation_type[j]=ini_read_real("Formation","form_type"+string(j),0);
	            if (bat_formation[j]="")and (obj_controller.bat_formation_type[j]=0){
	                if (j=1){obj_controller.bat_formation[j]="Attack";obj_controller.bat_formation_type[j]=1;}
	                if (j=2){obj_controller.bat_formation[j]="Defend";obj_controller.bat_formation_type[j]=1;}
	                if (j=3){obj_controller.bat_formation[j]="Raid";obj_controller.bat_formation_type[j]=2;}
	            }
	            obj_controller.bat_deva_for[j]=ini_read_real("Formation","deva"+string(j),1);
	            obj_controller.bat_assa_for[j]=ini_read_real("Formation","assa"+string(j),4);
	            obj_controller.bat_tact_for[j]=ini_read_real("Formation","tact"+string(j),2);
	            obj_controller.bat_vete_for[j]=ini_read_real("Formation","vete"+string(j),2);
	            obj_controller.bat_hire_for[j]=ini_read_real("Formation","hire"+string(j),3);
	            obj_controller.bat_libr_for[j]=ini_read_real("Formation","libr"+string(j),3);
	            obj_controller.bat_comm_for[j]=ini_read_real("Formation","comm"+string(j),3);
	            obj_controller.bat_tech_for[j]=ini_read_real("Formation","tech"+string(j),3);
	            obj_controller.bat_term_for[j]=ini_read_real("Formation","term"+string(j),3);
	            obj_controller.bat_hono_for[j]=ini_read_real("Formation","hono"+string(j),3);
	            obj_controller.bat_drea_for[j]=ini_read_real("Formation","drea"+string(j),5);
	            obj_controller.bat_rhin_for[j]=ini_read_real("Formation","rhin"+string(j),6);
	            obj_controller.bat_pred_for[j]=ini_read_real("Formation","pred"+string(j),7);
	            obj_controller.bat_land_for[j]=ini_read_real("Formation","land"+string(j),7);
	            obj_controller.bat_scou_for[j]=ini_read_real("Formation","scou"+string(j),1);
	        }
	    }

	    obj_controller.useful_info=ini_read_string("Controller","useful_info",""); 
	    obj_controller.random_event_next=ini_read_real("Controller","random_event_next","0"); 
	    obj_controller.gene_sold=ini_read_real("Controller","gene_sold",0);
	    obj_controller.gene_xeno=ini_read_real("Controller","gene_xeno",0);
	    obj_controller.gene_tithe=ini_read_real("Controller","gene_tithe",24);
	    obj_controller.gene_iou=ini_read_real("Controller","gene_iou",0);

	    obj_controller.und_armouries=ini_read_real("Controller","und_armouries",0);
	    obj_controller.und_gene_vaults=ini_read_real("Controller","und_gene_vaults",0);
	    obj_controller.und_lairs=ini_read_real("Controller","und_lairs",0);

	    obj_controller.penitent=ini_read_real("Controller","penitent",0);
	    obj_controller.penitent_current=ini_read_real("Controller","penitent_current",0);
	    obj_controller.penitent_max=ini_read_real("Controller","penitent_max",0);
	    obj_controller.penitent_turnly=ini_read_real("Controller","penitent_turnly",0);
	    obj_controller.penitent_turn=ini_read_real("Controller","penitent_turn",0);
	    obj_controller.penitent_end=ini_read_real("Controller","penitent_end",0);
	    obj_controller.blood_debt=ini_read_real("Controller","penitent_blood",0);

	    obj_controller.training_apothecary=ini_read_real("Controller","training_apothecary",0);
	    obj_controller.apothecary_points=ini_read_real("Controller","apothecary_points",0);
	    obj_controller.apothecary_aspirant=ini_read_real("Controller","apothecary_aspirant",0);
	    obj_controller.training_chaplain=ini_read_real("Controller","training_chaplain",0);
	    obj_controller.chaplain_points=ini_read_real("Controller","chaplain_points",0);
	    obj_controller.chaplain_aspirant=ini_read_real("Controller","chaplain_aspirant",0);
	    obj_controller.training_psyker=ini_read_real("Controller","training_psyker",0);
	    obj_controller.psyker_points=ini_read_real("Controller","psyker_points",0);
	    obj_controller.psyker_aspirant=ini_read_real("Controller","psyker_aspirant",0);
	    obj_controller.training_techmarine=ini_read_real("Controller","training_techmarine",0);
	    obj_controller.tech_points=ini_read_real("Controller","tech_points",0);
	    obj_controller.tech_aspirant=ini_read_real("Controller","tech_aspirant",0);

	    obj_controller.penitorium=ini_read_real("Controller","penitorium",0);

	    obj_controller.recruiting_worlds=ini_read_string("Controller","recruiting_worlds","");
	    obj_controller.recruiting=ini_read_real("Controller","recruiting",0);
	    obj_controller.recruit_trial=ini_read_string("Controller","trial","Blood Duel");
	    obj_controller.recruits=ini_read_real("Controller","recruits",0);
	    obj_controller.recruit_last=ini_read_real("Controller","recruit_last",0);

	    var g;g=-1;repeat(30){g+=1;
	        obj_controller.command_set[g]=ini_read_real("Controller","command"+string(g),0);
	    }
	    if (obj_controller.command_set[20]=0) and (obj_controller.command_set[21]=0) and (obj_controller.command_set[22]=0) then obj_controller.command_set[20]=1;
	    if (obj_controller.command_set[23]=0) and (obj_controller.command_set[24]=0) then obj_controller.command_set[24]=1;


	    ini_read_real("Controller","blandify",0);
	    var g;g=-1;repeat(obj_controller.recruits){g+=1;
	        obj_controller.recruit_name[g]=ini_read_string("Recruit","rcr"+string(g),"Error");
	        // ini_write_string("Recruit","rcr"+string(g),obj_controller.recruit_name[g]);
	        obj_controller.recruit_corruption[g]=ini_read_real("Recruit","rcr_cr"+string(g),0);
	        obj_controller.recruit_distance[g]=ini_read_real("Recruit","rcr_ds"+string(g),0);
	        obj_controller.recruit_training[g]=ini_read_real("Recruit","rcr_tr"+string(g),0);
	        obj_controller.recruit_exp[g]=ini_read_real("Recruit","rcr_ex"+string(g),0);
	    }
	    var g;g=-1;repeat(30){g+=1;
	        obj_controller.loyal[g]=ini_read_string("Controller","lyl"+string(g),"Error");
	        obj_controller.loyal_num[g]=ini_read_real("Controller","lyl_nm"+string(g),0);
	        obj_controller.loyal_tm[g]=ini_read_real("Controller","lyl_tm"+string(g),0);
	    }
	    var g;g=-1;repeat(30){g+=1;
	        obj_controller.inquisitor[g]=ini_read_string("Controller","inq"+string(g),"Error");
	        obj_controller.inquisitor_gender[g]=ini_read_real("Controller","inq_ge"+string(g),1);
	        obj_controller.inquisitor_type[g]=ini_read_string("Controller","inq_ty"+string(g),"Error");
	    }

	    var g;g=-1;repeat(14){g+=1;
	        obj_controller.faction[g]=ini_read_string("Factions","fac"+string(g),"Error");
	        obj_controller.disposition[g]=ini_read_real("Factions","dis"+string(g),0);
	        obj_controller.disposition_max[g]=ini_read_real("Factions","dis_max"+string(g),0);

	        obj_controller.faction_leader[g]=ini_read_string("Factions","lead"+string(g),"Error");
	        obj_controller.faction_gender[g]=ini_read_real("Factions","gen"+string(g),1);
	        obj_controller.faction_title[g]=ini_read_string("Factions","title"+string(g),"Error");
	        obj_controller.faction_status[g]=ini_read_string("Factions","status"+string(g),"Error");
	        obj_controller.faction_defeated[g]=ini_read_real("Factions","defeated"+string(g),0);
	        obj_controller.known[g]=ini_read_real("Factions","known"+string(g),0);

	        obj_controller.annoyed[g]=ini_read_real("Factions","annoyed"+string(g),0);
	        obj_controller.ignore[g]=ini_read_real("Factions","ignore"+string(g),0);
	        obj_controller.turns_ignored[g]=ini_read_real("Factions","turns_ignored"+string(g),0);
	        obj_controller.audien[g]=ini_read_real("Factions","audience"+string(g),0);
	        obj_controller.audien_topic[g]=ini_read_string("Factions","audience_topic"+string(g),"");
	    }
	    //
	    var g;g=0;
	    repeat(50){g+=1;
	        obj_controller.quest[g]=ini_read_string("Ongoing","quest"+string(g),"");
	        obj_controller.quest_faction[g]=ini_read_real("Ongoing","quest_faction"+string(g),0);
	        obj_controller.quest_end[g]=ini_read_real("Ongoing","quest_end"+string(g),0);
	    }
	    var g;g=0;
	    repeat(99){g+=1;
	        obj_controller.event[g]=ini_read_string("Ongoing","event"+string(g),"");
	        obj_controller.event_duration[g]=ini_read_real("Ongoing","event_duration"+string(g),0);
	    }
	    //
	    obj_controller.justmet=0;
	    obj_controller.check_number=ini_read_real("Controller","check_number",0);
	    obj_controller.year_fraction=ini_read_real("Controller","year_fraction",0);
	    obj_controller.year=ini_read_real("Controller","year",0);
	    obj_controller.millenium=ini_read_real("Controller","millenium",0);
	    //
	    obj_controller.requisition=ini_read_real("Controller","req",0);
	    //
	    obj_controller.income=ini_read_real("Controller","income",0);
	    obj_controller.income_last=ini_read_real("Controller","income_last",0);
	    obj_controller.income_base=ini_read_real("Controller","income_base",0);
	    obj_controller.income_home=ini_read_real("Controller","income_home",0);
	    obj_controller.income_forge=ini_read_real("Controller","income_forge",0);
	    obj_controller.income_agri=ini_read_real("Controller","income_agri",0);
	    obj_controller.income_recruiting=ini_read_real("Controller","income_recruiting",0);
	    obj_controller.income_training=ini_read_real("Controller","income_training",0);
	    obj_controller.income_fleet=ini_read_real("Controller","income_fleet",0);
	    obj_controller.income_trade=ini_read_real("Controller","income_trade",0);
	    obj_controller.loyalty=ini_read_real("Controller","loyalty",0);
	    obj_controller.loyalty_hidden=ini_read_real("Controller","loyalty_hidden",0);
	        obj_controller.inqis_flag_lair=ini_read_real("Controller","flag_lair",0);
	        obj_controller.inqis_flag_gene=ini_read_real("Controller","flag_gene",0);
	    obj_controller.gene_seed=ini_read_real("Controller","gene_seed",0);
	    obj_controller.marines=ini_read_real("Controller","marines",0);
	    obj_controller.command=ini_read_real("Controller","command",0);
	    obj_controller.info_chips=ini_read_real("Controller","info_chips",0);
	    obj_controller.inspection_passes=ini_read_real("Controller","inspection_passes",0);
	    obj_controller.recruiting_worlds_bought=ini_read_real("Controller","recruiting_worlds_bought",0);
	    obj_controller.last_weapons_tab=ini_read_real("Controller","lwt",1);
	    //
	    obj_ini.battle_cry=ini_read_string("Ini","battle_cry","Error");
	    // obj_ini.fortress_name=ini_read_string("Ini","fortress_name","Error");
	    obj_ini.flagship_name=ini_read_string("Ini","flagship_name","Error");
	    obj_ini.home_name=ini_read_string("Ini","home_name","Error");
	    obj_ini.home_type=ini_read_string("Ini","home_type","Error");
	    obj_ini.recruiting_name=ini_read_string("Ini","recruiting_name","Error");
	    obj_ini.recruiting_type=ini_read_string("Ini","recruiting_type","Error");


	    var tempa,tempa2,q,good;q=0;good=0;tempa="";tempa2=0;
	    scr_colors_initialize();

	    tempa=ini_read_string("Controller","main_color","Error");tempa2=0;
	    q=0;good=0;repeat(30){q+=1;if (tempa=col[q]) and (good=0){good=q;tempa2=q;}}
	    obj_controller.main_color=tempa2;obj_ini.main_color=tempa2;

	    tempa=ini_read_string("Controller","secondary_color","Error");tempa2=0;
	    q=0;good=0;repeat(30){q+=1;if (tempa=col[q]) and (good=0){good=q;tempa2=q;}}
	    obj_controller.secondary_color=tempa2;obj_ini.secondary_color=tempa2;

	    tempa=ini_read_string("Controller","trim_color","Error");tempa2=0;
	    q=0;good=0;repeat(30){q+=1;if (tempa=col[q]) and (good=0){good=q;tempa2=q;}}
	    obj_controller.trim_color=tempa2;obj_ini.trim_color=tempa2;

	    tempa=ini_read_string("Controller","pauldron2_color","Error");tempa2=0;
	    q=0;good=0;repeat(30){q+=1;if (tempa=col[q]) and (good=0){good=q;tempa2=q;}}
	    obj_controller.pauldron2_color=tempa2;obj_ini.pauldron2_color=tempa2;

	    tempa=ini_read_string("Controller","pauldron_color","Error");tempa2=0;
	    q=0;good=0;repeat(30){q+=1;if (tempa=col[q]) and (good=0){good=q;tempa2=q;}}
	    obj_controller.pauldron_color=tempa2;obj_ini.pauldron_color=tempa2;

	    tempa=ini_read_string("Controller","lens_color","Error");tempa2=0;
	    q=0;good=0;repeat(30){q+=1;if (tempa=col[q]) and (good=0){good=q;tempa2=q;}}
	    obj_controller.lens_color=tempa2;obj_ini.lens_color=tempa2;

	    tempa=ini_read_string("Controller","weapon_color","Error");tempa2=0;
	    q=0;good=0;repeat(30){q+=1;if (tempa=col[q]) and (good=0){good=q;tempa2=q;}}
	    obj_controller.weapon_color=tempa2;obj_ini.weapon_color=tempa2;

	    obj_controller.col_special=ini_read_real("Controller","col_special",0);obj_ini.col_special=obj_controller.col_special;
	    obj_controller.trim=ini_read_real("Controller","trimmed",0);obj_ini.trim=obj_controller.trim;
	    obj_ini.skin_color=ini_read_real("Controller","skin_color",0);obj_controller.skin_color=obj_ini.skin_color;

	    obj_ini.adept_name=ini_read_string("Controller","adept_name","Error");
	    obj_ini.recruiter_name=ini_read_string("Controller","recruiter_name","Error");
	    // obj_ini.progenitor=ini_read_string("Controller","progenitor","Error");
	    obj_ini.mutation=ini_read_string("Controller","mutation","Error");
	    obj_ini.successor_chapters=ini_read_real("Controller","successors",0);
	    obj_ini.progenitor_disposition=ini_read_real("Controller","progenitor_disposition",0);
	    obj_ini.imperium_disposition=ini_read_real("Controller","imperium_disposition",0);
	    obj_controller.astartes_disposition=ini_read_real("Controller","astartes_disposition",0);

	    obj_controller.bat_devastator_column=ini_read_real("Controller","bat_devastator_column",1);
	    obj_controller.bat_assault_column=ini_read_real("Controller","bat_assault_column",4);
	    obj_controller.bat_tactical_column=ini_read_real("Controller","bat_tactical_column",2);
	    obj_controller.bat_veteran_column=ini_read_real("Controller","bat_veteran_column",2);
	    obj_controller.bat_hire_column=ini_read_real("Controller","bat_hire_column",3);
	    obj_controller.bat_librarian_column=ini_read_real("Controller","bat_librarian_column",3);
	    obj_controller.bat_command_column=ini_read_real("Controller","bat_command_column",3);
	    obj_controller.bat_techmarine_column=ini_read_real("Controller","bat_techmarine_column",3);
	    obj_controller.bat_terminator_column=ini_read_real("Controller","bat_terminator_column",3);
	    obj_controller.bat_honor_column=ini_read_real("Controller","bat_honor_column",3);
	    obj_controller.bat_dreadnought_column=ini_read_real("Controller","bat_dreadnought_column",5);
	    obj_controller.bat_rhino_column=ini_read_real("Controller","bat_rhino_column",6);
	    obj_controller.bat_predator_column=ini_read_real("Controller","bat_preadtor_column",7);
	    obj_controller.bat_landraiders_column=ini_read_real("Controller","bat_landraiders_column",7);
	    obj_controller.bat_scout_column=ini_read_real("Controller","bat_scout_column",1);

	    ini_close();
	}


	if (argument0=2) or (argument0=0){debugl("Loading slot "+string(argument1)+" part 2");
	    ini_open("tsave.ini");

	    stars=ini_read_real("Save","stars",0);

	    // Stars
	    var i;i=-1;
	    repeat(stars){i+=1;
	        var new_star;new_star=instance_create(0,0,obj_star);

	        new_star.name=ini_read_string("Star","sr"+string(i)+"name","");
	        new_star.star=ini_read_string("Star","sr"+string(i)+"star","");
	        new_star.planets=ini_read_real("Star","sr"+string(i)+"planets",0);
	        new_star.owner=ini_read_real("Star","sr"+string(i)+"owner",0);
	        new_star.x=ini_read_real("Star","sr"+string(i)+"x",0);
	        new_star.y=ini_read_real("Star","sr"+string(i)+"y",0);
	        new_star.x2=ini_read_real("Star","sr"+string(i)+"x2",0);
	        new_star.y2=ini_read_real("Star","sr"+string(i)+"y2",0);
	        new_star.old_x=ini_read_real("Star","sr"+string(i)+"ox",0);
	        new_star.old_y=ini_read_real("Star","sr"+string(i)+"oy",0);

	        new_star.vision=ini_read_real("Star","sr"+string(i)+"vision",1);
	        new_star.storm=ini_read_real("Star","sr"+string(i)+"storm",0);
	        new_star.trader=ini_read_real("Star","sr"+string(i)+"trader",0);
	        new_star.craftworld=ini_read_real("Star","sr"+string(i)+"craftworld",0);
	        new_star.space_hulk=ini_read_real("Star","sr"+string(i)+"spacehulk",0);
	        if (new_star.space_hulk=1) then new_star.sprite_index=spr_star_hulk;

	        var g;g=0;
	        repeat(4){g+=1;
	            if (new_star.planets>=g){
	                new_star.planet[g]=ini_read_real("Star","sr"+string(i)+"plan"+string(g),0);
	                new_star.dispo[g]=ini_read_real("Star","sr"+string(i)+"dispo"+string(g),-10);
	                new_star.p_type[g]=ini_read_string("Star","sr"+string(i)+"type"+string(g),"");
					new_star.p_feature[g] = [];
					var  p_features = ini_read_string("Star","sr"+string(i)+"feat"+string(g),"");
					if (p_features != ""){
						var p_features = json_parse(base64_decode(p_features));
						for (var feat = 0;feat < array_length(p_features);feat++){
							var new_feat = new new_planet_feature(p_features[feat].f_type);
							new_feat.load_json_data(p_features[feat]);
							array_push(new_star.p_feature[g], new_feat);
						}
					}
	                new_star.p_owner[g]=ini_read_real("Star","sr"+string(i)+"own"+string(g),0);
	                new_star.p_first[g]=ini_read_real("Star","sr"+string(i)+"fir"+string(g),0);
	                new_star.p_population[g]=ini_read_real("Star","sr"+string(i)+"popul"+string(g),0);
	                new_star.p_max_population[g]=ini_read_real("Star","sr"+string(i)+"maxpop"+string(g),0);
	                new_star.p_large[g]=ini_read_real("Star","sr"+string(i)+"large"+string(g),0);
	                new_star.p_pop[g]=ini_read_string("Star","sr"+string(i)+"pop"+string(g),"");
	                new_star.p_guardsmen[g]=ini_read_real("Star","sr"+string(i)+"guard"+string(g),0);
	                new_star.p_pdf[g]=ini_read_real("Star","sr"+string(i)+"pdf"+string(g),0);
	                new_star.p_fortified[g]=ini_read_real("Star","sr"+string(i)+"forti"+string(g),0);
	                new_star.p_station[g]=ini_read_real("Star","sr"+string(i)+"stat"+string(g),0);

	                new_star.p_player[g]=ini_read_real("Star","sr"+string(i)+"play"+string(g),0);
	                new_star.p_lasers[g]=ini_read_real("Star","sr"+string(i)+"p_lasers"+string(g),0);
	                new_star.p_silo[g]=ini_read_real("Star","sr"+string(i)+"p_silo"+string(g),0);
	                new_star.p_defenses[g]=ini_read_real("Star","sr"+string(i)+"p_defenses"+string(g),0);
					new_star.p_upgrades[g] = [];
					var  p_upgrades = ini_read_string("Star","sr"+string(i)+"upg"+string(g),"");
					if (p_upgrades != ""){
						var p_upgrades = json_parse(base64_decode(p_upgrades));
						for (var feat = 0;feat < array_length(p_upgrades);feat++){
							var new_feat = new new_planet_feature(p_upgrades[feat].f_type);
							new_feat.load_json_data(p_upgrades[feat]);
							array_push(new_star.p_upgrades[g], new_feat);
						}
					}					

	                new_star.p_orks[g]=ini_read_real("Star","sr"+string(i)+"or"+string(g),0);
	                new_star.p_tau[g]=ini_read_real("Star","sr"+string(i)+"ta"+string(g),0);
	                new_star.p_eldar[g]=ini_read_real("Star","sr"+string(i)+"el"+string(g),0);
	                new_star.p_traitors[g]=ini_read_real("Star","sr"+string(i)+"tr"+string(g),0);
	                new_star.p_chaos[g]=ini_read_real("Star","sr"+string(i)+"ch"+string(g),0);
	                new_star.p_demons[g]=ini_read_real("Star","sr"+string(i)+"de"+string(g),0);
	                new_star.p_sisters[g]=ini_read_real("Star","sr"+string(i)+"si"+string(g),0);
	                new_star.p_necrons[g]=ini_read_real("Star","sr"+string(i)+"ne"+string(g),0);
	                new_star.p_tyranids[g]=ini_read_real("Star","sr"+string(i)+"tyr"+string(g),0);
	                    new_star.p_halp[g]=ini_read_real("Star","sr"+string(i)+"halp"+string(g),0);

	                new_star.p_heresy[g]=ini_read_real("Star","sr"+string(i)+"heresy"+string(g),0);
	                new_star.p_hurssy[g]=ini_read_real("Star","sr"+string(i)+"hurssy"+string(g),0);
	                new_star.p_hurssy_time[g]=ini_read_real("Star","sr"+string(i)+"hurssy_time"+string(g),0);
	                new_star.p_heresy_secret[g]=ini_read_real("Star","sr"+string(i)+"heresy_secret"+string(g),0);
	                new_star.p_influence[g]=ini_read_real("Star","sr"+string(i)+"influence"+string(g),0);
	                new_star.p_raided[g]=ini_read_real("Star","sr"+string(i)+"raided"+string(g),0);



	                /*
	                ini_write_string("Star","sr"+string(i)+"prob"+string(g)+".1",instance_array[i].p_problem[g,1]);
	                ini_write_real("Star","sr"+string(i)+"time"+string(g)+".1",instance_array[i].p_timer[g,1]);

	                ini_write_string("Star","sr"+string(i)+"prob"+string(g)+"2",instance_array[i].p_problem[g,2]);
	                ini_write_real("Star","sr"+string(i)+"time"+string(g)+".2",instance_array[i].p_timer[g,2]);

	                ini_write_string("Star","sr"+string(i)+"prob"+string(g)+".3",instance_array[i].p_problem[g,3]);
	                ini_write_real("Star","sr"+string(i)+"time"+string(g)+".3",instance_array[i].p_timer[g,3]);

	                ini_write_string("Star","sr"+string(i)+"prob"+string(g)+".4",instance_array[i].p_problem[g,4]);
	                ini_write_real("Star","sr"+string(i)+"time"+string(g)+".4",instance_array[i].p_timer[g,4]);
	                */



	                new_star.p_problem[g,1]=ini_read_string("Star","sr"+string(i)+"prob"+string(g)+".1","");
	                new_star.p_timer[g,1]=ini_read_real("Star","sr"+string(i)+"time"+string(g)+".1",0);
	                new_star.p_problem[g,2]=ini_read_string("Star","sr"+string(i)+"prob"+string(g)+".2","");
	                new_star.p_timer[g,2]=ini_read_real("Star","sr"+string(i)+"time"+string(g)+".2",0);
	                new_star.p_problem[g,3]=ini_read_string("Star","sr"+string(i)+"prob"+string(g)+".3","");
	                new_star.p_timer[g,3]=ini_read_real("Star","sr"+string(i)+"time"+string(g)+".3",0);
	                new_star.p_problem[g,4]=ini_read_string("Star","sr"+string(i)+"prob"+string(g)+".4","");
	                new_star.p_timer[g,4]=ini_read_real("Star","sr"+string(i)+"time"+string(g)+".4",0);
	            }
	        }
	    }

	    // obj_ini
	    obj_ini.home_name=ini_read_string("Ini","home_name","Error");
	    obj_ini.home_type=ini_read_string("Ini","home_type","Error");
	    obj_ini.recruiting_name=ini_read_string("Ini","recruiting_name","Error");
	    obj_ini.recruiting_type=ini_read_string("Ini","recruiting_type","Error");
	    obj_ini.chapter_name=ini_read_string("Ini","chapter_name","Error");
	    obj_ini.fortress_name=ini_read_string("Ini","fortress_name","Error");
	    obj_ini.flagship_name=ini_read_string("Ini","flagship_name","Error");
	    obj_ini.icon=ini_read_real("Ini","icon",0);
	    obj_ini.icon_name=ini_read_string("Ini","icon_name","custom1");
	    global.icon_name=obj_ini.icon_name;
	    obj_ini.man_size=ini_read_real("Ini","man_size",0);
	    obj_ini.strin=ini_read_string("Ini","strin1","");
	    obj_ini.strin2=ini_read_string("Ini","strin2","");
	    obj_ini.psy_powers=ini_read_string("Ini","psy_powers","default");

	    obj_ini.companies=ini_read_real("Ini","companies",10);
	    var i;i=-1;repeat(21){i+=1;obj_ini.company_title[i]=ini_read_string("Ini","comp_title"+string(i),"");}
	    var i;i=-1;repeat(121){i+=1;obj_ini.slave_batch_num[i]=ini_read_real("Ini","slave_num_"+string(i),0);obj_ini.slave_batch_eta[i]=ini_read_real("Ini","slave_eta_"+string(i),0);}



	    obj_ini.master_autarch=ini_read_real("Ini","master_autarch",0);
	    obj_ini.master_avatar=ini_read_real("Ini","master_avatar",0);
	    obj_ini.master_farseer=ini_read_real("Ini","master_farseer",0);
	    obj_ini.master_aspect=ini_read_real("Ini","master_aspect",0);
	    obj_ini.master_eldar=ini_read_real("Ini","master_eldar",0);
	    obj_ini.master_eldar_vehicles=ini_read_real("Ini","master_eldar_vehicles",0);
	    obj_ini.master_tau=ini_read_real("Ini","master_tau",0);
	    obj_ini.master_battlesuits=ini_read_real("Ini","master_battlesuits",0);
	    obj_ini.master_kroot=ini_read_real("Ini","master_kroot",0);
	    obj_ini.master_tau_vehicles=ini_read_real("Ini","master_tau_vehicles",0);
	    obj_ini.master_ork_boyz=ini_read_real("Ini","master_ork_boyz",0);
	    obj_ini.master_ork_nobz=ini_read_real("Ini","master_ork_nobz",0);
	    obj_ini.master_ork_warboss=ini_read_real("Ini","master_ork_warboss",0);
	    obj_ini.master_ork_vehicles=ini_read_real("Ini","master_ork_vehicles",0);
	    obj_ini.master_heretics=ini_read_real("Ini","master_heretics",0);
	    obj_ini.master_chaos_marines=ini_read_real("Ini","master_chaos_marines",0);
	    obj_ini.master_lesser_demons=ini_read_real("Ini","master_lesser_demons",0);
	    obj_ini.master_greater_demons=ini_read_real("Ini","master_greater_demons",0);
	    obj_ini.master_chaos_vehicles=ini_read_real("Ini","master_chaos_vehicles",0);
	    obj_ini.master_gaunts=ini_read_real("Ini","master_gaunts",0);
	    obj_ini.master_warriors=ini_read_real("Ini","master_warriors",0);
	    obj_ini.master_carnifex=ini_read_real("Ini","master_carnifex",0);
	    obj_ini.master_synapse=ini_read_real("Ini","master_synapse",0);
	    obj_ini.master_tyrant=ini_read_real("Ini","master_tyrant",0);
	    obj_ini.master_gene=ini_read_real("Ini","master_gene",0);
	    obj_ini.master_necron_overlord=ini_read_real("Ini","master_necron_overlord",0);
	    obj_ini.master_destroyer=ini_read_real("Ini","master_destroyer",0);
	    obj_ini.master_necron=ini_read_real("Ini","master_necron",0);
	    obj_ini.master_wraith=ini_read_real("Ini","master_wraith",0);
	    obj_ini.master_necron_vehicles=ini_read_real("Ini","master_necron_vehicles",0);
	    obj_ini.master_monolith=ini_read_real("Ini","master_monolith",0);
	    obj_ini.master_special_killed=ini_read_string("Ini","master_special","");
	    //
	    obj_ini.preomnor=ini_read_real("Ini","preomnor",0);
	    obj_ini.voice=ini_read_real("Ini","voice",0);
	    obj_ini.doomed=ini_read_real("Ini","doomed",0);
	    obj_ini.lyman=ini_read_real("Ini","lyman",0);
	    obj_ini.omophagea=ini_read_real("Ini","omophagea",0);
	    obj_ini.ossmodula=ini_read_real("Ini","ossmodula",0);
	    obj_ini.membrane=ini_read_real("Ini","membrane",0);
	    obj_ini.zygote=ini_read_real("Ini","zygote",0);
	    obj_ini.betchers=ini_read_real("Ini","betchers",0);
	    obj_ini.catalepsean=ini_read_real("Ini","catalepsean",0);
	    obj_ini.secretions=ini_read_real("Ini","secretions",0);
	    obj_ini.occulobe=ini_read_real("Ini","occulobe",0);
	    obj_ini.mucranoid=ini_read_real("Ini","mucranoid",0);
	    //
	    obj_ini.master_name=ini_read_string("Ini","master_name","Error");
	    obj_ini.chief_librarian_name=ini_read_string("Ini","chief_name","Error");
	    obj_ini.high_chaplain_name=ini_read_string("Ini","high_name","Error");
	    obj_ini.high_apothecary_name=ini_read_string("Ini","high2_name","Error");
	    obj_ini.forge_master_name=ini_read_string("Ini","forgey_name","Error");
	    obj_ini.lord_admiral_name=ini_read_string("Ini","lord_name","Error");
	    //
	    obj_ini.chaplain_ranged=ini_read_string("Ini","chaplain_ranged","Error");
	    obj_ini.chaplain_melee=ini_read_string("Ini","chaplain_melee","Error");
	    obj_ini.apothecary_ranged=ini_read_string("Ini","apothecary_ranged","Error");
	    obj_ini.apothecary_melee=ini_read_string("Ini","apothecary_melee","Error");
	    obj_ini.sergeant_ranged=ini_read_string("Ini","sergeant_ranged","Error");
	    obj_ini.sergeant_melee=ini_read_string("Ini","sergeant_melee","Error");
	    obj_ini.scout_ranged=ini_read_string("Ini","scout_ranged","Error");
	    obj_ini.scout_melee=ini_read_string("Ini","scout_melee","Error");
	    obj_ini.honor_ranged=ini_read_string("Ini","honor_ranged","Error");
	    obj_ini.honor_melee=ini_read_string("Ini","honor_melee","Error");
	    obj_ini.honor_mobi=ini_read_string("Ini","honor_mobi","Error");
	    obj_ini.forbidden_unit1=ini_read_string("Ini","forbidden_unit1","Error");
	    obj_ini.forbidden_unit2=ini_read_string("Ini","forbidden_unit2","Error");
	    obj_ini.forbidden_unit3=ini_read_string("Ini","forbidden_unit3","Error");
	    //
	    var g;g=-1;
	    repeat(150){g+=1;
	        obj_ini.equipment[g]=ini_read_string("Ini","equipment"+string(g),"");
	        obj_ini.equipment_type[g]=ini_read_string("Ini","equipment_type"+string(g),"");
	        obj_ini.equipment_number[g]=ini_read_real("Ini","equipment_number"+string(g),0);
	        obj_ini.equipment_condition[g]=ini_read_real("Ini","equipment_condition"+string(g),0);

	        if (g<=20){
	            obj_ini.artifact[g]=ini_read_string("Ini","artifact"+string(g),"");
	            obj_ini.artifact_tags[g]=ini_read_string("Ini","artifact_tags"+string(g),"");
	            obj_ini.artifact_identified[g]=ini_read_real("Ini","artifact_ident"+string(g),0);
	            obj_ini.artifact_condition[g]=ini_read_real("Ini","artifact_condition"+string(g),0);
	            obj_ini.artifact_loc[g]=ini_read_string("Ini","artifact_loc"+string(g),"");
	            obj_ini.artifact_sid[g]=ini_read_real("Ini","artifact_sid"+string(g),0);
	        }
	    }
	    //
	    obj_ini.ship_location[0]="";


	    if (global.restart=0){
	        var g;g=-1;repeat(200){g+=1;
	            obj_ini.ship[g]=ini_read_string("Ships","shi"+string(g),"");
	            obj_ini.ship_uid[g]=ini_read_real("Ships","shi_uid"+string(g),0);
	            obj_ini.ship_class[g]=ini_read_string("Ships","shi_class"+string(g),"");
	            //
	            obj_ini.ship_size[g]=ini_read_real("Ships","shi_size"+string(g),0);
	            obj_ini.ship_leadership[g]=ini_read_real("Ships","shi_leadership"+string(g),0);
	            obj_ini.ship_hp[g]=ini_read_real("Ships","shi_hp"+string(g),0);
	            obj_ini.ship_maxhp[g]=ini_read_real("Ships","shi_maxhp"+string(g),0);

	            if (obj_ini.ship_maxhp[g]<200) and (obj_ini.ship_maxhp[g]!=0){
	                obj_ini.ship_hp[g]=obj_ini.ship_hp[g]*2;
	                obj_ini.ship_maxhp[g]=obj_ini.ship_maxhp[g]*2;
	            }

	            obj_ini.ship_location[g]=ini_read_string("Ships","shi_location"+string(g),"");
	            obj_ini.ship_shields[g]=ini_read_real("Ships","shi_shields"+string(g),0);
	            obj_ini.ship_conditions[g]=ini_read_string("Ships","shi_conditions"+string(g),"");
	            obj_ini.ship_speed[g]=ini_read_real("Ships","shi_speed"+string(g),0);
	            obj_ini.ship_turning[g]=ini_read_real("Ships","shi_turning"+string(g),0);
	            obj_ini.ship_front_armour[g]=ini_read_real("Ships","shi_front_ac"+string(g),0);
	            obj_ini.ship_other_armour[g]=ini_read_real("Ships","shi_other_ac"+string(g),0);
	            obj_ini.ship_weapons[g]=ini_read_real("Ships","shi_weapons"+string(g),0);
	            //
	            obj_ini.ship_wep[g,1]=ini_read_string("Ships","shi"+string(g)+"wep1","");
	            obj_ini.ship_facing[g,1]=ini_read_string("Ships","shi"+string(g)+"facing1","");
	            obj_ini.ship_condition[g,1]=ini_read_string("Ships","shi"+string(g)+"condition1","");
	            obj_ini.ship_wep[g,2]=ini_read_string("Ships","shi"+string(g)+"wep2","");
	            obj_ini.ship_facing[g,2]=ini_read_string("Ships","shi"+string(g)+"facing2","");
	            obj_ini.ship_condition[g,2]=ini_read_string("Ships","shi"+string(g)+"condition2","");
	            obj_ini.ship_wep[g,3]=ini_read_string("Ships","shi"+string(g)+"wep3","");
	            obj_ini.ship_facing[g,3]=ini_read_string("Ships","shi"+string(g)+"facing3","");
	            obj_ini.ship_condition[g,3]=ini_read_string("Ships","shi"+string(g)+"condition3","");
	            obj_ini.ship_wep[g,4]=ini_read_string("Ships","shi"+string(g)+"wep4","");
	            obj_ini.ship_facing[g,4]=ini_read_string("Ships","shi"+string(g)+"facing4","");
	            obj_ini.ship_condition[g,4]=ini_read_string("Ships","shi"+string(g)+"condition4","");
	            obj_ini.ship_wep[g,5]=ini_read_string("Ships","shi"+string(g)+"wep5","");
	            obj_ini.ship_facing[g,5]=ini_read_string("Ships","shi"+string(g)+"facing5","");
	            obj_ini.ship_condition[g,5]=ini_read_string("Ships","shi"+string(g)+"condition5","");
	            //
	            obj_ini.ship_capacity[g]=ini_read_real("Ships","shi_capacity"+string(g),0);
	            obj_ini.ship_carrying[g]=ini_read_real("Ships","shi_carrying"+string(g),0);
	            obj_ini.ship_contents[g]=ini_read_string("Ships","shi_contents"+string(g),"");
	            obj_ini.ship_turrets[g]=ini_read_real("Ships","shi_turrets"+string(g),0);
	        }
	    }
	    // the fun begins here
	    ini_close();
	}




	if (argument0=3) or (argument0=0){debugl("Loading slot "+string(argument1)+" part 3");
	    ini_open("tsave.ini");

	    var coh,mah,good;
	    good=0;coh=100;mah=-1;

	    if (global.restart=0){
	        var coh,mah,good;
	        good=0;coh=10;mah=205;
	        repeat(2255){
	            if (good=0){
	                mah-=1;
	                if (mah=0){mah=205;coh-=1;}

	                // var temp_name;temp_name="";
	                // temp_name=ini_read_string("Veh","rol"+string(coh)+"."+string(mah),"");

	                // if (temp_name!=""){
	                    obj_ini.veh_race[coh,mah]=ini_read_real("Veh","co"+string(coh)+"."+string(mah),0);
	                    obj_ini.veh_loc[coh,mah]=ini_read_string("Veh","lo"+string(coh)+"."+string(mah),"");
	                    obj_ini.veh_role[coh,mah]=ini_read_string("Veh","rol"+string(coh)+"."+string(mah),"");// temp_name;
	                    obj_ini.veh_lid[coh,mah]=ini_read_real("Veh","lid"+string(coh)+"."+string(mah),0);
	                    obj_ini.veh_uid[coh,mah]=ini_read_real("Veh","uid"+string(coh)+"."+string(mah),0);
	                    obj_ini.veh_wid[coh,mah]=ini_read_real("Veh","wid"+string(coh)+"."+string(mah),0);

	                    obj_ini.veh_wep1[coh,mah]=ini_read_string("Veh","w1"+string(coh)+"."+string(mah),"");
	                    obj_ini.veh_wep2[coh,mah]=ini_read_string("Veh","w2"+string(coh)+"."+string(mah),"");
	                    obj_ini.veh_wep3[coh,mah]=ini_read_string("Veh","w3"+string(coh)+"."+string(mah),"");
	                    obj_ini.veh_upgrade[coh,mah]=ini_read_string("Veh","up"+string(coh)+"."+string(mah),"");
	                    obj_ini.veh_acc[coh,mah]=ini_read_string("Veh","ac"+string(coh)+"."+string(mah),"");

	                    obj_ini.veh_hp[coh,mah]=ini_read_real("Veh","hp"+string(coh)+"."+string(mah),0);
	                    obj_ini.veh_chaos[coh,mah]=ini_read_real("Veh","cha"+string(coh)+"."+string(mah),0);
	                    // ini_write_real("Veh","pil"+string(coh)+"."+string(mah),obj_ini.veh_pilots[coh,mah]);
	                // }
	                if (coh=1) and (mah=1) then good=1;
	            }
	        }

	        var coh,mah,good;
	        good=0;coh=100;mah=-1;
	        repeat(31){mah+=1;
	            obj_ini.race[coh,mah]=ini_read_real("Mar","co"+string(coh)+"."+string(mah),0);
	            obj_ini.name[coh,mah]=ini_read_string("Mar","num"+string(coh)+"."+string(mah),"");
	            obj_ini.role[coh,mah]=ini_read_string("Mar","rol"+string(coh)+"."+string(mah),"");
	            obj_ini.wep1[coh,mah]=ini_read_string("Mar","w1"+string(coh)+"."+string(mah),"");
	            obj_ini.wep2[coh,mah]=ini_read_string("Mar","w2"+string(coh)+"."+string(mah),"");
	            obj_ini.armour[coh,mah]=ini_read_string("Mar","ar"+string(coh)+"."+string(mah),"");
	            obj_ini.gear[coh,mah]=ini_read_string("Mar","ge"+string(coh)+"."+string(mah),"");
	            obj_ini.mobi[coh,mah]=ini_read_string("Mar","mb"+string(coh)+"."+string(mah),"");	
	        }
	        for (coh=0;coh<=10;coh++){
	        	for (mah=0;mah<=500;mah++){

	                // var temp_name;temp_name="";
	                // temp_name=ini_read_string("Mar","rol"+string(coh)+"."+string(mah),"Error");

                    obj_ini.race[coh,mah]=ini_read_real("Mar","co"+string(coh)+"."+string(mah),0);
                    obj_ini.loc[coh,mah]=ini_read_string("Mar","lo"+string(coh)+"."+string(mah),"");
                    obj_ini.name[coh,mah]=ini_read_string("Mar","num"+string(coh)+"."+string(mah),"");
                    obj_ini.role[coh,mah]=ini_read_string("Mar","rol"+string(coh)+"."+string(mah),"");// temp_name;
                    obj_ini.lid[coh,mah]=ini_read_real("Mar","li"+string(coh)+"."+string(mah),0);
                    obj_ini.bio[coh,mah]=ini_read_real("Mar","bio"+string(coh)+"."+string(mah),0);
                    obj_ini.wid[coh,mah]=ini_read_real("Mar","wi"+string(coh)+"."+string(mah),0);								

                    if (coh=0){
                        if (obj_ini.role[coh,mah]="Chapter Master"){
                        	obj_ini.race[coh,mah]=1;
                        }else if (obj_ini.role[coh,mah]="Master of Sanctity"){
                        	obj_ini.race[coh,mah]=1;
                        }else if (obj_ini.role[coh,mah]="Master of the Apothecarion"){
                        	obj_ini.race[coh,mah]=1;
                        } else if (obj_ini.role[coh,mah]="Forge Master") then obj_ini.race[coh,mah]=1;
                        if (string_count("Chief",obj_ini.role[coh,mah])>0) then obj_ini.race[coh,mah]=1;
                    }

                    obj_ini.wep1[coh,mah]=ini_read_string("Mar","w1"+string(coh)+"."+string(mah),"");
                    obj_ini.wep2[coh,mah]=ini_read_string("Mar","w2"+string(coh)+"."+string(mah),"");
                    obj_ini.armour[coh,mah]=ini_read_string("Mar","ar"+string(coh)+"."+string(mah),"");
                    obj_ini.gear[coh,mah]=ini_read_string("Mar","ge"+string(coh)+"."+string(mah),"");
                    obj_ini.mobi[coh,mah]=ini_read_string("Mar","mb"+string(coh)+"."+string(mah),"");

                    var arc,teh,teh2;arc=0;teh="";teh2="";// Give daemon weapons their dialogue lines
                    for (arc=1;arc<6;arc++){
                    	teh2=choose("Daemonic1a|","Daemonic2a|","Daemonic3a|","Daemonic4a|");
                        if (arc=1) then teh=obj_ini.wep1[coh,mah];
                        if (arc=2) then teh=obj_ini.wep2[coh,mah];
                        if (arc=3) then teh=obj_ini.armour[coh,mah];
                        if (arc=4) then teh=obj_ini.gear[coh,mah];
                        if (arc=5) then teh=obj_ini.mobi[coh,mah];
                        if (string_pos("&",teh)>0){
                            if (string_count("Daemonic|",teh)>0) then teh=string_replace(teh,"Daemonic|",teh2);
                            if (arc=1) then obj_ini.wep1[coh,mah]=teh;
                            if (arc=2) then obj_ini.wep2[coh,mah]=teh;
                            if (arc=3) then obj_ini.armour[coh,mah]=teh;
                            if (arc=4) then obj_ini.gear[coh,mah]=teh;
                            if (arc=5) then obj_ini.mobi[coh,mah]=teh;
                        }
                    }
                    obj_ini.hp[coh,mah]=ini_read_real("Mar","hp"+string(coh)+"."+string(mah),0);
                    obj_ini.chaos[coh,mah]=ini_read_real("Mar","cha"+string(coh)+"."+string(mah),0);
                    obj_ini.experience[coh,mah]=ini_read_real("Mar","exp"+string(coh)+"."+string(mah),0);
                    obj_ini.age[coh,mah]=ini_read_real("Mar","ag"+string(coh)+"."+string(mah),0);
                    obj_ini.spe[coh,mah]=ini_read_string("Mar","spe"+string(coh)+"."+string(mah),"");
                    obj_ini.god[coh,mah]=ini_read_real("Mar","god"+string(coh)+"."+string(mah),0);
                    load_marine_struct(coh,mah);
	            }
	        }


	        if (string_count(obj_ini.spe[0,1],"$")>0) then obj_controller.born_leader=1;

	        coh=100;mah=-1;
	        repeat(21){mah+=1;
	            obj_ini.race[coh,mah]=ini_read_real("Mar","co"+string(coh)+"."+string(mah),0);
	            obj_ini.role[coh,mah]=ini_read_string("Mar","rol"+string(coh)+"."+string(mah),"");
	            obj_ini.wep1[coh,mah]=ini_read_string("Mar","w1"+string(coh)+"."+string(mah),"");
	            obj_ini.wep2[coh,mah]=ini_read_string("Mar","w2"+string(coh)+"."+string(mah),"");
	            obj_ini.armour[coh,mah]=ini_read_string("Mar","ar"+string(coh)+"."+string(mah),"");
	            obj_ini.gear[coh,mah]=ini_read_string("Mar","ge"+string(coh)+"."+string(mah),"");
	            obj_ini.mobi[coh,mah]=ini_read_string("Mar","mb"+string(coh)+"."+string(mah),"");
	        }
	        coh=102;mah=-1;
	        repeat(21){mah+=1;
	            obj_ini.race[coh,mah]=ini_read_string("Mar","co"+string(coh)+"."+string(mah),0);
	            obj_ini.role[coh,mah]=ini_read_string("Mar","rol"+string(coh)+"."+string(mah),"");
	            obj_ini.wep1[coh,mah]=ini_read_string("Mar","w1"+string(coh)+"."+string(mah),"");
	            obj_ini.wep2[coh,mah]=ini_read_string("Mar","w2"+string(coh)+"."+string(mah),"");
	            obj_ini.armour[coh,mah]=ini_read_string("Mar","ar"+string(coh)+"."+string(mah),"");
	            obj_ini.gear[coh,mah]=ini_read_string("Mar","ge"+string(coh)+"."+string(mah),"");
	            obj_ini.mobi[coh,mah]=ini_read_string("Mar","mb"+string(coh)+"."+string(mah),"");			
	        }

	        obj_ini.squads = [];
	        var squad_fetch = ini_read_string("Mar","squads","");
	        if (squad_fetch != ""){
	        	squad_fetch = json_parse(base64_decode(squad_fetch));
	        	for (i=0;i<array_length(squad_fetch);i++){
	        		array_push(obj_ini.squads, new unit_squad());
	        		obj_ini.squads[i].load_json_data(json_parse(squad_fetch[i]));
	        	}
	        }

	        obj_ini.squad_types = json_parse(base64_decode(ini_read_string("Mar","squad_types","")));

	    }


	    ini_close();
	}



	if (argument0=4) or (argument0=0){debugl("Loading slot "+string(argument1)+" part 4");// PLAYER FLEET OBJECTS
	    ini_open("tsave.ini");

	    var num,i,fla;
	    // Temporary artifact objects
	    num=ini_read_real("Controller","temp_arti",0);
	    i=-1;fla=0;
	    repeat(num){i+=1;
	        fla=instance_create(0,0,obj_temp_arti);
	        fla.x=ini_read_real("Star","ar"+string(i)+"x",0);
	        fla.y=ini_read_real("Star","ar"+string(i)+"y",0);
	    }

	    num=ini_read_real("Save","p_fleets",0);
	    i=-1;fla=0;

	    repeat(num){i+=1;fla=instance_create(0,0,obj_p_fleet);
	        fla.image_index=ini_read_real("Fleet","pf"+string(i)+"image",0);
	        fla.x=ini_read_real("Fleet","pf"+string(i)+"x",0);
	        fla.y=ini_read_real("Fleet","pf"+string(i)+"y",0);
	        fla.capital_number=ini_read_real("Fleet","pf"+string(i)+"capitals",0);
	        fla.frigate_number=ini_read_real("Fleet","pf"+string(i)+"frigates",0);
	        fla.escort_number=ini_read_real("Fleet","pf"+string(i)+"escorts",0);
	        fla.selected=ini_read_real("Fleet","pf"+string(i)+"selected",0);
	        fla.capital_health=ini_read_real("Fleet","pf"+string(i)+"capital_hp",0);
	        fla.frigate_health=ini_read_real("Fleet","pf"+string(i)+"frigate_hp",0);
	        fla.escort_health=ini_read_real("Fleet","pf"+string(i)+"escort_hp",0);
	        fla.action=ini_read_string("Fleet","pf"+string(i)+"action","");
	        fla.action_x=ini_read_real("Fleet","pf"+string(i)+"action_x",0);
	        fla.action_y=ini_read_real("Fleet","pf"+string(i)+"action_y",0);
	        fla.action_spd=ini_read_real("Fleet","pf"+string(i)+"action_spd",0);
	        fla.action_eta=ini_read_real("Fleet","pf"+string(i)+"action_eta",0);
	        // fla.connected=ini_read_real("Fleet","pf"+string(i)+"",0);
	        fla.acted=ini_read_real("Fleet","pf"+string(i)+"acted",0);
	        fla.hurssy=ini_read_real("Fleet","pf"+string(i)+"hurssy",0);
	        fla.hurssy_time=ini_read_real("Fleet","pf"+string(i)+"hurssy_time",0);
	        fla.orbiting=ini_read_real("Fleet","pf"+string(i)+"orb",0);

	        var g;g=-1;repeat(10){g+=1;
	            fla.capital[g]=ini_read_string("Fleet","pf"+string(i)+"capital"+string(g),"");
	            fla.capital_num[g]=ini_read_real("Fleet","pf"+string(i)+"capital_num"+string(g),0);
	            fla.capital_sel[g]=ini_read_real("Fleet","pf"+string(i)+"capital_sel"+string(g),0);
	            fla.capital_uid[g]=ini_read_real("Fleet","pf"+string(i)+"capital_uid"+string(g),0);
	        }
	        g=-1;repeat(21){g+=1;
	            fla.frigate[g]=ini_read_string("Fleet","pf"+string(i)+"frigate"+string(g),"");
	            fla.frigate_num[g]=ini_read_real("Fleet","pf"+string(i)+"frigate_num"+string(g),0);
	            fla.frigate_sel[g]=ini_read_real("Fleet","pf"+string(i)+"frigate_sel"+string(g),0);
	            fla.frigate_uid[g]=ini_read_real("Fleet","pf"+string(i)+"frigate_uid"+string(g),0);
	        }
	        g=-1;repeat(35){g+=1;
	            fla.escort[g]=ini_read_string("Fleet","pf"+string(i)+"escort"+string(g),"");
	            fla.escort_num[g]=ini_read_real("Fleet","pf"+string(i)+"escort_num"+string(g),0);
	            fla.escort_sel[g]=ini_read_real("Fleet","pf"+string(i)+"escort_sel"+string(g),0);
	            fla.escort_uid[g]=ini_read_real("Fleet","pf"+string(i)+"escort_uid"+string(g),0);
	        }
	    }

	    // ENEMY FLEET OBJECTS
	    num=ini_read_real("Save","en_fleets",0);
	    i=-1;fla=0;

	    repeat(num){i+=1;fla=instance_create(0,0,obj_en_fleet);
	        fla.owner=ini_read_real("Fleet","ef"+string(i)+"owner",0);
	        fla.x=ini_read_real("Fleet","ef"+string(i)+"x",0);
	        fla.y=ini_read_real("Fleet","ef"+string(i)+"y",0);
	        fla.sprite_index=ini_read_real("Fleet","ef"+string(i)+"sprite",0);
	        fla.image_index=ini_read_real("Fleet","ef"+string(i)+"image",0);
	        fla.image_alpha=ini_read_real("Fleet","ef"+string(i)+"alpha",1);
	        fla.capital_number=ini_read_real("Fleet","ef"+string(i)+"capitals",0);
	        fla.frigate_number=ini_read_real("Fleet","ef"+string(i)+"frigates",0);
	        fla.escort_number=ini_read_real("Fleet","ef"+string(i)+"escorts",0);
	        fla.selected=ini_read_real("Fleet","ef"+string(i)+"selected",0);
	        fla.action=ini_read_string("Fleet","ef"+string(i)+"action","");
	        fla.action_x=ini_read_real("Fleet","ef"+string(i)+"action_x",0);
	        fla.action_y=ini_read_real("Fleet","ef"+string(i)+"action_y",0);
	        fla.home_x=ini_read_real("Fleet","ef"+string(i)+"home_x",0);
	        fla.home_y=ini_read_real("Fleet","ef"+string(i)+"home_y",0);
	        fla.target=ini_read_real("Fleet","ef"+string(i)+"target",0);
	        fla.target_x=ini_read_real("Fleet","ef"+string(i)+"target_x",0);
	        fla.target_y=ini_read_real("Fleet","ef"+string(i)+"target_y",0);
	        fla.action_spd=ini_read_real("Fleet","ef"+string(i)+"action_spd",0);
	        fla.action_eta=ini_read_real("Fleet","ef"+string(i)+"action_eta",0);
	        fla.connected=ini_read_real("Fleet","ef"+string(i)+"connected",0);
	        fla.loaded=ini_read_real("Fleet","ef"+string(i)+"loaded",0);
	        fla.trade_goods=ini_read_string("Fleet","ef"+string(i)+"trade","");
	        fla.guardsmen=ini_read_real("Fleet","guardsmen"+string(i)+"guardsmen",0);
	        fla.orbiting=ini_read_real("Fleet","ef"+string(i)+"orb",0);
	        fla.navy=ini_read_real("Fleet","ef"+string(i)+"navy",0);
	        fla.guardsmen_unloaded=ini_read_real("Fleet","ef"+string(i)+"unl",0);

	        if (fla.navy=1){var e;e=-1;
	            repeat(20){e+=1;
	                fla.capital_imp[e]=ini_read_real("Fleet","ef"+string(i)+"navy_cap."+string(e),0);
	                fla.capital_max_imp[e]=ini_read_real("Fleet","ef"+string(i)+"navy_cap_max."+string(e),0);
	            }
	            e=-1;
	            repeat(30){e+=1;
	                fla.frigate_imp[e]=ini_read_real("Fleet","ef"+string(i)+"navy_fri."+string(e),0);
	                fla.frigate_max_imp[e]=ini_read_real("Fleet","ef"+string(i)+"navy_fri_max."+string(e),0);
	                fla.escort_imp[e]=ini_read_real("Fleet","ef"+string(i)+"navy_esc."+string(e),0);
	                fla.escort_max_imp[e]=ini_read_real("Fleet","ef"+string(i)+"navy_esc_max."+string(e),0);
	            }
	        }

	    }
	    with(obj_en_fleet){if (owner=0) then instance_destroy();}
	    ini_close();
	}

	if (argument0=5) or (argument0=0){
	    ini_open("tsave.ini");
	    // file_delete("tsave.ini");

	    var i;i=0;
	    obj_controller.restart_name=ini_read_string("Res","nm","");
	    obj_controller.restart_founding=ini_read_real("Res","found",0);
	    obj_controller.restart_secret=ini_read_string("Res","secre","");
	    obj_controller.restart_title[0]=ini_read_string("Res","tit0","");
	    var i;i=0;repeat(11){i+=1;obj_controller.restart_title[i]=ini_read_string("Res","tit"+string(i),"");}
	    obj_controller.restart_icon=ini_read_real("Res","ico",0);
	    obj_controller.restart_icon_name=ini_read_string("Res","icn","");
	    obj_controller.restart_powers=ini_read_string("Res","power","");
	    var ad;ad=-1;repeat(5){ad+=1;obj_controller.restart_adv[ad]=ini_read_string("Res","adv"+string(ad),"");obj_controller.restart_dis[ad]=ini_read_string("Res","dis"+string(ad),"");}
	    obj_controller.restart_recruiting_type=ini_read_string("Res","rcrtyp","");
	    obj_controller.restart_trial=ini_read_string("Res","trial","");
	    obj_controller.restart_recruiting_name=ini_read_string("Res","rcrnam","");
	    obj_controller.restart_home_type=ini_read_string("Res","homtyp","");
	    obj_controller.restart_home_name=ini_read_string("Res","homnam","");
	    obj_controller.restart_flagship_name=ini_read_string("Res","flagship","");
	    obj_controller.restart_fleet_type=ini_read_real("Res","flit",0);
	    obj_controller.restart_recruiting_exists=ini_read_real("Res","recr_e",0);
	    obj_controller.restart_homeworld_exists=ini_read_real("Res","home_e",0);
	    obj_controller.restart_homeworld_rule=ini_read_real("Res","home_r",0);
	    obj_controller.restart_battle_cry=ini_read_string("Res","cry","");


	    with(obj_controller){
	        scr_colors_initialize();
	        scr_shader_initialize();
	    }

	    var tempa,tempa2,q,good;tempa="";tempa2=0;q=0;good=0;

	    tempa=ini_read_string("Res","maincol","");
	    tempa2=0;q=0;good=0;repeat(30){q+=1;if (tempa=obj_controller.col[q]) and (good=0){good=q;tempa2=q;}}
	    obj_controller.restart_main_color=tempa2;

	    tempa=ini_read_string("Res","seccol","");
	    tempa2=0;q=0;good=0;repeat(30){q+=1;if (tempa=obj_controller.col[q]) and (good=0){good=q;tempa2=q;}}
	    obj_controller.restart_secondary_color=tempa2;

	    tempa=ini_read_string("Res","tricol","");
	    tempa2=0;q=0;good=0;repeat(30){q+=1;if (tempa=obj_controller.col[q]) and (good=0){good=q;tempa2=q;}}
	    obj_controller.restart_trim_color=tempa2;

	    tempa=ini_read_string("Res","paul2col","");
	    tempa2=0;q=0;good=0;repeat(30){q+=1;if (tempa=obj_controller.col[q]) and (good=0){good=q;tempa2=q;}}
	    obj_controller.restart_pauldron2_color=tempa2;

	    tempa=ini_read_string("Res","paul1col","");
	    tempa2=0;q=0;good=0;repeat(30){q+=1;if (tempa=obj_controller.col[q]) and (good=0){good=q;tempa2=q;}}
	    obj_controller.restart_pauldron_color=tempa2;

	    tempa=ini_read_string("Res","lenscol","");
	    tempa2=0;q=0;good=0;repeat(30){q+=1;if (tempa=obj_controller.col[q]) and (good=0){good=q;tempa2=q;}}
	    obj_controller.restart_lens_color=tempa2;

	    tempa=ini_read_string("Res","wepcol","");
	    tempa2=0;q=0;good=0;repeat(30){q+=1;if (tempa=obj_controller.col[q]) and (good=0){good=q;tempa2=q;}}
	    obj_controller.restart_weapon_color=tempa2;

	    //

	    obj_controller.restart_col_special=ini_read_real("Res","speccol",0);
	    obj_controller.restart_trim=ini_read_real("Res","trim",0);
	    obj_controller.restart_skin_color=ini_read_real("Res","skin",0);
	    obj_controller.restart_hapothecary=ini_read_string("Res","hapo","");
	    obj_controller.restart_hchaplain=ini_read_string("Res","hcha","");
	    obj_controller.restart_clibrarian=ini_read_string("Res","clib","");
	    obj_controller.restart_fmaster=ini_read_string("Res","fmas","");
	    obj_controller.restart_recruiter=ini_read_string("Res","recruiter","");
	    obj_controller.restart_admiral=ini_read_string("Res","admir","");
	    obj_controller.restart_equal_specialists=ini_read_real("Res","eqspec",0);
		if (ini_read_string("Res","load2",0)!= 0){
			 obj_controller.restart_load_to_ships = json_parse(base64_decode(ini_read_string("Res","load2",0)));
		} else { obj_controller.restart_load_to_ships=[0,0,0]}
	    obj_controller.restart_successors=ini_read_string("Res","successors",0);

	    obj_controller.restart_mutations=ini_read_real("Res","muta",0);
	    obj_controller.restart_preomnor=ini_read_real("Res","preo",0);
	    obj_controller.restart_voice=ini_read_real("Res","voic",0);
	    obj_controller.restart_doomed=ini_read_real("Res","doom",0);
	    obj_controller.restart_lyman=ini_read_real("Res","lyma",0);
	    obj_controller.restart_omophagea=ini_read_real("Res","omop",0);
	    obj_controller.restart_ossmodula=ini_read_real("Res","ossm",0);
	    obj_controller.restart_membrane=ini_read_real("Res","memb",0);
	    obj_controller.restart_zygote=ini_read_real("Res","zygo",0);
	    obj_controller.restart_betchers=ini_read_real("Res","betc",0);
	    obj_controller.restart_catalepsean=ini_read_real("Res","catal",0);
	    obj_controller.restart_secretions=ini_read_real("Res","secr",0);
	    obj_controller.restart_occulobe=ini_read_real("Res","occu",0);
	    obj_controller.restart_mucranoid=ini_read_real("Res","mucra",0);
	    obj_controller.restart_master_name=ini_read_string("Res","master_name","");
	    obj_controller.restart_master_melee=ini_read_real("Res","master_melee",0);
	    obj_controller.restart_master_ranged=ini_read_real("Res","master_ranged",0);
	    obj_controller.restart_master_specialty=ini_read_real("Res","master_specialty",0);
	    obj_controller.restart_strength=ini_read_real("Res","strength",0);
	    obj_controller.restart_cooperation=ini_read_real("Res","cooperation",0);
	    obj_controller.restart_purity=ini_read_real("Res","purity",0);
	    obj_controller.restart_stability=ini_read_real("Res","stability",0);
	    obj_controller.squads = false;

	    i=99;
	    repeat(3){i+=1;
	         var o;o=1;
	         repeat(14){o+=1;
	            if (o=11) then o=12;
	            if (o=13) then o=14;

	            obj_controller.r_race[i,o]=ini_read_real("Res","r_race"+string(i)+"."+string(o),0);
	            obj_controller.r_role[i,o]=ini_read_string("Res","r_role"+string(i)+"."+string(o),"");
	            obj_controller.r_wep1[i,o]=ini_read_string("Res","r_wep1"+string(i)+"."+string(o),"");
	            obj_controller.r_wep2[i,o]=ini_read_string("Res","r_wep2"+string(i)+"."+string(o),"");
	            obj_controller.r_armour[i,o]=ini_read_string("Res","r_armour"+string(i)+"."+string(o),"");
	            obj_controller.r_mobi[i,o]=ini_read_string("Res","r_mobi"+string(i)+"."+string(o),"");
	            obj_controller.r_gear[i,o]=ini_read_string("Res","r_gear"+string(i)+"."+string(o),"");
	         }
	    }// 100 is defaults, 101 is the allowable starting equipment

	    ini_close();






	    with(obj_en_fleet){
	        if (owner = eFACTION.Imperium) and (string_count("colon",trade_goods)=0) then sprite_index=spr_fleet_imperial;
	        if (owner = eFACTION.Imperium) and (string_count("colon",trade_goods)>0) then sprite_index=spr_fleet_civilian;
	        if (owner = eFACTION.Mechanicus) then sprite_index=spr_fleet_mechanicus;
	        if (owner  = eFACTION.Inquisition) and (string_count("_fleet",trade_goods)>0) and (target>0){
	            target=instance_nearest(target_x,target_y,obj_p_fleet);
	        }
	        if (owner  = eFACTION.Inquisition) then sprite_index=spr_fleet_inquisition;
	        if (owner = eFACTION.Eldar) then sprite_index=spr_fleet_eldar;
	        if (owner = eFACTION.Ork) then sprite_index=spr_fleet_ork;
	        if (owner = eFACTION.Tau) then sprite_index=spr_fleet_tau;
	        if (owner = eFACTION.Tyranids) then sprite_index=spr_fleet_tyranid;
	        if (owner = eFACTION.Chaos) then sprite_index=spr_fleet_chaos;
	        image_speed=0;
	    }



	    if (file_exists("save"+string(argument1)+"log.ini")){
	        // ini_open("save"+string(argument1)+"log.ini");
	        ini_open("tsave.ini");

	        var g,bobby,bobby2,stars;bobby="";bobby2="";g=0;
	        stars=ini_read_real("Save","stars",0);
	        bobby+=string(stars)+"|";
	        bobby+=string(global.chapter_name)+"|";
	        bobby+=string(obj_ini.sector_name)+"|";
	        bobby+=string(obj_controller.turn)+"|";
	        g=ini_read_real("Save","sod",0);
	        ini_close();file_delete("tsave.ini");
	        bobby+=string(g)+"|";

	        ini_open("save"+string(argument1)+"log.ini");
	        bobby2=string(ini_read_real("Main","data1",random(500)))+"|";
	        bobby2+=ini_read_string("Main","data2","error")+"|";
	        bobby2+=ini_read_string("Main","data3","error")+"|";
	        bobby2+=string(ini_read_real("Main","data4",random(500)))+"|";
	        bobby2+=string(ini_read_real("Main","data5",random(500)))+"|";

	        // show_message(string(bobby)+" - "+string(bobby2));
	        // window_set_fullscreen(true);

	        if (bobby=bobby2) then obj_controller.good_log=1;
	        instance_create(-100,-100,obj_event_log);

	        with(obj_all_fleet){
	            alarm[11]=10;
	        }

	        ini_close();
	    }

	    obj_saveload.alarm[1]=30;
	    obj_controller.invis=false;
	    global.load=0;
	    debugl("Loading slot "+string(argument1)+" completed");
	}


}
