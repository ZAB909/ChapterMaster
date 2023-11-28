function scr_company_view(company) {
	var v, mans, bad, squads, squad_type, squad_loc, squad_members, unit, unit_loc, last_man, last_vehicle;
	v=0;
	mans=0;
	bad=0;
	squads=0;
	squad_type="";
	squad_loc=0;
	squad_members=0;
	last_man=0;
	last_vehicle=0;
	var role_list = ds_list_create();
	// v: check number
	// mans: number of mans that a hit has gotten
	// Calculates the temporary variables to be displayed as marines in the individual company screens

	for (var i=0;i<array_length(obj_ini.TTRPG[company]);i++){
		display_unit[i]=0;
	    man[i]="";
		ide[i]=0;
		man_sel[i]=0;
		ma_lid[i]=0;
		ma_wid[i]=0;
		ma_bio[i]=0;
	    ma_race[i]=0;
		ma_loc[i]="";
		ma_name[i]="";
		ma_role[i]="";
		ma_gear[i]="";
		ma_mobi[i]="";
		ma_wep1[i]="";
	    ma_wep2[i]="";
		ma_armour[i]="";
		ma_health[i]=0;
		ma_chaos[i]=0;
		ma_exp[i]=0;
		ma_promote[i]=0;
		ma_god[i]=0;
	}

	for (var i = 0; i < 20; i++){
		sel_uni[i]="";
		sel_veh[i]="";
	}
	
	sel_uni[1]="Command";

	// This sets up the mans, but not the vehicles
	// Company_lenght is 501, so we check with 500
	var company_length = array_length(obj_ini.TTRPG[company]);
	for (var v = 0; v < company_length; v++){
		if (v==501) then break;
		bad=0;

	    if (company>=0) and (company<=10){
			unit = obj_ini.TTRPG[company,v]
	        if (unit.name()!=""){
				unit_loc = unit.marine_location() ;
	            // if (obj_ini.god[company,v]>=10) then bad=1;
				if (unit_loc[0] == location_types.ship){
				   	if (obj_ini.ship_location[unit_loc[1]]="Lost") then bad=1;
				}	            
	            if (bad==1){
					man[v]="hide";
					continue;
				}else{
	                mans+=1;
	                man[v]="man";
	                ide[v]=v;
	                ma_race[v]=obj_ini.race[company][v];
	                ma_loc[v]=obj_ini.loc[company][v];
	                ma_name[v]=obj_ini.name[company][v];
	                ma_role[v]=obj_ini.role[company][v];
	                ma_wep1[v]=obj_ini.wep1[company][v];
	                ma_wep2[v]=obj_ini.wep2[company][v];
	                ma_armour[v]=obj_ini.armour[company][v];
	                ma_gear[v]=obj_ini.gear[company][v];
	                ma_health[v]=obj_ini.hp[company][v];
	                ma_exp[v]=obj_ini.experience[company][v];
	                ma_lid[v]=obj_ini.lid[company][v];
	                ma_wid[v]=obj_ini.wid[company][v];
	                ma_god[v]=obj_ini.god[company][v];
	                ma_bio[v]=obj_ini.bio[company][v];
	                ma_mobi[v]=obj_ini.mobi[company][v];
					display_unit[v] = unit;
					if (unit_loc[0]==location_types.ship){
						if (unit_loc[2]=="Lost")then ma_loc[v]="Lost";
					}					
	                // Select All Infantry Setup
	                var go=0,op=0;
					 if (man[v]=="man") and (!is_specialist(ma_role[v])){
	                    for (var j=0; j<20;j++) {
							if (sel_uni[j] == "") && (op == 0) then op = j;
							if (sel_uni[j] == ma_role[v]) then go = 1;
							ds_list_add(role_list, ma_role[v]);
						}
	                    if (go==0) then sel_uni[op]=ma_role[v];
	                }
	                go=0;
					op=0;
					
	                if (man[v]="vehicle"){
	                    for (var j=0; j<20;j++) {
	                        if (sel_veh[j]="") and (op=0) then op=j;
	                        if (sel_veh[j]=ma_role[v]) then go=1;
	                    }
	                    if (go=0) then sel_veh[op]=ma_role[v];
	                }
	                // Squad setup
	                // 137 ;
	                // Should have this be only ran for MAN, somehow run it a second time for VEHICLE
	                if (squads>0){
	                	var n=1;
						if (is_specialist(squad_type)) or (squad_type=ma_role[v]) then n=0;
	                    // if units are not in a squad
	                    if (unit.squad == "none"){


	                    	if (is_specialist(squad_type,"heads")) then  n=1;
    	                    if (squad_type==obj_ini.role[100][6]) and (squad_type!=ma_role[v]) and (squad_type!="Venerable "+string(ma_role[v])) then n=2;
    	                    if (squad_type==obj_ini.role[100][6]) and (ma_role[v]=obj_ini.role[100][6]) then n=0;
    	                    if (squad_type==obj_ini.role[100][6]) and (ma_role[v]="Venerable "+string(obj_ini.role[100][6])) then n=0;
    	                    if (squad_type="Venerable "+string(obj_ini.role[100][6])) and (ma_role[v]=obj_ini.role[100][6]) then n=0;

	         			
	         				//if units are on different ships but the ships are in the same location group them together
	         				//else split units up in selection area
		         			if (squad_loc[0]==location_types.ship){
		                    	if (unit_loc[0]==squad_loc[0]) and (unit_loc[2]==squad_loc[2]){
		                    		n=0;
		                    	}else n=1;
		                	} else if (unit_loc[0]!=squad_loc[0]) or(unit_loc[1]!=squad_loc[1]) or(unit_loc[2]!=squad_loc[2]) then n=1;

		                    if (squad_members+1>10) then n=1;

		                    switch (n){
		                    	case 0:
		                    		squad_members+=1;
		                    		squad_type=ma_role[v];
		                    		squad[v]=squads;
		                    		break;
		                    	case 1:
		                    		squads+=1;
		                    		squad_members=1;
		                    		squad_type=ma_role[v];
		                    		squad[v]=squads;
		                    		squad_loc=unit_loc;
		                    		break;
		                    	case 2:
		                    		squad[v]=0;
		                    		break
		                    }    	                    
    						//if units are in a squad
	                   	} else{
	                   		///if units are on different ships but the ships are in the same location group them together
	                   		if (squad_type == unit.squad) and (unit_loc[0]==squad_loc[0]) and (unit_loc[2]==squad_loc[2]) and ((squad_loc[0] == location_types.ship) or (unit_loc[1]==squad_loc[1]) ){
	                   			squad_members+=1;
	                   			squad[v]=squads;
	                   		} else {
	                   			squads+=1;
	                   			squad_members=1;
	                   			squad_type = unit.squad;
	                   			squad[v]=squads;
	                   			squad_loc=unit_loc;
	                   		}
	                   	}
	                }
	                if (squads=0){
	                    squads+=1;
	                    squad_members=1;
	                    if (unit.squad == "none"){
	                    	squad_type=ma_role[v];
	                    } else {
	                    	squad_type = unit.squad;
	                    }
	                    squad[v]=squads;
	                    squad_loc=unit_loc;
	                }
	                // Right here is where the promotion check will go
	                // If EXP is enough for that company then ma_promote[i]=1
	                if (ma_role[v]==obj_ini.role[100][3]) or (ma_role[v]==obj_ini.role[100][4]){
	                    if (company==1) and (ma_exp[v]>=300) then ma_promote[v]=1;
	                    if (ma_health[v]<=10) then ma_promote[v]=10;
	                }
	                if (ma_role[v]=obj_ini.role[100][6]) and (ma_exp[v]>=400) then ma_promote[v]=1;
	                if (ma_role[v]=obj_ini.role[100][15]) or (ma_role[v]=obj_ini.role[100][14]) then ma_promote[v]=1;
	                if (ma_role[v]=obj_ini.role[100][16]) then ma_promote[v]=1;

	                if (ma_role[v]=obj_ini.role[100][8]) or (ma_role[v]=obj_ini.role[100][12]) or (ma_role[v]=obj_ini.role[100][10]) or (ma_role[v]=obj_ini.role[100][9]){
	                    if (company==10) and (ma_exp[v]>=40) then ma_promote[v]=1;
	                    else if (company==9) and (ma_exp[v]>=50) then ma_promote[v]=1;
	                    else if (company==8) and (ma_exp[v]>=60) then ma_promote[v]=1;
	                    else if (company==7) and (ma_exp[v]>=70) then ma_promote[v]=1;
	                    else if (company==6) and (ma_exp[v]>=80) then ma_promote[v]=1;
	                    else if (company==5) and (ma_exp[v]>=100) then ma_promote[v]=1;
	                    else if (company==4) and (ma_exp[v]>=110) then ma_promote[v]=1;
	                    else if (company==3) and (ma_exp[v]>=120) then ma_promote[v]=1;
	                    else if (company==2) and (ma_exp[v]>=150) then ma_promote[v]=1;
                    
	                    if (ma_health[v]<=10) then ma_promote[v]=10;
	                }

	                // Need something to verify there is no standard bearer in the previous company
	                /*if (ma_role[v]="Standard Bearer"){
	                    if (company=10) and (ma_exp[v]>=25) then ma_promote[v]=1;
	                    if (company=9) and (ma_exp[v]>=30) then ma_promote[v]=1;
	                    if (company=8) and (ma_exp[v]>=35) then ma_promote[v]=1;
	                    if (company=7) and (ma_exp[v]>=40) then ma_promote[v]=1;
	                    if (company=6) and (ma_exp[v]>=45) then ma_promote[v]=1;
	                    if (company=5) and (ma_exp[v]>=55) then ma_promote[v]=1;
	                    if (company=4) and (ma_exp[v]>=65) then ma_promote[v]=1;
	                    if (company=3) and (ma_exp[v]>=75) then ma_promote[v]=1;
	                }*/

	                if (ma_role[v]=obj_ini.role[100][5]){
	                    if (company==10) and (ma_exp[v]>=40) then ma_promote[v]=1;
	                    else if (company==9) and (ma_exp[v]>=50) then ma_promote[v]=1;
	                    else if (company==8) and (ma_exp[v]>=60) then ma_promote[v]=1;
	                    else if (company==7) and (ma_exp[v]>=70) then ma_promote[v]=1;
	                    else if (company==6) and (ma_exp[v]>=80) then ma_promote[v]=1;
	                    else if (company==5) and (ma_exp[v]>=100) then ma_promote[v]=1;
	                    else if (company==4) and (ma_exp[v]>=110) then ma_promote[v]=1;
	                    else if (company==3) and (ma_exp[v]>=120) then ma_promote[v]=1;
	                    else if (company==2) and (ma_exp[v]>=150) then ma_promote[v]=1;
	                }
	                if (obj_controller.command_set[2]==1) and (ma_promote[v]==0) then ma_promote[v]=1;
	            }
	        } else {
	        	man[v]="hide";
	        	continue;
	        }
	        if (obj_ini.name[company,v+1]=="")and (last_man==0) and (obj_ini.ship_location[obj_ini.lid[company,v]]!="Lost"){last_man=v;break;}
	    }
	}

	v=last_man;
	last_vehicle=0;
	for (var i=1;i<=100;i++){
	// if (!instance_exists(obj_popup)) then repeat(100){// 100
		bad=0;

	    // if (obj_ini.veh_race[company][i]=company) and (obj_ini.veh_role[company][i]!=""){
	    if (obj_ini.veh_race[company][i]!=0){
	        if (obj_ini.veh_lid[company][i]>0){
	            if (obj_ini.ship_location[obj_ini.veh_lid[company][i]]=="Lost") then bad=1;
	        }

	        if (bad==0){
				v+=1;
	            var step=false;
	            if (i>1){
					if (ide[v-1]==i){
						step=true;
						v-=1;
					}
				}
	            if (step==false){
	                man[v]="vehicle";
					ide[v]=i;
					last_vehicle+=1;
	                ma_loc[v]=obj_ini.veh_loc[company][i];
					ma_role[v]=obj_ini.veh_role[company][i];
					ma_wep1[v]=obj_ini.veh_wep1[company][i];
	                ma_wep2[v]=obj_ini.veh_wep2[company][i];
					ma_armour[v]=obj_ini.veh_wep3[company][i];
					ma_gear[v]=obj_ini.veh_upgrade[company][i];
					ma_mobi[v]=obj_ini.veh_acc[company][i];
					ma_health[v]=obj_ini.veh_hp[company][i];
	                ma_lid[v]=obj_ini.veh_lid[company][i];
					ma_wid[v]=obj_ini.veh_wid[company][i];
	                if (ma_lid[v]>0){
	                    ma_loc[v]=obj_ini.ship[ma_lid[v]];
	                    if (obj_ini.ship_location[ma_lid[v]]=="Lost") then ma_loc[v]="Lost";
	                }
	                // Select All Vehicle Setup
	                var go=0,op=0;
	                if (man[v]=="vehicle"){
	                    for (var p=0;p<20;p++){
	                        if (sel_veh[p]=="") and (op==0) then op=p;
	                        if (sel_veh[p]==ma_role[v]) then go=1;
							ds_list_add(role_list, ma_role[v]);
	                    }
	                    if (go==0) then sel_veh[op]=ma_role[v];
	                }
	            }
	        }
	    }
	}
	ds_list_destroy(role_list);

	man_current=1;
	man_max=last_man+last_vehicle+2;
	if (last_vehicle==0) and (last_man==0) then man_max=0;
	man_see=38-4;
}
