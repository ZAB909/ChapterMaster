function scr_company_order(argument0) {

	// argument0 : company number
	// This sorts and crunches the marine variables for the company
	var co;co=argument0;

	var i, v;i=-1;v=0;
	var temp_race, temp_loc, temp_name, temp_role, temp_wep1, temp_lid, temp_wid, temp_wep1, temp_wep2, temp_armor, temp_gear, temp_mobi, temp_hp, temp_chaos, temp_experience, temp_age, temp_spe, temp_god, temp_uid;
	var temp_vrace, temp_vloc, temp_vrole, temp_vwep1, temp_vwep2, temp_vup, temp_vhp, temp_vchaos, temp_vpilots, temp_vlid, temp_vwid;

	/*
	veh_race[company,v]=1;veh_loc[company,v]=home_name;veh_role[company,v]="Rhino";veh_wep1[company,v]="Storm Bolter";veh_wep2[company,v]="Storm Bolter";
	veh_upgrade[company,v]="Dozer Blades";veh_hp[company,v]=100;veh_chaos[company,v]=0;veh_pilots[company,v]=0;veh_lid[company,v]=0;veh_wid[company,v]=2;
	*/


	/*repeat(201){i+=1;
	    temp_vrace[co,i]=0;
	    temp_vloc[co,i]="";
	    temp_vrole[co,i]="";
	    temp_vwep1[co,i]="";
	    temp_vwep2[co,i]="";
	    temp_vup[co,i]="";
	    temp_vhp[co,i]=0;
	    temp_vchaos[co,i]=0;
	    temp_vpilots[co,i]=0;
	    temp_vlid[co,i]=0;
	    temp_vwid[co,i]=0;
	}

	i=0;repeat(200){i+=1;
	    if (veh_role[co,i]="Land Raider"){v+=1;
	        temp_vrace[co,v]=veh_race[co,i];temp_vloc[co,v]=veh_loc[co,i];temp_vrole[co,v]=veh_role[co,i];temp_vlid[co,v]=veh_lid[co,i];
	        temp_vwid[co,v]=veh_wid[co,i];temp_vwep1[co,v]=veh_wep1[co,i];temp_vwep2[co,v]=veh_wep2[co,i];temp_vwep3[co,v]=veh_wep3[co,i];temp_vup[co,v]=veh_upgrade[co,i];temp_vacc[co,v]=veh_acc[co,i];
	        temp_vhp[co,v]=veh_hp[co,i];temp_vchaos[co,v]=veh_chaos[co,i];temp_bio[co,v]=bio[co,i];
	    }
	}
	i=0;repeat(200){i+=1;
	    if (veh_role[co,i]="Predator"){v+=1;
					temp_vrace[co,v]=veh_race[co,i];temp_vloc[co,v]=veh_loc[co,i];temp_vrole[co,v]=veh_role[co,i];temp_vlid[co,v]=veh_lid[co,i];
					temp_vwid[co,v]=veh_wid[co,i];temp_vwep1[co,v]=veh_wep1[co,i];temp_vwep2[co,v]=veh_wep2[co,i];temp_vwep3[co,v]=veh_wep3[co,i];temp_vup[co,v]=veh_upgrade[co,i];temp_vacc[co,v]=veh_acc[co,i];
					temp_vhp[co,v]=veh_hp[co,i];temp_vchaos[co,v]=veh_chaos[co,i];temp_bio[co,v]=bio[co,i];
	    }
	}
	i=0;repeat(200){i+=1;
	    if (veh_role[co,i]="Rhino"){v+=1;
					temp_vrace[co,v]=veh_race[co,i];temp_vloc[co,v]=veh_loc[co,i];temp_vrole[co,v]=veh_role[co,i];temp_vlid[co,v]=veh_lid[co,i];
					temp_vwid[co,v]=veh_wid[co,i];temp_vwep1[co,v]=veh_wep1[co,i];temp_vwep2[co,v]=veh_wep2[co,i];temp_vwep3[co,v]=veh_wep3[co,i];temp_vup[co,v]=veh_upgrade[co,i];temp_vacc[co,v]=veh_acc[co,i];
					temp_vhp[co,v]=veh_hp[co,i];temp_vchaos[co,v]=veh_chaos[co,i];temp_bio[co,v]=bio[co,i];
	    }
	}
	i=0;repeat(200){i+=1;
	    if (veh_role[co,i]="Land Speeder"){v+=1;
					temp_vrace[co,v]=veh_race[co,i];temp_vloc[co,v]=veh_loc[co,i];temp_vrole[co,v]=veh_role[co,i];temp_vlid[co,v]=veh_lid[co,i];
					temp_vwid[co,v]=veh_wid[co,i];temp_vwep1[co,v]=veh_wep1[co,i];temp_vwep2[co,v]=veh_wep2[co,i];temp_vwep3[co,v]=veh_wep3[co,i];temp_vup[co,v]=veh_upgrade[co,i];temp_vacc[co,v]=veh_acc[co,i];
					temp_vhp[co,v]=veh_hp[co,i];temp_vchaos[co,v]=veh_chaos[co,i];temp_bio[co,v]=bio[co,i];
	    }
	}
	i=0;repeat(200){i+=1;
	    if (veh_role[co,i]="Whirlwind"){v+=1;
					temp_vrace[co,v]=veh_race[co,i];temp_vloc[co,v]=veh_loc[co,i];temp_vrole[co,v]=veh_role[co,i];temp_vlid[co,v]=veh_lid[co,i];
						temp_vwid[co,v]=veh_wid[co,i];temp_vwep1[co,v]=veh_wep1[co,i];temp_vwep2[co,v]=veh_wep2[co,i];temp_vwep3[co,v]=veh_wep3[co,i];temp_vup[co,v]=veh_upgrade[co,i];temp_vacc[co,v]=veh_acc[co,i];
							temp_vhp[co,v]=veh_hp[co,i];temp_vchaos[co,v]=veh_chaos[co,i];temp_bio[co,v]=bio[co,i];
	    }
	}

	i=0;
	repeat(200){i+=1;
	    if (i<=v){
	        veh_race[co,i]=temp_vrace[co,i];
	        veh_loc[co,i]=temp_vloc[co,i];
	        veh_role[co,i]=temp_vrole[co,i];
	        veh_lid[co,i]=temp_vlid[co,i];
	        veh_wid[co,i]=temp_vwid[co,i];
	        veh_wep1[co,i]=temp_vwep1[co,i];
	        veh_wep2[co,i]=temp_vwep2[co,i];
	        veh_wep3[co,i]=temp_vwep3[co,i];
	        veh_upgrade[co,i]=temp_vup[co,i];
	        veh_acc[co,i]=temp_vacc[co,i];
	        veh_hp[co,i]=temp_vhp[co,i];
	        veh_chaos[co,i]=temp_vchaos[co,i];
	    }
	    if (i>v){
	        veh_race[co,i]=0;
	        veh_loc[co,i]="";
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
	    }
	}
	i=-1;v=0;
	*/




	repeat(401){i+=1;
	    temp_race[co,i]=0;
	    temp_loc[co,i]="";
	    temp_name[co,i]="";
	    temp_role[co,i]="";
	    temp_lid[co,i]=0;
	    temp_bio[co,i]=0;
	    temp_wid[co,i]=0;
	    temp_wep1[co,i]="";
	    temp_wep2[co,i]="";
	    temp_armor[co,i]="";
	    temp_gear[co,i]="";
	    temp_mobi[co,i]="";
	    temp_hp[co,i]=100;
	    temp_chaos[co,i]=0;
	    temp_experience[co,i]=0;
	    temp_age[co,i]=0;
	    temp_spe[co,i]="";
	    temp_god[co,i]=0;
	}



	i=0;repeat(10){i+=1;
	    if (role[co,i]="Chapter Master"){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	    }
	    if (role[co,i]="Forge Master"){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	    }
	    if (role[co,i]="Master of Sanctity"){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	    }
	    if (role[co,i]="Master of the Apothecarion"){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	    }
	    if (role[co,i]="Chief "+string(role[100,17])){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	    }
	}


	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,2]){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,5]){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	    }
	}

	if (global.chapter_name!="Space Wolves") and (global.chapter_name!="Iron Hands"){
	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,14]){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=(string(role[100,14])+" Aspirant")){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	    }
	}}

	i=0;repeat(300){i+=1;
	    if (role[co,i]="Death Company"){
	        if (armor[co,i]="Tartaros") or (string_count("Terminator",armor[co,i])>0){v+=1;
	            temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	            temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	            temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	            temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	        }
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,16]){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=(string(role[100,16])+" Aspirant")){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]="Techpriest"){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];temp_bio[co,v]=bio[co,i];
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,15]){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=(string(role[100,15])+" Aspirant")){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,17]){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]="Codiciery"){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]="Lexicanum"){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=(string(role[100,17])+" Aspirant")){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]="Standard Bearer"){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=obj_ini.role[100,7]){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]="Death Company"){
	        if (string_count("Dreadnought",armor[co,i])>0){v+=1;
	            temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	            temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	            temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	            temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	        }
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]="Death Company"){
	        if (string_count("Dreadnought",armor[co,i])=0) and (string_count("Terminator",armor[co,i])=0) and (armor[co,i]!="Tartaros"){v+=1;
	            temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	            temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	            temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	            temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	        }
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,4]){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,3]){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,8]){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,10]){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,9]){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,12]){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]="Venerable "+string(role[100,6])){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,6]){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	    }
	}

	if (race[co,i]!=1){
	    i=0;repeat(300){i+=1;
	        if (role[co,i]="Skitarii"){v+=1;
	            temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	            temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	            temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	            temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	        }
	    }
	    i=0;repeat(300){i+=1;
	        if (role[co,i]="Crusader"){v+=1;
	            temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	            temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	            temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	            temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	        }
	    }
	    i=0;repeat(300){i+=1;
	        if (role[co,i]="Ranger"){v+=1;
	            temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	            temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	            temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	            temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	        }
	    }
	    i=0;repeat(300){i+=1;
	        if (role[co,i]="Sister of Battle"){v+=1;
	            temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	            temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	            temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	            temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	        }
	    }
	    i=0;repeat(300){i+=1;
	        if (role[co,i]="Sister Hospitaler"){v+=1;
	            temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	            temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	            temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	            temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	        }
	    }
	    i=0;repeat(300){i+=1;
	        if (role[co,i]="Flash Git"){v+=1;
	            temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	            temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	            temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	            temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	        }
	    }
	    i=0;repeat(300){i+=1;
	        if (role[co,i]="Ork Sniper"){v+=1;
	            temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	            temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armor[co,v]=armor[co,i];temp_gear[co,v]=gear[co,i];
	            temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	            temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	        }
	    }
	}

	// Return here


	i=0;
	repeat(300){i+=1;
	    // if (i<=v){
	        race[co,i]=temp_race[co,i];
	        loc[co,i]=temp_loc[co,i];
	        name[co,i]=temp_name[co,i];
	        role[co,i]=temp_role[co,i];
	        lid[co,i]=temp_lid[co,i];
	        wid[co,i]=temp_wid[co,i];
	        wep1[co,i]=temp_wep1[co,i];
	        wep2[co,i]=temp_wep2[co,i];
	        armor[co,i]=temp_armor[co,i];
	        gear[co,i]=temp_gear[co,i];
	        mobi[co,i]=temp_mobi[co,i];
	        hp[co,i]=temp_hp[co,i];
	        chaos[co,i]=temp_chaos[co,i];
	        experience[co,i]=temp_experience[co,i];
	        age[co,i]=temp_age[co,i];
	        spe[co,i]=temp_spe[co,i];
	        god[co,i]=temp_god[co,i];
	        bio[co,i]=temp_bio[co,i];

	    /*}
	    if (i>v){
	        race[co,i]=0;
	        loc[co,i]="";
	        name[co,i]="";
	        role[co,i]="";
	        lid[co,i]=0;
	        bio[co,i]=0;
	        wid[co,i]=0;
	        wep1[co,i]="";
	        wep2[co,i]="";
	        armor[co,i]="";
	        gear[co,i]="";
	        mobi[co,i]="";
	        hp[co,i]=0;
	        chaos[co,i]=0;
	        experience[co,i]=0;
	        age[co,i]=0;
	        spe[co,i]="";
	        god[co,i]=0;
	    }*/
	}


}
