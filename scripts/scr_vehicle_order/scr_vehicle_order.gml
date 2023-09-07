// This sorts and crunches the vehicle variables into order for that company
function scr_vehicle_order(company_number) {
	// Once it's actually fucking working it should probably join the scr_company_order script in the Interface folder
	var co=company_number;

	var vehicle=0;
	var temp_race, temp_loc, temp_name, temp_role, temp_wep1, temp_lid, temp_wid, temp_wep1, temp_wep2, temp_armour, temp_gear, temp_hp, temp_chaos, temp_experience, temp_age, temp_uid;

	for(var i=0; i<301; i++){
	    temp_race[co,i]=0;
	    temp_loc[co,i]="";
	    temp_name[co,i]="";
	    temp_role[co,i]="";
	    temp_lid[co,i]=0;
	    temp_wid[co,i]=0;
	    temp_wep1[co,i]="";
	    temp_wep2[co,i]="";
	    temp_wep3[co,i]="";
	    temp_upgrade[co,i]="";
	    temp_acc[co,i]="";
	    temp_hp[co,i]=100;
	    temp_chaos[co,i]=0;
	    temp_uid[co,i]=0;
	}
	/*
	veh_race[company,vehicle]=0;veh_loc[company,vehicle]="";veh_name[company,vehicle]="";veh_role[company,vehicle]="";veh_wep1[company,vehicle]="";veh_wep2[company,vehicle]="";
	veh_upgrade[company,vehicle]="";veh_hp[company,vehicle]=100;veh_chaos[company,vehicle]=0;veh_pilots[company,vehicle]=0;veh_lid[company,i]=0;veh_wid[company,vehicle]=2;
	*/
	for(var i=1; i<=150; i++){
	    if (veh_role[co,i]="Rhino"){
			vehicle+=1;
	        temp_race[co,vehicle]=veh_race[co,i];
			temp_loc[co,vehicle]=veh_loc[co,i];
			temp_name[co,vehicle]=veh_name[co,i];
			temp_role[co,vehicle]=veh_role[co,i];
			temp_lid[co,vehicle]=veh_lid[co,i];
	        temp_wid[co,vehicle]=veh_wid[co,i];
			temp_wep1[co,vehicle]=veh_wep1[co,i];
			temp_wep2[co,vehicle]=veh_wep2[co,i];
			temp_wep3[co,vehicle]=veh_wep3[co,i];
			temp_upgrade[co,vehicle]=veh_upgrade[co,i];
			temp_acc[co,vehicle]=veh_acc[co,i];
			temp_hp[co,vehicle]=veh_hp[co,i];
	        temp_chaos[co,vehicle]=veh_chaos[co,i];
			temp_uid[co,vehicle]=veh_uid[co,i];
	    }
	}
	for(var i=1; i<=150; i++){
	    if (veh_role[co,i]="Predator"){
			vehicle+=1;
			temp_race[co,vehicle]=veh_race[co,i];
			temp_loc[co,vehicle]=veh_loc[co,i];
			temp_name[co,vehicle]=veh_name[co,i];
			temp_role[co,vehicle]=veh_role[co,i];
			temp_lid[co,vehicle]=veh_lid[co,i];
			temp_wid[co,vehicle]=veh_wid[co,i];
			temp_wep1[co,vehicle]=veh_wep1[co,i];
			temp_wep2[co,vehicle]=veh_wep2[co,i];
			temp_wep3[co,vehicle]=veh_wep3[co,i];
			temp_upgrade[co,vehicle]=veh_upgrade[co,i];
			temp_acc[co,vehicle]=veh_acc[co,i];
			temp_hp[co,vehicle]=veh_hp[co,i];
			temp_chaos[co,vehicle]=veh_chaos[co,i];
			temp_uid[co,vehicle]=veh_uid[co,i];
	    }
	}
	for(var i=1; i<=150; i++){
	    if (veh_role[co,i]="Whirlwind"){
			vehicle+=1;
			temp_race[co,vehicle]=veh_race[co,i];
			temp_loc[co,vehicle]=veh_loc[co,i];
			temp_name[co,vehicle]=veh_name[co,i];
			temp_role[co,vehicle]=veh_role[co,i];
			temp_lid[co,vehicle]=veh_lid[co,i];
			temp_wid[co,vehicle]=veh_wid[co,i];
			temp_wep1[co,vehicle]=veh_wep1[co,i];
			temp_wep2[co,vehicle]=veh_wep2[co,i];
			temp_wep3[co,vehicle]=veh_wep3[co,i];
			temp_upgrade[co,vehicle]=veh_upgrade[co,i];
			temp_acc[co,vehicle]=veh_acc[co,i];
			temp_hp[co,vehicle]=veh_hp[co,i];
			temp_chaos[co,vehicle]=veh_chaos[co,i];
			temp_uid[co,vehicle]=veh_uid[co,i];
	    }
	}
	for(var i=1; i<=150; i++){
	    if (veh_role[co,i]="Land Speeder"){
			vehicle+=1;
			temp_race[co,vehicle]=veh_race[co,i];
			temp_loc[co,vehicle]=veh_loc[co,i];
			temp_name[co,vehicle]=veh_name[co,i];
			temp_role[co,vehicle]=veh_role[co,i];
			temp_lid[co,vehicle]=veh_lid[co,i];
			temp_wid[co,vehicle]=veh_wid[co,i];
			temp_wep1[co,vehicle]=veh_wep1[co,i];
			temp_wep2[co,vehicle]=veh_wep2[co,i];
			temp_wep3[co,vehicle]=veh_wep3[co,i];
			temp_upgrade[co,vehicle]=veh_upgrade[co,i];
			temp_acc[co,vehicle]=veh_acc[co,i];
			temp_hp[co,vehicle]=veh_hp[co,i];
			temp_chaos[co,vehicle]=veh_chaos[co,i];
			temp_uid[co,vehicle]=veh_uid[co,i];
	    }
	}
	for(var i=1; i<=150; i++){
	    if (veh_role[co,i]="Land Raider"){
			vehicle+=1;
			temp_race[co,vehicle]=veh_race[co,i];
			temp_loc[co,vehicle]=veh_loc[co,i];
			temp_name[co,vehicle]=veh_name[co,i];
			temp_role[co,vehicle]=veh_role[co,i];
			temp_lid[co,vehicle]=veh_lid[co,i];
			temp_wid[co,vehicle]=veh_wid[co,i];
			temp_wep1[co,vehicle]=veh_wep1[co,i];
			temp_wep2[co,vehicle]=veh_wep2[co,i];
			temp_wep3[co,vehicle]=veh_wep3[co,i];
			temp_upgrade[co,vehicle]=veh_upgrade[co,i];
			temp_acc[co,vehicle]=veh_acc[co,i];
			temp_hp[co,vehicle]=veh_hp[co,i];
			temp_chaos[co,vehicle]=veh_chaos[co,i];
			temp_uid[co,vehicle]=veh_uid[co,i];
	    }
	}
	// Return here
	for(var i=1; i<=150; i++){
	    if (i<=vehicle){
	        veh_race[co,i]=temp_race[co,i];
	        veh_loc[co,i]=temp_loc[co,i];
	        veh_name[co,i]=temp_name[co,i];
	        veh_role[co,i]=temp_role[co,i];
	        veh_lid[co,i]=temp_lid[co,i];
	        veh_wid[co,i]=temp_wid[co,i];
	        veh_wep1[co,i]=temp_wep1[co,i];
	        veh_wep2[co,i]=temp_wep2[co,i];
	        veh_wep3[co,i]=temp_wep3[co,i];
	        veh_upgrade[co,i]=temp_upgrade[co,i];
	        veh_acc[co,i]=temp_acc[co,i];
	        veh_hp[co,i]=temp_hp[co,i];
	        veh_chaos[co,i]=temp_chaos[co,i];
	        veh_uid[co,i]=temp_uid[co,i];
	    }
	    if (i>vehicle){
	        veh_race[co,i]=0;
	        veh_loc[co,i]="";
	        veh_name[co,i]="";
	        veh_role[co,i]="";
	        veh_lid[co,i]=0;
	        veh_wid[co,i]=0;
	        veh_wep1[co,i]="";
	        veh_wep2[co,i]="";
	        veh_wep3[co,i]="";
	        veh_upgrade[co,i]="";
	        veh_acc[co,i]="";
	        veh_hp[co,i]=0;
	        veh_chaos[co,i]=0;
	        veh_uid[co,i]=0;
	    }
	}
}
