
// Final Screen

var part1,part2,part3,part4,part5,part6,part7,part8,part9,part10;
part1="";part2="";part3="";part4="";part9="";
part5="";part6="";part7="";part8="";part10="";
battle_over=1;

alarm[8]=999999;

// show_message("Final Deaths: "+string(final_deaths));


// check for wounded marines here to finish off, if defeated defending






if (final_deaths+final_command_deaths>0){
    part1="Marines Lost: "+string(final_deaths+final_command_deaths);
    if (apoth=1) then part1+=" ("+string(obj_ini.role[100][15])+" prevented the death of "+string(units_saved)+")";
    if (apoth>1) then part1+=" ("+string(obj_ini.role[100][15])+"s prevented the death of "+string(units_saved)+")";
    if (injured>0) then part8="Marines Critically Injured: "+string(injured);
    
    var i;i=0;
    repeat(30){i+=1;
        if (post_unit_lost[i]!="") and (post_units_lost[i]>0) and (post_unit_veh[i]=0){
            part2+=string(post_units_lost[i])+"x "+string(post_unit_lost[i])+", ";
        }
    }
    part2=string_delete(part2,string_length(part2)-1,2);part2+=".";i=0;
    
    if (injured>0){newline=part8;scr_newtext();}
    newline=part1;scr_newtext();
    newline=part2;newline_color="red";scr_newtext();
    newline=" ";scr_newtext();
}

if (instance_exists(obj_temp4)){
	if (apoth < 0){
		obj_temp4.apothecary_present = apoth;
	}
};

seed_saved=(min(seed_max,apoth*40))-gene_penalty;
if (string_count("Doom",obj_ini.strin2)>0) then seed_saved=0;
if (seed_saved>0) then obj_controller.gene_seed+=seed_saved;

if (apoth>0) and (final_deaths+final_command_deaths>0) and (string_count("Doom",obj_ini.strin2)=0){
    part3="Gene-Seed Recovered: "+string(seed_saved)+" (";
    if (seed_saved>0) then part3+=string(round((seed_saved/seed_max)*100));
    if (seed_saved=0) then part3+="0";
    part3+="%)";
    newline=part3;scr_newtext();
    newline=" ";scr_newtext();
}
if (apoth=0) and (string_count("Doom",obj_ini.strin2)=0){
    part3="No able-bodied "+string(obj_ini.role[100][15])+".  "+string(seed_max)+" Gene-Seed lost.";
    newline=part3;scr_newtext();
    newline=" ";scr_newtext();
}
if (string_count("Doom",obj_ini.strin2)>0){
    part3="Chapter Mutation prevents retrieving Gene-Seed.  "+string(seed_max)+" Gene-Seed lost.";
    newline=part3;scr_newtext();
    newline=" ";scr_newtext();
}


if (red_thirst>2){
    var voodoo;voodoo="";

    if (red_thirst=3) then voodoo="1 Battle Brother lost to the Red Thirst.";
    if (red_thirst>3) then voodoo=string(red_thirst-2)+" Battle Brothers lost to the Red Thirst.";
    
    newline=voodoo;newline_color="red";scr_newtext();
    newline=" ";scr_newtext();
}


if (vehicle_deaths>0){
    part4="Vehicles Lost: "+string(vehicle_deaths);
    if (techma=1) then part4+=" ("+string(obj_ini.role[100][16])+" prevented the destruction of "+string(vehicles_saved)+")";
    if (techma>1) then part4+=" ("+string(obj_ini.role[100][16])+"s prevented the destruction of "+string(vehicles_saved)+")";
    
    var i;i=0;
    repeat(30){i+=1;
        if (post_unit_lost[i]!="") and (post_units_lost[i]>0) and (post_unit_veh[i]=1){
            part5+=string(post_units_lost[i])+"x "+string(post_unit_lost[i])+", ";
        }
    }
    part5=string_delete(part5,string_length(part5)-1,2);part5+=".";i=0;
    
    newline=part4;scr_newtext();
    newline=part5;scr_newtext();
    newline=" ";scr_newtext();
}


