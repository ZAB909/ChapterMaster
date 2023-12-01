// TODO script description: This is the turn management in general 
// TODO refactor
var times=max(1,round(turn/150));
var recruit_count=0;
var random_marine, marine_position;
var eq1=1,eq2=1,eq3=1,t=0,r=0;
var marine_company=0;
var warn="",w5=0;
var g1=0,g2=0;
var onceh=0,tot=0,stahp=0;
var disc=0,droll=0;
var rund=0;
var spikky=0;
var roll=0;
var novice_type="";
var unit;

if (known[eFACTION.Chaos]==2) and (faction_defeated[eFACTION.Chaos]==0) then times+=1;

var xx3, yy3, plani, _star;
xx3=floor(random(room_width))+1;
yy3=floor(random(room_height))+1;
_star=instance_nearest(xx3,yy3,obj_star);
plani=floor(random(_star.planets))+1;

// ** Chaos influence / corruption **
if (faction_gender[eFACTION.Chaos]==1) and (faction_defeated[eFACTION.Chaos]==0) and (turn>=chaos_turn) then repeat(times){
    if (_star.p_type[plani]!="Dead") and (_star.planets>0) and (turn>=20){
        var cathedral=0;
        if (planet_feature_bool(_star.p_feature[plani], P_features.Sororitas_Cathedral)==1) then cathedral=choose(0,1,1);
    
        if (cathedral=0){
            if (_star.p_heresy[plani]>=0) and (_star.p_heresy[plani]<10){
                _star.p_heresy[plani]+=choose(0,0,0,0,0,0,0,0,5);
            }else if (_star.p_heresy[plani]>=10) and (_star.p_heresy[plani]<20){
                _star.p_heresy[plani]+=choose(-2,-2,-2,5,10,15);
            }else if(_star.p_heresy[plani]>=20) and (_star.p_heresy[plani]<40){
                _star.p_heresy[plani]+=choose(-2,-1,0,0,0,0,0,0,5,10);
            }else if(_star.p_heresy[plani]>=40) and (_star.p_heresy[plani]<60){
                _star.p_heresy[plani]+=choose(-2,-1,0,0,0,0,0,0,5,10,15);
            }else if(_star.p_heresy[plani]>=60) and (_star.p_heresy[plani]<100){
                _star.p_heresy[plani]+=choose(-1,0,0,0,0,5,10,15);
            }
        }
        if (_star.p_heresy[plani]<0) then _star.p_heresy[plani]=0;
    }
}

instance_activate_object(obj_star);

// ** Build new Imperial Ships **
with(obj_temp6){instance_destroy();}
with(obj_temp5){instance_destroy();}
with(obj_temp4){instance_destroy();}
imp_ships=0;
with(obj_en_fleet){
    if (owner==eFACTION.Imperium){
        obj_controller.imp_ships+=capital_number;
        obj_controller.imp_ships+=frigate_number/2;
        obj_controller.imp_ships+=escort_number/4;
    }
}
with(obj_star){
    //empty object simply acts as a counter for the number of imperial systems
    if (owner == eFACTION.Imperium){
        instance_create(x,y,obj_temp6)
    }else if (owner == eFACTION.Mechanicus){
        instance_create(x,y,obj_temp5)
    }
    //unknown function of temp5 same as temp6 but for mechanicus worlds
    if (space_hulk==1) or (craftworld==1){x-=20000;y-=20000;}
}
// Former: var sha;sha=instance_number(obj_temp6)*1.3;
var sha=instance_number(obj_temp6)*0.65;// new

with(obj_temp6){instance_destroy();}

        /*in order for new ships to spawn the number of total imperial ships must be smaller than 
         one third of the total imperial star systems*/
if (instance_number(obj_temp5)>0) and (imp_ships<sha){
    var rando=irandom(100)+1, rando2=choose(1,2,2,3,3,3);
    var forge=instance_nearest(random(room_width),random(room_height),obj_temp5);
    
    //the less mechanicus forge worlds the less likely to spawn a new fleet
    if (rando<=(12)*instance_number(obj_temp5)){
        var new_defense_fleet=instance_create(forge.x,forge.y,obj_en_fleet);
        new_defense_fleet.owner= eFACTION.Imperium;
        new_defense_fleet.sprite_index=spr_fleet_imperial;
        switch(rando2){
            case 1:
                new_defense_fleet.capital_number=1;
                break;
            case 2:
                new_defense_fleet.frigate_number=1;
                break;
            case 3:
                new_defense_fleet.escort_number=1;
            break;
        }
        new_defense_fleet.trade_goods="merge";
        with(obj_temp5){instance_destroy();}
		
		var system_4 = []
		var system_3 = []
		var system_other = []
		
        with(obj_star) {
            if (x>10) and (y>10) and ((owner==eFACTION.Imperium) or (owner==eFACTION.Mechanicus)){
                var system_fleet_elements=0;
				
				var fleet_types = [
					eFACTION.Player,
					eFACTION.Imperium,
					eFACTION.Mechanicus,
					eFACTION.Inquisition,
					eFACTION.Ecclesiarchy,
					eFACTION.Eldar,
					eFACTION.Ork,
					eFACTION.Tau,
					eFACTION.Tyranids,
					eFACTION.Chaos,
					eFACTION.Necrons
				]
				
				system_fleet_elements = array_reduce(fleet_types, function(prev, curr) {
					return present_fleet[prev] + present_fleet[curr]
				})
				var coords = {x,y}
				
                if (system_fleet_elements==0) {
                    switch(planets){
                        case 4:
                            array_push(system_4, coords)//instance_create(x,y,obj_temp6);
                            break;
                        case 3:
                            array_push(system_3, coords)//instance_create(x,y,obj_temp5);
                            break;
						default:
							if (p_type[1]!="Dead") {
								array_push(system_other, coords)//instance_create(x,y,obj_temp4);
							}
                    }
                }
            }
        }
		
        var targeted=undefined;
		//shuffle the contents, if any
		array_shuffle_ext(system_4)
		array_shuffle_ext(system_3)
		array_shuffle_ext(system_other)

        if (bool(targeted)) {
			targeted = array_pop(system_4)
		}
		if (bool(targeted)) {
			targeted = array_pop(system_3)
		}
		if (bool(targeted)) {
			targeted = array_pop(system_other)
		}

        if (bool(targeted)){ 
            new_defense_fleet.action_x=targeted.x;
            new_defense_fleet.action_y=targeted.y;
            new_defense_fleet.alarm[4]=1;
        }
        
        with(obj_temp6){instance_destroy();}
        with(obj_temp5){instance_destroy();}
		with(obj_temp4){instance_destroy();}
    }
}

instance_activate_object(obj_star);
with(obj_star){
    if (x<-10000){x+=20000;y+=20000;}
    if (x<-10000){x+=20000;y+=20000;}
}

// ** Training **
// * Apothecary *

