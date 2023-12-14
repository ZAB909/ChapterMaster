function scr_master_loc() {

	var lick,good;lick="";good=true;

	var co, v;
	co=0;v=0;

	repeat(3600){
	    if (good=true){
	        if (co<11){v+=1;
	            if (v>300){co+=1;v=1;/*show_message("mahreens at the start of company "+string(co)+" is equal to "+string(info_mahreens));*/}
	            if (co>10) then good=false;
	            if (good=true){
	                if (obj_ini.role[co][v]="Chapter Master"){
	                    if (obj_ini.wid[co][v]>0) and (obj_ini.lid[co][v]<=0) then lick=string(obj_ini.loc[co][v])+"."+string(obj_ini.wid[co][v]);
	                    if (obj_ini.wid[co][v]<=0) and (obj_ini.lid[co][v]>0) then lick=string(obj_ini.ship[obj_ini.lid[co][v]]);
	                    if (lick!=""){return(lick);good=false;}
	                }
	            }
	        }
	    }
	}





}