if (post_equipment_lost[1]!=""){
    part6="Equipment Lost: ";
    
    var i;i=0;
    repeat(50){i+=1;
        if (post_equipment_lost[i]!="") and (post_equipments_lost[i]>0){
            part7+=string(post_equipments_lost[i])+"x "+string(post_equipment_lost[i])+", ";
        }
    }
    part7=string_delete(part7,string_length(part7)-1,2);part7+=".";i=0;
	if (instance_exists(obj_temp4)){part7 += "Some may be recoverable"}
    newline=part6;scr_newtext();
    newline=part7;scr_newtext();
    newline=" ";scr_newtext();
}
if (instance_exists(obj_temp4)){
	obj_temp4.post_equipment_lost = post_equipment_lost
	obj_temp4.post_equipments_lost = post_equipments_lost
}
if (slime>0){
    var compan_slime;
    compan_slime=0;
    
    var s1,s2,s3,s4;
    s1="";s2="";s3="";s4="";
    
    i=-1;
    
    s1="Slime has short-circuited and destroyed "+string(slime);
    
    repeat(11){i+=1;
        if (mucra[i]=1){compan_slime+=1;s3+=string(i)+", ";}
    }
    
    if (compan_slime<=1){s2=" suits of Power Armour.  Company ";s4=" has been effected.";}
    if (compan_slime>1){s2=" suits of Power Armour.  Companies ";s4=" have been effected.";}
    if (slime=1) then s2=string_replace(s2,"suits ","suit ");
    
    s3=string_delete(s3,string_length(s3)-1,2);
    
    newline=s1+s2+s3+s4;newline_color="red";scr_newtext();
    newline=" ";scr_newtext();
}

instance_activate_object(obj_star);


var lowf;lowf=true;
if (battle_special="tyranid_org") then lowf=false;
if (string_count("_attack",battle_special)>0) then lowf=false;
if (battle_special="ship_demon") then lowf=false;
if (enemy+threat=17) then lowf=false;
if (battle_special="ruins") then lowf=false;
if (battle_special="ruins_eldar") then lowf=false;
if (battle_special="fallen1") then lowf=false;
if (battle_special="fallen2") then lowf=false;
if (battle_special="study2a") then lowf=false;
if (battle_special="study2b") then lowf=false;

if (fortified>0) and (!instance_exists(obj_nfort)) and (lowf=true){
    part9="Fortification level of "+string(battle_loc);
    if (battle_id=1) then part9+=" I";
    if (battle_id=2) then part9+=" II";
    if (battle_id=3) then part9+=" III";
    if (battle_id=4) then part9+=" IV";
    if (battle_id=5) then part9+=" V";
    part9+=" has decreased to "+string(fortified-1)+" ("+string(fortified)+"-1)";
    newline=part9;scr_newtext();
    battle_object.p_fortified[battle_id]-=1;
}


/*if (enemy=5){
    if (obj_controller.faction_status[eFACTION.Ecclesiarchy]!="War"){
        
    }
}*/





if (defeat=0) and (battle_special="space_hulk"){
    var en_power,loot,dicey,ex;
    en_power=0;loot=0;dicey=floor(random(100))+1;ex=0;

    if (enemy=7){en_power=battle_object.p_orks[battle_id];battle_object.p_orks[battle_id]-=1;}
    if (enemy=9){en_power=battle_object.p_tyranids[battle_id];battle_object.p_tyranids[battle_id]-=1;}
    if (enemy=10){en_power=battle_object.p_traitors[battle_id];battle_object.p_traitors[battle_id]-=1;}

    part10="Space Hulk Exploration at ";
    ex=min(100,100-((en_power-1)*20));
    part10+=string(ex)+"%";
    newline=part10;if (ex=100) then newline_color="red";scr_newtext();

    if (string_count("Shitty",obj_ini.strin2)>0) then dicey=dicey*1.5;
    // show_message("Roll Under: "+string(en_power*10)+", Roll: "+string(dicey));

    if (dicey<=(en_power*10)){
        loot=choose(1,2,3,4);
        if (enemy!=10) then loot=choose(1,1,2,3);
        hulk_treasure=loot;
        if (loot>1) then newline="Valuable items recovered.";
        if (loot=1) then newline="Resources have been recovered.";
        newline_color="yellow";
        scr_newtext();
    }
}


if (string_count("ruins",battle_special)>0){
    if (defeat=0) then newline="Ancient Ruins cleared.";
    if (defeat=1) then newline="Failed to clear Ancient Ruins.";
    newline_color="yellow";
    scr_newtext();
}

