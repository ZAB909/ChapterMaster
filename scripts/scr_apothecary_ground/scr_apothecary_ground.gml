function scr_apothecary_ground() {

	// Executed by each obj_star, for each planet, to heal or repair units at the end of the turn
	// Note that this should not be ran unless the star's p_player[x] is >0 to save on processing

	var run=0,apoth=0,company=0,v=0,tick=0,repair=0,engineers=[],unit;
	repair=50;

	repeat(planets){
		on_planet = [];
		planet_vehicles=[];
	    run+=1;
        
	    if (p_player[run]>0){
        

	        for(company=0;company<11;company++){
	           for (v=0;v<500;v++){
	           		if (obj_ini.name[company][v]==""){
	           			if (obj_ini.name[company][v+1]==""){
	           				break;
	           			}else{
	           				continue;
	           			}
	           		}
	           		unit = obj_ini.TTRPG[company][v];
	           		if (unit.is_at_location(name,run,0)){
	           			array_push(on_planet, unit);
		           		if (((unit.IsSpecialist("apoth",true) && unit.gear()=="Narthecium") || (unit.role()=="Sister Hospitaler")) && unit.hp()>=10){
		           			apoth+=((unit.technology/2)+(unit.wisdom/2)+unit.intelligence)/8;//general display of how talented healer the apoth is
		           		}
	                
		                else if (unit.role()==obj_ini.role[100,16]) and (obj_ini.hp[company][v]>=10) and (obj_ini.loc[company][v]=name) and ((obj_ini.gear[company][v]="Servo Arms") or (obj_ini.gear[company][v]="Master Servo Arms")){
		                	tick+=2;
		                	array_push(engineers,unit)
		                }else if (unit.role()=="Techpriest") and (obj_ini.hp[company][v]>=10) and (obj_ini.loc[company][v]=name){
		                	tick+=2;
		                	array_push(engineers,unit)
		                }
		            }


		            if (v<array_length(obj_ini.veh_race[company])){
		            	if (obj_ini.veh_loc[company][v]==name && obj_ini.veh_wid[company][v]==run){
		            		array_push(planet_vehicles, [company, v]);
		            	}
		            }
	            }
	        }
        
	        if (array_length(p_feature[run])!=0){
	        	var engineer_count=array_length(engineers);
				if(planet_feature_bool(p_feature[run],P_features.Starship)==1) and (engineer_count>0){

	                var starship = p_feature[run][search_planet_features(p_feature[run],P_features.Starship)[0]];
	                var engineer_score_start = starship.engineer_score;
                	if (starship.engineer_score<2000){
	                	for (v=0;v<engineer_count;v++){
	                		starship.engineer_score += (engineers[v].technology/2);
	                	}
	                	scr_alert("green","owner",$"Ancient ship repairs {min((starship.engineer_score/2000)*100, 100)}% complete",x,y);
                	}
            
	                var maxr=0,requisition_spend=0,target_spend=10000;

	                maxr=floor(obj_controller.requisition/50);
	                requisition_spend=min(maxr*50,array_length(engineers)*50,target_spend-starship.funds_spent);
	                obj_controller.requisition-=requisition_spend;
	                starship.funds_spent+=requisition_spend;
                
	                if (requisition_spend>0) and (starship.funds_spent<target_spend){
	                    scr_alert("green","owner",$"{requisition_spend} Requision spent on Ancient Ship repairs in materials and outfitting (outfitting {(starship.funds_spent/target_spend)*100}%)",x,y);
	                }
	                if (starship.funds_spent>=target_spend) and(starship.engineer_score>=2000){// u2=tar;
	                    p_feature[run]="";
	                    delete_features(p_feature[run],P_features.Starship);
                    
	                    var locy="";
	                    if (run=1) then locy=string(name)+" I";if (run=2) then locy=string(name)+" II";
	                    if (run=3) then locy=string(name)+" III";if (run=4) then locy=string(name)+" IV";
                    
	                    var flit;flit=instance_create(x+24,y-24,obj_p_fleet);
	                    var i=0,ship_names="",new_name="",last_ship=0;
	                    for(i=0;i<=40;i++){
	                        if (last_ship=0) and (obj_ini.ship[i]="") then last_ship=i;
	                    };
                    
	                    new_name="Slaughtersong";
                    
	                    obj_ini.ship[last_ship]=new_name;
	                    obj_ini.ship_uid[last_ship]=floor(random(99999999))+1;
	                    obj_ini.ship_owner[last_ship]=1;
	                    obj_ini.ship_size[last_ship]=3;
	                    obj_ini.ship_location[last_ship]=name;
	                    obj_ini.ship_leadership[last_ship]=100;
                    
	                    obj_ini.ship_class[last_ship]="Slaughtersong";
                    
	                    obj_ini.ship_hp[last_ship]=2400;obj_ini.ship_maxhp[last_ship]=2400;
	                    obj_ini.ship_conditions[last_ship]="";obj_ini.ship_speed[last_ship]=25;
	                    obj_ini.ship_turning[last_ship]=60;
	                    obj_ini.ship_front_armour[last_ship]=8;obj_ini.ship_other_armour[last_ship]=8;
	                    obj_ini.ship_weapons[last_ship]=4;obj_ini.ship_shields[last_ship]=24;
	                    obj_ini.ship_wep[last_ship,1]="Lance Battery";ship_wep_facing[last_ship,1]="most";
	                    obj_ini.ship_wep_condition[last_ship,1]="";
	                    obj_ini.ship_wep[last_ship,2]="Lance Battery";ship_wep_facing[last_ship,2]="most";
	                    obj_ini.ship_wep_condition[last_ship,2]="";
	                    obj_ini.ship_wep[last_ship,3]="Lance Battery";ship_wep_facing[last_ship,3]="most";
	                    obj_ini.ship_wep_condition[last_ship,3]="";
	                    obj_ini.ship_wep[last_ship,4]="Plasma Cannon";ship_wep_facing[last_ship,4]="front";
	                    obj_ini.ship_wep_condition[last_ship,4]="";
	                    obj_ini.ship_capacity[last_ship]=800;obj_ini.ship_carrying[last_ship]=0;obj_ini.ship_contents[last_ship]="";
	                    obj_ini.ship_turrets[last_ship]=8;
                    
	                    flit.capital[1]=obj_ini.ship[last_ship];
	                    flit.capital_number=1;
	                    flit.capital_num[1]=last_ship;
	                    flit.capital_uid[1]=obj_ini.ship_uid[last_ship];
                    
	                    scr_popup("Ancient Ship Restored","The ancient ship within the ruins of "+string(locy)+" has been fully repaired.  It determined to be a Slaughtersong vessel and is bristling with golden age weaponry and armour.  Your "+string(obj_ini.role[100][16])+"s are excited; the Slaughtersong is ready for it's maiden voyage, at your command.","","");                
	                }
	            }
	        }
	        if (array_length(on_planet)>0){
	        	for (var i=0;i<array_length(on_planet);i++){
	        		unit = on_planet[i];
	        		if (unit.armour() != "Dreadnought")and (unit.hp()<unit.max_health()){
	        			if (apoth >0){
	        				unit.healing(true);
	        				apoth--;
	        			} else {
	        				unit.healing(false);
	        			}
	        		}else if (unit.armour() == "Dreadnought" && unit.hp()<unit.max_health() && tick >0){
	        			unit.healing(true);
	        			tick--;
	        		}
	        	}
	        } else if (array_length(planet_vehicles)==0){
	        	p_player[run]=0;
	        }
	        if (array_length(planet_vehicles)>0){
	        	for (var i=0;i<array_length(planet_vehicles);i++){
	        		veh_ident =planet_vehicles[i];
		        	if (tick>0){
						if (obj_ini.veh_hp[veh_ident[0]][veh_ident[1]]>0) and (obj_ini.veh_hp[veh_ident[0]][veh_ident[1]]<100){
							obj_ini.veh_hp[veh_ident[0]][veh_ident[1]]+=10;
							tick--;
							if (obj_ini.veh_hp[veh_ident[0]][veh_ident[1]]>100)then obj_ini.veh_hp[veh_ident[0]][veh_ident[1]]=100;
						}
		        	}
		        	if (tick==0) then break;
		        }
	        }


	    }
    
	}


}