var training_points_values = [ 0, 0.8, 0.9, 1, 1.5, 2, 4 ]
apothecary_points += training_points_values[training_apothecary]
/*
if (training_apothecary!=0){
    if (training_apothecary==1){
        apothecary_points+=0.8
    }else if (training_apothecary==2){
        apothecary_points+=0.9
    } else if(training_apothecary==3){
        apothecary_points+=1
    }else if(training_apothecary==4){
        apothecary_points+=1.5
    }else if(training_apothecary==5){
        apothecary_points+=2
    }else if(training_apothecary==6){
        apothecary_points+=4
    }
}
novice_type = string("{0} Aspirant",obj_ini.role[100][15])
if (training_apothecary>0) then recruit_count=scr_role_count(novice_type,"");
if (apothecary_points>=4) and (apothecary_aspirant!=0) and (recruit_count=0){
    apothecary_points=0;
    apothecary_aspirant=0;
}

if (apothecary_points>=48){
    if (recruit_count>0){
        random_marine=scr_random_marine(novice_type,0);
        // show_message(marine_position);
        // show_message(obj_ini.role[0,marine_position]);
        if (random_marine != "none"){
            marine_position=random_marine[1];
            apothecary_points-=48;
            unit = obj_ini.TTRPG[0,marine_position];
            scr_alert("green","recruitment",unit.name_role()+" has finished training.",0,0);
            unit.update_role(obj_ini.role[100][15]);
            unit.add_exp(10);
            apothecary_aspirant=0;            

            eq1=1;
            eq2=1;
            eq3=1;
            t=0;
            r=0;

            if (obj_ini.wep1[0,marine_position]!=obj_ini.wep1[100,15]){
                for (t=1; t<=50; t++){
                    if (obj_ini.equipment[t]=obj_ini.wep1[100,15]) and (obj_ini.equipment_number[t]>=1) and (r=0) then r=t;
                }
                if (r!=0){
                    if (obj_ini.wep1[0,marine_position]!="") then scr_add_item(obj_ini.wep1[0,marine_position],1);
                    scr_add_item(obj_ini.wep1[100,15],-1);
                    obj_ini.wep1[0,marine_position]=obj_ini.wep1[100,15];
                }
                if (r==0) then eq1=0;
            }
            if (obj_ini.wep2[0,marine_position]!=obj_ini.wep2[100,15]){
                r=0;
                for (t=1; t<=50; t++){
                    if (obj_ini.equipment[t]=obj_ini.wep2[100,15]) and (obj_ini.equipment_number[t]>=1) and (r=0) then r=t;
                }
                if (r!=0){
                    if (obj_ini.wep2[0,marine_position]!="") then scr_add_item(obj_ini.wep2[0,marine_position],1);
                    scr_add_item(obj_ini.wep2[100,15],-1);
                    obj_ini.wep2[0,marine_position]=obj_ini.wep2[100,15];
                }
                if (r==0) then eq2=0;
            }
            if (obj_ini.gear[0,marine_position]!=obj_ini.gear[100,15]){
                r=0;
                for (t=1; t<=50; t++){
                    if (obj_ini.equipment[t]=obj_ini.gear[100,15]) and (obj_ini.equipment_number[t]>=1) and (r=0) then r=t;
                }
                if (r!=0){
                    if (obj_ini.gear[0,marine_position]!="") then scr_add_item(obj_ini.gear[0,marine_position],1);
                    scr_add_item(obj_ini.gear[100,15],-1);
                    obj_ini.gear[0,marine_position]=obj_ini.gear[100,15];
                }
                if (r==0) then eq3=0;
            }
            if (eq1+eq2+eq3!=3){
                warn="";
                w5=0;
                if (eq1==0) then warn+=string(obj_ini.wep1[100,15])+", ";
                if (eq2==0) then warn+=string(obj_ini.wep2[100,15])+", ";
                if (eq3==0) then warn+=string(obj_ini.gear[100,15])+", ";
                
                w5=string_length(warn)-1;
                warn=string_delete(warn,w5,2);
                warn+=".";
                scr_alert("red","recruitment","Not enough equipment: "+string(warn),0,0);
            }
            with(obj_ini){scr_company_order(0);}
        }

    }
}
recruit_count=0;
if (apothecary_points>=4) and (apothecary_aspirant==0){
    random_marine=scr_random_marine([obj_ini.role[100][8],obj_ini.role[100][18],obj_ini.role[100][10],obj_ini.role[100][9]],60,{"stat":[["technology", 30, "more"],["intelligence", 45, "more"]]});

    if (random_marine != "none"){
        marine_position=random_marine[1];
        marine_company=random_marine[0];
        g1=0;
        g2=0;
        // This gets the last open slot for company 0
        for(var h=1; h<=300; h++){
            if (g1==0){
                if (obj_ini.role[0,h]="") then g1=h;
            }
        }
        if (g1!=0){
            apothecary_aspirant=1;
            command+=1;
            marines-=1;
            scr_move_unit_info(marine_company,0, marine_position, g1)
            obj_ini.role[0][g1]=novice_type;
            if (obj_ini.gear[0][g1]!=""){
                scr_add_item(obj_ini.gear[0][g1],1);
                obj_ini.gear[0][g1]="";
            }
            if (obj_ini.mobi[0][g1]!=""){scr_add_item(obj_ini.mobi[0][g1],1);obj_ini.mobi[0][g1]="";}
            with(obj_ini){
                scr_company_order(marine_company);
                scr_company_order(0);
            }
        }                  
    } else {
        scr_alert("red","recruitment","No marines available for apothecary traning",0,0);
    }
}
// * Chaplain training *
// TODO add functionality for Space Wolves and Iron Hands
if (global.chapter_name!="Space Wolves") and (global.chapter_name!="Iron Hands"){
	
	chaplain_points += training_points_values[training_chaplain]
	/*
    if (training_chaplain!=0){
        if (training_chaplain==1){
            chaplain_points+=0.8
        }else if (training_chaplain==2){
            chaplain_points+=0.9
        }else if (training_chaplain==3){
            chaplain_points+=1
        }else if (training_chaplain==4){
            chaplain_points+=1.5
        }else if (training_chaplain==5){
            chaplain_points+=2
        }else if (training_chaplain==6){
            chaplain_points+=4
        }
    }
    novice_type = string("{0} Aspirant",obj_ini.role[100][14])
    if (training_chaplain>0) then recruit_count=scr_role_count(novice_type,"");
    if (chaplain_points>=4) and (chaplain_aspirant!=0) and (recruit_count==0){
        chaplain_points=0;
        chaplain_aspirant=0;
    }
    if (chaplain_points>=48){
        if (recruit_count>0){
            random_marine=scr_random_marine(novice_type,0);
            if (random_marine != "none"){
                marine_position = random_marine[1];
                unit = obj_ini.TTRPG[0,marine_position];
                scr_alert("green","recruitment",unit.name_role()+" has finished training.",0,0);
                chaplain_points-=48;
                unit.update_role(obj_ini.role[100][14]);
                unit.add_exp(10);
                chaplain_aspirant=0;
                eq1=1;
                eq2=1;
                eq3=1;
                t=0;
                r=0;
                if (obj_ini.wep1[0,marine_position]!=obj_ini.wep1[100,14]){
                    for (t=1; t<=50; t++){
                        if (obj_ini.equipment[t]==obj_ini.wep1[100,14]) and (obj_ini.equipment_number[t]>=1) and (r==0) then r=t;
                    }
                    if (r!=0){
                        if (obj_ini.wep1[0,marine_position]!="") then scr_add_item(obj_ini.wep1[0,marine_position],1);
                        scr_add_item(obj_ini.wep1[100,14],-1);
                        obj_ini.wep1[0,marine_position]=obj_ini.wep1[100,14];
                    }
                    if (r==0) then eq1=0;
                }
                if (obj_ini.wep2[0,marine_position]!=obj_ini.wep2[100,14]){
                    r=0;
                    for (t=1; t<=50; t++){
                        if (obj_ini.equipment[t]=obj_ini.wep2[100,14]) and (obj_ini.equipment_number[t]>=1) and (r==0) then r=t;
                    }
                    if (r!=0){
                        if (obj_ini.wep2[0,marine_position]!="") then scr_add_item(obj_ini.wep2[0,marine_position],1);
                        scr_add_item(obj_ini.wep2[100,14],-1);
                        obj_ini.wep2[0,marine_position]=obj_ini.wep2[100,14];
                    }
                    if (r==0) then eq2=0;
                }
                if (obj_ini.gear[0,marine_position]!=obj_ini.gear[100,14]){
                    r=0;
                    for (t=1; t<=50; t++){
                        if (obj_ini.equipment[t]=obj_ini.gear[100,14]) and (obj_ini.equipment_number[t]>=1) and (r==0) then r=t;
                    }
                    if (r!=0){
                        if (obj_ini.gear[0,marine_position]!="") then scr_add_item(obj_ini.gear[0,marine_position],1);
                        scr_add_item(obj_ini.gear[100,14],-1);
                        obj_ini.gear[0,marine_position]=obj_ini.gear[100,14];
                    }
                    if (r==0) then eq3=0;
                }
                if (eq1+eq2+eq3!=3){
                    warn="";
                    w5=0;
                    if (eq1==0) then warn+=string(obj_ini.wep1[100,14])+", ";
                    if (eq2==0) then warn+=string(obj_ini.wep2[100,14])+", ";
                    if (eq3==0) then warn+=string(obj_ini.gear[100,14])+", ";
                    
                    w5=string_length(warn)-1;
                    warn=string_delete(warn,w5,2);
                    warn+=".";
                    scr_alert("red","recruitment","Not enough equipment: "+string(warn),0,0);
                }
                with(obj_ini){scr_company_order(0);}                
            }
        }
    }
    if (chaplain_points>=4) and (chaplain_aspirant==0){    
        marine_company=0;
        random_marine=scr_random_marine([obj_ini.role[100][8],obj_ini.role[100][18],obj_ini.role[100][10],obj_ini.role[100][9]],60,{"stat":[["piety", 35, "more"],["charisma", 30, "more"]]});
        if (random_marine != "none"){
            marine_position = random_marine[1];
            marine_company = random_marine[0];
            g1=0;
            // This gets the last open slot for company 0
            for(var h=1; h<=300; h++){
                if (g1==0){
                    if (obj_ini.role[0,h]="") and (obj_ini.name[0,h]="")then g1=h;
                }
            }
            if (g1!=0){
                chaplain_aspirant=1;
                command+=1;
                marines-=1;
                scr_move_unit_info(marine_company,0, marine_position, g1);
                obj_ini.role[0][g1]=novice_type;
                if (obj_ini.gear[0][g1]!=""){
                    scr_add_item(obj_ini.gear[0][g1],1);
                    obj_ini.gear[0][g1]="";
                }
                if (obj_ini.mobi[0][g1]!=""){
                    scr_add_item(obj_ini.mobi[0][g1],1);
                    obj_ini.mobi[0][g1]="";
                }
                scr_alert("green","recruitment",novice_type+string(obj_ini.name[0][g1])+" begins training.",0,0);
                with(obj_ini){
                    scr_company_order(marine_company);
                    scr_company_order(0);
                }
            }                      
        }
    }
}
recruit_count=0;
// * Psycher Training *

psyker_points += training_points_values[training_psyker]
/*
if (training_psyker!=0){
    if (training_psyker==1){
        psyker_points+=0.8
    }else if (training_psyker==2){
        psyker_points+=0.9
    }else if (training_psyker==3){
        psyker_points+=1
    }else if (training_psyker==4){
        psyker_points+=1.5
    }else if (training_psyker==5){
        psyker_points+=2
    }else if (training_psyker==6){
        psyker_points+=4
    }
}
*/
var goal=48,yep=0;
novice_type = string("{0} Aspirant",obj_ini.role[100,17]);
for(var o=1; o<=4; o++){
    if (obj_ini.adv[o]=="Psyker Abundance"){
        goal=30;
        yep=1;
    }
}

if (training_psyker>0) then recruit_count=scr_role_count(novice_type,"0");
if (psyker_points>=round(goal/2)) and (psyker_aspirant!=0) and (recruit_count==0){
    psyker_points=0;
    psyker_aspirant=0;
}
if (psyker_points>=goal){
    if (recruit_count>0){
        marine_position=0;
        random_marine=scr_random_marine(novice_type,0,{"stat":[["psionic", 8, "more"]]});
        if (random_marine != "none"){
            marine_position = random_marine[1];
            psyker_points-=48;
            psyker_aspirant=0;
            unit = obj_ini.TTRPG[0,marine_position];
            scr_alert("green","recruitment",unit.name_role()+" has finished training.",0,0);
            unit.update_role("Lexicanum")
            with(obj_ini){scr_company_order(0);}
        }
    }
}
if (psyker_points>=round(goal/2)) and (psyker_aspirant==0){
    marine_position=0;
    marine_company=0;

    random_marine=scr_random_marine([obj_ini.role[100][8], obj_ini.role[100][18], obj_ini.role[100][9], obj_ini.role[100][10]],30, {"stat":[["psionic", 8, "more"]]});
    if (random_marine == "none"){
        training_psyker=0;
        scr_alert("red","recruitment","No remaining warp sensitive marines for training",0,0);
    }else if (random_marine != "none"){
        marine_position=random_marine[1];
        marine_company=random_marine[0];
        g1=0;
        // This gets the last open slot for company 0
        for(var h=1; h<=300; h++){
            if (g1==0){
                if (obj_ini.role[0,h]=="") then g1=h;
            }
        }
        if (g1!=0){
            command+=1;
            marines-=1;
			scr_move_unit_info(marine_company,0, marine_position, g1)
            obj_ini.role[0][g1]=novice_type;
            scr_powers_new(0,g1);
            psyker_aspirant=1;
            
            if (string_count("Abund",obj_ini.strin)>0) then obj_ini.experience[0][g1]+=floor(random(5))+3;
            
            obj_ini.mobi[0][g1]=obj_ini.mobi[marine_company,marine_position];
            if (obj_ini.gear[0][g1]!=""){
                scr_add_item(obj_ini.gear[0][g1],1);
                obj_ini.gear[0][g1]="";
            }
            if (obj_ini.mobi[0][g1]!=""){
                scr_add_item(obj_ini.mobi[0][g1],1);
                obj_ini.mobi[0][g1]="";
            }
            scr_alert("green","recruitment",obj_ini.TTRPG[0][g1].name_role()+" begins training.",0,0);
            with(obj_ini){
                scr_company_order(marine_company);
                scr_company_order(0);
            }
        }    
    }
}
recruit_count=0;


