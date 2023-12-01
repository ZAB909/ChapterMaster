
// 


var i;i=0;
repeat(600){i+=1;
    if (marine_type[i]!="") and (marine_hp[i]<-3000) and (obj_ncombat.defeat=0){marine_dead[i]=0;marine_hp[i]+=5000;}// For incapitated

    if (marine_mobi[i]="Bike"){// 135 ; 
        var onceh;onceh=0;
        if (marine_hp[i]>0) and (marine_hp[i]<=25) and (onceh=0){marine_hp[i]=1;onceh=1;}
        if (onceh=0) then marine_hp[i]-=25;
    }
    if (marine_gear[i]="Iron Halo"){// 135 ; 
        var onceh;onceh=0;
        if (marine_hp[i]>0) and (marine_hp[i]<=20) and (onceh=0){marine_hp[i]=1;onceh=1;}
        if (onceh=0) then marine_hp[i]-=20;
    }
    if (marine_wep1[i]="Boarding Shield"){// 135 ; 
        var onceh;onceh=0;
        if (marine_hp[i]>0) and (marine_hp[i]<=20) and (onceh=0){marine_hp[i]=1;onceh=1;}
        if (onceh=0) then marine_hp[i]-=20;
    }
    if (marine_wep2[i]="Boarding Shield"){// 135 ; 
        var onceh;onceh=0;
        if (marine_hp[i]>0) and (marine_hp[i]<=20) and (onceh=0){marine_hp[i]=1;onceh=1;}
        if (onceh=0) then marine_hp[i]-=20;
    }
    if (marine_wep1[i]="Storm Shield"){// 135 ; 
        var onceh;onceh=0;
        if (marine_hp[i]>0) and (marine_hp[i]<=30) and (onceh=0){marine_hp[i]=1;onceh=1;}
        if (onceh=0) then marine_hp[i]-=30;
    }
    if (marine_wep2[i]="Storm Shield"){// 135 ; 
        var onceh;onceh=0;
        if (marine_hp[i]>0) and (marine_hp[i]<=30) and (onceh=0){marine_hp[i]=1;onceh=1;}
        if (onceh=0) then marine_hp[i]-=30;
    }
    
    
    
    if (ally[i]=false){
        if (obj_ncombat.dropping=1) and (obj_ncombat.defeat=1) and (marine_dead[i]<2) then marine_dead[i]=1;
        if (obj_ncombat.dropping=0) and (obj_ncombat.defeat=1) and (marine_dead[i]<2){marine_dead[i]=2;marine_hp[i]=-50;}
        
    
        if (marine_type[i]!="") and (obj_ncombat.defeat=1) and (marine_dead[i]<2){marine_dead[i]=1;marine_hp[i]=-50;}
        if (veh_type[i]!="") and (obj_ncombat.defeat=1){veh_dead[i]=1;veh_hp[i]=-200;}
    
        if (marine_type[i]=obj_ini.role[100][15]) and (marine_gear[i]="Narthecium") and (marine_dead[i]=0){
            obj_ncombat.apothecaries_alive+=1;obj_ncombat.apoth+=1;
        }
        if (marine_type[i]=obj_ini.role[100][16]) and (marine_gear[i]="Servo Arms") and (marine_dead[i]=0){
            obj_ncombat.techmarines_alive+=1;obj_ncombat.techma+=1;
        }
        
        
        if (marine_dead[i]>0) and (marine_dead[i]<2) and (marine_hp[i]>-25) and (marine_type[i]!="") and ((obj_ncombat.dropping+obj_ncombat.defeat)!=2){
            var rand1, survival;onceh=0;
            survival=40;if (obj_ncombat.membrane=1) then survival=20;
            rand1=floor(random(100))+1;
            
            if (rand1<=survival) and (marine_dead[i]!=2){
                // show_message(string(marine_type[i])+" mans up#Roll: "+string(rand1)+"#Needed: "+string(survival)+"-");
                marine_dead[i]=0;
                marine_hp[i]=2;
                obj_ncombat.injured+=1;
            }
        }
    }
    
}




