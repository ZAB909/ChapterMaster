
/*
enemy[2]=6;enemy_status[2]=1;
en_capital[2]=2;en_frigate[2]=3;en_escort[2]=5;
en_capital_max[2]=2;en_frigate_max[2]=3;en_escort_max[2]=5;
en_ships_max[2]=10;

enemy[3]=2;enemy_status[3]=1;
en_capital[3]=1;en_frigate[3]=2;en_escort[3]=3;
en_capital_max[3]=1;en_frigate_max[3]=2;en_escort_max[3]=3;
en_ships_max[3]=6;
*/

var total_enemies, total_allies, t, tt, y1, y2, fug, spawner;
total_enemies=0;
total_allies=1;
spawner=0;
t=0;y1=0;y2=0;tt=0;fug=0;

repeat(6){t+=1;
    if (enemy[t]!=0){
        if (enemy_status[t]<0) then total_enemies+=1;
        if (enemy_status[t]>0) then total_allies+=1;
        
        // show_message("Computer "+string(t)+":"+string(enemy[t])+", status:"+string(enemy_status[t]));
    }
}



if (total_enemies>0){
    t=1;y2=room_height/total_enemies/2;tt=0;
    repeat(5){fug+=1;
        if (enemy_status[fug]<0){
            tt+=1;y1=(t*y2);
            
            spawner=instance_create(room_width+200,y1,obj_fleet_spawner);
            spawner.owner=enemy[fug];
            spawner.height=(y2);
            spawner.number=fug;
            
            t+=2;
        }
    }
}

if (total_allies>0){
    t=0;y1=0;y2=0;tt=0;fug=0;
    t=1;y2=room_height/total_allies/2;tt=0;
    repeat(5){fug+=1;
        if (enemy_status[fug]>0){
            tt+=1;y1=(t*y2);
            
            spawner=instance_create(200,y1,obj_fleet_spawner);
            
            if (fug=1) then spawner.owner  = eFACTION.Player;
            if (fug>1) then spawner.owner=enemy[fug];// Get the ENEMY after the actual enemies
            
            spawner.height=(y2);
            spawner.number=fug;
            
            t+=2;
        }
    }
}


// show_message("Total Enemies: "+string(total_enemies));
// show_message("Total Allies: "+string(total_allies));


// Buffs here
// if (ambushers=1) or (enemy=8) then 
attack_mode="offensive";
// if (enemy=9) then attack_mode="defensive";

if (ambushers=1) and (ambushers=999) then global_attack=global_attack*1.1;// Need to finish this
if (bolter_drilling=1) then global_bolter=global_bolter*1.1;
// if (enemy_eldar=1) and (enemy=6){global_attack=global_attack*1.1;global_defense=global_defense*1.1;}
// if (enemy_fallen=1) and (enemy=10){global_attack=global_attack*1.1;global_defense=global_defense*1.1;}
// if (enemy_orks=1) and (enemy=7){global_attack=global_attack*1.1;global_defense=global_defense*1.1;}
// if (enemy_tau=1) and (enemy=8){global_attack=global_attack*1.1;global_defense=global_defense*1.1;}
// if (enemy_tyranids=1) and (enemy=10){global_attack=global_attack*1.1;global_defense=global_defense*1.1;}
if (siege=1) and (siege=555) then global_attack=global_attack*1.2;// Need to finish this
if (slow=1){global_attack=global_attack*0.9;global_defense=global_defense*1.2;}
if (melee=1) then global_melee=global_melee*1.15;
// 
if (shitty_luck=1) then global_defense=global_defense*0.9;
// if (lyman=1) and (dropping=1) then ||| handle within each object
if (ossmodula=1){global_attack=global_attack*0.95;global_defense=global_defense*0.95;}
if (betchers=1) then global_melee=global_melee*0.95;
if (catalepsean=1){global_attack=global_attack*0.95;}
// if (occulobe=1){if (time=5) or (time=6) then global_attack=global_attack*0.7;global_defense=global_defense*0.9;}

