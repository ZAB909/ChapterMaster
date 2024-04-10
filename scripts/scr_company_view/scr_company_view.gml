function reset_manage_arrays(){
	with (obj_controller){
		display_unit=[];
	    man=[];
		ide=[];
		man_sel=[];
		ma_lid=[];
		ma_wid=[];
		ma_bio=[];
	    ma_race=[];
		ma_loc=[];
		ma_name=[];
		ma_role=[];
		ma_gear=[];
		ma_mobi=[];
		ma_wep1=[];
	    ma_wep2=[];
		ma_armour=[];
		ma_health=[];
		ma_chaos=[];
		ma_exp=[];
		ma_promote=[];
		ma_god=[];
        for (var i=0;i<=500;i++){
            sh_ide[i]=0;
            sh_name[i]="";
            sh_class[i]="";
            sh_loc[i]="";
            sh_hp[i]="";
            sh_cargo[i]=0;
            sh_cargo_max[i]="";        	
        }	
	}
}

function add_man_to_manage_arrays(unit){
	with (obj_controller){
       	var unit_location = unit.marine_location();
        array_push(man,"man");
        array_push(ide,unit.marine_number);
        array_push(man_sel,0);
        array_push(ma_lid,unit.ship_location);
        array_push(ma_wid,unit.planet_location);
        array_push(ma_race ,unit.race());
        array_push(ma_loc,unit_location[2]);
        array_push(ma_name ,unit.name());
        array_push(ma_role,unit.role());
        array_push(ma_wep1,unit.weapon_one());
        array_push(ma_wep2,unit.weapon_two());
        array_push(ma_armour,unit.armour());
        array_push(ma_gear,unit.gear());
        array_push(ma_health,unit.hp());
        array_push(ma_mobi,unit.mobility_item());
        array_push(ma_chaos,unit.corruption);
        array_push(ma_exp,unit.experience());
        array_push(ma_promote,0);
        array_push(display_unit,unit);
        array_push(ma_god,0);
	}
}

function add_vehicle_to_manage_arrays(unit){
	with (obj_controller){
		array_push(display_unit,unit);
		array_push(man,"vehicle");
		array_push(ide,unit[1]);
		array_push(man_sel,0);
		array_push(ma_lid,obj_ini.veh_lid[unit[0]][unit[1]]);
		array_push(ma_wid,obj_ini.veh_wid[unit[0]][unit[1]]);
		array_push(ma_race,obj_ini.veh_race[unit[0]][unit[1]]);
		if (obj_ini.veh_lid[unit[0]][unit[1]]>0){
			array_push(ma_loc,obj_ini.ship_location[obj_ini.veh_lid[unit[0]][unit[1]]]);
		} else {
			array_push(ma_loc,obj_ini.veh_loc[unit[0]][unit[1]]);
		}
		array_push(ma_name ,"");
		array_push(ma_role,obj_ini.veh_role[unit[0]][unit[1]]);
		array_push(ma_wep1,obj_ini.veh_wep1[unit[0]][unit[1]]);
		array_push(ma_wep2,obj_ini.veh_wep2[unit[0]][unit[1]]);
		array_push(ma_armour,obj_ini.veh_wep3[unit[0]][unit[1]]);
		array_push(ma_gear,obj_ini.veh_upgrade[unit[0]][unit[1]]);
		array_push(ma_health,obj_ini.veh_hp[unit[0]][unit[1]]);
		array_push(ma_mobi,obj_ini.veh_acc[unit[0]][unit[1]]);
		array_push(ma_chaos,0);
		array_push(ma_exp,0);
		array_push(ma_promote,0);
		 array_push(ma_god,0);
	}
}


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
	reset_manage_arrays();
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
			unit = obj_ini.TTRPG[company][v];
	        if (unit.name()!=""){
				unit_loc = unit.marine_location();
	            // if (obj_ini.god[company,v]>=10) then bad=1;
				if (unit_loc[0] == location_types.ship){
				   	if (obj_ini.ship_location[unit_loc[1]]="Lost") then bad=1;
				}	            
	            if (bad==1){
					continue;
				}else{
	                mans+=1;
	                add_man_to_manage_arrays(unit)
				    var go=0,op=0;
					 if (!unit.IsSpecialist()){
				        for (var j=0; j<20;j++) {
							if (sel_uni[j] == "") && (op == 0){
								op = j;
								break;
							}
							if (sel_uni[j] == unit.role()) then go = 1;
						}
				        if (go==0) then sel_uni[op]=unit.role();
				    }

	            }
	        } 
	        if (obj_ini.name[company][v+1]=="")and (last_man==0) and (obj_ini.ship_location[unit.ship_location]!="Lost"){last_man=v;break;}
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
				v++;
	            var step=false;
	            if (step==false){
	            	last_vehicle+=1;
	                add_vehicle_to_manage_arrays([company, i]);
	                // Select All Vehicle Setup
	                var go=0,op=0;
                    for (var p=0;p<20;p++){
                        if (sel_veh[p]=="") and (op==0) then op=p;
                        if (sel_veh[p]==obj_ini.veh_role[company][i]) then go=1;
                    }
                    if (go==0) then sel_veh[op]=obj_ini.veh_role[company][i];
	            }
	        }
	    }
	}

	man_current=0;
	man_max=array_length(display_unit)+2;
	man_see=38-4;
	other_manage_data();
}

