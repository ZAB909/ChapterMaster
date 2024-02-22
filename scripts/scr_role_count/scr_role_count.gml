function scr_role_count(target_role, search_location="", return_type="count") {

	// Take a guess

	var com, i, count, coom, units=[], unit,match;

	count=0;
	i=0;
	com=0;
	coom=-999;

	if (search_location="0") then coom=0;
	if (search_location="1") then coom=1;
	if (search_location="2") then coom=2;
	if (search_location="3") then coom=3;
	if (search_location="4") then coom=4;
	if (search_location="5") then coom=5;
	if (search_location="6") then coom=6;
	if (search_location="7") then coom=7;
	if (search_location="8") then coom=8;
	if (search_location="9") then coom=9;
	if (search_location="10") then coom=10;



	if (coom>=0){
	    com=coom;
	    for (i=1;i<array_length(obj_ini.TTRPG[com]);i++){
			unit=obj_ini.TTRPG[com][i];
			if (unit.name()=="")then continue; 	
	        if (unit.role()=target_role) and (obj_ini.god[com][i]<10){
	        	count+=1;
	        	if (return_type=="units"){
	        		array_push(units, obj_ini.TTRPG[com][i]);
	        	}
	        }
	    }    
	    com+=1;
	}


	if (coom<0) then repeat(11){
	    i=0;
	    for (i=1;i<array_length(obj_ini.TTRPG[com]);i++){
			match=false;
			unit=obj_ini.TTRPG[com][i];
			if (unit.name()=="")then continue;
	        if (unit.role()=target_role) and (search_location="") then match=true;
	        if (unit.role()=target_role) and (obj_ini.loc[com][i]=obj_ini.home_name) and (search_location="home") then match=true;
	        if (unit.role()=target_role) and (search_location="field") and ((obj_ini.loc[com][i]!=obj_ini.home_name) or (obj_ini.lid[com][i]>0)) then match=true;
        
	        if (search_location!="home") and (search_location!="field"){
	            if (obj_ini.role[com][i]=target_role){
	                var t1=string(obj_ini.loc[com][i])+"|"+string(obj_ini.TTRPG[com][i].planet_location)+"|";
	                if (search_location=t1) then match=true;
	            }
	        }
	        if (match){
	        	count++;
	        	if (return_type=="units"){
	        		array_push(units, unit);
	        	}	        	
	        }
	    }    
	    com+=1;
	}






	if (return_type=="units"){
		return units;
	}

	return(count);
}
