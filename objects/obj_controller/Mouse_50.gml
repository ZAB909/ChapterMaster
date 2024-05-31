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

                if (obj_ini.role[c,e]="Chapter Master"){
                    tek="c";
                    alarm[7]=5;
                    global.defeat=3;
                }
                // TODO Needs to be based on role
                kill_and_recover(c,e);
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
}
// ** Armamentorium STC fragments **
else if (menu==14) and (cooldown<=0){
}
// ** Recruitement **
else if (menu==15) and (cooldown<=0){
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
                var chapter_master = obj_ini.TTRPG[0][1];
                var dead_lib = obj_ini.TTRPG[lib[0],lib[1]];
                pop_up = instance_create(0,0,obj_popup);
                pop_up.title = "Skull for the Skull Throne";
                pop_up.text = $"You summon {dead_lib.name_role()} to your personal chambers. Darting from the shadows you deftly strike his head from his shoulders. With the flesh removed from his skull you place the skull upon a hastily erected shrine."
                pop_up.type=98;
                pop_up.image = "chaos";
                kill_and_recover(lib[0],lib[1]);
                chapter_master.add_trait("blood_for_blood");
                chapter_master.edit_corruption(20);
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
                var chapter_master = obj_ini.TTRPG[0][1];
                 chapter_master.add_trait("blood_for_blood");
                 chapter_master.edit_corruption(20);
                var dead_champ = obj_ini.TTRPG[champ[0]][champ[1]];
                //TODO make this into a real dual with consequences
                pop_up = instance_create(0,0,obj_popup);
                pop_up.title = "Skull for the Skull Throne";
                pop_up.text = $"You summon {dead_champ.name_role()} to your personal chambers. Darting from the shadows towards {dead_champ.name()} who is a cunning warrior and reacts with precision to your attack, however eventually you prevail and strike him down. With the flesh removed from his skull you place it upon a hastily erected shrine."
                pop_up.type=98;
                pop_up.image = "chaos";                
               // obj_duel = instance_create(0,0,obj_duel);
               // obj_duel.title = "Ambush Champion";
               // pop.type="duel";
                kill_and_recover(champ[0],champ[1]);
            } else {
                diplomacy_pathway = "daemon_scorn";
            }              
			scr_dialogue(diplomacy_pathway);
			force_goodbye = 1;
		}
        if (point_in_rectangle(mouse_x, mouse_y, option_selections[2].lh, option_selections[2].top, option_selections[2].rh, option_selections[2].base)){
			cooldown=8000;
			diplomacy_pathway = "sacrifice_squad";
            var kill_squad, squad_found=false;
            for(var i=0;i<array_length(obj_ini.squads);i++){
                kill_squad = obj_ini.squads[i];
                if (kill_squad.type == "tactical_squad" && array_length(kill_squad.members)>4){
                    var chapter_master = obj_ini.TTRPG[0][1];
                    chapter_master.add_trait("blood_for_blood");   
                    chapter_master.edit_corruption(20);
                    kill_squad.kill_members();
                    with(obj_ini){
                        scr_company_order(kill_squad.base_company);
                    }
                    squad_found=true
                    break;
                }
            }
            if (!squad_found){
                diplomacy_pathway = "daemon_scorn";
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
            view_squad=false;
            unit_profile=false;
        }
    }
    if (instance_exists(obj_temp_build)){
        if (obj_temp_build.isnew==1) then exit;
    }
    // Fleet panel minimize
    if (zoomed==0) and (cooldown<=0) and (diplomacy==0){
       /* if (popup==1) or (popup==2){
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
        }*/

        // Management
        if (menu_buttons.chapter_manage.clicked){
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
                view_squad=false;
            }
            if (menu==1) and (onceh==0){
                menu=0;
                onceh=1;
                cooldown=8000;
                click=1;
                hide_banner=0;
                location_viewer.update_garrison_log();
            }
            managing=0;
        }
        // Settings
        if (menu_buttons.chapter_settings.clicked){
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
        if (menu_buttons.apoth.clicked){
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
        if (menu_buttons.reclu.clicked){
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
                location_viewer.update_garrison_log();
            }
            managing=0;
        }
        // Librarium
        if (menu_buttons.lib.clicked){
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
                artifact_equip = new shutter_button();
                artifact_gift = new shutter_button();
                artifact_destroy = new shutter_button();
                artifact_namer = new text_bar_area(xx + 622, yy + 460, 350);
                set_chapter_arti_data();
            }
            if (menu==13) and (onceh==0){
                menu=0;
                onceh=1;
                cooldown=8000;
                click=1;
                location_viewer.update_garrison_log();
            }
            managing=0;
        }
        // Armamentarium
        if (menu_buttons.arm.clicked){
            menu_adept=0;
            hide_banner=1;
            if (scr_role_count("Forge Master","0")==0) then menu_adept=1;
            if (menu!=14) and (onceh==0){
                set_up_armentarium();
            }else if (menu==14) and (onceh==0){
                menu=0;
                onceh=1;
                cooldown=8000;
                click=1;
            }
            managing=0;
        }
        // Recruiting
        if (menu_buttons.recruit.clicked){
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
                location_viewer.update_garrison_log();
            }
            managing=0;
        }
        // Master of the Fleet
        if (menu_buttons.fleet.clicked){
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
                man_current=0;
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
        if (menu_buttons.diplo.clicked){
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
                location_viewer.update_garrison_log();
            }
            managing=0;
        }
        // Event Log
        if (menu_buttons.event.clicked){
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
        if (menu_buttons.end_turn.clicked){
            if (menu==0) and (cooldown<=0){
                if (location_viewer.hide_sequence==0){
                    location_viewer.hide_sequence++;
                }
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

                    player_forges=0;
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
            /*with(obj_ini){
                for (var i=0;i<11;i++){
                    scr_company_order(i);
                }
            }*/
            location_viewer.update_garrison_log();
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
            view_squad=false;
            unit_profile=false;
        }
        // Previous company
        if (mouse_x>=xx+424) and (mouse_y>=yy+80) and (mouse_x<xx+496) and (mouse_y<yy+128) and (cooldown<=0){
            onceh=0;
            text_bar=0;
            if (onceh==0){
                cooldown=8000;
                onceh=1;
                if ((managing>1) and (managing<=11)){
                    scr_ui_refresh();
                    managing-=1;
                    scr_company_view(managing);
                    company_data = new scr_company_struct(managing);
                }else if (managing>11){
                    scr_ui_refresh();
                    managing-=1;
                    scr_special_view(managing);
                    company_data={};
                    view_squad=false;
                }else if (managing==1){
                    scr_ui_refresh();
                    managing=15;
                    scr_special_view(managing);
                    company_data={};
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
                if (managing<10){
                    scr_ui_refresh();
                    managing+=1;
                    scr_company_view(managing);
                    company_data = new scr_company_struct(managing);
                }else if (managing>=10) and (managing<15){
                    scr_ui_refresh();
                    managing+=1;
                    scr_special_view(managing);
                    company_data={};
                    view_squad=false;
                }else if (managing==15){
                    scr_ui_refresh();
                    managing=1;
                    scr_company_view(managing);
                    company_data = new scr_company_struct(managing);
                }
            }
        }
    }
    // This is the back button at LOADING TO SHIPS
    if (zoomed==0) and (menu==30) and (managing>0||managing==-1) and (cooldown<=0){
        xx=xx+0;
        yy=yy+0;

        if (mouse_x>=xx+22) and (mouse_y>=yy+84) and (mouse_x<xx+98) and (mouse_y<yy+126){
            menu=1;
            cooldown=8000;
        }
    }
    // Selecting individual marines
    if (menu=1) and (managing>0) || (managing<0) and (!view_squad || !company_report){
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

        }
        // This is the 'select all of type' buttons
        sel=0;
        yy=__view_get( e__VW.YView, 0 )+77;
        sel=top;
        yy=__view_get( e__VW.YView, 0 )+77;
        var unit;
        // End selecting

        xx=xx+0;
        yy=__view_get( e__VW.YView, 0 )+0;
    }
    if (menu==50) and (managing>0) and (cooldown<=0){
        if (mouse_x>=xx+217) and (mouse_y>=yy+28) and (mouse_x<xx+250) and (mouse_y<yy+59){
            cooldown=8;
            menu=1;
            click=1;
        }
    }
}
