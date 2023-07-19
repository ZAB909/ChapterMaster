function scr_vehicle_order(argument0) {

	// argument0 : company number

	// This sorts and crunches the vehicle variables into order for that company
	// Once it's actually fucking working it should probably join the scr_company_order script in the Interface folder


	var co;co=argument0;

	var i, v;i=-1;v=0;
	var temp_race, temp_loc, temp_name, temp_role, temp_wep1, temp_lid, temp_wid, temp_wep1, temp_wep2, temp_armor, temp_gear, temp_hp, temp_chaos, temp_experience, temp_age, temp_uid;

	repeat(301){
	    i+=1;
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
	veh_race[company,v]=0;veh_loc[company,v]="";veh_name[company,v]="";veh_role[company,v]="";veh_wep1[company,v]="";veh_wep2[company,v]="";
	veh_upgrade[company,v]="";veh_hp[company,v]=100;veh_chaos[company,v]=0;veh_pilots[company,v]=0;veh_lid[company,i]=0;veh_wid[company,v]=2;
	*/

	i=0;repeat(150){i+=1;
	    if (veh_role[co,i]="Rhino"){v+=1;
	        temp_race[co,v]=veh_race[co,i];temp_loc[co,v]=veh_loc[co,i];temp_name[co,v]=veh_name[co,i];temp_role[co,v]=veh_role[co,i];temp_lid[co,v]=veh_lid[co,i];
	        temp_wid[co,v]=veh_wid[co,i];temp_wep1[co,v]=veh_wep1[co,i];temp_wep2[co,v]=veh_wep2[co,i];temp_wep3[co,v]=veh_wep3[co,i];temp_upgrade[co,v]=veh_upgrade[co,i];temp_acc[co,v]=veh_acc[co,i];temp_hp[co,v]=veh_hp[co,i];
	        temp_chaos[co,v]=veh_chaos[co,i];temp_uid[co,v]=veh_uid[co,i];
	    }
	}

	i=0;repeat(150){i+=1;
	    if (veh_role[co,i]="Predator"){v+=1;
					temp_race[co,v]=veh_race[co,i];temp_loc[co,v]=veh_loc[co,i];temp_name[co,v]=veh_name[co,i];temp_role[co,v]=veh_role[co,i];temp_lid[co,v]=veh_lid[co,i];
					temp_wid[co,v]=veh_wid[co,i];temp_wep1[co,v]=veh_wep1[co,i];temp_wep2[co,v]=veh_wep2[co,i];temp_wep3[co,v]=veh_wep3[co,i];temp_upgrade[co,v]=veh_upgrade[co,i];temp_acc[co,v]=veh_acc[co,i];temp_hp[co,v]=veh_hp[co,i];
					temp_chaos[co,v]=veh_chaos[co,i];temp_uid[co,v]=veh_uid[co,i];
	    }
	}

	i=0;repeat(150){i+=1;
	    if (veh_role[co,i]="Whirlwind"){v+=1;
					temp_race[co,v]=veh_race[co,i];temp_loc[co,v]=veh_loc[co,i];temp_name[co,v]=veh_name[co,i];temp_role[co,v]=veh_role[co,i];temp_lid[co,v]=veh_lid[co,i];
					temp_wid[co,v]=veh_wid[co,i];temp_wep1[co,v]=veh_wep1[co,i];temp_wep2[co,v]=veh_wep2[co,i];temp_wep3[co,v]=veh_wep3[co,i];temp_upgrade[co,v]=veh_upgrade[co,i];temp_acc[co,v]=veh_acc[co,i];temp_hp[co,v]=veh_hp[co,i];
					temp_chaos[co,v]=veh_chaos[co,i];temp_uid[co,v]=veh_uid[co,i];
	    }
	}

	i=0;repeat(150){i+=1;
	    if (veh_role[co,i]="Land Speeder"){v+=1;
					temp_race[co,v]=veh_race[co,i];temp_loc[co,v]=veh_loc[co,i];temp_name[co,v]=veh_name[co,i];temp_role[co,v]=veh_role[co,i];temp_lid[co,v]=veh_lid[co,i];
					temp_wid[co,v]=veh_wid[co,i];temp_wep1[co,v]=veh_wep1[co,i];temp_wep2[co,v]=veh_wep2[co,i];temp_wep3[co,v]=veh_wep3[co,i];temp_upgrade[co,v]=veh_upgrade[co,i];temp_acc[co,v]=veh_acc[co,i];temp_hp[co,v]=veh_hp[co,i];
					temp_chaos[co,v]=veh_chaos[co,i];temp_uid[co,v]=veh_uid[co,i];
	    }
	}

	i=0;repeat(150){i+=1;
	    if (veh_role[co,i]="Land Raider"){v+=1;
					temp_race[co,v]=veh_race[co,i];temp_loc[co,v]=veh_loc[co,i];temp_name[co,v]=veh_name[co,i];temp_role[co,v]=veh_role[co,i];temp_lid[co,v]=veh_lid[co,i];
					temp_wid[co,v]=veh_wid[co,i];temp_wep1[co,v]=veh_wep1[co,i];temp_wep2[co,v]=veh_wep2[co,i];temp_wep3[co,v]=veh_wep3[co,i];temp_upgrade[co,v]=veh_upgrade[co,i];temp_acc[co,v]=veh_acc[co,i];temp_hp[co,v]=veh_hp[co,i];
					temp_chaos[co,v]=veh_chaos[co,i];temp_uid[co,v]=veh_uid[co,i];
	    }
	}



	// Return here


	i=0;
	repeat(150){i+=1;
	    if (i<=v){
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
	    if (i>v){
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