function other_manage_data(){
	var v, mans, bad, squads, squad_type, squad_loc, squad_members, unit, unit_loc,;
	v=0;
	mans=0;
	bad=0;
	squads=0;
	squad_type="";
	squad_loc=0;
	squad_members=0;
	var unit;
	for (var v = 0; v < array_length(display_unit); v++){
		if (!is_struct(display_unit[v])) then continue;
		unit = display_unit[v];
		unit_loc = unit.marine_location();
		if (unit_loc[0]==location_types.ship){
			if (unit_loc[2]=="Lost") then ma_loc[v]="Lost";
		}					
	    // Select All Infantry Setup
	    go=0;
		op=0;
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
	    //requirements to be promoted through companies index 0 = command comapny requirement
	    var company_promotion_limits = [0,150,120,110,100,80,70,60,50,40,0];
	    // Right here is where the promotion check will go
	    // If EXP is enough for that company then ma_promote[i]=1
	    if (ma_role[v]==obj_ini.role[100][3]) or (ma_role[v]==obj_ini.role[100][4]){
	        if (unit.company==1) and (ma_exp[v]>=300) then ma_promote[v]=1;
	        if (ma_health[v]<=10) then ma_promote[v]=10;
	    }
	    if (unit.role()=obj_ini.role[100][6]) and (ma_exp[v]>=400) then ma_promote[v]=1;
	    if (unit.role()=obj_ini.role[100][15]) or (ma_role[v]=obj_ini.role[100][14]) then ma_promote[v]=1;
	    if (unit.role()=obj_ini.role[100][16]) then ma_promote[v]=1;

	    if (unit.IsSpecialist("rank_and_file")){
	    	var promotion_limit = company_promotion_limits[unit.company-1]
			if (unit.experience()>=promotion_limit && promotion_limit>0){
	    		ma_promote[v]=1;
	    	}
	    	if (ma_health[v]<=10) then ma_promote[v]=10;	                	
	    } else if  (ma_role[v]=obj_ini.role[100][5]){
	    	var promotion_limit = company_promotion_limits[unit.company-1]
	    	if (unit.experience()>=promotion_limit+25 && promotion_limit>0){

	    	}
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
	    if (obj_controller.command_set[2]==1) and (ma_promote[v]==0) then ma_promote[v]=1;
	}
}

function filter_and_sort_company(type, specific){
	var i ,j, limit;
	function switchy(a, b){
        var tempman = man[a];
        var tempide =ide[a];
        var tempsel =man_sel[a];
        var templid =ma_lid[a];
        var tempwid =ma_wid[a];
        var temprace =ma_race[a];
        var temploc =ma_loc[a];
        var tempname =ma_name[a];
        var temprole =ma_role[a];
        var tempwep =ma_wep1[a];
        var tempwep2 =ma_wep2[a];
        var temparm =ma_armour[a];
        var temphealth =ma_health[a];
        var tempcha =ma_chaos[a];
        var tempexp =ma_exp[a];
        var tempprom =ma_promote[a];
        var tempdis =display_unit[a];

        man[a]=man[b];
        ide[a]=ide[b];
        man_sel[a]=man_sel[b];
        ma_lid[a]=ma_lid[b];
        ma_wid[a]= ma_wid[b];
        ma_race[a]=ma_race[b];
        ma_loc[a]=ma_loc[b];
        ma_name[a]= ma_name[b];
        ma_role[a]=ma_role[b];
        ma_wep1[a]= ma_wep1[b];
        ma_wep2[a]= ma_wep2[b];
        ma_armour[a]=ma_armour[b];
        ma_health[a]=ma_health[b];
        ma_chaos[a]=ma_chaos[b];
        ma_exp[a]=ma_exp[b];
        ma_promote[a]=ma_promote[b];
        display_unit[a] =display_unit[b];

        man[b]=tempman;
        ide[b]=tempide;
        man_sel[b]=tempsel;
        ma_lid[b]=templid;
        ma_wid[b]= tempwid;
        ma_race[b]=temprace;
        ma_loc[b]= temploc;
        ma_name[b]= tempname;
        ma_role[b]=temprole;
        ma_wep1[b]= tempwep;
        ma_wep2[b]= tempwep2;
        ma_armour[b]=temparm;
        ma_health[b]=temphealth;
        ma_chaos[b]=tempcha;
        ma_exp[b]=tempexp;
        ma_promote[b]=tempprom;
        display_unit[b] =tempdis;             
	}
	if (type=="stat"){
		var swapped;
		with (obj_controller){
			for (i = 0; i<array_length(display_unit);i++){
				//if (man[i] != "man") continue;
				swapped=false;
				limit = array_length(display_unit)-i;
				for (j=0; j<limit-1;j++){
					if (man[j] != "man"){
						if (man[j+1] == "man"){
							switchy(j,j+1);
							swapped=true;
						}
					} else {
						if (man[j+1] == "man"){
							if (display_unit[j][$specific]<display_unit[j+1][$specific]){
								switchy(j,j+1);
								swapped = true;
							}
						}
					}
				}
				//if (swapped == false) then break;
			}
		}
	}
}
