function scr_dead_marines(run) {

	// WeeeeeeEEEEEEEEEE~

	// If a ship has been destroyed this kills the fuck out relevant marines
	// Also checks for lost company standards, chapter master, and cleans up
	// the company arrays afterward.

	var i, company, shi, comp_length,clean;
	i=0;shi=999;

	if (run==1){
	    obj_controller.marines=0;
	    obj_controller.command=0;
	}



	i=0;
	var unit, squad;
	if (run == 1){
		for (company=0;company<11;company++){
			comp_length = array_length(obj_ini.name[company]);
			clean = true;
			for (i=1;i<comp_length;i++){
				if (obj_ini.name[company,i]!="") and ((ship_lost[obj_ini.lid[company,i]]>0) or (obj_ini.ship_hp[obj_ini.lid[company,i]]<=0)) and (obj_ini.lid[company,i]>0){
		            fallen+=1;
		            clean = false;

		            /*if (is_specialist(obj_ini.role[company,i])=true){
		                // obj_controller.marines+=1;
		                obj_controller.command-=1;
		            }*/

		            if (obj_ini.role[company,i]="Chapter Master"){
		            	obj_controller.alarm[7]=1;
		            	if (global.defeat<=1) then global.defeat=1;
		            }
		            if (obj_ini.wep1[company,i]="Company Standard") then scr_loyalty("Lost Standard","+");
		            if (obj_ini.wep2[company,i]="Company Standard") then scr_loyalty("Lost Standard","+");
		            unit = obj_ini.TTRPG[company,i];
		            unit.remove_from_squad();

		            obj_ini.race[company,i]=0;
		            obj_ini.loc[company,i]="";
		            obj_ini.name[company,i]="";
		            obj_ini.role[company,i]="";
		            obj_ini.wep1[company,i]="";
		            obj_ini.lid[company,i]=0;
		            obj_ini.wep2[company,i]="";
		            obj_ini.armour[company,i]="";
		            obj_ini.gear[company,i]="";
		            obj_ini.hp[company,i]=100;
		            obj_ini.chaos[company,i]=0;
		            obj_ini.experience[company,i]=0;
		            obj_ini.mobi[company,i]="";
		            obj_ini.age[company,i]=0;
		            obj_ini.spe[company,i]="";
		            obj_ini.god[company,i]=0;
		            obj_ini.bio[company,i]=0;
		            obj_ini.TTRPG[company,i]=new TTRPG_stats("chapter",company,i, "blank");// obj_controller.marines-=1;
		        }

		        if (obj_ini.name[company,i]!="") and (obj_ini.role[company,i]!="") and (obj_ini.race[company,i]=1){
		            if (is_specialist(obj_ini.role[company,i])=false) then obj_controller.marines+=1
		            else obj_controller.command+=1;
		        }

		        if (i<120){
		            if (obj_ini.veh_role[company,i]!="") and ((ship_lost[obj_ini.veh_lid[company,i]]>0) or (obj_ini.ship_hp[obj_ini.veh_lid[company,i]]<=0)) and (obj_ini.veh_lid[company,i]>0){
		                clean = false;
		                obj_ini.veh_race[company,i]=0;
		                obj_ini.veh_loc[company,i]="";
		                obj_ini.veh_name[company,i]="";
		                obj_ini.veh_role[company,i]="";
		                obj_ini.veh_wep1[company,i]="";
		                obj_ini.veh_wep2[company,i]="";
		                obj_ini.veh_wep3[company,i]="";
		                obj_ini.veh_upgrade[company,i]="";
		                obj_ini.veh_acc[company,i]="";
		                obj_ini.veh_hp[company,i]=100;
		                obj_ini.veh_chaos[company,i]=0;
		                obj_ini.veh_pilots[company,i]=0;
		                obj_ini.veh_lid[company,i]=0;
		            }
		        }
			}
			if (clean == false){
				with(obj_ini){scr_company_order(company);scr_vehicle_order(company);}
			}
		}
	}
}
