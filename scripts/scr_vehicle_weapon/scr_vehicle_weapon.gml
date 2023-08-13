function scr_vehicle_weapon(argument0, argument1) {

	// This is old code for the sprite-based ground combat.  Delete it if you like.





	// argument0 = name
	// argument 1 = weapon number

	var weep, class, diy, bull, stahp;weep=string(argument0);class="assault";diy=9999;bull=0;
	diy=point_distance(x,y,target[argument1].x,target[argument1].y);stahp=0;


	// Setting up


	var melee;melee=0;
	if (weep="Close Combat Weapon") then melee=1;if (weep="Chainaxe")then melee=1;
	if (weep="Combat Knife")then melee=1;if (weep="Force Weapon")then melee=1;
	if (weep="Thunder Hammer")then melee=1;if (weep="Power Sword")then melee=1;
	if (weep="Power Weapon")then melee=1;if (weep="Power Axe")then melee=1;
	if (weep="Power Fist")then melee=1;if (weep="Power Fists")then melee=1;
	if (melee=1) then wep_range[argument1]=max(target[argument1].sprite_width-8,target[argument1].sprite_height-8,sprite_height-8);



	if (wep[1]="Whirlwind Missiles") and (target[1].sprite_index=spr_tyr_tervigon) then stahp=1;



	if (diy>wep_range[argument1]) or (stahp=1) then weep="";



	var onceh;onceh=0;
	if (wep_clip[argument1]=0) and (weep!=""){onceh=1;
	    cooldown[argument1]=wep_reload[argument1]+random_range(-4,4);
	    wep_clip[argument1]=wep_clip_max[argument1];
	}
	if (wep_clip[argument1]>0) and (onceh=0) and (weep!=""){onceh=1;wep_clip[argument1]-=1;cooldown[argument1]=wep_cooldown[argument1];}



	if (weep!="") and (onceh=1) and (melee=0){
	    bull=instance_create(x,y,obj_p_bullet);
	    bull.direction=point_direction(x,y,target[argument1].x,target[argument1].y);
	    bull.dam=wep_dam[argument1];
	    bull.speed=bullet_spd[argument1];
	}



	// Direction of bullet
	if (onceh=1){
	if (weep="Autocannon") then bull.direction+=random_range(-6,6);
	if (weep="Bolt Pistol") or (weep="Storm Bolter") then bull.direction+=random_range(-8,8);
	if (weep="Bolter") or ((weep="Combiflamer") and (diy>=80)) then bull.direction+=random_range(-4,4);
	if (weep="Heavy Bolter") then bull.direction+=random_range(-6,6);
	if (weep="Lascannon") then bull.direction+=random_range(-2,2);
	if (weep="Whirlwind Missiles"){bull.target=target[argument1];bull.direction=70;}



	// Appearance
	if (bullet[argument1]="bolter"){bull.sprite_index=spr_bolt;bull.image_speed=0;bull.image_index=0;}
	if (bullet[argument1]="flamer"){with(bull){instance_destroy();bull=instance_create(x,y,obj_heavy_flamer);bull.direction=self.direction;}}
	if (bullet[argument1]="lascannon"){bull.sprite_index=spr_ground_las;bull.image_speed=0;bull.image_index=0;bull.image_xscale=3;speed=0;}
	if (bullet[argument1]="whirlwind"){bull.sprite_index=spr_rocket_whirl;bull.image_speed=0;bull.image_index=0;}



	// Melee
	var dym;dym=wep_dam[argument1];dym-=target[argument1].armour;
	if (weep="Chainsword"){with(bull){instance_destroy();}target[argument1].hp-=dym;}
	if (weep="Chainaxe"){with(bull){instance_destroy();}target[argument1].hp-=dym;}
	if (weep="Combat Knife"){with(bull){instance_destroy();}target[argument1].hp-=dym;}
	if (weep="Force Weapon"){with(bull){instance_destroy();}target[argument1].hp-=dym;}
	if (weep="Thunder Hammer"){with(bull){instance_destroy();}target[argument1].hp-=dym;}

	if (weep="Power Sword"){with(bull){instance_destroy();}target[argument1].hp-=dym;}
	if (weep="Power Weapon"){with(bull){instance_destroy();}target[argument1].hp-=dym;}
	if (weep="Power Axe"){with(bull){instance_destroy();}target[argument1].hp-=dym;}
	if (weep="Power Fist"){with(bull){instance_destroy();}target[argument1].hp-=dym;}
	if (weep="Power Fists"){with(bull){instance_destroy();}target[argument1].hp-=dym;}

	}


	/*


	// Weapons here

	var w;
	w=0;





    
    
	    if (wep[w]="Conversion Beam Projector"){}
    
	    if (wep[w]="Infernus Pistol"){
	        wep_range[w]=160;wep_dam[w]=100;wep_cooldown[w]=90;wep_clip[w]=3;wep_clip_max[w]=3;
	        wep_reload[w]=9999;wep_antitank[w]=1;bullet[w]="melta_small";bullet_spd[w]=0;wep_type[w]="template";
	    }
    
    
	    // Master Crafted Combi-flamer
	    // Master Crafted Heavy Bolter
	    // Master Crafted Meltagun
	    // Master Crafted Plasma Pistol

	}



	*/


}
