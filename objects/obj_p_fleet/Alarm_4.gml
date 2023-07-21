
var sys, sys_dist, mine, connected, fleet, cont;
sys_dist=9999;connected=0;cont=0;


var eta;eta=0;
eta=floor(point_distance(x,y,action_x,action_y)/action_spd)+1;
// if (connected=0) then eta=eta*2;
// if (connected=1) then connected=1;
// if (web=1) then eta=1;
action_eta=eta;


// if (action="crusade2") then action="crusade3";
// if (action="crusade1") then action="crusade2";

var ship_count = array_length(ships);
for (var i = 0; i < ship_count; i++){
	if (!ships[i].selected) {
		ships[i].location = "Warp";
	}
}