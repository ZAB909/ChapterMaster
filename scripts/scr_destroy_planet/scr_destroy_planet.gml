function scr_destroy_planet(argument0) {

	// argument0: method   (1 being combat exterminatus, 2 being star select cyclonic torpedo)


	var baid,enemy9;
	baid=0;enemy9=0;


	if (argument0=2){
	    var pip;pip=instance_create(0,0,obj_popup);
	    with(pip){
	        title="Exterminatus";
	        image="exterminatus";
	        text="You give the order to fire the Cyclonic Torpedo.  After a short descent it lands upon the surface and detonates- the air itself igniting across ";
	    }

	    var you;you=obj_star_select.target;pip.text+=you.name;
	    pip.text+=" "+scr_roman(obj_controller.selecting_planet);
	    baid=obj_controller.selecting_planet;
	    scr_add_item("Cyclonic Torpedo",-1);
	    obj_star_select.torpedo-=1;
	    enemy9=you.p_owner[obj_controller.selecting_planet];
	}



	if (argument0=1){
	    var pip;pip=instance_create(0,0,obj_popup);
	    with(pip){
	        title="Exterminatus";
	        image="exterminatus";
	        if (obj_ncombat.defeat=0) then text="After ensuring proper placement your marines return to their vessels.  A short while later the Exterminatus activates- the air itself ignites across ";
	    }

	    instance_activate_object(obj_star);
	    var you;you=battle_object;
	    pip.text+=you.name;
    
	    if (obj_ncombat.battle_id=1) then pip.text+=" I";if (obj_ncombat.battle_id=2) then pip.text+=" II";
	    if (obj_ncombat.battle_id=3) then pip.text+=" III";if (obj_ncombat.battle_id=4) then pip.text+=" IV";
	    baid=obj_ncombat.battle_id;
	    scr_add_item("Exterminatus",-1);
    
	    enemy9=enemy;
	}
    
    

    

	// No survivors!
	var cah,ed;cah=-1;ed=0;
	repeat(11){
	    cah+=1;ed=0;

	    repeat(500){ed+=1;
	        if (obj_ini.loc[cah,ed]=you.name) and (obj_ini.wid[cah,ed]=baid){
	            if (obj_ini.role[cah,ed]="Chapter Master"){obj_controller.alarm[7]=15;if (global.defeat<=1) then global.defeat=1;}
            
	            if (obj_ini.race[cah,ed]=1){var comm;comm=false;
	                if (obj_ini.role[co][i]="Chapter Master") then comm=true;
	                if (obj_ini.role[co][i]="Master of Sanctity") then comm=true;
	                if (obj_ini.role[co][i]="Master of the Apothecarion") then comm=true;
	                if (obj_ini.role[co][i]="Chief "+string(obj_ini.role[100,17])) then comm=true;
	                if (obj_ini.role[co][i]="Forge Master") then comm=true;
	                if (obj_ini.role[co][i]=obj_ini.role[100,17]) then comm=true;
	                if (obj_ini.role[co][i]=obj_ini.role[100][14]) then comm=true;
	                if (obj_ini.role[co][i]=obj_ini.role[100][15]) then comm=true;
	                if (obj_ini.role[co][i]=obj_ini.role[100][16]) then comm=true;
	                if (obj_ini.role[co][i]=obj_ini.role[100][6]) then comm=true;
	                if (obj_ini.role[co][i]=obj_ini.role[100][5]) then comm=true;
	                if (obj_ini.role[co][i]="Codiciery") then comm=true;
	                if (obj_ini.role[co][i]="Lexicanum") then comm=true;
	                if (obj_ini.role[co][i]=string(obj_ini.role[100,17])+" Aspirant") then comm=true;
	                if (obj_ini.role[co][i]=string(obj_ini.role[100][14])+" Aspirant") then comm=true;
	                if (obj_ini.role[co][i]=string(obj_ini.role[100][15])+" Aspirant") then comm=true;
	                if (obj_ini.role[co][i]=string(obj_ini.role[100][16])+" Aspirant") then comm=true;
	                if (obj_ini.role[co][i]="Venerable "+string(obj_ini.role[100][6])) then comm=true;
                
	                // if (obj_ini.race[cah,ed]=1) then obj_controller.marines-=1;
	                if (comm=false) then obj_controller.marines-=1;
	                if (comm=true) then obj_controller.command-=1;
	            }
            
            
            
	            obj_ini.race[cah,ed]=0;obj_ini.loc[cah,ed]="";obj_ini.name[cah,ed]="";obj_ini.role[cah,ed]="";obj_ini.hp[cah,ed]=0;
	        }
	        if (ed<200){
	            if (obj_ini.veh_loc[cah,ed]=you.name) and (obj_ini.veh_wid[cah,ed]=baid){
	                obj_ini.veh_race[cah,ed]=0;obj_ini.veh_loc[cah,ed]="";obj_ini.veh_role[cah,ed]="";obj_ini.veh_hp[cah,ed]=0;
	            }
	        }
	    }
	}

	// Relation penalties here, if applicable
	if (you.p_type[baid]="Daemon"){
	    obj_controller.disposition[4]+=5;
    
	    obj_controller.disposition[5]+=5;
	    var o;o=0;repeat(4){if (o<=4){o+=1;if (obj_ini.adv[o]="Reverent Guardians") then o=500;}}if (o>100) then obj_controller.disposition[5]+=5;
    
	    if (obj_controller.blood_debt=1){obj_controller.penitent_current+=1500;obj_controller.penitent_turn=0;obj_controller.penitent_turnly=0;}
	}

	if ((you.p_owner[baid]=3) or (you.p_first[baid]=3)) and (obj_controller.faction_status[eFACTION.Mechanicus]!="War"){
	    obj_controller.loyalty-=50;obj_controller.loyalty_hidden-=50;
	    obj_controller.disposition[2]-=50;obj_controller.disposition[3]-=80;
	    obj_controller.disposition[4]-=40;obj_controller.disposition[5]-=30;
    
	    obj_controller.faction_status[eFACTION.Imperium]="War";obj_controller.faction_status[eFACTION.Mechanicus]="War";
	    obj_controller.faction_status[eFACTION.Inquisition]="War";obj_controller.faction_status[eFACTION.Ecclesiarchy]="War";
    
	    obj_controller.audiences+=1;obj_controller.audien[obj_controller.audiences]=3;obj_controller.audien_topic[obj_controller.audiences]="declare_war";
	    obj_controller.audiences+=1;obj_controller.audien[obj_controller.audiences]=2;obj_controller.audien_topic[obj_controller.audiences]="declare_war";
	    if (obj_controller.known[eFACTION.Inquisition]>1){obj_controller.audiences+=1;obj_controller.audien[obj_controller.audiences]=4;obj_controller.audien_topic[obj_controller.audiences]="declare_war";}
	    if (obj_controller.known[eFACTION.Ecclesiarchy]>1){obj_controller.audiences+=1;obj_controller.audien[obj_controller.audiences]=5;obj_controller.audien_topic[obj_controller.audiences]="declare_war";}

	    if (planet_feature_bool(you.p_feature[baid], P_features.Sororitas_Cathedral)==1){
	        obj_controller.disposition[5]-=30;
	        if (obj_controller.known[eFACTION.Mechanicus]>1){obj_controller.audiences+=1;obj_controller.audien[obj_controller.audiences]=3;obj_controller.audien_topic[obj_controller.audiences]="declare_war";}
	    }

	}
	if (enemy9=5) and (obj_controller.faction_status[eFACTION.Ecclesiarchy]!="War"){
	    obj_controller.loyalty-=50;obj_controller.loyalty_hidden-=50;
	    obj_controller.disposition[2]-=50;obj_controller.disposition[3]-=80;
	    obj_controller.disposition[4]-=40;obj_controller.disposition[5]-=30;
    
	    obj_controller.faction_status[eFACTION.Imperium]="War";obj_controller.faction_status[eFACTION.Mechanicus]="War";
	    obj_controller.faction_status[eFACTION.Inquisition]="War";obj_controller.faction_status[eFACTION.Ecclesiarchy]="War";
    
	    obj_controller.audiences+=1;obj_controller.audien[obj_controller.audiences]=5;obj_controller.audien_topic[obj_controller.audiences]="declare_war";
	    if (obj_controller.known[eFACTION.Inquisition]>1){obj_controller.audiences+=1;obj_controller.audien[obj_controller.audiences]=4;obj_controller.audien_topic[obj_controller.audiences]="declare_war";}
	    obj_controller.audiences+=1;obj_controller.audien[obj_controller.audiences]=2;obj_controller.audien_topic[obj_controller.audiences]="declare_war";
	}



	if (you.p_tyranids[baid]<5){
	    if (you.p_first[baid]=2) and (you.p_type[baid]="Hive") and (planet_feature_bool(you.p_feature[baid], P_features.Daemonic_Incursion)==0) and (obj_controller.faction_status[eFACTION.Imperium]!="War"){
	        obj_controller.loyalty-=50;obj_controller.loyalty_hidden-=50;
	        obj_controller.disposition[2]-=60;obj_controller.disposition[3]-=30;
	        obj_controller.disposition[4]-=40;obj_controller.disposition[5]-=40;
        
	        obj_controller.faction_status[eFACTION.Imperium]="War";obj_controller.faction_status[eFACTION.Mechanicus]="War";
	        obj_controller.faction_status[eFACTION.Inquisition]="War";obj_controller.faction_status[eFACTION.Ecclesiarchy]="War";
        
	        obj_controller.audiences+=1;obj_controller.audien[obj_controller.audiences]=2;obj_controller.audien_topic[obj_controller.audiences]="declare_war";
	        if (obj_controller.known[eFACTION.Inquisition]>1){obj_controller.audiences+=1;obj_controller.audien[obj_controller.audiences]=4;obj_controller.audien_topic[obj_controller.audiences]="declare_war";}
	        if (obj_controller.known[eFACTION.Ecclesiarchy]>1){obj_controller.audiences+=1;obj_controller.audien[obj_controller.audiences]=5;obj_controller.audien_topic[obj_controller.audiences]="declare_war";}
	        if (obj_controller.known[eFACTION.Mechanicus]>1){obj_controller.audiences+=1;obj_controller.audien[obj_controller.audiences]=3;obj_controller.audien_topic[obj_controller.audiences]="declare_war";}
    
	        if (planet_feature_bool(you.p_feature[baid], P_features.Sororitas_Cathedral)==1) then obj_controller.disposition[5]-=30;
	    }
	    if (you.p_owner[baid]=2) and ((you.p_type[baid]="Temperate") or (you.p_type[baid]="Temperate")) and (planet_feature_bool(you.p_feature[baid], P_features.Daemonic_Incursion)==0){
	        obj_controller.loyalty-=30;obj_controller.loyalty_hidden-=30;
	        obj_controller.disposition[2]-=30;obj_controller.disposition[3]-=15;
	        obj_controller.disposition[4]-=30;obj_controller.disposition[5]-=30;
	    }   
	} 

	// Planet changes here
	with(you){
	    p_type[baid]="Dead";p_feature[baid]=[];p_owner[baid]=0;
	    p_first[baid]=0;p_population[baid]=0;p_max_population[baid]=0;
	    p_large[baid]=0;p_pop[baid]="";p_guardsmen[baid]=0;
	    p_pdf[baid]=0;p_fortified[baid]=0;p_station[baid]=0;
	    // Whether or not player forces are on the planet
    
	    p_player[baid]=0;
    
	    // v how much of a problem they are from 1-5
	    p_orks[baid]=0;p_tau[baid]=0;p_eldar[baid]=0;
	    p_tyranids[baid]=0;p_traitors[baid]=0;p_chaos[baid]=0;
	    p_demons[baid]=0;p_sisters[baid]=0;p_necrons[baid]=0;
	    // 
	    p_problem[0,baid]="";p_timer[0,baid]=0;p_problem[1,baid]="";p_timer[1,baid]=0;
	    p_problem[2,baid]="";p_timer[2,baid]=0;p_problem[3,baid]="";p_timer[3,baid]=0;
	    p_problem[4,baid]="";p_timer[4,baid]=0;p_problem[5,baid]="";p_timer[5,baid]=0;
	}

	pip.text+=", scouring all life across the planet.  It has been rendered a barren, lifeless chunk of rock.";
	pip.number=1;

	with(obj_temp5){instance_destroy();}
	with(obj_temp8){instance_destroy();}


}
