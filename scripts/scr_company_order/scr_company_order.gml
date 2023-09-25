function scr_company_order(company) {

	// company : company number
	// This sorts and crunches the marine variables for the company
	var co;co=company;

	var i, v;i=-1;v=0;

	var temp_vrace, temp_vloc, temp_vrole, temp_vwep1, temp_vwep2, temp_vup, temp_vhp, temp_vchaos, temp_vpilots, temp_vlid, temp_vwid;

	repeat(401){i+=1;
	    obj_ini.temp_struct[co,i] = {};
	    obj_ini.temp_race[co,i]=0;
	    obj_ini.temp_loc[co,i]="";
	    obj_ini.temp_name[co,i]="";
	    obj_ini.temp_role[co,i]="";
	    obj_ini.temp_lid[co,i]=0;
	    obj_ini.temp_bio[co,i]=0;
	    obj_ini.temp_wid[co,i]=0;
	    obj_ini.temp_wep1[co,i]="";
	    obj_ini.temp_wep2[co,i]="";
	    obj_ini.temp_armour[co,i]="";
	    obj_ini.temp_gear[co,i]="";
	    obj_ini.temp_mobi[co,i]="";
	    obj_ini.temp_hp[co,i]=100;
	    obj_ini.temp_chaos[co,i]=0;
	    obj_ini.temp_experience[co,i]=0;
	    obj_ini.temp_age[co,i]=0;
	    obj_ini.temp_spe[co,i]="";
	    obj_ini.temp_god[co,i]=0;
	}

	fill_temp_items = function(co, temp_slot, real_slot){
		obj_ini.temp_race[co,temp_slot]=obj_ini.race[co,real_slot];temp_loc[co,temp_slot]=loc[co,real_slot];temp_name[co,temp_slot]=name[co,real_slot];temp_role[co,temp_slot]=role[co,real_slot];temp_lid[co,temp_slot]=lid[co,real_slot];
	     temp_wid[co,temp_slot]=wid[co,real_slot];temp_wep1[co,temp_slot]=wep1[co,real_slot];temp_wep2[co,temp_slot]=wep2[co,real_slot];temp_armour[co,temp_slot]=armour[co,real_slot];temp_gear[co,temp_slot]=gear[co,real_slot];
	     temp_hp[co,temp_slot]=hp[co,real_slot];temp_chaos[co,temp_slot]=chaos[co,real_slot];temp_experience[co,temp_slot]=experience[co,real_slot];temp_age[co,temp_slot]=age[co,real_slot];
	     temp_mobi[co,temp_slot]=mobi[co,real_slot];temp_spe[co,temp_slot]=spe[co,real_slot];temp_god[co,temp_slot]=god[co,real_slot];temp_bio[co,temp_slot]=bio[co,real_slot];
	     obj_ini.temp_struct[co,temp_slot] = jsonify_marine_struct(co,real_slot);
		obj_ini.loc[co,real_slot]="";
		obj_ini.name[co,real_slot]="";
		obj_ini.wep1[co,real_slot]="";
		obj_ini.lid[co,real_slot]=0;
		obj_ini.role[co,real_slot]="";
		obj_ini.wid[co,real_slot]=0;
		obj_ini.wep2[co,real_slot]="";
		obj_ini.armour[co,real_slot]="";
		obj_ini.gear[co,real_slot]="";
		obj_ini.hp[co,real_slot]=0;
		obj_ini.chaos[co,real_slot]=0;
		obj_ini.experience[co,real_slot]=0;
		obj_ini.age[co,real_slot]=0;
		obj_ini.mobi[co,real_slot]="";
		obj_ini.TTRPG[co,real_slot]={};		 
	}

	for (i=1;i<11;i++;){
		if (array_contains(["Chapter Master", "Forge Master", "Master of Sanctity","Master of the Apothecarion","Chief "+string(role[100,17])], role[co,i])){
			v+=1;
			fill_temp_items(co,v,i);
	     }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,2]){v+=1;
			fill_temp_items(co,v,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,5]){v+=1;
	        fill_temp_items(co,v,i);
	    }
	}

	if (global.chapter_name!="Space Wolves") and (global.chapter_name!="Iron Hands"){
	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,14]){v+=1;
	        fill_temp_items(co,v,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=(string(role[100,14])+" Aspirant")){v+=1;
	        fill_temp_items(co,v,i);
	    }
	}}

	i=0;repeat(300){i+=1;
	    if (role[co,i]="Death Company"){
	        if (armour[co,i]="Tartaros") or (string_count("Terminator",armour[co,i])>0){v+=1;
	            fill_temp_items(co,v,i);
	        }
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,16]){v+=1;
	        fill_temp_items(co,v,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=(string(role[100,16])+" Aspirant")){v+=1;
	       fill_temp_items(co,v,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]="Techpriest"){v+=1;
	        fill_temp_items(co,v,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,15]){v+=1;
	        fill_temp_items(co,v,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=(string(role[100,15])+" Aspirant")){v+=1;
	        fill_temp_items(co,v,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,17]){v+=1;
	        fill_temp_items(co,v,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]="Codiciery"){v+=1;
	        fill_temp_items(co,v,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]="Lexicanum"){v+=1;
	        fill_temp_items(co,v,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=(string(role[100,17])+" Aspirant")){v+=1;
	        fill_temp_items(co,v,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]="Standard Bearer"){v+=1;
	        fill_temp_items(co,v,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=obj_ini.role[100,7]){v+=1;
	        fill_temp_items(co,v,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]="Death Company"){
	        if (string_count("Dreadnought",armour[co,i])>0){v+=1;
	            fill_temp_items(co,v,i);
	        }
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]="Death Company"){
	        if (string_count("Dreadnought",armour[co,i])=0) and (string_count("Terminator",armour[co,i])=0) and (armour[co,i]!="Tartaros"){v+=1;
	           fill_temp_items(co,v,i);
	        }
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,4]){v+=1;
	        fill_temp_items(co,v,i);
	    }
	}
	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,18]){v+=1;
	        fill_temp_items(co,v,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,3]){v+=1;
	        fill_temp_items(co,v,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,8]){v+=1;
	        fill_temp_items(co,v,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,10]){v+=1;
	        fill_temp_items(co,v,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,9]){v+=1;
	       fill_temp_items(co,v,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,12]){v+=1;
	        fill_temp_items(co,v,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]="Venerable "+string(role[100,6])){v+=1;
	        fill_temp_items(co,v,i);
	    }
	}

	i=0;repeat(300){i+=1;
	    if (role[co,i]=role[100,6]){v+=1;
	        fill_temp_items(co,v,i);
	    }
	}

	if (race[co,i]!=1){
	    i=0;repeat(300){i+=1;
	        if (role[co,i]="Skitarii"){v+=1;
	            fill_temp_items(co,v,i);
	        }
	    }
	    i=0;repeat(300){i+=1;
	        if (role[co,i]="Crusader"){v+=1;
	            fill_temp_items(co,v,i);
	        }
	    }
	    i=0;repeat(300){i+=1;
	        if (role[co,i]="Ranger"){v+=1;
	            fill_temp_items(co,v,i);
	        }
	    }
	    i=0;repeat(300){i+=1;
	        if (role[co,i]="Sister of Battle"){v+=1;
	            fill_temp_items(co,v,i);
	        }
	    }
	    i=0;repeat(300){i+=1;
	        if (role[co,i]="Sister Hospitaler"){v+=1;
	            fill_temp_items(co,v,i);
	        }
	    }
	    i=0;repeat(300){i+=1;
	        if (role[co,i]="Flash Git"){v+=1;
	            fill_temp_items(co,v,i);
	        }
	    }
	    i=0;repeat(300){i+=1;
	        if (role[co,i]="Ork Sniper"){v+=1;
	            fill_temp_items(co,v,i);
	        }
	    }
	}

	// Return here


	i=0;
	repeat(300){i+=1;
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

	}


}
