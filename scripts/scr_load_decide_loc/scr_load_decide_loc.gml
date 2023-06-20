function scr_load_decide_loc(argument0, argument1, argument2) {

	// argument0 = "unit role" or "ground" or "space"
	// argument1 = "unit role"
	// argument2 = vehicle?

	// This script determines the majory location of a particular unit type and then sets the selecting_location string to that

	var nope;nope=0;

	if (selecting_location!="") or (selecting_planet!=0) or (selecting_ship!=0) then nope=1;

	if (nope=0){
	    var sloc,sloc_num,slid,i,j,good,master_loc,sloc,swid,lloc;master_loc=0;sloc_num=0;slid=0;i=-1;j=0;good=0;sloc="";lloc="";swid=0;
    
	    repeat(100){i+=1;sloc[i]="";sloc_num[i]=0;slid[i]=0;swid[i]=0;}
	    i=0;j=0;
    
	    if (argument0="man"){
	        repeat(300){i+=1;lloc=ma_loc[i];if (ma_lid[i]>0) then lloc=obj_ini.ship[ma_lid[i]];
	            if (man[i]="man") and (ma_role[i]!="") and (ma_god[i]<10){
	                j=0;good=0;
                
	                repeat(90){j+=1;if (good=0){
	                    if (sloc[j]=lloc) and (swid[j]=ma_wid[i]){good=1;sloc_num[j]+=1;}
	                }}
	                if (good=0){j=0;repeat(90){j+=1;if (good=0){
	                    if (sloc[j]=""){good=1;sloc_num[j]=1;slid[j]=ma_lid[i];sloc[j]=lloc;swid[j]=ma_wid[i];}
	                }}}
	            }
	        }
	        j=0;repeat(90){j+=1;if (sloc[j]!="") and (sloc_num[j]>sloc_num[master_loc]) then master_loc=j;}
	        selecting_location=sloc[master_loc];selecting_planet=swid[master_loc];selecting_ship=slid[master_loc];
	    }
	    i=0;j=0;
    
	    if (argument0="vehicle"){
	        repeat(300){i+=1;lloc=ma_loc[i];if (ma_lid[i]>0) then lloc=obj_ini.ship[ma_lid[i]];
	            if (man[i]="vehicle") and (ma_role[i]!=""){
	                j=0;good=0;
                
	                repeat(90){j+=1;if (good=0){
	                    if (sloc[j]=lloc) and (swid[j]=ma_wid[i]){good=1;sloc_num[j]+=1;}
	                }}
	                if (good=0){j=0;repeat(90){j+=1;if (good=0){
	                    if (sloc[j]=""){good=1;sloc_num[j]=1;slid[j]=ma_lid[i];sloc[j]=lloc;swid[j]=ma_wid[i];}
	                }}}
	            }
	        }
	        j=0;repeat(90){j+=1;if (sloc[j]!="") and (sloc_num[j]>sloc_num[master_loc]) then master_loc=j;}
	        selecting_location=sloc[master_loc];selecting_planet=swid[master_loc];selecting_ship=slid[master_loc];
	    }
	    i=0;j=0;
    
	    if (argument0="command"){
	        repeat(100){i+=1;lloc=ma_loc[i];if (ma_lid[i]>0) then lloc=obj_ini.ship[ma_lid[i]];
	            if (man[i]="man") and (ma_god[i]<10){
	                if (ma_role[i]=obj_ini.role[100,5]) or (ma_role[i]=obj_ini.role[100,14]) or (ma_role[i]=obj_ini.role[100,15]) or (ma_role[i]="Standard Bearer") or (ma_role[i]="Company Champion") or (ma_role[i]="Champion"){
	                    j=0;good=0;
	                    repeat(90){j+=1;if (good=0){
	                        if (sloc[j]=lloc) and (swid[j]=ma_wid[i]){good=1;sloc_num[j]+=1;}
	                    }}
	                    if (good=0){j=0;repeat(90){j+=1;if (good=0){
	                        if (sloc[j]=""){good=1;sloc_num[j]=1;slid[j]=ma_lid[i];sloc[j]=lloc;swid[j]=ma_wid[i];}
	                    }}}
	                }
	            }
	        }
	        j=0;repeat(90){j+=1;if (sloc[j]!="") and (sloc_num[j]>sloc_num[master_loc]) then master_loc=j;}
	        selecting_location=sloc[master_loc];selecting_planet=swid[master_loc];selecting_ship=slid[master_loc];
	    }
	    i=0;j=0;
    
	    if (argument0="unit role") and (argument2=false){
	        repeat(300){i+=1;lloc=ma_loc[i];if (ma_lid[i]>0) then lloc=obj_ini.ship[ma_lid[i]];
	            if (man[i]="man") and (ma_role[i]=argument1) and (ma_god[i]<10){
	                j=0;good=0;
                
	                repeat(90){j+=1;if (good=0){
	                    if (sloc[j]=lloc) and (swid[j]=ma_wid[i]){good=1;sloc_num[j]+=1;}
	                }}
	                if (good=0){j=0;repeat(90){j+=1;if (good=0){
	                    if (sloc[j]=""){good=1;sloc_num[j]=1;slid[j]=ma_lid[i];sloc[j]=lloc;swid[j]=ma_wid[i];}
	                }}}
	            }
	        }
        
	        // show_message(string(sloc[1])+" x"+string(sloc_num[1])+", wid: "+string(swid[1]));
	        // show_message(string(sloc[2])+" x"+string(sloc_num[2])+", wid: "+string(swid[2]));
	        // show_message(string(sloc[3])+" x"+string(sloc_num[3])+", wid: "+string(swid[3]));
	        // show_message(string(sloc[4])+" x"+string(sloc_num[3])+", wid: "+string(swid[4]));
        
	        j=0;repeat(90){j+=1;if (sloc[j]!="") and (sloc_num[j]>sloc_num[master_loc]) then master_loc=j;}
	        selecting_location=sloc[master_loc];selecting_planet=swid[master_loc];selecting_ship=slid[master_loc];
	        // show_message(selecting_location);
	        // game_end();
	    }
	    i=0;j=0;
    
    
	    if (argument0="unit role") and (argument2=true){
	        repeat(300){i+=1;lloc=ma_loc[i];if (ma_lid[i]>0) then lloc=obj_ini.ship[ma_lid[i]];
	            if (man[i]="vehicle") and (ma_role[i]=argument1){
	                j=0;good=0;
                
	                repeat(90){j+=1;if (good=0){
	                    if (sloc[j]=lloc) and (swid[j]=ma_wid[i]){good=1;sloc_num[j]+=1;}
	                }}
	                if (good=0){j=0;repeat(90){j+=1;if (good=0){
	                    if (sloc[j]=""){good=1;sloc_num[j]=1;sloc[j]=lloc;swid[j]=ma_wid[i];}
	                }}}
	            }
	        }
	        j=0;repeat(90){j+=1;if (sloc[j]!="") and (sloc_num[j]>sloc_num[master_loc]) then master_loc=j;}
	        selecting_location=sloc[master_loc];selecting_planet=swid[master_loc];selecting_ship=slid[master_loc];
	    }
	    i=0;j=0;
    
    
	    if (selecting_ship>0) then sel_loading=selecting_ship;
    
	}


}
