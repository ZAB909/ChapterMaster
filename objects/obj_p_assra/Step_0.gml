
image_angle=direction;
if (cooldown>0) then cooldown-=1;

var dist;
if (instance_exists(target)){
    if (target.owner = eFACTION.Tyranids) or (target.owner = eFACTION.Necrons){damage=true;plasma_bomb=true;steal=false;} 
    if (target.owner != eFACTION.Tyranids) and (target.owner != eFACTION.Necrons){
        if (obj_controller.command_set[20]=1) then damage=true;
        if (obj_controller.command_set[21]=1) then plasma_bomb=true;
        if (obj_controller.command_set[22]=1) then steal=true; // important for boarding and commandeering ships later down the line?
    }
    
    dist=point_distance(x,y,target.x,target.y);
    
    if (action="goto"){speed=4;
        direction=turn_towards_point(direction,x,y,target.x,target.y,8);
        direction=turn_towards_point(direction,x,y,target.x,target.y,8);
    }
    
    if (instance_exists(target)){
        if (action="goto") and (point_distance(x,y,target.x,target.y)<=16){
            action="unload";
        }
    }
    if (action="unload") and (instance_exists(target)){
        x=target.x;y=target.y;if (boarding=false){boarding=true;board_cooldown=60;action="waiting";}
    }
    if (action="waiting") and (instance_exists(target)){x=target.x;y=target.y;}
    
    // Might change based on chapter settings
}

if (action="return"){speed=4;
    direction=turn_towards_point(direction,x,y,origin.x,origin.y,8);
    direction=turn_towards_point(direction,x,y,origin.x,origin.y,8);
}
if (action="return") and (point_distance(x,y,origin.x,origin.y)<=16){
    speed=0;action="sdagsdagasdgsdag";x=-500;y=-500;
}


if (action="goto") and (!instance_exists(target)){
	boarding=false;
    target=instance_nearest(x,y,obj_en_ship);
	action="goto";
}

if (boarding=true) and (!instance_exists(target)){
	boarding=false;
    if (steal=true){action="sdagdsgdasg";x=-500;y=-500;}
    if (steal=false){
        if (obj_controller.command_set[23]=1) and (instance_exists(obj_en_ship)){
            target=instance_nearest(x,y,obj_en_ship);action="goto";
        }
        if (obj_controller.command_set[24]=1) or (!instance_exists(obj_en_ship)) then action="return";
    }
}