tech_points += training_points_values[training_techmarine]
/*
// * Tech Marine *
if (training_techmarine!=0){
    if (training_techmarine==1){
        tech_points+=0.8
    }else if (training_techmarine==2){
        tech_points+=0.9
    }else if (training_techmarine==3){
        tech_points+=1
    }else if (training_techmarine==4){
        tech_points+=1.5
    }else if (training_techmarine==5){
        tech_points+=2
    }else if (training_techmarine==6){
        tech_points+=4
    }
}

if (training_techmarine>0) then recruit_count=scr_role_count(string("{0} Aspirant",obj_ini.role[100][16]),"");
if (tech_points>=4) and (tech_aspirant!=0) and (recruit_count==0){
    tech_points=0;
    tech_aspirant=0;
}
if (tech_points>=360){
    if (recruit_count>0){
        marine_position=0;
        random_marine=scr_random_marine(string("{0} Aspirant",obj_ini.role[100][16]),0);
        if (random_marine != "none"){
            marine_position = random_marine[1];
            tech_points-=360;
            tech_aspirant=0;
            obj_ini.role[0,marine_position]=obj_ini.role[100][16];
            obj_ini.experience[0,marine_position]+=10;
            
            eq1=1;
            eq2=1;
            eq3=1;
            t=0;
            r=0;
            if (obj_ini.wep1[0,marine_position]!=obj_ini.wep1[100,16]){
                for (t=1; t<=50; t++){
                    if (obj_ini.equipment[t]==obj_ini.wep1[100,16]) and (obj_ini.equipment_number[t]>=1) and (r==0) then r=t;
                }
                if (r!=0){
                    if (obj_ini.wep1[0,marine_position]!="") then scr_add_item(obj_ini.wep1[0,marine_position],1);
                    scr_add_item(obj_ini.wep1[100,16],-1);
                    obj_ini.wep1[0,marine_position]=obj_ini.wep1[100,16];
                }
                if (r==0) then eq1=0;
            }
            if (obj_ini.wep2[0,marine_position]!=obj_ini.wep2[100,16]){
                r=0;
                for (t=1; t<=50; t++){
                    if (obj_ini.equipment[t]==obj_ini.wep2[100,16]) and (obj_ini.equipment_number[t]>=1) and (r==0) then r=t;
                }
                if (r!=0){
                    if (obj_ini.wep2[0,marine_position]!="") then scr_add_item(obj_ini.wep2[0,marine_position],1);
                    scr_add_item(obj_ini.wep2[100,16],-1);
                    obj_ini.wep2[0,marine_position]=obj_ini.wep2[100,16];
                }
                if (r==0) then eq2=0;
            }
            if (obj_ini.gear[0,marine_position]!=obj_ini.gear[100,16]){
                if (obj_ini.gear[0,marine_position]!="") then scr_add_item(obj_ini.gear[0,marine_position],1);
                obj_ini.gear[0,marine_position]="Servo Arms";
            }
            obj_ini.TTRPG[0,marine_position].religion="cult_mechanicus";
            obj_ini.TTRPG[0,marine_position].add_trait("mars_trained");
            scr_alert("green","recruitment",string(obj_ini.name[0,marine_position])+" returns from Mars, a "+string(obj_ini.role[100][16])+".",0,0);
            
            if (eq1+eq2!=2){
                warn="";
                w5=0;
                if (eq1==0) then warn+=string(obj_ini.wep1[100,16])+", ";
                if (eq2==0) then warn+=string(obj_ini.wep2[100,16])+", ";
                
                w5=string_length(warn)-1;warn=string_delete(warn,w5,2);
                warn+=".";
                scr_alert("red","recruitment","Not enough equipment: "+string(warn),0,0);
            }
            obj_ini.loc[0][marine_position]=obj_ini.home_name;
            obj_ini.wid[0][marine_position]=2;
            obj_ini.lid[0][marine_position]=0;
            // TODO Probably want to change this to take into account fleet type chapters- also increase the man_size of that area by +X
            if (global.chapter_name!="Iron Hands") and (obj_ini.bio[0,marine_position]<4) then obj_ini.bio[0,marine_position]=choose(4,5,6);
            if (global.chapter_name=="Iron Hands") and (obj_ini.bio[0,marine_position]<7) then obj_ini.bio[0,marine_position]=choose(7,8);
            // 135 ; probably also want to increase the p_player by 1 just because
            with(obj_ini){scr_company_order(0);}
        }
    }
}
if (tech_points>=4) and (tech_aspirant==0){    
    marine_position=0;
    marine_company=0;
    var search_conditions = {"stat":[["technology", 35, "more"]]}
    random_marine=scr_random_marine([obj_ini.role[100][8],obj_ini.role[100][18],obj_ini.role[100][10],obj_ini.role[100][9]],30,search_conditions);
    if (random_marine != "none"){
        marine_position = random_marine[1];
        marine_company = random_marine[0];
        g1=0;
        g2=0;
        // This gets the last open slot for company 0
        for(var h=1; h<=300; h++){
            if (g1==0){if (obj_ini.role[0,h]=="") then g1=h;}
        }
        if (g1!=0){
            tech_aspirant=1;
            command+=1;
            marines-=1;
            scr_move_unit_info(marine_company,0, marine_position, g1);
            obj_ini.role[0][g1]=obj_ini.role[100][16]+" Aspirant";
            // Remove from ship
            if (obj_ini.lid[0][g1]>0){
                var man_size=scr_unit_size(obj_ini.armour[0][g1],obj_ini.role[0][g1],true);
                obj_ini.ship_carrying[obj_ini.lid[0][g1]]-=man_size;
            }
            obj_ini.loc[0][g1]="Terra";
            obj_ini.wid[0][g1]=4;
            obj_ini.lid[0][g1]=0;
            if (obj_ini.wep1[0][g1]!="Power Weapon") and (obj_ini.wep1[0][g1]!=""){
                scr_add_item(obj_ini.wep1[0][g1],1);
                obj_ini.wep1[0][g1]="";
            }
            if (obj_ini.wep2[0][g1]!=""){
                scr_add_item(obj_ini.wep2[0][g1],1);
                obj_ini.wep2[0][g1]="";
            }
            if (obj_ini.gear[0][g1]!=""){
                scr_add_item(obj_ini.gear[0][g1],1);
                obj_ini.gear[0][g1]="";
            }
            if (obj_ini.mobi[0][g1]!=""){
                scr_add_item(obj_ini.mobi[0][g1],1);
                obj_ini.mobi[0][g1]="";
            }
            scr_alert("green","recruitment",string(obj_ini.role[100][16])+" Aspirant "+string(obj_ini.name[0][g1])+" journeys to Mars.",0,0);
            with(obj_ini){
                scr_company_order(marine_company);
                scr_company_order(0);
            }
        }    
    } else{
        training_techmarine = 0;
        scr_alert("red",string("recruitment","No marines with sufficient technology aptitude for {0} training",obj_ini.role[100][16]),0,0);
    }
}
recruit_count=0;

if (obj_ini.fleet_type!=1){
    with(obj_temp5){instance_destroy();}
    with(obj_p_fleet){
        if (action!="") then instance_create(x,y,obj_temp5);
        if (x<0) or (x>room_width) or (y<0) or (y>room_height) then instance_create(x,y,obj_temp5);
    }
    if (instance_number(obj_temp5)>=instance_number(obj_p_fleet)) then stahp=1;
    with(obj_temp5){instance_destroy();}
}

var recruits_finished=0,tot=0,recruit_first="";
// ** Assign recruits to X Company **
for(var i=1; i<=300; i++){
    if (recruit_name[i]!="") then tot+=1;
    if (recruit_name[i]!="") and (recruit_distance[i]<=0) then recruit_training[i]-=1;
}
for(var i=1; i<=300; i++){
    if (recruit_name[i]!="") and (recruit_training[i]<=0){
        scr_add_man(obj_ini.role[100][12],10,"Scout Armour",obj_ini.role[100][12],"",recruit_exp[i],recruit_name[i],recruit_corruption[i],false,"default","");
        if (recruit_first=="") then recruit_first=recruit_name[i];
        recruits_finished+=1;
        recruit_name[i]="";
        recruit_training[i]=-50;
    }
}
// Correct recruits name and empties the array
// TODO could be implemented better
for(var i=1; i<=299; i++){
    if (recruit_name[i]=="") and (recruit_name[i+1]!=""){
        recruit_name[i]=recruit_name[i+1];
        recruit_corruption[i]=recruit_corruption[i+1];
        recruit_distance[i]=recruit_distance[i+1];
        recruit_training[i]=recruit_training[i+1];
        recruit_exp[i]=recruit_exp[i+1];
        
        recruit_name[i+1]="";
        recruit_corruption[i+1]=0;
        recruit_distance[i+1]=0;
        recruit_training[i+1]=0;
        recruit_exp[i+1]=0;
    }
}

if (recruits_finished==1) then scr_alert("green","recruitment",string(obj_ini.role[100][12])+" "+string(recruit_first)+" has joined X Company.",0,0);
if (recruits_finished>1) then scr_alert("green","recruitment",string(recruits_finished)+"x "+string(obj_ini.role[100][12])+" have joined X Company.",0,0);


recruits=tot;

// ** Gene-seed Test-Slaves **
for(var i=1; i<=120; i++){
    if (obj_ini.slave_batch_num[i]>0){
        obj_ini.slave_batch_eta[i]-=1;
        if (obj_ini.slave_batch_eta[i]==0){
            obj_ini.slave_batch_eta[i]=60;
            obj_controller.gene_seed+=obj_ini.slave_batch_num[i];
            // color / type / text /x/y
            scr_alert("green","test-slaves","Test-Slave Incubators Batch "+string(i)+" harvested for "+string(obj_ini.slave_batch_num[i])+" Gene-Seed.",0,0);
        }
    }
}
/* TODO implement Lamenters get Black Rage and story
if (turn=240) and (global.chapter_name="Lamenters"){
    obj_ini.strin2+="Black Rage";
    scr_popup("Geneseed Mutation","Your Chapter has begun to have visions and nightmares of Sanguinius' fall.  The less mentally disciplined of your battle-brothers no longer are able to sleep soundly, waking from sleep in a screaming, frothing rage.  It appears the Black Rage has returned.","black_rage","");    
}
*/
// ** Battlefield Loot **
if (obj_ini.adv[1]="Scavengers") or (obj_ini.adv[2]="Scavengers") or (obj_ini.adv[3]="Scavengers") or (obj_ini.adv[4]="Scavengers"){
    var lroll1,lroll2,loot="";
    lroll1=floor(random(100))+1;
    lroll2=floor(random(100))+1;
    if (obj_ini.dis[1]="Shitty Luck") or (obj_ini.dis[2]="Shitty Luck") or (obj_ini.dis[3]="Shitty Luck") or (obj_ini.dis[4]="Shitty Luck"){
        lroll1+=2;
        lroll2+=25;
    }
    if (lroll1<=5){
        loot=choose("Chainsword","Bolt Pistol","Combat Knife","Narthecium");
        if (lroll2<=80) then loot=choose("Power Sword","Storm Bolter");
        if (lroll2<=60) then loot=choose("Plasma Pistol","Chainfist","Lascannon","Heavy Bolter","Assault Cannon","Bike");
        if (lroll2<=30) then loot=choose("Artificer Armour","Plasma Gun","Chainfist","Rosarius","Psychic Hood");
        if (lroll2<=10) then loot=choose("Terminator Armour","Artificer Armour","Dreadnought","Plasma Gun","Power Fist","Thunder Hammer","Iron Halo");
        var tix="A "+string(loot)+" has been gifted to the Chapter.";
        tix=string_replace(tix,"A A","An A");
        tix=string_replace(tix,"A E","An E");
        tix=string_replace(tix,"A I","An I");
        tix=string_replace(tix,"A O","An O");
        scr_add_item(string(loot),1);
        scr_alert("","loot",tix,0,0);
    }
}
// ** Check number of navy fleets **
with(obj_temp_inq){instance_destroy();}
with(obj_temp8){instance_destroy();}