var npowers;npowers=true;
if (battle_special="tyranid_org") then npowers=false;
if (battle_special="ship_demon") then npowers=false;
if (string_count("_attack",battle_special)>0) then npowers=false;
if (string_count("ruins",battle_special)>0) then npowers=false;
if (battle_special="space_hulk") then npowers=false;
if (battle_special="fallen1") then npowers=false;
if (battle_special="fallen2") then npowers=false;
if (battle_special="study2a") then npowers=false;
if (battle_special="study2b") then npowers=false;
if (defeat=0) and (npowers=true){
    var en_power,new_power;
    en_power=0;new_power=0;

    if (enemy=2){
        en_power=battle_object.p_guardsmen[battle_id];
        battle_object.p_guardsmen[battle_id]-=threat;
        // if (threat=1) or (threat=2) then battle_object.p_guardsmen[battle_id]=0;
    }

    if (enemy=5){en_power=battle_object.p_sisters[battle_id];part10="Ecclesiarchy";}
    if (enemy=6){en_power=battle_object.p_eldar[battle_id];part10="Eldar";}
    if (enemy=7){en_power=battle_object.p_orks[battle_id];part10="Ork";}
    if (enemy=8){en_power=battle_object.p_tau[battle_id];part10="Tau";}
    if (enemy=9){en_power=battle_object.p_tyranids[battle_id];part10="Tyranid";}
    if (enemy=10){en_power=battle_object.p_traitors[battle_id];part10="Heretic";if (threat=7) then part10="Daemon";}
    if (enemy=11){en_power=battle_object.p_chaos[battle_id];part10="Chaos Space Marine";}
    if (enemy=13){en_power=battle_object.p_necrons[battle_id];part10="Necrons";}

    if (instance_exists(battle_object)) and (en_power>2){
        if (awake_tomb_world(battle_object.p_feature[battle_id])!=0){
            scr_gov_disp(battle_object.name,battle_id,floor(en_power/2));
        }
    }

	
    if (enemy!=2){
        if (attacker=0) then new_power=en_power-1;
        if ((attacker=1) or (dropping=1)) then new_power=en_power-2;

        new_power=max(new_power,0);
		
		//(¿?) Ramps up threat/enemy presence in case enemy Type == "Daemon" (¿?)
		//Does the inverse check/var assignment 10 lines above
        if (part10="Daemon") then new_power=7;
        if (enemy=9) and (new_power=0) then scr_event_log("","Tyranids cleansed from "+string(battle_object.name)+" "+scr_roman(battle_id));
        if (enemy=11) and (en_power!=floor(en_power)) then en_power=floor(en_power);
    }


    if (obj_controller.blood_debt=1) and (defeat=0){
        if (enemy=6) or (enemy=9) or (enemy=11) or (enemy=13){
            if (en_power=1){obj_controller.penitent_current+=25;obj_controller.penitent_turn=0;obj_controller.penitent_turnly=0;}
            if (en_power=2){obj_controller.penitent_current+=62;obj_controller.penitent_turn=0;obj_controller.penitent_turnly=0;}
            if (en_power=3){obj_controller.penitent_current+=95;obj_controller.penitent_turn=0;obj_controller.penitent_turnly=0;}
            if (en_power=4){obj_controller.penitent_current+=190;obj_controller.penitent_turn=0;obj_controller.penitent_turnly=0;}
            if (en_power=5){obj_controller.penitent_current+=375;obj_controller.penitent_turn=0;obj_controller.penitent_turnly=0;}
            if (en_power=6){obj_controller.penitent_current+=750;obj_controller.penitent_turn=0;obj_controller.penitent_turnly=0;}
        }
        if (enemy=7) or (enemy=8) or (enemy=10){
            if (en_power=1){obj_controller.penitent_current+=25;obj_controller.penitent_turn=0;obj_controller.penitent_turnly=0;}
            if (en_power=2){obj_controller.penitent_current+=50;obj_controller.penitent_turn=0;obj_controller.penitent_turnly=0;}
            if (en_power=3){obj_controller.penitent_current+=75;obj_controller.penitent_turn=0;obj_controller.penitent_turnly=0;}
            if (en_power=4){obj_controller.penitent_current+=150;obj_controller.penitent_turn=0;obj_controller.penitent_turnly=0;}
            if (en_power=5){obj_controller.penitent_current+=300;obj_controller.penitent_turn=0;obj_controller.penitent_turnly=0;}
            if (en_power=6){obj_controller.penitent_current+=600;obj_controller.penitent_turn=0;obj_controller.penitent_turnly=0;}
            if (en_power=7){obj_controller.penitent_current+=1500;obj_controller.penitent_turn=0;obj_controller.penitent_turnly=0;}
        }
    }

    if (enemy=5){battle_object.p_sisters[battle_id]=new_power;}
    if (enemy=6){battle_object.p_eldar[battle_id]=new_power;}
    if (enemy=7){battle_object.p_orks[battle_id]=new_power;}
    if (enemy=8){battle_object.p_tau[battle_id]=new_power;}
    if (enemy=9){battle_object.p_tyranids[battle_id]=new_power;}
    if (enemy=10){battle_object.p_traitors[battle_id]=new_power;}
    if (enemy=11){battle_object.p_chaos[battle_id]=new_power;}
    if (enemy=13){battle_object.p_necrons[battle_id]=new_power;}

    if (enemy!=2) and (string_count("cs_meeting_battle",battle_special)=0){
        part10+=" Forces on "+string(battle_loc);
        if (battle_id=1) then part10+=" I";
        if (battle_id=2) then part10+=" II";
        if (battle_id=3) then part10+=" III";
        if (battle_id=4) then part10+=" IV";
        if (battle_id=5) then part10+=" V";
        part10+=" have decreased to "+string(new_power)+" ("+string(en_power)+"-"+string(en_power-new_power)+")";
        newline=part10;scr_newtext();

        if (new_power<=0) and (en_power>0) then battle_object.p_raided[battle_id]=1;
    }
    if (enemy=2){
        part10+=" Imperial Guard Forces on "+string(battle_loc);
        if (battle_id=1) then part10+=" I";
        if (battle_id=2) then part10+=" II";
        if (battle_id=3) then part10+=" III";
        if (battle_id=4) then part10+=" IV";
        if (battle_id=5) then part10+=" V";
        part10+=" have decreased to "+string(battle_object.p_guardsmen[battle_id])+" ("+string(en_power)+"-"+string(threat)+")";
        newline=part10;scr_newtext();
    }



    if (enemy=8) and (ethereal>0) and (defeat=0){
        newline="Tau Ethereal Captured";newline_color="yellow";scr_newtext();
    }
    
    if (enemy=13) and (battle_object.p_necrons[battle_id]<3) and (awake_tomb_world(battle_object.p_feature[battle_id])== 1){
    
        // var bombs;bombs=scr_check_equip("Plasma Bomb",battle_loc,battle_id,0);
        // var bombs;bombs=scr_check_equip("Plasma Bomb","","",0);

        // show_message(string(bombs));

        if (plasma_bomb>0){
            // scr_check_equip("Plasma Bomb",battle_loc,battle_id,1);
            // scr_check_equip("Plasma Bomb","","",1);
            newline="Plasma Bomb used to seal the Necron Tomb.";newline_color="yellow";scr_newtext();
			seal_tomb_world(battle_object.p_feature[battle_id])
        }

        if (plasma_bomb<=0){
            battle_object.p_necrons[battle_id]=3;// newline_color="yellow";
            if (dropping!=0) then newline="Deep Strike Ineffective; Plasma Bomb required";
            if (dropping=0) then newline="Attack Ineffective; Plasma Bomb required";
            scr_newtext();
        }

        // popup here
        /*
        var pip;
        pip=instance_create(0,0,obj_popup);
        pip.title="Necron Tombs";
        pip.text="The Necrons have been defeated on the surface, but remain able to replenish their numbers and recuperate.  Do you wish to advance your army into the tunnels?";
        pip.image="necron_tunnels_1";
        pip.cooldown=15;
        cooldown=15;

        pip.option1="Advance!";
        pip.option2="Cancel the attack";*/




    }





    /*if (enemy=13) and (new_power<=0) and (dropping=0){
        var bombs;bombs=scr_check_equip("Plasma Bomb",battle_loc,battle_id,0);
        if (bombs>0){
            scr_check_equip("Plasma Bomb",battle_loc,battle_id,1);
            newline="Plasma Bomb used to seal the Necron Tomb.";newline_color="yellow";scr_newtext();
            if (battle_object.p_feature[battle_id]="Awakened Necron Tomb") then battle_object.p_feature[battle_id]="Necron Tomb";
        }
    }*/
}
if (defeat=0) and (enemy=9) and (battle_special="tyranid_org"){
    // show_message(string(captured_gaunt));
    if (captured_gaunt=1) then newline=string(captured_gaunt)+" Gaunt organism have been captured.";
    if (captured_gaunt>1) or (captured_gaunt=0) then newline=string(captured_gaunt)+" Gaunt organisms have been captured.";
    scr_newtext();

    if (captured_gaunt>0){
        var why,thatta;why=0;thatta=0;
        instance_activate_object(obj_star);
        // with(obj_star){if (name!=obj_ncombat.battle_loc) then instance_deactivate_object(id);}
        // thatta=obj_star;

        with(obj_star){
            var u;u=0;
            repeat(4){u+=1;
                if (p_problem[u,1]="tyranid_org"){p_problem[u,1]="";p_timer[u,1]=0;}
                if (p_problem[u,2]="tyranid_org"){p_problem[u,2]="";p_timer[u,2]=0;}
                if (p_problem[u,3]="tyranid_org"){p_problem[u,3]="";p_timer[u,3]=0;}
                if (p_problem[u,4]="tyranid_org"){p_problem[u,4]="";p_timer[u,4]=0;}
            }
        }

        /*var u;u=0;
        repeat(4){u+=1;
            if (thatta.p_problem[u,1]="tyranid_org"){thatta.p_problem[u,1]="";thatta.p_timer[u,1]=0;}
            if (thatta.p_problem[u,2]="tyranid_org"){thatta.p_problem[u,2]="";thatta.p_timer[u,2]=0;}
            if (thatta.p_problem[u,3]="tyranid_org"){thatta.p_problem[u,3]="";thatta.p_timer[u,3]=0;}
            if (thatta.p_problem[u,4]="tyranid_org"){thatta.p_problem[u,4]="";thatta.p_timer[u,4]=0;}
        }*/
    }

    scr_event_log("","Inquisition Mission Completed: A Gaunt organism has been captured for the Inquisition.");

    if (captured_gaunt>1){
        if (instance_exists(obj_turn_end)) then scr_popup("Inquisition Mission Completed","You have captured several Gaunt organisms.  The Inquisitor is pleased with your work, though she notes that only one is needed- the rest are to be purged.  It will be stored until it may be retrieved.  The mission is a success.","inquisition","");
    }
    if (captured_gaunt=1){
        if (instance_exists(obj_turn_end)) then scr_popup("Inquisition Mission Completed","You have captured a Gaunt organism- the Inquisitor is pleased with your work.  The Tyranid will be stored until it may be retrieved.  The mission is a success.","inquisition","");
    }
    instance_deactivate_object(obj_star);
}


