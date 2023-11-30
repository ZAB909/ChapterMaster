function scr_special_view(command_group) {

	// Works as COMPANY VIEW but for the subsections of HQ

	var v, i; 
	var mans=0, onceh, company=0, bad=0, oth=0, unit;
	gogogo=0;
	vehicles=0;
	last_man=0;
	last_vehicle=0;

	var squads=0, squad_typ="", squad_loc=0, squad_members=0;

	for (i=0;i<20;i++){
		sel_uni[i]="";
		sel_veh[i]="";
	}
	for (i=0;i<501;i++){
	    man[i]="";
	    ide[i]=0;
	    man_sel[i]=0;
	    ma_lid[i]=0;
	    ma_wid[i]=0;
	    ma_promote[i]=0;
	    ma_bio[i]=0;
	    ma_race[i]=0;
	    ma_loc[i]="";
	    ma_name[i]="";
	    ma_role[i]="";
	    ma_wep1[i]="";
	    ma_mobi[i]="";
	    ma_wep2[i]="";
	    ma_armour[i]="";
	    ma_gear[i]="";
	    ma_health[i]=100;
	    ma_chaos[i]=0;
	    ma_exp[i]=0;
	    ma_god[i]=0;
	    sh_ide[i]=0;sh_uid[i]=0;
	    sh_name[i]="";
	    sh_class[i]="";
	    sh_loc[i]="";
	    sh_hp[i]="";
	    sh_cargo[i]=0;
	    sh_cargo_max[i]="";
	    squad[i]=0;
	    display_unit[i] = {};

	    if (i<=50){
	    	penit_co[i]=0;
	    	penit_id[i]=0;
	    }
	    // if (i<=100){event[i]="";event_duration[i]=0;}
	}

	function special_mar_data_fill(unit_num, b){
        man[b]="man";
        ide[b]=unit_num;
        ma_race[b]=obj_ini.race[0][unit_num];
        ma_loc[b]=obj_ini.loc[0][unit_num];
        ma_name[b]=obj_ini.name[0][unit_num];
        ma_role[b]=obj_ini.role[0][unit_num];
        ma_wep1[b]=obj_ini.wep1[0][unit_num];
        ma_wep2[b]=obj_ini.wep2[0][unit_num];
        ma_armour[b]=obj_ini.armour[0][unit_num];
        ma_gear[b]=obj_ini.gear[0][unit_num];
        ma_health[b]=obj_ini.hp[0][unit_num];
        ma_exp[b]=obj_ini.experience[0][unit_num];
        ma_lid[b]=obj_ini.lid[0][unit_num];
        ma_wid[b]=obj_ini.wid[0][unit_num];
		display_unit[b] = obj_ini.TTRPG[0][unit_num];
        if (ma_lid[b]>0) then ma_loc[b]=obj_ini.ship[ma_lid[b]];
        ma_mobi[b]=obj_ini.mobi[0][unit_num];
        last_man=b;
        ma_promote[b]=0;
        ma_god[b]=obj_ini.god[0][unit_num];
        ma_bio[b]=obj_ini.bio[0][unit_num];
	}

	mans=0;
	vehicles=0;
	v=0;
	i=0;
	b=0;

	// v: check number
	// mans: number of mans that a hit has gotten

	b=0;
	if (command_group==11) or (command_group==0){				//HQ units
		for (v = 0;v<array_length(obj_ini.TTRPG[0]);v++){
			bad=0;
			if (obj_ini.name[0][v]== ""){continue;}
			if (obj_ini.lid[0][v]>0){
			   	var ham=obj_ini.lid[0][v];
			   	if (obj_ini.ship_location[ham]="Lost") then continue;
			}

			unit = obj_ini.TTRPG[0][v];	    	
			var yep=0;
			if (unit.base_group!="astartes") and (unit.base_group!="none"){yep=1;}
			if ((unit.role()=="Chapter Master") or (unit.role()==obj_ini.role[100][2])){yep=1;}
			if (yep==1){
				b+=1;
		        mans+=1;
		        special_mar_data_fill(v, b);
			}
		}
	}

	if (command_group==12) or (command_group==0){// Apothecarion
		for (v = 0;v<array_length(obj_ini.TTRPG[0]);v++){
			bad=0;
		    if (obj_ini.lid[company,v]>0){
		        var ham=obj_ini.lid[0][v];
		        if (obj_ini.ship_location[ham]=="Lost") then continue
		    }
		    var apoth_roles = ["Master of the Apothecarion", obj_ini.role[100][15], string("{0} Aspirant",obj_ini.role[100][15])]
		    if (array_contains(apoth_roles ,obj_ini.role[0][v])){
		        b+=1;
		        mans+=1;
		        special_mar_data_fill(v, b);
		        if (obj_ini.role[0][v]=obj_ini.role[100][15]) then ma_promote[b]=1;
		    }
		}
	}

	v=0;
	if (command_group==13) or (command_group==0){// Librarium
		for (v = 0;v<array_length(obj_ini.TTRPG[0]);v++){
		    if (obj_ini.lid[company,v]>0){
		        var ham=obj_ini.lid[0][v];
		        if (obj_ini.ship_location[ham]=="Lost") then continue;
		    }
		    //find if mlib specialist or trainee
		    if (is_specialist(obj_ini.role[0][v],"libs", true)){
		        b+=1;
		        mans+=1;
		        special_mar_data_fill(v, b);
	            if (obj_ini.role[0][v]=="Lexicanum") and (ma_exp[b]>=80) then ma_promote[b]=1;
	            if (obj_ini.role[0][v]=="Codiciery") and (ma_exp[b]>=125) then ma_promote[b]=1;
		    }
		}
	}

	v=0;
	if (command_group==14) or (command_group==0){// Reclusium
		for (v = 0;v<array_length(obj_ini.TTRPG[0]);v++){
		    bad=0;
		    if (obj_ini.lid[company,v]>0){
		        var ham=obj_ini.lid[0][v];
		        if (obj_ini.ship_location[ham]=="Lost") then bad=1;
		    }
		    if (bad==0){
			    if (obj_ini.role[0][v]=="Master of Sanctity"){
			    	b+=1;
			        mans+=1;
			        special_mar_data_fill(v, b);
			        if (obj_ini.role[0][v]=obj_ini.role[100][14]) then ma_promote[b]=1;
			    }else if ((obj_ini.role[0][v]==obj_ini.role[100][14]) or (obj_ini.role[0][v]==string("{0} Aspirant",obj_ini.role[100][14]))) and (global.chapter_name!="Iron Hands"){
			    	b+=1;
			        mans+=1;
			        special_mar_data_fill(v, b);
			        if (obj_ini.role[0][v]=obj_ini.role[100][14]) then ma_promote[b]=1;
			    }
			}
		}
	}

	v=0;
	squads=0;
	if (command_group==15) or (command_group==0){// Armamentarium
		for (v = 0;v<array_length(obj_ini.TTRPG[0]);v++){
		    bad=0;
		    if (obj_ini.lid[company,v]>0){
		        var ham=obj_ini.lid[0][v];
		        if (obj_ini.ship_location[ham]=="Lost") then bad=1;
		    }
		    if ((obj_ini.role[0][v] == "Forge Master") or (obj_ini.role[0][v]=obj_ini.role[100][16]) 
		    or (obj_ini.role[0][v]=string("{0} Aspirant",obj_ini.role[100][16])) or (obj_ini.role[0][v]="Techpriest")) and (bad=0){
		        b+=1;
		        mans+=1;
		        special_mar_data_fill(v, b);
		    }
		}
	}






	// b=last_man;
	last_man=b;
	i=0;
	last_vehicle=0;

	for (i=1;i<101;i++){// 100
	    if (obj_ini.veh_race[company,i]!=0){b+=1;
	        man[b]="vehicle";
	        ide[b]=i;
	        last_vehicle+=1;
	        ma_loc[v]=obj_ini.veh_loc[company,i];
	        ma_role[v]=obj_ini.veh_role[company,i];
	        ma_wep1[v]=obj_ini.veh_wep1[company,i];
	        ma_wep2[v]=obj_ini.veh_wep2[company,i];
	        ma_armour[v]=obj_ini.veh_wep3[company,i];
	        ma_gear[v]=obj_ini.veh_upgrade[company,i];
	        ma_mobi[v]=obj_ini.veh_acc[company,i];
	        ma_health[v]=obj_ini.veh_hp[company,i];
	        ma_lid[v]=obj_ini.veh_lid[company,i];
	        ma_wid[v]=obj_ini.veh_wid[company,i];
	        if (ma_lid[v]>0) then ma_loc[v]=obj_ini.ship[ma_lid[v]];

	    }
	}



	i=0;
	squads=0;
	for (i=1;i<101;i++){
		onceh=0;
	    var ahuh=0;
	    if (man[i]="man"){if (ma_role[i]!="") then ahuh=1;}
	    if (man[i]="vehicle"){if (ma_role[i]!="") then ahuh=1;}

	    if (ahuh=1){
	        // Select All
	        var go=0,op=0,w=0;
	        if (man[i]=="man"){
	            for (w=0;w<20;w++){
	                if (sel_uni[w]=="") and (op==0) then op=w;
	                if (sel_uni[w]==ma_role[i]) then go=1;
	            }
	            if (go==0) then sel_uni[op]=ma_role[i];
	        }
	        go=0;
	        op=0;
	        if (man[i]=="vehicle"){
	            for (w=0;w<20;w++){
	                if (sel_veh[w]=="") and (op==0) then op=w;
	                if (sel_veh[w]==ma_role[i]) then go=1;
	            }
	            if (go==0) then sel_veh[op]=ma_role[i];
	        }


	        // Squads
	        if (squads>0){
	            var n=1;
	            if (squad_typ==obj_ini.role[100][15]) then n=0;
	            if (squad_typ==obj_ini.role[100][14]) then n=0;
	            if (squad_typ==obj_ini.role[100,17]) then n=0;
	            if (squad_typ=obj_ini.role[100][16]) then n=0;
	            if (squad_typ="Codiciery") then n=0;
	            if (squad_typ="Lexicanum") then n=0;
	            if (squad_typ=ma_role[i]) then n=0;
	            if (squad_typ=obj_ini.role[100,17]) and (ma_role[i]="Codiciery") then n=1;
	            if (squad_typ="Codiciery") and (ma_role[i]="Lexicanum") then n=1;

	            if (squad_typ="Master of Sanctity") then n=1;
	            if (squad_typ="Chief "+string(obj_ini.role[100,17])) then n=1;
	            if (squad_typ="Forge Master") then n=1;
	            if (squad_typ="Chapter Master") then n=1;
	            if (squad_typ="Master of the Apothecarion") then n=1;

	            if (squad_members+1>10) then n=1;
	            if ((ma_wid[i]+(ma_lid[i]/100))!=squad_loc) then n=1;
	            if (squad_typ==obj_ini.role[100][6]) then n=2;

	            if (n==0){
	            	squad_members+=1;
	            	squad_typ=ma_role[i];
	            	squad[i]=squads;
	            }else if (n==1){
	                squads+=1;
	            	squad_members=1;
		            squad_typ=ma_role[i];
		            squad[i]=squads;
		            squad_loc=ma_wid[i]+(ma_lid[i]/100);
	        	}else if (n==2){
	        		squad[i]=0;
	        	}
	        	}
	        if (squads==0){
	        	squads+=1;
	        	squad_members=1;
		        squad_typ=ma_role[i];
		        squad[i]=squads;
		        squad_loc=ma_wid[i]+(ma_lid[i]/100);
	    	}
	    }

	}

	man_current=1;
	man_max=last_man+last_vehicle;
	man_see=38-4;
	if (man_max>=man_see) then man_max+=2;
	// if (command_group=13) then man_max+=2;


	// Now have the maximum (man_last + vehicle last), the types of each of those slots, and the relevant ID
	// Should be enough to display everything else


}
