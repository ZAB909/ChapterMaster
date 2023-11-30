function scr_shoot(argument0, argument1, argument2, argument3, argument4) {

	// Argument0: Weapon number
	// Argument1: Target object
	// Argument2: Target dudes
	// Argument3: "att" or "arp" or "highest"
	// Argument4: melee or ranged

	// This massive clusterfuck of a script uses the newly determined weapon and target data to attack and assign damage




	var j;j=0;
	repeat(100){j+=1;
	    obj_ncombat.dead_ene[j]="";
	    obj_ncombat.dead_ene_n[j]=0;
	}obj_ncombat.dead_enemies=0;








	if (obj_ncombat.wall_destroyed=1) then exit;

	// argument1.hostile_men=0;

	if (argument0>0) and (instance_exists(argument1)) and (owner=eFACTION.Imperium){
	    var shots_fired,stop,damage_type,doom;
	    shots_fired=wep_num[argument0];doom=0;
    
	    if (shots_fired!=1) and (obj_ncombat.enemy=5) and (argument4!="melee") then doom=0.3;
	    if (shots_fired!=1) and (obj_ncombat.enemy=6) and (argument4!="melee") then doom=0.4;
	    if (shots_fired!=1) and (obj_ncombat.enemy=7) and (argument4!="melee") then doom=0.2;
	    if (shots_fired!=1) and (obj_ncombat.enemy=8) and (argument4!="melee") then doom=0.4;
	    if (shots_fired!=1) and (obj_ncombat.enemy=9) and (argument4!="melee") then doom=0.4;
	    if (obj_ncombat.enemy=11){att[argument0]=round(att[argument0]*1.15);apa[argument0]=round(apa[argument0]*1.15);}
	    if (obj_ncombat.enemy=10) and (obj_ncombat.threat=7) then doom=1;
    
	    damage_type="";
	    stop=0;targeh=argument2;
    
	    if (shots_fired=0) then exit;
	    if (ammo[argument0]=0){stop=1;exit;}
	    if (ammo[argument0]>0) then ammo[argument0]-=1;
    
    
    
    
	    if (argument3!="medi") then damage_type=argument3;
	    if (argument3="medi"){
	        damage_type="att";
	        if (att[argument0]<apa[argument0]) then damage_type="arp";
	    }
	    if (wep[argument0]="Web Spinner") then damage_type="status";
    
    
    
    
    
	    if (damage_type="status") and (stop=0) and (shots_fired>0){
	        var a,b;a=0;b=shots_fired;
	        if (splash[argument0]=1) and (argument4!="wall"){shots_fired=shots_fired*3;}
	        if (b>0) and (argument4!="wall") and (instance_exists(argument1)){
	            argument1.hostile_shots=b;
	            if (wep_owner[argument0]="assorted") then argument1.hostile_shooters=999;
	            if (wep_owner[argument0]!="assorted") then argument1.hostile_shooters=1;
	            argument1.hostile_damage=0;
	            argument1.hostile_weapon=wep[argument0];
	            argument1.hostile_men=1;
	            // argument1.hostile_men=0;
	            argument1.hostile_range=range[argument0];
	            argument1.hostile_splash=splash[argument0];
	            with(argument1){scr_clean(999);}
	        }
	    }
	    if (damage_type="att") and (att[argument0]>0) and (stop=0) and (shots_fired>0){
	        var a,b;
	        a=att[argument0];
	        if (argument4="melee"){
	            if (shots_fired>(argument1.men-argument1.dreads)*2){
	                doom=((argument1.men-argument1.dreads)*2)/shots_fired;
	            }
	        }
	        b=shots_fired;
        
	        if (doom!=0) and (shots_fired>1){a=floor((doom*a));b=floor(b*doom);}
	        if (splash[argument0]=1) and (argument4!="wall"){shots_fired=shots_fired*3;}
        
	        if (b>0) and (argument4!="wall") and (instance_exists(argument1)){
	            argument1.hostile_shots=b;
	            if (wep_owner[argument0]="assorted") then argument1.hostile_shooters=999;
	            if (wep_owner[argument0]!="assorted") then argument1.hostile_shooters=1;
	            argument1.hostile_damage=a/b;
	            argument1.hostile_weapon=wep[argument0];
	            // argument1.hostile_men=0;
	            argument1.hostile_men=1;
	            argument1.hostile_range=range[argument0];
	            argument1.hostile_splash=splash[argument0];
	            if (argument1.hostile_splash=1) then argument1.hostile_damage+=10;
            
	            with(argument1){scr_clean(999);}
	        }
	    }
    
	    if ((damage_type="arp") or (damage_type="dread")) and (apa[argument0]>0) and (stop=0) and (shots_fired>0){
	        var a,b;
	        a=att[argument0];
	        if (att[argument0]=0) then a=shots_fired;
        
	        if (argument4="melee"){
	            if (shots_fired>((argument1.veh+argument1.dreads)*5)){
	                doom=((argument1.veh+argument1.dreads)*5)/shots_fired;
	            }
	        }
	        b=shots_fired;
        
	        if (doom!=0) and (shots_fired>1){a=floor((doom*a));b=floor(b*doom);}
	        if (splash[argument0]=1) and (argument4!="wall"){shots_fired=shots_fired*3;}
        
        
	        if (a=0) then a=shots_fired*doom;
        
	        if (b>0) and (argument4!="wall") and (instance_exists(argument1)){
	            argument1.hostile_shots=b;
	            if (wep_owner[argument0]="assorted") then argument1.hostile_shooters=999;
	            if (wep_owner[argument0]!="assorted") then argument1.hostile_shooters=1;
	            argument1.hostile_damage=a/b;
	            argument1.hostile_weapon=wep[argument0];
            
	            // 135; this might be the problem right here
	            // this is the problem right here
	            argument1.hostile_men=0;
	            // if (damage_type="dread") then argument1.hostile_men=1;
            
	            argument1.hostile_range=range[argument0];
	            argument1.hostile_splash=splash[argument0];
	            if (argument1.hostile_splash=1) then argument1.hostile_damage+=10;
            
            
	            with(argument1){scr_clean(999);}
	        }
        
        
	        if (b>0) and (argument4="wall") and (instance_exists(argument1)){
	            var dam2,totes_dam,dest;
	            dest=0;dam2=(a/b)-argument1.ac[1];
	            if (dam2<0) then dam2=0;totes_dam=round(dam2)*b;
	            argument1.hp[1]-=dam2;
	            argument1.hostile_shots=b;
	            argument1.hostile_weapon=wep[argument0];
	            argument1.hostile_range=range[argument0];
	            argument1.hostile_damage=dam2;
            
	            if (argument1.hp[1]<=0) then dest=1;
	            scr_flavor2(dest,"wall");
	        }
        
	    }
	}














	// player_defenses=0;player_silos=0;














	if (instance_exists(argument1)) and (owner  = eFACTION.Player){
	    var shots_fired,stop,damage_type;
    
	    if (argument0>0){shots_fired=wep_num[argument0];}
	    if (shots_fired=0) then exit;
	    /*if (argument0<-40){
	        if (argument0=-53){
	            if (player_silos>30) then shots_fired=30;
	            if (player_silos<30) then shots_fired=player_silos;
	        }
	        if (argument0=-51) or (argument0=-52){
	            shots_fired=round(player_silos/2);
	        }
	    }*/
    
	    damage_type="";stop=0;targeh=argument2;
    
    
	    repeat(10){if (argument1.dudes_hp[targeh]=0) then targeh+=1;}
	    if (argument1.dudes_hp[targeh]=0) then stop=1;
    
    
	    if (argument0>0){
	        if (ammo[argument0]=0) then stop=1;
	        if (ammo[argument0]>0) then ammo[argument0]-=1;
	    }
	    if (wep[argument0]="Missile Silo") then obj_ncombat.player_silos-=min(obj_ncombat.player_silos,30);

    
	    if (argument3!="highest") then damage_type=argument3;
	    if (argument3="highest") and (argument0>0){
	        damage_type="att";if (att[argument0]>=100) and (apa[argument0]>0) then damage_type="arp";
	    }
	    if (argument3="highest") and (argument0=-51) then damage_type="att";
	    if (argument3="highest") and (argument0=-52) then damage_type="att";
	    if (argument3="highest") and (argument0=-53) then damage_type="att";
    
    
    
	    /*if (argument0<-40){// Defenses shooting
	        var wii,at,ar,spla,a,b,c,eac;
	        wii="";at=0;ar=0;spla=0;a=0;b=0;c=0;eac=0;
        
	        spla=1;
	        if (argument0=-51){wii="Heavy Bolter Emplacement";at=160;ar=0;}
	        if (argument0=-52){wii="Missile Launcher Emplacement";at=200;ar=1;}
	        if (argument0=-53){wii="Missile Silo";at=250;ar=0;}
        
        
	        a=at*argument1.dudes_dr[targeh];
	        eac=argument1.dudes_ac[targeh];
	        if (argument1.dudes_vehicle[targeh]=0){
	            if (ar=1) then eac=0;
	            if (ar=-1) then eac=eac*6;
	        }
	        if (argument1.dudes_vehicle[targeh]=1){
	            if (ar=-1) then eac=a;
	            if (ar=0) then eac=eac*6;
	            if (ar=-1) then eac=a;
	        }
	        b=a-eac;if (b<=0) then b=0;
	        c=b*shots_fired;
        
	        var casualties,ponies,onceh;onceh=0;ponies=0;
	        if (spla=0) then casualties=min(floor(c/argument1.dudes_hp[targeh]),shots_fired);
	        if (spla!=0) then casualties=floor(c/argument1.dudes_hp[targeh]);
        
	        ponies=argument1.dudes_num[targeh];
	        if (argument1.dudes_num[targeh]=1) and ((argument1.dudes_hp[targeh]-c)<=0){casualties=1;}
        
	        if (argument1.dudes_num[targeh]-casualties<0) then casualties=ponies;
	        if (casualties<0) then casualties=0;
	        scr_flavor(argument0,argument1,argument2,shots_fired,casualties);
	        if (argument1.dudes_num[targeh]=1) and (c>0) then argument1.dudes_hp[targeh]-=c;
        
	        if (casualties>=1){
	            argument1.dudes_num[targeh]-=casualties;
	            obj_ncombat.enemy_forces-=casualties;
	        }
        
	    }*/
    
    
    
    
	    if (argument0>0) or (argument0<-40){// Normal shooting
	        var overkill,damage_remaining,shots_remaining;
	        overkill=0;damage_remaining=0;shots_remaining=0;
        
        
	        var that_works;that_works=false;
        
	        if (argument0>0){if (att[argument0]>0) and (stop=0) then that_works=true;}
	        if (argument0<-40) and (stop=0) then that_works=true;
        
	        if (that_works=true){
	            var a,b,c,eac,ap,spla,wii;
	            a=0;b=0;c=0;eac=0;ap=0;spla=0;wii="";
            
	            if (argument0>0){
	                a=(att[argument0]/wep_num[argument0])*argument1.dudes_dr[targeh];
	                ap=apa[argument0];
	                spla=splash[argument0];
	            }// Average damage
	            if (argument0<-40){
	                wii="";spla=1;
                
	                if (argument0=-51){wii="Heavy Bolter Emplacement";at=160;ap=0;}
	                if (argument0=-52){wii="Missile Launcher Emplacement";at=200;ap=1;}
	                if (argument0=-53){wii="Missile Silo";at=250;ar=0;}
	            }
            
	            eac=argument1.dudes_ac[targeh];
	            if (argument1.dudes_vehicle[targeh]=0){
	                if (ap=1) then eac=0;
	                if (ap=-1) then eac=eac*6;
	            }
	            if (argument1.dudes_vehicle[targeh]=1){
	                if (ap=0) then eac=eac*6;
	                if (ap=-1) then eac=a;
	            }
	            b=a-eac;if (b<=0) then b=0;// Average after armour
            
	            c=b*shots_fired;// New damage
            
	            var casualties,ponies,onceh;onceh=0;ponies=0;
	            if (spla=0) then casualties=min(floor(c/argument1.dudes_hp[targeh]),shots_fired);
	            if (spla!=0) then casualties=floor(c/argument1.dudes_hp[targeh]);
            
	            ponies=argument1.dudes_num[targeh];
	            if (argument1.dudes_num[targeh]=1) and ((argument1.dudes_hp[targeh]-c)<=0){casualties=1;}
            
            
            
            
            
	            if (argument1.dudes_num[targeh]-casualties<0){
	                overkill=casualties-argument1.dudes_num[targeh];
	                damage_remaining=c-(overkill*argument1.dudes_hp[targeh]);
                
	                var proportional_shots;
	                proportional_shots=round(damage_remaining/a);
	                shots_remaining=proportional_shots;
                
	                // show_message("killed "+string(casualties)+"x "+string(argument1.dudes[targeh]));
	                // show_message("did "+string(c)+" damage with "+string(shots_fired)+" shots fired, have "+string(damage_remaining)+" damage remaining (about "+string(shots_remaining)+" shots)");
	            }
            
            
            
            
            
	            if (argument1.dudes_num[targeh]-casualties<0) then casualties=ponies;
	            if (casualties<0) then casualties=0;
            
            
	            if (casualties>=1){
	                var iii,found,openz;
	                iii=0;found=0;openz=0;
	                repeat(40){iii+=1;
	                    if (found=0){
	                        if (obj_ncombat.dead_ene[iii]="") and (openz=0) then openz=iii;
	                        if (obj_ncombat.dead_ene[iii]=argument1.dudes[targeh]) and (found=0){
	                            found=iii;obj_ncombat.dead_ene_n[obj_ncombat.dead_enemies]+=casualties;
	                        }
	                    }
	                }
	                if (found=0){
	                    obj_ncombat.dead_enemies+=1;
	                    obj_ncombat.dead_ene[openz]=string(argument1.dudes[targeh]);
	                    obj_ncombat.dead_ene_n[openz]=casualties;
	                }
                
	                // if (casualties=1) then obj_ncombat.dead_ene[obj_ncombat.dead_enemies]="1 "+string(argument1.dudes[targeh]);
	                // if (casualties>1) then obj_ncombat.dead_ene[obj_ncombat.dead_enemies]=string(casualties)+" "+string(argument1.dudes[targeh]);
	            }
            
            
	            var k;k=0;
	            if (damage_remaining>0) and (shots_remaining>0) then repeat(10){
	                if (damage_remaining>0) and (shots_remaining>0){
	                    var godd;godd=0;
	                    k=targeh;
                    
	                    // Find similar target in this same group
	                    repeat(10){k+=1;
	                        if (godd=0){
	                            if (argument1.dudes_num[k]>0) and (argument1.dudes_vehicle[k]=argument1.dudes_vehicle[targeh]){
	                                godd=k;
	                            }
	                        }
	                    }
	                    k=targeh;
	                    if (godd=0) then repeat(10){k-=1;
	                        if (godd=0) and (k>=1){
	                            if (argument1.dudes_num[k]>0) and (argument1.dudes_vehicle[k]=argument1.dudes_vehicle[targeh]){
	                                godd=k;
	                            }
	                        }
	                    }
                    
                    
	                    // Found a similar target to get the damage
	                    if (godd>0) and (damage_remaining>0) and (shots_remaining>0){
	                        var a2,b2,c2,eac2,ap2;ap2=damage_remaining;
	                        a2=a;// Average damage
                        
	                        eac2=argument1.dudes_ac[godd];
	                        if (argument1.dudes_vehicle[godd]=0){
	                            if (ap2=1) then eac2=0;
	                            if (ap2=-1) then eac2=eac2*6;
	                        }
	                        if (argument1.dudes_vehicle[godd]=1){
	                            if (ap2=0) then eac2=eac2*6;
	                            if (ap2=-1) then eac2=a;
	                        }
	                        b2=a2-eac2;if (b2<=0) then b2=0;// Average after armour
                        
	                        c2=b2*shots_remaining;// New damage
                        
	                        var casualties2,ponies2,onceh2;onceh2=0;ponies2=0;
	                        if (spla=0) then casualties2=min(floor(c2/argument1.dudes_hp[godd]),shots_remaining);
	                        if (spla!=0) then casualties2=floor(c2/argument1.dudes_hp[godd]);
                        
	                        ponies2=argument1.dudes_num[godd];
	                        if (argument1.dudes_num[godd]=1) and ((argument1.dudes_hp[godd]-c2)<=0){casualties2=1;}
	                        if (argument1.dudes_num[godd]<casualties2) then casualties2=argument1.dudes_num[godd];
	                        if (casualties2<1){casualties2=0;damage_remaining=0;overkill=0;shots_remaining=0;}
                        
	                        if (casualties2>=1) and (shots_fired>0){
	                            var iii,found,openz;
	                            iii=0;found=0;openz=0;
	                            repeat(40){iii+=1;
	                                if (found=0){
	                                    if (obj_ncombat.dead_ene[iii]="") and (openz=0) then openz=iii;
	                                    if (obj_ncombat.dead_ene[iii]=argument1.dudes[godd]) and (found=0){
	                                        found=iii;obj_ncombat.dead_ene_n[obj_ncombat.dead_enemies]+=casualties;
	                                    }
	                                }
	                            }
	                            if (found=0){
	                                obj_ncombat.dead_enemies+=1;
	                                obj_ncombat.dead_ene[openz]=string(argument1.dudes[godd]);
	                                obj_ncombat.dead_ene_n[openz]=casualties;
	                            }
                            
                            
	                            /*obj_ncombat.dead_enemies+=1;
	                            if (casualties2=1) then obj_ncombat.dead_ene[obj_ncombat.dead_enemies]="1 "+string(argument1.dudes[godd]);
	                            if (casualties2>1) then obj_ncombat.dead_ene[obj_ncombat.dead_enemies]=string(casualties2)+" "+string(argument1.dudes[godd]);
	                            obj_ncombat.dead_enemies+=1;
	                            obj_ncombat.dead_ene[obj_ncombat.dead_enemies]=string(argument1.dudes[godd]);
	                            obj_ncombat.dead_ene_n[obj_ncombat.dead_enemies]=casualties;*/
                            
	                            argument1.dudes_num[godd]-=casualties2;
	                            obj_ncombat.enemy_forces-=casualties2;
	                        }
                        
	                        if (casualties2>=1){
	                            if (argument1.dudes_num[godd]<=0){
	                                overkill=casualties2-argument1.dudes_num[godd];
	                                damage_remaining-=casualties2*argument1.dudes_hp[godd];
                                
	                                var proportional_shots;
	                                proportional_shots=round(damage_remaining/a2);
	                                shots_remaining=proportional_shots;
                                
	                                // show_message("killed "+string(casualties2)+"x "+string(argument1.dudes[godd]));
	                                // show_message("did "+string(c)+" damage with "+string(proportional_shots)+" shots fired, have "+string(damage_remaining)+" damage remaining");
	                            }
	                        }
                    
                    
                    
                    
                    
                    
                        
                    
                    
                    
                    
	                    }
	                }
	            }// End repeat 10
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
	            scr_flavor(argument0,argument1,argument2,shots_fired-wep_rnum[argument0],casualties);
            
            
            
            
            
            
	            if (argument1.dudes_num[targeh]=1) and (c>0) then argument1.dudes_hp[targeh]-=c;// Need special flavor here for just damaging
            
	            if (casualties>=1){
	                argument1.dudes_num[targeh]-=casualties;
	                obj_ncombat.enemy_forces-=casualties;
                
                
                
	                /*if (obj_ncombat.enemy=5) and (argument1.faith[targeh]=0) and (argument1.dudes_vehicle[targeh]=0){
	                    if (argument1.dudes_num[targeh]<=argument1.dudes_onum[targeh]/4) and (argument1.dudes_num[targeh]>0){
	                        var fdice;fdice=choose(0,1);
	                        if (fdice=1){
	                            var faith_mes,mesr;faith_mes="";mesr=choose(1,2,3,4);
	                            argument1.faith[targeh]=1;
	                            argument1.dudes_dr[targeh]=max(0.65,argument1.dudes_dr[targeh]+0.15);
	                            obj_ncombat.messages+=1;
	                            obj_ncombat.message_sz[obj_ncombat.messages]=obj_ncombat.message_sz[obj_ncombat.messages-1]-1;
                            
	                            if (argument1.dudes_num[targeh]=1){
	                                if (mesr=1) then faith_mes="A "+string(argument1.dudes[targeh])+" screams out in anger, their voice thick with divine fury.";
	                                if (mesr=2) then faith_mes="A "+string(argument1.dudes[targeh])+" howls out in Righteous Fury.  They bristle with newfound purpose.";
	                                if (mesr=3) then faith_mes="A "+string(argument1.dudes[targeh])+" roars out litanies to the Emperor as they advance, their wounds forgotten.";
	                                if (mesr=4){
	                                    var mesr2;mesr2=choose(1,2,3,4,5,6);
	                                    if (mesr2=1) then faith_mes="''Death to the blasphemers!'' a "+string(argument1.dudes[targeh])+" "+choose("roars","howls","cries","shouts","bellows")+", the hate in their voice nearly a physical thing.";
	                                    if (mesr2=2) then faith_mes="''Burn!  BURN THEM ALL!'' a "+string(argument1.dudes[targeh])+" "+choose("roars","howls","cries","shouts","bellows")+", the hate in their voice nearly a physical thing.";
	                                    if (mesr2=3) then faith_mes="''Give them the cleansing flame of ABSOLUTION!'' a "+string(argument1.dudes[targeh])+" "+choose("roars","howls","cries","shouts","bellows")+", the hate in their voice nearly a physical thing.";
	                                    if (mesr2=4) then faith_mes="''SHOW NO MERCY!'' a "+string(argument1.dudes[targeh])+" "+choose("roars","howls","cries","shouts","bellows")+", the hate in their voice nearly a physical thing.";
	                                    if (mesr2=5) then faith_mes="''DEATH TO THE IMPURE!'' a "+string(argument1.dudes[targeh])+" "+choose("roars","howls","cries","shouts","bellows")+", the hate in their voice nearly a physical thing.";
	                                    if (mesr2=6) then faith_mes="''TAKE THEIR LIVES!'' a "+string(argument1.dudes[targeh])+" "+choose("roars","howls","cries","shouts","bellows")+", the hate in their voice nearly a physical thing.";
	                                }
	                            }
	                            if (argument1.dudes_num[targeh]>1){
	                                if (mesr=1) then faith_mes=string(argument1.dudes_num[targeh])+" "+string(argument1.dudes[targeh])+" scream in anger, their voice thick with divine fury.";
	                                if (mesr=2) then faith_mes=string(argument1.dudes_num[targeh])+" "+string(argument1.dudes[targeh])+" howl out in Righteous Fury.  They bristle with newfound purpose.";
	                                if (mesr=3) then faith_mes=string(argument1.dudes_num[targeh])+" "+string(argument1.dudes[targeh])+" roar out litanies to the Emperor as they advance, their wounds forgotten.";
	                                if (mesr=4) then faith_mes=string(argument1.dudes_num[targeh])+" "+string(argument1.dudes[targeh])+" scream, shout, and roar out litanies, the hate in their voices nearly a tangible thing.";
	                            }
	                            obj_ncombat.message[obj_ncombat.messages]="^"+string(faith_mes);
	                            obj_ncombat.message_priority[obj_ncombat.messages]=obj_ncombat.message_priority[obj_ncombat.messages-1];
                            
                            
	                            obj_ncombat.alarm[3]=2;
	                        }
	                    }
	                }*/
                
	            }
	        }
	    }
    
    
	    if (stop=0) then with(argument1){
	        var j,good,open;
	        j=0;good=0;open=0;
	        repeat(20){j+=1;
	            if (dudes_num[j]<=0){
	                dudes[j]="";dudes_special[j]="";dudes_num[j]=0;dudes_ac[j]=0;
	                dudes_hp[j]=0;dudes_vehicle[j]=0;dudes_damage[j]=0;
	            }
	            if (dudes[j]="") and (dudes[j+1]!=""){
	                dudes[j]=dudes[j+1]dudes_special[j]=dudes_special[j+1];
	                dudes_num[j]=dudes_num[j+1];dudes_ac[j]=dudes_ac[j+1];
	                dudes_hp[j]=dudes_hp[j+1];dudes_vehicle[j]=dudes_vehicle[j+1];
	                dudes_damage[j]=dudes_damage[j+1];
                
	                dudes[j+1]="";dudes_special[j+1]="";dudes_num[j+1]=0;dudes_ac[j+1]=0;
	                dudes_hp[j+1]=0;dudes_vehicle[j+1]=0;dudes_damage[j+1]=0;
	            }
	        }
	        j=0;
	    }
	    if (argument1.men+argument1.veh+argument1.medi=0) and (argument1.owner!=1) {
	        with(argument1){instance_destroy();}
	    }
    
	    if (argument4="melee"){
	        // lololol
	    }
    
	}










	exit;
	// Old player shooting code beneath here

	if (instance_exists(argument1)) and (owner  = eFACTION.Player){
	    var shots_fired,stop,damage_type;
    
	    if (argument0>0){shots_fired=wep_num[argument0];}
	    if (shots_fired=0) then exit;
	    /*if (argument0<-40){
	        if (argument0=-53){
	            if (player_silos>30) then shots_fired=30;
	            if (player_silos<30) then shots_fired=player_silos;
	        }
	        if (argument0=-51) or (argument0=-52){
	            shots_fired=round(player_silos/2);
	        }
	    }*/
    
	    damage_type="";stop=0;targeh=argument2;
    
    
	    repeat(10){if (argument1.dudes_hp[targeh]=0) then targeh+=1;}
	    if (argument1.dudes_hp[targeh]=0) then stop=1;
    
    
	    if (argument0>0){
	        if (ammo[argument0]=0) then stop=1;
	        if (ammo[argument0]>0) then ammo[argument0]-=1;
	    }
	    if (wep[argument0]="Missile Silo") then obj_ncombat.player_silos-=min(obj_ncombat.player_silos,30);

    
	    if (argument3!="highest") then damage_type=argument3;
	    if (argument3="highest") and (argument0>0){
	        damage_type="att";if (att[argument0]>=100) and (apa[argument0]>0) then damage_type="arp";
	    }
	    if (argument3="highest") and (argument0=-51) then damage_type="att";
	    if (argument3="highest") and (argument0=-52) then damage_type="att";
	    if (argument3="highest") and (argument0=-53) then damage_type="att";
    
    
    
	    if (argument0<-40){// Defenses shooting
	        var wii,at,ar,spla,a,b,c,eac;
	        wii="";at=0;ar=0;spla=0;a=0;b=0;c=0;eac=0;
        
	        spla=1;
	        if (argument0=-51){wii="Heavy Bolter Emplacement";at=160;ar=0;}
	        if (argument0=-52){wii="Missile Launcher Emplacement";at=200;ar=1;}
	        if (argument0=-53){wii="Missile Silo";at=250;ar=0;}
        
	        // if (damage_type="att"){
	            a=at*argument1.dudes_dr[targeh];

	            eac=argument1.dudes_ac[targeh];
	            if (argument1.dudes_vehicle[targeh]=0){
	                if (ar=1) then eac=0;
	                if (ar=-1) then eac=eac*6;
	            }
	            if (argument1.dudes_vehicle[targeh]=1){
	                if (ar=-1) then eac=a;
	                if (ar=0) then eac=eac*6;
	                if (ar=-1) then eac=a;
	            }
	            b=a-eac;if (b<=0) then b=0;
            
	            c=b*shots_fired;
            
	            var casualties,ponies,onceh;onceh=0;ponies=0;
	            if (spla=0) then casualties=min(floor(c/argument1.dudes_hp[targeh]),shots_fired);
	            if (spla!=0) then casualties=floor(c/argument1.dudes_hp[targeh]);
	        // }
	        /*if (damage_type="arp"){
	            a=ar*argument1.dudes_dr[targeh];
	            b=a-argument1.dudes_ac[targeh];
	            c=b*shots_fired;
            
	            var casualties,ponies,onceh;onceh=0;ponies=0;
	            if (spla=0) then casualties=min(floor(c/argument1.dudes_hp[targeh]),shots_fired);
	            if (spla!=0) then casualties=floor(c/argument1.dudes_hp[targeh]);
	        }*/
        
	        ponies=argument1.dudes_num[targeh];
	        if (argument1.dudes_num[targeh]=1) and ((argument1.dudes_hp[targeh]-c)<=0){casualties=1;}
        
	        if (argument1.dudes_num[targeh]-casualties<0) then casualties=ponies;
	        if (casualties<0) then casualties=0;
	        scr_flavor(argument0,argument1,argument2,shots_fired,casualties);
	        if (argument1.dudes_num[targeh]=1) and (c>0) then argument1.dudes_hp[targeh]-=c;
        
	        if (casualties>=1){
	            argument1.dudes_num[targeh]-=casualties;
	            obj_ncombat.enemy_forces-=casualties;
	        }
        
	    }
    
    
    
    
	    if (argument0>0){// Normal shooting
	        if (att[argument0]>0) and (stop=0){
	            var a,b,c,eac,ap;ap=apa[argument0];
	            a=(att[argument0]/wep_num[argument0])*argument1.dudes_dr[targeh];// Average damage
            
	            eac=argument1.dudes_ac[targeh];
	            if (argument1.dudes_vehicle[targeh]=0){
	                if (ap=1) then eac=0;
	                if (ap=-1) then eac=eac*6;
	            }
	            if (argument1.dudes_vehicle[targeh]=1){
	                if (ap=0) then eac=eac*6;
	                if (ap=-1) then eac=a;
	            }
	            b=a-eac;if (b<=0) then b=0;// Average after armour
            
	            c=b*shots_fired;// New damage
            
	            var casualties,ponies,onceh;onceh=0;ponies=0;
	            if (splash[argument0]=0) then casualties=min(floor(c/argument1.dudes_hp[targeh]),shots_fired);
	            if (splash[argument0]!=0) then casualties=floor(c/argument1.dudes_hp[targeh]);
            
	            ponies=argument1.dudes_num[targeh];
	            if (argument1.dudes_num[targeh]=1) and ((argument1.dudes_hp[targeh]-c)<=0){casualties=1;}
            
	            if (argument1.dudes_num[targeh]-casualties<0) then casualties=ponies;
	            if (casualties<0) then casualties=0;
	            scr_flavor(argument0,argument1,argument2,shots_fired-wep_rnum[argument0],casualties);
            
	            if (argument1.dudes_num[targeh]=1) and (c>0) then argument1.dudes_hp[targeh]-=c;// Need special flavor here for just damaging
            
	            if (casualties>=1){
	                argument1.dudes_num[targeh]-=casualties;
	                obj_ncombat.enemy_forces-=casualties;
                
                
                
	                if (obj_ncombat.enemy=5) and (argument1.faith[targeh]=0) and (argument1.dudes_vehicle[targeh]=0){
	                    if (argument1.dudes_num[targeh]<=argument1.dudes_onum[targeh]/4) and (argument1.dudes_num[targeh]>0){
	                        var fdice;fdice=choose(0,1);
	                        if (fdice=1){
	                            var faith_mes,mesr;faith_mes="";mesr=choose(1,2,3,4);
	                            argument1.faith[targeh]=1;
	                            argument1.dudes_dr[targeh]=max(0.65,argument1.dudes_dr[targeh]+0.15);
	                            obj_ncombat.messages+=1;
	                            obj_ncombat.message_sz[obj_ncombat.messages]=obj_ncombat.message_sz[obj_ncombat.messages-1]-1;
                            
	                            if (argument1.dudes_num[targeh]=1){
	                                if (mesr=1) then faith_mes="A "+string(argument1.dudes[targeh])+" screams out in anger, their voice thick with divine fury.";
	                                if (mesr=2) then faith_mes="A "+string(argument1.dudes[targeh])+" howls out in Righteous Fury.  They bristle with newfound purpose.";
	                                if (mesr=3) then faith_mes="A "+string(argument1.dudes[targeh])+" roars out litanies to the Emperor as they advance, their wounds forgotten.";
	                                if (mesr=4){
	                                    var mesr2;mesr2=choose(1,2,3,4,5,6);
	                                    if (mesr2=1) then faith_mes="''Death to the blasphemers!'' a "+string(argument1.dudes[targeh])+" "+choose("roars","howls","cries","shouts","bellows")+", the hate in their voice nearly a physical thing.";
	                                    if (mesr2=2) then faith_mes="''Burn!  BURN THEM ALL!'' a "+string(argument1.dudes[targeh])+" "+choose("roars","howls","cries","shouts","bellows")+", the hate in their voice nearly a physical thing.";
	                                    if (mesr2=3) then faith_mes="''Give them the cleansing flame of ABSOLUTION!'' a "+string(argument1.dudes[targeh])+" "+choose("roars","howls","cries","shouts","bellows")+", the hate in their voice nearly a physical thing.";
	                                    if (mesr2=4) then faith_mes="''SHOW NO MERCY!'' a "+string(argument1.dudes[targeh])+" "+choose("roars","howls","cries","shouts","bellows")+", the hate in their voice nearly a physical thing.";
	                                    if (mesr2=5) then faith_mes="''DEATH TO THE IMPURE!'' a "+string(argument1.dudes[targeh])+" "+choose("roars","howls","cries","shouts","bellows")+", the hate in their voice nearly a physical thing.";
	                                    if (mesr2=6) then faith_mes="''TAKE THEIR LIVES!'' a "+string(argument1.dudes[targeh])+" "+choose("roars","howls","cries","shouts","bellows")+", the hate in their voice nearly a physical thing.";
	                                }
	                            }
	                            if (argument1.dudes_num[targeh]>1){
	                                if (mesr=1) then faith_mes=string(argument1.dudes_num[targeh])+" "+string(argument1.dudes[targeh])+" scream in anger, their voice thick with divine fury.";
	                                if (mesr=2) then faith_mes=string(argument1.dudes_num[targeh])+" "+string(argument1.dudes[targeh])+" howl out in Righteous Fury.  They bristle with newfound purpose.";
	                                if (mesr=3) then faith_mes=string(argument1.dudes_num[targeh])+" "+string(argument1.dudes[targeh])+" roar out litanies to the Emperor as they advance, their wounds forgotten.";
	                                if (mesr=4) then faith_mes=string(argument1.dudes_num[targeh])+" "+string(argument1.dudes[targeh])+" scream, shout, and roar out litanies, the hate in their voices nearly a tangible thing.";
	                            }
	                            obj_ncombat.message[obj_ncombat.messages]="^"+string(faith_mes);
	                            obj_ncombat.message_priority[obj_ncombat.messages]=obj_ncombat.message_priority[obj_ncombat.messages-1];
                            
                            
	                            obj_ncombat.alarm[3]=2;
	                        }
	                    }
	                }
                
	            }
	        }
        
	        /*if (damage_type="arp") and (apa[argument0]>0) and (stop=0){
        
	        // if (damage_type="arp") and (stop=0){var a,b,c;
	            if (att[argument0]<=80) and (apa[argument0]=0) then apa[argument0]=att[argument0];
            
	            a=(apa[argument0]/wep_num[argument0])*argument1.dudes_dr[targeh];// Average damage
	            b=a-argument1.dudes_ac[targeh];// Average after armour
	            c=b*shots_fired;// New damage
            
	            if (c>0) and (b>0){// Find number of casualties
	                var casualties,ponies,onceh;onceh=0;ponies=0;
	                if (splash[argument0]=0) then casualties=min(floor(c/argument1.dudes_hp[targeh]),shots_fired);
	                if (splash[argument0]!=0) then casualties=floor(c/argument1.dudes_hp[targeh]);
                
	                ponies=argument1.dudes_num[targeh];
	                if (argument1.dudes_num[targeh]=1) and ((argument1.dudes_hp[targeh]-c)<=0){casualties=1;}
                
	                if (argument1.dudes_num[targeh]-casualties<0) and (onceh=0) then casualties=ponies;
	                if (casualties<0) then casualties=0;
	                scr_flavor(argument0,argument1,argument2,shots_fired-wep_rnum[argument0],casualties);
                
	                if (argument1.dudes_num[targeh]=1) and (c>0) then argument1.dudes_hp[targeh]-=c;// Need special flavor here for just damaging
                
	                if (casualties>=1){
	                    argument1.dudes_num[targeh]-=casualties;
	                    obj_ncombat.enemy_forces-=casualties;
	                }
	            }
	        }*/
	    }
    
    
	    if (stop=0) then with(argument1){
	        var j,good,open;
	        j=0;good=0;open=0;
	        repeat(20){j+=1;
	            if (dudes_num[j]<=0){
	                dudes[j]="";dudes_special[j]="";dudes_num[j]=0;dudes_ac[j]=0;
	                dudes_hp[j]=0;dudes_vehicle[j]=0;dudes_damage[j]=0;
	            }
	            if (dudes[j]="") and (dudes[j+1]!=""){
	                dudes[j]=dudes[j+1]dudes_special[j]=dudes_special[j+1];
	                dudes_num[j]=dudes_num[j+1];dudes_ac[j]=dudes_ac[j+1];
	                dudes_hp[j]=dudes_hp[j+1];dudes_vehicle[j]=dudes_vehicle[j+1];
	                dudes_damage[j]=dudes_damage[j+1];
                
	                dudes[j+1]="";dudes_special[j+1]="";dudes_num[j+1]=0;dudes_ac[j+1]=0;
	                dudes_hp[j+1]=0;dudes_vehicle[j+1]=0;dudes_damage[j+1]=0;
	            }
	        }
	        j=0;
	    }
	    if (argument1.men+argument1.veh+argument1.medi=0) and (argument1.owner!=1) {
	        with(argument1){instance_destroy();}
	    }
    
	    if (argument4="melee"){
	        // lololol
	    }
    
	}


}
