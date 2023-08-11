
player_max=player_forces;enemy_max=enemy_forces;

instance_activate_object(obj_enunit);

if (dropping=1){
    repeat(10){
        var mm;mm=instance_nearest(5000,240,obj_pnunit);
        if (!collision_point(mm.x+10,mm.y,obj_enunit,0,1)) then with(obj_pnunit){x+=10;}
    }
    repeat(10){
        with(obj_enunit){
            if (!collision_point(x-10,y,obj_pnunit,0,1)) and (!collision_point(x-10,y,obj_enunit,0,1)) then x-=10;
        }
    }
}


if (ally>0) and (ally_forces>0){
    if (ally=3){
        if (ally_forces>=1){
            var thata,ii,good;
            thata=instance_nearest(0,240,obj_pnunit);ii=0;good=0;
            
            
            
            if (instance_exists(thata)){
                repeat(1000){if (good=0){ii+=1;if (thata.marine_type[ii]="") and (thata.marine_id[ii]=0) then good=ii;}}
                ii=good;
                if (good>0){
                    repeat(10){
                        thata.marine_type[ii]="Techpriest";thata.marine_hp[ii]=50;
                        thata.marine_ac[ii]=20;thata.marine_exp[ii]=100;
                        thata.marine_wep1[ii]="Power Weapon";thata.marine_wep2[ii]="Conversion Beam Projector";
                        thata.marine_armour[ii]="Dragon Scales";thata.marine_gear[ii]="Servo Arms";
                        thata.ally[ii]=true;thata.marine_dead[ii]=0;ii+=1;thata.men+=1;
                    }
                    repeat(20){
                        thata.marine_type[ii]="Skitarii";thata.marine_hp[ii]=40;
                        thata.marine_ac[ii]=10;thata.marine_exp[ii]=10;
                        thata.marine_wep1[ii]="Hellgun";thata.marine_wep2[ii]="";
                        thata.marine_armour[ii]="Skitarii Armor";thata.marine_gear[ii]="";
                        thata.ally[ii]=true;thata.marine_dead[ii]=0;ii+=1;thata.men+=1;
                    }
                }
                
                ii=0;good=0;
                repeat(50){if (good=0){ii+=1;if (thata.dudes[ii]="") and (thata.dudes_num[ii]=0) then good=ii;}}
                if (good>0){thata.dudes[ii]="Techpriest";thata.dudes_num[ii]=10;thata.dudes_vehicle[ii]=0;}
                ii=0;good=0;
                repeat(50){if (good=0){ii+=1;if (thata.dudes[ii]="") and (thata.dudes_num[ii]=0) then good=ii;}}
                if (good>0){thata.dudes[ii]="Skitarii";thata.dudes_num[ii]=20;thata.dudes_vehicle[ii]=0;}
                thata.alarm[1]=1;
            }
        }
    }
}






// scr_newtext();

/*if (newline!=""){
    var breaks,first_open;
    newline=scr_lines(89,newline);
    breaks=max(1,string_count("@",newline));
    first_open=liness+1;
    
    var b,f;b=first_open;f=-1;
    explode_script(newline,"@");
    f+=1;lines[b+f]=string("-"+explode[f]);
    repeat(breaks-1){f+=1;
        lines[b+f]=string(explode[f]);
    }
    liness+=string_count("@",newline);
    
    repeat(100){
        if (liness>30){scr_lines_increase(1);liness-=1;}
    }
}

newline="";*/


instance_activate_object(obj_enunit);

/* */
/*  */
