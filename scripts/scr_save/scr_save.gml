function scr_save(argument0, argument1) {

	var num, tot;
	num=0;tot=0;

	num=instance_number(obj_star);
	instance_array[tot]=0;


	// if (file_exists("save1.ini")) then file_delete("save1.ini");
	// argument 0 = the part of the save to do
	// argument1 = the save ID

	if (argument0=1) or (argument0=0){debugl("Saving to slot "+string(argument1));
	    ini_open("save"+string(argument1)+".ini");
    
	    // Global variables
	    ini_write_string("Save","chapter_name",global.chapter_name);
	    ini_write_string("Save","sector_name",obj_ini.sector_name);
	    ini_write_real("Save","version",global.version);
	    ini_write_real("Save","play_time",play_time);
	    ini_write_real("Save","game_seed",global.game_seed);
	    ini_write_real("Save","use_custom_icon",obj_ini.use_custom_icon);
    
	    var t,month,day,year,hour,minute,pm;
	    t=date_current_datetime();
	    month=date_get_month(t);
	    day=date_get_day(t);
	    year=date_get_year(t);
	    hour=date_get_hour(t);
	    minute=date_get_minute(t);
	    pm="AM";
	    if (hour=12) then pm="PM";
	    if (hour>12) and (hour<24){pm="PM";hour-=12;}
	    if (hour=24){pm="AM";hour-=12;}
	    if (hour=0) then hour=12;
    
	    var mahg;mahg=minute;
	    if (mahg<10) then minute="0"+string(mahg);
    
	    // if (minute<10) then minute="0"+string(minute);
    
	    ini_write_string("Save","date",string(month)+"/"+string(day)+"/"+string(year)+" ("+string(hour)+":"+string(minute)+" "+string(pm)+")");
	    ini_write_real("Save","founding",obj_ini.progenitor);
	    // ini_write_string("Save","founding_secret",global.founding_secret);
	    ini_write_real("Save","custom",global.custom);
	    ini_write_real("Save","stars",instance_number(obj_star));
	    ini_write_real("Save","p_fleets",instance_number(obj_p_fleet));
	    ini_write_real("Save","en_fleets",instance_number(obj_en_fleet));
	    ini_write_real("Save","sod",random_get_seed());
	    ini_write_real("Save","corrupt",1);
    
	    // obj_controller variables here
	    ini_write_real("Controller","cheatyface",obj_controller.cheatyface);
	    ini_write_real("Controller","x",obj_controller.x);
	    ini_write_real("Controller","y",obj_controller.y);
	    ini_write_real("Controller","alll",obj_controller.alll);
	    ini_write_real("Controller","was_zoomed",obj_controller.was_zoomed);
	    ini_write_real("Controller","zoomed",obj_controller.zoomed);
	    ini_write_real("Controller","chaos_rating",obj_controller.chaos_rating);
	    ini_write_string("Controller","fleet_type",obj_controller.fleet_type);
	    ini_write_real("Controller","ifleet_type",obj_ini.fleet_type);
	    ini_write_real("Controller","home_rule",obj_controller.homeworld_rule);
	    ini_write_string("Controller","star_names",obj_controller.star_names);
	    ini_write_real("Controller","craworld",obj_controller.craftworld);
	    ini_write_real("Controller","turn",obj_controller.turn);
	    ini_write_real("Controller","last_event",obj_controller.last_event);
	    ini_write_real("Controller","last_mission",obj_controller.last_mission);
	    ini_write_real("Controller","last_world_inspection",obj_controller.last_world_inspection);
	    ini_write_real("Controller","last_fleet_inspection",obj_controller.last_fleet_inspection);
	    ini_write_real("Controller","chaos_turn",obj_controller.chaos_turn);
	    ini_write_real("Controller","chaos_fleets",obj_controller.chaos_fleets);
	    ini_write_real("Controller","tau_fleets",obj_controller.tau_fleets);
	    ini_write_real("Controller","tau_stars",obj_controller.tau_stars);
	    ini_write_real("Controller","tau_messenger",obj_controller.tau_messenger);
	    ini_write_real("Controller","fleet_all",obj_controller.fleet_all);
	    ini_write_real("Controller","tolerant",obj_ini.tolerant);
	    ini_write_real("Controller","unload",obj_controller.unload);
	    ini_write_real("Controller","diplomacy",obj_controller.diplomacy);
	    ini_write_real("Controller","trading",obj_controller.trading);
	    ini_write_real("Controller","audience",obj_controller.audience);
	    ini_write_real("Controller","force_goodbye",obj_controller.force_goodbye);
	    ini_write_real("Controller","combat",obj_controller.combat);
	    ini_write_real("Controller","new_vehicles",obj_controller.new_vehicles);
	    ini_write_real("Controller","hurssy",obj_controller.hurssy);
	    ini_write_real("Controller","hurssy_time",obj_controller.hurssy_time);
	    ini_write_real("Controller","artifacts",obj_controller.artifacts);
	    ini_write_real("Controller","pmc",obj_controller.popup_master_crafted);
	    ini_write_real("Controller","wndsel",obj_controller.select_wounded);
	    ini_write_real("Controller","imdis",obj_ini.imperium_disposition);
	    ini_write_real("Controller","terra_dir",obj_controller.terra_direction);
	        ini_write_real("Controller","stc_wargear",obj_controller.stc_wargear);
	        ini_write_real("Controller","stc_vehicles",obj_controller.stc_vehicles);
	        ini_write_real("Controller","stc_ships",obj_controller.stc_ships);
	        ini_write_real("Controller","stc_un_total",obj_controller.stc_un_total);
	        ini_write_real("Controller","stc_wargear_un",obj_controller.stc_wargear_un);
	        ini_write_real("Controller","stc_vehicles_un",obj_controller.stc_vehicles_un);
	        ini_write_real("Controller","stc_ships_un",obj_controller.stc_ships_un);
	    var j;j=0;repeat(6){j+=1;ini_write_real("Controller","stc_bonus_"+string(j),obj_controller.stc_bonus[j]);}
    
	    j=0;repeat(4){j+=1;
	        ini_write_string("Controller","adv"+string(j),obj_ini.adv[j]);
	        ini_write_string("Controller","dis"+string(j),obj_ini.dis[j]);
	    }
    
    
    
	    // Player scheduled event
	    if (obj_controller.fest_type!=""){
	        ini_write_real("Controller","f_si",obj_controller.fest_sid);
	        ini_write_real("Controller","f_wi",obj_controller.fest_wid);
	        ini_write_real("Controller","f_pl",obj_controller.fest_planet);
	        ini_write_string("Controller","f_st",obj_controller.fest_star);
	        ini_write_string("Controller","f_t",obj_controller.fest_type);
	        ini_write_real("Controller","f_co",obj_controller.fest_cost);
	        ini_write_real("Controller","f_wa",obj_controller.fest_warp);
	        ini_write_real("Controller","f_sch",obj_controller.fest_scheduled);
	        ini_write_real("Controller","f_la",obj_controller.fest_lav);
	        ini_write_real("Controller","f_lo",obj_controller.fest_locals);
	        ini_write_real("Controller","f_f1",obj_controller.fest_feature1);
	        ini_write_real("Controller","f_f2",obj_controller.fest_feature2);
	        ini_write_real("Controller","f_f3",obj_controller.fest_feature3);
	        ini_write_real("Controller","f_di",obj_controller.fest_display);
	        ini_write_string("Controller","f_dit",obj_controller.fest_display_tags);
	        ini_write_real("Controller","f_re",obj_controller.fest_repeats);
	        ini_write_real("Controller","f_hc",obj_controller.fest_honor_co);
	        ini_write_real("Controller","f_hi",obj_controller.fest_honor_id);
	        ini_write_real("Controller","f_hon",obj_controller.fest_honoring);
	    }
	    ini_write_real("Controller","f_fee",obj_controller.fest_feasts);
	    ini_write_real("Controller","f_boo",obj_controller.fest_boozes);
	    ini_write_real("Controller","f_dru",obj_controller.fest_drugses);
	    ini_write_real("Controller","rech",obj_controller.recent_happenings);
	    var i;i=-1;
	    repeat(600){i+=1;
	        if (recent_type[i]!=""){
	            ini_write_string("Controller","rect"+string(i),obj_controller.recent_type[i]);
	            ini_write_string("Controller","reck"+string(i),obj_controller.recent_keyword[i]);
	            ini_write_real("Controller","recu"+string(i),obj_controller.recent_turn[i]);
	            ini_write_real("Controller","recn"+string(i),obj_controller.recent_number[i]);
	        }
	    }
    
    
    
	    ini_write_real("Formation","last_attack",obj_controller.last_attack_form);
	    ini_write_real("Formation","last_raid",obj_controller.last_raid_form);
	    j=0;repeat(14){j+=1;
	        if (obj_controller.bat_formation[j]!=""){
	            ini_write_string("Formation","form"+string(j),obj_controller.bat_formation[j]);
	            ini_write_real("Formation","form_type"+string(j),obj_controller.bat_formation_type[j]);
	            ini_write_real("Formation","deva"+string(j),obj_controller.bat_deva_for[j]);
	            ini_write_real("Formation","assa"+string(j),obj_controller.bat_assa_for[j]);
	            ini_write_real("Formation","tact"+string(j),obj_controller.bat_tact_for[j]);
	            ini_write_real("Formation","vete"+string(j),obj_controller.bat_vete_for[j]);
	            ini_write_real("Formation","hire"+string(j),obj_controller.bat_hire_for[j]);
	            ini_write_real("Formation","libr"+string(j),obj_controller.bat_libr_for[j]);
	            ini_write_real("Formation","comm"+string(j),obj_controller.bat_comm_for[j]);
	            ini_write_real("Formation","tech"+string(j),obj_controller.bat_tech_for[j]);
	            ini_write_real("Formation","term"+string(j),obj_controller.bat_term_for[j]);
	            ini_write_real("Formation","hono"+string(j),obj_controller.bat_hono_for[j]);
	            ini_write_real("Formation","drea"+string(j),obj_controller.bat_drea_for[j]);
	            ini_write_real("Formation","rhin"+string(j),obj_controller.bat_rhin_for[j]);
	            ini_write_real("Formation","pred"+string(j),obj_controller.bat_pred_for[j]);
	            ini_write_real("Formation","land"+string(j),obj_controller.bat_land_for[j]);
	            ini_write_real("Formation","scou"+string(j),obj_controller.bat_scou_for[j]);
	        }
	    }
    
    
	    ini_write_string("Controller","random_event_next",obj_controller.random_event_next);
	    ini_write_string("Controller","useful_info",obj_controller.useful_info);
	    ini_write_real("Controller","gene_sold",obj_controller.gene_sold);
	    ini_write_real("Controller","gene_xeno",obj_controller.gene_xeno);
	    ini_write_real("Controller","gene_tithe",obj_controller.gene_tithe);
	    ini_write_real("Controller","gene_iou",obj_controller.gene_iou);
    
	    ini_write_real("Controller","und_armories",obj_controller.und_armories);
	    ini_write_real("Controller","und_gene_vaults",obj_controller.und_gene_vaults);
	    ini_write_real("Controller","und_lairs",obj_controller.und_lairs);
    
	    // 
	    ini_write_real("Controller","penitent",obj_controller.penitent);
	    ini_write_real("Controller","penitent_current",obj_controller.penitent_current);
	    ini_write_real("Controller","penitent_max",obj_controller.penitent_max);
	    ini_write_real("Controller","penitent_turnly",obj_controller.penitent_turnly);
	    ini_write_real("Controller","penitent_turn",obj_controller.penitent_turn);
	    ini_write_real("Controller","penitent_end",obj_controller.penitent_end);
	    ini_write_real("Controller","penitent_blood",obj_controller.blood_debt);
	    // 
	    ini_write_real("Controller","training_apothecary",obj_controller.training_apothecary);
	    ini_write_real("Controller","apothecary_points",obj_controller.apothecary_points);
	    ini_write_real("Controller","apothecary_aspirant",obj_controller.apothecary_aspirant);
	    ini_write_real("Controller","training_chaplain",obj_controller.training_chaplain);
	    ini_write_real("Controller","chaplain_points",obj_controller.chaplain_points);
	    ini_write_real("Controller","chaplain_aspirant",obj_controller.chaplain_aspirant);
	    ini_write_real("Controller","training_psyker",obj_controller.training_psyker);
	    ini_write_real("Controller","psyker_points",obj_controller.psyker_points);
	    ini_write_real("Controller","psyker_aspirant",obj_controller.psyker_aspirant);
	    ini_write_real("Controller","training_techmarine",obj_controller.training_techmarine);
	    ini_write_real("Controller","tech_points",obj_controller.tech_points);
	    ini_write_real("Controller","tech_aspirant",obj_controller.tech_aspirant);
    
	    ini_write_real("Controller","penitorium",obj_controller.penitorium);
    
	    ini_write_string("Controller","recruiting_worlds",obj_controller.recruiting_worlds);
	    ini_write_real("Controller","recruiting",obj_controller.recruiting);
	    ini_write_string("Controller","trial",obj_controller.recruit_trial);
	    ini_write_real("Controller","recruits",obj_controller.recruits);
	    ini_write_real("Controller","recruit_last",obj_controller.recruit_last);
	    // 
	    var g;g=-1;repeat(30){g+=1;
	        ini_write_real("Controller","command"+string(g),obj_controller.command_set[g]);
	    }
	    ini_write_real("Controller","blandify",obj_controller.blandify);
	    var g;g=-1;repeat(201){g+=1;
	        ini_write_string("Recruit","rcr"+string(g),obj_controller.recruit_name[g]);
	        ini_write_real("Recruit","rcr_cr"+string(g),obj_controller.recruit_corruption[g]);
	        ini_write_real("Recruit","rcr_ds"+string(g),obj_controller.recruit_distance[g]);
	        ini_write_real("Recruit","rcr_tr"+string(g),obj_controller.recruit_training[g]);
	        ini_write_real("Recruit","rcr_ex"+string(g),obj_controller.recruit_exp[g]);
	    }
	    var g;g=-1;repeat(30){g+=1;
	        ini_write_string("Controller","lyl"+string(g),obj_controller.loyal[g]);
	        ini_write_real("Controller","lyl_nm"+string(g),obj_controller.loyal_num[g]);
	        ini_write_real("Controller","lyl_tm"+string(g),obj_controller.loyal_time[g]);
	    }
	    var g;g=-1;repeat(11){g+=1;
	        ini_write_string("Controller","inq"+string(g),obj_controller.inquisitor[g]);
	        ini_write_real("Controller","inq_ge"+string(g),obj_controller.inquisitor_gender[g]);
	        ini_write_string("Controller","inq_ty"+string(g),obj_controller.inquisitor_type[g]);
	    }
	    // 
	    var g;g=-1;repeat(14){g+=1;
	        ini_write_string("Factions","fac"+string(g),obj_controller.faction[g]);
	        ini_write_real("Factions","dis"+string(g),obj_controller.disposition[g]);
	        ini_write_real("Factions","dis_max"+string(g),obj_controller.disposition_max[g]);
        
	        ini_write_string("Factions","lead"+string(g),obj_controller.faction_leader[g]);
	        ini_write_real("Factions","gen"+string(g),obj_controller.faction_gender[g]);
	        ini_write_string("Factions","title"+string(g),obj_controller.faction_title[g]);
	        ini_write_string("Factions","status"+string(g),obj_controller.faction_status[g]);
	        ini_write_real("Factions","defeated"+string(g),obj_controller.faction_defeated[g]);
	        ini_write_real("Factions","known"+string(g),known[g]);
        
	        ini_write_real("Factions","annoyed"+string(g),obj_controller.annoyed[g]);
	        ini_write_real("Factions","ignore"+string(g),obj_controller.ignore[g]);
	        ini_write_real("Factions","turns_ignored"+string(g),obj_controller.turns_ignored[g]);
        
	        ini_write_real("Factions","audience"+string(g),obj_controller.audien[g]);
	        ini_write_string("Factions","audience_topic"+string(g),obj_controller.audien_topic[g]);
	    }
	    // 
	    var g;g=0;
	    repeat(50){g+=1;
	        ini_write_string("Ongoing","quest"+string(g),obj_controller.quest[g]);
	        ini_write_real("Ongoing","quest_faction"+string(g),obj_controller.quest_faction[g]);
	        ini_write_real("Ongoing","quest_end"+string(g),obj_controller.quest_end[g]);
	    }
	    var g;g=0;
	    repeat(99){g+=1;
	        ini_write_string("Ongoing","event"+string(g),obj_controller.event[g]);
	        ini_write_real("Ongoing","event_duration"+string(g),obj_controller.event_duration[g]);
	    }
	    // 
	    ini_write_real("Controller","justmet",obj_controller.faction_justmet);
	    ini_write_real("Controller","check_number",obj_controller.check_number);
	    ini_write_real("Controller","year_fraction",obj_controller.year_fraction);
	    ini_write_real("Controller","year",obj_controller.year);
	    ini_write_real("Controller","millenium",obj_controller.millenium);
	    // 
	    ini_write_real("Controller","req",obj_controller.requisition);
	    // 
	    ini_write_real("Controller","income",obj_controller.income);
	    ini_write_real("Controller","income_last",obj_controller.income_last);
	    ini_write_real("Controller","income_base",obj_controller.income_base);
	    ini_write_real("Controller","income_home",obj_controller.income_home);
	    ini_write_real("Controller","income_forge",obj_controller.income_forge);
	    ini_write_real("Controller","income_agri",obj_controller.income_agri);
	    ini_write_real("Controller","income_recruiting",obj_controller.income_recruiting);
	    ini_write_real("Controller","income_training",obj_controller.income_training);
	    ini_write_real("Controller","income_fleet",obj_controller.income_fleet);
	    ini_write_real("Controller","income_trade",obj_controller.income_trade);
	    ini_write_real("Controller","loyalty",obj_controller.loyalty);
	    ini_write_real("Controller","loyalty_hidden",obj_controller.loyalty_hidden);
	        ini_write_real("Controller","flag_lair",obj_controller.inqis_flag_lair);
	        ini_write_real("Controller","flag_gene",obj_controller.inqis_flag_gene);
    
    
	    ini_write_real("Controller","gene_seed",obj_controller.gene_seed);
	    ini_write_real("Controller","marines",obj_controller.marines);
	    ini_write_real("Controller","command",obj_controller.command);
	    ini_write_real("Controller","info_chips",obj_controller.info_chips);
	    ini_write_real("Controller","inspection_passes",obj_controller.inspection_passes);
	    ini_write_real("Controller","recruiting_worlds_bought",obj_controller.recruiting_worlds_bought);
	    ini_write_real("Controller","lwt",obj_controller.last_weapons_tab);
    
	    ini_write_real("Controller","bat_devastator_column",obj_controller.bat_devastator_column);
	    ini_write_real("Controller","bat_assault_column",obj_controller.bat_assault_column);
	    ini_write_real("Controller","bat_tactical_column",obj_controller.bat_tactical_column);
	    ini_write_real("Controller","bat_veteran_column",obj_controller.bat_veteran_column);
	    ini_write_real("Controller","bat_hire_column",obj_controller.bat_hire_column);
	    ini_write_real("Controller","bat_librarian_column",obj_controller.bat_librarian_column);
	    ini_write_real("Controller","bat_command_column",obj_controller.bat_command_column);
	    ini_write_real("Controller","bat_techmarine_column",obj_controller.bat_techmarine_column);
	    ini_write_real("Controller","bat_terminator_column",obj_controller.bat_terminator_column);
	    ini_write_real("Controller","bat_honor_column",obj_controller.bat_honor_column);
	    ini_write_real("Controller","bat_dreadnought_column",obj_controller.bat_dreadnought_column);
	    ini_write_real("Controller","bat_rhino_column",obj_controller.bat_rhino_column);
	    ini_write_real("Controller","bat_predator_column",obj_controller.bat_predator_column);
	    ini_write_real("Controller","bat_landraider_column",obj_controller.bat_landraider_column);
	    ini_write_real("Controller","bat_scout_column",obj_controller.bat_scout_column);
    
	    ini_close();
	}
 


	if (argument0=2) or (argument0=0){debugl("Saving to slot "+string(argument1)+" part 2");
	    ini_open("save"+string(argument1)+".ini");
	    // Stars
    
	    var num;num=instance_number(obj_star);instance_array=0;
	    for (i=0; i<num; i+=1){
	        instance_array[i] = instance_find(obj_star,i);
	        // save crap here
	        ini_write_string("Star","sr"+string(i)+"name",instance_array[i].name);
	        ini_write_string("Star","sr"+string(i)+"star",instance_array[i].star);
	        ini_write_real("Star","sr"+string(i)+"planets",instance_array[i].planets);
	        ini_write_real("Star","sr"+string(i)+"owner",instance_array[i].owner);
        
	        ini_write_real("Star","sr"+string(i)+"x",instance_array[i].x);
	        ini_write_real("Star","sr"+string(i)+"y",instance_array[i].y);
	        ini_write_real("Star","sr"+string(i)+"x2",instance_array[i].x2);
	        ini_write_real("Star","sr"+string(i)+"y2",instance_array[i].y2);
	        ini_write_real("Star","sr"+string(i)+"ox",instance_array[i].old_x);
	        ini_write_real("Star","sr"+string(i)+"oy",instance_array[i].old_y);
        
	        ini_write_real("Star","sr"+string(i)+"vision",instance_array[i].vision);
	        ini_write_real("Star","sr"+string(i)+"storm",instance_array[i].storm);
	        ini_write_real("Star","sr"+string(i)+"trader",instance_array[i].trader);
	        ini_write_real("Star","sr"+string(i)+"craftworld",instance_array[i].craftworld);
	        ini_write_real("Star","sr"+string(i)+"spacehulk",instance_array[i].space_hulk);
        
	        var g;g=0;
	        repeat(4){g+=1;
	            if (instance_array[i].planets>=g){
	                ini_write_real("Star","sr"+string(i)+"plan"+string(g),instance_array[i].planet[g]);
	                ini_write_real("Star","sr"+string(i)+"dispo"+string(g),instance_array[i].dispo[g]);
	                ini_write_string("Star","sr"+string(i)+"type"+string(g),instance_array[i].p_type[g]);
	                ini_write_string("Star","sr"+string(i)+"feat"+string(g),instance_array[i].p_feature[g]);
	                ini_write_real("Star","sr"+string(i)+"own"+string(g),instance_array[i].p_owner[g]);
	                ini_write_real("Star","sr"+string(i)+"fir"+string(g),instance_array[i].p_first[g]);
	                ini_write_real("Star","sr"+string(i)+"popul"+string(g),instance_array[i].p_population[g]);
	                ini_write_real("Star","sr"+string(i)+"maxpop"+string(g),instance_array[i].p_max_population[g]);
	                ini_write_real("Star","sr"+string(i)+"large"+string(g),instance_array[i].p_large[g]);
	                ini_write_string("Star","sr"+string(i)+"pop"+string(g),instance_array[i].p_pop[g]);
	                ini_write_real("Star","sr"+string(i)+"guard"+string(g),instance_array[i].p_guardsmen[g]);
	                ini_write_real("Star","sr"+string(i)+"pdf"+string(g),instance_array[i].p_pdf[g]);
	                ini_write_real("Star","sr"+string(i)+"forti"+string(g),instance_array[i].p_fortified[g]);
	                ini_write_real("Star","sr"+string(i)+"stat"+string(g),instance_array[i].p_station[g]);
                
	                ini_write_real("Star","sr"+string(i)+"play"+string(g),instance_array[i].p_player[g]);
	                if (instance_array[i].p_first[g]=1) or (instance_array[i].p_owner[g]=1){
	                    ini_write_real("Star","sr"+string(i)+"p_lasers"+string(g),instance_array[i].p_lasers[g]);
	                    ini_write_real("Star","sr"+string(i)+"p_silo"+string(g),instance_array[i].p_silo[g]);
	                    ini_write_real("Star","sr"+string(i)+"p_defenses"+string(g),instance_array[i].p_defenses[g]);
	                }
	                ini_write_string("Star","sr"+string(i)+"upg"+string(g),instance_array[i].p_upgrades[g]);
                
	                ini_write_real("Star","sr"+string(i)+"or"+string(g),instance_array[i].p_orks[g]);
	                ini_write_real("Star","sr"+string(i)+"ta"+string(g),instance_array[i].p_tau[g]);
	                ini_write_real("Star","sr"+string(i)+"el"+string(g),instance_array[i].p_eldar[g]);
	                ini_write_real("Star","sr"+string(i)+"tr"+string(g),instance_array[i].p_traitors[g]);
	                ini_write_real("Star","sr"+string(i)+"ch"+string(g),instance_array[i].p_chaos[g]);
	                ini_write_real("Star","sr"+string(i)+"de"+string(g),instance_array[i].p_demons[g]);
	                ini_write_real("Star","sr"+string(i)+"si"+string(g),instance_array[i].p_sisters[g]);
	                ini_write_real("Star","sr"+string(i)+"ne"+string(g),instance_array[i].p_necrons[g]);
	                ini_write_real("Star","sr"+string(i)+"tyr"+string(g),instance_array[i].p_tyranids[g]);
	                    ini_write_real("Star","sr"+string(i)+"halp"+string(g),instance_array[i].p_halp[g]);
                
	                ini_write_real("Star","sr"+string(i)+"hurssy"+string(g),instance_array[i].p_hurssy[g]);
	                ini_write_real("Star","sr"+string(i)+"hurssy_time"+string(g),instance_array[i].p_hurssy_time[g]);
	                ini_write_real("Star","sr"+string(i)+"heresy"+string(g),instance_array[i].p_heresy[g]);
	                ini_write_real("Star","sr"+string(i)+"heresy_secret"+string(g),instance_array[i].p_heresy_secret[g]);
	                ini_write_real("Star","sr"+string(i)+"influence"+string(g),instance_array[i].p_influence[g]);
	                ini_write_real("Star","sr"+string(i)+"raided"+string(g),instance_array[i].p_raided[g]);

	                ini_write_string("Star","sr"+string(i)+"prob"+string(g)+".1",instance_array[i].p_problem[g,1]);
	                ini_write_real("Star","sr"+string(i)+"time"+string(g)+".1",instance_array[i].p_timer[g,1]);
                
	                ini_write_string("Star","sr"+string(i)+"prob"+string(g)+".2",instance_array[i].p_problem[g,2]);
	                ini_write_real("Star","sr"+string(i)+"time"+string(g)+".2",instance_array[i].p_timer[g,2]);
                
	                ini_write_string("Star","sr"+string(i)+"prob"+string(g)+".3",instance_array[i].p_problem[g,3]);
	                ini_write_real("Star","sr"+string(i)+"time"+string(g)+".3",instance_array[i].p_timer[g,3]);
                
	                ini_write_string("Star","sr"+string(i)+"prob"+string(g)+".4",instance_array[i].p_problem[g,4]);
	                ini_write_real("Star","sr"+string(i)+"time"+string(g)+".4",instance_array[i].p_timer[g,4]);
	            }
	        }
	    }
    
    
	    // Temporary artifact objects
	    ini_write_real("Controller","temp_arti",instance_number(obj_temp_arti));
	    num=instance_number(obj_temp_arti);instance_array=0;
	    for (i=0; i<num; i+=1){
	        instance_array[i] = instance_find(obj_temp_arti,i);
	        ini_write_real("Star","ar"+string(i)+"x",instance_array[i].x);
	        ini_write_real("Star","ar"+string(i)+"y",instance_array[i].y);
	    }
    
	    // PLAYER FLEET OBJECTS
	    num=0;tot=0;num=instance_number(obj_p_fleet);
	    instance_array[tot]=0;
    
	    for (i=0; i<num; i+=1){
	        instance_array[i] = instance_find(obj_p_fleet,i);
        
	        ini_write_real("Fleet","pf"+string(i)+"image",instance_array[i].image_index);
	        ini_write_real("Fleet","pf"+string(i)+"x",instance_array[i].x);
	        ini_write_real("Fleet","pf"+string(i)+"y",instance_array[i].y);
	        ini_write_real("Fleet","pf"+string(i)+"capitals",instance_array[i].capital_number);
	        ini_write_real("Fleet","pf"+string(i)+"frigates",instance_array[i].frigate_number);
	        ini_write_real("Fleet","pf"+string(i)+"escorts",instance_array[i].escort_number);
	        ini_write_real("Fleet","pf"+string(i)+"selected",instance_array[i].selected);
	        ini_write_real("Fleet","pf"+string(i)+"capital_hp",instance_array[i].capital_health);
	        ini_write_real("Fleet","pf"+string(i)+"frigate_hp",instance_array[i].frigate_health);
	        ini_write_real("Fleet","pf"+string(i)+"escort_hp",instance_array[i].escort_health);
	        ini_write_string("Fleet","pf"+string(i)+"action",instance_array[i].action);
	        ini_write_real("Fleet","pf"+string(i)+"action_x",instance_array[i].action_x);
	        ini_write_real("Fleet","pf"+string(i)+"action_y",instance_array[i].action_y);
	        ini_write_real("Fleet","pf"+string(i)+"action_spd",instance_array[i].action_spd);
	        ini_write_real("Fleet","pf"+string(i)+"action_eta",instance_array[i].action_eta);
	        ini_write_real("Fleet","pf"+string(i)+"connected",instance_array[i].connected);
	        ini_write_real("Fleet","pf"+string(i)+"acted",instance_array[i].acted);
	        ini_write_real("Fleet","pf"+string(i)+"hurssy",instance_array[i].hurssy);
	        ini_write_real("Fleet","pf"+string(i)+"hurssy_time",instance_array[i].hurssy_time);
	        ini_write_real("Fleet","pf"+string(i)+"orb",instance_array[i].orbiting);
	        var g;g=-1;repeat(10){g+=1;
	            ini_write_string("Fleet","pf"+string(i)+"capital"+string(g),instance_array[i].capital[g]);
	            ini_write_real("Fleet","pf"+string(i)+"capital_num"+string(g),instance_array[i].capital_num[g]);
	            ini_write_real("Fleet","pf"+string(i)+"capital_sel"+string(g),instance_array[i].capital_sel[g]);
	            ini_write_real("Fleet","pf"+string(i)+"capital_uid"+string(g),instance_array[i].capital_uid[g]);
	        }
	        g=-1;repeat(21){g+=1;
	            ini_write_string("Fleet","pf"+string(i)+"frigate"+string(g),instance_array[i].frigate[g]);
	            ini_write_real("Fleet","pf"+string(i)+"frigate_num"+string(g),instance_array[i].frigate_num[g]);
	            ini_write_real("Fleet","pf"+string(i)+"frigate_sel"+string(g),instance_array[i].frigate_sel[g]);
	            ini_write_real("Fleet","pf"+string(i)+"frigate_uid"+string(g),instance_array[i].frigate_uid[g]);
	        }
	        g=-1;repeat(35){g+=1;
	            ini_write_string("Fleet","pf"+string(i)+"escort"+string(g),instance_array[i].escort[g]);
	            ini_write_real("Fleet","pf"+string(i)+"escort_num"+string(g),instance_array[i].escort_num[g]);
	            ini_write_real("Fleet","pf"+string(i)+"escort_sel"+string(g),instance_array[i].escort_sel[g]);
	            ini_write_real("Fleet","pf"+string(i)+"escort_uid"+string(g),instance_array[i].escort_uid[g]);
	        }
	    }
    
	    // ENEMY FLEET OBJECTS
	    num=0;tot=0;num=instance_number(obj_en_fleet);
	    instance_array[tot]=0;
    
	    for (i=0; i<num; i+=1){
	        instance_array[i] = instance_find(obj_en_fleet,i);
	        ini_write_real("Fleet","ef"+string(i)+"owner",instance_array[i].owner);
	        ini_write_real("Fleet","ef"+string(i)+"x",instance_array[i].x);
	        ini_write_real("Fleet","ef"+string(i)+"y",instance_array[i].y);
	        ini_write_real("Fleet","ef"+string(i)+"sprite",instance_array[i].sprite_index);
	        ini_write_real("Fleet","ef"+string(i)+"image",instance_array[i].image_index);
	        ini_write_real("Fleet","ef"+string(i)+"alpha",instance_array[i].image_alpha);
	        ini_write_real("Fleet","ef"+string(i)+"capitals",instance_array[i].capital_number);
	        ini_write_real("Fleet","ef"+string(i)+"frigates",instance_array[i].frigate_number);
	        ini_write_real("Fleet","ef"+string(i)+"escorts",instance_array[i].escort_number);
	        ini_write_real("Fleet","ef"+string(i)+"selected",instance_array[i].selected);
	        ini_write_string("Fleet","ef"+string(i)+"action",instance_array[i].action);
	        ini_write_real("Fleet","ef"+string(i)+"action_x",instance_array[i].action_x);
	        ini_write_real("Fleet","ef"+string(i)+"action_y",instance_array[i].action_y);
	        ini_write_real("Fleet","ef"+string(i)+"home_x",instance_array[i].home_x);
	        ini_write_real("Fleet","ef"+string(i)+"home_y",instance_array[i].home_y);
        
	        ini_write_real("Fleet","ef"+string(i)+"target",instance_array[i].target);
	        ini_write_real("Fleet","ef"+string(i)+"target_x",instance_array[i].target_x);
	        ini_write_real("Fleet","ef"+string(i)+"target_y",instance_array[i].target_y);
        
	        ini_write_real("Fleet","ef"+string(i)+"action_spd",instance_array[i].action_spd);
	        ini_write_real("Fleet","ef"+string(i)+"action_eta",instance_array[i].action_eta);
	        ini_write_real("Fleet","ef"+string(i)+"connected",instance_array[i].connected);
	        ini_write_real("Fleet","ef"+string(i)+"loaded",instance_array[i].loaded);
	        ini_write_string("Fleet","ef"+string(i)+"trade",instance_array[i].trade_goods);
	        ini_write_real("Fleet","ef"+string(i)+"guardsmen",instance_array[i].guardsmen);
	        ini_write_real("Fleet","ef"+string(i)+"orb",instance_array[i].orbiting);
	        ini_write_real("Fleet","ef"+string(i)+"navy",instance_array[i].navy);
	        ini_write_real("Fleet","ef"+string(i)+"unl",instance_array[i].guardsmen_unloaded);
        
	        if (instance_array[i].navy=1){var e;e=-1;
	            repeat(20){e+=1;
	                ini_write_real("Fleet","ef"+string(i)+"navy_cap."+string(e),instance_array[i].capital_imp[e]);
	                ini_write_real("Fleet","ef"+string(i)+"navy_cap_max."+string(e),instance_array[i].capital_max_imp[e]);
	            }
	            e=-1;
	            repeat(30){e+=1;
	                ini_write_real("Fleet","ef"+string(i)+"navy_fri."+string(e),instance_array[i].frigate_imp[e]);
	                ini_write_real("Fleet","ef"+string(i)+"navy_fri_max."+string(e),instance_array[i].frigate_max_imp[e]);
	                ini_write_real("Fleet","ef"+string(i)+"navy_esc."+string(e),instance_array[i].escort_imp[e]);
	                ini_write_real("Fleet","ef"+string(i)+"navy_esc_max."+string(e),instance_array[i].escort_max_imp[e]);
	            }
	        }
	    }

	    // obj_ini
	    ini_write_string("Ini","home_name",obj_ini.home_name);
	    ini_write_string("Ini","home_type",obj_ini.home_type);
	    ini_write_string("Ini","recruiting_name",obj_ini.recruiting_name);
	    ini_write_string("Ini","recruiting_type",obj_ini.recruiting_type);
	    ini_write_string("Ini","chapter_name",obj_ini.chapter_name);
	    // ini_write_string("Ini","fortress_name",obj_ini.fortress_name);
	    ini_write_string("Ini","flagship_name",obj_ini.flagship_name);
	    ini_write_real("Ini","icon",obj_ini.icon);
	    ini_write_string("Ini","icon_name",obj_ini.icon_name);
	    ini_write_real("Ini","man_size",obj_ini.man_size);
	    ini_write_string("Ini","strin1",obj_ini.strin);
	    ini_write_string("Ini","strin2",obj_ini.strin2);
	    ini_write_string("Ini","psy_powers",obj_ini.psy_powers);
    
	    ini_write_real("Ini","companies",obj_ini.companies);
	    var i;i=-1;repeat(21){i+=1;ini_write_string("Ini","comp_title"+string(i),obj_ini.company_title[i]);}
	    var i;i=-1;repeat(121){i+=1;ini_write_real("Ini","slave_num_"+string(i),obj_ini.slave_batch_num[i]);ini_write_real("Ini","slave_eta_"+string(i),obj_ini.slave_batch_eta[i]);}
    
	    ini_write_string("Ini","battle_cry",obj_ini.battle_cry);
    
	    ini_write_string("Controller","main_color",obj_controller.col[obj_controller.main_color]);
	    ini_write_string("Controller","secondary_color",obj_controller.col[obj_controller.secondary_color]);
	    ini_write_string("Controller","trim_color",obj_controller.col[obj_controller.trim_color]);
	    ini_write_string("Controller","pauldron2_color",obj_controller.col[obj_controller.pauldron2_color]);
	    ini_write_string("Controller","pauldron_color",obj_controller.col[obj_controller.pauldron_color]);
	    ini_write_string("Controller","lens_color",obj_controller.col[obj_controller.lens_color]);
	    ini_write_string("Controller","weapon_color",obj_controller.col[obj_controller.weapon_color]);
	    ini_write_real("Controller","col_special",obj_controller.col_special);
	    ini_write_real("Controller","trimmed",obj_controller.trim);
	    ini_write_real("Controller","skin_color",obj_ini.skin_color);
    
	    ini_write_string("Ini","adept_name",obj_controller.adept_name);
	    ini_write_string("Ini","recruiter_name",obj_controller.recruiter_name);
	    // ini_write_string("Ini","progenitor",obj_controller.progenitor);
	    ini_write_string("Ini","mutation",obj_controller.mutation);
	    ini_write_real("Ini","successors",obj_controller.successor_chapters);
	    ini_write_real("Ini","progenitor_disposition",obj_controller.progenitor_disposition);
	    ini_write_real("Ini","imperium_disposition",obj_controller.imperium_disposition);
	    ini_write_real("Ini","astartes_disposition",obj_controller.astartes_disposition);
    
	    ini_write_real("Ini","master_autarch",obj_ini.master_autarch);
	    ini_write_real("Ini","master_avatar",obj_ini.master_avatar);
	    ini_write_real("Ini","master_farseer",obj_ini.master_farseer);
	    ini_write_real("Ini","master_aspect",obj_ini.master_aspect);
	    ini_write_real("Ini","master_eldar",obj_ini.master_eldar);
	    ini_write_real("Ini","master_eldar_vehicles",obj_ini.master_eldar_vehicles);
	    ini_write_real("Ini","master_tau",obj_ini.master_tau);
	    ini_write_real("Ini","master_battlesuits",obj_ini.master_battlesuits);
	    ini_write_real("Ini","master_kroot",obj_ini.master_kroot);
	    ini_write_real("Ini","master_tau_vehicles",obj_ini.master_tau_vehicles);
	    ini_write_real("Ini","master_ork_boyz",obj_ini.master_ork_boyz);
	    ini_write_real("Ini","master_ork_nobz",obj_ini.master_ork_nobz);
	    ini_write_real("Ini","master_ork_warboss",obj_ini.master_ork_warboss);
	    ini_write_real("Ini","master_ork_vehicles",obj_ini.master_ork_vehicles);
	    ini_write_real("Ini","master_heretics",obj_ini.master_heretics);
	    ini_write_real("Ini","master_chaos_marines",obj_ini.master_chaos_marines);
	    ini_write_real("Ini","master_lesser_demons",obj_ini.master_lesser_demons);
	    ini_write_real("Ini","master_greater_demons",obj_ini.master_greater_demons);
	    ini_write_real("Ini","master_chaos_vehicles",obj_ini.master_chaos_vehicles);
	    ini_write_real("Ini","master_gaunts",obj_ini.master_gaunts);
	    ini_write_real("Ini","master_warriors",obj_ini.master_warriors);
	    ini_write_real("Ini","master_carnifex",obj_ini.master_carnifex);
	    ini_write_real("Ini","master_synapse",obj_ini.master_synapse);
	    ini_write_real("Ini","master_tyrant",obj_ini.master_tyrant);
	    ini_write_real("Ini","master_gene",obj_ini.master_gene);
	    ini_write_real("Ini","master_necron_overlord",obj_ini.master_necron_overlord);
	    ini_write_real("Ini","master_destroyer",obj_ini.master_destroyer);
	    ini_write_real("Ini","master_necron",obj_ini.master_necron);
	    ini_write_real("Ini","master_wraith",obj_ini.master_wraith);
	    ini_write_real("Ini","master_necron_vehicles",obj_ini.master_necron_vehicles);
	    ini_write_real("Ini","master_monolith",obj_ini.master_monolith);
	    ini_write_string("Ini","master_special",obj_ini.master_special_killed);
    
    
	    // 
	    ini_write_real("Ini","preomnor",obj_ini.preomnor);
	    ini_write_real("Ini","voice",obj_ini.voice);
	    ini_write_real("Ini","doomed",obj_ini.doomed);
	    ini_write_real("Ini","lyman",obj_ini.lyman);
	    ini_write_real("Ini","omophagea",obj_ini.omophagea);
	    ini_write_real("Ini","ossmodula",obj_ini.ossmodula);
	    ini_write_real("Ini","membrane",obj_ini.membrane);
	    ini_write_real("Ini","zygote",obj_ini.zygote);
	    ini_write_real("Ini","betchers",obj_ini.betchers);
	    ini_write_real("Ini","catalepsean",obj_ini.catalepsean);
	    ini_write_real("Ini","secretions",obj_ini.secretions);
	    ini_write_real("Ini","occulobe",obj_ini.occulobe);
	    ini_write_real("Ini","mucranoid",obj_ini.mucranoid);
	    // 
	    ini_write_string("Ini","master_name",obj_ini.master_name);
	    ini_write_string("Ini","chief_name",obj_ini.chief_librarian_name);
	    ini_write_string("Ini","high_name",obj_ini.high_chaplain_name);
	    ini_write_string("Ini","high2_name",obj_ini.high_apothecary_name);
	    ini_write_string("Ini","forgey_name",obj_ini.forge_master_name);
	    ini_write_string("Ini","lord_name",obj_ini.lord_admiral_name);
	    // 
	    var g;g=0;
	    repeat(150){g+=1;
	        if (obj_ini.equipment[g]!=""){
	            ini_write_string("Ini","equipment"+string(g),obj_ini.equipment[g]);
	            ini_write_string("Ini","equipment_type"+string(g),obj_ini.equipment_type[g]);
	            ini_write_real("Ini","equipment_number"+string(g),obj_ini.equipment_number[g]);
	            ini_write_real("Ini","equipment_condition"+string(g),obj_ini.equipment_condition[g]);
	        }
	        if (obj_ini.artifact[g]!=""){
	            ini_write_string("Ini","artifact"+string(g),obj_ini.artifact[g]);
	            ini_write_string("Ini","artifact_tags"+string(g),obj_ini.artifact_tags[g]);
	            ini_write_real("Ini","artifact_ident"+string(g),obj_ini.artifact_identified[g]);
	            ini_write_real("Ini","artifact_condition"+string(g),obj_ini.artifact_condition[g]);
	            ini_write_string("Ini","artifact_loc"+string(g),obj_ini.artifact_loc[g]);
	            ini_write_real("Ini","artifact_sid"+string(g),obj_ini.artifact_sid[g]);
	        }
	    }
	    // 
	    var g;g=0;repeat(200){g+=1;
	        ini_write_string("Ships","shi"+string(g),obj_ini.ship[g]);
	        ini_write_real("Ships","shi_uid"+string(g),obj_ini.ship_uid[g]);
	        ini_write_string("Ships","shi_class"+string(g),obj_ini.ship_class[g]);
        
	        ini_write_real("Ships","shi_size"+string(g),obj_ini.ship_size[g]);
	        ini_write_real("Ships","shi_leadership"+string(g),obj_ini.ship_leadership[g]);
	        ini_write_real("Ships","shi_hp"+string(g),obj_ini.ship_hp[g]);
	        ini_write_real("Ships","shi_maxhp"+string(g),obj_ini.ship_maxhp[g]);
	        ini_write_string("Ships","shi_location"+string(g),obj_ini.ship_location[g]);
	        ini_write_real("Ships","shi_shields"+string(g),obj_ini.ship_shields[g]);
	        ini_write_string("Ships","shi_conditions"+string(g),obj_ini.ship_conditions[g]);
	        ini_write_real("Ships","shi_speed"+string(g),obj_ini.ship_speed[g]);
	        ini_write_real("Ships","shi_turning"+string(g),obj_ini.ship_turning[g]);
	        ini_write_real("Ships","shi_front_ac"+string(g),obj_ini.ship_front_armor[g]);
	        ini_write_real("Ships","shi_other_ac"+string(g),obj_ini.ship_other_armor[g]);
	        ini_write_real("Ships","shi_weapons"+string(g),obj_ini.ship_weapons[g]);
	        // 
	        ini_write_string("Ships","shi"+string(g)+"wep1",obj_ini.ship_wep[g,1]);
	        ini_write_string("Ships","shi"+string(g)+"facing1",obj_ini.ship_wep_facing[g,1]);
	        ini_write_string("Ships","shi"+string(g)+"condition1",obj_ini.ship_wep_condition[g,1]);
	        // 
	        ini_write_string("Ships","shi"+string(g)+"wep2",obj_ini.ship_wep[g,2]);
	        ini_write_string("Ships","shi"+string(g)+"facing2",obj_ini.ship_wep_facing[g,2]);
	        ini_write_string("Ships","shi"+string(g)+"condition2",obj_ini.ship_wep_condition[g,2]);
	        // 
	        ini_write_string("Ships","shi"+string(g)+"wep3",obj_ini.ship_wep[g,3]);
	        ini_write_string("Ships","shi"+string(g)+"facing3",obj_ini.ship_wep_facing[g,3]);
	        ini_write_string("Ships","shi"+string(g)+"condition3",obj_ini.ship_wep_condition[g,3]);
	        // 
	        ini_write_string("Ships","shi"+string(g)+"wep4",obj_ini.ship_wep[g,4]);
	        ini_write_string("Ships","shi"+string(g)+"facing4",obj_ini.ship_wep_facing[g,4]);
	        ini_write_string("Ships","shi"+string(g)+"condition4",obj_ini.ship_wep_condition[g,4]);
	        // 
	        ini_write_string("Ships","shi"+string(g)+"wep5",obj_ini.ship_wep[g,5]);
	        ini_write_string("Ships","shi"+string(g)+"facing5",obj_ini.ship_wep_facing[g,5]);
	        ini_write_string("Ships","shi"+string(g)+"condition5",obj_ini.ship_wep_condition[g,5]);
	        // 
	        ini_write_real("Ships","shi_capacity"+string(g),obj_ini.ship_capacity[g]);
	        ini_write_real("Ships","shi_carrying"+string(g),obj_ini.ship_carrying[g]);
	        ini_write_string("Ships","shi_contents"+string(g),obj_ini.ship_contents[g]);
	        ini_write_real("Ships","shi_turrets"+string(g),obj_ini.ship_turrets[g]);
	    }
	    // the fun begins here
	    ini_close();
	}



	if (argument0=3) or (argument0=0){debugl("Saving to slot "+string(argument1)+" part 3");
	    ini_open("save"+string(argument1)+".ini");
	    var coh,mah,good;
	    good=0;coh=10;mah=100;
	    repeat(1000){
	        if (good=0){
	            mah-=1;
	            if (mah=0){mah=100;coh-=1;}
	            if (obj_ini.veh_role[coh,mah]!=""){
	                ini_write_real("Veh","co"+string(coh)+"."+string(mah),obj_ini.veh_race[coh,mah]);
	                ini_write_string("Veh","lo"+string(coh)+"."+string(mah),obj_ini.veh_loc[coh,mah]);
	                ini_write_string("Veh","rol"+string(coh)+"."+string(mah),obj_ini.veh_role[coh,mah]);
	                ini_write_real("Veh","lid"+string(coh)+"."+string(mah),obj_ini.veh_lid[coh,mah]);
	                ini_write_real("Veh","uid"+string(coh)+"."+string(mah),obj_ini.veh_uid[coh,mah]);
	                ini_write_real("Veh","wid"+string(coh)+"."+string(mah),obj_ini.veh_wid[coh,mah]);
                
	                ini_write_string("Veh","w1"+string(coh)+"."+string(mah),obj_ini.veh_wep1[coh,mah]);
	                ini_write_string("Veh","w2"+string(coh)+"."+string(mah),obj_ini.veh_wep2[coh,mah]);
	                ini_write_string("Veh","up"+string(coh)+"."+string(mah),obj_ini.veh_upgrade[coh,mah]);
                
	                ini_write_real("Veh","hp"+string(coh)+"."+string(mah),obj_ini.veh_hp[coh,mah]);
	                ini_write_real("Veh","cha"+string(coh)+"."+string(mah),obj_ini.veh_chaos[coh,mah]);
	                // ini_write_real("Veh","pil"+string(coh)+"."+string(mah),obj_ini.veh_pilots[coh,mah]);
	            }
	            if (coh=1) and (mah=1) then good=1;
	        }
	    }
    
    
    
    
	    var i;i=0;
	    ini_write_string("Res","nm",obj_controller.restart_name);
	    ini_write_real("Res","found",obj_controller.restart_founding);
	    ini_write_string("Res","secre",obj_controller.restart_secret);
	    ini_write_string("Res","tit0",obj_controller.restart_title[0]);
	    var i;i=0;repeat(11){i+=1;ini_write_string("Res","tit"+string(i),obj_controller.restart_title[i]);}
	    ini_write_real("Res","ico",obj_controller.restart_icon);
	    ini_write_string("Res","icn",obj_controller.restart_icon_name);
	    ini_write_string("Res","power",obj_controller.restart_powers);
	    var ad;ad=-1;repeat(5){ad+=1;ini_write_string("Res","adv"+string(ad),obj_controller.restart_adv[ad]);ini_write_string("Res","dis"+string(ad),obj_controller.restart_dis[ad]);}
	    ini_write_string("Res","rcrtyp",obj_controller.restart_recruiting_type);
	    ini_write_string("Res","trial",obj_controller.restart_trial);
	    ini_write_string("Res","rcrnam",obj_controller.restart_recruiting_name);
	    ini_write_string("Res","homtyp",obj_controller.restart_home_type);
	    ini_write_string("Res","homnam",obj_controller.restart_home_name);
    
	    ini_write_real("Res","flit",obj_controller.restart_fleet_type);
	    ini_write_real("Res","recr_e",obj_controller.restart_recruiting_exists);
	    ini_write_real("Res","home_e",obj_controller.restart_homeworld_exists);
	    ini_write_real("Res","home_r",obj_controller.restart_homeworld_rule);
	    ini_write_string("Res","cry",obj_controller.restart_battle_cry);
	    ini_write_string("Res","flagship",obj_controller.restart_flagship_name);
	    ini_write_string("Res","maincol",obj_controller.col[obj_controller.restart_main_color]);
	    ini_write_string("Res","seccol",obj_controller.col[obj_controller.restart_secondary_color]);
	    ini_write_string("Res","tricol",obj_controller.col[obj_controller.restart_trim_color]);
	    ini_write_string("Res","paul2col",obj_controller.col[obj_controller.restart_pauldron2_color]);
	    ini_write_string("Res","paul1col",obj_controller.col[obj_controller.restart_pauldron_color]);
	    ini_write_string("Res","lenscol",obj_controller.col[obj_controller.restart_lens_color]);
	    ini_write_string("Res","wepcol",obj_controller.col[obj_controller.restart_weapon_color]);
	    ini_write_real("Res","speccol",obj_controller.restart_col_special);
	    ini_write_real("Res","trim",obj_controller.restart_trim);
	    ini_write_real("Res","skin",obj_controller.restart_skin_color);
	    ini_write_string("Res","hapo",obj_controller.restart_hapothecary);
	    ini_write_string("Res","hcha",obj_controller.restart_hchaplain);
	    ini_write_string("Res","clib",obj_controller.restart_clibrarian);
	    ini_write_string("Res","fmas",obj_controller.restart_fmaster);
	    ini_write_string("Res","recruiter",obj_controller.restart_recruiter);
	    ini_write_string("Res","admir",obj_controller.restart_admiral);
	    ini_write_real("Res","eqspec",obj_controller.restart_equal_specialists);
	    ini_write_real("Res","load2",obj_controller.restart_load_to_ships);
	    ini_write_real("Res","successors",obj_controller.restart_successors);
	    ini_write_real("Res","muta",obj_controller.restart_mutations);
	    ini_write_real("Res","preo",obj_controller.restart_preomnor);
	    ini_write_real("Res","voic",obj_controller.restart_voice);
	    ini_write_real("Res","doom",obj_controller.restart_doomed);
	    ini_write_real("Res","lyma",obj_controller.restart_lyman);
	    ini_write_real("Res","omop",obj_controller.restart_omophagea);
	    ini_write_real("Res","ossm",obj_controller.restart_ossmodula);
	    ini_write_real("Res","memb",obj_controller.restart_membrane);
	    ini_write_real("Res","zygo",obj_controller.restart_zygote);
	    ini_write_real("Res","betc",obj_controller.restart_betchers);
	    ini_write_real("Res","catal",obj_controller.restart_catalepsean);
	    ini_write_real("Res","secr",obj_controller.restart_secretions);
	    ini_write_real("Res","occu",obj_controller.restart_occulobe);
	    ini_write_real("Res","mucra",obj_controller.restart_mucranoid);
	    ini_write_string("Res","master_name",obj_controller.restart_master_name);
	    ini_write_real("Res","master_melee",obj_controller.restart_master_melee);
	    ini_write_real("Res","master_ranged",obj_controller.restart_master_ranged);
	    ini_write_real("Res","master_specialty",obj_controller.restart_master_specialty);
	    ini_write_real("Res","strength",obj_controller.restart_strength);
	    ini_write_real("Res","cooperation",obj_controller.restart_cooperation);
	    ini_write_real("Res","purity",obj_controller.restart_purity);
	    ini_write_real("Res","stability",obj_controller.restart_stability);
    
	    i=99;
	    repeat(3){i+=1;
	         var o;o=1;
	         repeat(14){o+=1;
	            if (o=11) then o=12;
	            if (o=13) then o=14;
	            ini_write_real("Res","r_race"+string(i)+"."+string(o),obj_controller.r_race[i,o]);
	            ini_write_string("Res","r_role"+string(i)+"."+string(o),obj_controller.r_role[i,o]);
	            ini_write_string("Res","r_wep1"+string(i)+"."+string(o),obj_controller.r_wep1[i,o]);
	            ini_write_string("Res","r_wep2"+string(i)+"."+string(o),obj_controller.r_wep2[i,o]);
	            ini_write_string("Res","r_armor"+string(i)+"."+string(o),obj_controller.r_armor[i,o]);
	            ini_write_string("Res","r_mobi"+string(i)+"."+string(o),obj_controller.r_mobi[i,o]);
	            ini_write_string("Res","r_gear"+string(i)+"."+string(o),obj_controller.r_gear[i,o]);
	         }
	    }// 100 is defaults, 101 is the allowable starting equipment
    
    
	    ini_close();
	}



	if (argument0=4) or (argument0=0){debugl("Saving to slot "+string(argument1)+" part 4");
	    ini_open("save"+string(argument1)+".ini");
	    var coh,mah,good;
	    good=0;coh=100;mah=0;
	    repeat(30){mah+=1;
	        if (obj_ini.role[coh,mah]!=""){
	            ini_write_real("Mar","co"+string(coh)+"."+string(mah),obj_ini.race[coh,mah]);
	            ini_write_string("Mar","num"+string(coh)+"."+string(mah),obj_ini.name[coh,mah]);
	            ini_write_string("Mar","rol"+string(coh)+"."+string(mah),obj_ini.role[coh,mah]);
	            ini_write_string("Mar","w1"+string(coh)+"."+string(mah),obj_ini.wep1[coh,mah]);
	            ini_write_string("Mar","w2"+string(coh)+"."+string(mah),obj_ini.wep2[coh,mah]);
	            ini_write_string("Mar","ar"+string(coh)+"."+string(mah),obj_ini.armor[coh,mah]);
	            ini_write_string("Mar","ge"+string(coh)+"."+string(mah),obj_ini.gear[coh,mah]);
	            ini_write_string("Mar","mb"+string(coh)+"."+string(mah),obj_ini.mobi[coh,mah]);
	        }
	    }
	    good=0;coh=10;mah=400;
	    repeat(4400){
	        if (good=0){
	            mah-=1;
	            if (mah=0){mah=400;coh-=1;}
	            if (obj_ini.name[coh,mah]!=""){
	                ini_write_real("Mar","co"+string(coh)+"."+string(mah),obj_ini.race[coh,mah]);
	                ini_write_string("Mar","lo"+string(coh)+"."+string(mah),obj_ini.loc[coh,mah]);
	                ini_write_string("Mar","num"+string(coh)+"."+string(mah),obj_ini.name[coh,mah]);
	                ini_write_string("Mar","rol"+string(coh)+"."+string(mah),obj_ini.role[coh,mah]);
	                ini_write_real("Mar","li"+string(coh)+"."+string(mah),obj_ini.lid[coh,mah]);
	                ini_write_real("Mar","bio"+string(coh)+"."+string(mah),obj_ini.bio[coh,mah]);
	                ini_write_real("Mar","wi"+string(coh)+"."+string(mah),obj_ini.wid[coh,mah]);
                
	                ini_write_string("Mar","w1"+string(coh)+"."+string(mah),obj_ini.wep1[coh,mah]);
	                ini_write_string("Mar","w2"+string(coh)+"."+string(mah),obj_ini.wep2[coh,mah]);
	                ini_write_string("Mar","ar"+string(coh)+"."+string(mah),obj_ini.armor[coh,mah]);
	                ini_write_string("Mar","ge"+string(coh)+"."+string(mah),obj_ini.gear[coh,mah]);
	                ini_write_string("Mar","mb"+string(coh)+"."+string(mah),obj_ini.mobi[coh,mah]);
                
	                ini_write_real("Mar","hp"+string(coh)+"."+string(mah),obj_ini.hp[coh,mah]);
	                ini_write_real("Mar","cha"+string(coh)+"."+string(mah),obj_ini.chaos[coh,mah]);
	                ini_write_real("Mar","exp"+string(coh)+"."+string(mah),obj_ini.experience[coh,mah]);
	                ini_write_real("Mar","ag"+string(coh)+"."+string(mah),obj_ini.age[coh,mah]);
	                ini_write_string("Mar","spe"+string(coh)+"."+string(mah),obj_ini.spe[coh,mah]);
	                ini_write_real("Mar","god"+string(coh)+"."+string(mah),obj_ini.god[coh,mah]);
	            }
	            if (coh=0) and (mah=1) then good=1;
	        }
	    }
	    coh=100;mah=-1;
	    repeat(21){mah+=1;
	        if (obj_ini.role[coh,mah]!=""){
	            ini_write_string("Mar","rol"+string(coh)+"."+string(mah),obj_ini.role[coh,mah]);
	            ini_write_string("Mar","w1"+string(coh)+"."+string(mah),obj_ini.wep1[coh,mah]);
	            ini_write_string("Mar","w2"+string(coh)+"."+string(mah),obj_ini.wep2[coh,mah]);
	            ini_write_string("Mar","ar"+string(coh)+"."+string(mah),obj_ini.armor[coh,mah]);
	            ini_write_string("Mar","ge"+string(coh)+"."+string(mah),obj_ini.gear[coh,mah]);
	            ini_write_string("Mar","mb"+string(coh)+"."+string(mah),obj_ini.mobi[coh,mah]);
	        }
	    }
	    coh=102;mah=-1;
	    repeat(21){mah+=1;
	        if (obj_ini.role[coh,mah]!=""){
	            ini_write_string("Mar","rol"+string(coh)+"."+string(mah),obj_ini.role[coh,mah]);
	            ini_write_string("Mar","w1"+string(coh)+"."+string(mah),obj_ini.wep1[coh,mah]);
	            ini_write_string("Mar","w2"+string(coh)+"."+string(mah),obj_ini.wep2[coh,mah]);
	            ini_write_string("Mar","ar"+string(coh)+"."+string(mah),obj_ini.armor[coh,mah]);
	            ini_write_string("Mar","ge"+string(coh)+"."+string(mah),obj_ini.gear[coh,mah]);
	            ini_write_string("Mar","mb"+string(coh)+"."+string(mah),obj_ini.mobi[coh,mah]);
	        }
	    }
	    ini_close();
	}


	if (argument0=5) or (argument0=0){
	    ini_open("save"+string(argument1)+".ini");
    
	    obj_saveload.hide=1;
	    obj_controller.invis=true;
	    obj_saveload.alarm[2]=2;
    
	    var svt,svc,svm,smr,svd;
	    svt=0;svc="";svm="";smr=0;svd="";
	    svt=ini_read_real("Controller","turn",0);
	    svc=ini_read_string("Save","chapter_name","Error");
	    svm=ini_read_string("Ini","master_name","Error");
	    smr=ini_read_real("Controller","marines",0);
	    svd=ini_read_string("Save","date","Error");
	    ini_write_real("Save","corrupt",0);
	    ini_close();
    
	    ini_open("saves.ini");
	    ini_write_real(string(argument1),"turn",svt);
	    ini_write_string(string(argument1),"chapter_name",svc);
	    ini_write_string(string(argument1),"master_name",svm);
	    ini_write_real(string(argument1),"marines",smr);
	    ini_write_string(string(argument1),"date",svd);
	    ini_write_real(string(argument1),"time",obj_controller.play_time);
	    ini_write_real(string(argument1),"seed",global.game_seed);
	    ini_close();

	    file_encrypt("save"+string(argument1)+".ini","p");
    
	    // This saves the log in an unencrypted file
	    instance_activate_object(obj_event_log);
	    file_delete("save"+string(argument1)+"log.ini");
	    ini_open("save"+string(argument1)+"log.ini");
	    var t;t=0;
	    ini_write_real("Main","data1",instance_number(obj_star));
	    ini_write_string("Main","data2",global.chapter_name);
	    ini_write_string("Main","data3",obj_ini.sector_name);
	    ini_write_real("Main","data4",obj_controller.turn);
	    ini_write_real("Main","data5",random_get_seed());
    
	    repeat(600){t+=1;
	        if (obj_event_log.event_text[t]!=""){
	            ini_write_string("Log","a."+string(t),obj_event_log.event_text[t]);
	            ini_write_string("Log","b."+string(t),obj_event_log.event_date[t]);
	            ini_write_real("Log","c."+string(t),obj_event_log.event_turn[t]);
	            ini_write_string("Log","d."+string(t),obj_event_log.event_color[t]);
	        }
	    }
	    ini_close();
    
	    obj_saveload.save[argument1]=1;
    
	    debugl("Saving to slot "+string(argument1)+" complete");
	}

	// Finish here



	// scr_load();


	/*

	probably need to add something like

	comp1_marines
	comp1_vehicles

	these will be loaded into a temporary variable and determine how many times the checks need to repeat








	////////////////////////////////
	////////Loading////////////////////////
	//////////////////////////////////
	ini_open(saveFile);
	num = ini_read_real("Save", "count", 0); //get the number of instances

	for ( i = 0; i < num; i += 1)
	{
	     myID = ini_read_real( "Save", "object" + string(i), 0); //loads id from file
	     myX = ini_read_real( "Save", "object" + string(i) + "x", 0); //loads x from file
	     myY = ini_read_real( "Save", "object" + string(i) + "y", 0); //loads y from file
          
	     instance_create( myX, myY, myID);
	}
	ini_close();




	1. Make it so that save files are named 'Save1', 'Save2', etc, then store the name of the save file that appears in the game as part of the save file.

	2. Check if 'Save1' exists, 'Save2', etc, and display them accordingly by reading their names from the file

	3. When clicked, load the file by its FILENAME. When the user deletes a file, remove it and rename all the files with names AFTER it (for example, if Save3 was deleted, rename Save4 to Save3, and Save5 to Save4). This way, the structure stays tidy. 


	file_exists(fname) Returns whether the file with the given name exists (true) or not (false).




	Use Splash Webpage(from d&d) ! (hehe) Usually you want to open in browser not in game (splash_show_web(url,delay) shows only in game )

	Note: You can use working_directory to point the folder where the game is 



	*/


}
