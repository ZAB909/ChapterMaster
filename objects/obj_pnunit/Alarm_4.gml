
// 


var unit;
for (var i=0;i<array_length(unit_struct);i++){i+=1;
    unit = unit_struct[i];
    if (!is_struct(unit))then continue;
    if (marine_type[i]!="") and (unit.hp()<-3000) and (obj_ncombat.defeat=0){
        marine_dead[i]=0;
        unit.add_or_sub_health(5000);
    }// For incapitated
    
    if (ally[i]=false){
        if (obj_ncombat.dropping=1) and (obj_ncombat.defeat=1) and (marine_dead[i]<2) then marine_dead[i]=1;
        if (obj_ncombat.dropping=0) and (obj_ncombat.defeat=1) and (marine_dead[i]<2){
            marine_dead[i]=2;
            marine_hp[i]=-50;
        }
        
    
        if (marine_type[i]!="") and (obj_ncombat.defeat=1) and (marine_dead[i]<2){marine_dead[i]=1;marine_hp[i]=-50;}
        if (veh_type[i]!="") and (obj_ncombat.defeat=1){veh_dead[i]=1;veh_hp[i]=-200;}
    
        if (marine_type[i]=obj_ini.role[100][15]) and (marine_gear[i]=="Narthecium") and (marine_dead[i]=0){
            obj_ncombat.apothecaries_alive++;
            obj_ncombat.apoth+=1;
        }
        if (marine_type[i]=obj_ini.role[100][16]) and (marine_gear[i]=="Servo Arms") and (marine_dead[i]=0){
            obj_ncombat.techmarines_alive+=1;
            obj_ncombat.techma+=1;
        }
        
        
        if (marine_dead[i]>0) and (marine_dead[i]<2) and (unit.hp()>-25) and (marine_type[i]!="") and ((obj_ncombat.dropping+obj_ncombat.defeat)!=2){
            var rand1, survival;
            onceh=0;
            survival=40;
            if (obj_ncombat.membrane=1) then survival=20;
            rand1=floor(random(100))+1;
            
            if (rand1<=survival) and (marine_dead[i]!=2){
                // show_message(string(marine_type[i])+" mans up#Roll: "+string(rand1)+"#Needed: "+string(survival)+"-");
                marine_dead[i]=0;
                //unit.update_health(2);
                obj_ncombat.injured+=1;
            }
        }
    }
    
}




