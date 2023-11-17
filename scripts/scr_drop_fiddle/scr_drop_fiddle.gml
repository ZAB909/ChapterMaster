function scr_drop_fiddle(argument0, argument1, argument2, argument3) {

	// argument0: ship IDE     argument1: loading?      argument2: ship array number        argument3: vehicles?
	// This script is executed to determine who is eligable to DEEP STRAHK or purge

	var i, comp, idy, good, vgood, assassinate, vehy, para;
	i=0;comp=0;idy=0;good=1;vgood=1;assassinate=false;vehy=argument3;para=true;

	if (instance_exists(obj_drop_select)){
	    if (obj_drop_select.purge=5) then assassinate=true;
	}


	if (attacking=0) then vgood=0;

	if (argument0>0) and (argument1=true){// Adding marines to the drop roster
	    ship_all[argument2]=1;
    
	    repeat(3500){
	        if (good=1){para=true;
	            i+=1;if (i>300){i=1;comp+=1;}
	            if (comp>10) then good=0;
	        }
	        if (good=1) and (vgood=1) and (i<=100) and (vehy=1) and (obj_ini.veh_lid[comp][i]=argument0){
	            veh_fighting[comp][i]=1;
	            if (obj_ini.veh_role[comp][i]="Land Speeder") then speeders+=1;
	            if (obj_ini.veh_role[comp][i]="Rhino") then rhinos+=1;
	            if (obj_ini.veh_role[comp][i]="Whirlwind") then whirls+=1;
	            if (obj_ini.veh_role[comp][i]="Predator") then predators+=1;
	            if (obj_ini.veh_role[comp][i]="Land Raider") then raiders+=1;
	        }
	        if (good=1){
	            if (obj_ini.race[comp][i]!=0) and (obj_ini.lid[comp][i]=argument0) /*and (string_count("Aspirant",obj_ini.role[comp][i])=0)*/ and (obj_ini.god[comp][i]<10) and ((string_count("Bike",obj_ini.mobi[comp][i])=0) or (vehy=1)) and (para=true){// Man
	                ship_use[argument2]+=1;fighting[comp][i]=1;
                
	                if (obj_ini.role[comp][i]="Chapter Master"){master=1;ship_use[argument2]+=1;}
	                if (obj_ini.role[comp][i]=obj_ini.role[100][2]) then honor+=1;
	                if (obj_ini.role[comp][i]="Company Champion") then champions+=1;
                
	                if (obj_ini.role[comp][i]=obj_ini.role[100][5]) then capts+=1;
	                if (obj_ini.role[comp][i]="Master of Sanctity") then chaplains+=1;
	                if (obj_ini.role[comp][i]=obj_ini.role[100][14]) and (global.chapter_name!="Space Wolves") then chaplains+=1;
                
	                if (obj_ini.role[comp][i]="Chief "+string(obj_ini.role[100,17])) then psykers+=1;
	                if (obj_ini.role[comp][i]=obj_ini.role[100,17]) then psykers+=1;
	                if (obj_ini.role[comp][i]="Codiciery") then psykers+=1;
	                if (obj_ini.role[comp][i]="Lexicanum") then psykers+=1;
                
	                if (obj_ini.role[comp][i]="Master of the Apothecarion") then apothecaries+=1;
	                if (obj_ini.role[comp][i]=obj_ini.role[100][15]) then apothecaries+=1;
                
	                if (obj_ini.role[comp][i]="Forge Master") then techmarines+=1;
	                if (obj_ini.role[comp][i]=obj_ini.role[100][16]) then techmarines+=1;
                
	                if (obj_ini.role[comp][i]="Death Company") and (string_count("Dreadnought",obj_ini.armour[comp][i])=0) then mahreens+=1;
	                if (obj_ini.role[comp][i]=obj_ini.role[100][4]) then terminators+=1;
	                if ((obj_ini.role[comp][i]=obj_ini.role[100][6]) or (obj_ini.role[comp][i]="Venerable "+string(obj_ini.role[100][6])) or (string_count("Dreadnought",obj_ini.armour[comp][i])=1)) and (assassinate=false) then dreads+=1;
                
	                if (string_count("Bike",obj_ini.mobi[comp][i])=0){
	                    if (obj_ini.role[comp][i]="Standard Bearer") then mahreens+=1;
	                    if (obj_ini.role[comp][i]=obj_ini.role[100][12]) then mahreens+=1;
	                    if (obj_ini.role[comp][i]=obj_ini.role[100][8]) or (obj_ini.role[comp][i]=obj_ini.role[100][10]) or (obj_ini.role[comp][i]=obj_ini.role[100][9]) then mahreens+=1;
	                    if (obj_ini.role[comp][i]=obj_ini.role[100][3]) then veterans+=1;
	                }
	                if (string_count("Bike",obj_ini.mobi[comp][i])>0) and (vehy=1){
	                    if (obj_ini.role[comp][i]="Standard Bearer") then bikes+=1;
	                    if (obj_ini.role[comp][i]=obj_ini.role[100][12]) then bikes+=1;
	                    if (obj_ini.role[comp][i]=obj_ini.role[100][8]) or (obj_ini.role[comp][i]=obj_ini.role[100][10]) or (obj_ini.role[comp][i]=obj_ini.role[100][9]) then bikes+=1;
	                    if (obj_ini.role[comp][i]=obj_ini.role[100][3]) then bikes+=1;
	                }
	            }
	        }
    
	    }
	}

	if (argument0>0) and (argument1=false){// Removing marines from the drop roster
	    ship_all[argument2]=0;

	    repeat(3500){
	        if (good=1){
	            i+=1;if (i>300){i=1;comp+=1;}
	            if (comp>10) then good=0;
	        }
	        if (good=1) and (i<=100) and (vehy=1) and (obj_ini.veh_lid[comp][i]=argument0){
	            veh_fighting[comp][i]=0;
	            if (obj_ini.veh_role[comp][i]="Land Speeder") then speeders-=1;
	            if (obj_ini.veh_role[comp][i]="Rhino") then rhinos-=1;
	            if (obj_ini.veh_role[comp][i]="Whirlwind") then whirls-=1;
	            if (obj_ini.veh_role[comp][i]="Predator") then predators-=1;
	            if (obj_ini.veh_role[comp][i]="Land Raider") then raiders-=1;
	        }
	        if (good=1){
	            if (obj_ini.race[comp][i]!=0) and (obj_ini.lid[comp][i]=argument0) and (string_count("Aspirant",obj_ini.role[comp][i])=0) and (obj_ini.god[comp][i]<10) and ((string_count("Bike",obj_ini.mobi[comp][i])=0) or (vehy=1)){// Man
	                ship_use[argument2]-=1;fighting[comp][i]=0;
                            
	                if (obj_ini.role[comp][i]="Chapter Master"){master=0;ship_use[argument2]-=1;}
	                if (obj_ini.role[comp][i]=obj_ini.role[100][2]) then honor-=1;
	                if (obj_ini.role[comp][i]="Company Champion") then champions-=1;
                
	                if (obj_ini.role[comp][i]=obj_ini.role[100][5]) then capts-=1;
	                if (obj_ini.role[comp][i]="Master of Sanctity") then chaplains-=1;
	                if (obj_ini.role[comp][i]=obj_ini.role[100][14]) and (global.chapter_name!="Space Wolves") then chaplains-=1;
                
	                if (obj_ini.role[comp][i]="Chief "+string(obj_ini.role[100,17])) then psykers-=1;
	                if (obj_ini.role[comp][i]=obj_ini.role[100,17]) then psykers-=1;
	                if (obj_ini.role[comp][i]="Codiciery") then psykers-=1;
	                if (obj_ini.role[comp][i]="Lexicanum") then psykers-=1;
                
	                if (obj_ini.role[comp][i]="Master of the Apothecarion") then apothecaries-=1;
	                if (obj_ini.role[comp][i]=obj_ini.role[100][15]) then apothecaries-=1;
                
	                if (obj_ini.role[comp][i]="Forge Master") then techmarines-=1;
	                if (obj_ini.role[comp][i]=obj_ini.role[100][16]) then techmarines-=1;
                
	                if (obj_ini.role[comp][i]="Death Company") and (string_count("Dreadnought",obj_ini.armour[comp][i])=0) then mahreens-=1;
	                if (obj_ini.role[comp][i]=obj_ini.role[100][4]) then terminators-=1;
	                if ((obj_ini.role[comp][i]=obj_ini.role[100][6]) or (obj_ini.role[comp][i]="Venerable "+string(obj_ini.role[100][6])) or (string_count("Dreadnought",obj_ini.armour[comp][i])=1)) and (assassinate=false) then dreads-=1;
                
	                if (string_count("Bike",obj_ini.mobi[comp][i])=0){
	                    if (obj_ini.role[comp][i]="Standard Bearer") then mahreens-=1;
	                    if (obj_ini.role[comp][i]=obj_ini.role[100][12]) then mahreens-=1;
	                    if (obj_ini.role[comp][i]=obj_ini.role[100][8]) or (obj_ini.role[comp][i]=obj_ini.role[100][10]) or (obj_ini.role[comp][i]=obj_ini.role[100][9]) then mahreens-=1;
	                    if (obj_ini.role[comp][i]=obj_ini.role[100][3]) then veterans-=1;
	                }
	                if (string_count("Bike",obj_ini.mobi[comp][i])>0) and (vehy=1){
	                    if (obj_ini.role[comp][i]="Standard Bearer") then bikes-=1;
	                    if (obj_ini.role[comp][i]=obj_ini.role[100][12]) then bikes-=1;
	                    if (obj_ini.role[comp][i]=obj_ini.role[100][8]) or (obj_ini.role[comp][i]=obj_ini.role[100][10]) or (obj_ini.role[comp][i]=obj_ini.role[100][9]) then bikes-=1;
	                    if (obj_ini.role[comp][i]=obj_ini.role[100][3]) then bikes-=1;
	                }
	            }
	        }
    
	    }
	}


	// var p;p=0;repeat(50){p+=1;if (ship_all[p]=1) then via[ship_ide[p]]=1;if (ship_all[p]=0) then via[ship_ide[p]]=0;}
	// var p;p=0;repeat(50){p+=1;if (ship_all[p]=1) then via[ship_ide[p]]=1;if (ship_all[p]=0) then via[ship_ide[p]]=0;}
	// var p,p2;
	// p=0;p2=0;

	/*repeat(50){if (p2=0){p+=1;if (ship_ide[p]=argument0) then p2=p;}}
	if (p2>0){if (ship_all[p2]=1) then via[p2]=1;if (ship_all[p2]=0) then via[p2]=0;}*/

	if (ship_all[argument2]=0) then via[argument0]=0;
	if (ship_all[argument2]=1) then via[argument0]=1;


}
