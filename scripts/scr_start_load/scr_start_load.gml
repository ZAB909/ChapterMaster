function scr_start_load(argument0, argument1, argument2) {

	// argument0: the fleet object
	// argument1: star object
	// argument2: 1 for including escorts, 2 for no escorts

	// this distributes the marines and vehicles to the correct ships if the chapter is fleet-based

	/*
	battle_barges
	strike_cruisers
	gladius
	hunters
	*/



	var splinter,com,ey,remove_size,company_size,shiyp,shiyp_size,companies_loaded;
	splinter=0;com=-1;ey=0;remove_size=0;company_size=0;shiyp=1;shiyp_size=obj_ini.ship_size[shiyp];companies_loaded=1;
	if (string_count("Splinter",obj_ini.strin2)>0) then splinter=1;



	repeat(2){com+=1;ey=0;
	    repeat(500){ey+=1;
	        if (obj_ini.role[com,ey]!=""){
	            if (obj_ini.ship_size[shiyp]<3){
	                var n_size;n_size=1;
	                if (obj_ini.armor[com,ey]="Terminator Armor") then n_size+=1;
	                if (obj_ini.armor[com,ey]="Tartaros") then n_size+=1;
	                if (obj_ini.armor[com,ey]="Dreadnought") then n_size+=7;
	                if (obj_ini.role[com,ey]="Chapter Master") then n_size+=1;
            
	                if (obj_ini.ship_carrying[shiyp]+n_size>obj_ini.ship_capacity[shiyp]){
	                    remove_size+=company_size;
	                    obj_ini.ship_carrying[shiyp]+=company_size;
	                    obj_ini.man_size-=company_size;
	                    company_size=0;shiyp+=1;companies_loaded=1;
	                }
	            }
        
	            obj_ini.lid[com,ey]=shiyp;
	            // obj_ini.uid[com,ey]=obj_ini.ship_uid[shiyp];
	            obj_ini.wid[com,ey]=0;obj_ini.loc[com,ey]=obj_ini.ship_location[shiyp];
	            company_size+=1;
	            if (obj_ini.armor[com,ey]="Terminator Armor") then company_size+=1;
	            if (obj_ini.armor[com,ey]="Tartaros") then company_size+=1;
	            if (obj_ini.armor[com,ey]="Dreadnought") then company_size+=7;
	            // if (obj_ini.mobi[com,ey]="Jump Pack") then company_size+=1;
	            if (obj_ini.role[com,ey]="Chapter Master") then company_size+=1;
	        }
	    }
	    remove_size+=company_size;
	    obj_ini.ship_carrying[shiyp]+=company_size;
	    obj_ini.man_size-=company_size;
	    company_size=0;
	}

	// 1 BB, 6 CC, 10 escorts
	// Next up is third company

	var first_frigate,next_company,squeeze;next_company=1;squeeze=0;
	first_frigate=shiyp+1;

	repeat(20){
	    next_company+=1;squeeze=0;
    
	    if (next_company<=9){
        
	        if (next_company=2){
	            if (obj_ini.ship_size[1]=3){
	                shiyp=1;squeeze=1;
	            }
	        }
	        if (next_company>2){
	            squeeze=0;if (companies_loaded=1) and (obj_ini.ship_size[shiyp]>2) then squeeze=1;
	        }
        
        
	        if (squeeze=0){
	            shiyp+=1;com+=1;ey=0;company_size=0;companies_loaded=1;
	            repeat(500){ey+=1;
	                if (obj_ini.role[com,ey]!=""){
	                    obj_ini.lid[com,ey]=shiyp;
	                    // obj_ini.uid[com,ey]=obj_ini.ship_uid[shiyp];
	                    obj_ini.wid[com,ey]=0;obj_ini.loc[com,ey]=obj_ini.ship_location[shiyp];
	                    company_size+=1;
	                    if (obj_ini.armor[com,ey]="Terminator Armor") then company_size+=1;
	                    if (obj_ini.armor[com,ey]="Tartaros") then company_size+=1;
	                    if (obj_ini.armor[com,ey]="Dreadnought") then company_size+=7;
	                    // if (obj_ini.mobi[com,ey]="Jump Pack") then company_size+=1;
	                }
	            }
	            remove_size+=company_size;
	            obj_ini.ship_carrying[shiyp]=company_size;
	            obj_ini.man_size-=company_size;
	            company_size=0;
	        }
	        if (squeeze=1){
	            com+=1;ey=0;company_size=0;companies_loaded=2;
	            repeat(500){ey+=1;
	                if (obj_ini.role[com,ey]!=""){
	                    obj_ini.lid[com,ey]=shiyp;
	                    // obj_ini.uid[com,ey]=obj_ini.ship_uid[shiyp];
	                    obj_ini.wid[com,ey]=0;obj_ini.loc[com,ey]=obj_ini.ship_location[shiyp];
	                    company_size+=1;
	                    if (obj_ini.armor[com,ey]="Terminator Armor") then company_size+=1;
	                    if (obj_ini.armor[com,ey]="Tartaros") then company_size+=1;
	                    if (obj_ini.armor[com,ey]="Dreadnought") then company_size+=7;
	                    // if (obj_ini.mobi[com,ey]="Jump Pack") then company_size+=1;
	                }
	            }
	            remove_size+=company_size;
	            obj_ini.ship_carrying[shiyp]+=company_size;
	            obj_ini.man_size-=company_size;
	            company_size=0;
	        }
    
	    }
	}









	/*

	repeat(6){
	    shiyp+=1;com+=1;ey=0;company_size=0;
	    repeat(500){ey+=1;
	        if (obj_ini.role[com,ey]!=""){
	            obj_ini.lid[com,ey]=shiyp;
	            // obj_ini.uid[com,ey]=obj_ini.ship_uid[shiyp];
	            obj_ini.wid[com,ey]=0;obj_ini.loc[com,ey]=obj_ini.ship_location[shiyp];
	            company_size+=1;
	            if (obj_ini.armor[com,ey]="Terminator Armor") then company_size+=1;
	            if (obj_ini.armor[com,ey]="Tartaros") then company_size+=1;
	            if (obj_ini.armor[com,ey]="Dreadnought") then company_size+=7;
	            // if (obj_ini.mobi[com,ey]="Jump Pack") then company_size+=1;
	        }
	    }
	    remove_size+=company_size;
	    obj_ini.ship_carrying[shiyp]=company_size;
	    obj_ini.man_size-=company_size;
	    company_size=0;
	}
	*/
	// Last is 10th company
	// Squeeze them into whatever ships possible

	shiyp+=1;com=10;ey=0;company_size=0;

	var ns,ss;ns=0;ss=0;

	if (argument2=2){
	    repeat(20){ss+=1;
	        if (ns=0) and (obj_ini.ship_size[ss]>=2) and (obj_ini.ship_carrying[ss]=0) then ns=ss;
	    }
	}
	if (argument2!=2){
	    repeat(20){ss+=1;
	        if (ns=0) and (obj_ini.ship_size[ss]=1) and (obj_ini.ship_carrying[ss]=0) then ns=ss;
	    }
	    if (ns=0){ss=0;
	        repeat(20){ss+=1;
	            if (ns=0) and (obj_ini.ship_size[ss]>=2) and (obj_ini.ship_carrying[ss]=0) then ns=ss;
	        }
	    }
	}

	shiyp=ns;


	/*if (argument2=2) then shiyp=first_frigate;



	if (argument2!=2){
    
	    repeat(20){ss+=1;
	        if (ns=0) and (
	    }
	}*/

	repeat(500){ey+=1;
    
	    var mah_size;mah_size=0;
	    if (obj_ini.role[com,ey]!=""){
	        mah_size=1;company_size+=1;
        
	        if (obj_ini.armor[com,ey]="Terminator Armor"){company_size+=1;mah_size+=1;}
	        if (obj_ini.armor[com,ey]="Tartaros"){company_size+=1;mah_size+=1;}
	        if (obj_ini.armor[com,ey]="Dreadnought"){company_size+=7;mah_size+=7;}
	        // if (obj_ini.mobi[com,ey]="Jump Pack"){company_size+=1;mah_size+=1;}
        
	        if ((obj_ini.ship_carrying[shiyp]+mah_size)>obj_ini.ship_capacity[shiyp]) then shiyp+=1;
	        if ((obj_ini.ship_carrying[shiyp]+mah_size)<=obj_ini.ship_capacity[shiyp]){
	            obj_ini.lid[com,ey]=shiyp;
	            // obj_ini.uid[com,ey]=obj_ini.ship_uid[shiyp];
	            obj_ini.wid[com,ey]=0;obj_ini.loc[com,ey]=obj_ini.ship_location[shiyp];
	            obj_ini.ship_carrying[shiyp]+=mah_size;
	        }
	    }
	}
	remove_size+=company_size;
	obj_ini.man_size-=company_size;

	if (argument1.p_player[1]>0) then argument1.p_player[1]-=remove_size;
	if (argument1.p_player[2]>0) then argument1.p_player[2]-=remove_size;
	if (argument1.p_player[3]>0) then argument1.p_player[3]-=remove_size;
	if (argument1.p_player[4]>0) then argument1.p_player[4]-=remove_size;



	// Need some last bit here that throws the ships all over the place if splintered
	if (splinter=1){
	    var shipp;shipp=0;
    
	    with(obj_star){if (owner>3) then instance_deactivate_object(id);}
	    with(obj_star){if (name=obj_ini.home_name) then instance_deactivate_object(id);}
    
	    with(obj_p_fleet){
	        frigate_number=0;
	        escort_number=0;
        
	        var i;i=-1;
	        repeat(35){i+=1;
	            frigate[i]="";frigate_num[i]=0;frigate_sel[i]=1;
	        }
        
	        var i;i=-1;
	        repeat(35){i+=1;
	            escort[i]="";escort_num[i]=0;escort_sel[i]=1;
	        }
	    }
    
	    repeat(50){
	        if ((obj_ini.strike_cruisers+obj_ini.gladius+obj_ini.hunters)>shipp){
            
	            var x5,y5,targ,diss;
	            x5=random(room_width);
	            y5=random(room_height);
	            targ=instance_nearest(x5,y5,obj_star);
	            diss=9999;
            
	            if (instance_exists(obj_temp6)) then diss=point_distance(targ.x,targ.y,instance_nearest(targ.x,targ.y,obj_temp6).x,instance_nearest(targ.x,targ.y,obj_temp6).y);
	            if (diss>=200){instance_create(targ.x,targ.y,obj_temp6);with(targ){instance_deactivate_object(id);}}
	        }
	    }
    
	    instance_activate_object(obj_star);
	    with(obj_star){if (owner>3) then instance_deactivate_object(id);}
	    with(obj_star){if (name=obj_ini.home_name) then instance_deactivate_object(id);}
    
	    shipp=1;
	    repeat(obj_ini.strike_cruisers){
	        var flit,tagg;
	        tagg=0;flit=0;shipp+=1;
        
	        tagg=instance_nearest(random(room_width),random(room_height),obj_temp6);
	        flit=instance_create(tagg.x+24,tagg.y-24,obj_p_fleet);
	        flit.owner=1;flit.alarm[5]=5;
	        // with(instance_nearest(tagg.x,tagg.y,obj_temp6)){present_fleets=1;}
        
	        flit.frigate_number+=1;
	        flit.frigate[1]=obj_ini.ship[shipp];
	        flit.frigate_num[1]=shipp;
        
	        var new_event;new_event=instance_create(flit.x-8,flit.y,obj_star_event);new_event.col="green";
        
	        with(tagg){instance_destroy();}
	    }
    
	    repeat(obj_ini.gladius+obj_ini.hunters){
	        if (instance_exists(obj_temp6)) and (shipp<(obj_ini.gladius+obj_ini.hunters+obj_ini.strike_cruisers+1)){
	            var flit,tagg;
	            tagg=0;flit=0;shipp+=1;
            
	            tagg=instance_nearest(random(room_width),random(room_height),obj_temp6);
	            flit=instance_create(tagg.x+24,tagg.y-24,obj_p_fleet);
	            flit.owner=1;flit.alarm[5]=5;
	            // with(instance_nearest(tagg.x,tagg.y,obj_temp6)){present_fleets=1;}
            
	            flit.escort_number+=1;
	            flit.escort[1]=obj_ini.ship[shipp];
	            flit.escort_num[1]=shipp;
            
	            var new_event;new_event=instance_create(flit.x-8,flit.y,obj_star_event);new_event.col="green";
            
	            if (obj_ini.ship[shipp+1]!=""){
	                flit.escort_number+=1;
	                flit.escort[2]=obj_ini.ship[shipp+1];
	                flit.escort_num[2]=shipp+1;
	                shipp+=1;
	            }
            
	            with(tagg){instance_destroy();}
	        }
	    }
    
    
	    if (instance_exists(obj_star_event)){
	        obj_star_event.image_alpha=1;
	        obj_star_event.image_speed=1;
	    }
    
    
	    with(obj_temp6){instance_destroy();}
	    instance_activate_object(obj_star);
    
    
	    with(obj_p_fleet){var i;i=0;
	        if (capital_number>0) then obj_ini.ship_location[capital_num[1]]=instance_nearest(x,y,obj_star).name;
	        repeat(20){i+=1;
	            if (frigate_number>=i) and (i<=12) then obj_ini.ship_location[frigate_num[i]]=instance_nearest(x,y,obj_star).name;
	            if (escort_number>=i) and (i<=20) then obj_ini.ship_location[escort_num[i]]=instance_nearest(x,y,obj_star).name;
	        }
        
    
	    }
	}


}
