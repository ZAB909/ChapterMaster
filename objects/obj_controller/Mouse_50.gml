// This script handles left click interactions throught the main menus of the game
var xx, yy;
xx=__view_get( e__VW.XView, 0 );
yy=__view_get( e__VW.YView, 0 );

if (trading>0) and (force_goodbye!=0) then trading=0;

// ** Gene seed countdown and production **
if (menu==11) and (cooldown<=0){
    if (gene_seed>0) and (obj_ini.zygote==0) and (mouse_x>=xx+407) and (mouse_y>=yy+788) and (mouse_x<xx+529) and (mouse_y<yy+811){
        var i=0,g=0;
        for(i=1; i<=120; i++){
            if (g==0){
                if (obj_ini.slave_batch_eta[i]==120) then g=i;
            }
        }
        if (g=0){
            for(i=1; i<=120; i++){
                if (g=0){if (obj_ini.slave_batch_num[i]=0) then g=i;}
            }
        }

        var carpal=1;
        if (obj_ini.slave_batch_num[g]>=10) and (obj_ini.slave_batch_num[g]<50) then carpal=2;
        if (obj_ini.slave_batch_num[g]>=50) then carpal=5;if (obj_ini.slave_batch_num[g]>=150) then carpal=10;
        if (obj_controller.gene_seed<carpal) then carpal=obj_controller.gene_seed;

        obj_controller.gene_seed-=carpal;
        obj_ini.slave_batch_num[g]+=carpal;
        obj_ini.slave_batch_eta[g]=120;
        cooldown=10;
    }
    if (obj_ini.slave_batch_num[1]>0) and (mouse_x>=xx+659) and (mouse_y>=yy+788) and (mouse_x<xx+838) and (mouse_y<yy+811){
        for(var i=1; i<=120; i++){
            gene_seed+=obj_ini.slave_batch_num[i];
            obj_ini.slave_batch_num[i]=0;
            obj_ini.slave_batch_eta[i]=0;
        }
        cooldown=8000;
    }
}
// ** Reclusium Jail Marines**
if (menu==12) and (cooldown<=0) and (penitorium>0){
    var behav=0,r_eta=0,re=0;
    for(var qp=1; qp<=min(36,penitorium); qp++){
        if (qp<=penitorium) and (mouse_y>=yy+100+((qp-1)*20)) and (mouse_y<yy+100+(qp*20)){
            if (mouse_x>=xx+1433) and (mouse_x<xx+1497){
                cooldown=20;
                var c=penit_co[qp],e=penit_id[qp];
                if (obj_ini.race[c,e]=1){
                    if (obj_ini.age[c,e]<=((millenium*1000)+year)-10) and (obj_ini.zygote==0) and (string_count("Doom",obj_ini.strin2)==0) then gene_seed+=1;
                    if (obj_ini.age[c,e]<=((millenium*1000)+year)-5) and (string_count("Doom",obj_ini.strin2)==0) then gene_seed+=1;
                }

                var tek="";
                if (obj_ini.race[c,e]==1){
                    tek=obj_ini.wep1[c,e];
                    if (tek!="") then scr_add_item(tek,1);
                    tek=obj_ini.wep2[c,e];
                    if (tek!="") then scr_add_item(tek,1);
                    tek=obj_ini.armour[c,e];
                    if (tek!="") then scr_add_item(tek,1);
                    tek=obj_ini.mobi[c,e];
                    if (tek!="") then scr_add_item(tek,1);
                    tek=obj_ini.gear[c,e];
                    if (tek!="") then scr_add_item(tek,1);
                }

                tek="";
                if (obj_ini.race[c,e]=1){
                    if(is_specialist(obj_ini.role[c,e])){
                        command-=1;
                    } else{
                        marines-=1;
                    }
                }
                if (obj_ini.role[c,e]="Chapter Master"){
                    tek="c";
                    alarm[7]=5;
                    global.defeat=3;
                }
                // TODO Needs to be based on role
                scr_kill_unit(c,e);
                diplo_char=c;
                with(obj_ini){scr_company_order(obj_controller.diplo_char);}
                re=1;
                diplo_char=0;
            }
            if (mouse_x>=xx+1508) and (mouse_x<xx+1567){
                cooldown=20;
                var c=penit_co[qp],e=penit_id[qp];
                obj_ini.god[c,e]-=10;
                re=1;
            }
        }
    }
    if (re==1){
        for(var g=1; g<=100; g++){
            penit_co[g]=0;
            penit_id[g]=0;
        }
        penitorium=0;
        var p=0;
        for(var c=0; c<11; c++){
            for(var e=1; e<=250; e++){
                if (obj_ini.god[c,e]>=10){
                    p+=1;
                    penit_co[p]=c;
                    penit_id[p]=e;
                    penitorium+=1;
                }
            }
        }
    }
}
// ** Lirarium Artifcts identify **
if (menu==13) and (cooldown<=0) and (artifacts>0){
    if (mouse_y>=yy+437) and (mouse_y<=yy+461){
        // Previous
        if (mouse_x>=xx+512) and (mouse_x<xx+550){
            if (menu_artifact>1) and (cooldown<=0){
                menu_artifact-=1;
                cooldown=8000;
                identifiable=0;
            }
            if (menu_artifact==1) and (cooldown<=0){
                menu_artifact=artifacts;
                cooldown=8000;
                identifiable=0;
            }
        }
        // Next
        if (mouse_x>=xx+690) and (mouse_x<xx+732){
            if (menu_artifact<artifacts) and (cooldown<=0){
                menu_artifact+=1;
                cooldown=8000;
                identifiable=0;
            }
            if (menu_artifact==artifacts) and (cooldown<=0){
                menu_artifact=1;
                cooldown=8000;
                identifiable=0;
            }
        }
    }
    // Identify now
    if (mouse_x>=xx+531) and (mouse_y>=yy+715) and (mouse_x<xx+709) and (mouse_y<yy+733){
        if (identifiable==1) and (obj_ini.artifact_identified[menu_artifact]>0) and (requisition>=150){
            obj_ini.artifact_identified[menu_artifact]=0;
            requisition-=150;
            cooldown=8000;
            identifiable=0;
            audio_play_sound(snd_identify,-500,0);
            audio_sound_gain(snd_identify,master_volume*effect_volume,0);
        }
    }
    if (obj_ini.artifact_identified[menu_artifact]==0){
        // Equip
        if (mouse_x>=xx+354) and (mouse_y>=yy+789) and (mouse_x<xx+448) and (mouse_y<yy+804) and (cooldown<=0){
            var hue=1;
            if (obj_ini.artifact[menu_artifact]=="Statue") then hue=0;
            if (obj_ini.artifact[menu_artifact]=="Casket") then hue=0;
            if (obj_ini.artifact[menu_artifact]=="Chalice") then hue=0;
            if (obj_ini.artifact[menu_artifact]=="Robot") then hue=0;
            if (hue==1){
                var pop=instance_create(0,0,obj_popup);
                pop.type=8;
                cooldown=8;
            }
        }
        // Gift
        if (mouse_x>=xx+512) and (mouse_y>=yy+789) and (mouse_x<xx+740) and (mouse_y<yy+804) and (cooldown<=0){
            var chick=0;
            if (known[eFACTION.Imperium]>1) and (faction_defeated[2]==0) then chick=1;
            if (known[eFACTION.Mechanicus]>1) and (faction_defeated[3]==0) then chick=1;
            if (known[eFACTION.Inquisition]>1) and (faction_defeated[4]==0) then chick=1;
            if (known[eFACTION.Ecclesiarchy]>1) and (faction_defeated[5]==0) then chick=1;
            if (known[eFACTION.Eldar]>1) and (faction_defeated[6]==0) then chick=1;
            if (known[eFACTION.Tau]>1) and (faction_defeated[8]==0) then chick=1;
            if (chick!=0){
                var pop=instance_create(0,0,obj_popup);
                pop.type=9;
                cooldown=8;
            }
        }
        // Destroy
        if (point_in_rectangle(mouse_x, mouse_y, xx + 780, yy + 789, xx + 894, yy + 804) && cooldown <= 0) {
            var fun=irandom(100)+1;
            // Below here cleans up the artifacts
            var i=menu_artifact;

            if (menu_artifact==fest_display) then fest_display=0;

            if (string_count("Daemon",obj_ini.artifact_tags[i])>0){
                if (obj_ini.artifact_sid[i]>=500){
                    var demonSummonChance=irandom(100)+1;

                    if (demonSummonChance<=60) and (obj_ini.ship_carrying[obj_ini.artifact_sid[i]-500]>0){
                        instance_create(0,0,obj_ncombat);
                        obj_ncombat.battle_special="ship_demon";
                        obj_ncombat.formation_set=1;
                        obj_ncombat.enemy=10;
                        obj_ncombat.battle_id=obj_ini.artifact_sid[i]-500;
                        scr_ship_battle(obj_ini.artifact_sid[i]-500,999);
                    }
                }
            }
            for(var e=1; e<=500; e++){
                if (obj_ini.artifact_tags[i]==obj_controller.recent_keyword[e]){
                    obj_controller.recent_keyword[e]="";
                    obj_controller.recent_type[e]="";
                    obj_controller.recent_turn[e]=0;
                    obj_controller.recent_number[e]=0;
                    scr_recent("artifact_destroyed",obj_controller.recent_keyword,2);
                    scr_recent("","",0);
                }
            }

            obj_ini.artifact[i]="";
            obj_ini.artifact_tags[i]="";
            obj_ini.artifact_identified[i]=0;
            obj_ini.artifact_condition[i]=100;
            obj_ini.artifact_loc[i]="";
            obj_ini.artifact_sid[i]=0;
            artifacts-=1;
            cooldown=12;
            if (menu_artifact>artifacts) then menu_artifact=artifacts;
            for(var j=0; j<20; j++){
                obj_ini.artifact[i]=obj_ini.artifact[i+1];obj_ini.artifact_tags[i]=obj_ini.artifact_tags[i+1];
                obj_ini.artifact_identified[i]=obj_ini.artifact_identified[i+1];
                obj_ini.artifact_condition[i]=obj_ini.artifact_condition[i+1];
                obj_ini.artifact_loc[i]=obj_ini.artifact_loc[i+1];obj_ini.artifact_sid[i]=obj_ini.artifact_sid[i+1];
                i+=1;
            }
        }
    }
}
// ** Armamentorium STC fragments **
if (menu==14) and (cooldown<=0){
    // Gift STC Fragment
    if (point_in_rectangle(mouse_x, mouse_y, xx + 733, yy + 466, xx + 790, yy + 486) && cooldown <= 0) {
        if (stc_wargear_un+stc_vehicles_un+stc_ships_un>0){
            var chick=0;
            if (known[eFACTION.Imperium]>1) and (faction_defeated[2]==0) then chick=1;
            if (known[eFACTION.Mechanicus]>1) and (faction_defeated[3]==0) then chick=1;
            if (known[eFACTION.Inquisition]>1) and (faction_defeated[4]==0) then chick=1;
            if (known[eFACTION.Ecclesiarchy]>1) and (faction_defeated[5]==0) then chick=1;
            if (known[eFACTION.Eldar]>1) and (faction_defeated[6]==0) then chick=1;
            if (known[eFACTION.Tau]>1) and (faction_defeated[8]==0) then chick=1;
            if (chick!=0){
                var pop=instance_create(0,0,obj_popup);
                pop.type=9.1;
                cooldown=8000;
            }
        }
    }
    // Identify STC
    if (mouse_x>xx+621) and (mouse_y>yy+466) and (mouse_x<xx+720) and (mouse_y<yy+486){
        if (stc_wargear_un+stc_vehicles_un+stc_ships_un>0){
            var r1,r2=0;
            cooldown=8000;
            audio_play_sound(snd_stc,-500,0)
            audio_sound_gain(snd_stc,master_volume*effect_volume,0);
            r1=irandom(stc_wargear_un+stc_vehicles_un+stc_ships_un)+1;

            if (r1<stc_wargear_un) and (stc_wargear_un>0) then r2=1;
            if (r1>stc_wargear_un) and (r1<=stc_wargear_un+stc_vehicles_un) and (stc_vehicles_un>0) then r2=2;
            if (r1>stc_wargear_un+stc_vehicles_un) and (r2<=stc_wargear_un+stc_vehicles_un+stc_ships_un) and (stc_ships_un>0) then r2=3;

            if (stc_wargear_un>0) and (stc_vehicles_un+stc_ships_un==0) then r2=1;
            if (stc_vehicles_un>0) and (stc_wargear_un+stc_ships_un==0) then r2=2;
            if (stc_ships_un>0) and (stc_vehicles_un+stc_wargear_un==0) then r2=3;

            if (r2==1){
                stc_wargear_un-=1;
                stc_wargear+=1;
                if (stc_wargear==2) then stc_bonus[1]=choose(1,2,3,4,5);
                if (stc_wargear==4) then stc_bonus[2]=choose(1,2,3);
            }
            if (r2==2){
                stc_vehicles_un-=1;
                stc_vehicles+=1;
                if (stc_vehicles==2) then stc_bonus[3]=choose(1,2,3,4,5);
                if (stc_vehicles==4) then stc_bonus[4]=choose(1,2,3);
            }
            if (r2==3){
                stc_ships_un-=1;
                stc_ships+=1;
                if (stc_ships==2) then stc_bonus[5]=choose(1,2,3,4,5);
                if (stc_ships==4) then stc_bonus[6]=choose(1,2,3);
            }
            // Refresh the shop
            instance_create(1000,1000,obj_shop);
        }
        exit;
    }
}
// ** Recruitement **
if (menu==15) and (cooldown<=0){
    if (mouse_x>=xx+748) and (mouse_x<xx+772){
        if (mouse_y>=yy+355) and (mouse_y<yy+373) and (recruiting<5) and (gene_seed>0) and (obj_ini.doomed==0) and (string_count("|",recruiting_worlds)>0) and (penitent==0){
            cooldown=8000;
            recruiting+=1;
            income_recruiting-=2*(string_count("|",recruiting_worlds));
            scr_income();
        }
        if (mouse_y>=yy+395) and (mouse_y<yy+413) and (training_apothecary<6){
            cooldown=8000;
            training_apothecary+=1;
            scr_income();
        }
        if (mouse_y>=yy+415) and (mouse_y<yy+433) and (training_chaplain<6) and (global.chapter_name!="Space Wolves") and (global.chapter_name!="Iron Hands"){
            cooldown=8000;
            training_chaplain+=1;
            scr_income();
        }
        if (mouse_y>=yy+435) and (mouse_y<yy+452) and (training_psyker<6) and (string_count("Intolerant",obj_ini.strin2)==0){
            cooldown=8000;
            training_psyker+=1;
            scr_income();
        }
        if (mouse_y>=yy+455) and (mouse_y<yy+473) and (training_techmarine<6){
            cooldown=8000;
            var pid=scr_role_count("Techmarine","");
            if (pid>=((disposition[3]/2)+5)) then training_techmarine=0;
            if (pid<((disposition[3]/2)+5)){
                training_techmarine+=1;
                scr_income();
            }
        }
    }
    if (mouse_x>=xx+726) and (mouse_x<xx+745){
        if (mouse_y>=yy+355) and (mouse_y<yy+373) and (recruiting>0){
            cooldown=8000;
            recruiting-=1;
            income_recruiting+=2*(string_count("|",obj_controller.recruiting_worlds));
            scr_income();
        }
        if (mouse_y>=yy+395) and (mouse_y<yy+413) and (training_apothecary>0){
            cooldown=8000;
            training_apothecary-=1;
            scr_income();
        }
        if (mouse_y>=yy+415) and (mouse_y<yy+433) and (training_chaplain>0){
            cooldown=8000;
            training_chaplain-=1;
            scr_income();
        }
        if (mouse_y>=yy+435) and (mouse_y<yy+452) and (training_psyker>0){
            cooldown=8000;
            training_psyker-=1;
            scr_income();
        }
        if (mouse_y>=yy+455) and (mouse_y<yy+473) and (training_techmarine>0){
            cooldown=8000;
            training_techmarine-=1;
            scr_income();
        }
    }
    // Change trial type
    if (mouse_y>=yy+518) and (mouse_y<=yy+542){
        var onceh=0;
        if (mouse_x>=xx+713) and (mouse_x<=xx+752){
            cooldown=8000;
            if (recruit_trial=="Blood Duel") and (onceh==0){
                onceh=1;
                recruit_trial="Hunting the Hunter";
            }
            if (recruit_trial=="Hunting the Hunter") and (onceh==0){
                onceh=1;
                recruit_trial="Survival of the Fittest";
            }
            if (recruit_trial=="Survival of the Fittest") and (onceh==0){
                onceh=1;
                recruit_trial="Exposure";
            }
            if (recruit_trial=="Exposure") and (onceh==0){
                onceh=1;
                recruit_trial="Knowledge of Self";
            }
            if (recruit_trial=="Knowledge of Self") and (onceh==0){
                onceh=1;
                recruit_trial="Challenge";
            }
            if (recruit_trial=="Challenge") and (onceh==0){
                onceh=1;
                recruit_trial="Apprenticeship";
            }
            if (recruit_trial=="Apprenticeship") and (onceh==0){
                onceh=1;
                recruit_trial="Blood Duel";
            }
        }
        if (mouse_x>=xx+492) and (mouse_x<=xx+528){
            cooldown=8000;
            if (recruit_trial=="Blood Duel") and (onceh==0){
                onceh=1;
                recruit_trial="Apprenticeship";
            }
            if (recruit_trial=="Apprenticeship") and (onceh==0){
                onceh=1;
                recruit_trial="Challenge";
            }
            if (recruit_trial=="Challenge") and (onceh==0){
                onceh=1;
                recruit_trial="Knowledge of Self";
            }
            if (recruit_trial=="Knowledge of Self") and (onceh==0){

                onceh=1;
                recruit_trial="Exposure";
            }
            if (recruit_trial=="Exposure") and (onceh==0){
                onceh=1;
                recruit_trial="Survival of the Fittest";
            }
            if (recruit_trial=="Survival of the Fittest") and (onceh==0){
                onceh=1;
                recruit_trial="Hunting the Hunter";
            }
            if (recruit_trial=="Hunting the Hunter") and (onceh==0){
                onceh=1;
                recruit_trial="Blood Duel";
            }
        }
    }
}
// ** Fleet count **
if (menu==16) and (cooldown<=0){
    var i=ship_current;
    for(var j=0; j<34; j++){
        i+=1;
        if (obj_ini.ship[i]!="") and (mouse_x>=xx+953) and (mouse_x>=yy+84+(i*20)) and (mouse_x<xx+969) and (mouse_y<yy+100+(i*20)){
            temp[40]=obj_ini.ship[i];
            with(obj_p_fleet){
                for(var k=1; k<=40; k++){
                    if (capital[k]==obj_controller.temp[40]) then instance_create(x,y,obj_temp7);
                    if (frigate[k]==obj_controller.temp[40]) then instance_create(x,y,obj_temp7);
                    if (escort[k]==obj_controller.temp[40]) then instance_create(x,y,obj_temp7);
                }
            }
            if (instance_exists(obj_temp7)){
                x=obj_temp7.x;
                y=obj_temp7.y;
                cooldown=8000;
                menu=0;
                with(obj_fleet_show){instance_destroy();}
                instance_create(obj_temp7.x,obj_temp7.y,obj_fleet_show);
                with(obj_temp7){instance_destroy();}
            }
        }
    }
}
// ** Diplomacy Chaos talks **
if (menu==20) and (diplomacy==10.1){
	if (diplomacy_pathway == "intro") and (cooldown <= 0){
		if point_in_rectangle(mouse_x, mouse_y, option_selections[0].lh, option_selections[0].top, option_selections[0].rh, option_selections[0].base){
			cooldown=8000;
		    diplomacy_pathway = "gift";
		    scr_dialogue(diplomacy_pathway);
		}
		if point_in_rectangle(mouse_x, mouse_y, option_selections[1].lh, option_selections[1].top, option_selections[1].rh, option_selections[1].base){
			cooldown=8000;
			diplomacy_pathway = "daemon_scorn";
			scr_dialogue(diplomacy_pathway);
			force_goodbye=1;
		}
		if point_in_rectangle(mouse_x, mouse_y, option_selections[2].lh, option_selections[2].top, option_selections[2].rh, option_selections[2].base){
			cooldown=8000;
			diplomacy_pathway = "daemon_Scorn";
			scr_dialogue(diplomacy_pathway);
			force_goodbye=1;
		}
	}
	if (diplomacy_pathway == "gift") and (cooldown  <= 0) {
		if point_in_rectangle(mouse_x, mouse_y, option_selections[0].lh, option_selections[0].top, option_selections[0].rh, option_selections[0].base){
			cooldown=8000;
			diplomacy_pathway = "Khorne_path";
			scr_dialogue(diplomacy_pathway);
		}
		if point_in_rectangle(mouse_x, mouse_y, option_selections[1].lh, option_selections[1].top, option_selections[1].rh, option_selections[1].base){
			cooldown=8000;
			diplomacy_pathway = "Nurgle_path";
			scr_dialogue(diplomacy_pathway);
		}
		if point_in_rectangle(mouse_x, mouse_y, option_selections[2].lh, option_selections[2].top, option_selections[2].rh, option_selections[2].base){
			cooldown=8000;
			diplomacy_pathway = "Tzeentch_path";
			scr_dialogue(diplomacy_pathway);
		}
        if point_in_rectangle(mouse_x, mouse_y, option_selections[3].lh, option_selections[3].top, option_selections[3].rh, option_selections[3].base){
			cooldown=8000;
			diplomacy_pathway = "Slaanesh_path";
			scr_dialogue(diplomacy_pathway);
		}
	}
	if (diplomacy_pathway == "Khorne_path")  and (cooldown  <= 0){
        var chapter_master = obj_ini.TTRPG[0,0];
		if point_in_rectangle(mouse_x, mouse_y, option_selections[0].lh, option_selections[0].top, option_selections[0].rh, option_selections[0].base){
			cooldown=8000;
			diplomacy_pathway = "sacrifice_lib";
            //grab a random librarian
            var lib = scr_random_marine("lib",0);
            if (lib!="none"){
                var dead_lib = obj_ini.TTRPG[lib[0],lib[1]];
                pop_up = instance_create(0,0,obj_popup);
                pop_up.title = "Skull for the Skull Throne";
                pop_up.text = $"You summon {dead_lib.name_role()} to your personal chambers. Darting from the shadows you deftly strike his head from his shoulders. With the flesh removed from his skull you place the skull upon a hastily erected shrine."
                pop_up.type=98;
                pop_up.image = "chaos";
                scr_kill_unit(lib[0],lib[1]);
            } else {
                diplomacy_pathway = "daemon_scorn";
            }
            scr_dialogue(diplomacy_pathway);  
			force_goodbye = 1;

		}
        if (point_in_rectangle(mouse_x, mouse_y, option_selections[1].lh, option_selections[1].top, option_selections[1].rh, option_selections[1].base)){
			cooldown=8000;
			diplomacy_pathway = "sacrifice_champ";
            var champ = scr_random_marine(obj_ini.role[100,7],0);
            if (champ!="none"){
                var dead_champ = obj_ini.TTRPG[champ[0],champ[1]];
               // obj_duel = instance_create(0,0,obj_duel);
               // obj_duel.title = "Ambush Champion";
               // pop.type="duel";
                //scr_kill_unit(champ[0],champ[1]);
            } else {
                diplomacy_pathway = "daemon_scorn";
            }              
			scr_dialogue(diplomacy_pathway);
			force_goodbye = 1;
		}
        if (point_in_rectangle(mouse_x, mouse_y, option_selections[2].lh, option_selections[2].top, option_selections[2].rh, option_selections[2].base)){
			cooldown=8000;
			diplomacy_pathway = "sacrifice_squad";
            var kill_squad;
            for(var i=0;i<array_length(obj_ini.squads);i++){
                kill_squad = obj_ini.squads[i];
                if (kill_squad.type == "tactical_squad"){
                    kill_squad.kill_members();
                    break;
                }
            }
			scr_dialogue(diplomacy_pathway);
			force_goodbye = 1;
		}
        if ( point_in_rectangle(mouse_x, mouse_y, option_selections[2].lh, option_selections[2].top, option_selections[2].rh, option_selections[2].base)){
			cooldown=8000;
            diplomacy_pathway = "daemon_scorn";
            scr_dialogue(diplomacy_pathway);
            force_goodbye = 1;
		}
	}
	if (diplomacy_pathway == "Slaanesh_path")  and (cooldown  <= 0){
		if point_in_rectangle(mouse_x, mouse_y, option_selections[0].lh, option_selections[0].top, option_selections[0].rh, option_selections[0].base){
			cooldown=8000;
            diplomacy_pathway = "Slaanesh_arti";
            scr_dialogue(diplomacy_pathway);
            force_goodbye = 1;
		}
		if point_in_rectangle(mouse_x, mouse_y, option_selections[1].lh, option_selections[1].top, option_selections[1].rh, option_selections[1].base){
			cooldown=8000;
            diplomacy_pathway = "daemon_scorn";
            scr_dialogue(diplomacy_pathway);
            force_goodbye = 1;
		}
	}
	if (diplomacy_pathway == "Nurgle_path")  and (cooldown  <= 0){
		if point_in_rectangle(mouse_x, mouse_y, option_selections[0].lh, option_selections[0].top, option_selections[0].rh, option_selections[0].base){
			cooldown=8000;
			diplomacy_pathway = "nurgle_gift";
			scr_dialogue(diplomacy_pathway);
			force_goodbye = 1;
		}
		if point_in_rectangle(mouse_x, mouse_y, option_selections[1].lh, option_selections[1].top, option_selections[1].rh, option_selections[1].base){
			cooldown=8000;
            diplomacy_pathway = "daemon_scorn";
            scr_dialogue(diplomacy_pathway);
            force_goodbye = 1;
		}
	}
	if (diplomacy_pathway == "Nurgle_path")  and (cooldown  <= 0){
		if point_in_rectangle(mouse_x, mouse_y, option_selections[0].lh, option_selections[0].top, option_selections[0].rh, option_selections[0].base){
			cooldown=8000;
            diplomacy_pathway = "nurgle_gift";
            scr_dialogue(diplomacy_pathway);
            force_goodbye = 1;
		}
				if point_in_rectangle(mouse_x, mouse_y, option_selections[1].lh, option_selections[1].top, option_selections[1].rh, option_selections[1].base){
			cooldown=8000;
            diplomacy_pathway = "daemon_scorn";
            scr_dialogue(diplomacy_pathway);
            force_goodbye = 1;
		}
	}	
	if (diplomacy_pathway = "Tzeentch_path")  and (cooldown  <= 0){
		if point_in_rectangle(mouse_x, mouse_y, option_selections[0].lh, option_selections[0].top, option_selections[0].rh, option_selections[0].base){
			cooldown=8000;
            diplomacy_pathway = "Tzeentch_plan";
            scr_dialogue(diplomacy_pathway);
            force_goodbye = 1;
		}
		if point_in_rectangle(mouse_x, mouse_y, option_selections[1].lh, option_selections[1].top, option_selections[1].rh, option_selections[1].base){
			cooldown=8000;
            diplomacy_pathway = "daemon_scorn";
            scr_dialogue(diplomacy_pathway);
            force_goodbye = 1;
		}
	}
}
// ** Diplomacy **
if (menu==20) and (diplomacy>0) or ((diplomacy<-5) and (diplomacy>-6)) and (cooldown<=0) and (diplomacy<10){
    if (trading==0) and (diplo_option[1]=="") and (diplo_option[2]=="") and (diplo_option[3]=="") and (diplo_option[4]==""){
        if (force_goodbye<=0){
            if (audience==0){
                // Trade
                if (mouse_x>=xx+442) and (mouse_y>=yy+718) and (mouse_x<xx+547) and (mouse_y<yy+737) and (audience==0) and (force_goodbye==0){
                    trading=1;
                    scr_dialogue("open_trade");
                    cooldown=8;
                    click2=1;
                    trade_likely="";
                }
                // Demand
                if (mouse_x>=xx+561) and (mouse_y>=yy+718) and (mouse_x<xx+667) and (mouse_y<yy+737) and (force_goodbye==0){
                    cooldown=8;
                    click2=1;
                    trading_demand=diplomacy;
                    scr_dialogue("trading_demand");
                }
                // Discuss
                if (mouse_x>=xx+682) and (mouse_y>=yy+718) and (mouse_x<xx+787) and (mouse_y<yy+737) and (force_goodbye==0){
                    // TODO
                }
            }
            // Denounce
            if (mouse_x>=xx+442) and (mouse_y>=yy+752) and (mouse_x<xx+547) and (mouse_y<yy+771) and (force_goodbye==0){
                if (diplo_last!="denounced"){
                    scr_dialogue("denounced");
                    cooldown=8;
                    click2=1;
                }
            }
            // Praise
            if (mouse_x>=xx+561) and (mouse_y>=yy+752) and (mouse_x<xx+667) and (mouse_y<yy+771) and (force_goodbye==0){
                if (diplo_last!="praised"){
                    scr_dialogue("praised");
                    cooldown=8;
                    click2=1;
                }
            }
            if (audience==0){
                // Propose Alliance
                if (mouse_x>=xx+682) and (mouse_y>=yy+752) and (mouse_x<xx+787) and (mouse_y<yy+771) and (force_goodbye==0){
                    if (diplo_last!="propose_alliance"){
                        cooldown=8;
                        click2=1;
                        scr_dialogue("propose_alliance");
                    }
                }
                // TODO Declare war here
            }
        }

        /*
        Propose Alliance    same as Discuss but 752-771
        Declare War         551,784,677,803
        */

        // Exit
        if (mouse_x>=xx+818) and (mouse_y>=yy+795) and (mouse_x<xx+897) and (mouse_y<yy+814){
            click=1;
            if (audio_is_playing(snd_blood)==true) then scr_music("royal",2000);

            if (complex_event==true) and (instance_exists(obj_temp_meeting)){
                complex_event=false;
                diplomacy=0;
                menu=0;
                force_goodbye=0;
                cooldown=80;
                with(obj_temp_meeting){instance_destroy();}
                if (instance_exists(obj_turn_end)){
                    obj_turn_end.alarm[1]=1;
                    exit;
                }
                exit;
            }
            if (trading_artifact!=0){
                for(var h=1; h<=4; h++){
                    diplo_option[h]="";
                    diplo_goto[h]="";
                }
                diplomacy=0;
                menu=0;
                force_goodbye=0;
                cooldown=8;
                if (trading_artifact==2) and (instance_exists(obj_temp4)){obj_temp4.alarm[2]=1;}// 135 this might not be needed
                trading_artifact=0;
                with(obj_popup){
                    obj_temp4.alarm[1]=1;
                    instance_destroy();
                }
                exit;
            }
            if (force_goodbye==5){
                for(var h=1; h<=4; h++){
                    diplo_option[h]="";
                    diplo_goto[h]="";
                }
                diplomacy=0;
                menu=0;
                force_goodbye=0;
                cooldown=8;
                exit;
            }
            if (liscensing==2) and (repair_ships==0){
                cooldown=8;
                var cru=instance_create(mouse_x,mouse_y,obj_crusade);
                cru.owner=diplomacy;
                cru.placing=true;
                diplomacy=0;
                force_goodbye=0;
                menu=0;
                exit_all=0;
                liscensing=0;
                if (zoomed==0) then scr_zoom();
                exit;
            }
            if (exit_all!=0){
                cooldown=8;
                diplomacy=0;
                force_goodbye=0;
                menu=0;
                exit_all=0;
            }
            if (diplo_last=="artifact_thanks") and (force_goodbye!=0){
                diplomacy=0;
                menu=13;
                force_goodbye=0;
                cooldown=8;
                exit;
            }
            // Exits back to diplomacy thing
            if (audience==0){
                cooldown=8;
                diplomacy=0;
                force_goodbye=0;
            }
            // No need to check for next audience
            if (audience>0) and (!instance_exists(obj_turn_end)){
                cooldown=8;
                diplomacy=0;
                menu=0;
                audience=0;
                force_goodbye=0;
                exit;
            }
            if (audience>0) and (instance_exists(obj_turn_end)){
                if (complex_event==false){
                    cooldown=8;
                    diplomacy=0;
                    menu=0;
                    obj_turn_end.alarm[1]=1;
                    audience=0;
                    force_goodbye=0;
                    exit;
                }
                if (complex_event=true){
                    // TODO
                }
            }// Have this check for the next audience, if any
        }
        // Trade goods go here
        if (trading==1) or (trading==2){
            for(var i=0;i<7;i++){
                trade_theirs[i]="";
                trade_disp[i]=-100;
            }

            trade_req=requisition;
            trade_gene=gene_seed;
            trade_chip=stc_wargear_un+stc_vehicles_un+stc_ships_un;
            trade_info=info_chips;

            // Imperium trade goods
            if (diplomacy==2){
                cooldown=8;
                trade_theirs[1]="Requisition";
                trade_theirs[2]="Recruiting Planet";
                trade_theirs[3]="License: Repair";
                trade_theirs[4]="License: Crusade";
            }
            // Mechanicus trade goods
            if (diplomacy==3){
                cooldown=8;
                trade_theirs[1]="Terminator Armour";
                trade_theirs[2]="Land Raider";
                trade_theirs[3]="Minor Artifact";
                trade_theirs[4]="Skitarii";
                trade_theirs[5]="Techpriest";
                trade_disp[1]=30;
                trade_disp[2]=20;
                trade_disp[3]=40;
                trade_disp[4]=30;
                trade_disp[5]=60;
            }
            // Inquisition trade goods
            if (diplomacy==4){
                cooldown=8;
                trade_theirs[1]="Condemnor Boltgun";
                trade_theirs[2]="Hellrifle";
                trade_theirs[3]="Incinerator";
                trade_theirs[4]="Crusader";
                trade_theirs[5]="Exterminatus";
                trade_theirs[6]="Cyclonic Torpedo";
                trade_disp[1]=20;
                trade_disp[2]=30;
                trade_disp[3]=20;
                trade_disp[4]=30;
                trade_disp[5]=40;
                trade_disp[6]=60;
            }
            // Ecclesiarchy trade goods
            if (diplomacy==5){
                cooldown=8;
                trade_theirs[1]="Eviscerator";
                trade_theirs[2]="Heavy Flamer";
                trade_theirs[3]="Inferno Bolts";
                trade_theirs[4]="Sister of Battle";
                trade_theirs[5]="Sister Hospitaler";
                trade_disp[1]=20;
                trade_disp[2]=30;
                trade_disp[3]=30;
                trade_disp[4]=50;
                trade_disp[5]=50;
            }
            // Eldar trade goods
            if (diplomacy==6){
                cooldown=8;
                trade_theirs[1]="Master Crafted Power Sword";
                trade_theirs[2]="Archeotech Laspistol";
                trade_theirs[3]="Ranger";
                trade_theirs[4]="Useful Information";
                trade_disp[1]=-10;
                trade_disp[2]=-10;
                trade_disp[3]=10;
                trade_disp[4]=-15;
                if (random_event_next != EVENT.none) and ((string_count("WL10|",useful_info)>0) or (turn<chaos_turn)) and ((string_count("WL7|",useful_info)>0) or (known[eFACTION.Ork]<1)) and  (string_count("WG|",useful_info)>1) and (string_count("CM|",useful_info)>0) then trade_disp[4]=1000;
            }
            // Ork trade goods
            if (diplomacy==7){
                cooldown=8;
                trade_theirs[1]="Power Klaw";
                trade_theirs[2]="Ork Sniper";
                trade_theirs[3]="Flash Git";
            }
            if (diplomacy==8) then trade_theirs[1]="Test";
        }
    }
    if (trading==0) and ((diplo_option[1]!="") or (diplo_option[2]!="") or (diplo_option[3]!="") or (diplo_option[4]!="")){
        if (force_goodbye==0) and (cooldown<=0){

            var diplo_pressed=0;
            yy=__view_get( e__VW.YView, 0 )+0;

            var opts=0;
            for(var dp=1; dp<=4; dp++){if (diplo_option[dp]!="") then opts+=1;}
            if (opts==4) then yy-=30;
            if (opts==2) then yy+=30;
            if (opts==1) then yy+=60;
            for(var slot=1; slot<=4; slot++){
                if (diplo_option[slot]!=""){
                    if (mouse_x>=xx+354) and (mouse_y>=yy+694) and (mouse_x<xx+887) and (mouse_y<yy+717) and (cooldown<=0){
                        diplo_pressed=slot;
                    }
                }
                yy+=30;
            }
            yy=__view_get( e__VW.YView, 0 );

            if (diplo_pressed>0) and (diplo_goto[diplo_pressed]!="") and (cooldown<=0){
                click2=1;
                scr_dialogue(diplo_goto[diplo_pressed]);
                cooldown=4000;
                exit;
            }
            if (diplo_pressed==1){
                click2=1;
                if (questing==0) and (trading_artifact==0) and (trading_demand==0){
                    if (diplomacy==4) and (diplo_option[1]=="It will not happen again"){// It will not happen again mang
                        scr_dialogue("you_better");
                        diplo_option[1]="";
                        diplo_option[2]="";
                        diplo_option[3]="";
                        force_goodbye=1;

                        var tb,tc;
                        explode_script(obj_controller.temp[1008],"|");
                        tb=string(explode[0]);
                        tc=real(explode[1]);
                        var ev=0;
                        for(var v=1; v<=99; v++){if (ev==0) and (event[v]=="") then ev=v;}
                        event[ev]="remove_serf|"+string(tb)+"|"+string(tc)+"|";
                        event_duration[ev]=choose(1,2);
                        exit;
                    }
                }
                if (questing!=0){
                    cooldown=8;
                    if (questing==1) and (diplomacy==6){
                        if (requisition>=500){
                            scr_loyalty("Xeno Trade","+");
                            scr_dialogue("mission1_thanks");
                            scr_quest(2,"300req",6,0);
                            requisition-=500;questing=0;
                            diplo_option[1]="";
                            diplo_option[2]="";
                            diplo_option[3]="";
                            exit;
                        }
                    }
                }
                if ((diplomacy==3) or (diplomacy==5)) and (trading_artifact!=0){
                    trading=1;
                    scr_dialogue("open_trade");
                    trade_take[1]="Artifact";
                    trade_tnum[1]=1;
                    trade_req=requisition;
                    trade_gene=gene_seed;
                    trade_chip=info_chips;
                    trade_info=stc_wargear_un+stc_vehicles_un+stc_ships_un;
                }
                if (trading_demand>0) and (diplo_option[1]!="Cancel") and (diplo_option[1]!="") then scr_demand(1);
            }
            if (diplo_pressed==2){
                click2=1;

                if (questing==0) and (trading_artifact==0) and (trading_demand==0){// Don't want no trabble
                    if (diplomacy==4) and (diplo_option[2]=="Very well"){
                        diplo_option[1]="";
                        diplo_option[2]="";
                        diplo_option[3]="";
                        force_goodbye=1;

                        var tb,tc;
                        explode_script(obj_controller.temp[1008],"|");
                        tb=string(explode[0]);
                        tc=real(explode[1]);
                        var ev=0;
                        for(var v=1; v<=99; v++){if (ev==0) and (event[v]=="") then ev=v;}
                        event[ev]="remove_serf|"+string(tb)+"|"+string(tc)+"|";
                        event_duration[ev]=choose(1,2);
                        cooldown=8;
                        diplomacy=0;
                        menu=0;
                        obj_turn_end.alarm[1]=1;
                        audience=0;
                        force_goodbye=0;
                        exit;
                    }
                }
                if (questing!=0){
                    cooldown=8;
                    if (questing==1) and (diplomacy==6){
                        scr_dialogue("quest_maybe");
                        questing=0;
                        diplo_option[1]="";
                        diplo_option[2]="";
                        diplo_option[3]="";
                        exit;
                    }
                }
                if (trading_demand>0) and (diplo_option[2]!="Cancel") and (diplo_option[2]!="") then scr_demand(2);
                if (trading_demand>0) and (diplo_option[2]=="Cancel"){
                    cooldown=8000;
                    trading_demand=0;
                    diplo_option[1]="";
                    diplo_option[2]="";
                    diplo_option[3]="";
                    diplo_text="...";
                    diplo_txt="...";
                }
                if (diplomacy>0) and (trading_artifact>0) and (menu==20){
                    cooldown=8;
                    obj_temp4.alarm[1]=2;
                    trading_artifact=0;
                    menu=0;
                    diplomacy=0;
                    diplo_option[1]="";
                    diplo_option[2]="";
                    diplo_option[3]="";
                }
            }
            if (diplo_pressed==3){
                click2=1;
                if (questing==0) and (trading_artifact==0) and (trading_demand==0){
                    if (diplomacy==4) and (string_count("You will not",diplo_option[3])>0){// MIIIIINE!!!1
                        scr_dialogue("die_heretic");
                        diplo_option[1]="";
                        diplo_option[2]="";
                        diplo_option[3]="";
                        force_goodbye=1;
                        exit;
                    }
                }
                if (questing!=0){
                    cooldown=8;
                    if (questing==1) and (diplomacy==6){// That +2 counteracts the WAITED TOO LONG penalty
                        scr_dialogue("mission1_refused");
                        scr_quest(3,"300req",6,0);
                        questing=0;
                        diplo_option[1]="";
                        diplo_option[2]="";
                        diplo_option[3]="";
                        exit;
                    }
                }
                if (trading_demand>0) and (diplo_option[3]!="Cancel") and (diplo_option[3]!="") then scr_demand(3);
                if (trading_demand>0) and (diplo_option[3]=="Cancel"){
                    cooldown=8;
                    trading_demand=0;
                    diplo_option[1]="";
                    diplo_option[2]="";
                    diplo_option[3]="";
                    diplo_text="...";
                    diplo_txt="...";
                }
            }
        }
        if (force_goodbye!=0) and (cooldown<=0){// Want to check to see if the deal went fine here
            if (trading_artifact!=0){
                click2=1;
                obj_controller.diplo_option[1]="";
                obj_controller.diplo_option[2]="";
                diplo_option[3]="";
                diplomacy=0;
                menu=0;
                force_goodbye=0;
                with(obj_popup){instance_destroy();}
                if (trading_artifact!=2) then obj_temp4.alarm[1]=1;
                if (trading_artifact==2) then obj_temp4.alarm[2]=1;
                exit;
            }
        }
    }
    //
    if (trading==1) or (trading==2){
        // Exit
        if (scr_hit(xx+818,yy+796,xx+897,yy+815)==true){
            cooldown=8;
            trading=0;
            scr_dialogue("trade_close");
            click2=1;
            
            for(var i=0;i<6;i++){
                trade_take[i]="";
                trade_tnum[i]=0;
                trade_give[i]="";
                trade_mnum[i]=0;
            }
            if (trading_artifact!=0){
                diplomacy=0;
                menu=0;
                force_goodbye=0;
                with(obj_popup){instance_destroy();}
                obj_temp4.alarm[1]=1;
                exit;
            }
            // Also need to disable the popup OFFER TERMS option
        }
        // Clear Terms
        if (scr_hit(xx+510,yy+649,xx+615,yy+668)==true){
            cooldown=8;
            click2=1;
            trade_likely="";
            trade_req=requisition;
            trade_gene=gene_seed;
            trade_chip=stc_wargear_un+stc_vehicles_un+stc_ships_un;
            trade_info=info_chips;

            for(var i=0;i<6;i++){
                if (trading_artifact==0){
                    trade_take[i]="";
                    trade_tnum[i]=0;
                }
                trade_give[i]="";
                trade_mnum[i]=0;
            }
        }
        // Trade Here?
        if (scr_hit(xx+630,yy+649,xx+735,yy+668)==true){
            cooldown=8;
            click2=1;
            if (diplo_last!="offer") then scr_trade(true);
        }

        var minz=0;
        if (trade_give[4]=="") then minz=4;
        if (trade_give[3]=="") then minz=3;
        if (trade_give[2]=="") then minz=2;
        if (trade_give[1]=="") then minz=1;

        // Opponent things to offer
        if (trading_artifact==0){
            if (scr_hit(xx+342,yy+371,xx+485,yy+422)==true) and (cooldown<=0) and (disposition[diplomacy]>=trade_disp[1]){
                cooldown=8;
                click2=1;
                scr_trade_add(string(trade_theirs[1]));
            }
            if (scr_hit(xx+342,yy+422,xx+485,yy+470)==true) and (cooldown<=0) and (disposition[diplomacy]>=trade_disp[2]){
                cooldown=8;
                click2=1;
                scr_trade_add(string(trade_theirs[2]));
            }
            if (scr_hit(xx+342,yy+470,xx+485,yy+517)==true) and (cooldown<=0) and (disposition[diplomacy]>=trade_disp[3]){
                cooldown=8;
                click2=1;
                scr_trade_add(string(trade_theirs[3]));
            }
            if (scr_hit(xx+342,yy+517,xx+485,yy+564)==true) and (cooldown<=0) and (disposition[diplomacy]>=trade_disp[4]){
                cooldown=8;
                click2=1;
                scr_trade_add(string(trade_theirs[4]));
            }
            if (scr_hit(xx+342,yy+564,xx+485,yy+611)==true) and (cooldown<=0) and (disposition[diplomacy]>=trade_disp[5]){
                cooldown=8;
                click2=1;
                scr_trade_add(string(trade_theirs[5]));
            }
        }
        xx+=419;
        // Player Things to Offer
        // Requisition
        if (scr_hit(xx+342,yy+371,xx+485,yy+422)==true) and (minz!=0) and (cooldown<=0) and (trade_req>0){
            cooldown=8000;
            click2=1;
            get_integer2("Requisition offered?",trade_req,"m"+string(minz),"Requisition");
            scr_trade(false);
        }
        // Gene-seed
        if (scr_hit(xx+342,yy+422,xx+485,yy+470)==true) and (minz!=0) and (cooldown<=0) and (trade_gene>0){
            cooldown=8000;
            click2=1;
            get_integer2("Gene-Seed offered?",trade_gene,"m"+string(minz),"Gene-Seed");
            scr_trade(false);
        }
        // STC Fragment
        if (scr_hit(xx+342,yy+470,xx+485,yy+517)==true) and (minz!=0) and (cooldown<=0) and (trade_chip>0){
            cooldown=8000;
            click2=1;
            get_integer2("STC Fragments offered?",trade_chip,"m"+string(minz),"STC Fragment");
            scr_trade(false);
        }
        // Info Chips
        if (scr_hit(xx+342,yy+517,xx+485,yy+564)==true) and (minz!=0) and (cooldown<=0) and (trade_info>0){
            cooldown=8000;
            click2=1;
            get_integer2("Info Chips offered?",trade_info,"m"+string(minz),"Info Chip");
            scr_trade(false);
        }
        xx-=419;
        // Remove items buttons
        if (trading_artifact==0){
            if (scr_hit(xx+507,yy+399,xx+527,yy+418)==true) and (trade_tnum[2]==0) and (trade_tnum[1]!=0) and (cooldown<=0){
                trade_tnum[1]=0;
                trade_take[1]="";
                cooldown=8000;
                click2=1;
                scr_trade(false);
            }
            if (scr_hit(xx+507,yy+419,xx+527,yy+438)==true) and (trade_tnum[3]==0) and (trade_tnum[2]!=0) and (cooldown<=0){
                trade_tnum[2]=0;
                trade_take[2]="";
                cooldown=8000;
                click2=1;
                scr_trade(false);
            }
            if (scr_hit(xx+507,yy+439,xx+527,yy+458)==true) and (trade_tnum[4]==0) and (trade_tnum[3]!=0) and (cooldown<=0){
                trade_tnum[3]=0;
                trade_take[3]="";
                cooldown=8000;
                click2=1;
                scr_trade(false);
            }
            if (scr_hit(xx+507,yy+459,xx+527,yy+478)==true) and (trade_tnum[4]!=0) and (cooldown<=0){
                trade_tnum[4]=0;
                trade_take[4]="";
                cooldown=8000;
                click2=1;
                scr_trade(false);
            }
        }
        if (scr_hit(xx+507,yy+547,xx+527,yy+566)==true) and (trade_mnum[2]==0) and (trade_mnum[1]!=0) and (cooldown<=0){
            if (trade_give[1]=="Requisition") then trade_req+=trade_mnum[1];
            if (trade_give[1]=="Gene-Seed") then trade_gene+=trade_mnum[1];
            if (trade_give[1]=="STC Fragment") then trade_chip+=trade_mnum[1];
            if (trade_give[1]=="Info Chip") then trade_info+=trade_mnum[1];
            trade_mnum[1]=0;
            trade_give[1]="";
            cooldown=8000;
            click2=1;
            scr_trade(false);
        }
        if (scr_hit(xx+507,yy+567,xx+527,yy+586)==true) and (trade_mnum[3]==0) and (trade_mnum[2]!=0) and (cooldown<=0){
            if (trade_give[2]=="Requisition") then trade_req+=trade_mnum[2];
            if (trade_give[2]=="Gene-Seed") then trade_gene+=trade_mnum[2];
            if (trade_give[2]=="STC Fragment") then trade_chip+=trade_mnum[2];
            if (trade_give[2]=="Info Chip") then trade_info+=trade_mnum[2];
            trade_mnum[2]=0;
            trade_give[2]="";
            cooldown=8000;
            click2=1;
            scr_trade(false);
        }
        if (scr_hit(xx+507,yy+587,xx+527,yy+606)==true) and (trade_mnum[4]==0) and (trade_mnum[3]!=0) and (cooldown<=0){
            if (trade_give[3]=="Requisition") then trade_req+=trade_mnum[3];
            if (trade_give[3]=="Gene-Seed") then trade_gene+=trade_mnum[3];
            if (trade_give[3]=="STC Fragment") then trade_chip+=trade_mnum[3];
            if (trade_give[3]=="Info Chip") then trade_info+=trade_mnum[3];
            trade_mnum[3]=0;
            trade_give[3]="";
            cooldown=8000;
            click2=1;
            scr_trade(false);
        }
        if (scr_hit(xx+507,yy+607,xx+527,yy+626)==true) and (trade_mnum[4]!=0) and (cooldown<=0){
            if (trade_give[4]=="Requisition") then trade_req+=trade_mnum[4];
            if (trade_give[4]=="Gene-Seed") then trade_gene+=trade_mnum[4];
            if (trade_give[4]=="STC Fragment") then trade_chip+=trade_mnum[4];
            if (trade_give[4]=="Info Chip") then trade_info+=trade_mnum[4];
            trade_mnum[4]=0;
            trade_give[4]="";
            cooldown=8000;
            click2=1;
            scr_trade(false);
        }
    }
}
// Diplomacy
if (zoomed==0) and (cooldown<=0) and (menu==20) and (diplomacy==0){
    xx+=55;
    yy-=20;
	var onceh=0
	// Daemon emmissary
	    if (point_in_rectangle(mouse_x, mouse_y, xx+688,yy+181,xx+1028,yy+281)){
			diplomacy=10.1;
            diplomacy_pathway="intro";
            scr_dialogue(diplomacy_pathway);
            onceh=1;
            cooldown = 1;
		}
    var faction_interact_coords=[
        [
            [xx+194,yy+355,xx+288,yy+369],//imperium
            [xx+292,yy+355,xx+350,yy+369],
            2
        ],
        [
            [xx+194,yy+491,xx+288,yy+503],//mechanicus
            [xx+292,yy+491,xx+350,yy+503],
            3
        ],
        [
            [xx+194,yy+630,xx+288,yy+644],//Inquisition
            [xx+292,yy+630,xx+350,yy+644],
            4
        ],
        [
            [xx+194,yy+760,xx+288,yy+774],//sisters
            [xx+292,yy+760,xx+350,yy+774],
            5
        ], 
        [
            [xx+1203,yy+355,xx+1300,yy+369],//eldar
            [xx+1303,yy+355,xx+1350,yy+369],
            6
        ],
        [
            [xx+1203,yy+491,xx+1300,yy+503],//orks
            [xx+1303,yy+491,xx+1350,yy+503],
            7
        ],
        [
            [xx+1203,yy+630,xx+1300,yy+644],//Tau
            [xx+1303,yy+630,xx+1350,yy+644],
            8
        ],
        [
            [xx+1203,yy+760,xx+1300,yy+774],//heretic
            [xx+1303,yy+760,xx+1350,yy+774],
            10
        ],                                           
    ]
    for (var i=0;i<array_length(faction_interact_coords);i++){
        var fac_data = faction_interact_coords[i];
        if (point_in_rectangle(mouse_x, mouse_y, fac_data[0][0], fac_data[0][1], fac_data[0][2], fac_data[0][3])){
            if (known[fac_data[2]]!=0) and (turns_ignored[fac_data[2]]==0){
                diplomacy=fac_data[2];
                cooldown=8000;
            }
        } else if (point_in_rectangle(mouse_x, mouse_y, fac_data[1][0], fac_data[1][1], fac_data[1][2], fac_data[1][3])){
            cooldown=8000;
            click2=1;
            if (ignore[fac_data[2]]==0){
                ignore[fac_data[2]]=1;
            }else if (ignore[fac_data[2]]==1){
                ignore[fac_data[2]]=0;
            }            
        }
    }
    if (diplomacy>0) and (cooldown==8000){
        onceh=0;
        if (known[diplomacy]==1) and (diplomacy!=4) and (onceh==0){
            scr_dialogue("intro");
            onceh=1;
            known[diplomacy]=2;
            faction_justmet=1;
        }
        if (known[diplomacy]>=2) and (diplomacy!=4) and (onceh==0){
            scr_dialogue("hello");
            onceh=1;
        }
        if (known[eFACTION.Inquisition]==1) and (diplomacy==4) and (onceh==0){
            scr_dialogue("intro");
            onceh=1;
            known[diplomacy]=2;
            faction_justmet=1;
            obj_controller.last_mission=turn+1;
        }
        if (known[eFACTION.Inquisition]==3) and (diplomacy==4) and (onceh==0){
            scr_dialogue("intro");
            onceh=1;
            known[diplomacy]=4;
            faction_justmet=1;
            obj_controller.last_mission=turn+1;
        }
        if (known[diplomacy]>=4) and (diplomacy==4) and (onceh==0){
            scr_dialogue("hello");
            onceh=1;
        }
    }
}
// Menu transitions 
if (action_if_number(obj_saveload, 0, 0) &&
    action_if_number(obj_drop_select, 0, 0) &&
    action_if_number(obj_popup_dialogue, 0, 0) &&
    action_if_number(obj_ncombat, 0, 0)) {
    
    if (combat!=0) then exit;
    if (scrollbar_engaged!=0) then exit;
    if (instance_exists(obj_ingame_menu)) then exit;


    if (instance_exists(obj_turn_end)) and (obj_controller.complex_event!=true) and (!instance_exists(obj_temp_meeting)){
        if (obj_turn_end.popups_end==1) and (audience==0) and (cooldown<=0) then with(obj_turn_end){instance_destroy();}
    }
    if (instance_exists(obj_turn_end)) and (audience==0) then exit;
    if (instance_exists(obj_star_select)) then exit;
    if (instance_exists(obj_bomb_select)) then exit;

    if (zoomed==0) and (cooldown<=0) and (menu>=500) and (menu<=510){

        if (mouse_y>=__view_get( e__VW.YView, 0 )+27){
            cooldown=8000;
            if (menu>=500) and (temp[menu-434]=""){
                menu=0;
                exit;
            }
            if (menu<503) and (menu!=0) then menu+=1;
        }
    }

    if (menu>=500) then exit;

    var zoomeh=0,diyst=999,onceh=0;
    xx=__view_get( e__VW.XView, 0 );
    yy=__view_get( e__VW.YView, 0 );
    zoomeh=zoomed;

    if (menu==0) then hide_banner=0;// 136 ;

    if (zoomed==0) and (!instance_exists(obj_ingame_menu)) and (!instance_exists(obj_popup)){
        // Main Menu
        if (scr_hit(xx+1485,yy+7,xx+1589,yy+48)==true){
            instance_create(0,0,obj_ingame_menu);
        }
        // Menu - Help
        if (scr_hit(xx+1375,yy+7,xx+1480,yy+48)==true) and (cooldown<=0){
            if (menu!=17.5) and (onceh==0){
                menu=17.5;
                onceh=1;
                cooldown=8000;
                click=1;
                hide_banner=0;
                instance_activate_object(obj_event_log);
                obj_event_log.top=1;
                obj_event_log.help=1;
            }
            if (menu==17.5) and (onceh==0){
                menu=0;
                onceh=1;
                cooldown=8000;
                click=1;
                hide_banner=0;
            }
            managing=0;
        }
    }
    if (instance_exists(obj_temp_build)){
        if (obj_temp_build.isnew==1) then exit;
    }
    // Fleet panel minimize
    if (zoomed==0) and (cooldown<=0) and (diplomacy==0){
        if (popup==1) or (popup==2){
            if (mouse_x>=__view_get( e__VW.XView, 0 )+18+obj_fleet_select.void_wid) and (mouse_y>=__view_get( e__VW.YView, 0 )+116)
            and (mouse_x<__view_get( e__VW.XView, 0 )+36+obj_fleet_select.void_wid) and (mouse_y<__view_get( e__VW.YView, 0 )+134) and (cooldown<=0){
                if (fleet_minimized==0) and (cooldown<=0){
                    fleet_minimized=1;
                    cooldown=8000;
                    click=1;
                }
                if (fleet_minimized==1) and (cooldown<=0){
                    fleet_minimized=0;
                    cooldown=8000;
                    click=1;
                }
            }
        }
        // Save and exit
        if (mouse_y>=yy+0) and (mouse_y<yy+26){
            var sv;
            if (mouse_x>=xx+431) and (mouse_x<xx+496){
                menu=999;
                zui=1;
                cooldown=8000;
                click=1;
                sv=instance_create(x,y,obj_saveload);
                sv.menu=1;
            }
            if (mouse_x>=xx+496) and (mouse_x<xx+559){
                    menu=999;
                    zui=1;
                    cooldown=8000;
                    click=1;
                    sv=instance_create(x,y,obj_saveload);
                    sv.menu=2;
            }
            if (mouse_x>=xx+559) and (mouse_x<xx+623){
                menu=999;
                cooldown=8000;
                click=1;
                with(obj_ini){instance_destroy();}
                room_goto(Main_Menu);
                with(obj_controller){instance_destroy();}
                instance_destroy();
            }
        }
        // Management
        if (mouse_x>=xx+36) and (mouse_y>=yy+837) and (mouse_x<xx+176) and (mouse_y<yy+877){
            if (menu!=1)and (onceh==0){
                scr_management(1);
                menu=1;
                onceh=1;
                cooldown=8000;
                click=1;
                popup=0;
                selected=0;
                hide_banner=1;
                with(obj_star_select){instance_destroy();}
                with(obj_fleet_select){instance_destroy();}
            }
            if (menu==1) and (onceh==0){
                menu=0;
                onceh=1;
                cooldown=8000;
                click=1;
                hide_banner=0;
            }
            managing=0;
        }
        // Settings
        if (mouse_x>=xx+179) and (mouse_y>=yy+837) and (mouse_x<xx+321) and (mouse_y<yy+877){
            onceh=0;
            if (menu!=21) and (onceh==0){
                onceh=1;
                menu=21;
                cooldown=8000;
                click=1;
                popup=0;
                selected=0;
                hide_banner=1;
                with(obj_star_select){instance_destroy();}
                with(obj_fleet_select){instance_destroy();}
            }
            if (menu==21) and (onceh==0){
                onceh=0;
                if (settings==0) and (onceh==0){
                    menu=0;
                    onceh=1;
                    cooldown=8000;
                    click=1;
                    hide_banner=0;
                }
                if (settings>0) and (onceh==0){
                    menu=21;
                    onceh=1;
                    cooldown=8000;
                    click=1;
                    settings=0;
                }
            }
        }
        // Apothecarium
        if (mouse_x>=xx+358) and (mouse_y>=yy+838) and (mouse_x<xx+471) and (mouse_y<yy+879){
            menu_adept=0;
            hide_banner=1;
            if (scr_role_count("Master of the Apothecarion","0")==0) then menu_adept=1;
            if (menu!=11) and (onceh==0){
                menu=11;
                onceh=1;
                cooldown=8000;
                click=1;
                temp[36]=scr_role_count(obj_ini.role[100][15],"");
            }
            if (menu==11) and (onceh==0){
                menu=0;
                onceh=1;
                cooldown=8000;
                click=1;
            }
            managing=0;
        }
        // Reclusium
        if (mouse_x>=xx+474) and (mouse_y>=yy+838) and (mouse_x<xx+587) and (mouse_y<yy+879){
            menu_adept=0;
            hide_banner=1;
            if (scr_role_count("Master of Sanctity","0")==0) then menu_adept=1;
            if (menu!=12) and (onceh==0){
                menu=12;
                onceh=1;
                cooldown=8000;
                click=1;
                temp[36]=string(scr_role_count(obj_ini.role[100][14],"field"));
                temp[37]=string(scr_role_count(obj_ini.role[100][14],"home"));
                penitorium=0;

                // Get list of jailed marines
                var p=0;
                for(var c=0; c<11; c++){
                    for(var e=1; e<=250; e++){
                        if (obj_ini.god[c,e]>=10){
                            p+=1;
                            penit_co[p]=c;
                            penit_id[p]=e;
                            penitorium+=1;
                        }
                    }
                }
            }
            if (menu==12) and (onceh==0){
                menu=0;
                onceh=1;
                cooldown=8000;
                click=1;
            }
            managing=0;
        }
        // Librarium
        if (mouse_x>=xx+591) and (mouse_y>=yy+838) and (mouse_x<xx+704) and (mouse_y<yy+879){
            menu_adept=0;
            hide_banner=1;
            if (scr_role_count("Chief "+string(obj_ini.role[100][17]),"0")==0) then menu_adept=1;
            if (menu!=13) and (onceh==0){
                menu=13;
                onceh=1;
                cooldown=8000;
                click=1;
                if (artifacts>0) and (menu_artifact==0) then menu_artifact=1;
                temp[36]=scr_role_count(obj_ini.role[100][17],"");
                temp[37]=scr_role_count("Codiciery","");
                temp[38]=scr_role_count("Lexicanum","");
            }
            if (menu==13) and (onceh==0){
                menu=0;
                onceh=1;
                cooldown=8000;
                click=1;
            }
            managing=0;
        }
        // Armamentarium
        if (mouse_x>=xx+707) and (mouse_y>=yy+838) and (mouse_x<xx+820) and (mouse_y<yy+879){
            menu_adept=0;
            hide_banner=1;
            if (scr_role_count("Forge Master","0")==0) then menu_adept=1;
            if (menu!=14) and (onceh==0){
                menu=14;
                onceh=1;
                cooldown=8000;
                click=1;
                temp[36]=scr_role_count(obj_ini.role[100][16],"");
                temp[37]=temp[36]+scr_role_count(string(obj_ini.role[100][16])+" Aspirant","");
            }
            if (menu==14) and (onceh==0){
                menu=0;
                onceh=1;
                cooldown=8000;
                click=1;
            }
            managing=0;
        }
        // Recruiting
        if (mouse_x>=xx+805) and (mouse_y>=yy+838) and (mouse_x<xx+918) and (mouse_y<yy+879){
            var geh=0,good=0;
            for(geh=1; geh<=50; geh++){
                geh+=1;
                if (good==0){
                    if (obj_ini.role[10,geh]==obj_ini.role[100][5]) and (obj_ini.name[10,geh]==obj_ini.recruiter_name) then good=geh;
                }
            }
            menu_adept=0;
            hide_banner=1;
            if (menu!=15) and (onceh==0){
                menu=15;
                onceh=1;
                cooldown=8000;
                click=1;
            }
            if (menu==15) and (onceh==0){
                menu=0;
                onceh=1;
                cooldown=8000;
                click=1;
            }
            managing=0;
        }
        // Master of the Fleet
        if (mouse_x>=xx+939) and (mouse_y>=yy+838) and (mouse_x<xx+1052) and (mouse_y<yy+879){
            menu_adept=0;
            hide_banner=1;
            var geh=0,good=0;
            for(geh=1; geh<=50; geh++){
                if (good==0){
                    if (obj_ini.role[4,geh]=obj_ini.role[100][5]) and (obj_ini.name[10,geh]=obj_ini.lord_admiral_name) then good=geh;
                }
            }
            if (menu!=16) and (onceh==0){
                menu=16;
                onceh=1;
                cooldown=8000;
                click=1;
                temp[37]="";
                temp[38]="";
                temp[39]="";
                temp[40]="";
                temp[41]="";
                for(var i=101;i<120;i++){
                     temp[i]="";
                }

                var g=0,u=0,m=0,d=0;
                for(var i=1; i<=60; i++){
                    if (obj_ini.ship[i]!="") and (obj_ini.ship_size[i]==3) then g+=1;
                }
                temp[37]=string(g);
                g=0;
                for(var i=1; i<=60; i++){
                    if (obj_ini.ship[i]!="") and (obj_ini.ship_size[i]==2) then g+=1;
                }
                temp[38]=string(g);
                g=0;
                for(var i=1; i<=60; i++){
                    if (obj_ini.ship[i]!="") and (obj_ini.ship_size[i]==1) then g+=1;
                }
                temp[39]=string(g);
                g=0;
                for(var i=1; i<=60; i++){
                    if (g!=0) and (obj_ini.ship[i]!=""){
                        if ((obj_ini.ship_hp[i]/obj_ini.ship_maxhp[i])<u){
                            g=i;
                            u=obj_ini.ship_hp[i]/obj_ini.ship_maxhp[i];
                        }
                    }
                    if (g==0) and (obj_ini.ship[i]!=""){
                        g=i;
                        u=obj_ini.ship_hp[i]/obj_ini.ship_maxhp[i];
                    }
                    if (obj_ini.ship[i]!="") then m=i;
                    if (obj_ini.ship[i]!="") and ((obj_ini.ship_hp[i]/obj_ini.ship_maxhp[i])<0.25) then d+=1;
                }
                if (g!=0){
                    temp[40]=string(obj_ini.ship_class[g])+" '"+string(obj_ini.ship[g])+"'";
                    temp[41]=string(u);
                    temp[42]=string(d);
                }
                man_max=m;
                man_current=1;
            }
            if (menu==16) and (onceh==0){
                menu=0;
                onceh=1;
                cooldown=8000;
                click=1;
            }
            managing=0;
        }
        // Diplomacy
        if (mouse_x>=xx+1131) and (mouse_y>=yy+838) and (mouse_x<xx+1273) and (mouse_y<yy+879){
            if (menu!=20) and (onceh==0){
                menu=20;
                onceh=1;
                cooldown=8000;
                click=1;
                hide_banner=1;
            }
            if (menu==20) and (onceh==0){
                menu=0;
                onceh=1;
                cooldown=8000;
                click=1;
                hide_banner=0;
            }
            managing=0;
        }
        // Event Log
        if (scr_hit(xx+1275,yy+838,xx+1417,yy+879)=true){
            if (menu!=17) and (onceh==0){
                menu=17;
                onceh=1;
                cooldown=8000;
                click=1;
                hide_banner=1;
                instance_activate_object(obj_event_log);
                obj_event_log.top=1;
            }
            if (menu==17) and (onceh==0){
                menu=0;
                onceh=1;
                cooldown=8000;
                click=1;
                hide_banner=0;
            }
            managing=0;
        }
        // End Turn
        if (mouse_x>=xx+1420) and (mouse_y>=yy+837) and (mouse_x<xx+1562) and (mouse_y<yy+877){
            if (menu==0) and (cooldown<=0){
                cooldown=8;
                menu=0;

                if (!instance_exists(obj_turn_end)) then ok=1;
                if (instance_exists(obj_turn_end)){if (obj_turn_end.popups_end==1) then ok=1;}

                if (ok==1){
                    with(obj_turn_end){instance_destroy();}
                    with(obj_star_event){instance_destroy();}
                    cooldown=8;
                    audio_play_sound(snd_end_turn,-50,0);
                    audio_sound_gain(snd_end_turn,master_volume*effect_volume,0);

                    turn+=1;

                    with(obj_star){
                        for (var i=0;i<=21;i++){
                            present_fleet[i]=0;
                        }
                    }
                    with(obj_p_fleet){
                        if (action=="move") and (obj_controller.faction_status[eFACTION.Imperium]=="War"){
                            var him=instance_nearest(action_x,action_y,obj_star);
                            if (point_distance(action_x,action_y,him.x,him.y)<10){
                                him.present_fleet[20]=1;
                            }
                        }
                    }
                    with(obj_en_fleet){
                        if (action=="move") and (owner>5){
                            var him=instance_nearest(action_x,action_y,obj_star);
                            if (point_distance(action_x,action_y,him.x,him.y)<10){
                                him.present_fleet[20]=1;
                            }
                        }
                    }

                    if (instance_exists(obj_p_fleet)){obj_p_fleet.alarm[1]=1;}
                    if (instance_exists(obj_en_fleet)){obj_en_fleet.alarm[1]=1;}
                    if (instance_exists(obj_crusade)){obj_crusade.alarm[0]=2;}

                    requisition+=income;
                    scr_income();
                    gene_tithe-=1;

                    // Do that after the combats and all of that crap
                    with(obj_star){
                        ai_a=2;
                        ai_b=3;
                        ai_c=4;
                        ai_d=5;
                        ai_e=5;
                        if (p_type[1]=="Craftworld"){
                            instance_deactivate_object(id);
                        }
                    }
                    alarm[5]=6;
                    instance_create(0,0,obj_turn_end);
                    scr_turn_first();
                }
            }

            if (menu==1) and (onceh==0){
                menu=0;
                onceh=1;
                cooldown=8000;
                click=1;
                hide_banner=0;
            }
            managing=0;
        }
    }
    if (zoomed==0) and (menu==40) and (cooldown<=0){
        xx=xx+0;
        yy=yy+0;

        if (mouse_x>=xx+73) and (mouse_y>=yy+69) and (mouse_x<xx+305) and (mouse_y<yy+415){
            menu=41;
            cooldown=8000;
        }
        if (mouse_x>=xx+336) and (mouse_y>=yy+69) and (mouse_x<xx+568) and (mouse_y<yy+415){
            menu=42;
            cooldown=8000;
        }
    }
    // Main management screen
    if (zoomed==0) and (menu==1) and (managing==0) and (cooldown<=0) and (diplomacy==0){
        managing=0;

        xx=xx+0;
        yy=yy+0;
        var click_positions_company=[
            [xx+40,yy+224,xx+152,yy+256+64],// 1st
            [xx+152,yy+224,xx+264,yy+256+64],// 2nd
            [xx+264,yy+224,xx+376,yy+256+64],// 3rd
            [xx+376,yy+224,xx+488,yy+256+64],// 4th
            [xx+488,yy+224,xx+600,yy+256+64],// 5th
            [xx+40,yy+224,xx+152,yy+256+64],// 6th
            [xx+152,yy+224,xx+264,yy+256+64],// 7th
            [xx+264,yy+224,xx+376,yy+256+64],// 8th
            [xx+376,yy+224,xx+488,yy+256+64],// 9th
            [xx+488,yy+224,xx+600,yy+256+64],// 10th
            [xx+248,yy+64,xx+392,yy+80+64],// HQ
            [xx+136,yy+64,xx+248,yy+80+64], // Apoth
            [xx+392,yy+64,xx+504,yy+80+144],// Librar
            [xx+136,yy+144,xx+248,yy+160+64],// Reclus
            [xx+248,yy+144,xx+392,yy+160+64],// Armoury
        ]
        xx+=16;
        for (var i=0;i<array_length(click_positions_company);i++){
            var pos = click_positions_company[i]
            if (point_in_rectangle(mouse_x, mouse_y, pos[0], pos[1], pos[2], pos[3])){
                managing = i+1;
                cooldown=8000;
            // Resets selections for next turn
                man_size=0;
                selecting_location="";
                selecting_types="";
                selecting_ship=0;
                selecting_planet=0;
                sel_uid=0;
                for(var i=0; i<501; i++){
                    man[i]="";
                    ide[i]=0;
                    man_sel[i]=0;
                    ma_lid[i]=0;
                    ma_wid[i]=0;
                    ma_uid[i]=0;
                    ma_race[i]=0;
                    ma_loc[i]="";
                    ma_name[i]="";
                    ma_role[i]="";
                    ma_wep1[i]="";
                    ma_wep2[i]="";
                    ma_armour[i]="";
                    ma_health[i]=100;
                    ma_chaos[i]=0;
                    ma_exp[i]=0;
                    ma_promote[i]=0;
                    sh_ide[i]=0;
                    sh_uid[i]=0;
                    sh_name[i]="";
                    sh_class[i]="";
                    sh_loc[i]="";
                    sh_hp[i]="";
                    sh_cargo[i]=0;
                    sh_cargo_max[i]="";
                    squad[i]=0;
                }
                alll=0;              
                cooldown=10;
                sel_loading=0;
                unload=0;
                alarm[6]=7;
                if (managing<=10){
                    scr_company_view(managing);
                    company_squads = find_company_squads(managing);
                } else if (managing>10) then scr_special_view(managing){
                    scr_special_view(managing);
                    company_squads=[];
                    cur_squad=0;
                }
                view_squad=false;               
            }
        }
    }
    if (zoomed==0) and (menu==1) and (managing>0) and (cooldown<=0){
        var onceh=0;
        xx=xx+0;
        yy=yy+0;

        // Back out from company
        if (mouse_x>=xx+23) and (mouse_y>=yy+80) and (mouse_x<xx+95) and (mouse_y<yy+128){
            managing=0;
            cooldown=8000;
            scr_ui_refresh();
            scr_management(1);
            cooldown=8000;
            click=1;
            popup=0;
            selected=0;
            hide_banner=1;
        }
        // Previous company
        if (mouse_x>=xx+424) and (mouse_y>=yy+80) and (mouse_x<xx+496) and (mouse_y<yy+128) and (cooldown<=0){
            onceh=0;
            text_bar=0;
            if (onceh==0){
                cooldown=8000;
                onceh=1;
                cur_squad=0;
                if ((managing>1) and (managing<=11)){
                    scr_ui_refresh();
                    managing-=1;
                    scr_company_view(managing);
                    company_squads = find_company_squads(managing);
                }else if (managing>11){
                    scr_ui_refresh();
                    managing-=1;
                    scr_special_view(managing);
                    company_squads =[];
                    view_squad=false;
                }else if (managing==1){
                    scr_ui_refresh();
                    managing=15;
                    scr_special_view(managing);
                    company_squads =[];
                    view_squad=false;
                }
            }
        }
        // Next company
        if (mouse_x>=xx+1105) and (mouse_y>=yy+80) and (mouse_x<xx+1178) and (mouse_y<yy+128) and (cooldown<=0){
            onceh=0;
            text_bar=0;
            if (onceh==0){
                cooldown=8000;
                onceh=1;
                scr_ui_refresh();
                cur_squad=0;
                if (managing<10){
                    scr_ui_refresh();
                    managing+=1;
                    scr_company_view(managing);
                    company_squads = find_company_squads(managing);
                }else if (managing>=10) and (managing<15){
                    scr_ui_refresh();
                    managing+=1;
                    scr_special_view(managing);
                    company_squads =[];
                    view_squad=false;
                }else if (managing==15){
                    scr_ui_refresh();
                    managing=1;
                    scr_company_view(managing);
                    company_squads = find_company_squads(managing);
                }
            }
        }
    }
    // This is the back button at LOADING TO SHIPS
    if (zoomed==0) and (menu==30) and (managing>0) and (cooldown<=0){
        xx=xx+0;
        yy=yy+0;

        if (mouse_x>=xx+22) and (mouse_y>=yy+84) and (mouse_x<xx+98) and (mouse_y<yy+126){
            menu=1;
            cooldown=8000;
        }
    }
    // Selecting individual marines
    if (menu=1) and (managing>0) and (!view_squad)and (!unit_profile){
        var company=managing;
        if (company>10){
            company=0;
        }
        var unit;                 
        var eventing=false, bb="";
        xx=__view_get( e__VW.XView, 0 )+0;
        yy=__view_get( e__VW.YView, 0 )+0;
        var top=man_current,sel,temp1="",temp2="",temp3="",temp4="",temp5="", squad_sel=0;
        var stop=0;

        if (man_size==0) then alll=0;

        if (cooldown<=0){
            // selecting all
            if (point_in_rectangle(mouse_x,mouse_y,xx+1281,yy+607,xx+1409,yy+636)){
                cooldown=8;
                if (alll==0){
                    scr_load_all(true);
                    selecting_types="%!@";
                } else if (alll==1){
                    scr_load_all(false);
                    selecting_types="";
                }
            } 
            // This clicks on the squad_sel button
            yy+=77;
            sel=top;
            for(var i=0; i<min(man_max,man_see); i++){
                while (man[sel]=="hide") and (sel<500){sel++;}
                if point_in_rectangle(mouse_x,mouse_y,xx+25,yy+64,xx+25+8,yy+85){
                    if (squad_sel==0) and (squad[sel]!=0){
                        squad_sel=squad[sel];
                        cooldown=8;
                    }
                }
                yy+=21;
                sel++;
                if (sel==501) then break
            }

        }
        // This is the 'select all of type' buttons
        sel=1;
        yy=__view_get( e__VW.YView, 0 )+77;
        if (sel_all!=""){
            // repeat(min(man_max,man_see)){
            var selection =false;
            for(var i=0; i<man_max; i++){
                while (man[i]=="hide")and (i<500){i++;}
                if (man_sel[i]==1){
                    selecting_location=ma_loc[sel];
                    selecting_ship=ma_lid[sel];
                    selecting_planet=ma_wid[sel];
                    selection=true;
                    break;
                }
            }                
            if (!selection){
                if (sel_all!="Command") and (sel_all!="man") and (sel_all!="vehicle"){
                     scr_load_decide_loc("unit role",sel_all,false);
                     scr_load_decide_loc("unit role",sel_all,true);
                } else {
                    switch(sel_all){
                        case "man":
                            scr_load_decide_loc("man","man",false);
                            break;
                        case "vehicle":
                            scr_load_decide_loc("vehicle","man",true);
                            break;
                        case "Command":
                            scr_load_decide_loc("Command","man",false);
                            break;                                                
                    }
                }
            }
            var onceh;
            for(var i=0; i<man_max; i++){
                while (man[sel]=="hide" && sel<500){sel++;}
                unit=obj_ini.TTRPG[company, ide[sel]];
                if (unit.assignmemt!="none"){
                    if (sel<500){
                        sel++;
                        continue;
                    } else{
                        break;
                    }
                }
                onceh=0;
                eventing=false;
                selection=false;
                // Prevent selecting marines that are in an event
                if (fest_repeats>0){
                    if (fest_planet==0) and (fest_sid>0) and (ma_lid[sel]==fest_sid){eventing=true;}
                    if (fest_planet==1) and (fest_wid>0) and (ma_wid[sel]==fest_wid) and (ma_loc[sel]==fest_star){eventing=true;}
                }
                if (selecting_location!="")
                and ((ma_loc[sel]!=selecting_location)
                or (ma_wid[sel]!=selecting_planet))
                or ((selecting_ship>0) and (ma_lid[sel]==0)){sel++;continue;}
                // Selects all men of type
                if (!array_contains(["Command","man","vehicle"],sel_all)){
                    if (man[sel]=="man") and (ma_role[sel]==sel_all)
                    and (!array_contains(["Terra","Lost","Mechanicus Vessel"],ma_loc[sel]))
                    and (ma_god[sel]<10)
                    and (eventing==false){
                        if (man_sel[sel]==0){
                            man_sel[sel]=1;
                            man_size+=scr_unit_size(ma_armour[sel],ma_role[sel],true);
                            onceh=1;
                            selection=true;
                        }else{
                            man_sel[sel]=0;
                            man_size-=scr_unit_size(ma_armour[sel],ma_role[sel],true);
                            onceh=1;
                        }
                    }
                }
                // Selects all vehicles of type
                if (sel_all!="Command") and (sel_all!="man") and (sel_all=="vehicle"){
                    if (man[sel]=="vehicle") and (ma_role[sel]==sel_all) and (ma_loc[sel]!="Terra") 
                    and (ma_loc[sel]!="Mechanicus Vessel") and (ma_loc[sel]!="Lost") and (ma_god[sel]<10)
                    and (eventing==false){
                        onceh=0;
                        if (man_sel[sel]==0) and (onceh==0){
                            man_sel[sel]=1;
                            man_size+=scr_unit_size("",ma_role[sel],true);
                            onceh=1;
                            selection=true;
                        }
                        if (man_sel[sel]==1) and (onceh==0){
                            man_sel[sel]=0;
                            man_size-=scr_unit_size("",ma_role[sel],true);
                            onceh=1;
                        }
                    }
                }
                // Selects all men
                if (sel_all=="man"){
                    if (man[sel]=="man") and (ma_loc[sel]!="Terra") and (ma_loc[sel]!="Lost") 
                    and (ma_loc[sel]!="Mechanicus Vessel") and (ma_god[sel]<10) 
                    and (eventing==false){
                        onceh=0;
                        if (man_sel[sel]==0) and (onceh==0){
                            man_sel[sel]=1;
                            man_size+=scr_unit_size(ma_armour[sel],ma_role[sel],true);
                            onceh=1;
                            selection=true;
                        }
                        if (man_sel[sel]==1) and (onceh==0){
                            man_sel[sel]=0;
                            man_size-=scr_unit_size(ma_armour[sel],ma_role[sel],true);
                            onceh=1;
                        }
                    }
                }
                // Selects all vehicles
                if (sel_all=="vehicle"){
                    if (man[sel]=="vehicle") and (ma_loc[sel]!="Terra") and (ma_loc[sel]!="Lost") 
                    and (ma_loc[sel]!="Mechanicus Vessel") and (ma_god[sel]<10) 
                    and (eventing==false){
                        onceh=0;
                        if (man_sel[sel]==0) and (onceh==0){
                            selection=true;
                            man_sel[sel]=1;
                            man_size+=scr_unit_size("",ma_role[sel],true);
                            onceh=1;
                        }
                        if (man_sel[sel]==1) and (onceh==0){
                            man_sel[sel]=0;
                            man_size-=scr_unit_size("",ma_role[sel],true);
                            onceh=1;
                        }
                    }
                }
                // Selecting command
                if (sel_all=="Command") and (man[sel]=="man") and (ma_loc[sel]!="Terra") 
                and (ma_loc[sel]!="Mechanicus Vessel") and (ma_god[sel]<10) 
                and (eventing==false){
                    var is_command=0;
                    if (managing>0) and (managing<=10){
                        if (is_specialist(ma_role[sel], "command")) then is_command=1;
                    }
                    if (is_command==1){
                        onceh=0;
                        if (man_sel[sel]==0) and (onceh==0){
                            man_sel[sel]=1;
                            man_size+=scr_unit_size(ma_armour[sel],ma_role[sel],true);
                            onceh=1;
                            selection=true;
                        }
                        if (man_sel[sel]==1) and (onceh==0){
                            man_sel[sel]=0;
                            man_size-=scr_unit_size(ma_armour[sel],ma_role[sel],true);
                            onceh=1;
                        }
                    }
                }
                if (selection){
                    if (selecting_location==""){
                        selecting_location=ma_loc[sel];
                        selecting_ship=ma_lid[sel];
                        selecting_planet=ma_wid[sel];
                        if (ma_wid[sel]==0) and (ma_lid[sel]>0){
                            sel_loading=1;
                            //selecting_location=obj_ini.ship_location[ma_lid[sel]];
                        }
                    }
                }
                yy+=20;
                sel++;
                if (sel==500) then break;
            }
            sel_all="";
        }
        sel=top;
        yy=__view_get( e__VW.YView, 0 )+77;
        for(var i=0; i<min(man_max,man_see); i++){
            while (man[sel]=="hide") and (sel<500){sel++;}
            eventing=false;

            // This is the actual individual click right here
            if (point_in_rectangle(mouse_x,mouse_y,xx+25+8,yy+64,xx+974,yy+85) and (cooldown<=0)) 
            or ((squad[sel]=squad_sel) and (squad_sel!=0)){
                var onceh=0,dib=0;
                stop=0;

                eventing=false;
                // Prevent selecting marines that are in an event
                if (fest_repeats>0){
                    if (fest_planet==0) and (fest_sid>0) and (ma_lid[sel]==fest_sid){eventing=true;}
                    if (fest_planet==1) and (fest_wid>0) and (ma_wid[sel]==fest_wid) and (ma_loc[sel]==fest_star){eventing=true;}
                }
                // Register double click
                if (ma_god[sel]<10) and (ma_loc[sel]!="Terra") and (ma_loc[sel]!="Mechanicus Vessel") and (ma_loc[sel]!="Lost") and (eventing==false){
                    if (double_click>5) and (sel==double_was) then dib=1;
                }

                if ((man_sel[sel]==0) and (onceh==0) and (ma_god[sel]<10) and (ma_loc[sel]!="Terra") 
                and (ma_loc[sel]!="Mechanicus Vessel") and (ma_loc[sel]!="Lost") and (eventing==false)) or (dib==1){
                    if (selecting_location=="") and ((man[sel]=="man") or (man[sel]=="vehicle")){
                        selecting_location=ma_loc[sel];
                        selecting_ship=ma_lid[sel];
                        selecting_planet=ma_wid[sel];// sel_uid=ma_uid[sel];
                        if (ma_loc[sel]!=selecting_location) and (selecting_planet!=ma_wid[sel])then stop=1;
                    }

                    if (selecting_location!="")
                        and (
                            (man[sel]=="man") 
                            or (man[sel]=="vehicle")
                        )
                        and (ma_loc[sel]!=selecting_location)
                        and (selecting_planet!=ma_wid[sel])then stop=1;

                    if ((man[sel]=="man") or (man[sel]=="vehicle")) and (ma_lid[sel]!=sel_loading) and (sel_loading!=0) then stop=1;

                    // Continue with double click
                    if (dib==1) and (stop!=1){
                        for(var bi=1; bi<=300; bi++){
                            if (man_sel[bi]==0) and (ma_god[bi]<10) and (ma_loc[bi]!="Terra") 
                            and (ma_loc[bi]!="Mechanicus Vessel") and (ma_loc[bi]!="Lost"){
                                if (ma_loc[bi]==selecting_location) and (selecting_planet==ma_wid[bi]) and (ma_role[bi]==ma_role[double_was]) and (bi!=double_was){
                                    man_sel[bi]=1;

                                    if (man[bi]=="man") then man_size+=scr_unit_size(ma_armour[bi],ma_role[bi],true);
                                    if (man[bi]=="vehicle") then man_size+=scr_unit_size("",ma_role[bi],true);
                                }
                            }
                        }
                        double_was=0;
                        cooldown=8;
                        click2=1;
                        stop=1;
                        exit;
                    }
                    cooldown=8;
                    click2=1;
                    double_click+=12;
                    double_was=sel;

                    if (stop!=1){
                        onceh=1;
                        man_sel[sel]=1;
                        if (string_count("%!@",selecting_types)==0){
                            if (man[sel]=="man") then selecting_types+=string(ma_role[sel]);
                            if (man[sel]=="vehicle") then selecting_types+=string(ma_role[sel]);
                        }
                        // Check for location here
                        if (man[sel]=="man") and (ma_lid[sel]>0) then sel_loading=ma_lid[sel];
                        if (man[sel]=="vehicle") and (ma_lid[sel]>0) then sel_loading=ma_lid[sel];

                        if (man[sel]=="man") then man_size+=scr_unit_size(ma_armour[sel],ma_role[sel],true);
                        if (man[sel]=="vehicle") then man_size+=scr_unit_size("",ma_role[sel],true);
                    }
                }
                if (man_sel[sel]==1) and (onceh==0){
                    onceh=1;
                    man_sel[sel]=0;
                    cooldown=8;
                    click2=1;
                    if (string_count("%!@",selecting_types)==0){
                        if (man[sel]=="man") and (string_count(ma_role[sel],selecting_types)>0) then selecting_types=string_replace(selecting_types,ma_role[sel],"");
                        if (man[sel]=="vehicle") and (string_count(ma_role[sel],selecting_types)>0) then selecting_types=string_replace(selecting_types,ma_role[sel],"");
                    }
                    if (man[sel]=="man") then man_size-=scr_unit_size(ma_armour[sel],ma_role[sel],true);
                    if (man[sel]=="vehicle") then man_size-=scr_unit_size("",ma_role[sel],true);
                    if (man_size==0) then sel_loading=0;
                }
            }
            yy+=20;
            sel++;
            if (sel=500) then break;
        }
        if (sel_all!="") then sel_all="";
        // End selecting

        xx=xx+0;
        yy=__view_get( e__VW.YView, 0 )+0;

        if (!unit_profile){
            if (mouse_x>=xx+1018) and (mouse_y>yy+805) and (mouse_x<xx+1018+141) and (mouse_y<yy+831){
                // Load to ship
                if (man_size>0) and (sel_loading==0) and (selecting_location!="Terra") and (selecting_location!="Mechanicus Vessel"){
                    scr_company_load(selecting_location);
                    menu=30;
                    cooldown=8000;
                    top=1;
                    exit;
                }
                // Unload - ask for planet confirmation
                if (man_size>0) and (sel_loading>=1) and (!instance_exists(obj_star_select)) 
                and (selecting_location!="Terra") and (selecting_location!="Mechanicus Vessel") and (selecting_location!="Warp"){
                    cooldown=8000;
                    var boba=0;

                    with(obj_temp3){instance_destroy();}
                    with(obj_star){
                        if (name==obj_ini.ship_location[obj_controller.selecting_ship]) then instance_create(x,y,obj_temp3);
                    }

                    if (instance_exists(obj_temp3)){
                        boba=instance_nearest(x,y,obj_star);
                        if (boba.space_hulk==1) and (boba.name==obj_ini.ship_location[obj_controller.selecting_ship]) then with(obj_temp3){instance_destroy();}
                    }

                    if (instance_exists(obj_temp3)){
                        boba=instance_create(obj_temp3.x,obj_temp3.y,obj_star_select);
                        boba.loading=1;
                        // selecting location is the ship right now; get it's orbit location
                        boba.loading_name=obj_ini.ship_location[selecting_ship];
                        boba.depth=self.depth-50;
                        // sel_uid=obj_ini.ship_uid[selecting_ship];
                        scr_company_load(obj_ini.ship_location[selecting_ship]);
                    }
                    with(obj_temp3){instance_destroy();}
                }
            }
                // Other buttons go here
                // Change equipment
            if (mouse_x>=xx+1018+141) and (mouse_y>yy+805) and (mouse_x<xx+1297) and (mouse_y<yy+831) 
            and (selecting_location!="Terra") and (selecting_location!="Mechanicus Vessel") and (otha==0){
                if (man_size>0) and (instance_number(obj_popup)==0){
                    var f=0,god=0,nuuum=0;
                    var o_wep1="",o_wep2="",o_armour="",o_gear="",o_mobi="";
                    var b_wep1=0,b_wep2=0,b_armour=0,b_gear=0,b_mobi=0;
                    var vih=0;

                    // Need to make sure that group selected is all the same type
                    for(var f=1; f<man_max; f++){
                        // Set different vih depending on unit type
                        if (man[f]=="man") and (man_sel[f]==1) and (ma_role[f]!=obj_ini.role[100][6]) 
                        and (ma_role[f]!="Venerable "+string(obj_ini.role[100][6])) and (vih==0) then vih=1;

                        if (ma_role[f]==obj_ini.role[100][6]) and (man_sel[f]==1) and (vih==0) then vih=6;
                        if (ma_role[f]=="Venerable "+string(obj_ini.role[100][6])) and (man_sel[f]==1) and (vih==0) then vih=6;
                        if (ma_role[f]=="Land Raider") and (man_sel[f]==1) and (vih==0) then vih=50;
                        if (ma_role[f]=="Rhino") and (man_sel[f]==1) and (vih==0) then vih=51;
                        if (ma_role[f]=="Predator") and (man_sel[f]==1) and (vih==0) then vih=52;
                        if (ma_role[f]=="Land Speeder") and (man_sel[f]==1) and (vih==0) then vih=53;
                        if (ma_role[f]=="Whirlwind") and (man_sel[f]==1) and (vih==0) then vih=54;

                        // Make output invalid if newly selected unit has a different vih than previous ones by setting vih to -1
                        if (man[f]=="man") and (man_sel[f]==1) and (ma_role[f]!=obj_ini.role[100][6]) 
                        and (ma_role[f]!="Venerable "+string(obj_ini.role[100][6])) and (man_sel[f]==1) and (vih!=1) and (vih!=0) then vih=-1;

                        if (ma_role[f]==obj_ini.role[100][6]) and (man_sel[f]==1) and (vih!=6) and (vih!=0) then vih=-1;
                        if (ma_role[f]=="Venerable "+string(obj_ini.role[100][6])) and (man_sel[f]==1) and (vih!=6) and (vih!=0) then vih=-1;
                        if (ma_role[f]=="Land Raider") and (man_sel[f]==1) and (vih!=50) and (vih!=0) then vih=-1;
                        if (ma_role[f]=="Rhino") and (man_sel[f]==1) and (vih!=51) and (vih!=0) then vih=-1;
                        if (ma_role[f]=="Predator") and (man_sel[f]==1) and (vih!=52) and (vih!=0) then vih=-1;
                        if (ma_role[f]=="Land Speeder") and (man_sel[f]==1) and (vih!=53) and (vih!=0) then vih=-1;
                        if (ma_role[f]=="Whirlwind") and (man_sel[f]==1) and (vih!=54) and (vih!=0) then vih=-1;

                        if (man_sel[f]==1) and (vih!=-1){
                            nuuum+=1;
                            if (o_wep1=="") and (ma_wep1[f]!="") then o_wep1=ma_wep1[f];
                            if (o_wep2=="") and (ma_wep2[f]!="") then o_wep2=ma_wep2[f];
                            if (o_armour=="") and (ma_armour[f]!="") then o_armour=ma_armour[f];
                            if (o_gear=="") and (ma_gear[f]!="") then o_gear=ma_gear[f];
                            if (o_mobi=="") and (ma_mobi[f]!="") then o_mobi=ma_mobi[f];

                            if (ma_wep1[f]=="") then b_wep1+=1;
                            if (ma_wep2[f]=="") then b_wep2+=1;
                            if (ma_armour[f]=="") then b_armour+=1;
                            if (ma_gear[f]=="") then b_gear+=1;
                            if (ma_mobi[f]=="") then b_mobi+=1;

                            if ((o_wep1!="") and (ma_wep1[f]!=o_wep1)) or (b_wep1==1) then o_wep1="Assortment";
                            if ((o_wep2!="") and (ma_wep2[f]!=o_wep2)) or (b_wep2==1) then o_wep2="Assortment";
                            if ((o_armour!="") and (ma_armour[f]!=o_armour)) or (b_armour==1) then o_armour="Assortment";
                            if ((o_gear!="") and (ma_gear[f]!=o_gear)) or (b_gear==1) then o_gear="Assortment";
                            if ((o_mobi!="") and (ma_mobi[f]!=o_mobi)) or (b_mobi==1) then o_mobi="Assortment";
                        }
                    }

                    if (b_wep1==nuuum) then o_wep1="";
                    if (b_wep2==nuuum) then o_wep2="";
                    if (b_armour==nuuum) then o_armour="";
                    if (b_gear==nuuum) then o_gear="";
                    if (b_mobi==nuuum) then o_mobi="";

                    if (vih>0) and (man_size>0){
                        var pip=instance_create(0,0,obj_popup);
                        pip.type=6;
                        pip.o_wep1=o_wep1;
                        pip.o_wep2=o_wep2;
                        pip.o_armour=o_armour;
                        pip.o_gear=o_gear;
                        pip.n_wep1=o_wep1;
                        pip.n_wep2=o_wep2;
                        pip.n_armour=o_armour;
                        pip.n_gear=o_gear;
                        pip.o_mobi=o_mobi;
                        pip.n_mobi=o_mobi;
                        pip.company=managing;
                        pip.units=nuuum;

                        //Forwards vih selection to the vehicle_equipment variable used in mouse_50 obj_popup and weapons_equip script
                        pip.vehicle_equipment=vih;

                        if (o_wep1!="") and (string_count("&",o_wep1)>0) then pip.a_wep1=clean_tags(o_wep1);
                        if (o_wep2!="") and (string_count("&",o_wep2)>0) then pip.a_wep2=clean_tags(o_wep2);
                        if (o_armour!="") and (string_count("&",o_armour)>0) then pip.a_armour=clean_tags(o_armour);
                        if (o_gear!="") and (string_count("&",o_gear)>0) then pip.a_gear=clean_tags(o_gear);
                        if (o_mobi!="") and (string_count("&",o_mobi)>0) then pip.a_mobi=clean_tags(o_mobi);
                    }
                }
            }
                // Reset equipment
            if (mouse_x>=xx+1018+141) and (mouse_y>yy+805-26) and (mouse_x<xx+1297) and (mouse_y<yy+831-26) 
            and (selecting_location!="Terra") and (selecting_location!="Mechanicus Vessel") and (man_size>0){
                var god=0,nuuum=0;
                o_wep1="";
                o_wep2="";
                o_armour="";
                o_gear="";
                o_mobi="";
                b_wep1=0;
                b_wep2=0;
                b_armour=0;
                b_gear=0;
                b_mobi=0;

                for(var f=1; f<=man_max; f++){
                    // If come across a man, set vih to 1
                    if (man[f]="man") and (man_sel[f]=1) then nuuum+=1;
                }

                var pip=instance_create(0,0,obj_popup);
                pip.type=6;
                pip.o_wep1="Assortment";
                pip.o_wep2="Assortment";
                pip.o_armour="Assortment";
                pip.o_gear="Assortment";
                pip.o_mobi="Assortment";
                pip.n_wep1="Assortment";
                pip.n_wep2="Assortment";
                pip.n_armour="Assortment";
                pip.n_gear="Assortment";
                pip.n_mobi="Assortment";
                pip.company=managing;
                pip.units=nuuum;
                pip.alarm[1]=1;
            }
                // Promote
            if (mouse_x>=xx+1297) and (mouse_y>yy+805) and (mouse_x<xx+1436) and (mouse_y<yy+831) 
            and (selecting_location!="Terra") and (selecting_location!="Mechanicus Vessel") and (man_size>0){
                if (sel_promoting==1) and (instance_number(obj_popup)==0){
                    var pip=instance_create(0,0,obj_popup);
                    pip.type=5;
                    pip.company=managing;

                    var god=0,nuuum=0;
                    for(var f=1; f<=man_max; f++){
                        if (ma_promote[f]>=1) and (man_sel[f]==1){
                            nuuum+=1;
                            if (pip.min_exp==0) then pip.min_exp=ma_exp[f];
                            pip.min_exp=min(ma_exp[f],pip.min_exp);
                        }
                        if (god==0) and (ma_promote[f]>=1) and (man_sel[f]==1){
                            god=1;
                            pip.unit_role=ma_role[f];
                        }
                    }
                    if (nuuum>1) then pip.unit_role="Marines";
                    pip.units=nuuum;
                }
            }
                // Jail
            if (mouse_x>=xx+1438) and (mouse_y>=yy+803) and (mouse_x<xx+1578) and (mouse_y<yy+831) and (man_size>0){
                for(var f=1; f<=man_max; f++){
                    if (man[f]=="man") and (man_sel[f]==1) and (ma_loc[f]!="Terra") and (ma_loc[f]!="Mechanicus Vessel"){
                        if (ma_god[f]<10) and (managing<=10){
                            ma_god[f]+=10;
                            obj_ini.god[managing,ide[f]]+=10;
                        }
                        if (ma_god[f]<10) and (managing>10) and (managing<20){
                            ma_god[f]+=10;
                            obj_ini.god[0,ide[f]]+=10;
                        }
                    }
                }
                alll=0;
                if (managing<=10) then scr_company_view(managing);
                if (managing>20) then scr_company_view(managing);
                if (managing>10) and (managing<=20) then scr_special_view(managing);
                cooldown=8000;
                sel_loading=0;
                unload=0;
                alarm[6]=7;
            }

            // Add bionics to marine(s)
            if (scr_hit(xx+1300+141,yy+779,xx+1436+141,yy+801)==true) and (man_size>0) and (cooldown<=0){
                var bionics_before,bionics_after,cah;
                cooldown=8000;
                cah=managing;
                if (cah>10) then cah=0;
                bionics_before=scr_item_count("Bionics");
                bionics_after=bionics_before;
                if (bionics_before>0) then for(var p=1; p<=500; p++){
                    if (man_sel[p]==1) and (man[p]=="man") and (bionics_after>0) and (obj_ini.bio[cah][ide[p]]<10) 
                    and (obj_ini.loc[cah][ide[p]]!="Terra") and (obj_ini.loc[cah][ide[p]]!="Mechanicus Vessel"){
                        if (string_count("Dread",ma_armour[p])=0){
        					          obj_ini.TTRPG[cah, ide[p]].add_bionics();
                                      bionics_after--;
                            if (ma_promote[p]==10) then ma_promote[p]=0;
                        }
                    }
                    if (bionics_before!=bionics_after){
                        click=1;
                        scr_add_item("Bionics",bionics_after-bionics_before);
                    }
                }
            }
                // Set boarders
            if (scr_hit(xx+1018,yy+779,xx+1018+141,yy+801)==true) and (man_size>0) and (cooldown<=0){
                var cah=managing;
                cooldown=8000;
                if (cah>10) then cah=0;
                for(var p=1; p<=500; p++){
                    if (man_sel[p]==1) and (man[p]=="man") and (obj_ini.lid[cah][ide[p]]>0) and (obj_ini.loc[cah][ide[p]]!="Mechanicus Vessel"){
                        var onk=0;
                        if (obj_ini.age[cah][ide[p]]==floor(obj_ini.age[cah][ide[p]])) and (onk==0){
                            if (ma_role[p]!=obj_ini.role[100][6]) and (ma_role[p]!="Venerable "+string(obj_ini.role[100][6])) 
                            and (string_count("Dread",ma_armour[p])==0){
                                obj_ini.age[cah][ide[p]]+=0.01;
                                onk=1;
                            }
                        }
                        if (obj_ini.age[cah][ide[p]]!=floor(obj_ini.age[cah][ide[p]])) and (onk==0){
                            obj_ini.age[cah][ide[p]]=floor(obj_ini.age[cah][ide[p]]);
                            onk=1;
                        }
                    }
                }
            }
                // Transfer
            if point_in_rectangle(mouse_x,mouse_y,xx+1297, yy+777, xx+1436, yy+804) and (selecting_location!="Terra") 
            and (selecting_location!="Mechanicus Vessel") and (man_size>0){
                if (instance_number(obj_popup)==0){
                    var pip=instance_create(0,0,obj_popup);
                    pip.type=5.1;
                    pip.company=managing;

                    var god=0,nuuum=0,nuuum2=0,checky=0,check_number=0;
                    for(var f=1; f<=man_max; f++){
                        if (god==1) then break;
                        if (god==0) and (man_sel[f]==1) and (man[f]=="man"){
                            god=1;
                            pip.unit_role=ma_role[f];
                        }
                        if (god==0) and (man_sel[f]==1) and (man[f]=="vehicle"){
                            god=1;
                            pip.unit_role=ma_role[f];
                        }
                        if (man_sel[f]==1){
                            if (man[f]=="man"){
                                nuuum+=1;
                                checky=1;
                                if (ma_role[f]==obj_ini.role[100][7]) then checky=0;
                                if (ma_role[f]==obj_ini.role[100][14]) then checky=0;
                                if (ma_role[f]==obj_ini.role[100][15]) then checky=0;
                                if (ma_role[f]==obj_ini.role[100][16]) then checky=0;
                                if (ma_role[f]==obj_ini.role[100][17]) then checky=0;
                                if (checky==1) then check_number+=1;
                            }
                            if (man[f]=="vehicle") then nuuum2+=1;
                        }
                    }
                    if (nuuum>1) then pip.unit_role="Marines";
                    if (nuuum2>1) then pip.unit_role="Vehicles";
                    if (nuuum>0) and (nuuum2>0) then pip.unit_role="Units";
                    pip.units=nuuum+nuuum2;
                    if (nuuum>0) and (check_number>0){
                        if (command_set[1]==0){
                            cooldown=8000;
                            with(pip){instance_destroy();}
                        }
                    }
                }
            }
        }
    }
        // Selecting a ship to load
    if (menu==30) and (managing>0){
        xx=xx+0;
        yy=yy+0;

        var top,sel,temp1="",temp2="",temp3="",temp4="",temp5="",stop=0;
        top=ship_current;
        sel=top;

        var wombat=0;
        sel_uid=sh_uid[sel];

        yy=yy+77;

        if (cooldown<=0){
            for(var i=0; i<(min(ship_max,ship_see)); i++){
                if (mouse_x>=xx+25+8) and (mouse_y>=yy+64) and (mouse_x<xx+974) and (mouse_y<yy+85) and (cooldown<=0) 
                and (((sh_cargo[sel]+man_size)<=sh_cargo_max[sel])){
                    var onceh=0;
                    stop=0;
                    for(var q=1; q<=500; q++){
                        // Load man to ship
                        if (man[q]=="man") and (ma_loc[q]==selecting_location) and (sh_loc[sel]==selecting_location){
                            if ((sh_cargo[sel]+man_size)<=sh_cargo_max[sel]) and (man_sel[q]!=0){
                                wombat=sel;
                                ma_loc[q]=sh_name[sel];
                                ma_lid[q]=sh_ide[sel];
                                ma_wid[q]=0;
                                ma_uid[q]=sh_uid[sel];

                                if (managing<=10){
                                    loc[managing,q]=sh_name[sel];
                                    obj_ini.lid[managing][ide[q]]=sh_ide[sel];
                                    obj_ini.wid[managing][ide[q]]=0;
                                    obj_ini.uid[managing][ide[q]]=sel_uid;
                                }
                                if (managing>10){
                                    loc[0,q]=sh_name[sel];
                                    obj_ini.lid[0][ide[q]]=sh_ide[sel];
                                    obj_ini.wid[0][ide[q]]=0;
                                    obj_ini.uid[0][ide[q]]=sel_uid;
                                }
                            }
                        }
                        // Load vehicle to ship
                        if (man[q]=="vehicle") and (ma_loc[q]==selecting_location) and (sh_loc[sel]==selecting_location){
                            if ((sh_cargo[sel]+man_size)<=sh_cargo_max[sel]) and (man_sel[q]!=0){
                                wombat=sel;
                                ma_loc[q]=sh_name[sel];
                                ma_lid[q]=sh_ide[sel];
                                ma_wid[q]=0;
                                ma_uid[q]=sh_uid[sel];
                                veh_loc[managing,q]=sh_name[sel];

                                if (managing<=10){
                                    obj_ini.veh_lid[managing][ide[q]]=sh_ide[sel];
                                    obj_ini.veh_wid[managing][ide[q]]=0;
                                    obj_ini.veh_uid[managing][ide[q]]=sel_uid;
                                }
                                if (managing>10){
                                    obj_ini.veh_lid[0][ide[q]]=sh_ide[sel];
                                    obj_ini.veh_wid[0][ide[q]]=0;
                                    obj_ini.veh_uid[0][ide[q]]=sel_uid;
                                }
                            }
                        }
                    }
                    // Right here decrease the size of stuff on that planet
                    // Need to find the obj_star that the controller is loading from
                    var xb=0,yb=0,god=0,tiber=0;
                    for(var i=0; i<200; i++){
                        if (god==0){
                            xb=random(room_width);
                            yb=random(room_height);
                            tiber=instance_nearest(xb,yb,obj_star);

                            if (tiber.name==selecting_location) then god=1;
                            if (tiber.name!=selecting_location) then instance_deactivate_object(tiber);
                        }
                    }
                    if (god==1){
                        tiber.p_player[selecting_planet]-=man_size;
                        // 135;
                        // also need the wid here
                    }
                    instance_activate_object(obj_star);

                    obj_ini.ship_carrying[sh_ide[sel]]+=man_size;

                    man_size=0;
                    man_current=1;
                    menu=1;
                    cooldown=8;
                    for(var k=1; k<=500; k++){man_sel[k]=0;}

                }
                yy+=20;
                sel+=1;
            }
        }
        // End selecting
        xx=xx+0;
        yy=yy+0;
    }
    if (menu==50) and (managing>0) and (cooldown<=0){
        if (mouse_x>=xx+217) and (mouse_y>=yy+28) and (mouse_x<xx+250) and (mouse_y<yy+59){
            cooldown=8;
            menu=1;
            click=1;
        }
    }
}
