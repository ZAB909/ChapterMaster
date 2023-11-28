function scr_apothecary_ship() {

	// Executed by each obj_p_fleet to heal or repair units on ships at the end of the turn

	var ship_apoth, oldhp, newhp, heals, i, v, co, heal, ship_tech, repairs, repair, maybe2,unit,d, maybe;
	oldhp=0;newhp=0;heals=0;i=-1;v=0;co=0;repairs=0;
	repair=50;
	ship_apoth=0;
	ship_tech=0;





	for (co = 0;co<11;co++){// This retrieves the amount of apothecaries in each fleet, across all the chapters
		d=0;
	    repeat(100){d++;maybe=0;maybe2=0;
	        if (obj_ini.role[co,d]=obj_ini.role[100][15]) and (obj_ini.hp[co,d]>=10) and (obj_ini.lid[co,d]>0) and (obj_ini.gear[co,d]="Narthecium") then maybe=1;
	        if (obj_ini.role[co,d]="Sister Hospitaler") and (obj_ini.hp[co,d]>=40) and (obj_ini.lid[co,d]>0) then maybe=1;
        
	        if (obj_ini.role[co,d]=obj_ini.role[100][16]) and (obj_ini.hp[co,d]>=10) and (obj_ini.lid[co,d]>0) and ((obj_ini.gear[co,d]="Servo Arms") or (obj_ini.gear[co,d]="Master Servo Arms")) then maybe2=1;
	        if (obj_ini.role[co,d]="Techpriest") and (obj_ini.hp[co,d]>=10) and (obj_ini.lid[co,d]>0) then maybe2=1;
        
	        if (maybe=1){
	            var c;
	            c=0;repeat(capital_number){c++;if (obj_ini.lid[co,d]=capital_num[c]) then maybe=2;}
	            c=0;repeat(frigate_number){c++;if (obj_ini.lid[co,d]=frigate_num[c]) then maybe=2;}
	            c=0;repeat(escort_number){c++;if (obj_ini.lid[co,d]=escort_num[c]) then maybe=2;}
            
	            if (maybe=2) then ship_apoth+=20;
	        }
	        if (maybe2=1){
	            var c;
	            c=0;repeat(capital_number){c++;if (obj_ini.lid[co,d]=capital_num[c]) then maybe2=2;}
	            c=0;repeat(frigate_number){c++;if (obj_ini.lid[co,d]=frigate_num[c]) then maybe2=2;}
	            c=0;repeat(escort_number){c++;if (obj_ini.lid[co,d]=escort_num[c]) then maybe2=2;}
            
	            if (maybe2=2) then ship_tech+=2;
	        }
        
        
        
	    }
    
	}


	var normal_hp,mixhp,ratio;
	normal_hp=true;mixhp=0;ratio=0;

	i=-1;co=-1;var company_size;
	repeat(11){
	    co++;
		company_size = array_length(obj_ini.name[co]);

	    d=0;
	    if (ship_tech>0) then repeat(300){// Initial techmarines repair shit
	        d++;normal_hp=true;maybe=0;
	        if (string_count("Dread",obj_ini.armour[co,d])>0) and (obj_ini.hp[co,d]>0) and (obj_ini.hp[co,d]<50) and (obj_ini.lid[co,d]>0) then maybe=1;
        
	        // show_message("maybe=1");
        
	        if (maybe=1){var c;
	            c=0;repeat(capital_number){c++;if (obj_ini.lid[co,d]=capital_num[c]) then maybe=2;}
	            c=0;repeat(frigate_number){c++;if (obj_ini.lid[co,d]=frigate_num[c]) then maybe=2;}
	            c=0;repeat(escort_number){c++;if (obj_ini.lid[co,d]=escort_num[c]) then maybe=2;}
            
	            if (obj_ini.race[co,d]=1) and (maybe=2){maybe=3;normal_hp=true;}
	            if (maybe=3){
	                if (ship_tech>0) and (normal_hp=true){
	                    obj_ini.hp[co,d]+=repair;ship_tech-=1;
	                }
	            }
	        }
	    }
    
    
	    d=0;
		var max_health, location;
	    while (ship_apoth>0) and (d < company_size-1){
	        d++;
	        maybe=0;
			unit = obj_ini.TTRPG[co,d];
			if (unit.name()==""){continue;}
			location =  unit.marine_location();
	        if (unit.hp()<0) or (location[0]!=location_types.ship) then continue;
			max_health = unit.max_health();
	        var c;
            c=0;repeat(capital_number){c++;if (location[1]=capital_num[c]) then maybe=2;}
            c=0;repeat(frigate_number){c++;if (location[1]=frigate_num[c]) then maybe=2;}
            c=0;repeat(escort_number){c++;if (location[1]=escort_num[c]) then maybe=2;}
        
            if (maybe=2){
                if (unit.armour()!="Dreadnought") and (ship_apoth>0) and (unit.hp()<unit.max_health()) and (normal_hp=true){
					if (unit.base_group == "astartes"){
						if (obj_ini.ossmodula=1){
							unit.update_health(unit.hp()+(max_health/8))
						}else{
							unit.update_health(unit.hp()+(max_health/4))
						}
					} else {
						unit.update_health(unit.hp()+(max_health/10))
					}
					ship_apoth--;                           
                }
			 	if (unit.hp()>max_health) then unit.update_health(max_health);
            }
	      
	    }
    
	    d=0;
	    if (ship_tech>0) then repeat(300){// Last techmarines repair shit
	        d++;normal_hp=true;maybe=0;
	        if (string_count("Dread",obj_ini.armour[co,d])>0) and (obj_ini.hp[co,d]>0) and (obj_ini.hp[co,d]<100) and (obj_ini.lid[co,d]>0) then maybe=1;
	        if (maybe=1){var c;
	            c=0;repeat(capital_number){c++;if (obj_ini.lid[co,d]=capital_num[c]) then maybe=2;}
	            c=0;repeat(frigate_number){c++;if (obj_ini.lid[co,d]=frigate_num[c]) then maybe=2;}
	            c=0;repeat(escort_number){c++;if (obj_ini.lid[co,d]=escort_num[c]) then maybe=2;}
            
	            if (obj_ini.race[co,d]=1) and (maybe=2){maybe=3;normal_hp=true;}
	            if (maybe=3){
	                if (ship_tech>0) and (normal_hp=true){
	                    obj_ini.hp[co,d]+=repair;ship_tech-=1;
	                    if (obj_ini.hp[co,d]>100) then obj_ini.hp[co,d]=100;
	                }
	            }
	        }
	    }
    
	    d=0;
	    if (ship_tech>0) then repeat(200){d++;maybe=0;
	        if (obj_ini.veh_hp[co,d]>0) and (obj_ini.veh_hp[co,d]<50) and (obj_ini.veh_lid[co,d]>0) then maybe=1;
	        if (maybe=1){var c;
	            c=0;repeat(capital_number){c++;if (obj_ini.veh_lid[co,d]=capital_num[c]) then maybe=2;}
	            c=0;repeat(frigate_number){c++;if (obj_ini.veh_lid[co,d]=frigate_num[c]) then maybe=2;}
	            c=0;repeat(escort_number){c++;if (obj_ini.veh_lid[co,d]=escort_num[c]) then maybe=2;}
	            if (obj_ini.veh_race[co,d]=1) and (maybe=2){
	                if (ship_tech>0){obj_ini.veh_hp[co,d]+=10;ship_tech-=1;if (obj_ini.veh_hp[co,d]>100) then obj_ini.veh_hp[co,d]=100;}
	            }
	        }
	    }
	    d=0;
	    if (ship_tech>0) then repeat(200){d++;maybe=0;
	        if (obj_ini.veh_hp[co,d]>0) and (obj_ini.veh_hp[co,d]<100) and (obj_ini.veh_lid[co,d]>0) then maybe=1;
	        if (maybe=1){var c;
	            c=0;repeat(capital_number){c++;if (obj_ini.veh_lid[co,d]=capital_num[c]) then maybe=2;}
	            c=0;repeat(frigate_number){c++;if (obj_ini.veh_lid[co,d]=frigate_num[c]) then maybe=2;}
	            c=0;repeat(escort_number){c++;if (obj_ini.veh_lid[co,d]=escort_num[c]) then maybe=2;}
	            if (obj_ini.veh_race[co,d]=1) and (maybe=2){
	                if (ship_tech>0){obj_ini.veh_hp[co,d]+=10;ship_tech-=1;if (obj_ini.veh_hp[co,d]>100) then obj_ini.veh_hp[co,d]=100;}
	            }
	        }
	    }
    

	}


}