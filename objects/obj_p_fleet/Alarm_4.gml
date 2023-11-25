
var sys_dist, mine, connected, fleet, cont;
sys_dist=9999;connected=0;cont=0;


var eta;eta=0;
eta=floor(point_distance(x,y,action_x,action_y)/action_spd)+1;
// if (connected=0) then eta=eta*2;
// if (connected=1) then connected=1;
// if (web=1) then eta=1;
action_eta=eta;


// if (action="crusade2") then action="crusade3";
// if (action="crusade1") then action="crusade2";


var w, tempp;
w=0;repeat(capital_number){
    w+=1;if (capital[w]!="") and (capital_sel[w]=0){tempp=capital_num[w];obj_ini.ship_location[tempp]="Warp";}
}
w=0;repeat(frigate_number){
    w+=1;if (frigate[w]!="") and (frigate_sel[w]=0){tempp=frigate_num[w];obj_ini.ship_location[tempp]="Warp";}
}
w=0;repeat(escort_number){
    w+=1;if (escort[w]!="") and (escort_sel[w]=0){tempp=escort_num[w];obj_ini.ship_location[tempp]="Warp";}
}



