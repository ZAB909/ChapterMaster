var total_enemies = array_length(enemy_fleets);
var total_allies = array_length(ally_fleets);
var t, tt, y1, y2, fug, spawner;
spawner=0;
t=0;y1=0;y2=0;tt=0;fug=0;



for(var i = 0; i < total_enemies; i++) {
	t=1;
	y2=room_height/total_enemies/2;
	tt=0;
	tt+=1;y1=(t*y2);
	spawner=instance_create(200,y1,obj_fleet_spawner);
	spawner.owner=enemy_fleets[i].owner;
	spawner.height=(y2);
	spawner.is_enemy = true;
	spawner.ships = enemy_fleets[i].ships;
	t+=2;
}

t=0;
y1=0;
y2=0;
tt=0;
fug=0;
t=1;
y2=room_height/total_allies/2;tt=0;
tt+=1;
y1=(t*y2);
spawner=instance_create(200,y1,obj_fleet_spawner);
spawner.owner=1;
spawner.height=(y2);
spawner.is_enemy = false;
spawner.ships = ships;

t+=2;
for(var i = 0; i < total_allies; i++) {
	fug += 1;
	tt += 1;
	y1 = (t*y2);
	spawner = instance_create(room_width+200,y1,obj_fleet_spawner);
	spawner.owner = ally_fleets[i].owner;
	spawner.height = (y2);
	spawner.is_enemy = false;
	spawner.ships = ally_fleets[i].ships;
	t += 2;
}


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

var i, k, onceh, company;i=0;k=0;onceh=0;

// instance_activate_object(obj_combat_info);


ships_max = array_length(ships)
capital_max=count_capitals(ships);
frigate_max=count_frigates(ships);
escort_max=count_escorts(ships);
capital=capital_max;
frigate=frigate_max
escort=escort_max;


obj_fleet_spawner.alarm[0]=1;


// alarm[1]=2;

/* */
/*  */
