
if (obj_controller.settings=0) or (obj_controller.menu!=23) then instance_destroy();

var romanNumerals= scr_roman_numerals();

if (engage=true){
    for(var co=0; co<11; co++){
        var i=0;
        if (role_number[co]>0){
			for(i=1; i<=300; i++){
                if (obj_ini.role[co][i]=obj_ini.role[100,role]){
                    // ** Start Armour **
                    var yes=false,done="";
					
                    if (req_armour="Power Armour"){
                        if (obj_ini.armour[co][i]="Power Armour") then yes=true;
                        if (obj_ini.armour[co][i]="MK3 Iron Armour") then yes=true;
                        if (obj_ini.armour[co][i]="MK4 Maximus") then yes=true;
                        if (obj_ini.armour[co][i]="MK5 Heresy") then yes=true;
                        if (obj_ini.armour[co][i]="MK6 Corvus") then yes=true;
                        if (obj_ini.armour[co][i]="MK7 Aquila") then yes=true;
                        if (obj_ini.armour[co][i]="MK8 Errant") then yes=true;
                        if (obj_ini.armour[co][i]="Artificer Armour") then yes=true;
                        
                        if (co=1) and ((obj_ini.armour[co][i]="Terminator Armour") or (obj_ini.armour[co][i]="Tartaros")){
                            if (obj_ini.role[co][i]=obj_ini.role[100][3]) then yes=true;
                            if (obj_ini.role[co][i]=obj_ini.role[100][5]) then yes=true;
                            if (obj_ini.role[co][i]=obj_ini.role[100][14]) then yes=true;
                            if (obj_ini.role[co][i]=obj_ini.role[100][15]) then yes=true;
                            if (obj_ini.role[co][i]=obj_ini.role[100][16]) then yes=true;
                            if (obj_ini.role[co][i]=obj_ini.role[100,17]) then yes=true;
                            if (obj_ini.role[co][i]="Lexicanum") then yes=true;
                            if (obj_ini.role[co][i]="Codiciery") then yes=true;
                        }
                    }
                    if (req_armour="Terminator Armour"){
                        if (obj_ini.armour[co][i]="Terminator Armour") then yes=true;
                        if (obj_ini.armour[co][i]="Tartaros") then yes=true;
                        if (obj_ini.armour[co][i]!="Terminator Armour") and (obj_ini.armour[co][i]!="Tartaros") and (obj_ini.experience[co][i]<179) then yes=true;
                    }
                    if (req_armour="Scout Armour") and (obj_ini.armour[co][i]="Scout Armour") then yes=true;
                    if (string_count("&",obj_ini.armour[co][i])>0) then yes=true;
                    if (yes=false){
                        if (obj_ini.armour[co][i]!=""){
							scr_add_item(obj_ini.armour[co][i],1);
							obj_ini.armour[co][i]="";
						}
                        if (obj_ini.armour[co][i]="") and (req_armour="Power Armour"){
                            if (done="") and (scr_item_count("MK7 Aquila")>0) then done="MK7 Aquila";
                            if (done="") and (scr_item_count("MK6 Corvus")>0) then done="MK6 Corvus";
                            if (done="") and (scr_item_count("Power Armour")>0) then done="Power Armour";
                            if (done="") and (scr_item_count("MK4 Maximus")>0) then done="MK4 Maximus";
                            if (done="") and (scr_item_count("MK5 Heresy")>0) then done="MK5 Heresy";
                            if (done="") and (scr_item_count("MK3 Iron")>0) then done="MK3 Iron";
                            if (done!=""){
								scr_add_item(done,-1);
								obj_ini.armour[co][i]=done;
							}
                        }
                        if (obj_ini.armour[co][i]="") and (req_armour="Terminator Armour"){
                            if (done="") and (scr_item_count("Terminator Armour")>0) then done="Terminator Armour";
                            if (done="") and (scr_item_count("Tartaros")>0) then done="Tartaros";
                            if (done!=""){
								scr_add_item(done,-1);
								obj_ini.armour[co][i]=done;
							}
                        }
                        if (obj_ini.armour[co][i]="") and (req_armour="Scout Armour"){
                            if (done="") and (scr_item_count("Scout Armour")>0) then done="Scout Armour";
                            if (done!=""){
								scr_add_item(done,-1);
								obj_ini.armour[co][i]=done;
							}
                        }
                    }
                    // ** End armour **
                    
                    // ** Start Weapons **
                    if (obj_ini.wep1[co][i]!=req_wep1) or (obj_ini.wep2[co][i]!=req_wep2){
                        var stop_one=false,stop_two=false;
                        
                        if (string_count("&",obj_ini.wep1[co][i])>0) then stop_one=true;
                        if (string_count("&",obj_ini.wep2[co][i])>0) then stop_two=true;
                        if (req_wep1="Assault Cannon") and (obj_ini.armour[co][i]!="Terminator Armour") and (obj_ini.armour[co][i]!="Tartaros") and (obj_ini.armour[co][i]!="Dreadnought") then stop_one=true;
                        if (req_wep2="Assault Cannon") and (obj_ini.armour[co][i]!="Terminator Armour") and (obj_ini.armour[co][i]!="Tartaros") and (obj_ini.armour[co][i]!="Dreadnought") then stop_two=true;
                        if (req_wep1="Thunder Hammer") and (obj_ini.experience[co][i]<70) then stop_one=true;
                        if (req_wep2="Thunder Hammer") and (obj_ini.experience[co][i]<70) then stop_two=true;
                        
                        if (obj_ini.wep1[co][i]!="") and (stop_one=false){
							scr_add_item(obj_ini.wep1[co][i],1);
							obj_ini.wep1[co][i]="";
						}
                        if (obj_ini.wep2[co][i]!="") and (stop_two=false){
							scr_add_item(obj_ini.wep2[co][i],1);
							obj_ini.wep2[co][i]="";
						}
                        if (obj_ini.wep1[co][i]="") and (stop_one=false){
							scr_add_item(req_wep1,-1);
							obj_ini.wep1[co][i]=req_wep1;
						}
                        if (obj_ini.wep2[co][i]="") and (stop_two=false){
							scr_add_item(req_wep2,-1);
							obj_ini.wep2[co][i]=req_wep2;
						}
                    }
                    
                    // ** Start Gear **
                    if (obj_ini.gear[co][i]!=req_gear) and (string_count("&",obj_ini.gear[co][i])=0){
                        if (obj_ini.gear[co][i]!=""){
							scr_add_item(obj_ini.gear[co][i],1);
							obj_ini.gear[co][i]="";
						}
                        if (obj_ini.gear[co][i]=""){
							scr_add_item(req_gear,-1);
							obj_ini.gear[co][i]=req_gear;
						}
                    }
                    
                    // ** Start Mobility Items **
                    if (obj_ini.mobi[co][i]!=req_mobi) and (string_count("&",obj_ini.mobi[co][i])=0){
                        var stop_mobi=false;
                    
                        if (obj_ini.armour[co][i]="Terminator Armour") or (obj_ini.armour[co][i]="Tartaros") or (obj_ini.armour[co][i]="Dreadnought") then stop_mobi=true;
                        if (string_pos("&",obj_ini.armour[co][i])>0){
                            if (string_count("Termi",obj_ini.armour[co][i])>0) then stop_mobi=true;
                            if (string_count("Dreadnou",obj_ini.armour[co][i])>0) then stop_mobi=true;
                        }
                        if (stop_mobi=true) and (obj_ini.mobi[co][i]!=""){
							scr_add_item(obj_ini.mobi[co][i],1);
							obj_ini.mobi[co][i]="";
						}
                        
                        if (stop_mobi=false){
                            if (obj_ini.mobi[co][i]!=""){
								scr_add_item(obj_ini.mobi[co][i],1);
								obj_ini.mobi[co][i]="";
							}
                            if (obj_ini.mobi[co][i]=""){
								scr_add_item(req_mobi,-1);
								obj_ini.mobi[co][i]=req_mobi;
							}
                        }                        
                    }                   
                // ** End role check **
				}
            // ** End this marine **
			}
        // ** End this company **
		}
	// ** End repeat **
	}
    engage=false;
}

