if (ship == undefined) {
	instance_destroy();	
}

action="";
direction=0;

cooldown = array_create(ship.weapons,0);
sprite_index = get_ship_sprite(ship);


//if (obj_controller.stc_bonus[5]=5){armor_front=round(armor_front*1.1);armor_other=round(armor_other*1.1);}
//if (obj_controller.stc_bonus[6]=2){armor_front=round(armor_front*1.1);armor_other=round(armor_other*1.1);}


var i;i=0;
repeat(100){i+=1;
    if (obj_ini.role[0,i]="Chapter Master" && obj_ini.lid[0,i]=ship) { // If the chapter master has another role name, would he be detected here??
		master_present=1;
		obj_fleet.control=1;
	}
}


var co,i,b;
co=-1;i=0;b=0;
repeat(11){co+=1;i=0;
    repeat(300){i+=1;
        if (obj_ini.lid[co,i]==ship){ //and (obj_ini.age[co,i] != floor(obj_ini.age[co,i])
            b+=1;
			board_co[b]=co;
			board_id[b]=i;
			board_location[b]=0;
			boarders+=1;
            // Loc 0: on origin ship
            // Loc 1: in transit
            // Loc >1: (instance_id), on enemy vessel 
        }
    }
}

if (boarders>0){
    if (obj_controller.command_set[25]=1) then board_capital=true;
    if (obj_controller.command_set[26]=1) then board_frigate=true;
}


