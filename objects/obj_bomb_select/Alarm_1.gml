/*
max_ships=sh_target.capital_number+sh_target.frigate_number+sh_target.escort_number;


if (sh_target.acted=1) then instance_destroy();

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
        
        purge_a+=3;
        purge_b+=ship_max[i];purge_c+=ship_max[i];
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
        
        purge_a+=1;
        purge_b+=ship_max[i];purge_c+=ship_max[i];
    }
}
q=0;
repeat(sh_target.escort_number){
    q+=1;
    if (sh_target.escort[q]!="") and (obj_ini.ship_carrying[sh_target.escort_num[q]]>0){
        i+=1;
        ship[i]=sh_target.escort[q];
        
        ship_use[i]=0;
        tump=sh_target.escort_num[q];
        ship_max[i]=obj_ini.ship_carrying[tump];
        ship_ide[i]=tump;
        
        purge_b+=ship_max[i];purge_c+=ship_max[i];
    }
}*/

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

var fleet = sh_target;
for (var i = 0; i < max_ships; i++) {
	ship[i] = fleet.ships[i].name;
	ship_use[i] = 0;
	ship_max[i] = fleet.ships[i].carrying;
	ship_ide[i] = array_get_index(obj_ini.ship, fleet.ships[i]);
	bomb_b += ship_max[i];
	bomb_c += ship_max[i];
	
	if (fleet.ships[i].size = SHIP_SIZE.capital) {
		bomb_a += 3;	
	}
	else if (fleet.ships[i].size = SHIP_SIZE.frigate) {
		bomb_a += 1;
	}
}

eldar=p_target.p_eldar[obj_controller.selecting_planet];
ork=p_target.p_orks[obj_controller.selecting_planet];
tau=p_target.p_tau[obj_controller.selecting_planet];
chaos=p_target.p_chaos[obj_controller.selecting_planet];
tyranids=p_target.p_tyranids[obj_controller.selecting_planet];if (tyranids<5) then tyranids=0;
traitors=p_target.p_traitors[obj_controller.selecting_planet];
necrons=p_target.p_necrons[obj_controller.selecting_planet];

var onceh;onceh=0;
imp=p_target.p_guardsmen[obj_controller.selecting_planet];
if (imp>=50000000) and (onceh=0){imp=6;onceh=1;}
if (imp<50000000) and (imp>=15000000) and (onceh=0){imp=5;onceh=1;}
if (imp<15000000) and (imp>=6000000) and (onceh=0){imp=4;onceh=1;}
if (imp<6000000) and (imp>=1000000) and (onceh=0){imp=3;onceh=1;}
if (imp<1000000) and (imp>=100000) and (onceh=0){imp=2;onceh=1;}
if (imp<100000) and (imp>=2000) and (onceh=0){imp=1;onceh=1;}

onceh=0;
pdf=p_target.p_pdf[obj_controller.selecting_planet];
if (pdf>=50000000) and (onceh=0){pdf=6;onceh=1;}
if (pdf<50000000) and (pdf>=15000000) and (onceh=0){pdf=5;onceh=1;}
if (pdf<15000000) and (pdf>=6000000) and (onceh=0){pdf=4;onceh=1;}
if (pdf<6000000) and (pdf>=1000000) and (onceh=0){pdf=3;onceh=1;}
if (pdf<1000000) and (pdf>=100000) and (onceh=0){pdf=2;onceh=1;}
if (pdf<100000) and (pdf>=2000) and (onceh=0){pdf=1;onceh=1;}

sisters=p_target.p_sisters[obj_controller.selecting_planet];
mechanicus=0;

targets=0;
if (ork>0) then targets+=1;
if (tau>0) then targets+=1;
if (chaos>0) then targets+=1;
if (tyranids>0) then targets+=1;
if (traitors>0) then targets+=1;
if (necrons>0) then targets+=1;

if (imp>0) then targets+=1;
if (pdf>0) then targets+=1;
if (sisters>0) then targets+=1;



target=2;
if (eldar>chaos) and (eldar>traitors) and (eldar>ork) and (eldar>tau) and (eldar>tyranids) and (eldar>necrons) then target=6;
if (ork>chaos) and (ork>traitors) and (ork>eldar) and (ork>tau) and (ork>tyranids) and (ork>necrons) then target=7;
if (tau>chaos) and (tau>traitors) and (tau>eldar) and (tau>ork) and (tau>tyranids) and (tau>necrons) then target=8;
if (tyranids>chaos) and (tyranids>traitors) and (tyranids>ork) and (tyranids>tau) and (tyranids>eldar) and (tyranids>necrons) then target=9;
if (chaos>ork) and (chaos>=traitors) and (chaos>eldar) and (chaos>tau) and (chaos>tyranids) and (chaos>necrons) then target=10;
if (traitors>ork) and (traitors>=chaos) and (traitors>eldar) and (traitors>tau) and (traitors>tyranids) and (traitors>necrons) then target=10;
if (necrons>ork) and (necrons>=chaos) and (necrons>eldar) and (necrons>tau) and (necrons>tyranids) and (necrons>traitors) then target=13;
if (p_target.p_owner[obj_controller.selecting_planet]=8){
    if (pdf>chaos) and (pdf>traitors) and (pdf>eldar) and (pdf>ork) and (pdf>tyranids) and (pdf>tau) and (pdf>necrons) then target=2.5;
}
if (p_target.craftworld=1) then target=6;

/* */
/*  */
