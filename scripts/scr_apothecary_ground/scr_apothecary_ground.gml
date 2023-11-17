function scr_apothecary_ground() {

	// Executed by each obj_star, for each planet, to heal or repair units at the end of the turn
	// Note that this should not be ran unless the star's p_player[x] is >0 to save on processing

	var run=0,apoth=0,company=0,v=0,tick=0,repair=0,engineers=[],unit;

	heal=50;
	if (obj_ini.ossmodula=1) then heal=25;
	repair=50;

	repeat(planets){
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
	                if (unit.role()==obj_ini.role[100,15]) and (obj_ini.hp[company][v]>=10) and (obj_ini.loc[company][v]=name) and (obj_ini.wid[company][v]=run) and (obj_ini.gear[company][v]="Narthecium"){apoth+=4;}
	                else if (unit.role()=="Sister Hospitaler") and (obj_ini.hp[company][v]>=40) and (obj_ini.loc[company][v]=name) and (obj_ini.wid[company][v]=run){apoth+=4;}
                
	                else if (unit.role()==obj_ini.role[100,16]) and (obj_ini.hp[company][v]>=10) and (obj_ini.loc[company][v]=name) and ((obj_ini.gear[company][v]="Servo Arms") or (obj_ini.gear[company][v]="Master Servo Arms")){
	                	tick+=2;
	                	array_push(engineers,unit)
	                }else if (unit.role()=="Techpriest") and (obj_ini.hp[company][v]>=10) and (obj_ini.loc[company][v]=name){
	                	tick+=2;
	                	array_push(engineers,unit)
	                }
	            }
	        }
        
	        if (array_length(p_feature[run])!=0){
	        	var engineer_count=array_length(engineers);
				if(planet_feature_bool(p_feature[run],P_features.Starship)==1) and (engineer_count>0){

	                var starship = p_feature[run][search_planet_features(p_feature[run],P_features.Starship)[0]];
                	if (starship.engineer_score<2000){
	                	for (v=0;v<engineer_count;v++){
	                		starship.engineer_score += engineers[v].technology;
	                		scr_alert("green","owner",$"Ancient ship repairs {min((starship.engineer_score/2000)*100, 100)}% complete",x,y);
	                	}
                	}
            
	                var maxr=0,requisition_spend=0,target_spend=10000;

	                maxr=floor(obj_controller.requisition/50);
	                requisition_spend=min(maxr*50,engineers*50,target_spend-starship.funds_spent);
	                obj_controller.requisition-=requisition_spend;
	                starship.funds_spent+=requisition_spend;
                
	                if (requisition_spend>0) and (starship.funds_spent<target_spend){
	                    scr_alert("green","owner",string(requisition_spend)+" Requision spent on Ancient Ship repairs in materials and outfitting",x,y);
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
                    
	                    flit.capital[1]=obj_ini.ship[last_ship];flit.capital_number=1;flit.capital_num[1]=last_ship;flit.capital_uid[1]=obj_ini.ship_uid[last_ship];
                    
	                    scr_popup("Ancient Ship Restored","The ancient ship within the ruins of "+string(locy)+" has been fully repaired.  It determined to be a Slaughtersong vessel and is bristling with golden age weaponry and armour.  Your "+string(obj_ini.role[100][16])+"s are excited; the Slaughtersong is ready for it's maiden voyage, at your command.","","");                
	                }
	            }
	        }
    
	        var normal_hp,mixhp,ratio;
	        normal_hp=true;mixhp=0;ratio=0;
    
        
	        if (apoth>0){    
	            repeat(11){
	                if (company+1<=10){
	                    company+=1;
	                    v=0;
	                    repeat(300){
	                        v+=1;normal_hp=true;

	                        if (obj_ini.race[company][v]>1) then normal_hp=false;
	                        if (obj_ini.wid[company][v]=run) and (obj_ini.loc[company][v]=name) and (obj_ini.armour[company][v]!="Dreadnought") and (apoth>0) and (obj_ini.hp[company][v]<=10) and (normal_hp=true){
	                            obj_ini.hp[company][v]+=heal;apoth-=1;
	                        }
	                    }
	                }
	            }
	            company=-1;
            
	            repeat(11){
	                if (company+1<=10){
	                    company+=1;
	                    v=0;
	                    repeat(300){
	                        v+=1;normal_hp=true;

	                        if (obj_ini.race[company][v]>1) then normal_hp=false;
	                        if (obj_ini.wid[company][v]=run) and (obj_ini.loc[company][v]=name) and (obj_ini.armour[company][v]!="Dreadnought") and (apoth>0) and (obj_ini.hp[company][v]<=30) and (normal_hp=true){
	                            obj_ini.hp[company][v]+=heal;apoth-=1;

	                        }
	                    }
	                }
	            }
	            company=-1;
            
	            repeat(11){
	                if (company+1<=10){
	                    company+=1;
	                    v=0;
	                    repeat(300){
	                        v+=1;normal_hp=true;

	                        if (obj_ini.race[company][v]>1) then normal_hp=false;
                        
                        
	                        if (obj_ini.role[company][v]!="Chapter Master"){
	                            if (obj_ini.wid[company][v]=run) and (obj_ini.loc[company][v]=name) and (obj_ini.armour[company][v]!="Dreadnought") and (apoth>0) and (obj_ini.hp[company][v]<100) and (normal_hp=true){
	                                obj_ini.hp[company][v]+=heal;apoth-=1;
	                                if (obj_ini.hp[company][v]>100) then obj_ini.hp[company][v]=100;
	                            }
	                        }
                        
                        
	                        if (obj_ini.role[company][v]="Chapter Master"){
	                            if (string_count("Paragon",string(obj_ini.adv[1])+string(obj_ini.adv[2])+string(obj_ini.adv[3])+string(obj_ini.adv[4]))>0){
	                                if (obj_ini.wid[company][v]=run) and (obj_ini.loc[company][v]=name) and (obj_ini.armour[company][v]!="Dreadnought") and (apoth>0) and (obj_ini.hp[company][v]<130) and (normal_hp=true){
	                                    obj_ini.hp[company][v]+=heal;apoth-=1;
	                                    if (obj_ini.hp[company][v]>130) then obj_ini.hp[company][v]=130;
	                                }
	                            }
	                            if (string_count("Paragon",string(obj_ini.adv[1])+string(obj_ini.adv[2])+string(obj_ini.adv[3])+string(obj_ini.adv[4]))=0){
	                                if (obj_ini.wid[company][v]=run) and (obj_ini.loc[company][v]=name) and (obj_ini.armour[company][v]!="Dreadnought") and (apoth>0) and (obj_ini.hp[company][v]<100) and (normal_hp=true){
	                                    obj_ini.hp[company][v]+=heal;apoth-=1;
	                                    if (obj_ini.hp[company][v]>100) then obj_ini.hp[company][v]=100;
	                                }
	                            }
	                        }
                        
                        
                        
	                    }
	                }
	            }
	            company=-1;
            
            
            
            
            
	        }
        
	        if (apoth>0){
	            company=0;v=0;
	            repeat(300){
	                v+=1;normal_hp=true;

	                if (obj_ini.race[company][v]>1) then normal_hp=false;
	                if (obj_ini.role[company][v]="Skitarii"){normal_hp=false;mixhp=40;}
	                if (obj_ini.role[company][v]="Techpriest"){normal_hp=false;mixhp=50;}
	                if (obj_ini.role[company][v]="Crusader"){normal_hp=false;mixhp=30;}
	                if (obj_ini.role[company][v]="Ranger"){normal_hp=false;mixhp=40;}
	                if (obj_ini.role[company][v]="Sister of Battle"){normal_hp=false;mixhp=40;}
	                if (obj_ini.role[company][v]="Sister Hospitaler"){normal_hp=false;mixhp=40;}
	                if (obj_ini.role[company][v]="Ork Sniper"){normal_hp=false;mixhp=45;}
	                if (obj_ini.role[company][v]="Flash Git"){normal_hp=false;mixhp=65;}
                
	                if (obj_ini.wid[company][v]=run) and (obj_ini.loc[company][v]=name) and (apoth>0) and (obj_ini.hp[company][v]<mixhp) and (normal_hp=false){
	                    obj_ini.hp[company][v]+=20;apoth-=1;
	                    if (obj_ini.hp[company][v]>mixhp) then obj_ini.hp[company][v]=mixhp;
	                }
	            }
	        }
        
        
        
	        company=-1;
	        if (tick>0){
	            repeat(11){
	                if (company+1<=10){
	                    company+=1;
	                    v=0;
	                    repeat(300){
	                        v+=1;

	                        if (obj_ini.race[company][v]=1) and (obj_ini.wid[company][v]=run) and (obj_ini.loc[company][v]=name) and (string_count("Dread",obj_ini.armour[company][v])>0) and (tick>0) and (obj_ini.hp[company][v]<100){
	                            obj_ini.hp[company][v]+=repair;tick-=1;
	                            if (obj_ini.hp[company][v]>100) then obj_ini.hp[company][v]=100;

	                        }
	                    }
	                }
	            }
	            company=-1;
            
	            repeat(11){
	                if (company+1<=10){
	                    company+=1;
	                    v=0;
	                    repeat(300){
	                        v+=1;

	                        if (obj_ini.race[company][v]=1) and (obj_ini.wid[company][v]=run) and (obj_ini.loc[company][v]=name) and (string_count("Dread",obj_ini.armour[company][v])>0) and (tick>0) and (obj_ini.hp[company][v]<100){
	                            obj_ini.hp[company][v]+=repair;tick-=1;
	                            if (obj_ini.hp[company][v]>100) then obj_ini.hp[company][v]=100;

	                        }
	                    }
	                }
	            }
	            company=-1;
	        }
        
        
        
        
	        company=-1;
	        if (tick>0){
	            repeat(11){
	                if (company+1<=10){
	                    company+=1;
	                    v=0;
	                    repeat(200){
	                        v+=1;
                        

	                        if (obj_ini.veh_race[company][v]=1) and (obj_ini.veh_wid[company][v]=run) and (obj_ini.veh_loc[company][v]=name) and (tick>0) and (obj_ini.veh_hp[company][v]<50){
	                            obj_ini.veh_hp[company][v]+=10;tick-=1;
	                            if (obj_ini.veh_hp[company][v]>100) then obj_ini.veh_hp[company][v]=100;

	                        }
	                    }
	                }
	            }
	            company=-1;
            
	            repeat(11){
	                if (company+1<=10){
	                    company+=1;
	                    v=0;
	                    repeat(200){
	                        v+=1;

	                        if (obj_ini.veh_race[company][v]=1) and (obj_ini.veh_wid[company][v]=run) and (obj_ini.veh_loc[company][v]=name) and (tick>0) and (obj_ini.veh_hp[company][v]<100){
	                            obj_ini.veh_hp[company][v]+=10;tick-=1;
	                            if (obj_ini.veh_hp[company][v]>100) then obj_ini.veh_hp[company][v]=100;

	                        }
	                    }
	                }
	            }
	            company=-1;
            
	            repeat(11){
	                if (company+1<=10){
	                    company+=1;
	                    v=0;
	                    repeat(200){
	                        v+=1;

	                        if (obj_ini.veh_race[company][v]=1) and (obj_ini.veh_wid[company][v]=run) and (obj_ini.veh_loc[company][v]=name) and (tick>0) and (obj_ini.veh_hp[company][v]<100){
	                            obj_ini.veh_hp[company][v]+=10;tick-=1;
	                            if (obj_ini.veh_hp[company][v]>100) then obj_ini.veh_hp[company][v]=100;

	                        }
	                    }
	                }
	            }
	            company=-1;
            
	        }
        
        
        
        
        
        
	    }
    
	}


}
