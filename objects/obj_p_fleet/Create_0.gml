
owner  = eFACTION.Player;
capital_number=0;
frigate_number=0;
escort_number=0;
selected=0;
orbiting=0;
ii_check=choose(8,9,10,11,12);

var wop;wop=instance_nearest(x,y,obj_star);
if (instance_exists(wop)) and (y>0) and (x>0){
    if (point_distance(x,y,wop.x,wop.y)<=40){
        orbiting=wop;wop.present_fleet[1]+=1;
    }
}


image_xscale=1.25;image_yscale=1.25;

var i;i=-1;
repeat(50){i+=1;
    capital[i]="";capital_num[i]=0;capital_sel[i]=1;capital_uid[i]=0;
}

var i;i=-1;
repeat(100){i+=1;
    frigate[i]="";frigate_num[i]=0;frigate_sel[i]=1;frigate_uid[i]=0;
}

var i;i=-1;
repeat(100){i+=1;
    escort[i]="";escort_num[i]=0;escort_sel[i]=1;escort_uid[i]=0;
}

image_speed=0;

fix=2;

capital_health=100;
frigate_health=100;
escort_health=100;


action="";
action_x=0;
action_y=0;
action_spd=128;
action_eta=0;
connected=0;
acted=0;
hurssy=0;
hurssy_time=0;