// ** Refreshing **
if (refresh=true) and (obj_controller.settings>0){
    total_role_number=0;
	total_roles="";
	for(var i=0; i<11; i++){
        role_number[i]=0;
        }
	for(var i=0; i<61; i++){
		arm[i]="";
		arm_n[i]=0;
		mob[i]="";
		mob_n[i]=0;
		gea[i]="";
		gea_n[i]=0;
		we1[i]="";
		we1_n[i]=0;
		we2[i]="";
		we2_n[i]=0;
	}
    armour_equip="";
	wep1_equip="";
	wep2_equip="";
	mobi_equip="";
	gear_equip="";
	all_equip="";
    req_armour="";
	req_armour_num=0;
	have_armour_num=0;
	req_wep1="";
	req_wep1_num=0;
	have_wep1_num=0;
    req_wep2="";
	req_wep2_num=0;
	have_wep2_num=0;
	req_gear="";
	req_gear_num=0;
	have_gear_num=0;
    req_mobi="";
	req_mobi_num=0;
	have_mobi_num=0;
	good1=0;
	good2=0;
	good3=0;
	good4=0;
	good5=0;

    req_armour=obj_ini.armour[100,role];
    req_wep1=obj_ini.wep1[100,role];
    req_wep2=obj_ini.wep2[100,role];
    req_gear=obj_ini.gear[100,role];
    req_mobi=obj_ini.mobi[100,role];
	
	for(var co=0; co<11; co++){
		for(var i=1; i<=300; i++){
            if (obj_ini.role[co][i]=obj_ini.role[100,role]){
                role_number[co]+=1;
                
                // Weapon1
                var onc=0;
                if (string_count("&",obj_ini.wep1[co][i])>0) and (onc=0){
					onc=1;
					have_wep1_num+=1;
				}
                if (obj_ini.wep1[co][i]=req_wep1) and (onc=0){
					have_wep1_num+=1;
					onc=1;
				}
                if (obj_ini.wep2[co][i]=req_wep1) and (onc=0){
					have_wep1_num+=1;
					onc=1;
				}
                
                // Weapon2
                onc=0;
                if (string_count("&",obj_ini.wep2[co][i])>0) and (onc=0){
					onc=1;
					have_wep2_num+=1;
				}
                if (obj_ini.wep1[co][i]=req_wep2) and (onc=0){
					have_wep2_num+=1;
					onc=1;
				}
                if (obj_ini.wep2[co][i]=req_wep2) and (onc=0){
					have_wep2_num+=1;
					onc=1;
				}
                
                if (req_armour!=""){
                    var yes=false;
                    if (req_armour="Power Armour"){
                        if (obj_ini.armour[co][i]="Power Armour") then yes=true;
                        if (obj_ini.armour[co][i]="MK3 Iron Armour") then yes=true;
                        if (obj_ini.armour[co][i]="MK4 Maximus") then yes=true;
                        if (obj_ini.armour[co][i]="MK6 Corvus") then yes=true;
                        if (obj_ini.armour[co][i]="MK7 Aquila") then yes=true;
                        if (obj_ini.armour[co][i]="MK8 Errant") then yes=true;
                        if (obj_ini.armour[co][i]="Artificer Armour") then yes=true;
                    }
                    if (req_armour="Terminator Armour"){
                        if (obj_ini.armour[co][i]="Terminator Armour") then yes=true;
                        if (obj_ini.armour[co][i]="Tartaros") then yes=true;
                    }
                    if (req_armour="Scout Armour") and (obj_ini.armour[co][i]="Scout Armour") then yes=true;
                    if (string_count("&",obj_ini.armour[co][i])>0) then yes=true;
                    if (yes=true) then have_armour_num+=1;
                }
                
                if (req_gear!=""){
                    if (string_count("&",obj_ini.gear[co][i])=0){if (obj_ini.gear[co][i]=req_gear) then have_gear_num+=1;}
                    if (string_count("&",obj_ini.gear[co][i])>0) then have_gear_num+=1;
                }
                
                if (req_mobi!=""){
                    if (string_count("&",obj_ini.mobi[co][i])=0){if (obj_ini.mobi[co][i]=req_mobi) then have_mobi_num+=1;}
                    if (string_count("&",obj_ini.mobi[co][i])>0) then have_mobi_num+=1;
                }
            }
            if (obj_ini.role[co][i]=obj_ini.role[100,role]){
                var hue=0,hue2=0;
                
                if (obj_ini.wep1[co][i]!=""){
					hue=0;
                    hue2=0;
					for(hue=1;hue<=60;hue++){
						if (hue2=0){
							if (we1[hue]=obj_ini.wep1[co][i]){
								hue2=-5;
                                we1_n[hue]+=1;
							}
						}
					}
                    if (hue2=0){
						for(hue=0; hue<30; hue++){
							if (hue2=0){
								if (we1[hue+1]=""){
									hue2=-5;
									we1[hue+1]=obj_ini.wep1[co][i];
									we1_n[hue+1]=1;
								}
							}
						}
					}
                }
                hue2=0;
                if (obj_ini.wep2[co][i]!=""){
					hue2=0;
					for(hue=1;hue<=60;hue++){
						if (hue2=0){
							if (we2[hue]=obj_ini.wep2[co][i]){
								hue2=-5;
								we2_n[hue]+=1;
							}
						}
					}
                    if (hue2=0){
						for(hue=0;hue<30;hue++){
							if (hue2=0){
								if (we2[hue+1]=""){
									hue2=-5;we2[hue+1]=obj_ini.wep2[co][i];
									we2_n[hue+1]=1;
								}
							}
						}
					}
                }
                hue2=0;
                if (obj_ini.armour[co][i]!=""){
					hue2=0;
					for(hue=1; hue<=60; hue++){
						if (hue2=0){
							if (arm[hue]=obj_ini.armour[co][i]){
								hue2=-5;
								arm_n[hue]+=1;
							}
						}
					}
                    if (hue2=0){
						for(hue=0;hue<30;hue++){
							if (hue2=0){
								if (arm[hue+1]=""){
									hue2=-5;
									arm[hue+1]=obj_ini.armour[co][i];
									arm_n[hue+1]=1;
								}
							}
						}
					}
                }
                hue2=0;
                if (obj_ini.gear[co][i]!=""){
					hue2=0;
					for(hue=1; hue<=60; hue++){
						if (hue2=0){
							if (gea[hue]=obj_ini.gear[co][i]){
								hue2=-5;
								gea_n[hue]+=1;
							}
						}
					}
                    if (hue2=0){
						hue=0;
						for(hue=0; hue<30; hue++){
							if (hue2=0){
								if (gea[hue+1]=""){
									hue2=-5;
									gea[hue+1]=obj_ini.gear[co][i];
									gea_n[hue+1]=1;
								}
							}
						}
					}
                }
                hue2=0;
                if (obj_ini.mobi[co][i]!=""){
					hue=0;
					hue2=0;
					for(hue=1;hue<=60;hue++){
						if (hue2=0){
							if (mob[hue]=obj_ini.mobi[co][i]){
								hue2=-5;
								mob_n[hue]+=1;
							}
						}
					}
                    if (hue2=0){
						for(hue=0; hue<30;hue++){
							if (hue2=0){
								if (mob[hue+1]=""){
									hue2=-5;
									mob[hue+1]=obj_ini.mobi[co][i];
									mob_n[hue+1]=1;
								}
							}
						}
					}
                }
                hue2=0;
            }
        }
    }
    
    have_wep1_num+=scr_item_count(req_wep1);
    have_wep2_num+=scr_item_count(req_wep2);
    
    if (req_armour="Power Armour"){
        have_armour_num+=scr_item_count("MK7 Aquila");
        have_armour_num+=scr_item_count("MK6 Corvus");
        have_armour_num+=scr_item_count("Power Armour");
        have_armour_num+=scr_item_count("MK4 Maximus");
        have_armour_num+=scr_item_count("MK5 Heresy");
        have_armour_num+=scr_item_count("MK3 Iron");
    }
    if (req_armour="Terminator Armour"){
        have_armour_num+=scr_item_count("Terminator Armour");
        have_armour_num+=scr_item_count("Tartaros");
    }
    if (req_armour="Scout Armour") then have_armour_num+=scr_item_count("Scout Armour");
    
    have_gear_num+=scr_item_count(req_gear);
    have_mobi_num+=scr_item_count(req_mobi);
    
    total_role_number=0;
	
	for(var i=0; i<11; i++){
        if (role_number[i]>0){
            req_wep1_num+=role_number[i];
            req_wep2_num+=role_number[i];
            req_armour_num+=role_number[i];
            req_gear_num+=role_number[i];
            req_mobi_num+=role_number[i];
            total_role_number+=role_number[i];
        }
    }
    total_roles="";
    if (total_role_number>0){total_roles="You currently have "+string(total_role_number)+"x "+string(obj_ini.role[100,role])+" across all companies.  ";
        for(var i=0; i<11;i++){
            if (i=0) and (role_number[0]>0) then total_roles+="(HQ: "+string(role_number[i])+") ";
            if (i > 0) and (i < 11) {
			    total_roles+="( "+romanNumerals[i-1] + " Company: "+string(role_number[i])+") ";
		    }
        }
	}
    
    // Add up messages
    
	for(var i=1; i<=60;i++){if (we1[i]!="") then wep1_equip+=string(we1_n[i])+"x "+string(we1[i])+", ";}
    for(var i=1; i<=60;i++){if (we2[i]!="") then wep2_equip+=string(we2_n[i])+"x "+string(we2[i])+", ";}
    for(var i=1; i<=60;i++){if (arm[i]!="") then armour_equip+=string(arm_n[i])+"x "+string(arm[i])+", ";}
    for(var i=1; i<=60;i++){if (gea[i]!="") then gear_equip+=string(gea_n[i])+"x "+string(gea[i])+", ";}
    for(var i=1; i<=60;i++){if (mob[i]!="") then mobi_equip+=string(mob_n[i])+"x "+string(mob[i])+", ";}
    
    all_equip="In total they have equipped "+string(wep1_equip)+string(wep2_equip)+string(armour_equip)+string(gear_equip)+string(mobi_equip);
    all_equip=string_delete(all_equip,string_length(all_equip)+1,3);
    all_equip+=".";all_equip=string_replace(all_equip,",.",".");
    
    refresh=false;
    
    if (tab>0) then scr_weapons_equip();
    
    good1=0;
	good2=0;
	good3=0;
	good4=0;
	good5=0;
	
    if (req_wep1_num<=have_wep1_num) or (req_wep1="") then good1=1;
    if (req_wep2_num<=have_wep2_num) or (req_wep2="") then good2=1;
    if (req_armour_num<=have_armour_num) or (req_armour="") then good3=1;
    if (req_gear_num<=have_gear_num) or (req_gear="") then good4=1;
    if (req_mobi_num<=have_mobi_num) or (req_mobi="") then good5=1;
}