newline="------------------------------------------------------------------------------";scr_newtext();
newline="------------------------------------------------------------------------------";scr_newtext();

if (((leader=1)) or ((battle_special="world_eaters") and (obj_controller.faction_defeated[10]=0))) and (defeat=0){
    var nep;nep=false;
    newline="The enemy Leader has been killed!";newline_color="yellow";scr_newtext();
    newline="------------------------------------------------------------------------------";scr_newtext();
    newline="------------------------------------------------------------------------------";scr_newtext();
    instance_activate_object(obj_event_log);
    if (enemy=5) then scr_event_log("","Enemy Leader Assassinated: Ecclesiarchy Prioress");
    if (enemy=6) then scr_event_log("","Enemy Leader Assassinated: Eldar Farseer");
    if (enemy=7){
		scr_event_log("","Enemy Leader Assassinated: Ork Warboss");
		if (Warlord !=0){Warlord.kill_warboss()}
		}
    if (enemy=8) then scr_event_log("","Enemy Leader Assassinated: Tau Diplomat");
    if (enemy=10) then scr_event_log("","Enemy Leader Assassinated: Chaos Lord");
}

var endline,inq_eated;endline=1;
inq_eated=false;


if (obj_ini.omophagea=1){
    var eatme;eatme=floor(random(100))+1;
    if (enemy=13) or (enemy=9) or (battle_special="ship_demon") then eatme+=100;
    if (enemy=10) and (battle_object.p_traitors[battle_id]=7) then eatme+=200;

    if (red_thirst=3) then thirsty=1;if (red_thirst>3) then thirsty=red_thirst-2;
    if (thirsty>0) then eatme-=(thirsty*6);if (really_thirsty>0) then eatme-=(really_thirsty*15);
    if (string_count("Shitty",obj_ini.strin2)=1) then eatme-=10;

    if (allies>0){obj_controller.disposition[2]-=choose(1,0,0);obj_controller.disposition[4]-=choose(0,0,1);obj_controller.disposition[5]-=choose(0,0,1);}
    if (present_inquisitor>0) then obj_controller.disposition[4]-=2;

    if (eatme<=25){endline=0;
        if (thirsty=0) and (really_thirsty=0){
            var ran;ran=choose(1,2);
            newline="One of your marines slowly makes his way towards the fallen enemies, as if in a spell.  Once close enough the helmet is removed and he begins shoveling parts of their carcasses into his mouth.";
            newline="Two marines are sharing a quick discussion, and analysis of the battle, when one of the two suddenly drops down and begins shoveling parts of enemy corpses into his mouth.";
            newline+=choose("  Bone snaps and pops.","  Strange-colored blood squirts from between his teeth.","  Veins and tendons squish wetly.");
        }
        if (thirsty>0) and (really_thirsty=0){
            var ran;ran=choose(1,2);
            newline="One of your Death Company marines slowly makes his way towards the fallen enemies, as if in a spell.  Once close enough the helmet is removed and he begins shoveling parts of their carcasses into his mouth.";
            newline="A marine is observing and communicating with a Death Company marine, to ensure they are responsive, when that Death Company marine drops down and suddenly begins shoveling parts of enemy corpses into his mouth.";
            newline+=choose("  Bone snaps and pops.","  Strange-colored blood squirts from between his teeth.","  Veins and tendons squish wetly.");
        }
        if (really_thirsty>0){
            newline="One of your Death Company "+string(obj_ini.role[100][6])+" blitzes to the fallen enemy lines.  Massive mechanical hands begin to rend and smash at the fallen corpses, trying to squeeze their flesh and blood through the sarcophogi opening.";
        }

        newline+="  Almost at once most of the present "+string(global.chapter_name)+" follow suite, joining in and starting a massive feeding frenzy.  The sight is gruesome to behold.";
        scr_newtext();


        // check for pdf/guardsmen
        eatme=floor(random(100))+1;if (string_count("Shitty",obj_ini.strin2)=1) then eatme-=10;
        if (eatme<=10) and (allies>0){
            obj_controller.disposition[2]-=2;
            if (allies=1){newline="Local PDF have been eaten!";newline_color="red";scr_newtext();}
            if (allies=2){newline="Local Guardsmen have been eaten!";newline_color="red";scr_newtext();}
        }

        // check for inquisitor
        eatme=floor(random(100))+1;if (string_count("Shitty",obj_ini.strin2)=1) then eatme-=5;
        if (eatme<=40) and (present_inquisitor=1){
            var thatta,thatta2,remove,i;thatta=0;remove=0;i=0;
            obj_controller.disposition[4]-=10;inq_eated=true;
            instance_activate_object(obj_en_fleet);

            if (instance_exists(inquisitor_ship)){
                repeat(2){scr_loyalty("Inquisitor Killer","+");}
                if (obj_controller.loyalty>=85) then obj_controller.last_world_inspection-=44;
                if (obj_controller.loyalty>=70) and (obj_controller.loyalty<85) then obj_controller.last_world_inspection-=32;
                if (obj_controller.loyalty>=50) and (obj_controller.loyalty<70) then obj_controller.last_world_inspection-=20;
                if (obj_controller.loyalty<50) then scr_loyalty("Inquisitor Killer","+");

                var msg,msg2,i,remove;msg="";msg2="";i=0;remove=0;
                // if (string_count("Inqis",inquisitor_ship.trade_goods)>0) then show_message("B");
                if (string_count("Inqis1",inquisitor_ship.trade_goods)=1){newline="Inquisitor "+string(obj_controller.inquisitor[1])+" has been eaten!";msg="Inquisitor "+string(obj_controller.inquisitor[1]);remove=1;scr_event_log("red","Your Astartes consume "+string(msg)+".");}
                if (string_count("Inqis2",inquisitor_ship.trade_goods)=1){newline="Inquisitor "+string(obj_controller.inquisitor[2])+" has been eaten!";msg="Inquisitor "+string(obj_controller.inquisitor[2]);remove=2;scr_event_log("red","Your Astartes consume "+string(msg)+".");}
                if (string_count("Inqis3",inquisitor_ship.trade_goods)=1){newline="Inquisitor "+string(obj_controller.inquisitor[3])+" has been eaten!";msg="Inquisitor "+string(obj_controller.inquisitor[3]);remove=3;scr_event_log("red","Your Astartes consume "+string(msg)+".");}
                if (string_count("Inqis4",inquisitor_ship.trade_goods)=1){newline="Inquisitor "+string(obj_controller.inquisitor[4])+" has been eaten!";msg="Inquisitor "+string(obj_controller.inquisitor[4]);remove=4;scr_event_log("red","Your Astartes consume "+string(msg)+".");}
                if (string_count("Inqis5",inquisitor_ship.trade_goods)=1){newline="Inquisitor "+string(obj_controller.inquisitor[5])+" has been eaten!";msg="Inquisitor "+string(obj_controller.inquisitor[5]);remove=5;scr_event_log("red","Your Astartes consume "+string(msg)+".");}
                newline_color="red";scr_newtext();
                if (obj_controller.inquisitor_type[remove]="Ordo Hereticus") then scr_loyalty("Inquisitor Killer","+");

                i=remove;
                repeat(10-remove){
                    if (i<10){
                        obj_controller.inquisitor_gender[i]=obj_controller.inquisitor_gender[i+1];
                        obj_controller.inquisitor_type[i]=obj_controller.inquisitor_type[i+1];
                        obj_controller.inquisitor[i]=obj_controller.inquisitor[i+1];
                    }
                    if (i=10){
                        obj_controller.inquisitor_gender[i]=choose(1,1,1,1,2,2,2);
                        obj_controller.inquisitor_type[i]=choose("Ordo Malleus","Ordo Xenos","Ordo Hereticus","Ordo Hereticus","Ordo Hereticus","Ordo Hereticus","Ordo Hereticus","Ordo Hereticus");
                        obj_controller.inquisitor[i]=scr_imperial_name(obj_controller.inquisitor_gender[i]);// For 'random inquisitor wishes to inspect your fleet
                    }
                    i+=1;
                }

                instance_activate_object(obj_turn_end);
                if (obj_controller.known[eFACTION.Inquisition]<3) and (!instance_exists(obj_turn_end)){
                    var pip;pip=instance_create(0,0,obj_popup);
                    pip.title="Inquisitor Killed";pip.text=msg;pip.image="inquisition";pip.cooldown=30;
                    pip.title="EXCOMMUNICATUS TRAITORUS";
                    pip.text="The Inquisition has noticed your uncalled CONSUMPTION of "+string(msg)+" and declared your chapter Excommunicatus Traitorus.";
                    instance_deactivate_object(obj_popup);
                    obj_controller.alarm[8]=1;
                    scr_event_log("red","EXCOMMUNICATUS TRAITORUS");
                }
                if (obj_controller.known[eFACTION.Inquisition]<3) and (instance_exists(obj_turn_end)){
                    scr_popup("Inquisitor Killed","The Inquisition has noticed your uncalled CONSUMPTION of "+string(msg)+" and declared your chapter Excommunicatus Traitorus.","inquisition","");
                    obj_controller.alarm[8]=1;scr_event_log("red","EXCOMMUNICATUS TRAITORUS");
                }
                instance_deactivate_object(obj_turn_end);

                with(inquisitor_ship){instance_destroy();}
                with(obj_temp3){instance_destroy();}
                with(obj_temp4){instance_destroy();}
            }
            instance_deactivate_object(obj_star);
            instance_deactivate_object(obj_en_fleet);
        }
    }
}