with(obj_en_fleet){
    if (owner==eFACTION.Imperium) and (navy==1) then instance_create(x,y,obj_temp_inq);
}
if (instance_number(obj_temp_inq)>target_navy_number) {
    with(obj_en_fleet) {
		if (navy==0) or (guardsmen_unloaded==1) then y-=20000;
	}
    var him = instance_nearest(random(room_width),random(room_height),obj_en_fleet);
    if (him.guardsmen_unloaded==0) and (him.navy==1)  {
		with(him){instance_destroy();}
	}
    with(obj_en_fleet){if (y<-10000) then y+=20000;}
}

//if the inquisition temp navy amount is less than the target, make a fleet
if (instance_number(obj_temp_inq)<target_navy_number) {
    with(obj_star){
        var good=false;
        for(var o=1; o<=4; o++) {
            if (p_type[o]=="Forge") 
				and (p_owner[o]==eFACTION.Mechanicus) 
				and (p_orks[o]+p_tau[o]+p_tyranids[o]+p_chaos[o]+p_traitors[o]+p_necrons[o]==0) {
					
					var enemy_fleets = [
						eFACTION.Ork,
						eFACTION.Tau,
						eFACTION.Tyranids,
						eFACTION.Chaos,
						eFACTION.Necrons
					]
				
					var enemy_fleet_count = array_reduce(enemy_fleets, function(prev, curr) {
						return present_fleet[prev] + present_fleet[curr]
					})
		            if (enemy_fleet_count == 0){
		                good=true;
		                if (instance_nearest(x+24,y-24,obj_en_fleet).navy==1) then good=false;
		            }
            }
        }
        if (good==true) then instance_create(x,y,obj_temp8);
    }
}

// After initial navy fleet construction fleet growth is handled in obj_en_fleet.alarm_5
if (instance_exists(obj_temp8)){
    var newy,nav;
    newy=instance_nearest(random(room_width),random(room_height),obj_temp8);
    nav=instance_create(newy.x+24,newy.y-24,obj_en_fleet);
    nav.owner=eFACTION.Imperium;
    
    nav.capital_number=0;
    nav.frigate_number=0;
    nav.escort_number=1;
    nav.home_x=x;
    nav.home_y=y;
    with(instance_nearest(newy.x,newy.y,obj_star)){present_fleet[2]+=1;}
    nav.orbiting=instance_nearest(newy.x,newy.y,obj_star);
    nav.navy=1;
    
    var total_ships=0;
    total_ships+=nav.capital_number-1;
    total_ships+=round((nav.frigate_number/2));
    total_ships+=round((nav.escort_number/4));
    if (total_ships<=1) and (nav.capital_number+nav.frigate_number+nav.escort_number>0) then total_ships=1;
    nav.image_index=total_ships;
    nav.image_speed=0;
    
    nav.trade_goods="building_ships";
    with(obj_temp8){instance_destroy();}
}
// ** Adeptus Mechanicus Geneseed Tithe **
if (gene_tithe==0) and (faction_status[eFACTION.Imperium]!="War"){
    gene_tithe=24;

    var expected,txt="",mech_mad=false;
    onceh=0;
    expected=max(1,round(obj_controller.gene_seed/20));
    if (obj_controller.faction_status[eFACTION.Mechanicus]=="War") then mech_mad=true;

    if (obj_controller.gene_seed<=0) or (mech_mad==true){
        onceh=2;
        gene_iou+=1;
        loyalty-=2;
        loyalty_hidden-=2;
        txt="No Gene-Seed for Adeptus Mechanicus tithe.  High Lords of Terra IOU increased to "+string(gene_iou)+".";
    }
    if (mech_mad==false){
        if (obj_controller.gene_seed>0) and (und_gene_vaults==0) and (onceh==0){
            obj_controller.gene_seed-=expected;
            onceh=1;
            if (obj_controller.gene_seed>=gene_iou) and (gene_iou>0){
                expected+=gene_iou;
                obj_controller.gene_seed-=gene_iou;
                gene_iou=0;
                onceh=3;
            }
            for(var i=0; i<50; i++){
                if (obj_controller.gene_seed<gene_iou) and (obj_controller.gene_seed>0) and (gene_iou>0){
                    expected+=1;
                    obj_controller.gene_seed-=1;
                    gene_iou-=1;
                    if (gene_iou==0) then onceh=3;
                }
            }

            if (gene_iou<0) then gene_iou=0;

            txt=string(expected)+" Gene-Seed sent to Adeptus Mechanicus for tithe.";
            if (gene_iou>0) then txt+="  IOU remains at "+string(gene_iou)+".";
            if (onceh==3) then txt+="  IOU has been payed off.";
        }

        if (obj_controller.gene_seed>0) and (und_gene_vaults>0) and (onceh==0){
            expected=1;
            obj_controller.gene_seed-=expected;
            onceh=1;

            if (obj_controller.gene_seed<gene_iou) and (obj_controller.gene_seed>0) and (gene_iou>0){
                expected+=1;
                obj_controller.gene_seed-=1;
                gene_iou-=1;
                if (gene_iou==0) then onceh=3;
            }

            if (gene_iou<0) then gene_iou=0;

            txt=string(expected)+" Gene-Seed sent to Adeptus Mechanicus for tithe.";
            if (gene_iou>0) then txt+="  IOU remains at "+string(gene_iou)+".";
            if (onceh==3) then txt+="  IOU has been payed off.";
        }

        if (onceh!=2){
            scr_alert("green","tithes",txt,0,0);
            scr_event_log("",txt);
        }
        if (onceh==2){
            scr_alert("red","tithes",txt,0,0);
            scr_event_log("red",txt);
        }
    }
}
if (gene_sold>0){
    disc=0;
    droll=0;
    gene_sold=floor(gene_sold*75)/100;

    if (gene_sold<1) then gene_sold=0;
    if (gene_sold>=50){
        disc=round(gene_sold/7);
        droll=floor(random(100))+1;

        // Inquisition takes notice
        if (droll<=disc) and (obj_controller.known[eFACTION.Inquisition]!=0){
            var disp_change=-3;
            if (gene_sold>=100) then disp_change=-5;
            if (gene_sold>=200) then disp_change=-7;
            if (gene_sold>=400) then disp_change=-10;
            gene_sold=0;
            scr_audience(4,"gene_trade",disp_change,"",2,0);
        }
    }
}
if (gene_xeno>0){
    disc=0;
    droll=0;
    gene_xeno=floor(gene_xeno*90)/100;

    if (gene_xeno<1) then gene_xeno=0;
    if (gene_xeno>=5){
        disc=round(gene_xeno/5);
        droll=floor(random(100))+1;

        // Inquisition takes notice
        if (droll<=disc) and (obj_controller.known[eFACTION.Inquisition]!=0){
            gene_xeno=99999;
            alarm[8]=1;
        }
    }
}
var p=0,penitorium=0;
for(var c=0; c<11; c++){
    for(var e=1; e<=250; e++){
        if (obj_ini.god[c,e]>=10){
            p+=1;
            penit_co[p]=c;
            penit_id[p]=e;
            penitorium+=1;
            if (obj_ini.chaos[c,e]<90) and (obj_ini.chaos[c,e]>0){
                var heresy_old=0,heresy_new=0;
                heresy_old=round((obj_ini.chaos[c,e]*obj_ini.chaos[c,e])/50)-0.5;
                heresy_new=(heresy_old*50)/obj_ini.chaos[c,e];
                obj_ini.chaos[c,e]=max(0,heresy_new);
            }
        }
    }
}
// STC Bonuses
if (obj_controller.stc_ships>=6){
    for(var v=1; v<=40; v++){
        if (obj_ini.ship_hp[v]<obj_ini.ship_maxhp[v]) then obj_ini.ship_hp[v]+=round(obj_ini.ship_maxhp[v]*0.06);
        if (obj_ini.ship_hp[v]>obj_ini.ship_maxhp[v]) then obj_ini.ship_hp[v]=obj_ini.ship_maxhp[v];
    }
}
if (turn==5) and (faction_gender[eFACTION.Chaos]==1) {// show_message("Turn 100");
    var xx4=0,yy4=0,plant=0,planet=0,testi=0,fleeta=0;

    with(obj_en_fleet){if (owner != eFACTION.Imperium) then y-=20000;} //this is stupid, just filter and test with a reduce function
	//this won't always work due to randomness
    for(var i=0; i<50; i++){
		//pick a random star...
        if (planet==0){
            xx4=floor(random(room_width))+1;
            yy4=floor(random(room_height))+1;
            plant=instance_nearest(xx4,yy4,obj_star);
        }
        if (planet==0) and (plant.owner==eFACTION.Imperium) and (plant.planets>1){
            planet=plant
			
            if (planet.present_fleet[eFACTION.Imperium]>0){
                fleeta=instance_nearest(planet.x,planet.y,obj_en_fleet);
                if (point_distance(fleeta.x,fleeta.y,planet.x,planet.y)>40)
					planet=0;
            }
            if (planet.present_fleet[eFACTION.Imperium]==0) then planet=0;
        }
    }
    if (planet!=0){
        if (planet.p_type[1]=="Dead") then testi=2;
        if (planet.p_type[1]!="Dead") then testi=1;
        
        planet.warlord[testi]=1;

        array_push(planet.p_feature[testi], new new_planet_feature(P_features.Warlord10));

        if (planet.p_type[testi]=="Hive") then planet.p_heresy[testi]+=25;
        if (planet.p_type[testi]!="Hive") then planet.p_heresy[testi]+=10;
        if (planet.p_heresy[testi]<50) then planet.p_heresy_secret[testi]=10;

        // show_message("Placed the chaos warlord on "+string(planet.name)+" "+scr_roman(testi));// 139
        // obj_controller.x=planet.x;obj_controller.y=planet.y;
    }
    with(obj_en_fleet){if (owner!= eFACTION.Imperium) then y+=20000;}
}
// * Blood debt end *
if (blood_debt==1) and (penitent==1){
    penitent_turn+=1;
    // was -60
    penitent_turnly=((penitent_turn*penitent_turn)-512)*-1;
    if (penitent_turnly>0) then penitent_turnly=0;
    penitent_current+=penitent_turnly;
    if (penitent_current<=0){
        penitent=0;
        alarm[8]=1;
    }
    if (penitent_end<30000) then penitent_end+=41000;
    if (penitent_current>=penitent_max) or (((obj_controller.millenium*1000)+obj_controller.year)>=penitent_end){
        penitent=0;
        if (known[eFACTION.Inquisition]==2) or (known[eFACTION.Inquisition]>=4) then scr_audience(4,"penitent_end",0,"",0,0);
        if (known[eFACTION.Ecclesiarchy]>=2) then scr_audience(5,"penitent_end",0,"",0,0);
        disposition[eFACTION.Imperium]+=20;
        disposition[eFACTION.Mechanicus]+=15;
        disposition[eFACTION.Inquisition]+=20;
        disposition[eFACTION.Ecclesiarchy]+=20;
        var o=0;
        for(o=1; o<=4; o++){
            if (obj_ini.adv[o]=="Reverent Guardians") then o=500;
        }
        if (o>100) then obj_controller.disposition[eFACTION.Ecclesiarchy]+=10;
        scr_event_log("","Blood Debt payed off.  You may once more recruit Astartes.");
    }
}
// * Penitent Crusade end *
if (penitent==1) and (blood_debt==0){
    penitent_turn+=1;
    penitent_current+=1;
    penitent_turnly=0;

    if (penitent_current<=0){
        penitent=0;
        alarm[8]=1;
    }
    if (penitent_current>=penitent_max){
        penitent=0;
        if (known[eFACTION.Inquisition]==2) or (known[eFACTION.Inquisition]>=4) then scr_audience(4,"penitent_end",0,"",0,0);
        if (known[eFACTION.Ecclesiarchy]>=2) then scr_audience(5,"penitent_end",0,"",0,0);
        disposition[eFACTION.Imperium]+=20;
        disposition[eFACTION.Mechanicus]+=15;
        disposition[eFACTION.Imperium]+=20;
        disposition[eFACTION.Ecclesiarchy]+=20;
        var o=0;
        for(o=1; o<=4; o++){
            if (obj_ini.adv[o]=="Reverent Guardians") then o=500;
        }
        if (o>100) then obj_controller.disposition[eFACTION.Ecclesiarchy]+=10;
        scr_event_log("","Penitent Crusade ends.  You may once more recruit Astartes.");
    }
}
// ** Ork WAAAAGH **
if ((turn>=10) or (obj_ini.fleet_type==eFACTION.Mechanicus)) and (faction_defeated[eFACTION.Ork]==0){
    var waaagh=floor(random(100))+1;
    with(obj_star){
        if (owner==eFACTION.Ork) then instance_create(x,y,obj_temp2);
    }
    if ((instance_number(obj_temp2)>=5) and (waaagh<=instance_number(obj_temp2)) and (obj_controller.known[eFACTION.Ork]==0))/* or (obj_controller.is_test_map=true)*/{
        obj_controller.known[eFACTION.Ork]=0.5;
		//set an alarm for all ork controlled planets
        with(obj_star){
            if (owner==eFACTION.Ork) then alarm[4]=1;
        }

        if (!instance_exists(obj_turn_end)) then scr_popup("WAAAAGH!","The greenskins have swelled in activity, their numbers increasing seemingly without relent.  A massive Warboss has risen to take control, leading most of the sector's Orks on a massive WAAAGH!","waaagh","");
		
        if (instance_exists(obj_turn_end)){
            obj_turn_end.popups+=1;
            obj_turn_end.popup[obj_turn_end.popups]=1;
            obj_turn_end.popup_type[obj_turn_end.popups]="WAAAAGH!";
            obj_turn_end.popup_text[obj_turn_end.popups]="The greenskins have swelled in activity, their numbers increasing seemingly without relent.  A massive Warboss has risen to take control, leading most of the sector's Orks on a massive WAAAGH!";
            obj_turn_end.popup_image[obj_turn_end.popups]="waaagh";
            scr_event_log("red","Ork WAAAAGH! begins.");

            with(obj_star){
                if (owner==eFACTION.Ork){
                    rund=floor(random(planets))+1;
                    if (p_owner[rund]==eFACTION.Ork) and (p_pdf[rund]==0) and (p_guardsmen[rund]==0) and (p_orks[rund]>=2) then instance_create(x,y,obj_temp6);
                }
            }
            if (instance_exists(obj_temp6)){
                var you2,you;
                rund=0;
                you2=instance_nearest(random(room_width),random(room_height),obj_temp6);
                you=instance_nearest(you2.x,you2.y,obj_star);

                with(obj_temp2){instance_destroy();}
                for(var i=0; i<10; i++){
                    if (!instance_exists(obj_temp2)){
                        rund=round(random(you.planets));
						if (rund>0) and(rund<5){
							if	(you.p_owner[rund]==eFACTION.Ork) and (you.p_pdf[rund]+you.p_guardsmen[rund]==0) and (you.p_orks[rund]>=2) then array_push( you.p_feature[rund], new new_planet_feature(P_features.Warlord7));
						}
                        if (you.p_orks[rund]<4) then you.p_orks[rund]=4;
                        if (planet_feature_bool(you.p_feature[rund], P_features.Warlord7)==1) then instance_create(x,y,obj_temp2);
                    }
                }
            }
            with(obj_temp6){instance_destroy();}
            with(obj_temp2){instance_destroy();}
        }
    }
    with(obj_temp2){instance_destroy();}
}

