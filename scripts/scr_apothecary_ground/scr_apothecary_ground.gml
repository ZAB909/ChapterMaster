function scr_apothecary_ground() {

	// Executed by each obj_star, for each planet, to heal or repair units at the end of the turn
	// Note that this should not be ran unless the star's p_player[x] is >0 to save on processing

	var run, apoth, tick, com, v, heal, repair, song;
	run=0;apoth=0;com=0;v=0;tick=0;repair=0;song=0;

	heal=50;if (obj_ini.ossmodula=1) then heal=25;
	repair=50;

	repeat(planets){
	    run+=1;
        
	    if (p_player[run]>0){
        
	        com=-1;
	        repeat(11){
	            com+=1;v=0;
	            if (com<=10) then repeat(300){v+=1;
	                if (obj_ini.role[com,v]=obj_ini.role[100,15]) and (obj_ini.hp[com,v]>=10) and (obj_ini.loc[com,v]=name) and (obj_ini.wid[com,v]=run) and (obj_ini.gear[com,v]="Narthecium") then apoth+=4;
	                if (obj_ini.role[com,v]="Sister Hospitaler") and (obj_ini.hp[com,v]>=40) and (obj_ini.loc[com,v]=name) and (obj_ini.wid[com,v]=run) then apoth+=4;
                
	                if (obj_ini.role[com,v]=obj_ini.role[100,16]) and (obj_ini.hp[com,v]>=10) and (obj_ini.loc[com,v]=name) and ((obj_ini.gear[com,v]="Servo Arms") or (obj_ini.gear[com,v]="Master Servo Arms")){tick+=2;song+=1;}
	                if (obj_ini.role[com,v]="Techpriest") and (obj_ini.hp[com,v]>=10) and (obj_ini.loc[com,v]=name){tick+=2;song+=1;}
	            }
	            com=0;
	        }
        
	        if (p_feature[run]!=""){
	            if (string_count("Starship",p_feature[run])>0){
	                var feetn,feet,tempo,c;
	                feetn=string_count("|",p_feature[run]);
	                feet=0;tempo[0]="";c=0;
                
	                explode_script(p_feature[run],"|");
	                repeat(feetn){c+=1;if (feetn>=c) then tempo[c]=string(explode[c-1]);if (string_count("Starship",tempo[c])>0) then feet=c;}
	                c=0;
                
            
            
            
	                var u1,u2,maxr,fix,tar;u1="";u2="";maxr=0;fix=0;tar=10000;
	                explode_script(tempo[feet],"!");
	                u1=string(explode[0]);u2=real(explode[1]);
	                maxr=floor(obj_controller.requisition/50);
	                fix=min(maxr*50,song*50,tar-u2);
	                obj_controller.requisition-=fix;u2+=fix;
                
	                if (fix>0) and (u2<tar){
	                    scr_alert("green","owner",string(fix)+" Requision spent on Ancient Ship repairs.",x,y);
	                    tempo[feet]="Starship!"+string(u2)+"!";
                    
	                    p_feature[run]="";
	                    c=0;repeat(feetn){c+=1;p_feature[run]+=string(tempo[c])+"|";}
	                }
	                if (u2>=tar){// u2=tar;
	                    p_feature[run]="";
	                    c=0;repeat(feetn){c+=1;if (c!=feet) then p_feature[run]+=string(tempo[c])+"|";}
	                    p_feature[run]=string_replace(p_feature[run],string(u2-tar),"D");
	                    p_feature[run]=string_replace(p_feature[run],"Starship!D!|","");
                    
	                    var locy;locy="";
	                    if (run=1) then locy=string(name)+" I";if (run=2) then locy=string(name)+" II";
	                    if (run=3) then locy=string(name)+" III";if (run=4) then locy=string(name)+" IV";
                    
	                    var flit;flit=instance_create(x+24,y-24,obj_p_fleet);
	                    var new_name,ship_names,i,last_ship;
	                    i=0;ship_names="";new_name="";last_ship=0;
	                    repeat(40){i+=1;
	                        if (last_ship=0) and (obj_ini.ship[i]="") then last_ship=i;
	                    }
                    
	                    new_name="Slaughtersong";
                    
	                    obj_ini.ship[last_ship]=new_name;
	                    obj_ini.ship_uid[last_ship]=floor(random(99999999))+1;
	                    obj_ini.ship_owner[last_ship]=1;
	                    obj_ini.ship_size[last_ship]=3;
	                    obj_ini.ship_location[last_ship]=name;
	                    obj_ini.ship_leadership[last_ship]=100;
                    
	                    obj_ini.ship_class[last_ship]="Slaughtersong";
                    
	                    obj_ini.ship_hp[last_ship]=2400;obj_ini.ship_maxhp[last_ship]=2400;
	                    obj_ini.ship_conditions[last_ship]="";obj_ini.ship_speed[last_ship]=25;obj_ini.ship_turning[last_ship]=60;
	                    obj_ini.ship_front_armor[last_ship]=8;obj_ini.ship_other_armor[last_ship]=8;obj_ini.ship_weapons[last_ship]=4;obj_ini.ship_shields[last_ship]=24;
	                    obj_ini.ship_wep[last_ship,1]="Lance Battery";ship_wep_facing[last_ship,1]="most";obj_ini.ship_wep_condition[last_ship,1]="";
	                    obj_ini.ship_wep[last_ship,2]="Lance Battery";ship_wep_facing[last_ship,2]="most";obj_ini.ship_wep_condition[last_ship,2]="";
	                    obj_ini.ship_wep[last_ship,3]="Lance Battery";ship_wep_facing[last_ship,3]="most";obj_ini.ship_wep_condition[last_ship,3]="";
	                    obj_ini.ship_wep[last_ship,4]="Plasma Cannon";ship_wep_facing[last_ship,4]="front";obj_ini.ship_wep_condition[last_ship,4]="";
	                    obj_ini.ship_capacity[last_ship]=800;obj_ini.ship_carrying[last_ship]=0;obj_ini.ship_contents[last_ship]="";
	                    obj_ini.ship_turrets[last_ship]=8;
                    
	                    flit.capital[1]=obj_ini.ship[last_ship];flit.capital_number=1;flit.capital_num[1]=last_ship;flit.capital_uid[1]=obj_ini.ship_uid[last_ship];
                    
	                    scr_popup("Ancient Ship Restored","The ancient ship within the ruins of "+string(locy)+" has been fully repaired.  It determined to be a Slaughtersong vessel and is bristling with golden age weaponry and armor.  Your "+string(obj_ini.role[100,16])+"s are excited; the Slaughtersong is ready for it's maiden voyage, at your command.","","");                
	                }
	            }
	        }
    
	        var normal_hp,mixhp,ratio;
	        normal_hp=true;mixhp=0;ratio=0;
    
        
	        if (apoth>0){    
	            repeat(11){
	                if (com+1<=10){
	                    com+=1;
	                    v=0;
	                    repeat(300){
	                        v+=1;normal_hp=true;
	                        if (obj_ini.race[com,v]>1) then normal_hp=false;
	                        if (obj_ini.wid[com,v]=run) and (obj_ini.loc[com,v]=name) and (obj_ini.armor[com,v]!="Dreadnought") and (apoth>0) and (obj_ini.hp[com,v]<=10) and (normal_hp=true){
	                            obj_ini.hp[com,v]+=heal;apoth-=1;
	                        }
	                    }
	                }
	            }
	            com=-1;
            
	            repeat(11){
	                if (com+1<=10){
	                    com+=1;
	                    v=0;
	                    repeat(300){
	                        v+=1;normal_hp=true;
	                        if (obj_ini.race[com,v]>1) then normal_hp=false;
	                        if (obj_ini.wid[com,v]=run) and (obj_ini.loc[com,v]=name) and (obj_ini.armor[com,v]!="Dreadnought") and (apoth>0) and (obj_ini.hp[com,v]<=30) and (normal_hp=true){
	                            obj_ini.hp[com,v]+=heal;apoth-=1;
	                        }
	                    }
	                }
	            }
	            com=-1;
            
	            repeat(11){
	                if (com+1<=10){
	                    com+=1;
	                    v=0;
	                    repeat(300){
	                        v+=1;normal_hp=true;
	                        if (obj_ini.race[com,v]>1) then normal_hp=false;
                        
                        
	                        if (obj_ini.role[com,v]!="Chapter Master"){
	                            if (obj_ini.wid[com,v]=run) and (obj_ini.loc[com,v]=name) and (obj_ini.armor[com,v]!="Dreadnought") and (apoth>0) and (obj_ini.hp[com,v]<100) and (normal_hp=true){
	                                obj_ini.hp[com,v]+=heal;apoth-=1;
	                                if (obj_ini.hp[com,v]>100) then obj_ini.hp[com,v]=100;
	                            }
	                        }
                        
                        
	                        if (obj_ini.role[com,v]="Chapter Master"){
	                            if (string_count("Paragon",string(obj_ini.adv[1])+string(obj_ini.adv[2])+string(obj_ini.adv[3])+string(obj_ini.adv[4]))>0){
	                                if (obj_ini.wid[com,v]=run) and (obj_ini.loc[com,v]=name) and (obj_ini.armor[com,v]!="Dreadnought") and (apoth>0) and (obj_ini.hp[com,v]<130) and (normal_hp=true){
	                                    obj_ini.hp[com,v]+=heal;apoth-=1;
	                                    if (obj_ini.hp[com,v]>130) then obj_ini.hp[com,v]=130;
	                                }
	                            }
	                            if (string_count("Paragon",string(obj_ini.adv[1])+string(obj_ini.adv[2])+string(obj_ini.adv[3])+string(obj_ini.adv[4]))=0){
	                                if (obj_ini.wid[com,v]=run) and (obj_ini.loc[com,v]=name) and (obj_ini.armor[com,v]!="Dreadnought") and (apoth>0) and (obj_ini.hp[com,v]<100) and (normal_hp=true){
	                                    obj_ini.hp[com,v]+=heal;apoth-=1;
	                                    if (obj_ini.hp[com,v]>100) then obj_ini.hp[com,v]=100;
	                                }
	                            }
	                        }
                        
                        
                        
	                    }
	                }
	            }
	            com=-1;
            
            
            
            
            
	        }
        
	        if (apoth>0){
	            com=0;v=0;
	            repeat(300){
	                v+=1;normal_hp=true;
	                if (obj_ini.race[com,v]>1) then normal_hp=false;
	                if (obj_ini.role[com,v]="Skitarii"){normal_hp=false;mixhp=40;}
	                if (obj_ini.role[com,v]="Techpriest"){normal_hp=false;mixhp=50;}
	                if (obj_ini.role[com,v]="Crusader"){normal_hp=false;mixhp=30;}
	                if (obj_ini.role[com,v]="Ranger"){normal_hp=false;mixhp=40;}
	                if (obj_ini.role[com,v]="Sister of Battle"){normal_hp=false;mixhp=40;}
	                if (obj_ini.role[com,v]="Sister Hospitaler"){normal_hp=false;mixhp=40;}
	                if (obj_ini.role[com,v]="Ork Sniper"){normal_hp=false;mixhp=45;}
	                if (obj_ini.role[com,v]="Flash Git"){normal_hp=false;mixhp=65;}
                
	                if (obj_ini.wid[com,v]=run) and (obj_ini.loc[com,v]=name) and (apoth>0) and (obj_ini.hp[com,v]<mixhp) and (normal_hp=false){
	                    obj_ini.hp[com,v]+=20;apoth-=1;
	                    if (obj_ini.hp[com,v]>mixhp) then obj_ini.hp[com,v]=mixhp;
	                }
	            }
	        }
        
        
        
	        com=-1;
	        if (tick>0){
	            repeat(11){
	                if (com+1<=10){
	                    com+=1;
	                    v=0;
	                    repeat(300){
	                        v+=1;
	                        if (obj_ini.race[com,v]=1) and (obj_ini.wid[com,v]=run) and (obj_ini.loc[com,v]=name) and (string_count("Dread",obj_ini.armor[com,v])>0) and (tick>0) and (obj_ini.hp[com,v]<100){
	                            obj_ini.hp[com,v]+=repair;tick-=1;
	                            if (obj_ini.hp[com,v]>100) then obj_ini.hp[com,v]=100;
	                        }
	                    }
	                }
	            }
	            com=-1;
            
	            repeat(11){
	                if (com+1<=10){
	                    com+=1;
	                    v=0;
	                    repeat(300){
	                        v+=1;
	                        if (obj_ini.race[com,v]=1) and (obj_ini.wid[com,v]=run) and (obj_ini.loc[com,v]=name) and (string_count("Dread",obj_ini.armor[com,v])>0) and (tick>0) and (obj_ini.hp[com,v]<100){
	                            obj_ini.hp[com,v]+=repair;tick-=1;
	                            if (obj_ini.hp[com,v]>100) then obj_ini.hp[com,v]=100;
	                        }
	                    }
	                }
	            }
	            com=-1;
	        }
        
        
        
        
	        com=-1;
	        if (tick>0){
	            repeat(11){
	                if (com+1<=10){
	                    com+=1;
	                    v=0;
	                    repeat(200){
	                        v+=1;
                        
	                        if (obj_ini.veh_race[com,v]=1) and (obj_ini.veh_wid[com,v]=run) and (obj_ini.veh_loc[com,v]=name) and (tick>0) and (obj_ini.veh_hp[com,v]<50){
	                            obj_ini.veh_hp[com,v]+=10;tick-=1;
	                            if (obj_ini.veh_hp[com,v]>100) then obj_ini.veh_hp[com,v]=100;
	                        }
	                    }
	                }
	            }
	            com=-1;
            
	            repeat(11){
	                if (com+1<=10){
	                    com+=1;
	                    v=0;
	                    repeat(200){
	                        v+=1;
	                        if (obj_ini.veh_race[com,v]=1) and (obj_ini.veh_wid[com,v]=run) and (obj_ini.veh_loc[com,v]=name) and (tick>0) and (obj_ini.veh_hp[com,v]<100){
	                            obj_ini.veh_hp[com,v]+=10;tick-=1;
	                            if (obj_ini.veh_hp[com,v]>100) then obj_ini.veh_hp[com,v]=100;
	                        }
	                    }
	                }
	            }
	            com=-1;
            
	            repeat(11){
	                if (com+1<=10){
	                    com+=1;
	                    v=0;
	                    repeat(200){
	                        v+=1;
	                        if (obj_ini.veh_race[com,v]=1) and (obj_ini.veh_wid[com,v]=run) and (obj_ini.veh_loc[com,v]=name) and (tick>0) and (obj_ini.veh_hp[com,v]<100){
	                            obj_ini.veh_hp[com,v]+=10;tick-=1;
	                            if (obj_ini.veh_hp[com,v]>100) then obj_ini.veh_hp[com,v]=100;
	                        }
	                    }
	                }
	            }
	            com=-1;
            
	        }
        
        
        
        
        
        
	    }
    
	}


}
