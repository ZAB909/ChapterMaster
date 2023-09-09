function scr_apothecary_ship() {

	// Executed by each obj_p_fleet to heal or repair units on ships at the end of the turn

	var ship_apoth, oldhp, newhp, heals, i, v, co, heal, ship_tech, repairs, repair, maybe2;
	oldhp=0;newhp=0;heals=0;i=-1;v=0;co=0;repairs=0;

	heal=50;if (obj_ini.ossmodula=1) then heal=25;
	repair=50;
	ship_apoth=0;
	ship_tech=0;





	co=-1;
	repeat(11){// This retrieves the amount of apothecaries in each fleet, across all the chapters
	    co+=1;d=0;
	    repeat(100){d+=1;maybe=0;maybe2=0;
	        if (obj_ini.role[co,d]=obj_ini.role[100,15]) and (obj_ini.hp[co,d]>=10) and (obj_ini.lid[co,d]>0) and (obj_ini.gear[co,d]="Narthecium") then maybe=1;
	        if (obj_ini.role[co,d]="Sister Hospitaler") and (obj_ini.hp[co,d]>=40) and (obj_ini.lid[co,d]>0) then maybe=1;
        
	        if (obj_ini.role[co,d]=obj_ini.role[100,16]) and (obj_ini.hp[co,d]>=10) and (obj_ini.lid[co,d]>0) and ((obj_ini.gear[co,d]="Servo Arms") or (obj_ini.gear[co,d]="Master Servo Arms")) then maybe2=1;
	        if (obj_ini.role[co,d]="Techpriest") and (obj_ini.hp[co,d]>=10) and (obj_ini.lid[co,d]>0) then maybe2=1;
        
	        if (maybe=1){
	            var c;
	            c=0;repeat(capital_number){c+=1;if (obj_ini.lid[co,d]=capital_num[c]) then maybe=2;}
	            c=0;repeat(frigate_number){c+=1;if (obj_ini.lid[co,d]=frigate_num[c]) then maybe=2;}
	            c=0;repeat(escort_number){c+=1;if (obj_ini.lid[co,d]=escort_num[c]) then maybe=2;}
            
	            if (maybe=2) then ship_apoth+=4;
	        }
	        if (maybe2=1){
	            var c;
	            c=0;repeat(capital_number){c+=1;if (obj_ini.lid[co,d]=capital_num[c]) then maybe2=2;}
	            c=0;repeat(frigate_number){c+=1;if (obj_ini.lid[co,d]=frigate_num[c]) then maybe2=2;}
	            c=0;repeat(escort_number){c+=1;if (obj_ini.lid[co,d]=escort_num[c]) then maybe2=2;}
            
	            if (maybe2=2) then ship_tech+=2;
	        }
        
        
        
	    }
    
        
        
        
	        /*
    
	        if (obj_ini.role[co,d]=obj_ini.role[100,15]) and (obj_ini.hp[co,d]>=10) and (obj_ini.lid[co,d]=i) and (obj_ini.gear[co,d]="Narthecium") then ship_apoth[i]+=4;
	        co+=1;if (obj_ini.role[co,d]=obj_ini.role[100,15]) and (obj_ini.hp[co,d]>=10) and (obj_ini.lid[co,d]=i) and (obj_ini.gear[co,d]="Narthecium") then ship_apoth[i]+=4;
	        co+=1;if (obj_ini.role[co,d]=obj_ini.role[100,15]) and (obj_ini.hp[co,d]>=10) and (obj_ini.lid[co,d]=i) and (obj_ini.gear[co,d]="Narthecium") then ship_apoth[i]+=4;
	        co+=1;if (obj_ini.role[co,d]=obj_ini.role[100,15]) and (obj_ini.hp[co,d]>=10) and (obj_ini.lid[co,d]=i) and (obj_ini.gear[co,d]="Narthecium") then ship_apoth[i]+=4;
	        co+=1;if (obj_ini.role[co,d]=obj_ini.role[100,15]) and (obj_ini.hp[co,d]>=10) and (obj_ini.lid[co,d]=i) and (obj_ini.gear[co,d]="Narthecium") then ship_apoth[i]+=4;
	        co+=1;if (obj_ini.role[co,d]=obj_ini.role[100,15]) and (obj_ini.hp[co,d]>=10) and (obj_ini.lid[co,d]=i) and (obj_ini.gear[co,d]="Narthecium") then ship_apoth[i]+=4;
	        co+=1;if (obj_ini.role[co,d]=obj_ini.role[100,15]) and (obj_ini.hp[co,d]>=10) and (obj_ini.lid[co,d]=i) and (obj_ini.gear[co,d]="Narthecium") then ship_apoth[i]+=4;
	        co+=1;if (obj_ini.role[co,d]=obj_ini.role[100,15]) and (obj_ini.hp[co,d]>=10) and (obj_ini.lid[co,d]=i) and (obj_ini.gear[co,d]="Narthecium") then ship_apoth[i]+=4;
	        co+=1;if (obj_ini.role[co,d]=obj_ini.role[100,15]) and (obj_ini.hp[co,d]>=10) and (obj_ini.lid[co,d]=i) and (obj_ini.gear[co,d]="Narthecium") then ship_apoth[i]+=4;
	        co+=1;if (obj_ini.role[co,d]=obj_ini.role[100,15]) and (obj_ini.hp[co,d]>=10) and (obj_ini.lid[co,d]=i) and (obj_ini.gear[co,d]="Narthecium") then ship_apoth[i]+=4;
	        co+=1;if (obj_ini.role[co,d]=obj_ini.role[100,15]) and (obj_ini.hp[co,d]>=10) and (obj_ini.lid[co,d]=i) and (obj_ini.gear[co,d]="Narthecium") then ship_apoth[i]+=4;
	        co=0;*/
	    // }
	}

	// show_message("[1] "+string(obj_ini.ship[1])+": "+string(ship_apoth[1])+" apothecaries");


	var normal_hp,mixhp,ratio;
	normal_hp=true;mixhp=0;ratio=0;

	i=-1;co=-1;
	repeat(11){
	    co+=1;
	    d=0;
    
	    if (ship_apoth>0) then repeat(300){
	        d+=1;normal_hp=true;
	        maybe=0;
	        if (obj_ini.role[co,d]!="") and (obj_ini.hp[co,d]>0) and (obj_ini.lid[co,d]>0) then maybe=1;
        
	        if (maybe=1){
	            var c;
	            c=0;repeat(capital_number){c+=1;if (obj_ini.lid[co,d]=capital_num[c]) then maybe=2;}
	            c=0;repeat(frigate_number){c+=1;if (obj_ini.lid[co,d]=frigate_num[c]) then maybe=2;}
	            c=0;repeat(escort_number){c+=1;if (obj_ini.lid[co,d]=escort_num[c]) then maybe=2;}
            
	            if (obj_ini.race[co,d]=1){maybe=2;normal_hp=true;}
	            if (obj_ini.race[co,d]>1){maybe=2;normal_hp=false;}
            
	            if (maybe=2){
	                if (obj_ini.armour[co,d]!="Dreadnought") and (ship_apoth>0) and (obj_ini.hp[co,d]<=10) and (normal_hp=true){
	                    obj_ini.hp[co,d]+=heal;ship_apoth-=1;
	                }
	            }
	        }
	    }
    
	    d=0;
	    if (ship_tech>0) then repeat(300){// Initial techmarines repair shit
	        d+=1;normal_hp=true;maybe=0;
	        if (string_count("Dread",obj_ini.armour[co,d])>0) and (obj_ini.hp[co,d]>0) and (obj_ini.hp[co,d]<50) and (obj_ini.lid[co,d]>0) then maybe=1;
        
	        // show_message("maybe=1");
        
	        if (maybe=1){var c;
	            c=0;repeat(capital_number){c+=1;if (obj_ini.lid[co,d]=capital_num[c]) then maybe=2;}
	            c=0;repeat(frigate_number){c+=1;if (obj_ini.lid[co,d]=frigate_num[c]) then maybe=2;}
	            c=0;repeat(escort_number){c+=1;if (obj_ini.lid[co,d]=escort_num[c]) then maybe=2;}
            
	            if (obj_ini.race[co,d]=1) and (maybe=2){maybe=3;normal_hp=true;}
	            if (maybe=3){
	                if (ship_tech>0) and (normal_hp=true){
	                    obj_ini.hp[co,d]+=repair;ship_tech-=1;
	                }
	            }
	        }
	    }
    
    
	    d=0;
	    if (ship_apoth>0) then repeat(300){
	        d+=1;normal_hp=true;
	        maybe=0;
			var unit = obj_ini.TTRPG[co,d]
			var location =  unit.marine_location()
	        if (unit.role()!="") and (unit.hp()>0) and (location[0]==location_types.ship) then maybe=1;
        
	        if (maybe=1){
	            var c;
	            c=0;repeat(capital_number){c+=1;if (location[1]=capital_num[c]) then maybe=2;}
	            c=0;repeat(frigate_number){c+=1;if (location[1]=frigate_num[c]) then maybe=2;}
	            c=0;repeat(escort_number){c+=1;if (location[1]=escort_num[c]) then maybe=2;}
            
	            if (obj_ini.race[co,d]=1){maybe=2;normal_hp=true;}
	            if (obj_ini.race[co,d]>1){maybe=2;normal_hp=false;}
            
	            if (maybe=2){
	                        if (unit.armour()!="Dreadnought") and (ship_apoth>0) and (unit.hp()<unit.max_health) and (normal_hp=true){
	                            unit.update_health(unit.hp()+heal);ship_apoth-=1;                           
	                        }
						 if (unit.hp()>unit.max_health) then unit.update_health(unit.max_health);
	            }
	            }
	      
	    }
    
    
	    d=0;
	    if (ship_apoth>0) then repeat(300){
	        d+=1;normal_hp=true;
	        maybe=0;
	        if (obj_ini.role[co,d]!="") and (obj_ini.hp[co,d]>0) and (obj_ini.lid[co,d]>0) then maybe=1;
        
	        if (maybe=1){
	            var c;
	            c=0;repeat(capital_number){c+=1;if (obj_ini.lid[co,d]=capital_num[c]) then maybe=2;}
	            c=0;repeat(frigate_number){c+=1;if (obj_ini.lid[co,d]=frigate_num[c]) then maybe=2;}
	            c=0;repeat(escort_number){c+=1;if (obj_ini.lid[co,d]=escort_num[c]) then maybe=2;}
            
	            if (obj_ini.race[co,d]=1){maybe=2;normal_hp=true;}
	            if (obj_ini.race[co,d]>1){maybe=2;normal_hp=false;}
            
	            if (maybe=2){
	                var mixhp;mixhp=100;
	                if (obj_ini.role[co,d]="Skitarii"){normal_hp=false;mixhp=40;}
	                if (obj_ini.role[co,d]="Techpriest"){normal_hp=false;mixhp=50;}
	                if (obj_ini.role[co,d]="Crusader"){normal_hp=false;mixhp=30;}
	                if (obj_ini.role[co,d]="Ranger"){normal_hp=false;mixhp=40;}
	                if (obj_ini.role[co,d]="Sister of Battle"){normal_hp=false;mixhp=40;}
	                if (obj_ini.role[co,d]="Sister Hospitaler"){normal_hp=false;mixhp=40;}
	                if (obj_ini.role[co,d]="Ork Sniper"){normal_hp=false;mixhp=45;}
	                if (obj_ini.role[co,d]="Flash Git"){normal_hp=false;mixhp=65;}
	                if (ship_apoth>0) and (obj_ini.hp[co,d]<mixhp) and (normal_hp=false){
	                    obj_ini.hp[co,d]+=20;ship_apoth-=1;
	                    if (obj_ini.hp[co,d]>mixhp) then obj_ini.hp[co,d]=mixhp;
	                }
	            }
	        }
	    }
    
	    d=0;
	    if (ship_tech>0) then repeat(300){// Last techmarines repair shit
	        d+=1;normal_hp=true;maybe=0;
	        if (string_count("Dread",obj_ini.armour[co,d])>0) and (obj_ini.hp[co,d]>0) and (obj_ini.hp[co,d]<100) and (obj_ini.lid[co,d]>0) then maybe=1;
	        if (maybe=1){var c;
	            c=0;repeat(capital_number){c+=1;if (obj_ini.lid[co,d]=capital_num[c]) then maybe=2;}
	            c=0;repeat(frigate_number){c+=1;if (obj_ini.lid[co,d]=frigate_num[c]) then maybe=2;}
	            c=0;repeat(escort_number){c+=1;if (obj_ini.lid[co,d]=escort_num[c]) then maybe=2;}
            
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
	    if (ship_tech>0) then repeat(200){d+=1;maybe=0;
	        if (obj_ini.veh_hp[co,d]>0) and (obj_ini.veh_hp[co,d]<50) and (obj_ini.veh_lid[co,d]>0) then maybe=1;
	        if (maybe=1){var c;
	            c=0;repeat(capital_number){c+=1;if (obj_ini.veh_lid[co,d]=capital_num[c]) then maybe=2;}
	            c=0;repeat(frigate_number){c+=1;if (obj_ini.veh_lid[co,d]=frigate_num[c]) then maybe=2;}
	            c=0;repeat(escort_number){c+=1;if (obj_ini.veh_lid[co,d]=escort_num[c]) then maybe=2;}
	            if (obj_ini.veh_race[co,d]=1) and (maybe=2){
	                if (ship_tech>0){obj_ini.veh_hp[co,d]+=10;ship_tech-=1;if (obj_ini.veh_hp[co,d]>100) then obj_ini.veh_hp[co,d]=100;}
	            }
	        }
	    }
	    d=0;
	    if (ship_tech>0) then repeat(200){d+=1;maybe=0;
	        if (obj_ini.veh_hp[co,d]>0) and (obj_ini.veh_hp[co,d]<100) and (obj_ini.veh_lid[co,d]>0) then maybe=1;
	        if (maybe=1){var c;
	            c=0;repeat(capital_number){c+=1;if (obj_ini.veh_lid[co,d]=capital_num[c]) then maybe=2;}
	            c=0;repeat(frigate_number){c+=1;if (obj_ini.veh_lid[co,d]=frigate_num[c]) then maybe=2;}
	            c=0;repeat(escort_number){c+=1;if (obj_ini.veh_lid[co,d]=escort_num[c]) then maybe=2;}
	            if (obj_ini.veh_race[co,d]=1) and (maybe=2){
	                if (ship_tech>0){obj_ini.veh_hp[co,d]+=10;ship_tech-=1;if (obj_ini.veh_hp[co,d]>100) then obj_ini.veh_hp[co,d]=100;}
	            }
	        }
	    }
    

	}


}