// if (known[eFACTION.Ecclesiarchy]=1){var spikky;spikky=choose(0,0,0,1,1);if (spikky=1) then with(obj_turn_end){audiences+=1;audien[audiences]=5;audien_topic[audiences]="intro";}}
if (known[eFACTION.Ecclesiarchy]==1){
    spikky=choose(0,1,1);
    if (spikky==1) then with(obj_turn_end){
        audiences+=1;
        audien[audiences]=eFACTION.Ecclesiarchy;
        known[eFACTION.Ecclesiarchy] = 2;
        audien_topic[audiences]="intro";
        if (obj_controller.faction_status[eFACTION.Ecclesiarchy]=="War") then audien_topic[audiences]="declare_war";
    }
}
if (known[eFACTION.Eldar]==1) and (faction_defeated[eFACTION.Eldar]==0){
    spikky=choose(0,1);
    if (spikky==1) then with(obj_turn_end){
        audiences+=1;
        audien[audiences]= eFACTION.Eldar;
        audien_topic[audiences]="intro1";
    }
}
if (known[eFACTION.Ork]==0.5) and (faction_defeated[eFACTION.Ork]==0){
    spikky=floor(random(7));
    if (spikky==1) then with(obj_turn_end){
        audiences+=1;
        audien[audiences]=eFACTION.Ork;
        audien_topic[audiences]="intro";
    }
}
if (known[eFACTION.Tau]==1) and (faction_defeated[eFACTION.Tau]==0){
    with(obj_turn_end){
        audiences+=1;
        audien[audiences]=8;
        audien_topic[audiences]="intro";
    }
}
// ** Quests here **
// 135 ; quests
for(var i=1; i<=40; i++){
    if (quest_end[i]<=turn) and (quest[i]!=""){
        scr_quest(1,quest[i],quest_faction[i],0);
        quest[i]="";
    }
    if (quest[i]=="") and (quest[i+1]!=""){
        quest[i]=quest[i+1];
        quest_faction[i]=quest_faction[i+1];
        quest_end[i]=quest_end[i+1];
        quest[i+1]+="";
        quest_faction[i+1]=0;
        quest_end[i+1]=0;
    }
}
// ** Inquisition stuff here **
if (disposition[eFACTION.Eldar]>=60) then scr_loyalty("Xeno Associate","+");
if (disposition[eFACTION.Ork]>=60) then scr_loyalty("Xeno Associate","+");
if (disposition[eFACTION.Tau]>=60) then scr_loyalty("Xeno Associate","+");

var loyalty_counter=0;
loyalty_counter=scr_role_count(obj_ini.role[100][15],"");
if (loyalty_counter==0) then scr_loyalty("Lack of Apothecary","+");
loyalty_counter=scr_role_count(obj_ini.role[100][16],"");
if (loyalty_counter==0) then scr_loyalty("Upset Machine Spirits","+");
loyalty_counter=scr_role_count(obj_ini.role[100][14],"");
if (loyalty_counter==0) then scr_loyalty("Undevout","+");
// TODO in another PR rework how Non-Codex Size is determined, perhaps the inquisition needs to pass some checks or do an investigation event 
// which you could eventually interrupt (kill the team) and cover it up?
if (marines>=1050) then scr_loyalty("Non-Codex Size","+");

var laas=0;
if (obj_ini.fleet_type=1) then laas=last_world_inspection;
if (obj_ini.fleet_type!=1) then laas=last_fleet_inspection;

var inspec=false;
if (loyalty>=85) and ((laas+59)<turn) then inspec=true;
if (loyalty>=70) and (loyalty<85) and ((laas+47)<turn) then inspec=true;
if (loyalty>=50) and (loyalty<70) and ((laas+35)<turn) then inspec=true;
if (loyalty<50) and ((laas+11+choose(1,2,3,4))<turn) then inspec=true;

if (obj_ini.fleet_type!=1){
    with(obj_p_fleet){if (capital_number<=0) then instance_deactivate_object(id);}
    if (instance_number(obj_p_fleet)==1) and (obj_ini.fleet_type!=1){// Might be crusading, right?
        if (obj_p_fleet.x<0) or (obj_p_fleet.x>room_width) or (obj_p_fleet.y<0) or (obj_p_fleet.y>room_height) then inspec=false;
    }
    if (instance_number(obj_p_fleet)==0) then inspec=false;
}
instance_activate_object(obj_p_fleet);

