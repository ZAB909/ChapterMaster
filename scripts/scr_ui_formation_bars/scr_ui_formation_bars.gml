// Creates the formation bars and draws them according to their designated type (infantry and vehicles)
function scr_ui_formation_bars() {
	var x9,y9,bar=0,ii=0,nbar=0,abar=0,fo=formating,te=4700;

	x9=__view_get( e__VW.XView, 0 )+49;
	y9=__view_get( e__VW.YView, 0 )+224;

	with(obj_formation_bar){instance_destroy();}
	with(obj_temp8){instance_destroy();}
	
	for (bar = 1; bar <=10; bar++){
		te+=1;
		ii=0;
		temp[te]=0;
	    var cu=instance_create(x9,y9,obj_temp8);
		cu.col_parent=bar;
    
	    temp[te]=0;
		temp[te+100]=0;
    
		for(ii = 1; ii<=15; ii++){
			// Set up the infantry
	        if (ii=1) and (bat_comm_for[fo]=bar){
				nbar=instance_create(x9,y9+temp[te],obj_formation_bar);
	            nbar.size=2;
				nbar.height=nbar.size*47;
				if (temp[te]>0) then above_neighbor=abar;
				temp[te]+=nbar.height;
				abar=nbar;
				temp[te+100]+=nbar.size;
	            nbar.image_index=0;
				nbar.unit_type="HQ";
				nbar.unit_id=ii;
				nbar.col_parent=bar;
	        }
	        if (ii=2) and (bat_hono_for[fo]=bar){
				nbar=instance_create(x9,y9+temp[te],obj_formation_bar);
	            nbar.size=1;
				nbar.height=nbar.size*47;
				if (temp[te]>0) then above_neighbor=abar;
				temp[te]+=nbar.height;
				abar=nbar;
				temp[te+100]+=nbar.size;
	            nbar.image_index=1;
				nbar.unit_type="Hono";
				nbar.unit_id=ii;
				nbar.col_parent=bar;
	        }
	        if (ii=3) and (bat_libr_for[fo]=bar){nbar=instance_create(x9,y9+temp[te],obj_formation_bar);
	            nbar.size=1;
				nbar.height=nbar.size*47;
				if (temp[te]>0) then above_neighbor=abar;
				temp[te]+=nbar.height;
				abar=nbar;
				temp[te+100]+=nbar.size;
	            nbar.image_index=8;nbar.unit_type="Lib";
				nbar.unit_id=ii;
				nbar.col_parent=bar;
	        }
	        if (ii=4) and (bat_tech_for[fo]=bar){nbar=instance_create(x9,y9+temp[te],obj_formation_bar);
	            nbar.size=1;
				nbar.height=nbar.size*47;
				if (temp[te]>0) then above_neighbor=abar;
				temp[te]+=nbar.height;
				abar=nbar;
				temp[te+100]+=nbar.size;
	            nbar.image_index=9;
				nbar.unit_type="Tech";
				nbar.unit_id=ii;
				nbar.col_parent=bar;
	        }
	        if (ii=5) and (bat_term_for[fo]=bar){nbar=instance_create(x9,y9+temp[te],obj_formation_bar);
	            nbar.size=1;
				nbar.height=nbar.size*47;
				if (temp[te]>0) then above_neighbor=abar;
				temp[te]+=nbar.height;
				abar=nbar;
				temp[te+100]+=nbar.size;
	            nbar.image_index=10;
				nbar.unit_type="Term";
				nbar.unit_id=ii;
				nbar.col_parent=bar;
	        }
	        if (ii=6) and (bat_vete_for[fo]=bar){
				nbar=instance_create(x9,y9+temp[te],obj_formation_bar);
	            nbar.size=2;
				nbar.height=nbar.size*47;
				if (temp[te]>0) then above_neighbor=abar;
				temp[te]+=nbar.height;
				abar=nbar;
				temp[te+100]+=nbar.size;
	            nbar.image_index=6;
				nbar.unit_type="Veteran";
				nbar.unit_id=ii;
				nbar.col_parent=bar;
	        }
	        if (ii=7) and (bat_tact_for[fo]=bar){
				nbar=instance_create(x9,y9+temp[te],obj_formation_bar);
	            nbar.size=6;
				nbar.height=nbar.size*47;
				if (temp[te]>0) then above_neighbor=abar;
				temp[te]+=nbar.height;
				abar=nbar;
				temp[te+100]+=nbar.size;
	            nbar.image_index=3;
				nbar.unit_type="Tactical";
				nbar.unit_id=ii;
				nbar.col_parent=bar;
	        }
	        if (ii=8) and (bat_deva_for[fo]=bar){
				nbar=instance_create(x9,y9+temp[te],obj_formation_bar);
	            nbar.size=3;
				nbar.height=nbar.size*47;
				if (temp[te]>0) then above_neighbor=abar;
				temp[te]+=nbar.height;
				abar=nbar;
				temp[te+100]+=nbar.size;
	            nbar.image_index=2;
				nbar.unit_type="Devastator";
				nbar.unit_id=ii;
				nbar.col_parent=bar;
	        }
	        if (ii=9) and (bat_assa_for[fo]=bar){
				nbar=instance_create(x9,y9+temp[te],obj_formation_bar);
	            nbar.size=3;
				nbar.height=nbar.size*47;
				if (temp[te]>0) then above_neighbor=abar;
				temp[te]+=nbar.height;
				abar=nbar;
				temp[te+100]+=nbar.size;
	            nbar.image_index=5;
				nbar.unit_type="Assault";
				nbar.unit_id=ii;
				nbar.col_parent=bar;
	        }
	        if (ii=10) and (bat_scou_for[fo]=bar){
				nbar=instance_create(x9,y9+temp[te],obj_formation_bar);
	            nbar.size=1;
				nbar.height=nbar.size*47;
				if (temp[te]>0) then above_neighbor=abar;
				temp[te]+=nbar.height;
				abar=nbar;
				temp[te+100]+=nbar.size;
	            nbar.image_index=4;
				nbar.unit_type="Sco";
				nbar.unit_id=ii;
				nbar.col_parent=bar;
	        }
	        if (ii=11) and (bat_drea_for[fo]=bar){
				nbar=instance_create(x9,y9+temp[te],obj_formation_bar);
	            nbar.size=2;
				nbar.height=nbar.size*47;
				if (temp[te]>0) then above_neighbor=abar;
				temp[te]+=nbar.height;
				abar=nbar;
				temp[te+100]+=nbar.size;
	            nbar.image_index=11;
				nbar.unit_type="Dread";
				nbar.unit_id=ii;
				nbar.col_parent=bar;
	        }
	        if (ii=12) and (bat_hire_for[fo]=bar){
				nbar=instance_create(x9,y9+temp[te],obj_formation_bar);
	            nbar.size=1;
				nbar.height=nbar.size*47;
				if (temp[te]>0) then above_neighbor=abar;
				temp[te]+=nbar.height;
				abar=nbar;
				temp[te+100]+=nbar.size;
	            nbar.image_index=7;
				nbar.unit_type="???";
				nbar.unit_id=ii;
				nbar.col_parent=bar;
	        }
			// Set up the vehicles
	        if (bat_formation_type[fo]!=2){
	            if (ii=13) and (bat_rhin_for[fo]=bar){
					nbar=instance_create(x9,y9+temp[te],obj_formation_bar);
	                nbar.size=4;
					nbar.height=nbar.size*47;
					if (temp[te]>0) then above_neighbor=abar;
					temp[te]+=nbar.height;
					abar=nbar;
					temp[te+100]+=nbar.size;
	                nbar.image_index=12;
					nbar.unit_type="Rhino";
					nbar.unit_id=ii;
					nbar.col_parent=bar;
	            }
	            if (ii=14) and (bat_pred_for[fo]=bar){
					nbar=instance_create(x9,y9+temp[te],obj_formation_bar);
	                nbar.size=2;
					nbar.height=nbar.size*47;
					if (temp[te]>0) then above_neighbor=abar;
					temp[te]+=nbar.height;
					abar=nbar;
					temp[te+100]+=nbar.size;
	                nbar.image_index=13;
					nbar.unit_type="Predator";
					nbar.unit_id=ii;
					nbar.col_parent=bar;
	            }
	            if (ii=15) and (bat_land_for[fo]=bar){
					nbar=instance_create(x9,y9+temp[te],obj_formation_bar);
	                nbar.size=2;
					nbar.height=nbar.size*47;
					if (temp[te]>0) then above_neighbor=abar;
					temp[te]+=nbar.height;
					abar=nbar;
					temp[te+100]+=nbar.size;
	                nbar.image_index=14;
					nbar.unit_type="Land Raider";
					nbar.unit_id=ii;
					nbar.col_parent=bar;
	            }
	        }
        
	        if (instance_exists(nbar)){nbar.width=39;}
        
	        if (temp[4800+bar]>10){
	            bat_deva_for[bar]=1;
				bat_assa_for[bar]=4;
	            bat_tact_for[bar]=2;
				bat_vete_for[bar]=2;
	            bat_hire_for[bar]=3;
				bat_libr_for[bar]=3;
	            bat_comm_for[bar]=3;
				bat_tech_for[bar]=3;
	            bat_term_for[bar]=3;
				bat_hono_for[bar]=3;
	            bat_drea_for[bar]=5;
				bat_rhin_for[bar]=6;
	            bat_pred_for[bar]=7;
				bat_land_for[bar]=7;
	            bat_scou_for[bar]=1;
				bar_fix=1;
	        }
	    }
	    y9=__view_get( e__VW.YView, 0 )+224;x9+=50;
	}
}
