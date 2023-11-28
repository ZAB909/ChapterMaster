function scr_ship_occupants(argument0) {

	// Argument0: ship ID

	var co,i,oc,ocn,ty,g,good,blur;
	co=-1;i=-1;ty=0;g=0;good=0;blur="";

	repeat(200){i+=1;oc[i]="";ocn[i]=0;}

	i=0;
	repeat(obj_ini.companies+1){i=0;co+=1;
	    repeat(500){i+=1;
	        // show_message(string(obj_ini.role[co][i])+"/"+string(co)+"/"+string(i));
	        // show_message(string(obj_ini.lid[co][i])+"/"+string(co)+"/"+string(i));
	        if (obj_ini.role[co][i]!="") and (obj_ini.lid[co][i]=argument0){
	            good=0;g=0;
	            repeat(100){g+=1;
	                if (good=0){
	                    if (oc[g]=obj_ini.role[co][i]){good=1;ocn[g]+=1;}
	                }
	            }
	            if (good=0){
	                ty+=1;oc[ty]=obj_ini.role[co][i];ocn[ty]=1;good=1;
	            }
	        }
	    }
	}
	i=0;co=-1;
	repeat(obj_ini.companies+1){i=0;co+=1;
	    repeat(100){i+=1;
	        if (obj_ini.veh_role[co][i]!="") and (obj_ini.veh_lid[co][i]=argument0){
	            good=0;g=0;
	            repeat(100){g+=1;
	                if (good=0){
	                    if (oc[g]=obj_ini.veh_role[co][i]){good=1;ocn[g]+=1;}
	                }
	            }
	            if (good=0){
	                ty+=1;oc[ty]=obj_ini.veh_role[co][i];ocn[ty]=1;good=1;
	            }
	        }
	    }
	}



	i=0;good=1;
	repeat(100){i+=1;
	    if (good=1){
	        if (ocn[i]=1) then blur+=string(ocn[i])+"x "+string(oc[i]);
	        if (ocn[i]>1) then blur+=string(ocn[i])+"x "+string(oc[i])+"s";
	        if (ocn[i+1]>0) then blur+=", ";
	        if (ocn[i+1]=0){blur+=".";good=0;}
	    }
	}

	return(blur);


}