with(obj_fleet){if (owner==eFACTION.Inquisition) then instance_create(x,y,obj_temp6);}
// TODO maybe have the inquisitor or his team as an actual entity that goes around and can die, which gives the player time to fix stuff 
// either kill the inquisitor or he dies in combat

// Sets up an inquisitor ship to do an inspection on the HomeWorld
if (inspec==true) and (faction_status[eFACTION.Inquisition]!="War") and (obj_ini.fleet_type==1) and (instance_number(obj_temp6)==0){
    // If player does not own their homeworld than do a fleet inspection instead
    with(obj_star){if (owner==eFACTION.Player) then instance_create(x,y,obj_temp3);}

    if (instance_number(obj_temp3)==1){
        var xy,yx,tar,new_defense_fleet;
        xy=obj_temp3.x;
        yx=obj_temp3.y;

        for(var i=0; i<choose(2,3); i++){
            tar=instance_nearest(obj_temp3.x,obj_temp3.y,obj_star);
            instance_deactivate_object(tar);
        }
        for(var i=0; i<5; i++){
            tar=instance_nearest(obj_temp3.x,obj_temp3.y,obj_star);
            if (tar.owner=eFACTION.Eldar) then instance_deactivate_object(tar);
        }

        tar=instance_nearest(obj_temp3.x,obj_temp3.y,obj_star);
        new_defense_fleet=instance_create(tar.x,tar.y-24,obj_en_fleet);
        new_defense_fleet.owner=eFACTION.Inquisition;
        new_defense_fleet.frigate_number=1;
        new_defense_fleet.action_x=xy;
        new_defense_fleet.action_y=yx;
        new_defense_fleet.sprite_index=spr_fleet_inquisition;
        new_defense_fleet.image_index=0;

        roll=floor(random(100))+1;

        if (roll<=60) then new_defense_fleet.trade_goods="Inqis1";
        if (roll<=70) and (roll>60) then new_defense_fleet.trade_goods="Inqis2";
        if (roll<=80) and (roll>70) then new_defense_fleet.trade_goods="Inqis3";
        if (roll<=90) and (roll>80) then new_defense_fleet.trade_goods="Inqis4";
        if (roll<=100) and (roll>90) then new_defense_fleet.trade_goods="Inqis5";

        new_defense_fleet.alarm[4]=1;

        instance_activate_object(obj_star);
        with(obj_temp3){instance_destroy();}
        last_world_inspection=turn;
    }
}

// Find planet near homeworld to have an inquisitor ship pop from
if (inspec==true) and (faction_status[eFACTION.Inquisition]!="War") and (obj_ini.fleet_type!=1) and (instance_number(obj_temp6)==0){
    // If player does not own their homeworld than do a fleet inspection instead

    with(obj_temp4){instance_destroy();}
    with(obj_temp5){instance_destroy();}

    if (instance_exists(obj_p_fleet)){
        with(obj_p_fleet){
            if (capital_number>0) and (action==""){instance_create(x,y,obj_temp5);}
            if (capital_number>0) and (action!=""){instance_create(action_x,action_y,obj_temp5);}
            if (frigate_number>0) and (action=="") then instance_create(x,y,obj_temp4);
            if (frigate_number>0) and (action!="") then instance_create(action_x,action_y,obj_temp4);
        }

        var obj,x4,y4,from,target,new_defense_fleet;
        if (instance_exists(obj_p_ship)) then obj=instance_nearest(random(room_width),random(room_height),obj_p_ship);
        if (instance_exists(obj_temp4)) then obj=instance_nearest(random(room_width),random(room_height),obj_temp4);
        if (instance_exists(obj_temp5)) then obj=instance_nearest(random(room_width),random(room_height),obj_temp5);

        x4=obj.x;
        y4=obj.y;

        with(obj_star){if (owner==eFACTION.Eldar) then instance_deactivate_object(id);}

        for(var i=0; i<choose(2,3); i++){
            from=instance_nearest(x4,y4,obj_star);
            with(from){instance_deactivate_object(id);};
        }
        from=instance_nearest(x4,y4,obj_star);
        instance_activate_object(obj_star);

        new_defense_fleet=instance_create(from.x,from.y-24,obj_en_fleet);
        new_defense_fleet.owner= eFACTION.Inquisition;
        new_defense_fleet.frigate_number=1;

        new_defense_fleet.target=instance_nearest(x4,y4,obj_p_fleet);
        new_defense_fleet.action_x=instance_nearest(x4,y4,obj_star).x;
        new_defense_fleet.action_y=instance_nearest(x4,y4,obj_star).y;
        if (new_defense_fleet.target.action!="") then new_defense_fleet.action_eta=new_defense_fleet.target.action_eta;
        // show_message(string(new_defense_fleet.action_eta));

        new_defense_fleet.sprite_index=spr_fleet_inquisition;
        new_defense_fleet.image_index=0;

        var mess="Inquisitor ";
        roll=irandom(100)+1;

        if (roll<=60){
            new_defense_fleet.trade_goods="Inqis1";
            mess+=string(obj_controller.inquisitor[1]);
        }
        if (roll<=70) and (roll>60){
            new_defense_fleet.trade_goods="Inqis2";
            mess+=string(obj_controller.inquisitor[2]);
        }
        if (roll<=80) and (roll>70){
            new_defense_fleet.trade_goods="Inqis3";
            mess+=string(obj_controller.inquisitor[3]);
        }
        if (roll<=90) and (roll>80){
            new_defense_fleet.trade_goods="Inqis4";
            mess+=string(obj_controller.inquisitor[4]);
        }
        if (roll<=100) and (roll>90){
            new_defense_fleet.trade_goods="Inqis5";
            mess+=string(obj_controller.inquisitor[5]);
        }
        new_defense_fleet.trade_goods+="_fleet";

        obj=instance_nearest(x4,y4,obj_star);

        mess+=" wishes to inspect your fleet at "+string(obj.name);
        scr_alert("green","inspect",mess,obj.x,obj.y);
        if (instance_exists(obj_turn_end)) then obj_turn_end.alerts+=1;

        new_defense_fleet.alarm[4]=1;

        with(obj_temp4){instance_destroy();}
        with(obj_temp5){instance_destroy();}
        last_fleet_inspection=turn;
    }
}

with(obj_temp6){instance_destroy();}

