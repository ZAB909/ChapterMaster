function scr_shoot(weapon_number, target_object, target_dudes, att_or_arp, melee_or_ranged) 
	{

		// weapon_number: Weapon number
		// target_object: Target object
		// target_dudes: Target dudes
		// att_or_arp: "att" or "arp" or "highest"
		// melee_or_ranged: melee or ranged

		// This massive clusterfuck of a script uses the newly determined weapon and target data to attack and assign damage

		var j = 0;
		repeat(100)
			{
				j += 1;
			    obj_ncombat.dead_ene[j] = "";
			    obj_ncombat.dead_ene_n[j] = 0;
			}
		
		obj_ncombat.dead_enemies = 0;

		if (obj_ncombat.wall_destroyed = 1) then exit;

		// target_object.hostile_men=0;

		if (weapon_number > 0) and (instance_exists(target_object)) and (owner = eFACTION.Imperium)
		{
		    var shots_fired;
			var stop;
			var damage_type;
			var doom; // morale damage?
		    shots_fired = wep_num[weapon_number]; 
			doom = 0;
    
		    if (shots_fired != 1) and (obj_ncombat.enemy = 5) and (melee_or_ranged != "melee") then doom = 0.3;
		    if (shots_fired != 1) and (obj_ncombat.enemy = 6) and (melee_or_ranged != "melee") then doom = 0.4;
		    if (shots_fired != 1) and (obj_ncombat.enemy = 7) and (melee_or_ranged != "melee") then doom = 0.2;
		    if (shots_fired != 1) and (obj_ncombat.enemy = 8) and (melee_or_ranged != "melee") then doom = 0.4;
		    if (shots_fired != 1) and (obj_ncombat.enemy = 9) and (melee_or_ranged != "melee") then doom = 0.4;
		    if (obj_ncombat.enemy = 11)
				{
					att[weapon_number] = round(att[weapon_number] * 1.15);
					apa[weapon_number] = round(apa[weapon_number] * 1.15);
				}
		    if (obj_ncombat.enemy = 10) and (obj_ncombat.threat = 7) then doom = 1;
    
		    damage_type = "";
		    stop = 0; 
			targeh = target_dudes;
    
		    if (shots_fired = 0) then exit;
		    
			if (ammo[weapon_number] = 0)
				{
					stop = 1;
					exit;
				}
		    if (ammo[weapon_number] > 0) then ammo[weapon_number] -= 1;
    
   
		    if (att_or_arp != "medi") then damage_type = att_or_arp;
		    if (att_or_arp = "medi")
				{
			        damage_type = "att";
			        if (att[weapon_number] < apa[weapon_number]) then damage_type = "arp";
			    }
		    if (wep[weapon_number] = "Web Spinner") then damage_type = "status";    
		    if (damage_type = "status") and (stop = 0) and (shots_fired > 0)
				{
			        var a, b;
					a = 0;
					b = shots_fired;
			        if (splash[weapon_number] = 1) and (melee_or_ranged != "wall")
						{
							shots_fired = shots_fired * 3;
						}
			        if (b > 0) and (melee_or_ranged != "wall") and (instance_exists(target_object))
						{
				            target_object.hostile_shots = b;
				            if (wep_owner[weapon_number] = "assorted") then target_object.hostile_shooters = 999;
				            if (wep_owner[weapon_number] != "assorted") then target_object.hostile_shooters = 1;
				            target_object.hostile_damage = 0;
				            target_object.hostile_weapon = wep[weapon_number];
				            target_object.hostile_men = 1;
				            // target_object.hostile_men = 0;
				            target_object.hostile_range = range[weapon_number];
				            target_object.hostile_splash = splash[weapon_number];
				            
							with(target_object)
								{
									scr_clean(999);
								}
				        }
			    }
		    if (damage_type = "att") and (att[weapon_number] > 0) and (stop = 0) and (shots_fired > 0)
				{
			        var a, b;
			        a = att[weapon_number];
			        if (melee_or_ranged = "melee")
						{
				            if (shots_fired > (target_object.men - target_object.dreads) * 2)
								{
					                doom = ((target_object.men - target_object.dreads) * 2) / shots_fired;
					            }
				        }
						
			        b = shots_fired;
        
			        if (doom != 0) and (shots_fired > 1)
						{
							a = floor((doom * a));
							b = floor(b * doom);
						}
			        if (splash[weapon_number] = 1) and (melee_or_ranged != "wall")
						{
							shots_fired = shots_fired * 3;
						}
        
			        if (b > 0) and (melee_or_ranged != "wall") and (instance_exists(target_object))
						{
				            target_object.hostile_shots = b;
				            if (wep_owner[weapon_number] = "assorted") then target_object.hostile_shooters = 999;
				            if (wep_owner[weapon_number] != "assorted") then target_object.hostile_shooters = 1;
				            target_object.hostile_damage = a / b;
				            target_object.hostile_weapon = wep[weapon_number];
				            // target_object.hostile_men=0;
				            target_object.hostile_men = 1;
				            target_object.hostile_range = range[weapon_number];
				            target_object.hostile_splash = splash[weapon_number];
				            if (target_object.hostile_splash = 1) then target_object.hostile_damage += 10;
            
				            with(target_object)
								{
									scr_clean(999);
								}
				        }
			    }
    
		    if ((damage_type = "arp") or (damage_type = "dread")) and (apa[weapon_number] > 0) and (stop = 0) and (shots_fired > 0)
				{
			        var a, b;
			        a = att[weapon_number];
			        if (att[weapon_number] = 0) then a = shots_fired;
        
			        if (melee_or_ranged = "melee")
						{
				            if (shots_fired > ((target_object.veh + target_object.dreads) * 5))
								{
					                doom = ((target_object.veh + target_object.dreads) * 5) / shots_fired;
					            }
				        }
					
			        b = shots_fired;
        
			        if (doom != 0) and (shots_fired > 1)
						{
							a = floor((doom * a));
							b = floor(b * doom);
						}
					
			        if (splash[weapon_number] = 1) and (melee_or_ranged != "wall")
						{
							shots_fired=shots_fired * 3;
						}        
        
			        if (a = 0) then a = shots_fired * doom;
        
			        if (b > 0) and (melee_or_ranged != "wall") and (instance_exists(target_object))
						{
				            target_object.hostile_shots = b;
				            if (wep_owner[weapon_number] = "assorted") then target_object.hostile_shooters = 999;
				            if (wep_owner[weapon_number] != "assorted") then target_object.hostile_shooters = 1;
				            target_object.hostile_damage = a/b;
				            target_object.hostile_weapon=wep[weapon_number];
            
				            // 135; this might be the problem right here
				            // this is the problem right here
				            target_object.hostile_men = 0;
				            // if (damage_type="dread") then target_object.hostile_men=1;
            
				            target_object.hostile_range = range[weapon_number];
				            target_object.hostile_splash = splash[weapon_number];
				            if (target_object.hostile_splash = 1) then target_object.hostile_damage += 10;            
            
				            with(target_object)
								{
									scr_clean(999);
								}
				        }       
        
			        if (b > 0) and (melee_or_ranged = "wall") and (instance_exists(target_object))
						{
				            var dam2, totes_dam, dest;
				            dest = 0;
							dam2 = (a / b) - target_object.ac[1];
				            if (dam2 < 0) then dam2 = 0;
							totes_dam = round(dam2) * b;
				            target_object.hp[1] -= dam2;
				            target_object.hostile_shots = b;
				            target_object.hostile_weapon = wep[weapon_number];
				            target_object.hostile_range = range[weapon_number];
				            target_object.hostile_damage = dam2;
            
				            if (target_object.hp[1] <= 0) then dest = 1;
				            scr_flavor2(dest, "wall");
				        }        
			    }
		}

		if (instance_exists(target_object)) and (owner  = eFACTION.Player)
			{
			    var shots_fired, stop, damage_type;
    
			    if (weapon_number > 0)
					{
						shots_fired = wep_num[weapon_number];
					}
			    if (shots_fired = 0) then exit;
			    /*if (weapon_number<-40){
			        if (weapon_number=-53){
			            if (player_silos>30) then shots_fired=30;
			            if (player_silos<30) then shots_fired=player_silos;
			        }
			        if (weapon_number=-51) or (weapon_number=-52){
			            shots_fired=round(player_silos/2);
			        }
			    }*/
    
			    damage_type = ""; 
				stop = 0; 
				targeh = target_dudes;    
    
			    repeat(10)
					{
						if (target_object.dudes_hp[targeh] = 0) then targeh += 1;
					}
			    if (target_object.dudes_hp[targeh] = 0) then stop = 1;    
    
			    if (weapon_number > 0)
					{
				        if (ammo[weapon_number] = 0) then stop = 1;
				        if (ammo[weapon_number] > 0) then ammo[weapon_number] -= 1;
				    }
		   
				if (wep[weapon_number] = "Missile Silo") then obj_ncombat.player_silos -= min(obj_ncombat.player_silos, 30);    
				if (att_or_arp != "highest") then damage_type = att_or_arp;
				if (att_or_arp = "highest") and (weapon_number > 0)
					{
						damage_type = "att";
						if (att[weapon_number] >= 100) and (apa[weapon_number] > 0) then damage_type = "arp";
					}
			    if (att_or_arp = "highest") and (weapon_number =- 51) then damage_type = "att";
			    if (att_or_arp = "highest") and (weapon_number =- 52) then damage_type = "att";
			    if (att_or_arp = "highest") and (weapon_number =- 53) then damage_type = "att";
    
    
    
			    /*if (weapon_number<-40){// Defenses shooting
			        var wii,at,ar,spla,a,b,c,eac;
			        wii="";at=0;ar=0;spla=0;a=0;b=0;c=0;eac=0;
        
			        spla=1;
			        if (weapon_number=-51){wii="Heavy Bolter Emplacement";at=160;ar=0;}
			        if (weapon_number=-52){wii="Missile Launcher Emplacement";at=200;ar=1;}
			        if (weapon_number=-53){wii="Missile Silo";at=250;ar=0;}
        
        
			        a=at*target_object.dudes_dr[targeh];
			        eac=target_object.dudes_ac[targeh];
			        if (target_object.dudes_vehicle[targeh]=0){
			            if (ar=1) then eac=0;
			            if (ar=-1) then eac=eac*6;
			        }
			        if (target_object.dudes_vehicle[targeh]=1){
			            if (ar=-1) then eac=a;
			            if (ar=0) then eac=eac*6;
			            if (ar=-1) then eac=a;
			        }
			        b=a-eac;if (b<=0) then b=0;
			        c=b*shots_fired;
        
			        var casualties,ponies,onceh;onceh=0;ponies=0;
			        if (spla=0) then casualties=min(floor(c/target_object.dudes_hp[targeh]),shots_fired);
			        if (spla!=0) then casualties=floor(c/target_object.dudes_hp[targeh]);
        
			        ponies=target_object.dudes_num[targeh];
			        if (target_object.dudes_num[targeh]=1) and ((target_object.dudes_hp[targeh]-c)<=0){casualties=1;}
        
			        if (target_object.dudes_num[targeh]-casualties<0) then casualties=ponies;
			        if (casualties<0) then casualties=0;
			        scr_flavor(weapon_number,target_object,target_dudes,shots_fired,casualties);
			        if (target_object.dudes_num[targeh]=1) and (c>0) then target_object.dudes_hp[targeh]-=c;
        
			        if (casualties>=1){
			            target_object.dudes_num[targeh]-=casualties;
			            obj_ncombat.enemy_forces-=casualties;
			        }
        
			    }*/

				if (weapon_number > 0) or (weapon_number <- 40) // Normal shooting
					{
				        var overkill, damage_remaining, shots_remaining;
				        overkill = 0; damage_remaining = 0; shots_remaining = 0;
                
				        var that_works = false;
        
				        if (weapon_number > 0)
							{
								if (att[weapon_number] > 0) and (stop = 0) then that_works = true;
							}
				        if (weapon_number <- 40) and (stop = 0) then that_works = true;
        
				        if (that_works=true)
							{
					            var a, b, c, eac, ap, spla, wii;
					            a = 0;
								b = 0;
								c = 0;
								eac = 0;
								ap = 0;
								spla = 0;
								wii = "";
            
					            if (weapon_number > 0) // Average damage
									{
						                a = (att[weapon_number] / wep_num[weapon_number]) * target_object.dudes_dr[targeh];
						                ap = apa[weapon_number];
						                spla = splash[weapon_number];
						            }
					            if (weapon_number <- 40)
									{ 
						                wii = "";
										spla = 1;
                
						                if (weapon_number =- 51)
											{
												wii = "Heavy Bolter Emplacement"; 
												at = 160;
												ap = 0;
											}
						                if (weapon_number =- 52)
											{
												wii = "Missile Launcher Emplacement";
												at = 200;
												ap = 1;
											}
						                if (weapon_number =- 53)
											{
												wii = "Missile Silo";
												at = 250;
												ar = 0;
											}
						            }
            
					            eac = target_object.dudes_ac[targeh];
					            if (target_object.dudes_vehicle[targeh] = 0)
									{
						                if (ap = 1) then eac = 0;
						                if (ap =- 1) then eac = eac * 6;
						            }
					            if (target_object.dudes_vehicle[targeh] = 1)
									{
						                if (ap = 0) then eac = eac * 6;
						                if (ap =- 1) then eac = a;
						            }
					            b = a - eac;
						
								if (b <= 0) then b = 0;// Average after armour
            
					            c = b * shots_fired;// New damage
            
					            var casualties,ponies,onceh;
								onceh = 0;
								ponies = 0;
					            if (spla = 0) then casualties = min(floor(c / target_object.dudes_hp[targeh]), shots_fired);
					            if (spla != 0) then casualties = floor(c / target_object.dudes_hp[targeh]);
            
					            ponies = target_object.dudes_num[targeh];
					            if (target_object.dudes_num[targeh] = 1) and ((target_object.dudes_hp[targeh] - c) <= 0){casualties = 1;}
            
            
                     
            
					            if (target_object.dudes_num[targeh] - casualties < 0)
									{
						                overkill = casualties - target_object.dudes_num[targeh];
						                damage_remaining = c - (overkill * target_object.dudes_hp[targeh]);
                
						                var proportional_shots;
						                proportional_shots = round(damage_remaining / a);
						                shots_remaining = proportional_shots;
                
						                // show_message("killed "+string(casualties)+"x "+string(target_object.dudes[targeh]));
						                // show_message("did "+string(c)+" damage with "+string(shots_fired)+" shots fired, have "+string(damage_remaining)+" damage remaining (about "+string(shots_remaining)+" shots)");
						            }           
            
					            if (target_object.dudes_num[targeh] - casualties < 0) then casualties = ponies;
					            if (casualties < 0) then casualties = 0;
            
            
					            if (casualties >= 1)
									{
						                var iii, found, openz;
						                iii = 0;
										found = 0;
										openz = 0;
						                repeat(40)
											{							
												iii += 1;
							                    if (found=0)
													{
								                        if (obj_ncombat.dead_ene[iii] = "") and (openz = 0) then openz = iii;
								                        if (obj_ncombat.dead_ene[iii] = target_object.dudes[targeh]) and (found = 0)
															{
									                            found = iii;obj_ncombat.dead_ene_n[obj_ncombat.dead_enemies] += casualties;
									                        }
								                    }
							                }
						                if (found = 0)
											{
							                    obj_ncombat.dead_enemies += 1;
							                    obj_ncombat.dead_ene[openz] = string(target_object.dudes[targeh]);
							                    obj_ncombat.dead_ene_n[openz] = casualties;
							                }
                
						                // if (casualties=1) then obj_ncombat.dead_ene[obj_ncombat.dead_enemies]="1 "+string(target_object.dudes[targeh]);
						                // if (casualties>1) then obj_ncombat.dead_ene[obj_ncombat.dead_enemies]=string(casualties)+" "+string(target_object.dudes[targeh]);
						            }
            
								var proportional_shots;
								var godd;
								var a2,b2,c2,eac2,ap2
					            var casualties2,ponies2,onceh2;
								var iii,found,openz;
					            var k = 0;
					
					            if (damage_remaining > 0) and (shots_remaining > 0) then repeat(10)
									{
						                if (damage_remaining>0) and (shots_remaining>0)
											{
							                    godd = 0;
							                    k = targeh;
                    
							                    // Find similar target in this same group
							                    repeat(10)
													{
														k += 1;
								                        if (godd = 0)
															{
									                            if (target_object.dudes_num[k] > 0) and (target_object.dudes_vehicle[k] = target_object.dudes_vehicle[targeh])
																	{
										                                godd = k;
										                            }
									                        }
								                    }
										
							                    k = targeh;
									
							                    if (godd = 0) then repeat(10)
													{
														k -= 1;
								                        if (godd = 0) and (k >= 1)
															{
									                            if (target_object.dudes_num[k] > 0) and (target_object.dudes_vehicle[k] = target_object.dudes_vehicle[targeh])
																	{
										                                godd = k;
										                            }
									                        }
								                    }       
                    
							                    // Found a similar target to get the damage
							                    if (godd > 0) and (damage_remaining > 0) and (shots_remaining > 0)
													{
								                        ap2 = damage_remaining;
								                        a2 = a;// Average damage
                        
								                        eac2 = target_object.dudes_ac[godd];
								                        if (target_object.dudes_vehicle[godd] = 0)
															{
									                            if (ap2 = 1) then eac2 = 0;
									                            if (ap2 =- 1) then eac2 = eac2 * 6;
									                        }
								                        if (target_object.dudes_vehicle[godd] = 1)
															{
									                            if (ap2 = 0) then eac2 = eac2 * 6;
									                            if (ap2 =- 1) then eac2 = a;
									                        }
								                        b2 = a2 - eac2;
											
														if (b2 <= 0) then b2 = 0;// Average after armour
                        
								                        c2 = b2 * shots_remaining;// New damage
                        
														onceh2 = 0;
														ponies2 = 0;
								                        if (spla = 0) then casualties2 = min(floor(c2 / target_object.dudes_hp[godd]), shots_remaining);
								                        if (spla != 0) then casualties2 = floor(c2 / target_object.dudes_hp[godd]);
                        
								                        ponies2 = target_object.dudes_num[godd];
								                        if (target_object.dudes_num[godd] = 1) and ((target_object.dudes_hp[godd]-c2) <= 0)
															{
																casualties2 = 1;
															}
								                        if (target_object.dudes_num[godd] < casualties2) then casualties2 = target_object.dudes_num[godd];
								                        if (casualties2 < 1)
															{
																casualties2 = 0;
																damage_remaining = 0;
																overkill = 0;
																shots_remaining = 0;
															}
                        
								                        if (casualties2 >= 1) and (shots_fired > 0)
															{
																iii = 0;
									                            repeat(40)
																	{
																		iii += 1;
										                                if (found = 0)
																			{
											                                    if (obj_ncombat.dead_ene[iii] = "") and (openz = 0) then openz = iii;
											                                    if (obj_ncombat.dead_ene[iii] = target_object.dudes[godd]) and (found = 0)
																					{
												                                        found = iii;
																						obj_ncombat.dead_ene_n[obj_ncombat.dead_enemies] += casualties;
												                                    }
											                                }
										                            }
									                            if (found = 0)
																	{
										                                obj_ncombat.dead_enemies += 1;
										                                obj_ncombat.dead_ene[openz]=string(target_object.dudes[godd]);
										                                obj_ncombat.dead_ene_n[openz]=casualties;
										                            }
                            
                            
									                            /*obj_ncombat.dead_enemies+=1;
									                            if (casualties2=1) then obj_ncombat.dead_ene[obj_ncombat.dead_enemies]="1 "+string(target_object.dudes[godd]);
									                            if (casualties2>1) then obj_ncombat.dead_ene[obj_ncombat.dead_enemies]=string(casualties2)+" "+string(target_object.dudes[godd]);
									                            obj_ncombat.dead_enemies+=1;
									                            obj_ncombat.dead_ene[obj_ncombat.dead_enemies]=string(target_object.dudes[godd]);
									                            obj_ncombat.dead_ene_n[obj_ncombat.dead_enemies]=casualties;*/
                            
									                            target_object.dudes_num[godd] -= casualties2;
									                            obj_ncombat.enemy_forces -= casualties2;
									                        }
                         
								                        if (casualties2 >= 1)
															{
									                            if (target_object.dudes_num[godd] <= 0)
																	{
										                                overkill = casualties2 - target_object.dudes_num[godd];
										                                damage_remaining -= casualties2 * target_object.dudes_hp[godd];
                                
				                               
										                                proportional_shots = round(damage_remaining / a2);
										                                shots_remaining = proportional_shots;
                                
										                                // show_message("killed "+string(casualties2)+"x "+string(target_object.dudes[godd]));
										                                // show_message("did "+string(c)+" damage with "+string(proportional_shots)+" shots fired, have "+string(damage_remaining)+" damage remaining");
										                            }
									                        }
								                    }
							                }
						            }// End repeat 10
          
					            scr_flavor(weapon_number, target_object, target_dudes,shots_fired - wep_rnum[weapon_number], casualties);
           
					            if (target_object.dudes_num[targeh] = 1) and (c > 0) then target_object.dudes_hp[targeh] -= c;// Need special flavor here for just damaging
            
					            if (casualties >= 1)
									{
						                target_object.dudes_num[targeh] -= casualties;
						                obj_ncombat.enemy_forces -= casualties;
                
                
                
						                /*if (obj_ncombat.enemy=5) and (target_object.faith[targeh]=0) and (target_object.dudes_vehicle[targeh]=0){
						                    if (target_object.dudes_num[targeh]<=target_object.dudes_onum[targeh]/4) and (target_object.dudes_num[targeh]>0){
						                        var fdice;fdice=choose(0,1);
						                        if (fdice=1){
						                            var faith_mes,mesr;faith_mes="";mesr=choose(1,2,3,4);
						                            target_object.faith[targeh]=1;
						                            target_object.dudes_dr[targeh]=max(0.65,target_object.dudes_dr[targeh]+0.15);
						                            obj_ncombat.messages+=1;
						                            obj_ncombat.message_sz[obj_ncombat.messages]=obj_ncombat.message_sz[obj_ncombat.messages-1]-1;
                            
						                            if (target_object.dudes_num[targeh]=1){
						                                if (mesr=1) then faith_mes="A "+string(target_object.dudes[targeh])+" screams out in anger, their voice thick with divine fury.";
						                                if (mesr=2) then faith_mes="A "+string(target_object.dudes[targeh])+" howls out in Righteous Fury.  They bristle with newfound purpose.";
						                                if (mesr=3) then faith_mes="A "+string(target_object.dudes[targeh])+" roars out litanies to the Emperor as they advance, their wounds forgotten.";
						                                if (mesr=4){
						                                    var mesr2;mesr2=choose(1,2,3,4,5,6);
						                                    if (mesr2=1) then faith_mes="''Death to the blasphemers!'' a "+string(target_object.dudes[targeh])+" "+choose("roars","howls","cries","shouts","bellows")+", the hate in their voice nearly a physical thing.";
						                                    if (mesr2=2) then faith_mes="''Burn!  BURN THEM ALL!'' a "+string(target_object.dudes[targeh])+" "+choose("roars","howls","cries","shouts","bellows")+", the hate in their voice nearly a physical thing.";
						                                    if (mesr2=3) then faith_mes="''Give them the cleansing flame of ABSOLUTION!'' a "+string(target_object.dudes[targeh])+" "+choose("roars","howls","cries","shouts","bellows")+", the hate in their voice nearly a physical thing.";
						                                    if (mesr2=4) then faith_mes="''SHOW NO MERCY!'' a "+string(target_object.dudes[targeh])+" "+choose("roars","howls","cries","shouts","bellows")+", the hate in their voice nearly a physical thing.";
						                                    if (mesr2=5) then faith_mes="''DEATH TO THE IMPURE!'' a "+string(target_object.dudes[targeh])+" "+choose("roars","howls","cries","shouts","bellows")+", the hate in their voice nearly a physical thing.";
						                                    if (mesr2=6) then faith_mes="''TAKE THEIR LIVES!'' a "+string(target_object.dudes[targeh])+" "+choose("roars","howls","cries","shouts","bellows")+", the hate in their voice nearly a physical thing.";
						                                }
						                            }
						                            if (target_object.dudes_num[targeh]>1){
						                                if (mesr=1) then faith_mes=string(target_object.dudes_num[targeh])+" "+string(target_object.dudes[targeh])+" scream in anger, their voice thick with divine fury.";
						                                if (mesr=2) then faith_mes=string(target_object.dudes_num[targeh])+" "+string(target_object.dudes[targeh])+" howl out in Righteous Fury.  They bristle with newfound purpose.";
						                                if (mesr=3) then faith_mes=string(target_object.dudes_num[targeh])+" "+string(target_object.dudes[targeh])+" roar out litanies to the Emperor as they advance, their wounds forgotten.";
						                                if (mesr=4) then faith_mes=string(target_object.dudes_num[targeh])+" "+string(target_object.dudes[targeh])+" scream, shout, and roar out litanies, the hate in their voices nearly a tangible thing.";
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
    
    
			    if (stop = 0) then with(target_object)
					{

				        j = 0;
						good = 0;
						open = 0;
					
				        repeat(20)
							{
								j += 1;
						
					            if (dudes_num[j] <= 0)
									{
						                dudes[j] = "";
										dudes_special[j] = "";
										dudes_num[j] = 0;
										dudes_ac[j] = 0;
						                dudes_hp[j] = 0;
										dudes_vehicle[j] = 0 ;
										dudes_damage[j] = 0;
						            }
					            if (dudes[j] = "") and (dudes[j + 1] != "")
									{
						                dudes[j] = dudes[j + 1]dudes_special[j] = dudes_special[j + 1];
						                dudes_num[j] = dudes_num[j + 1];
										dudes_ac[j] = dudes_ac[j + 1];
						                dudes_hp[j] = dudes_hp[j + 1];
										dudes_vehicle[j] = dudes_vehicle[j + 1];
						                dudes_damage[j] = dudes_damage[j + 1];
                
						                dudes[j + 1] = "";
										dudes_special[j + 1] = "";
										dudes_num[j + 1] = 0;
										dudes_ac[j + 1] = 0;
						                dudes_hp[j + 1] = 0;
										dudes_vehicle[j + 1] = 0;
										dudes_damage[j + 1] = 0;
						            }
					        }
				
				        j = 0;
				    }
			    if (target_object.men + target_object.veh + target_object.medi = 0) and (target_object.owner != 1) 
					{
				        with(target_object){instance_destroy();}
				    }
    
			    if (melee_or_ranged = "melee")
					{
				        // lololol
				    }
    
			}
	}