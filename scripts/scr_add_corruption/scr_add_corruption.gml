function scr_add_corruption(is_fleet, modifier_type) {

	// is_fleet: fleet (true) or planet (false)
	// modifier_type: amount

	// Corrupts marines at the target location

	var i,c,shi,m,co,ide;
	i=capital_number+escort_number+frigate_number;
	c=0;shi=0;m=0;co=0;ide=0;

	if (is_fleet=true){
	    repeat(capital_number){
	        c+=1;shi=capital_num[c];co=0;ide=0;
	        if (obj_ini.ship_carrying[shi]>0) then repeat(3500){
	            if (co<10){ide+=1;
	                if (ide>=300){co+=1;ide=1;}
	                if (obj_ini.lid[co,ide]=shi){
	                    if (modifier_type="1d3") then obj_ini.TTRPG[co][ide].corruption+=choose(1,2,3);
	                }
	            }
	        }
	    }
	    repeat(frigate_number){
	        c+=1;shi=frigate_num[c];co=0;ide=0;
	        if (obj_ini.ship_carrying[shi]>0) then repeat(3500){
	            if (co<10){ide+=1;
	                if (ide>=300){co+=1;ide=1;}
	                if (obj_ini.lid[co,ide]=shi){
	                    if (modifier_type="1d3") then obj_ini.TTRPG[co][ide].corruption+=choose(1,2,3);
	                }
	            }
	        }
	    }
	    repeat(escort_number){
	        c+=1;shi=escort_num[c];co=0;ide=0;
	        if (obj_ini.ship_carrying[shi]>0) then repeat(3500){
	            if (co<10){ide+=1;
	                if (ide>=300){co+=1;ide=1;}
	                if (obj_ini.lid[co,ide]=shi){
	                    if (modifier_type="1d3") then obj_ini.TTRPG[co][ide].corruption+=choose(1,2,3);
	                }
	            }
	        }
	    }
	}


}