for(var i=1; i<=10; i++){
    if (turns_ignored[i]==0) and (annoyed[i]>0) then annoyed[i]-=1;
}
// ** Various checks for imperium and faction relations **
for(var i=1; i<=99; i++){
    if (event[i]!="") and (event_duration[i]>0){
        event_duration[i]-=1;
        if (event_duration[i]==0){

            if (event[i]=="game_over_man") then obj_controller.alarm[8]=1;
            // Removes planetary governor installed by the chapter
            if (string_count("remove_serf",event[i])>0){
                var ta,tb,tc,pp;
                explode_script(event[i],"|");
                ta=string(explode[0]);
                tb=string(explode[1]);
                tc=real(explode[2]);
                obj_controller.temp[1007]=string(tb);
                with(obj_temp5){instance_destroy();}
                with(obj_star){if (name==obj_controller.temp[1007]) then instance_create(x,y,obj_temp5);}
                if (instance_exists(obj_temp5)){
                    pp=instance_nearest(obj_temp5.x,obj_temp5.y,obj_star);
                    pp.dispo[tc]=-10;// Resets
                    var twix="Inquisition executes Chapter Serf in control of "+string(tb)+" "+string(tc)+" and installs a new Planetary Governor.";
                    if (pp.p_owner[tc]=eFACTION.Player) then pp.p_owner[tc]=pp.p_first[tc];
                    scr_alert("","",string(twix),0,0);scr_event_log("",string(twix));
                }
                with(obj_temp5){instance_destroy();}
            }
            // Changes relation to good
            if (event[i]=="enemy_imperium"){
                scr_alert("green","enemy","You have made amends with your enemy in the Imperium.",0,0);
                disposition[eFACTION.Imperium]+=20;
                scr_event_log("","Amends made with Imperium.");
            }
            if (event[i]=="enemy_mechanicus"){
                scr_alert("green","enemy","You have made amends with your Mechanicus enemy.",0,0);
                disposition[eFACTION.Mechanicus]+=20;
                scr_event_log("","Amends made with Mechanicus enemy.");
            }
            if (event[i]=="enemy_inquisition"){
                scr_alert("green","enemy","You have made amends with your enemy in the Inquisition.",0,0);
                disposition[eFACTION.Inquisition]+=20;
                scr_event_log("","Amends made with Inquisition enemy.");
            }
            if (event[i]=="enemy_ecclesiarchy"){
                scr_alert("green","enemy","You have made amends with your enemy in the Ecclesiarchy.",0,0);
                disposition[eFACTION.Ecclesiarchy]+=20;
                scr_event_log("","Amends made with Ecclesiarchy enemy.");
            }
            // Sector commander losses its mind
            if (event[i]=="imperium_daemon"){
                scr_alert("red","lol","Sector Commander "+string(faction_leader[eFACTION.Imperium])+" has gone insane.",0,0);
                faction_defeated[eFACTION.Imperium]=1;
                scr_event_log("red","Sector Commander "+string(faction_leader[eFACTION.Imperium])+" has gone insane.");
            }
            // Starts chaos invasion
		    if (event[i]=="chaos_invasion"){ 
				var xx=0,yy=0,flee=0,dirr=0;
                var star_id = scr_random_find(1,true,"","");
				if(star_id != undefined){
                    scr_event_log("purple","Chaos Fleets exit the warp near the "+string(star_id.name)+" system.");
                    for(var j=0; j<4; j++){
                        dirr+=irandom_range(50,100);
                        xx=star_id.x+lengthdir_x(72,dirr);
						yy=star_id.y+lengthdir_y(72,dirr);
                        flee=instance_create(xx,yy,obj_en_fleet);
						flee.owner=eFACTION.Chaos;
                        flee.sprite_index=spr_fleet_chaos;
						flee.image_index=4;
                        flee.capital_number=choose(0,1);
						flee.frigate_number=choose(2,3);
						flee.escort_number=choose(4,5,6);
                        flee.trade_goods="csm";
						obj_controller.chaos_fleets+=1;
                        flee.action_x=star_id.x;
						flee.action_y=star_id.y;
						flee.alarm[4]=1;
                    }	
				}
            }
            // Ships construction
            if (string_count("new_",event[i])>0){
                var fucking=event[i];
                with(obj_temp5){instance_destroy();}
                with(obj_star){
                    if (owner==eFACTION.Mechanicus){
                        if (p_type[1]=="Forge") and (p_owner[1]==eFACTION.Mechanicus) then instance_create(x,y,obj_temp5);
                        if (p_type[2]=="Forge") and (p_owner[2]==eFACTION.Mechanicus) then instance_create(x,y,obj_temp5);
                        if (p_type[3]=="Forge") and (p_owner[3]==eFACTION.Mechanicus) then instance_create(x,y,obj_temp5);
                        if (p_type[4]=="Forge") and (p_owner[4]==eFACTION.Mechanicus) then instance_create(x,y,obj_temp5);
                    }
                }
                if (instance_number(obj_temp5)>0){
                    var that,that2,new_defense_fleet;
                    that=instance_nearest(random(room_width),random(room_height),obj_temp5);
                    that2=instance_nearest(that.x,that.y,obj_star);
                    new_defense_fleet=instance_create(that2.x+24,that2.y-24,obj_p_fleet);

                    var ship_names="",new_name="",last_ship=0;
                    for(var k=1; k<=40; k++){
                        if (obj_ini.ship[k]!="") then ship_names+=string(obj_ini.ship[k]);
                        if (last_ship==0) and (obj_ini.ship[k]=="") then last_ship=k;
                    }
                    for(var k=1; k<=50; k++){
                        if (new_name==""){
                            new_name=scr_ship_name("imperial");
                            if (string_count(new_name,ship_names)>0) then new_name="";
                        } else {break};
                    }

                    obj_ini.ship[last_ship]=new_name;
                    obj_ini.ship_uid[last_ship]=floor(random(99999999))+1;
                    obj_ini.ship_owner[last_ship]=1; //TODO: determine if this means the player or not
                    obj_ini.ship_size[last_ship]=1;
                    obj_ini.ship_location[last_ship]=that2.name;
                    obj_ini.ship_leadership[last_ship]=100;
                    // Creates the ship
                    if (string_count("Battle Barge",fucking)>0){
                        obj_ini.ship_class[last_ship]="Battle Barge";
                        obj_ini.ship_size[last_ship]=3;
                        obj_ini.ship_hp[last_ship]=1200;
                        obj_ini.ship_maxhp[last_ship]=1200;
                        obj_ini.ship_conditions[last_ship]="";
                        obj_ini.ship_speed[last_ship]=20;
                        obj_ini.ship_turning[last_ship]=45;
                        obj_ini.ship_front_armour[last_ship]=6;
                        obj_ini.ship_other_armour[last_ship]=6;
                        obj_ini.ship_weapons[last_ship]=5;
                        obj_ini.ship_shields[last_ship]=12;
                        obj_ini.ship_wep[last_ship,1]="Weapons Battery";
                        ship_wep_facing[last_ship,1]="left";
                        obj_ini.ship_wep_condition[last_ship,1]="";
                        obj_ini.ship_wep[last_ship,2]="Weapons Battery";
                        ship_wep_facing[last_ship,2]="right";
                        obj_ini.ship_wep_condition[last_ship,2]="";
                        obj_ini.ship_wep[last_ship,3]="Thunderhawk Launch Bays";
                        obj_ini.ship_wep_facing[last_ship,3]="special";
                        obj_ini.ship_wep_condition[last_ship,3]="";
                        obj_ini.ship_wep[last_ship,4]="Torpedo Tubes";
                        obj_ini.ship_wep_facing[last_ship,4]="front";
                        obj_ini.ship_wep_condition[last_ship,4]="";
                        obj_ini.ship_wep[last_ship,5]="Bombardment Cannons";
                        obj_ini.ship_wep_facing[last_ship,5]="most";
                        obj_ini.ship_wep_condition[last_ship,5]="";
                        obj_ini.ship_capacity[last_ship]=600;
                        obj_ini.ship_carrying[last_ship]=0;
                        obj_ini.ship_contents[last_ship]="";
                        obj_ini.ship_turrets[last_ship]=3;
                        new_defense_fleet.capital[1]=obj_ini.ship[last_ship];
                        new_defense_fleet.capital_number=1;
                        new_defense_fleet.capital_num[1]=last_ship;
                        new_defense_fleet.capital_uid[1]=obj_ini.ship_uid[last_ship];
                    }
                    if (string_count("Strike Cruiser",fucking)>0){
                        obj_ini.ship_class[last_ship]="Strike Cruiser";
                        obj_ini.ship_size[last_ship]=2;
                        obj_ini.ship_hp[last_ship]=600;
                        obj_ini.ship_maxhp[last_ship]=600;
                        obj_ini.ship_conditions[last_ship]="";
                        obj_ini.ship_speed[last_ship]=25;
                        obj_ini.ship_turning[last_ship]=90;
                        obj_ini.ship_front_armour[last_ship]=6;
                        obj_ini.ship_other_armour[last_ship]=6;
                        obj_ini.ship_weapons[last_ship]=4;
                        obj_ini.ship_shields[last_ship]=6;
                        obj_ini.ship_wep[last_ship,1]="Weapons Battery";
                        ship_wep_facing[last_ship,1]="left";
                        obj_ini.ship_wep_condition[last_ship,1]="";
                        obj_ini.ship_wep[last_ship,2]="Weapons Battery";
                        ship_wep_facing[last_ship,2]="right";
                        obj_ini.ship_wep_condition[last_ship,2]="";
                        obj_ini.ship_wep[last_ship,3]="Thunderhawk Launch Bays";
                        obj_ini.ship_wep_facing[last_ship,3]="special";
                        obj_ini.ship_wep_condition[last_ship,3]="";
                        obj_ini.ship_wep[last_ship,4]="Bombardment Cannons";
                        obj_ini.ship_wep_facing[last_ship,4]="most";
                        obj_ini.ship_wep_condition[last_ship,4]="";
                        obj_ini.ship_capacity[last_ship]=250;
                        obj_ini.ship_carrying[last_ship]=0;
                        obj_ini.ship_contents[last_ship]="";
                        obj_ini.ship_turrets[last_ship]=1;
                        new_defense_fleet.frigate[1]=obj_ini.ship[last_ship];
                        new_defense_fleet.frigate_number=1;
                        new_defense_fleet.frigate_num[1]=last_ship;
                        new_defense_fleet.frigate_uid[1]=obj_ini.ship_uid[last_ship];
                    }
                    if (string_count("Gladius",fucking)>0){
                        obj_ini.ship_class[last_ship]="Gladius";
                        obj_ini.ship_hp[last_ship]=200;
                        obj_ini.ship_maxhp[last_ship]=200;
                        obj_ini.ship_conditions[last_ship]="";
                        obj_ini.ship_speed[last_ship]=30;
                        obj_ini.ship_turning[last_ship]=90;
                        obj_ini.ship_front_armour[last_ship]=5;
                        obj_ini.ship_other_armour[last_ship]=5;
                        obj_ini.ship_weapons[last_ship]=1;
                        obj_ini.ship_shields[last_ship]=1;
                        obj_ini.ship_wep[last_ship,1]="Weapons Battery";
                        ship_wep_facing[last_ship,1]="most";
                        obj_ini.ship_wep_condition[last_ship,1]="";
                        obj_ini.ship_capacity[last_ship]=30;
                        obj_ini.ship_carrying[last_ship]=0;
                        obj_ini.ship_contents[last_ship]="";
                        obj_ini.ship_turrets[last_ship]=1;
                        new_defense_fleet.escort[1]=obj_ini.ship[last_ship];
                        new_defense_fleet.escort_number=1;
                        new_defense_fleet.escort_num[1]=last_ship;
                        new_defense_fleet.escort_uid[1]=obj_ini.ship_uid[last_ship];
                    }
                    if (string_count("Hunter",fucking)>0){
                        obj_ini.ship_class[last_ship]="Hunter";
                        obj_ini.ship_hp[last_ship]=200;
                        obj_ini.ship_maxhp[last_ship]=200;
                        obj_ini.ship_conditions[last_ship]="";
                        obj_ini.ship_speed[last_ship]=30;
                        obj_ini.ship_turning[last_ship]=90;
                        obj_ini.ship_front_armour[last_ship]=5;
                        obj_ini.ship_other_armour[last_ship]=5;
                        obj_ini.ship_weapons[last_ship]=2;
                        obj_ini.ship_shields[last_ship]=1;
                        obj_ini.ship_wep[last_ship,1]="Torpedoes";
                        ship_wep_facing[last_ship,1]="front";
                        obj_ini.ship_wep_condition[last_ship,1]="";
                        obj_ini.ship_wep[last_ship,2]="Weapons Battery";
                        ship_wep_facing[last_ship,2]="most";
                        obj_ini.ship_wep_condition[last_ship,2]="";
                        obj_ini.ship_capacity[last_ship]=25;
                        obj_ini.ship_carrying[last_ship]=0;
                        obj_ini.ship_contents[last_ship]="";
                        obj_ini.ship_turrets[last_ship]=1;
                        new_defense_fleet.escort[1]=obj_ini.ship[last_ship];
                        new_defense_fleet.escort_number=1;
                        new_defense_fleet.escort_num[1]=last_ship;
                        new_defense_fleet.escort_uid[1]=obj_ini.ship_uid[last_ship];
                    }

                    // show_message(string(obj_ini.ship_class[last_ship])+":"+string(obj_ini.ship[last_ship]));

                    if (instance_exists(that2)){
                        if (obj_ini.ship_size[last_ship]!=1) then scr_popup("Ship Constructed","Your new "+string(obj_ini.ship_class[last_ship])+" '"+string(obj_ini.ship[last_ship])+"' has finished being constructed.  It is orbiting "+string(that2.name)+" and awaits its maiden voyage.","shipyard","");
                        if (obj_ini.ship_size[last_ship]==1) then scr_popup("Ship Constructed","Your new "+string(obj_ini.ship_class[last_ship])+" Escort '"+string(obj_ini.ship[last_ship])+"' has finished being constructed.  It is orbiting "+string(that2.name)+" and awaits its maiden voyage.","shipyard","");
                        var bob=instance_create(that2.x+16,that2.y-24,obj_star_event);
                        bob.image_alpha=1;
                        bob.image_speed=1;
                    }
                }
                if (instance_number(obj_temp5)==0) then event_duration[i]=2;
                with(obj_temp5){instance_destroy();}
                event[i]="";event_duration[i]-=1;
            }
            // Spare the inquisitor
            if (string_count("inquisitor_spared",event[i])>0){
                var diceh=floor(random(100))+1;

                if (string_count("Shit",obj_ini.strin2)>0) then diceh-=25;

                if (diceh<=25){
                    alarm[8]=1;
                    scr_loyalty("Crossing the Inquisition","+");
                }
                if (diceh>25) and (diceh<=50){scr_loyalty("Crossing the Inquisition","+");}
                if (diceh>50) and (diceh<=85){}
                if (diceh>85) and (event[i]="inquisitor_spared2"){
                    scr_popup("Anonymous Message","You recieve an anonymous letter of thanks.  It mentions that motions are underway to destroy any local forces of Chaos.","","");
                    with(obj_star){
                        for(var o=1; o<=4; o++){p_heresy[o]=max(0,p_heresy[o]-10);}
                    }
                }
            }

            if (string_count("strange_building",event[i])>0){
                var b_event="",marine_name="",comp=0,marine_num=0,item="";
                explode_script(event[i],"|");
                b_event=string(explode[0]);
                marine_name=string(explode[1]);
                comp=real(explode[2]);
                marine_num=real(explode[3]);
                item=string(explode[4]);

                var killy=0,tixt=string(obj_ini.role[100][16])+" "+string(marine_name)+" has finished his work- ";

                if (item=="Icon"){
                    tixt+="it is a "+string(global.chapter_name)+" Icon wrought in metal, finely decorated.  Pride for his chapter seems to have overtaken him.  There are no corrections to be made and the item is placed where many may view it.";
                }
                if (item=="Statue"){
                    tixt+="it is a small, finely crafted statue wrought in metal.  The "+string(obj_ini.role[100][16])+" is scolded for the waste of material, but none daresay the quality of the piece.";
                }
                if (item=="Bike"){
                    scr_add_item("Bike",1);
                    tixt+="it is a finely crafted Bike, conforming mostly to STC standards.  The other "+string(obj_ini.role[100][16])+" are surprised at the rapid pace of his work.";
                }
                if (item=="Rhino"){
                    scr_add_vehicle("Rhino",0,"Storm Bolter","Storm Bolter","","Artificer Hull","Dozer Blades");
                    tixt+="it is a finely crafted Rhino, conforming to STC standards.  The other "+string(obj_ini.role[100][16])+" are surprised at the rapid pace of his work.";
                }
                if (item=="Artifact"){
                    scr_event_log("",string(obj_ini.role[100][16])+" "+string(marine_name)+" constructs an Artifact.");
                    if (obj_ini.fleet_type==1) then scr_add_artifact("random_nodemon","",0,obj_ini.home_name,2);
                    if (obj_ini.fleet_type!=1) then scr_add_artifact("random_nodemon","",0,obj_ini.ship_location[1],501);
                    var last_artifact=0;
                    for(var k=1; k<=100; k++){
                        if (last_artifact==0){
                            if (obj_ini.artifact[k]=="") then last_artifact=k-1;
                        }
                    }
                    tixt+="some form of divine inspiration has seemed to have taken hold of him.  An artifact "+string(obj_ini.artifact[k])+" has been crafted.";
                }
                if (item=="baby"){
                    obj_ini.chaos[comp,marine_num]+=choose(8,12,16,20);
                    tixt+="some form of horrendous statue.  A weird amalgram of limbs and tentacles, the sheer atrocity of it is made worse by the tiny, baby-like form, the once natural shape of a human child twisted nearly beyond recognition.";
                }
                if (item=="robot"){
                    obj_ini.chaos[comp,marine_num]+=choose(2,4,6,8,10);
                    tixt+="some form of small, box-like robot.  It seems to teeter around haphazardly, nearly falling over with each step.  "+string(marine_name)+" maintains that it has no AI, though the other "+string(obj_ini.role[100][16])+" express skepticism.";
                }
                if (item=="demon"){
                    obj_ini.chaos[comp,marine_num]+=choose(8,12,16,20);
                    tixt+="some form of horrendous statue.  What was meant to be some sort of angel, or primarch, instead has a mishappen face that is hardly human in nature.  Between the fetid, ragged feathers and empty sockets it is truly blasphemous.";
                }
                if (item=="fusion"){
                    // obj_ini.chaos[comp,marine_num]+=choose(70);
                    tixt+="some kind of ill-mannered ascension.  One of your battle-brothers enters the armamentarium to find "+string(marine_name)+" fused to a vehicle, his flesh twisted and submerged into the frame.  Mechendrites and weapons fire upon the marine without warning, a windy scream eminating from the abomination.  It takes several battle-brothers to take out what was once a "+string(obj_ini.role[100][16])+".";

                    // This is causing the problem

                    obj_ini.race[comp,marine_num]=0;
                    obj_ini.loc[comp,marine_num]="";
                    obj_ini.name[comp,marine_num]="";
                    obj_ini.role[comp,marine_num]="";
                    obj_ini.wep1[comp,marine_num]="";
                    obj_ini.lid[comp,marine_num]=0;
                    obj_ini.wep2[comp,marine_num]="";
                    obj_ini.armour[comp,marine_num]="";
                    obj_ini.gear[comp,marine_num]="";
                    obj_ini.hp[comp,marine_num]=100;
                    obj_ini.chaos[comp,marine_num]=0;
                    obj_ini.experience[comp,marine_num]=0;
                    obj_ini.mobi[comp,marine_num]="";
                    obj_ini.age[comp,marine_num]=0;
					obj_ini.TTRPG[comp,marine_num]=new TTRPG_stats("chapter",comp,marine_num, "blank");
                    with(obj_ini){scr_company_order(0);}
                }
                scr_popup("He Built It",tixt,"tech_build","target_marine|"+string(marine_name)+"|"+string(comp)+"|"+string(marine_num)+"|");
            }
            if (event_duration[i]<=0) then event[i]="";
        }
    }
}
for(var i=1; i<=99; i++){
    if (event[i]!="") and (event_duration[i]<=0) then event[i]="";
    if (event[i]=="") and (event_duration[i]==0) and (event[i+1]!=""){
        event[i]=event[i+1];
        event_duration[i]=event_duration[i+1];
        event[i+1]="";
        event_duration[i+1]=0;
    }
}
// Right here need to sort the battles within the obj_turn_end
with(obj_turn_end){scr_battle_sort();}

