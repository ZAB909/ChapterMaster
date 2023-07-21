var min_hp = 0;
var max_hp = 0;
var capitals = get_capitals(ships);
for (var i = 0; i < capital_number; i++) {
	min_hp += capitals[i].hp;
	max_hp += capitals[i].max_hp;
}
if(max_hp > 0) {
	capital_health = round((min_hp/max_hp)*100);
}


min_hp = 0;
max_hp = 0;
var frigates = get_frigates(ships);
for (var i = 0; i < frigate_number; i++) {
	min_hp += frigates[i].hp;
	max_hp += frigates[i].max_hp;
}
if(max_hp > 0) {
	frigate_health = round((min_hp/max_hp)*100);
}


min_hp = 0;
max_hp = 0;
var escorts = get_escorts(ships);
for (var i = 0; i < escort_number; i++) {
	min_hp += escorts[i].hp;
	max_hp += escorts[i].max_hp;
}
if(max_hp > 0) {
	escort_health = round((min_hp/max_hp)*100);
}


