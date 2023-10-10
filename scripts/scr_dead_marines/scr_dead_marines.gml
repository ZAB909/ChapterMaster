function scr_dead_marines(argument0) {

	// WeeeeeeEEEEEEEEEE~

	// If a ship has been destroyed this kills the fuck out relevant marines
	// Also checks for lost company standards, chapter master, and cleans up
	// the company arrays afterward.

	var i, cmp, shi;
	i=0;cmp=0;shi=999;


	var clean;i=-1;
	repeat(30){i+=1;clean[i]=0;}



	if (argument0=1){
	    obj_controller.marines=0;
	    obj_controller.command=0;
	}



	i=0;
	repeat(3300){
	    i+=1;

	    if (i>300){i=1;cmp+=1;}

	    if (cmp<11) and (i>0) and (i<=300) and (argument0=1){// Ran by obj_fleet to calculate the number of dead marines
	        if (obj_ini.name[cmp,i]!="") and ((ship_lost[obj_ini.lid[cmp,i]]>0) or (obj_ini.ship_hp[obj_ini.lid[cmp,i]]<=0)) and (obj_ini.lid[cmp,i]>0){
	            fallen+=1;clean[cmp]=1;

	            /*if (is_specialist(obj_ini.role[cmp,i])=true){
	                // obj_controller.marines+=1;
	                obj_controller.command-=1;
	            }*/

	            if (obj_ini.role[cmp,i]="Chapter Master"){obj_controller.alarm[7]=1;if (global.defeat<=1) then global.defeat=1;}
	            if (obj_ini.wep1[cmp,i]="Company Standard") then scr_loyalty("Lost Standard","+");
	            if (obj_ini.wep2[cmp,i]="Company Standard") then scr_loyalty("Lost Standard","+");

	            obj_ini.race[cmp,i]=0;obj_ini.loc[cmp,i]="";obj_ini.name[cmp,i]="";obj_ini.role[cmp,i]="";obj_ini.wep1[cmp,i]="";obj_ini.lid[cmp,i]=0;
	            obj_ini.wep2[cmp,i]="";obj_ini.armour[cmp,i]="";obj_ini.gear[cmp,i]="";obj_ini.hp[cmp,i]=100;obj_ini.chaos[cmp,i]=0;obj_ini.experience[cmp,i]=0;
	            obj_ini.mobi[cmp,i]="";obj_ini.age[cmp,i]=0;obj_ini.spe[cmp,i]="";obj_ini.god[cmp,i]=0;
	            obj_ini.bio[cmp,i]=0;obj_ini.TTRPG[cmp,i]=new TTRPG_stats("chapter",cmp,i, "blank");// obj_controller.marines-=1;
	        }

	        if (obj_ini.name[cmp,i]!="") and (obj_ini.role[cmp,i]!="") and (obj_ini.race[cmp,i]=1){
	            if (is_specialist(obj_ini.role[cmp,i])=false) then obj_controller.marines+=1
	            else obj_controller.command+=1;
	        }

	        if (i<120){
	            if (obj_ini.veh_role[cmp,i]!="") and ((ship_lost[obj_ini.veh_lid[cmp,i]]>0) or (obj_ini.ship_hp[obj_ini.veh_lid[cmp,i]]<=0)) and (obj_ini.veh_lid[cmp,i]>0){
	                clean[cmp]=1;
	                obj_ini.veh_race[cmp,i]=0;obj_ini.veh_loc[cmp,i]="";obj_ini.veh_name[cmp,i]="";obj_ini.veh_role[cmp,i]="";obj_ini.veh_wep1[cmp,i]="";obj_ini.veh_wep2[cmp,i]="";obj_ini.veh_wep3[cmp,i]="";
	                obj_ini.veh_upgrade[cmp,i]="";obj_ini.veh_acc[cmp,i]="";obj_ini.veh_hp[cmp,i]=100;obj_ini.veh_chaos[cmp,i]=0;obj_ini.veh_pilots[cmp,i]=0;obj_ini.veh_lid[cmp,i]=0;
	            }
	        }
	    }

	}


	i=-1;
	repeat(31){
	    i+=1;
	    if (i<=10) and (clean[i]=1){with(obj_ini){scr_company_order(i);scr_vehicle_order(i);}}
	}


}
