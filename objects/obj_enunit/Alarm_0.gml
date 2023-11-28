var __b__;
__b__ = action_if_number(obj_pnunit, 0, 2);
if __b__
{
{




var leftest,charge,enemy2,chapter_fuck;
charge=0;enemy2=0;chapter_fuck=1;

// with(obj_pnunit){if (x<-4000) or (defenses=1) then instance_deactivate_object(id);}

if (flank=0){
    leftest=instance_nearest(0,y,obj_enunit);// Left most enunit
    enemy=instance_nearest(4000,y,obj_pnunit);// Right most enemy
    enemy2=enemy;
    // if (collision_point(x-10,y,obj_pnunit,0,1)) then engaged=1;
    // if (!collision_point(x-10,y,obj_pnunit,0,1)) then engaged=0;
    
    
    if (leftest.id=self.id) and (!instance_exists(obj_nfort)){
        if (position_empty(x-10,y)) and (point_distance(x,y,(instance_nearest(x,y,obj_pnunit)).x,(instance_nearest(x,y,obj_pnunit)).y)>10){
            with(obj_enunit){x-=10;}
        }
    }
    
    
    if (point_distance(x,0,enemy.x,0)<5) then x+=10;
    // instance_activate_object(obj_cursor);
}
if (flank=1){
    enemy=instance_nearest(x,y,obj_pnunit);// Right most enemy
    enemy2=enemy;
    // if (collision_point(x+10,y,obj_pnunit,0,1)) then engaged=1;
    // if (!collision_point(x+10,y,obj_pnunit,0,1)) then engaged=0;
    if (position_empty(x+10,y)) then x+=10;
    
    if (!position_empty(x+10,y)) then engaged=1;// Quick smash
    // instance_activate_object(obj_cursor);
}

if (!collision_point(x+10,y,obj_pnunit,0,1)) and (!collision_point(x-10,y,obj_pnunit,0,1)) then engaged=0;
if (collision_point(x+10,y,obj_pnunit,0,1)) or (collision_point(x-10,y,obj_pnunit,0,1)) then engaged=1;


if (engaged=0){// Shooting
    var i,dist,block;i=0;dist=999;block=0;
    dist=point_distance(x,y,enemy.x,enemy.y)/10;
    
    var wall_exists;wall_exists=0;
    if (instance_exists(obj_nfort)){wall_exists=1;dist=2;}
    /*with(obj_pnunit){if (veh_type[1]="Defenses") then instance_create(x,y,obj_temp_inq);}
    if (instance_exists(obj_temp_inq)){
        enemy=instance_nearest(obj_temp_inq.x,obj_temp_inq.y,obj_pnunit);
        with(obj_temp_inq){instance_destroy();}
    }*/
    
    if (!instance_exists(obj_pnunit)) then exit;
    
    repeat(30){chapter_fuck=1;
        if (!instance_exists(obj_pnunit)) then exit;
        if (instance_exists(enemy)) and (instance_exists(obj_pnunit)){
            if (enemy.x<-4000){
                if (flank=0){enemy=instance_nearest(4000,y,obj_pnunit);enemy2=enemy;dist=point_distance(x,y,enemy.x,enemy.y)/10;}
                if (flank=1){enemy=instance_nearest(0,y,obj_pnunit);enemy2=enemy;dist=point_distance(x,y,enemy.x,enemy.y)/10;}
            }
        }
        if (!instance_exists(enemy)) and (instance_exists(obj_pnunit)){
            if (flank=0){enemy=instance_nearest(4000,y,obj_pnunit);enemy2=enemy;dist=point_distance(x,y,enemy.x,enemy.y)/10;}
            if (flank=1){enemy=instance_nearest(0,y,obj_pnunit);enemy2=enemy;dist=point_distance(x,y,enemy.x,enemy.y)/10;}
        }
        
        if (instance_exists(enemy)) and (instance_exists(obj_pnunit)){
            i+=1;block=0;
            if (flank=0){enemy=instance_nearest(4000,y,obj_pnunit);enemy2=enemy;dist=point_distance(x,y,enemy.x,enemy.y)/10;}
            if (flank=1){enemy=instance_nearest(0,y,obj_pnunit);enemy2=enemy;dist=point_distance(x,y,enemy.x,enemy.y)/10;}
            if (enemy.men+enemy.veh<=0){var x5;x5=enemy.x;with(enemy){x=-100;instance_deactivate_object(id);}enemy=instance_nearest(4000,y,obj_pnunit);enemy2=enemy;}
        
            if (instance_exists(obj_nfort)) and (obj_nfort.hp[1]>0){// Give the wall the melee D
                enemy=instance_nearest(x,y,obj_nfort);
                var bug1;bug1=instance_nearest(40,y,obj_enunit);
                if (range[i]=1) and (bug1.id=self.id) then range[i]=2;
                enemy2=enemy;dist=2;
            }
            
            if (wep[i]!="") and (wep_num[i]>0) and (range[i]>=dist) and (range[i]!=1) and (combi[i]<2) and (ammo[i]!=0){// Weapon meets preliminary checks
                
                var ap;ap=0;if (apa[i]>0) then ap=1;// Determines if it is AP or not
                // if (string_count("Gauss",wep[i])>0) then ap=1;
                
                // show_message(string(wep[i])+" is in range and AP:"+string(ap));
                
                if (wep[i]="Missile Launcher") or (wep[i]="Rokkit Launcha") or (wep[i]="Kannon") then ap=1;
                if (wep[i]="Big Shoota") then ap=0;if (wep[i]="Devourer") then ap=0;
                if (wep[i]="Gauss Particle Cannon") or (wep[i]="Overcharged Gauss Cannon") or (wep[i]="Particle Whip") then ap=1;
                
                
                
                if ((wep[i]="Power Fist") or (wep[i]="Bolter")) and (obj_ncombat.alpha_strike>0) and (wep_num[i]>5){
                    obj_ncombat.alpha_strike-=0.5;
                    
                    with(obj_temp5){instance_destroy();}
                    with(obj_pnunit){
                        var i;i=0;
                        repeat(200){
                            i+=1;if (marine_type[i]="Chapter Master"){
                                obj_ncombat.hue=i;instance_create(x,y,obj_temp5);
                            }
                        }
                    }
                    if (instance_exists(obj_temp5)){
                        enemy=instance_nearest(obj_temp5.x,obj_temp5.y,obj_pnunit);
                        chapter_fuck=obj_ncombat.hue;with(obj_temp5){instance_destroy();}
                    }
                }
                
                
                
                if (ap=1) and ((!instance_exists(obj_nfort)) or (flank=1)){// Check for vehicles
                    var g,good,enemy2;g=0;good=0;
                    
                    if (enemy.veh+enemy.dreads>0) or (enemy.veh_type[1]="Defenses"){
                        // good=scr_target(enemy,"veh");// First target has vehicles, blow it to hell
                        scr_shoot(i,enemy,chapter_fuck,"arp","ranged");
                    }
                    if (good=0) and (instance_number(obj_pnunit)>1) and (obj_ncombat.enemy!=7){// First target does not have vehicles, cycle through objects to find one that has vehicles
                        var x2;x2=enemy.x;
                        repeat(instance_number(obj_pnunit)-1){
                            if (good=0){
                                if (flank=0) then x2-=10;
                                if (flank=1) then x2+=10;
                                enemy2=instance_nearest(x2,y,obj_pnunit);
                                if (enemy2.veh+enemy2.dreads>0) and (good=0){
                                    // good=scr_target(enemy2,"veh");// This target has vehicles, blow it to hell
                                    scr_shoot(i,enemy2,chapter_fuck,"arp","ranged");
                                }
                            }
                        }
                    }
                    if (good=0) then ap=0;// Fuck it, shoot at infantry
                }
                if (ap=1) and (instance_exists(obj_nfort)) and (flank=0){// Huff and puff and blow the wall down
                    enemy=instance_nearest(x,y,obj_nfort);
                    
                    scr_shoot(i,enemy,1,"arp","wall");
                }
                
                // if (wall_exists=0) or (flank=1) 
                
                
                if (string_count("Gauss",wep[i])>0) then ap=0;
                
                if (ap=0) and ((!instance_exists(obj_nfort)) or (flank=1)) and (instance_exists(obj_pnunit)) and (instance_exists(enemy)){// Check for men
                    var g,good,enemy2;g=0;good=0;
                    if ((enemy.men-enemy.dreads)>0){
                        // good=scr_target(enemy,"men");// First target has vehicles, blow it to hell
                        scr_shoot(i,enemy,chapter_fuck,"att","ranged");
                    }
                    
                    // First target does not have vehicles, cycle through objects to find one that has vehicles
                    // Note that unless the player has 10+ vehicles in the front rank they can fire on through
                    
                    if (good=0) and (instance_number(obj_pnunit)>1) and (enemy.veh+enemy.dreads<=10){
                        var x2;x2=enemy.x;
                        repeat(instance_number(obj_pnunit)-1){
                            if (good=0){
                                if (flank=0) then x2-=10;
                                if (flank=1) then x2+=10;
                                enemy2=instance_nearest(x2,y,obj_pnunit);
                                
                                var j,totes;j=0;totes=0;
                                repeat(600){j+=1;
                                    if (enemy2.marine_hp[j]>0){
                                        if (enemy2.marine_type[j]=obj_ini.role[100][6]) then totes+=1;
                                        if (enemy2.marine_type[j]="Venerable "+string(obj_ini.role[100][6])) then totes+=1;
                                    }
                                    if (enemy2.veh_hp[j]>0){
                                        if (enemy2.veh_type[i]="Rhino") then totes+=1;
                                        if (enemy2.veh_type[i]="Predator") then totes+=1;
                                        if (enemy2.veh_type[i]="Land Raider") then totes+=1;
                                    }
                                }
                                
                                // show_message(totes);
                                
                                // if (enemy2.veh+enemy2.dreads>10) then block=1;
                                if (totes>=10) then block=1;
                                
                                // if (enemy2.men-enemy2.dreads>0) and (good=0) and (block=0){
                                if (enemy2.men-enemy2.dreads>0) and (good=0) and (block=0){
                                    // good=scr_target(enemy2,"men");// This target has men, blow it to hell
                                    scr_shoot(i,enemy2,chapter_fuck,"att","ranged");
                                }
                            }
                        }
                    }
                }
                
                
                
            }
        }
    }
}


if (!instance_exists(enemy)) or (!instance_exists(obj_pnunit)) then exit;
 if ((engaged=1) or (enemy.engaged=1) and (instance_exists(enemy))) and (instance_exists(obj_pnunit)){// Melee
    engaged=1;
    var i,dist,no_ap;i=0;dist=999;no_ap=1;
    // dist=point_distance(x,y,enemy.x,enemy.y)/10;
    
    if (instance_exists(obj_pnunit)) then repeat(30){i+=1;var ap;ap=0;
        if (!instance_exists(obj_pnunit)) then exit;
        if (flank=0){enemy=instance_nearest(4000,y,obj_pnunit);enemy2=enemy;dist=point_distance(x,y,enemy.x,enemy.y)/10;}
        if (flank=1){enemy=instance_nearest(0,y,obj_pnunit);enemy2=enemy;dist=point_distance(x,y,enemy.x,enemy.y)/10;}
    
        
        if (enemy.men+enemy.veh<=0){var x5;x5=enemy.x;with(enemy){x=-100;instance_deactivate_object(id);}enemy=instance_nearest(4000,y,obj_pnunit);enemy2=enemy;}
    
        
        
        if (ap=1) and (instance_exists(obj_nfort)) and (flank=0){// Huff and puff and blow the wall down
            enemy=instance_nearest(x,y,obj_nfort);
            scr_shoot(i,enemy,1,"arp","wall");
        }
        
        
        if (apa[i]=0) or (apa[i]<att[i]) then no_ap+=1;
        
        if (wep[i]!="") and (wep_num[i]>0) and (range[i]>=dist) and ((range[i]<=2) or ((floor(range[i])!=range[i]))){// Weapon meets preliminary checks
            if (apa[i]>att[i]) then ap=1;// Determines if it is AP or not
            
            if (ap=1){// Check for vehicles
                var g,good,enemy2;g=0;good=0;
                
                if (enemy.veh+enemy.dreads>0){
                    // good=scr_target(enemy,"veh");// First target has vehicles, blow it to hell
                    scr_shoot(i,enemy,1,"arp","melee");
                }
                if (good=0) then ap=0;// Fuck it, shoot at infantry
            }
            if (ap=0) and (instance_exists(enemy)){// Check for men
                // show_message(string(wep[i]));
                var g,good,enemy2;g=0;good=0;
                if ((enemy.men-enemy.dreads)>0){
                    // good=scr_target(enemy,"men");// First target has vehicles, blow it to hell
                    scr_shoot(i,enemy,1,"att","melee");
                }
                if (enemy.dreads+enemy.veh>0){
                    scr_shoot(i,enemy,1,"arp","melee");// Swing anyways, maybe they'll get lucky
                }
            }
            
            
            
        }
   
    }
    
    
    // if (no_ap=30) and (enemy.men=0) and (flank=0){// Next turn?
        
    // }
    
    
    
}


instance_activate_object(obj_pnunit);

/* */
__b__ = action_if_variable(image_index, -500, 0);
if __b__
{




var leftest,charge,enemy2;charge=0;enemy2=0;

with(obj_pnunit){if (x<-4000) then instance_deactivate_object(id);}

if (flank=0){
    leftest=instance_nearest(0,y,obj_enunit);// Left most enunit
    enemy=instance_nearest(4000,y,obj_pnunit);// Right most enemy
    enemy2=enemy;
    // if (collision_point(x-10,y,obj_pnunit,0,1)) then engaged=1;
    // if (!collision_point(x-10,y,obj_pnunit,0,1)) then engaged=0;
    if (leftest.id=self.id) and (!instance_exists(obj_nfort)){
        // instance_deactivate_object(obj_cursor);
        if (position_empty(x-10,y)){
            with(obj_enunit){x-=10;}
        }
    }
    // instance_activate_object(obj_cursor);
}
if (flank=1){
    enemy=instance_nearest(x,y,obj_pnunit);// Right most enemy
    enemy2=enemy;
    // if (collision_point(x+10,y,obj_pnunit,0,1)) then engaged=1;
    // if (!collision_point(x+10,y,obj_pnunit,0,1)) then engaged=0;
    if (position_empty(x+10,y)) then x+=10;
    
    if (!position_empty(x+10,y)) then engaged=1;// Quick smash
    // instance_activate_object(obj_cursor);
}

if (!collision_point(x+10,y,obj_pnunit,0,1)) and (!collision_point(x-10,y,obj_pnunit,0,1)) then engaged=0;
if (collision_point(x+10,y,obj_pnunit,0,1)) or (collision_point(x-10,y,obj_pnunit,0,1)) then engaged=1;



var range_shooti;

    i=0;
    
    
    repeat(30){i+=1;


    
    dist=floor(point_distance(enemy2.x,enemy2.y,x,y)/10);
    
    
    
    
    
    range_shoot="";
    
    if (wep[i]!="") and (range[i]>=dist) and (ammo[i]!=0){
        if (range[i]!=1) and (engaged=0) then range_shoot="ranged";
        if ((range[i]!=floor(range[i])) or (range[i]=1)) and (engaged=1) then range_shoot="melee";
    }
    
    
    
    
    
    
    
    if (wep[i]!="") and (range_shoot="ranged") and (range[i]>=dist){// Weapon meets preliminary checks
        var ap;ap=0;if (apa[i]>att[i]) then ap=1;// Determines if it is AP or not
        
        // if (wep[i]="Missile Launcher") then ap=1;
        
        if (string_count("Gauss",wep[i])>0) then ap=1;
        
        if (wep[i]="Missile Launcher") or (wep[i]="Rokkit Launcha") or (wep[i]="Kannon") then ap=1;
        if (wep[i]="Big Shoota") then ap=0;if (wep[i]="Devourer") then ap=0;
        if (wep[i]="Gauss Particle Cannon") or (wep[i]="Overcharged Gauss Cannon") or (wep[i]="Particle Whip") then ap=1;
        
        
        if (instance_exists(enemy2)){
            if (enemy2.veh+enemy2.dreads>0) and (enemy2.men=0) and (apa[i]>10) then ap=1;
            
            if (ap=1) and (once_only=0){// Check for vehicles
                var g,good;g=0;good=0;
                
                if (enemy.veh>0){
                    // good=scr_target(enemy,"veh");// First target has vehicles, blow it to hell
                    scr_shoot(i,enemy2,good,"arp","ranged");
                }
                if (good=0) and (instance_number(obj_pnunit)>1){// First target does not have vehicles, cycle through objects to find one that has vehicles
                    var x2;x2=enemy2.x;
                    repeat(instance_number(obj_enunit)-1){
                        if (good=0){
                            x2+=10;enemy2=instance_nearest(x2,y,obj_pnunit);
                            if (enemy2.veh+enemy2.dreads>0) and (good=0){
                                good=scr_target(enemy2,"veh");// This target has vehicles, blow it to hell
                                scr_shoot(i,enemy2,good,"arp","ranged");once_only=1;
                            }
                        }
                    }
                }
                if (good=0) then ap=0;// Fuck it, shoot at infantry
            }
        }
        
        
        
        
        
        
        
        
        
        
    }



}





/*
// if (engaged=0){// Shooting
    var i,dist,block;i=0;dist=999;block=0;
    dist=point_distance(x,y,enemy.x,enemy.y)/10;
    
    repeat(30){
        if (instance_exists(enemy)){
            if (enemy.x<-4000){
                if (flank=0){enemy=instance_nearest(4000,y,obj_pnunit);enemy2=enemy;dist=point_distance(x,y,enemy.x,enemy.y)/10;}
                if (flank=1){enemy=instance_nearest(0,y,obj_pnunit);enemy2=enemy;dist=point_distance(x,y,enemy.x,enemy.y)/10;}
            }
        }
        if (!instance_exists(enemy)){
            if (flank=0){enemy=instance_nearest(4000,y,obj_pnunit);enemy2=enemy;dist=point_distance(x,y,enemy.x,enemy.y)/10;}
            if (flank=1){enemy=instance_nearest(0,y,obj_pnunit);enemy2=enemy;dist=point_distance(x,y,enemy.x,enemy.y)/10;}
        }
        
        if (instance_exists(enemy))/* and (obj_ncombat.wall_destroyed=0)*/// {
            /*i+=1;block=0;
            if (flank=0){enemy=instance_nearest(4000,y,obj_pnunit);enemy2=enemy;dist=point_distance(x,y,enemy.x,enemy.y)/10;}
            if (flank=1){enemy=instance_nearest(0,y,obj_pnunit);enemy2=enemy;dist=point_distance(x,y,enemy.x,enemy.y)/10;}
            if (enemy.men+enemy.veh<=0){var x5;x5=enemy.x;with(enemy){x=-100;instance_deactivate_object(id);}enemy=instance_nearest(4000,y,obj_pnunit);enemy2=enemy;}
        
            if (instance_exists(obj_nfort)) and (obj_nfort.hp[1]>0){// Give the wall the melee D
                enemy=instance_nearest(x,y,obj_nfort);
                var bug1;bug1=instance_nearest(40,y,obj_enunit);
                if (range[i]=1) and (bug1.id=self.id) then range[i]=2;
                enemy2=enemy;dist=2;
            }
            
            if (wep[i]!="") and (wep_num[i]>0) and (range[i]>=dist) and (range[i]!=1) and (combi[i]<2) and (ammo[i]!=0){// Weapon meets preliminary checks
                
                var ap;ap=0;if ((apa[i]*2)>att[i]) then ap=1;// Determines if it is AP or not
                if (string_count("Gauss",wep[i])>0) then ap=1;
                
                // show_message(string(wep[i])+" is in range and AP:"+string(ap));
                
                if (wep[i]="Missile Launcher") or (wep[i]="Rokkit Launcha") or (wep[i]="Kannon") then ap=1;
                if (wep[i]="Big Shoota") then ap=0;if (wep[i]="Devourer") then ap=0;
                if (wep[i]="Gauss Particle Cannon") or (wep[i]="Overcharged Gauss Cannon") or (wep[i]="Particle Whip") then ap=1;
                
                if (ap=1) and ((!instance_exists(obj_nfort)) or (flank=1)){// Check for vehicles
                    var g,good,enemy2;g=0;good=0;
                    
                    if (enemy.veh+enemy.dreads>0){
                        // good=scr_target(enemy,"veh");// First target has vehicles, blow it to hell
                        scr_shoot(i,enemy,1,"arp","ranged");
                    }
                    if (good=0) and (instance_number(obj_pnunit)>1) and (obj_ncombat.enemy!=7){// First target does not have vehicles, cycle through objects to find one that has vehicles
                        var x2;x2=enemy.x;
                        repeat(instance_number(obj_pnunit)-1){
                            if (good=0){
                                if (flank=0) then x2-=10;
                                if (flank=1) then x2+=10;
                                enemy2=instance_nearest(x2,y,obj_pnunit);
                                if (enemy2.veh+enemy2.dreads>0) and (good=0){
                                    // good=scr_target(enemy2,"veh");// This target has vehicles, blow it to hell
                                    scr_shoot(i,enemy2,1,"arp","ranged");
                                }
                            }
                        }
                    }
                    if (good=0) then ap=0;// Fuck it, shoot at infantry
                }
                if (ap=1) and (instance_exists(obj_nfort)) and (flank=0){// Huff and puff and blow the wall down
                    enemy=instance_nearest(x,y,obj_nfort);
                    scr_shoot(i,enemy,1,"arp","wall");
                }
                
                
                
                if (string_count("Gauss",wep[i])>0) then ap=0;
                
                if (ap=0) and ((!instance_exists(obj_nfort)) or (flank=1)){// Check for men
                    var g,good,enemy2;g=0;good=0;
                    if ((enemy.men-enemy.dreads)>0){
                        // good=scr_target(enemy,"men");// First target has vehicles, blow it to hell
                        scr_shoot(i,enemy,1,"att","ranged");
                    }
                    
                    // First target does not have vehicles, cycle through objects to find one that has vehicles
                    // Note that unless the player has 10+ vehicles in the front rank they can fire on through
                    
                    if (good=0) and (instance_number(obj_pnunit)>1) and (enemy.veh+enemy.dreads<=10){
                        var x2;x2=enemy.x;
                        repeat(instance_number(obj_pnunit)-1){
                            if (good=0){
                                if (flank=0) then x2-=10;
                                if (flank=1) then x2+=10;
                                enemy2=instance_nearest(x2,y,obj_pnunit);
                                
                                var j,totes;j=0;totes=0;
                                repeat(600){j+=1;
                                    if (enemy2.marine_hp[j]>0){
                                        if (enemy2.marine_type[j]=obj_ini.role[100][6]) then totes+=1;
                                        if (enemy2.marine_type[j]="Venerable "+string(obj_ini.role[100][6])) then totes+=1;
                                    }
                                    if (enemy2.veh_hp[j]>0){
                                        if (enemy2.veh_type[i]="Rhino") then totes+=1;
                                        if (enemy2.veh_type[i]="Predator") then totes+=1;
                                        if (enemy2.veh_type[i]="Land Raider") then totes+=1;
                                    }
                                }
                                
                                show_message(totes);
                                
                                // if (enemy2.veh+enemy2.dreads>10) then block=1;
                                if (totes>=10) then block=1;
                                
                                // if (enemy2.men-enemy2.dreads>0) and (good=0) and (block=0){
                                if (enemy2.men-enemy2.dreads>0) and (good=0) and (block=0){
                                    // good=scr_target(enemy2,"men");// This target has men, blow it to hell
                                    scr_shoot(i,enemy2,1,"att","ranged");
                                }
                            }
                        }
                    }
                }
                
                
                
            }
        }
        
        
        
    }
// }


// if ((engaged=1) or (enemy.engaged=1) and (instance_exists(enemy)))/* or (instance_exists(obj_nfort))*/// {// Melee
    /*engaged=1;
    var i,dist,no_ap;i=0;dist=999;no_ap=1;
    // dist=point_distance(x,y,enemy.x,enemy.y)/10;
    
    repeat(30){i+=1;
        if (flank=0){enemy=instance_nearest(4000,y,obj_pnunit);enemy2=enemy;dist=point_distance(x,y,enemy.x,enemy.y)/10;}
        if (flank=1){enemy=instance_nearest(0,y,obj_pnunit);enemy2=enemy;dist=point_distance(x,y,enemy.x,enemy.y)/10;}
    
        
        if (enemy.men+enemy.veh<=0){var x5;x5=enemy.x;with(enemy){x=-100;instance_deactivate_object(id);}enemy=instance_nearest(4000,y,obj_pnunit);enemy2=enemy;}
    
        
        /*
        if (ap=1) and (instance_exists(obj_nfort)) and (flank=0){// Huff and puff and blow the wall down
            enemy=instance_nearest(x,y,obj_nfort);
            scr_shoot(i,enemy,1,"arp","wall");
        }*/
        
        /*
        if (apa[i]=0) or (apa[i]<att[i]) then no_ap+=1;
        
        if (wep[i]!="") and (wep_num[i]>0) and (range[i]>=dist) and (range[i]<=2){// Weapon meets preliminary checks
            var ap;ap=0;if (apa[i]>att[i]) then ap=1;// Determines if it is AP or not
            
            if (ap=1){// Check for vehicles
                var g,good,enemy2;g=0;good=0;
                
                if (enemy.veh+enemy.dreads>0){
                    // good=scr_target(enemy,"veh");// First target has vehicles, blow it to hell
                    scr_shoot(i,enemy,1,"arp","melee");
                }
                if (good=0) then ap=0;// Fuck it, shoot at infantry
            }
            if (ap=0){// Check for men
                // show_message(string(wep[i]));
                var g,good,enemy2;g=0;good=0;
                if ((enemy.men-enemy.dreads)>0){
                    // good=scr_target(enemy,"men");// First target has vehicles, blow it to hell
                    scr_shoot(i,enemy,1,"att","melee");
                }
                if ((enemy.men-enemy.dreads)<=0) and (enemy.veh>0){
                    scr_shoot(i,enemy,1,"arp","melee");// Swing anyways, maybe they'll get lucky
                }
            }
            
            
            
        }
   
    }
    
    
    if (no_ap=30) and (enemy.men=0) and (flank=0){// Next turn?
        
    }
    
    
    
}
*/


instance_activate_object(obj_pnunit);

/* */
}
}
}
/*  */
