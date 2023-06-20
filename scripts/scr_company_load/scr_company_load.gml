function scr_company_load(argument0) {

	// argument0: location
	// sh_name[i]="";sh_ide[i]=0;sh_class[i]="";sh_loc[i]="";sh_hp[i]="";sh_cargo[i]=0;sh_cargo_max[i]="";

	// Can't try to decipher this, too busy documenting code.
	// Much documentation, wow.

	/*
	repeat(100){ship[i]="";ship_owner[i]=0;ship_class[i]="";ship_size[i]=0;
	ship_leadership[i]=0;ship_hp[i]=0;ship_maxhp[i]=0;
	ship_conditions[i]="";ship_speed[i]=0;ship_turning[i]=0;
	ship_wep1[i]="";ship_wep1_facing[i]="";ship_wep1_condition[i]="";
	ship_wep2[i]="";ship_wep2_facing[i]="";ship_wep2_condition[i]="";
	ship_wep3[i]="";ship_wep3_facing[i]="";ship_wep3_condition[i]="";
	ship_wep4[i]="";ship_wep4_facing[i]="";ship_wep4_condition[i]="";
	ship_wep5[i]="";ship_wep5_facing[i]="";ship_wep5_condition[i]="";
	ship_capacity[i]=0;ship_carrying[i]=0;ship_contents[i]="";ship_turrets[i]=0;i+=1;}
	*/


	var i,s,temp;i=-1;s=0;temp=0;

	repeat(90){i+=1;
	    if (obj_ini.ship[i]!="") and (obj_ini.ship_location[i]=argument0){
	        s+=1;
	        sh_ide[s]=i;
	        sh_name[s]=obj_ini.ship[i];
	        sh_class[s]=obj_ini.ship_class[i];
	        sh_loc[s]=obj_ini.ship_location[i];
	        sh_uid[s]=obj_ini.ship_uid[i];
	        temp=round(obj_ini.ship_hp[i]/obj_ini.ship_maxhp[i])*100;
	        sh_hp[s]=string(temp)+"% HP";
	        sh_cargo[s]=obj_ini.ship_carrying[i];
	        sh_cargo_max[s]=obj_ini.ship_capacity[i];
	    }
	}

	ship_current=1;ship_max=s;ship_see=30;


}