if (inq_eated=false) and (obj_ncombat.sorcery_seen>=2){
    scr_loyalty("Use of Sorcery","+");newline="Inquisitor "+string(obj_controller.inquisitor[1])+" witnessed your Chapter using sorcery.";
    scr_event_log("green",string(newline));scr_newtext();
}

if (exterminatus>0) and (dropping!=0){
    newline="Exterminatus has been succesfully placed.";newline_color="yellow";endline=0;scr_newtext();
}

instance_activate_object(obj_star);
instance_activate_object(obj_turn_end);

//If not fleet based and...
if (obj_ini.fleet_type!=1) and (defeat==1) and (dropping==0){
	var monastery_list = search_planet_features(battle_object.p_feature[obj_ncombat.battle_id], P_features.Monastery);
	var monastery_count = array_length(monastery_list);
	if(monastery_count>0){
		for (var mon = 0;mon < monastery_count;mon++){
			battle_object.p_feature[obj_ncombat.battle_id][monastery_list[mon]].status="destroyed";
		}

	    if (obj_controller.und_gene_vaults=0) then newline="Your Fortress Monastery has been raided.  "+string(obj_controller.gene_seed)+" Gene-Seed has been destroyed or stolen.";
	    if (obj_controller.und_gene_vaults>0) then newline="Your Fortress Monastery has been raided.  "+string(floor(obj_controller.gene_seed/10))+" Gene-Seed has been destroyed or stolen.";

	    scr_event_log("red",string(newline));
	    instance_activate_object(obj_event_log);
	    newline_color="red";scr_newtext();

	    var lasers_lost,defenses_lost,silos_lost;
	    lasers_lost=0;defenses_lost=0;silos_lost=0;

	    if (player_defenses>0){defenses_lost=round(player_defenses*0.75);}
	    if (battle_object.p_silo[obj_ncombat.battle_id]>0){silos_lost=round(battle_object.p_silo[obj_ncombat.battle_id]*0.75);}
	    if (battle_object.p_lasers[obj_ncombat.battle_id]>0){lasers_lost=round(battle_object.p_lasers[obj_ncombat.battle_id]*0.75);}

	    if (player_defenses<30) then defenses_lost=player_defenses;
	    if (battle_object.p_silo[obj_ncombat.battle_id]<30){silos_lost=battle_object.p_silo[obj_ncombat.battle_id];}
	    if (battle_object.p_lasers[obj_ncombat.battle_id]<8){lasers_lost=battle_object.p_lasers[obj_ncombat.battle_id];}

	    var percent;percent=0;newline="";
	    if (defenses_lost>0){
	        percent=round((defenses_lost/player_defenses)*100);
	        newline=string(defenses_lost)+" Weapon Emplacements have been lost ("+string(percent)+"%).";
	    }
	    if (silos_lost>0){
	        percent=round((silos_lost/battle_object.p_silo[obj_ncombat.battle_id])*100);
	        if (defenses_lost>0) then newline+="  ";
	        newline+=string(silos_lost)+" Missile Silos have been lost ("+string(percent)+"%).";
	    }
	    if (lasers_lost>0){
	        percent=round((lasers_lost/battle_object.p_lasers[obj_ncombat.battle_id])*100);
	        if (silos_lost>0) or (defenses_lost>0) then newline+="  ";
	        newline+=string(lasers_lost)+" Defense Lasers have been lost ("+string(percent)+"%).";
	    }

	    battle_object.p_defenses[obj_ncombat.battle_id]-=defenses_lost;
	    battle_object.p_silo[obj_ncombat.battle_id]-=silos_lost;
	    battle_object.p_lasers[obj_ncombat.battle_id]-=lasers_lost;
	    if (defenses_lost+silos_lost+lasers_lost>0){newline_color="red";scr_newtext();}

	    endline=0;

	    if (obj_controller.und_gene_vaults=0){
	        obj_controller.gene_seed=0;var w;w=0;repeat(120){w+=1;if (obj_ini.slave_batch_num[w]>0){obj_ini.slave_batch_num[w]=0;obj_ini.slave_batch_eta[w]=0;}}
	    }
	    if (obj_controller.und_gene_vaults>0) then obj_controller.gene_seed-=floor(obj_controller.gene_seed/10);
	}
}
instance_deactivate_object(obj_star);
instance_deactivate_object(obj_turn_end);

if (endline=0){
    newline="------------------------------------------------------------------------------";scr_newtext();
    newline="------------------------------------------------------------------------------";scr_newtext();
}


if (defeat=1){
	player_forces=0;
		if (instance_exists(obj_temp4)){
		obj_temp4.recoverable_gene_seed = seed_max;
	}
	
}

instance_deactivate_object(obj_star);


/* */
/*  */