if (boarding=true) and (board_cooldown>=0) and (instance_exists(target)) and (instance_exists(origin)){
    board_cooldown-=1;

    if (board_cooldown=0){board_cooldown=60;
        var o,challenge,difficulty,roll1,roll2,attack,arp,wep,ac,dr,co,i,hits,hurt,damaged_ship;
        o=firstest-1;difficulty=50;challenge=0;roll1=0;roll2=0;attack=0;arp=0;wep="";hits=0;hurt=0;damaged_ship=0;
        co=0;i=0;ac=0;dr=1;
        
        repeat(boarders){o+=1;
            if (!instance_exists(target)) then exit;
            
            // show_message(origin);
            // show_message(string(origin.board_co[1]));
        
            co=origin.board_co[o];i=origin.board_id[o];difficulty=50;ac=0;dr=1;
            if (obj_ini.hp[co][i]>0){
                
                // Bonuses
                difficulty+=obj_ini.experience[co][i]/20;
                difficulty+=(1-(target.hp/target.maxhp))*33;
                if (obj_ini.wep1[co][i]="Chainfist") or (obj_ini.wep1[co][i]="Lascutter") then difficulty+=3;
                if (obj_ini.wep2[co][i]="Chainfist") or (obj_ini.wep2[co][i]="Lascutter") then difficulty+=3;
                if (obj_ini.wep1[co][i]="Meltagun") or (obj_ini.wep2[co][i]="Meltagun") then difficulty+=2;
                var g,yea;
                g=0;yea=false;repeat(4){g+=1;if (obj_ini.adv[g]="Boarders") then yea=true;}if (yea=true) then difficulty+=7;
                g=0;yea=false;repeat(4){g+=1;if (obj_ini.adv[g]="Melee Enthusiasts") then yea=true;}if (yea=true) then difficulty+=3;
                g=0;yea=false;repeat(4){g+=1;if (obj_ini.adv[g]="Lightning Warriors") then yea=true;}if (yea=true) then difficulty+=3;
                
                // Penalties
                if (obj_ini.wep1[co][i]="") and (obj_ini.wep2[co][i]="") then difficulty-=10;
                if (obj_ini.wep1[co][i]="") or (obj_ini.wep2[co][i]="") then difficulty-=10;
                if (obj_ini.occulobe=1) then difficulty-=5;
                if (target.owner = eFACTION.Imperium) or ((target.owner = eFACTION.Chaos) and (obj_fleet.csm_exp=0)) then difficulty-=0;// Cultists/Pirates/Humans
                if (target.owner  = eFACTION.Player) or (target.owner = eFACTION.Ecclesiarchy) or (target.owner = eFACTION.Ork) or (target.owner = eFACTION.Eldar) or (target.owner = eFACTION.Necrons) then difficulty-=10;
                if (target.owner = eFACTION.Chaos) and (obj_fleet.csm_exp=1) then difficulty-=20;//       Veteran marines
                if ((target.owner = eFACTION.Chaos) and (obj_fleet.csm_exp=2)) or (target.owner = eFACTION.Tyranids) then difficulty-=30;// Daemons, veteran CSM, tyranids
                
                roll1=floor(random(100))+1;
                
                
                if (roll1<=difficulty){// Success
                    if (damage=true) and (steal=false){// Damaging
                        var to_bomb;to_bomb=false;
                        if (plasma_bomb=true) and (obj_ini.gear[co][i]="Plasma Bomb") then to_bomb=true;
                        if (choose(1,2,3,4,5)<4) then to_bomb=false;
                        if (to_bomb=false){target.hp-=7;damaged_ship=max(1,damaged_ship);}
                        if (to_bomb=true){target.hp-=200;damaged_ship=2;obj_ini.gear[co][i]="";}
                    }
                    if (steal=true) and (damage=false){// Stealing
                        var bridge_damage;bridge_damage=0;
                        damaged_ship=max(1,damaged_ship);
                        
                        var we,whi,we1,we2;we="";we1=obj_ini.wep1[co][i];we2=obj_ini.wep2[co][i];whi=0;
                        we1=string_replace(we1,"Master Crafted","");we2=string_replace(we2,"Master Crafted","");
                        
                        bridge_damage=3;
                        we="Eviscerator";if (we1=we) or (we2=we) then bridge_damage=max(bridge_damage,7);
                        we="Chainfist";if (we1=we) or (we2=we) then bridge_damage=max(bridge_damage,7);
                        we="Lascutter";if (we1=we) or (we2=we) then bridge_damage=max(bridge_damage,7);
                        we="Meltagun";if (we1=we) or (we2=we) then bridge_damage=max(bridge_damage,7);
                        we="Power Fist";if (we1=we) or (we2=we) then bridge_damage=max(bridge_damage,6);
                        we="Thunder Hammer";if (we1=we) or (we2=we) then bridge_damage=max(bridge_damage,6);
                        we="Plasma Gun";if (we1=we) or (we2=we) then bridge_damage=max(bridge_damage,5);
                        we="Relic Blade";if (we1=we) or (we2=we) then bridge_damage=max(bridge_damage,4);
                        if (string_pos("&",string(obj_ini.wep1[co][i])+string(obj_ini.wep2[co][i]))>0) then bridge_damage=9;
                        
                        target.bridge-=bridge_damage;
                    }
                    if ((target.hp<=0) or (target.bridge<=0)){
                        var husk;husk=instance_create(target.x,target.y,obj_en_husk);
                        
                        if (experience=0){experience=2;
                            if (target.owner = eFACTION.Ecclesiarchy) or (target.owner = eFACTION.Ork) or (target.owner = eFACTION.Eldar) or (target.owner = eFACTION.Necrons) then experience+=1;
                            if (target.owner = eFACTION.Chaos) and (obj_fleet.csm_exp=1) then experience+=2;
                            if (target.owner = eFACTION.Chaos) and (obj_fleet.csm_exp=2) then experience+=3;
                            if (target.owner = eFACTION.Tyranids) then experience+=3;if (target.bridge<=0) then experience+=2;
                        }
                        
                        with(target){
                            var wh,gud;wh=0;gud=0;
                            repeat(5){wh+=1;if (obj_fleet.enemy[wh]=owner) then gud=wh;}
                            if (size=3) then obj_fleet.en_capital_lost[gud]+=1;
                            if (size=2) then obj_fleet.en_frigate_lost[gud]+=1;
                            if (size=1) then obj_fleet.en_escort_lost[gud]+=1;
                        }
                        
                        husk.sprite_index=target.sprite_index;
                        husk.direction=target.direction;
                        husk.image_angle=target.image_angle;
                        husk.depth=target.depth;
                        husk.image_speed=0;
                        
                        if (instance_exists(target)){
                            if (target.hp<=0) and (target.bridge>0) then repeat(choose(3,4,5)){
                                var explo;explo=instance_create(target.x,target.y,obj_explosion);
                                explo.image_xscale=0.5;explo.image_yscale=0.5;
                                explo.x+=random_range(target.sprite_width*0.25,target.sprite_width*-0.25);
                                explo.y+=random_range(target.sprite_width*0.25,target.sprite_width*-0.25);
                            }
                            // if (target.hp>0) and (target.bridge<=0) then show_message("SHIP CAPTURED");
                            
                            with(target){instance_destroy();}
                        }
                    }
                }
                
                
                if (roll1>difficulty){// FAILURE
                    dr=0.7-((obj_ini.experience[co][i]*obj_ini.experience[co][i])/40000);
                    if (obj_ini.gear[co][i]="Rosarius") then dr-=0.33;
                    if (obj_ini.gear[co][i]="Iron Halo") then dr-=0.33;
                    if (obj_ini.mobi[co][i]="Jump Pack") then dr-=0.1;
                    if (dr<0.25) then dr=0.25;
                    
                    ac=0;
                    if (obj_ini.armour[co][i]="Scout Armour") then ac=8;
                    if (obj_ini.armour[co][i]="MK3 Iron Armour") then ac=26;
                    if (obj_ini.armour[co][i]="MK4 Maximus") then ac=19;
                    if (obj_ini.armour[co][i]="MK5 Heresy") then ac=17;
                    if (obj_ini.armour[co][i]="MK6 Corvus") then ac=15;
                    if (obj_ini.armour[co][i]="MK7 Aquila") then ac=18;
                    if (obj_ini.armour[co][i]="MK8 Errant") then ac=22;
                    if (obj_ini.armour[co][i]="Power Armour") then ac=17;
                    if (obj_ini.armour[co][i]="Artificer Armour") then ac=37;
                    if (obj_ini.armour[co][i]="Terminator Armour") then ac=42;
                    if (obj_ini.armour[co][i]="Tartaros") then ac=44;
                    if (obj_ini.armour[co][i]="Dreadnought") then ac=50;
                    if (obj_ini.armour[co][i]="Ork Armour") then ac=15;
                    if (string_count("&",obj_ini.armour[co][i])>0){
                        // Artifact armour
                        if (string_count("Power",obj_ini.armour[co][i])>0) then ac=30;
                        if (string_count("Artificer",obj_ini.armour[co][i])>0) then ac=37;
                        if (string_count("Terminator",obj_ini.armour[co][i])>0) then ac=46;
                        if (string_count("Dreadnought",obj_ini.armour[co][i])>0) then ac=44;
                    }
                    if (obj_ini.armour[co][i]!=""){// STC Bonuses
                        if (obj_controller.stc_bonus[1]=5){if (ac>=40) then ac+=2;if (ac<40) then ac+=1;}
                        if (obj_controller.stc_bonus[2]=3){if (ac>=40) then ac+=2;if (ac<40) then ac+=1;}
                    }
                    if (obj_ini.wep1[co][i]="Boarding Shield") then ac+=8;
                    if (obj_ini.wep2[co][i]="Boarding Shield") then ac+=8;
                    if (obj_ini.wep1[co][i]="Storm Shield") then ac+=16;
                    if (obj_ini.wep2[co][i]="Storm Shield") then ac+=16;
                    
                    roll2=floor(random(100))+1;
                    
                    if (target.owner = eFACTION.Imperium) or (target.owner = eFACTION.Chaos) or (target.owner = eFACTION.Ecclesiarchy){
                        // Make worse for CSM
                        wep="Lasgun";hits=1;
                        if (roll2<=90) then hits=2;
                        if (roll2<=75) then hits=3;
                        if (roll2<=50){wep="Bolt Pistol";hits=1;}
                        if (roll2<=40){wep="Bolter";hits=1;}
                        if (roll2<=30){wep="Bolter";hits=2;}
                        if (roll2<=20){wep="Heavy Bolter";hits=1;}
                        if (roll2<=10){wep="Plasma Pistol";hits=1;}
                        if (roll2<=5){wep="Meltagun";hits=1;}
                    }
                    if (target.owner = eFACTION.Eldar){
                        wep="Shuriken Pistol";hits=1;
                        if (roll2<=90) then hits=2;
                        if (roll2<=75) then hits=3;
                        if (roll2<=60){wep="Shuriken Catapult";hits=2;}
                        if (roll2<=50){wep="Shuriken Catapult";hits=3;}
                        if (roll2<=40){wep="Shuriken Catapult";hits=4;}
                        if (roll2<=30){wep="Wraith Cannon";hits=1;}
                        if (roll2<=20){wep="Singing Spear";hits=1;}
                        if (roll2<=10){wep="Meltagun";hits=1;}
                    }
                    if (target.owner = eFACTION.Ork){
                        wep="Shoota";hits=1;
                        if (roll2<=90) then hits=2;
                        if (roll2<=75) then hits=3;
                        if (roll2<=60) then hits=4;
                        if (roll2<=50){wep="Dakkagun";hits=1;}
                        if (roll2<=40){wep="Big Shoota";hits=1;}
                        if (roll2<=30){wep="Big Shoota";hits=2;}
                        if (roll2<=15){wep="Rokkit";hits=1;}
                    }
                    if (target.owner = eFACTION.Tau){
                        wep="Pulse Rifle";hits=1;
                        if (roll2<=80) then hits=2;
                        if (roll2<=65) then hits=3;
                        if (roll2<=50) then hits=4;
                        if (roll2<=40){wep="Missile Pod";hits=1;}
                        if (roll2<=30){wep="Burst Rifle";hits=1;}
                        if (roll2<=15){wep="Meltagun";hits=1;}
                    }
                    if (target.owner = eFACTION.Tyranids){
                        wep="Flesh Hooks";hits=1;
                        if (roll2<=90) then hits=2;
                        if (roll2<=75) then hits=3;
                        if (roll2<=60){wep="Devourer";hits=2;}
                        if (roll2<=50){wep="Devourer";hits=3;}
                        if (roll2<=40){wep="Devourer";hits=4;}
                        if (roll2<=30){wep="Venom Cannon";hits=1;}
                        if (roll2<=20){wep="Lictor Claws";hits=1;}
                        if (roll2<=10){wep="Zoanthrope Blast";hits=1;}
                    }
                    
                    if (wep="Lasgun"){attack=25;arp=0;}
                    if (wep="Bolt Pistol"){attack=30;arp=0;}
                    if (wep="Bolter"){attack=40;arp=0;}
                    if (wep="Heavy Bolter"){attack=120;arp=0;}
                    if (wep="Plasma Pistol"){attack=70;arp=1;}
                    if (wep="Shuriken Pistol"){attack=30;arp=0;}
                    if (wep="Shuriken Catapult"){attack=35;arp=0;}
                    if (wep="Wraithcannon"){attack=80;arp=1;}
                    if (wep="Singing Spear"){attack=120;arp=1;}
                    if (wep="Shoota"){attack=30;arp=0;}
                    if (wep="Big Shoota"){attack=100;arp=0;}
                    if (wep="Dakkagun"){attack=150;arp=0;}
                    if (wep="Rokkit"){attack=100;arp=1;}
                    if (wep="Pulse Rifle"){attack=30;arp=0;}
                    if (wep="Missile Pod"){attack=130;arp=0;}
                    if (wep="Burst Rifle"){attack=160;arp=0;}
                    if (wep="Meltagun"){attack=200;arp=1;}
                    if (wep="Flesh Hooks"){attack=50;arp=0;}
                    if (wep="Devourer"){attack=choose(40,60,80,100);arp=0;}
                    if (wep="Venom Cannon"){attack=150;arp=0;}
                    if (wep="Zoanthrope Blast"){attack=200;arp=1;}
                    if (wep="Lictor Claws"){attack=300;arp=0;}
                
                    
                    // End, do the damage
                    if (arp=1) then hurt=max(0,attack*dr);
                    if (arp=0) then hurt=max(0,(attack*dr)-ac);
                    
                    repeat(hits){obj_ini.hp[co][i]-=hurt;}
                    
                    if (obj_ini.hp[co][i]<=0){boarders_dead+=1;
                        if ((obj_ini.role[co][i]=obj_ini.role[100][15]) or (obj_ini.role[co][i]="Master of Sanctity")) and (obj_ini.gear[co][i]="Narthecium") then apothecary-=1;
                        if ((obj_ini.role[co][i]=obj_ini.role[100][15]) or (obj_ini.role[co][i]="Master of Sanctity")) and (obj_ini.gear[co][i]="Narthecium") then apothecary_had-=1;
                    }
                    
                    // show_message(string(obj_ini.role[co][i])+" "+string(obj_ini.role[co][i])+" hit by "+string(hits)+"x "+string(wep)+", "+string(obj_ini.hp[co][i])+" HP remaining");
                }
            }
            
            
            // board_co[i]=0;board_id[i]=0;board_location[i]=0;board_raft[i]=0;
        }
        
        
        if (experience>0){var o,co,i;o=0;co=0;i=0;
            repeat(boarders){o+=1;var exp_roll;exp_roll=floor(random(150))+1;co=origin.board_co[o];i=origin.board_id[o];
                if (exp_roll>=obj_ini.experience[co][i]) and (obj_ini.experience[co][i]<50) then obj_ini.experience[co][i]+=experience;
                if (exp_roll>=obj_ini.experience[co][i]) and (obj_ini.experience[co][i]>=50) and (obj_ini.experience[co][i]<100) then obj_ini.experience[co][i]+=floor(experience/3);
                if (exp_roll>=obj_ini.experience[co][i]) and (obj_ini.experience[co][i]>=100) and (obj_ini.experience[co][i]<150) then obj_ini.experience[co][i]+=1;
            }
            experience=0;
        }
        
        
        if (damaged_ship=1) and (instance_exists(target)){
            var explo;explo=instance_create(target.x,target.y,obj_explosion);
            explo.image_xscale=0.5;explo.image_yscale=0.5;
            explo.x+=random_range(target.sprite_width*0.25,target.sprite_width*-0.25);
            explo.y+=random_range(target.sprite_width*0.25,target.sprite_width*-0.25);
        }
        if (damaged_ship=2) and (instance_exists(target)){
            repeat(3){
                var explo;explo=instance_create(target.x,target.y,obj_explosion);
                explo.sprite_index=spr_explosion_plas;explo.image_xscale=0.65;explo.image_yscale=0.65;
                explo.x+=random_range(target.sprite_width*0.25,target.sprite_width*-0.25);
                explo.y+=random_range(target.sprite_width*0.25,target.sprite_width*-0.25);
            }
        }
        
        
    }
    
    
}











// if (hp<=0){instance_create(x,y,obj_explosion);instance_destroy();}



