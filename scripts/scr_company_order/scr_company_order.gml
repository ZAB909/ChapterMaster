function scr_company_order(company) {

	// company : company number
	// This sorts and crunches the marine variables for the company
	var co;co=company;

	var i, v;i=-1;v=0;
	var temp_race, temp_loc, temp_name, temp_role, temp_wep1, temp_lid, temp_wid, temp_wep1, temp_wep2, temp_armour, temp_gear, temp_mobi, temp_hp, temp_chaos, temp_experience, temp_age, temp_spe, temp_god, temp_uid, temp_bio, temp_struct;
	var temp_vrace, temp_vloc, temp_vrole, temp_vwep1, temp_vwep2, temp_vup, temp_vhp, temp_vchaos, temp_vpilots, temp_vlid, temp_vwid;

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
	    temp_armour[co,i]="";
	    temp_gear[co,i]="";
	    temp_mobi[co,i]="";
	    temp_hp[co,i]=100;
	    temp_chaos[co,i]=0;
	    temp_experience[co,i]=0;
	    temp_age[co,i]=0;
	    temp_spe[co,i]="";
	    temp_god[co,i]=0;
		temp_struct[co,i]={};
	}



	i=0;repeat(10){i+=1;
	    if (role[co,i]="Chapter Master"){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];temp_struct[co,v]=jsonify_marine_struct(co,i);
	    }
	    if (role[co,i]="Forge Master"){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];temp_struct[co,v]=jsonify_marine_struct(co,i);
	    }
	    if (role[co,i]="Master of Sanctity"){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	        temp_struct[co,v]=jsonify_marine_struct(co,i);
	    }
	    if (role[co,i]="Master of the Apothecarion"){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	        temp_struct[co,v]=jsonify_marine_struct(co,i);
	    }
	    if (role[co,i]="Chief "+string(role[100,17])){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];
	        temp_struct[co,v]=jsonify_marine_struct(co,i);
	    }
	}


	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,2]){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];temp_struct[co,v]=jsonify_marine_struct(co,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,5]){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];temp_struct[co,v]=jsonify_marine_struct(co,i);
	    }
	}

	if (global.chapter_name!="Space Wolves") and (global.chapter_name!="Iron Hands"){
	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,14]){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];temp_struct[co,v]=jsonify_marine_struct(co,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=(string(role[100,14])+" Aspirant")){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];temp_struct[co,v]=jsonify_marine_struct(co,i);
	    }
	}}

	i=0;repeat(300){i+=1;
	    if (role[co,i]="Death Company"){
	        if (armour[co,i]="Tartaros") or (string_count("Terminator",armour[co,i])>0){v+=1;
	            temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	            temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	            temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	            temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];temp_struct[co,v]=jsonify_marine_struct(co,i);
	        }
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,16]){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];temp_struct[co,v]=jsonify_marine_struct(co,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=(string(role[100,16])+" Aspirant")){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];temp_struct[co,v]=jsonify_marine_struct(co,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]="Techpriest"){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];temp_bio[co,v]=bio[co,i];temp_struct[co,v]=jsonify_marine_struct(co,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,15]){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];temp_struct[co,v]=jsonify_marine_struct(co,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=(string(role[100,15])+" Aspirant")){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];temp_struct[co,v]=jsonify_marine_struct(co,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,17]){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];temp_struct[co,v]=jsonify_marine_struct(co,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]="Codiciery"){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];temp_struct[co,v]=jsonify_marine_struct(co,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]="Lexicanum"){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];temp_struct[co,v]=jsonify_marine_struct(co,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=(string(role[100,17])+" Aspirant")){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];temp_struct[co,v]=jsonify_marine_struct(co,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]="Standard Bearer"){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];temp_struct[co,v]=jsonify_marine_struct(co,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=obj_ini.role[100,7]){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];temp_struct[co,v]=jsonify_marine_struct(co,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]="Death Company"){
	        if (string_count("Dreadnought",armour[co,i])>0){v+=1;
	            temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	            temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	            temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	            temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];temp_struct[co,v]=jsonify_marine_struct(co,i);
	        }
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]="Death Company"){
	        if (string_count("Dreadnought",armour[co,i])=0) and (string_count("Terminator",armour[co,i])=0) and (armour[co,i]!="Tartaros"){v+=1;
	            temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	            temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	            temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	            temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];temp_struct[co,v]=jsonify_marine_struct(co,i);
	        }
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,4]){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];temp_struct[co,v]=jsonify_marine_struct(co,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,3]){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];temp_struct[co,v]=jsonify_marine_struct(co,i);
	    }
	}
	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,18]){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];temp_struct[co,v]=jsonify_marine_struct(co,i);
	    }
	}	

	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,8]){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];temp_struct[co,v]=jsonify_marine_struct(co,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,10]){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];temp_struct[co,v]=jsonify_marine_struct(co,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,9]){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];temp_struct[co,v]=jsonify_marine_struct(co,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,12]){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];temp_struct[co,v]=jsonify_marine_struct(co,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]="Venerable "+string(role[100,6])){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];temp_struct[co,v]=jsonify_marine_struct(co,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,6]){v+=1;
	        temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	        temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	        temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	        temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];temp_struct[co,v]=jsonify_marine_struct(co,i);
	    }
	}

	if (race[co,i]!=1){
	    i=0;repeat(300){i+=1;
	        if (role[co,i]="Skitarii"){v+=1;
	            temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	            temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	            temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	            temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];temp_struct[co,v]=jsonify_marine_struct(co,i);
	        }
	    }
	    i=0;repeat(300){i+=1;
	        if (role[co,i]="Crusader"){v+=1;
	            temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	            temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	            temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	            temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];temp_struct[co,v]=jsonify_marine_struct(co,i);
	        }
	    }
	    i=0;repeat(300){i+=1;
	        if (role[co,i]="Ranger"){v+=1;
	            temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	            temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	            temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	            temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];temp_struct[co,v]=jsonify_marine_struct(co,i);
	        }
	    }
	    i=0;repeat(300){i+=1;
	        if (role[co,i]="Sister of Battle"){v+=1;
	            temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	            temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	            temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	            temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];temp_struct[co,v]=jsonify_marine_struct(co,i);
	        }
	    }
	    i=0;repeat(300){i+=1;
	        if (role[co,i]="Sister Hospitaler"){v+=1;
	            temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	            temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	            temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	            temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];temp_struct[co,v]=jsonify_marine_struct(co,i);
	        }
	    }
	    i=0;repeat(300){i+=1;
	        if (role[co,i]="Flash Git"){v+=1;
	            temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	            temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	            temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	            temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];temp_struct[co,v]=jsonify_marine_struct(co,i);
	        }
	    }
	    i=0;repeat(300){i+=1;
	        if (role[co,i]="Ork Sniper"){v+=1;
	            temp_race[co,v]=race[co,i];temp_loc[co,v]=loc[co,i];temp_name[co,v]=name[co,i];temp_role[co,v]=role[co,i];temp_lid[co,v]=lid[co,i];
	            temp_wid[co,v]=wid[co,i];temp_wep1[co,v]=wep1[co,i];temp_wep2[co,v]=wep2[co,i];temp_armour[co,v]=armour[co,i];temp_gear[co,v]=gear[co,i];
	            temp_hp[co,v]=hp[co,i];temp_chaos[co,v]=chaos[co,i];temp_experience[co,v]=experience[co,i];temp_age[co,v]=age[co,i];
	            temp_mobi[co,v]=mobi[co,i];temp_spe[co,v]=spe[co,i];temp_god[co,v]=god[co,i];temp_bio[co,v]=bio[co,i];temp_struct[co,v]=jsonify_marine_struct(co,i);
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
	        armour[co,i]=temp_armour[co,i];
	        gear[co,i]=temp_gear[co,i];
	        mobi[co,i]=temp_mobi[co,i];
	        hp[co,i]=temp_hp[co,i];
	        chaos[co,i]=temp_chaos[co,i];
	        experience[co,i]=temp_experience[co,i];
	        age[co,i]=temp_age[co,i];
	        spe[co,i]=temp_spe[co,i];
	        god[co,i]=temp_god[co,i];
	        bio[co,i]=temp_bio[co,i];
			TTRPG[co,i] = new TTRPG_stats("chapter", co, i, "blank");
			if (is_string(temp_struct[co,i])){
				TTRPG[co,i].load_json_data(json_parse(temp_struct[co,i]));
				TTRPG[co,i].company = co;
				TTRPG[co,i].marine = i;
			}

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
	        armour[co,i]="";
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
