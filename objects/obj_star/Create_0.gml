// Creates all variables, sets up default variables for different planets and if there is a fleet orbiting a system/planet
craftworld=0;// orbit_angle=0;orbit_radius=0;
space_hulk=0;
old_x=0;
old_y=0;

if (((x>=(room_width-150)) and (y<=450)) or (y<100)) and (global.load==0){// was 300
    instance_destroy();
}

var run=0;
name="";
star="";
planets=0;
owner=2;
image_speed=0;
image_alpha=0;
x2=0;
y2=0;
buddy=0;
if (global.load==0) then alarm[0]=1;
storm=0;
storm_image=0;
trader=0;
visited=0;

// sets up default planet variables
for(run=1; run<=8; run++){
    planet[run]=0;
    dispo[run]=-50;
    p_type[run]="";
    p_feature[run]=[];
    p_owner[run]=0;
    p_first[run]=0;
    p_population[run]=0;
    p_max_population[run]=0;
    p_large[run]=0;
    p_pop[run]="";
    p_guardsmen[run]=0;
    p_pdf[run]=0;
    p_fortified[run]=0;
    p_station[run]=0;
	warlord=0;
    // Whether or not player forces are on the planet
    p_player[run]=0;
    p_lasers[run]=0;
    p_silo[run]=0;
    p_defenses[run]=0;
    p_upgrades[run]="";
    // v how much of a problem they are from 1-5
    p_orks[run]=0;
    p_tau[run]=0;
    p_eldar[run]=0;
    p_tyranids[run]=0;
    p_traitors[run]=0;
    p_chaos[run]=0;
    p_demons[run]=0;
    p_sisters[run]=0;
    p_necrons[run]=0;
    p_halp[run]=0;
    // current planet heresy
    p_heresy[run]=0;
    p_hurssy[run]=0;
    p_hurssy_time[run]=0;
    p_heresy_secret[run]=0;
    p_influence[run]=0;
    p_raided[run]=0;
    // 
    p_problem[0,run]="";
    p_timer[0,run]=0;
    p_problem[1,run]="";
    p_timer[1,run]=0;
    p_problem[2,run]="";
    p_timer[2,run]=0;
    p_problem[3,run]="";
    p_timer[3,run]=0;
    p_problem[4,run]="";
    p_timer[4,run]=0;
    p_problem[5,run]="";
    p_timer[5,run]=0;
}

for(run=8; run<=30; run++){
    present_fleet[run]=0;
}
vision=1;
// present_fleets=0;
// tau_fleets=0;

ai_a=-1;
ai_b=-1;
ai_c=-1;
ai_d=-1;
ai_e=-1;
