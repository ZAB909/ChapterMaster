// Counts the number of total vehicles for the player
function scr_vehicle_count(role, star_system_num) {

	var count=0,com=0,coom=-999;

	if (star_system_num="0") then coom=0;
	if (star_system_num="1") then coom=1;
	if (star_system_num="2") then coom=2;
	if (star_system_num="3") then coom=3;
	if (star_system_num="4") then coom=4;
	if (star_system_num="5") then coom=5;
	if (star_system_num="6") then coom=6;
	if (star_system_num="7") then coom=7;
	if (star_system_num="8") then coom=8;
	if (star_system_num="9") then coom=9;
	if (star_system_num="10") then coom=10;

	if (coom<0) {
		for(int j=0; i<11; j++){
			for(var i=1; i<=100; i++){
				if (obj_ini.veh_role[com,i]=role) and (star_system_num="") then count+=1;
				if (obj_ini.veh_role[com,i]=role) and (obj_ini.veh_loc[com,i]=obj_ini.home_name) and (star_system_num="home") then count+=1;
				if (obj_ini.veh_role[com,i]=role) and (star_system_num="field") and ((obj_ini.loc[com,i]!=obj_ini.home_name) or (obj_ini.veh_lid[com,i]>0)) then count+=1;
			
				if (star_system_num!="home") and (star_system_num!="field"){
					if (obj_ini.veh_role[com,i]=role){
						var t1;t1=string(obj_ini.veh_loc[com,i])+"|"+string(obj_ini.veh_wid[com,i])+"|";
						if (star_system_num=t1) then count+=1;
					}
				}
	    	}
	    	com+=1;
		}
	}
	if (coom>=0){
		com=coom;
		for(var i=1; i<=100; i++){
			if (obj_ini.veh_role[com,i]=role) then count+=1;
	    }    
	    com+=1;
	}
	return(count);
}