for(var i=1; i<=10; i++){
    if (turns_ignored[i]>0) and (turns_ignored[i]<500) then turns_ignored[i]-=1;
}
if (known[eFACTION.Eldar]>=2) and (faction_gender[6]==2) and (floor(turn/10)==(turn/10)) then turns_ignored[6]+=floor(random_range(0,6));

with(obj_temp4){instance_destroy();}
if (instance_exists(obj_p_fleet)) then with(obj_p_fleet){scr_apothecary_ship();}
scr_random_event(true);

// ** Random events here **
if (hurssy_time>0) and (hurssy>0) then hurssy_time-=1;
if (hurssy_time==0) and (hurssy>0){hurssy_time=-1;hurssy=0;}
with(obj_p_fleet){
    if (hurssy_time>0) and (hurssy>0) then hurssy_time-=1;
    if (hurssy_time==0) and (hurssy>0){hurssy_time=-1;hurssy=0;}
}
with(obj_star){
    if (p_hurssy_time[1]>0) and (p_hurssy[1]>0) then p_hurssy_time[1]-=1;
    if (p_hurssy_time[1]==0) and (p_hurssy[1]>0){
        p_hurssy_time[1]=-1;
        p_hurssy[1]=0;
    }
    if (p_hurssy_time[2]>0) and (p_hurssy[2]>0) then p_hurssy_time[2]-=1;
    if (p_hurssy_time[2]==0) and (p_hurssy[2]>0){
        p_hurssy_time[2]=-1;
        p_hurssy[2]=0;
    }
    if (p_hurssy_time[3]>0) and (p_hurssy[3]>0) then p_hurssy_time[3]-=1;
    if (p_hurssy_time[3]=0) and (p_hurssy[3]>0){
        p_hurssy_time[3]=-1;
        p_hurssy[3]=0;
    }
    if (p_hurssy_time[4]>0) and (p_hurssy[4]>0) then p_hurssy_time[4]-=1;
    if (p_hurssy_time[4]==0) and (p_hurssy[4]>0){
        p_hurssy_time[4]=-1;
        p_hurssy[4]=0;
    }
}

if (turn==2){
    if (obj_ini.master_name=="Zakis Randi") or (global.chapter_name=="Knights Inductor") and (obj_controller.faction_status[eFACTION.Imperium]!="War") then alarm[8]=1;
}
// ** Player-set events **
if (fest_scheduled>0) and (fest_repeats>0){
    var lock="",cm_present=false;
    fest_repeats-=1;
    lock=scr_master_loc();

    if (fest_sid>0) and (obj_ini.ship[fest_sid]=lock) then cm_present=true;
    if (fest_wid>0) and (string(fest_star)+"."+string(fest_wid)=lock) then cm_present=true;

    if (cm_present==true){
        var imag="";

        if (fest_type=="Great Feast") then imag="event_feast";
        if (fest_type=="Tournament") then imag="event_tournament";
        if (fest_type=="Deathmatch") then imag="event_deathmatch";
        if (fest_type=="Imperial Mass") then imag="event_mass";
        if (fest_type=="Cult Sermon") then imag="event_ccult";
        if (fest_type=="Chapter Relic") then imag="event_ccrelic";
        if (fest_type=="Triumphal March") then imag="event_march";

        if (fest_wid>0) then scr_popup("Scheduled Event","Your "+string(fest_type)+" takes place on "+string(fest_star)+" "+scr_roman(fest_wid)+".  Would you like to spectate the event?",imag,"");
        if (fest_sid>0) then scr_popup("Scheduled Event","Your "+string(fest_type)+" takes place on the ship '"+string(obj_ini.ship[fest_sid])+".  Would you like to spectate the event?",imag,"");
    }
}

// ** Income **
if (income_controlled_planets>0){
    with(obj_turn_end){
        for(var a=89; a>=0; a--){
            if (alert[a]!=0){
                alert[a+1]=alert[a];
                alert_type[a+1]=alert_type[a];
                alert_text[a+1]=alert_text[a];
                alert_char[a+1]=alert_char[a];
                alert_text[a+1]=alert_color[a];
            }
        }
    }
    obj_turn_end.alert[1]=1;
    obj_turn_end.alert_type[1]="";
    obj_turn_end.alert_char[1]=0;
    obj_turn_end.alert_text[1]="";
    obj_turn_end.alert_color[1]="yellow";
    obj_turn_end.alerts+=1;

    if (income_controlled_planets==1) then obj_turn_end.alert_text[1]="-"+string(income_tribute)+" Requisition granted by tithes from 1 planet.";
    if (income_controlled_planets>1) then obj_turn_end.alert_text[1]="-"+string(income_tribute)+" Requisition granted by tithes from "+string(income_controlled_planets)+" planets.";

    instance_activate_object(obj_p_fleet);

    with(obj_star){
        if (x<-10000){
            x+=20000;
            y+=20000;
        }
    }
}
