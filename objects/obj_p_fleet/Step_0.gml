ii_check-=1;

if (action!="") and (orbiting!=0){
    if (instance_exists(orbiting)){orbiting.present_fleet[1]-=1;}
    orbiting=0;
}

// STC Bonuses
if (obj_controller.stc_ships>=6) and (action_spd=128) then action_spd=160;

if (ii_check=0){ii_check=10;
    var ii;ii=0;ii+=capital_number;ii+=round((frigate_number/2));ii+=round((escort_number/4));
    if (ii<=1) then ii=1;image_index=ii;
    image_index=min(image_index,9);
}

if (global.load>0) and (sprite_index!=spr_fleet_tiny) then sprite_index=spr_fleet_tiny;

if (fix>-1) then fix-=1;
if (fix=0) and (action=""){var p;
    p=0;repeat(capital_number){p+=1;obj_ini.ship_location[capital_num[p]]=instance_nearest(x,y,obj_star).name;}
    p=0;repeat(frigate_number){p+=1;obj_ini.ship_location[frigate_num[p]]=instance_nearest(x,y,obj_star).name;}
    p=0;repeat(escort_number){p+=1;obj_ini.ship_location[escort_num[p]]=instance_nearest(x,y,obj_star).name;}
}


