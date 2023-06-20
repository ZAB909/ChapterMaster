
ship_id=0;
master_present=0;
o_dist=0;

selected=0;
sel_x1=0;
sel_y1=0;
sel_x2=0;
sel_y2=0;

// if (x<0) then ship_id=2;

action="";paction="";
action_dis=0;
action_dir=0;
action_fac=0;
direction=0;
target=-50;
if (instance_exists(obj_en_ship)){target=instance_nearest(x,y,obj_en_ship);}

target_l=0;
target_r=0;
target_x=0;
target_y=0;

cooldown[0]=0;
cooldown[1]=0;
cooldown[2]=0;
cooldown[3]=0;
cooldown[4]=0;
cooldown[5]=0;
turret_cool=0;
shield_size=0;

board_capital=false;
board_frigate=false;

name="";
class="";
hp=0;
maxhp=0;
conditions="";
shields=1;
maxshields=1;
armor_front=0;
armor_other=0;
weapons=0;
turrets=0;
fighters=0;
bombers=0;
thunderhawks=0;
boarders=0;board_cooldown=0;

var i;i=-1;
repeat(8){i+=1;
    weapon[i]="";weapon_facing[i]="";weapon_cooldown[i]=0;weapon_hp[i]=0;weapon_dam[i]=0;weapon_ammo[i]=999;weapon_range[i]=0;weapon_minrange[i]=0;
}

i=-1;
repeat(2001){i+=1;
    board_co[i]=0;board_id[i]=0;board_location[i]=0;board_raft[i]=0;
}

action_set_alarm(1, 0);