/*if (global.chapter_name="Dark Angels") or (obj_ini.main_color="Dark Green") then color_index=0;
if (global.chapter_name="White Scars") or (obj_ini.main_color="White") then color_index=1;
if (global.chapter_name="Space Wolves") or (obj_ini.main_color="Light Blue") then color_index=2;
if (global.chapter_name="Imperial Fists") or (obj_ini.main_color="Yellow") then color_index=3;
if (global.chapter_name="Blood Angels") or (obj_ini.main_color="Red") or (obj_ini.main_color="Dark Red") then color_index=4;
if (global.chapter_name="Iron Hands") then color_index=5;
if (global.chapter_name="Ultramarines") or (obj_ini.main_color="Blue") then color_index=6;
if (global.chapter_name="Salamanders") or (obj_ini.main_color="Green") then color_index=7;
if (global.chapter_name="Iron Hands") then color_index=7;
if (global.chapter_name="Black Templars") or (obj_ini.main_color="Black") then color_index=8;
if (global.chapter_name="Minotaurs") or (obj_ini.main_color="Brown") then color_index=9;
if (global.chapter_name="Soul Drinkers") or (obj_ini.main_color="Purple") then color_index=10;
if (global.chapter_name="Lamenters") then color_index=11;
if (global.chapter_name="Emperor's Nightmares") then color_index=12;
if (global.chapter_name="Angry Marines") then color_index=13;
if (global.chapter_name="Star Krakens") then color_index=14;
if (obj_ini.main_color="Pink") then color_index=15;*/





/*
global.chapter_name=5;
obj_ini.main_color=obj_creation.main_color;
obj_ini.secondary_color=obj_creation.secondary_color;
obj_ini.lens_color=obj_creation.lens_color;
obj_ini.weapon_color=obj_creation.weapon_color;
*/



// More prep for player

var i, k, onceh;i=0;k=0;onceh=0;

// instance_activate_object(obj_combat_info);

repeat(100){i+=1;
    if (fighting[i]=1) and (obj_ini.ship_class[i]!="") then ships_max+=1;
}



i=0;
repeat(100){i+=1;
    if (fighting[i]=1) and (obj_ini.ship[i]!="") and (obj_ini.ship_hp[i]>0){onceh=0;
        if (obj_ini.ship_size[i]=3) then capital+=1;
        if (obj_ini.ship_size[i]=2) then frigate+=1;
        if (obj_ini.ship_size[i]=1) then escort+=1;
        
        ship_class[i]=obj_ini.ship_class[i];
        ship[i]=obj_ini.ship[i];ship_id[i]=i;ship_size[i]=obj_ini.ship_size[i];
        ship_leadership[i]=100;ship_hp[i]=obj_ini.ship_hp[i];ship_maxhp[i]=obj_ini.ship_maxhp[i];
        ship_conditions[i]=obj_ini.ship_conditions[i];ship_speed[i]=obj_ini.ship_speed[i];ship_turning[i]=obj_ini.ship_turning[i];
        ship_front_armour[i]=obj_ini.ship_front_armour[i];ship_other_armour[i]=obj_ini.ship_other_armour[i];ship_weapons[i]=obj_ini.ship_weapons[i];
        
        var t;t=0;
        t+=1;ship_wep[i,t]=obj_ini.ship_wep[i,t];ship_wep_facing[i,t]=obj_ini.ship_wep_facing[i,t];ship_wep_condition[i,t]=obj_ini.ship_wep_condition[i,t];
        t+=1;ship_wep[i,t]=obj_ini.ship_wep[i,t];ship_wep_facing[i,t]=obj_ini.ship_wep_facing[i,t];ship_wep_condition[i,t]=obj_ini.ship_wep_condition[i,t];
        t+=1;ship_wep[i,t]=obj_ini.ship_wep[i,t];ship_wep_facing[i,t]=obj_ini.ship_wep_facing[i,t];ship_wep_condition[i,t]=obj_ini.ship_wep_condition[i,t];
        t+=1;ship_wep[i,t]=obj_ini.ship_wep[i,t];ship_wep_facing[i,t]=obj_ini.ship_wep_facing[i,t];ship_wep_condition[i,t]=obj_ini.ship_wep_condition[i,t];
        t+=1;ship_wep[i,t]=obj_ini.ship_wep[i,t];ship_wep_facing[i,t]=obj_ini.ship_wep_facing[i,t];ship_wep_condition[i,t]=obj_ini.ship_wep_condition[i,t];
        
        ship_capacity[i]=obj_ini.ship_capacity[i];ship_carrying[i]=obj_ini.ship_carrying[i];
        ship_contents[i]=obj_ini.ship_contents[i];ship_turrets[i]=obj_ini.ship_turrets[i];
    }
}

capital_max=capital;
frigate_max=frigate;
escort_max=escort;

obj_fleet_spawner.alarm[0]=1;


// alarm[1]=2;

/* */
/*  */
