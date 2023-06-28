function scr_add_vehicle(argument0, argument1, argument2, argument3, argument4, argument5) {

	// argument0 = type
	// argument1 = company
	// argument2 = weapon1
	// argument3 = weapon2
	// argument4 = weapon3
	// argument5 = upgrade



	// That should be sufficient to add stuff in a highly modifiable fashion


	var i,good, wep1, wep2, gear, arm, e, missing;
	i=0;e=0;good=0;wep1="";wep2="";gear="";arm="";missing=0;

	repeat(150){i+=1;if (good=0){if (obj_ini.veh_role[argument1,i]="") then good=i;}}


	if (good!=0){
	    obj_ini.veh_race[argument1,good]=1;

	    if (obj_ini.fleet_type=1){obj_ini.veh_loc[argument1,good]=obj_ini.home_name;obj_ini.veh_wid[argument1,good]=2;obj_ini.veh_lid[argument1,good]=0;}
    
	    if (obj_ini.fleet_type!=1){// Need a more elaborate ship_carrying += here for the different types of units
	        var first,backup;first=0;backup=0;i=0;
	        repeat(30){i+=1;
	            if (obj_ini.ship_class[i]="Battle Barge") and (first=0) and (obj_ini.ship_capacity[i]>obj_ini.ship_carrying[i]) then first=i;
	            if (obj_ini.ship_class[i]="Strike Cruiser") and (backup=0) and (obj_ini.ship_capacity[i]>obj_ini.ship_carrying[i]) then backup=i;
	        }
	        if (first!=0){
	            obj_ini.veh_lid[argument1,good]=first;obj_ini.veh_loc[argument1,good]=obj_ini.ship_location[first];
	            obj_ini.veh_wid[argument1,good]=0;obj_ini.ship_carrying[first]+=1;
	        }
	        if (first=0) and (backup!=0){
	            obj_ini.veh_lid[argument1,good]=backup;obj_ini.veh_loc[argument1,good]=obj_ini.ship_location[backup];
	            obj_ini.veh_wid[argument1,good]=0;obj_ini.ship_carrying[backup]+=1;
	        }
	        if (first=0) and (backup=0){
	            obj_ini.veh_lid[argument1,good]=0;obj_ini.veh_loc[argument1,good]="";obj_ini.veh_wid[argument1,good]=0;exit;
	        }
    
	    }
    
    
    
    
    
    
    
    
	    obj_ini.veh_role[argument1,good]=argument0;
    
	    if (argument2!="standard") then obj_ini.veh_wep1[argument1,good]=argument2;
	    if (argument3!="standard") then obj_ini.veh_wep2[argument1,good]=argument3;
	    if (argument5!="standard") then obj_ini.veh_upgrade[argument1,good]=argument5;
    
	    if (argument2="standard") and (argument3="standard") and (argument4="standard"){
	        if (argument0="Rhino"){obj_ini.veh_wep1[argument1,good]="Heavy Bolters";obj_ini.veh_wep2[argument1,good]="Storm Bolter";obj_ini.veh_upgrade[argument1,good]="Dozer Blades";}
	        if (argument0="Whirlwind"){obj_ini.veh_wep1[argument1,good]="Whirlwind Missiles";obj_ini.veh_wep2[argument1,good]="Storm Bolter";obj_ini.veh_upgrade[argument1,good]="";}
	        if (argument0="Predator"){
	            var randumb;randumb=choose(1,2,2)obj_ini.veh_upgrade[argument1,good]="Dozer Blades";
	            if (randumb=1){obj_ini.veh_wep1[argument1,good]="Autocannon";obj_ini.veh_wep2[argument1,good]="Heavy Bolters";}
	            if (randumb=2){obj_ini.veh_wep1[argument1,good]="Lascannon";obj_ini.veh_wep2[argument1,good]="Lascannons";}
	        }
	        if (argument0="Land Raider"){obj_ini.veh_wep1[argument1,good]="Twin Linked Heavy Bolter";obj_ini.veh_wep2[argument1,good]="Twin Linked Lascannon";obj_ini.veh_upgrade[argument1,good]="";}
	        if (argument0="Land Speeder"){obj_ini.veh_wep1[argument1,good]="Heavy Bolter";obj_ini.veh_wep2[argument1,good]="";obj_ini.veh_upgrade[argument1,good]="";}
	    }
    
	    obj_ini.veh_hp[argument1,good]=100;
	    obj_ini.veh_chaos[argument1,good]=0;
	    obj_ini.veh_pilots[argument1,good]=0;
	}


}
