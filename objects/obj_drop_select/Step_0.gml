
// exit;

// if (mahreens<0) then mahreens=0;

if (refresh_raid!=0){
    var i,comp,good,chick,remove;i=0;comp=0;good=1;remove=0;
    refresh_raid=0;chick=1;
    
    repeat(3500){
        if (good=1){chick=1;
            i+=1;if (i>300){i=1;comp+=1;}
            if (comp>10) then good=0;
        }
        
        if (good=1){if (obj_ini.lid[comp][i]>0) and (via[obj_ini.lid[comp][i]]<=0) then chick=0;}
        
        remove=0;
        
        // just added the ship part
        if (good=1) and ((obj_ini.lid[comp][i]>0) or ((attack=1) and (obj_ini.wid[comp][i]=obj_controller.selecting_planet) and (obj_ini.loc[comp][i]=p_target.name) and (remove_local!=0))){
            
            if (attack=1) and (obj_ini.wid[comp][i]=obj_controller.selecting_planet) and (remove_local=1) then remove=1;
        
            // Fight wounded
            if (obj_ini.hp[comp][i]<=10) and (fighting[comp][i]=0) and (raid_wounded=1) and (via[obj_ini.lid[comp][i]]>0){
                if (string_count("Bike",obj_ini.mobi[comp][i])=0) or (attack=1) then fighting[comp][i]=1;
                
                if (obj_ini.role[comp][i]="Standard Bearer"){
                    if (string_count("Bike",obj_ini.mobi[comp][i])>0) and (attack=1) then bikes+=1;
                    if (string_count("Bike",obj_ini.mobi[comp][i])=0) then mahreens+=1;
                }
                if (string_count("Bike",obj_ini.mobi[comp][i])=0){
                    if (obj_ini.role[comp][i]=obj_ini.role[100][3]) then veterans+=1;
                    if (obj_ini.role[comp][i]=obj_ini.role[100][8]) then mahreens+=1;
                    if (obj_ini.role[comp][i]=obj_ini.role[100][9]) then mahreens+=1;
                    if (obj_ini.role[comp][i]=obj_ini.role[100][10]) then mahreens+=1;
                    if (obj_ini.role[comp][i]=obj_ini.role[100][12]) then mahreens+=1;
                }
                if (string_count("Bike",obj_ini.mobi[comp][i])>0) and (attack=1){
                    if (obj_ini.role[comp][i]=obj_ini.role[100][3]) then bikes+=1;
                    if (obj_ini.role[comp][i]=obj_ini.role[100][8]) then bikes+=1;
                    if (obj_ini.role[comp][i]=obj_ini.role[100][9]) then bikes+=1;
                    if (obj_ini.role[comp][i]=obj_ini.role[100][10]) then bikes+=1;
                    if (obj_ini.role[comp][i]=obj_ini.role[100][12]) then bikes+=1;
                }
                
                if (obj_ini.role[comp][i]="Company Champion") then champions+=1;
                if (obj_ini.role[comp][i]=obj_ini.role[100][2]) then honor+=1;
                if (obj_ini.role[comp][i]=obj_ini.role[100][4]) then terminators+=1;
                if (obj_ini.role[comp][i]=obj_ini.role[100][5]) then capts+=1;
            
                if (obj_ini.role[comp][i]="Chapter Master") then master=1;
                if (obj_ini.role[comp][i]="Master of Sanctity") then chaplains+=1
                if (obj_ini.role[comp][i]="Master of the Apothecarion") then apothecaries+=1;
                if (obj_ini.role[comp][i]="Chief "+string(obj_ini.role[100,17])) then psykers+=1;
                if (obj_ini.role[comp][i]="Forge Master") then techmarines+=1;
                
                if (obj_ini.role[comp][i]=obj_ini.role[100][14]) and (global.chapter_name!="Space Wolves") and (global.chapter_name!="Iron Hands") then chaplains+=1;
                if (obj_ini.role[comp][i]=obj_ini.role[100,17]) then psykers+=1;
                if (obj_ini.role[comp][i]="Codiciery") then psykers+=1;
                if (obj_ini.role[comp][i]="Lexicanum") then psykers+=1;
                if (obj_ini.role[comp][i]=obj_ini.role[100][15]) then apothecaries+=1;
                if (obj_ini.role[comp][i]=obj_ini.role[100][16]) then techmarines+=1;
            }
            
            // if (attack=1) and (obj_ini.wid[comp][i]=obj_controller.selecting_planet) and (obj_ini.loc[comp][i]=p_target.name) and (remove_local=1) then remove=1;
                        
            if (obj_ini.race[comp][i]=1) and ((fighting[comp][i]=1) or (remove=1)){// Case 1; check for marines that need to be removed
                if (obj_ini.role[comp][i]="Standard Bearer") and ((raid_tact+raid_vet+raid_deva+raid_assa=0) or (remove=1)){
                    if (string_count("Bike",obj_ini.mobi[comp][i])>0) then bikes-=1;
                    if (string_count("Bike",obj_ini.mobi[comp][i])=0) then mahreens-=1;
                    fighting[comp][i]=0;
                }
                if (string_count("Bike",obj_ini.mobi[comp][i])=0){
                    if (obj_ini.role[comp][i]=obj_ini.role[100][3]) and ((raid_vet=0) or (remove=1)){fighting[comp][i]=0;veterans-=1;}
                    if (obj_ini.role[comp][i]=obj_ini.role[100][8]) and ((raid_tact=0) or (remove=1)){fighting[comp][i]=0;mahreens-=1;}
                    if (obj_ini.role[comp][i]=obj_ini.role[100][9]) and ((raid_deva=0) or (remove=1)){fighting[comp][i]=0;mahreens-=1;}
                    if (obj_ini.role[comp][i]=obj_ini.role[100][10]) and ((raid_assa=0) or (remove=1)){fighting[comp][i]=0;mahreens-=1;}
                    if (obj_ini.role[comp][i]=obj_ini.role[100][12]) and ((raid_scou=0) or (remove=1)){fighting[comp][i]=0;mahreens-=1;}
                }
                if (string_count("Bike",obj_ini.mobi[comp][i])>0){
                    if (obj_ini.role[comp][i]=obj_ini.role[100][3]) and ((raid_vet=0) or (remove=1)){fighting[comp][i]=0;bikes-=1;}
                    if (obj_ini.role[comp][i]=obj_ini.role[100][8]) and ((raid_tact=0) or (remove=1)){fighting[comp][i]=0;bikes-=1;}
                    if (obj_ini.role[comp][i]=obj_ini.role[100][9]) and ((raid_deva=0) or (remove=1)){fighting[comp][i]=0;bikes-=1;}
                    if (obj_ini.role[comp][i]=obj_ini.role[100][10]) and ((raid_assa=0) or (remove=1)){fighting[comp][i]=0;bikes-=1;}
                    if (obj_ini.role[comp][i]=obj_ini.role[100][12]) and ((raid_scou=0) or (remove=1)){fighting[comp][i]=0;bikes-=1;}
                }
                
                if (obj_ini.role[comp][i]=obj_ini.role[100][2]) and ((raid_vet=0) or (remove=1)){fighting[comp][i]=0;honor-=1;}
                if (obj_ini.role[comp][i]=obj_ini.role[100][4]) and ((raid_term=0) or (remove=1)){fighting[comp][i]=0;terminators-=1;}
                if (obj_ini.role[comp][i]=obj_ini.role[100][5]) and ((raid_vet=0) or (remove=1)){fighting[comp][i]=0;capts-=1;}
                if (obj_ini.role[comp][i]="Company Champion") and ((raid_vet=0) or (remove=1)){fighting[comp][i]=0;champions-=1;}
                
                if (obj_ini.role[comp][i]="Chapter Master") and ((raid_spec=0) or (remove=1)){fighting[comp][i]=0;master=0;}
                if (obj_ini.role[comp][i]="Master of Sanctity") and ((raid_spec=0) or (remove=1)){fighting[comp][i]=0;chaplains-=1}
                if (obj_ini.role[comp][i]="Master of the Apothecarion") and ((raid_spec=0) or (remove=1)){fighting[comp][i]=0;apothecaries-=1;}
                if (obj_ini.role[comp][i]="Chief "+string(obj_ini.role[100,17])) and ((raid_spec=0) or (remove=1)){fighting[comp][i]=0;psykers-=1;}
                if (obj_ini.role[comp][i]="Forge Master") and ((raid_spec=0) or (remove=1)){fighting[comp][i]=0;techmarines-=1;}
                
                if (obj_ini.role[comp][i]=obj_ini.role[100][14]) and (global.chapter_name!="Space Wolves") and (global.chapter_name!="Iron Hands") and ((raid_spec=0) or (remove=1)){fighting[comp][i]=0;chaplains-=1;}
                if (obj_ini.role[comp][i]=obj_ini.role[100,17]) and ((raid_spec=0) or (remove=1)){fighting[comp][i]=0;psykers-=1;}
                if (obj_ini.role[comp][i]="Codiciery") and ((raid_spec=0) or (remove=1)){fighting[comp][i]=0;psykers-=1;}
                if (obj_ini.role[comp][i]="Lexicanum") and ((raid_spec=0) or (remove=1)){fighting[comp][i]=0;psykers-=1;}
                if (obj_ini.role[comp][i]=obj_ini.role[100][15]) and ((raid_spec=0) or (remove=1)){fighting[comp][i]=0;apothecaries-=1;}
                if (obj_ini.role[comp][i]=obj_ini.role[100][16]) and ((raid_spec=0) or (remove=1)){fighting[comp][i]=0;techmarines-=1;}
            }
            
            
            if (obj_ini.race[comp][i]=1) and (fighting[comp][i]=0) and (chick>0) and (remove=0){// Case 2; check for marines that need to be added
                if (obj_ini.role[comp][i]="Standard Bearer") and (raid_tact+raid_vet+raid_deva+raid_assa>0){
                    if (string_count("Bike",obj_ini.mobi[comp][i])>0) and (attack=1) then bikes+=1;
                    if (string_count("Bike",obj_ini.mobi[comp][i])=0) then mahreens+=1;
                    if (string_count("Bike",obj_ini.mobi[comp][i])=0) or (attack=1) then fighting[comp][i]=1;
                }
                if (string_count("Bike",obj_ini.mobi[comp][i])=0){
                    if (obj_ini.role[comp][i]=obj_ini.role[100][3]) and (raid_vet=1){fighting[comp][i]=1;veterans+=1;}
                    if (obj_ini.role[comp][i]=obj_ini.role[100][8]) and (raid_tact=1){fighting[comp][i]=1;mahreens+=1;}
                    if (obj_ini.role[comp][i]=obj_ini.role[100][9]) and (raid_deva=1){fighting[comp][i]=1;mahreens+=1;}
                    if (obj_ini.role[comp][i]=obj_ini.role[100][10]) and (raid_assa=1){fighting[comp][i]=1;mahreens+=1;}
                    if (obj_ini.role[comp][i]=obj_ini.role[100][12]) and (raid_scou=1){fighting[comp][i]=1;mahreens+=1;}
                }
                if (string_count("Bike",obj_ini.mobi[comp][i])>0) and (attack=1){
                    if (obj_ini.role[comp][i]=obj_ini.role[100][3]) and (raid_vet=1){fighting[comp][i]=1;bikes+=1;}
                    if (obj_ini.role[comp][i]=obj_ini.role[100][8]) and (raid_tact=1){fighting[comp][i]=1;bikes+=1;}
                    if (obj_ini.role[comp][i]=obj_ini.role[100][9]) and (raid_deva=1){fighting[comp][i]=1;bikes+=1;}
                    if (obj_ini.role[comp][i]=obj_ini.role[100][10]) and (raid_assa=1){fighting[comp][i]=1;bikes+=1;}
                    if (obj_ini.role[comp][i]=obj_ini.role[100][12]) and (raid_scou=1){fighting[comp][i]=1;bikes+=1;}
                }
                
                if (obj_ini.role[comp][i]=obj_ini.role[100][2]) and (raid_vet=1){fighting[comp][i]=1;honor+=1;}
                if (obj_ini.role[comp][i]=obj_ini.role[100][4]) and (raid_term=1){fighting[comp][i]=1;terminators+=1;}
                if (obj_ini.role[comp][i]=obj_ini.role[100][5]) and (raid_vet=1){fighting[comp][i]=1;capts+=1;}
                
                if (obj_ini.role[comp][i]="Chapter Master") and (raid_spec=1){fighting[comp][i]=1;master=1;}
                if (obj_ini.role[comp][i]="Master of Sanctity") and (raid_spec=1){fighting[comp][i]=1;chaplains+=1}
                if (obj_ini.role[comp][i]="Master of the Apothecarion") and (raid_spec=1){fighting[comp][i]=1;apothecaries+=1;}
                if (obj_ini.role[comp][i]="Chief "+string(obj_ini.role[100,17])) and (raid_spec=1){fighting[comp][i]=1;psykers+=1;}
                if (obj_ini.role[comp][i]="Forge Master") and (raid_spec=1){fighting[comp][i]=1;techmarines+=1;}
                
                if (obj_ini.role[comp][i]=obj_ini.role[100][14]) and (global.chapter_name!="Space Wolves") and (global.chapter_name!="Iron Hands") and (raid_spec=1){fighting[comp][i]=1;chaplains+=1;}
                if (obj_ini.role[comp][i]=obj_ini.role[100,17]) and (raid_spec=1){fighting[comp][i]=1;psykers+=1;}
                if (obj_ini.role[comp][i]="Codiciery") and (raid_spec=1){fighting[comp][i]=1;psykers+=1;}
                if (obj_ini.role[comp][i]="Lexicanum") and (raid_spec=1){fighting[comp][i]=1;psykers+=1;}
                if (obj_ini.role[comp][i]=obj_ini.role[100][15]) and (raid_spec=1){fighting[comp][i]=1;apothecaries+=1;}
                if (obj_ini.role[comp][i]=obj_ini.role[100][16]) and (raid_spec=1){fighting[comp][i]=1;techmarines+=1;}
            }
            
            
            // Remove wounded
            
            
            if (obj_ini.hp[comp][i]<=10) and (fighting[comp][i]=1) and (raid_wounded=0){fighting[comp][i]=0;
                if (obj_ini.role[comp][i]="Standard Bearer"){
                    if (obj_ini.mobi[comp][i]="Bike") then bikes-=1;
                    if (obj_ini.mobi[comp][i]!="Bike") then mahreens-=1;
                }
                if (string_count("Bike",obj_ini.mobi[comp][i])=0){
                    if (obj_ini.role[comp][i]=obj_ini.role[100][3]) then veterans-=1;
                    if (obj_ini.role[comp][i]=obj_ini.role[100][8]) then mahreens-=1;
                    if (obj_ini.role[comp][i]=obj_ini.role[100][9]) then mahreens-=1;
                    if (obj_ini.role[comp][i]=obj_ini.role[100][10]) then mahreens-=1;
                    if (obj_ini.role[comp][i]=obj_ini.role[100][12]) then mahreens-=1;
                }
                if (string_count("Bike",obj_ini.mobi[comp][i])>0){
                    if (obj_ini.role[comp][i]=obj_ini.role[100][3]) then bikes-=1;
                    if (obj_ini.role[comp][i]=obj_ini.role[100][8]) then bikes-=1;
                    if (obj_ini.role[comp][i]=obj_ini.role[100][9]) then bikes-=1;
                    if (obj_ini.role[comp][i]=obj_ini.role[100][10]) then bikes-=1;
                    if (obj_ini.role[comp][i]=obj_ini.role[100][12]) then bikes-=1;
                }
                
                if (obj_ini.role[comp][i]="Company Champion") then champions-=1;
                if (obj_ini.role[comp][i]=obj_ini.role[100][2]) then honor-=1;
                if (obj_ini.role[comp][i]=obj_ini.role[100][4]) then terminators-=1;
                if (obj_ini.role[comp][i]=obj_ini.role[100][5]) then capts-=1;
            
                if (obj_ini.role[comp][i]="Chapter Master") then master=0;
                if (obj_ini.role[comp][i]="Master of Sanctity") then chaplains-=1
                if (obj_ini.role[comp][i]="Master of the Apothecarion") then apothecaries-=1;
                if (obj_ini.role[comp][i]="Chief "+string(obj_ini.role[100,17])) then psykers-=1;
                if (obj_ini.role[comp][i]="Forge Master") then techmarines-=1;
                
                if (obj_ini.role[comp][i]=obj_ini.role[100][14]) and (global.chapter_name!="Space Wolves") and (global.chapter_name!="Iron Hands") then chaplains-=1;
                if (obj_ini.role[comp][i]=obj_ini.role[100,17]) then psykers-=1;
                if (obj_ini.role[comp][i]="Codiciery") then psykers-=1;
                if (obj_ini.role[comp][i]="Lexicanum") then psykers-=1;
                if (obj_ini.role[comp][i]=obj_ini.role[100][15]) then apothecaries-=1;
                if (obj_ini.role[comp][i]=obj_ini.role[100][16]) then techmarines-=1;
            }
        }
    }
}


