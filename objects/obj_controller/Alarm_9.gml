with(obj_p_fleet){
    var steh;steh=instance_nearest(x,y,obj_star);
    var b;b=0;
    repeat(4){b+=1;
        if (steh.p_first[b]<=5) and (steh.dispo[b]>-30) and (steh.dispo[b]<0) then steh.dispo[b]=min(obj_ini.imperium_disposition,obj_controller.disposition[2])+choose(-1,-2,-3,-4,0,1,2,3,4);
    }
    if (string_count("????|",steh.p_feature[1])>0)with(steh){{scr_planetary_feature(1);}}
    if (string_count("????|",steh.p_feature[2])>0)with(steh){{scr_planetary_feature(2);}}
    if (string_count("????|",steh.p_feature[3])>0)with(steh){{scr_planetary_feature(3);}}
    if (string_count("????|",steh.p_feature[4])>0)with(steh){{scr_planetary_feature(4);}}
}



// target_navy_number

with(obj_star){
    var o,sco;o=0;sco=0;
    
    repeat(4){o+=1;
        if (p_type[o]="Hive") then sco+=3;
        if (p_type[o]="Temperate") then sco+=1;
    }
    if (sco>=4) then instance_create(x,y,obj_temp_inq);
}

if (instance_number(obj_temp_inq)<target_navy_number){
    with(obj_temp_inq){instance_destroy();}
    with(obj_star){
        var o,sco;o=0;sco=0;
        
        repeat(4){o+=1;
            if (p_type[o]="Hive") then sco+=3;
            if (p_type[o]="Temperate") then sco+=1;
        }
        if (sco>=3) then instance_create(x,y,obj_temp_inq);
    }
}

repeat(30){
    if (instance_number(obj_temp_inq)>target_navy_number){
        var kebob;kebob=instance_nearest(random(room_width),random(room_height),obj_temp_inq);
        with(kebob){instance_destroy();}
    }
}

with(obj_temp_inq){
    var nav,ii;nav=instance_create(x+24,y-24,obj_en_fleet);
    nav.owner=2;nav.navy=1;ii=0;
    
    nav.capital_number=choose(1,2,3);
    nav.frigate_number=(nav.capital_number*2)+3;
	nav.escort_number=12;
	repeat(nav.capital_number) {
		array_push(nav.ships, new new_ship(get_random_capital(2)));
	}
	repeat(nav.frigate_number) {
		array_push(nav.ships, new new_ship(get_random_frigate(2)));
	}
	repeat(nav.escort_number) {
		array_push(nav.ships, new new_ship(get_random_escort(2)));
	}
	array_foreach(nav.ships, function(ship, index){
		ship.imp = 0;
		ship.max_imp = 0;
	});
    nav.home_x=x;nav.home_y=y;
    nav.orbiting=instance_nearest(x,y,obj_star);
    nav.orbiting.present_fleet[2]+=1;
    
    nav.image_speed=0;
    var ii;ii=0;ii+=nav.capital_number-1;ii+=round((nav.frigate_number/2));ii+=round((nav.escort_number/4));
    if (ii<=1) and (nav.capital_number+nav.frigate_number+nav.escort_number>0) then ii=1;
    nav.image_index=ii;
    instance_destroy();
}

with(obj_en_fleet){
	if (owner==2) {
		array_foreach(ships, function(ship, index){
			if (ship.size == SHIP_SIZE.capital) {
				ship.max_imp = (((floor(random(15))+1)*1000000)+15000000)*2;
			}
			else if (ship.size == SHIP_SIZE.frigate) {
				ship.max_imp = (500000+(floor(random(50))+1)*10000)*2;
			}
			else if (ship.size == SHIP_SIZE.escort) {
				ship.max_imp = 0;
			}
			ship.imp = ship.max_imp;
		});
	}
}




