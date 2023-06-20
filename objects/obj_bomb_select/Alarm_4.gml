var i;i=-1;
repeat(31){
    i+=1;
    ship[i]="";
    ship_all[i]=0;
    ship_use[i]=0;
    ship_max[i]=0;
    ship_ide[i]=0;
}

max_ships=sh_target.capital_number+sh_target.frigate_number+sh_target.escort_number;


var tump;tump=0;

var i, q, b;i=0;q=0;b=0;
repeat(sh_target.capital_number){
    b+=1;
    if (sh_target.capital[b]!=""){
        i+=1;
        ship[i]=sh_target.capital[i];
        
        ship_use[i]=0;
        tump=sh_target.capital_num[i];
        ship_max[i]=obj_ini.ship_carrying[tump];
        ship_ide[i]=tump;
        
        bomb_a+=3;
        bomb_b+=ship_max[i];bomb_c+=ship_max[i];
    }
}
q=0;
repeat(sh_target.frigate_number){
    q+=1;
    if (sh_target.frigate[q]!=""){
        i+=1;
        ship[i]=sh_target.frigate[q];
        
        ship_use[i]=0;
        tump=sh_target.frigate_num[q];
        ship_max[i]=obj_ini.ship_carrying[tump];
        ship_ide[i]=tump;
        
        bomb_a+=1;
        bomb_b+=ship_max[i];bomb_c+=ship_max[i];
    }
}

