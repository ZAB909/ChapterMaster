
var i;
i=1;

// p_population[run]=0;p_guardsmen[run]=0;p_pdf[run]=0;


repeat(4){
    p_population[i]=0;// 10B        
    
    if (p_type[i]="Lava"){
        p_population[i]=floor(random(100))+400;p_station[i]=2;
        p_max_population[i]=150000;
    }
    if (p_type[i]="Desert"){
        p_population[i]=floor(random(300000000))+50000000;p_fortified[i]=choose(2,3,4);p_station[i]=3;
        p_max_population[i]=350000000;
    }
    if (p_type[i]="Hive"){
        p_population[i]=random(50)+50;p_large[i]=1;p_fortified[i]=4;p_station[i]=choose(4,5);
        p_max_population[i]=150;
    }
    if (p_type[i]="Agri"){
        p_population[i]=floor(random(10000000))+5000000;p_fortified[i]=choose(0,1);p_station[i]=choose(0,1);
        p_max_population[i]=15000000;
    }
    if (p_type[i]="Temperate"){
        p_population[i]=random(2)+5;p_large[i]=1;p_fortified[i]=choose(3,4);p_station[i]=choose(3,4);
        p_max_population[i]=7;
    }
    if (p_type[i]="Shrine"){
        p_population[i]=random(2)+4;p_large[i]=1;p_fortified[i]=choose(4,5);p_station[i]=choose(4,5);
        p_max_population[i]=7;
    }
    if (p_type[i]="Ice"){
        p_population[i]=floor(random(1500000))+500000;p_fortified[i]=choose(1,2,3);p_station[i]=choose(1,2,3);
        p_max_population[i]=2000000;
    }
    if (p_type[i]="Feudal"){
        p_population[i]=floor(random(100000000))+50000000;p_fortified[i]=choose(2,3);p_station[i]=choose(2,3,4);
        p_max_population[i]=150000000;
    }
    if (p_type[i]="Forge"){
        p_population[i]=random(2)+4;p_large[i]=1;p_fortified[i]=5;p_station[i]=5;
        p_max_population[i]=6;
    }
    if (p_type[i]="Death"){
        p_population[i]=floor(random(4900000))+100000;p_station[i]=choose(2,3);
        p_max_population[i]=5000000;
    }
    if (p_type[i]="Craftworld"){
        p_population[i]=floor(random_range(150000,300000));p_station=6;
        p_max_population[i]=p_population;
    }
    
    
    
    if (p_population[i]>=10000000){
        var military;military=p_population[i]/470;
        p_guardsmen[i]=floor(military*0.25);
        p_pdf[i]=floor(military*0.75);
    }
    if (p_population[i]>=5000000) and (p_population[i]<10000000){
        var military;military=p_population[i]/200;
        p_guardsmen[i]=floor(military*0.25);
        p_pdf[i]=floor(military*0.75);
    }
    if (p_population[i]>=100000) and (p_population[i]<5000000){
        var military;military=p_population[i]/50;
        p_guardsmen[i]=floor(military*0.25);
        p_pdf[i]=floor(military*0.75);
    }
    if (p_population[i]<100000) and (p_population[i]>5) and (p_large[i]=0){
        p_pdf[i]=floor(p_population[i]/25);
    }
    if (p_population[i]<2000) and (p_population[i]>5) and (p_large[i]=0){
        p_pdf[i]=floor(p_population[i]/10);
    }
    if (p_large[i]=1){
        p_guardsmen[i]=floor(p_population[i]*1250000);
        p_pdf[i]=p_guardsmen[i]*3;
    }
    
    if (p_population[i]<1000000)  and (p_large[i]=0)then p_pop[i]=string(p_population[i]);
    if (p_population[i]>999999)  and (p_large[i]=0)and (p_population[i]<1000000000) then p_pop[i]=string(p_population[i]/1000000)+"M";
    if (p_large[i]=1) then p_pop[i]=string(p_population[i])+"B";
    
    if (craftworld=1){p_guardsmen[i]=0;p_pdf[i]=0;p_eldar[i]=6;owner=6;p_owner[1]=6;buddy=0;x2=0;}
    
    p_guardsmen[i]=0;
    i+=1;
}
i=0;repeat(4){i+=1;p_guardsmen[i]=0;}




var fleet, flit, capital, frigate, escort, v;flit=0;capital=0;frigate=0;escort=0;v=0;
if (owner=2) or (owner=7) or (owner=3){// create imperial fleet

    var g;g=0;
    repeat(4){g+=1;
        if (p_type[g]="Hive") then flit+=4;
        if (p_type[g]="Forge") then flit+=8;
        if (p_type[g]="Desert") or (p_type[g]="Temperate") then flit+=1;
        if (p_type[g]="Feudal") or (p_type[g]="Ice") then flit+=0.5;
        if (p_type[g]="Shrine") then flit+=2;
    }
    
    frigate=round(flit/2);
    escort=round(flit);
    
    /*if (flit>=4){
        // capital=choose(0,1);
        frigate=choose(3,4,5,6);
        escort=floor(random_range(4,10));
        
        if (owner=7) and (capital>0) then capital-=choose(0,1);
        if (owner=7) and (frigate>0) then frigate-=floor(random(4));
        if (owner=7) and (escort>0) then escort-=floor(random(4));
    }
    if (flit>=1) and (flit<4){
        capital=choose(0,0,0,1);
        frigate=floor(random_range(2,5));
        escort=floor(random_range(3,8));
        
        if (owner=7) and (capital>0) then capital-=choose(0,1,2);
        if (owner=7) and (frigate>0) then frigate-=floor(random(6));
        if (owner=7) and (escort>0) then escort-=floor(random(6));
    }
    if (flit<1) and (flit>0){
        frigate=floor(random_range(1,3));
        escort=floor(random_range(2,5));
        
        if (owner=7) and (capital>0) then capital-=choose(0,1,2,3);
        if (owner=7) and (frigate>0) then frigate-=floor(random(8));
        if (owner=7) and (escort>0) then escort-=floor(random(8));
    }
    
    capital=round(capital/2);
    frigate=round(frigate/2);
    escort=round(escort/2);*/
    
    if (capital<0) then capital=0;
    if (frigate<0) then frigate=0;
    if (escort<0) then escort=0;
    
    
    if (flit>0){                                                      // DISABLED FOR TESTING FLEET COMBAT
        fleet=instance_create(x,y-32,obj_en_fleet);
        fleet.owner=2;
        
        fleet.capital_number=capital;
        fleet.frigate_number=frigate;
        fleet.escort_number=escort;
        
        // present_fleet[2]+=1;
        
        // Create ships here
        fleet.image_speed=0;
        var ii;ii=0;ii+=capital-1;ii+=round((frigate/2));ii+=round((escort/4));
        if (ii<=1) and (capital+frigate+escort>0) then ii=1;
        fleet.image_index=ii;
    }
    
}


if (owner=7){
    if (p_population[1]>0) then p_orks[1]=1;
    if (p_population[2]>0) then p_orks[2]=1;
    if (p_population[3]>0) then p_orks[3]=1;
    if (p_population[4]>0) then p_orks[4]=1;
    
    if (p_orks[1]>0){p_orks[1]=choose(1,2,3,3,4,5);if (p_type[1]="Forge") or (p_type[1]="Hive") then p_orks[1]=choose(5);}
    if (p_orks[2]>0){p_orks[2]=choose(1,2,3,3,4,5);if (p_type[2]="Forge") or (p_type[2]="Hive") then p_orks[2]=choose(5);}
    if (p_orks[3]>0){p_orks[3]=choose(1,2,3,3,4,5);if (p_type[3]="Forge") or (p_type[3]="Hive") then p_orks[3]=choose(5);}
    if (p_orks[4]>0){p_orks[4]=choose(1,2,3,3,4,5);if (p_type[4]="Forge") or (p_type[4]="Hive") then p_orks[4]=choose(5);}
}





flit=1;capital=0;frigate=0;escort=0;v=0;
if (owner=8){// create tau fleet
    if (p_type[1]="Desert") then flit+=5;if (p_type[2]="Desert") then flit+=5;
    if (p_type[3]="Desert") then flit+=5;if (p_type[4]="Desert") then flit+=5;
    
    if (flit>=4){
        capital=choose(1,2,2,2,3,4);
        frigate=floor(random_range(5,10));
        escort=floor(random_range(8,14));
    }
    if (flit>=1) and (flit<3){
        capital=choose(1,2,2);
        frigate=floor(random_range(4,8));
        escort=floor(random_range(5,12));
    }
    
    if (flit>0){
        fleet=instance_create(x-24,y-24,obj_en_fleet);
        fleet.owner=8;
        // Create ships here
        fleet.sprite_index=spr_fleet_tau;
        fleet.image_speed=0;
        
        
        fleet.capital_number=capital;
        fleet.frigate_number=frigate;
        fleet.escort_number=escort;
        
        fleet.image_index=floor((capital)+(frigate/2)+(escort/4));
        
        // present_fleets+=1;tau_fleets+=1;
    }
    
    // p_tau[1]=0;p_tau[2]=0;p_tau[3]=0;p_tau[4]=0;
    /*if (p_population[1]>0) then p_tau[1]=1;
    if (p_population[2]>0) then p_tau[2]=1;
    if (p_population[3]>0) then p_tau[3]=1;
    if (p_population[4]>0) then p_tau[4]=1;*/
    
    if (p_type[1]!="Dead") then p_tau[1]=choose(1,2,3,4);
    if (p_type[2]!="Dead") then p_tau[2]=choose(1,2,3,4);
    if (p_type[3]!="Dead") then p_tau[3]=choose(1,2,3,4);
    if (p_type[4]!="Dead") then p_tau[4]=choose(1,2,3,4);
    
    if (p_type[1]="Desert") and (p_tau[1]<4) then p_tau[1]=4;
    if (p_type[2]="Desert") and (p_tau[2]<4) then p_tau[2]=4;
    if (p_type[3]="Desert") and (p_tau[3]<4) then p_tau[3]=4;
    if (p_type[4]="Desert") and (p_tau[4]<4) then p_tau[4]=4;
    
    if (p_tau[1]>0){p_owner[1]=8;p_first[1]=8;
        if (p_type[1]="Forge") or (p_type[1]="Hive") then p_tau[1]=choose(2,3);if (p_type[1]="Ice") then p_tau[1]=choose(1,2);
        if (p_type[1]="Temperate") or (p_type[1]="Desert") or (p_type[1]="Feudal") then p_tau[1]=choose(3,3,4,4,5);
    }
    if (p_tau[2]>0){p_owner[2]=8;p_first[2]=8;
        if (p_type[2]="Forge") or (p_type[2]="Hive") then p_tau[2]=choose(2,3);if (p_type[2]="Ice") then p_tau[2]=choose(1,2);
        if (p_type[2]="Temperate") or (p_type[2]="Desert") or (p_type[2]="Feudal") then p_tau[2]=choose(3,3,4,4,5);
    }
    if (p_tau[3]>0){p_owner[3]=8;p_first[3]=8;
        if (p_type[3]="Forge") or (p_type[3]="Hive") then p_tau[3]=choose(2,3);if (p_type[3]="Ice") then p_tau[3]=choose(1,2);
        if (p_type[3]="Temperate") or (p_type[3]="Desert") or (p_type[3]="Feudal") then p_tau[3]=choose(3,3,4,4,5);
    }
    if (p_tau[4]>0){p_owner[4]=8;p_first[4]=8;
        if (p_type[4]="Forge") or (p_type[3]="Hive") then p_tau[4]=choose(2,3);if (p_type[4]="Ice") then p_tau[4]=choose(1,2);
        if (p_type[4]="Temperate") or (p_type[3]="Desert") or (p_type[4]="Feudal") then p_tau[4]=choose(3,3,4,4,5);
    }
    
    p_owner[1]=8;p_first[1]=8;p_influence[1]=70;
    p_owner[2]=8;p_first[2]=8;p_influence[2]=70;
    p_owner[3]=8;p_first[3]=8;p_influence[3]=70;
    p_owner[4]=8;p_first[4]=8;p_influence[4]=70;
    
    /*if (p_population[4]<=0) then exit;
    
    if (p_tau[4]>0){p_owner[4]=8;
        if (p_type[4]="Forge") or (p_type[4]="Hive") then p_tau[4]=choose(2,3);if (p_type[4]="Ice") then p_tau[4]=choose(1,2);
        if (p_type[4]="Temperate") or (p_type[4]="Desert") or (p_type[4]="Feudal") then p_tau[4]=choose(3,3,4,4,5);
    }
    if (p_type[4]="Desert") and (p_tau[4]<4) then p_tau[4]=4;*/
    
    
}



if (owner=9){
    if (p_population[1]>0) then p_tyranids[1]=1;
    if (p_population[2]>0) then p_tyranids[2]=1;
    if (p_population[3]>0) then p_tyranids[3]=1;
    if (p_population[4]>0) then p_tyranids[4]=1;
    
    if (p_tyranids[1]>0){p_tyranids[1]=choose(4,5);if (p_type[1]="Forge") or (p_type[1]="Hive") then p_tyranids[1]=choose(5);}
    if (p_tyranids[2]>0){p_tyranids[2]=choose(4,5);if (p_type[2]="Forge") or (p_type[2]="Hive") then p_tyranids[2]=choose(5);}
    if (p_tyranids[3]>0){p_tyranids[3]=choose(4,5);if (p_type[3]="Forge") or (p_type[3]="Hive") then p_tyranids[3]=choose(5);}
    if (p_tyranids[4]>0){p_tyranids[4]=choose(4,5);if (p_type[4]="Forge") or (p_type[4]="Hive") then p_tyranids[4]=choose(5);}
    
    p_owner[1]=2;p_owner[2]=2;p_owner[3]=2;p_owner[4]=2;
}


if (owner>20){
    if (p_population[1]>0) then p_tyranids[1]=3;
    if (p_population[2]>0) then p_tyranids[2]=3;
    if (p_population[3]>0) then p_tyranids[3]=3;
    if (p_population[4]>0) then p_tyranids[4]=3;
    
    p_owner[1]=2;p_owner[2]=2;p_owner[3]=2;p_owner[4]=2;
    owner=9;
}



var i;i=0;
repeat(4){i+=1;
    if (p_owner[i]=8) and (p_guardsmen[i]>0){p_pdf[i]+=p_guardsmen[i];p_guardsmen[i]=0;}
    if (p_type[i]="Shrine") and (p_owner[i]!=1) and (p_first[i]!=1){p_owner[i]=5;p_first[i]=5;p_sisters[i]=4;}
    // if (p_owner[i]=3) or (p_owner[i]=5){p_feature[i]="Artifact|";}Testing ; 137
}



if (name="Kim Jong") and (owner=10){
    // if (owner=10){
        if (p_type[1]!="Dead"){p_heresy[1]=100;p_traitors[1]=2;}
        if (p_type[2]!="Dead"){p_heresy[2]=100;p_traitors[2]=2;}
        if (p_type[3]!="Dead"){p_heresy[3]=100;p_traitors[3]=2;}
        if (p_type[4]!="Dead"){p_heresy[4]=100;p_traitors[4]=2;}
    // }
}


obj_controller.alarm[3]=1;


i=choose(0,1);
if (i=1) and (planets>0){
    var nostart,aa;nostart=false;aa=0;
    i=floor(random(planets))+1;
    
    if (instance_exists(obj_p_fleet)) then aa=instance_nearest(x,y,obj_p_fleet);
    if (instance_exists(obj_p_fleet)){if (point_distance(x,y,aa.x,aa.y)>50) then nostart=true;}
    if (!instance_exists(obj_p_fleet)) then nostart=true;
    
    if (array_length(p_feature[i])=0) and (p_owner[i]!=1) and (nostart=true){
		var ranb;ranb=0;
		// if (ranb=1) and (p_owner[i]!=1) and (p_owner[i]!=2) and (p_owner[i]!=3) then ranb=floor(random(4))+2;
		//
		var goo;goo=0;
		repeat(10){if (goo=0){ranb=floor(random(6))+1;

			if (name="Vulvis Major") then ranb=1;
			if (name="Necron Assrape") then ranb=2;
			if (name="Morrowynd") then ranb=5;
			
		if (goo==0){
			switch (ranb){
				case 1:

					 array_push(p_feature[i], new new_planet_feature(P_features.Sororitas_Cathedral))
					 if (p_heresy[i]>10) then p_heresy[i]-=10;
					 p_sisters[i]=choose(2,2,3);goo=1;
					break;
		case 2:
			if (p_type[i]!="Hive") and (p_type[i]!="Lava") and (goo=0){
			    array_push(p_feature[i], new new_planet_feature(P_features.Necron_Tomb))
			}
			break;
			case 3:
			    array_push(p_feature[i], new new_planet_feature( P_features.Artifact))
				break;
			case 4:
			    array_push(p_feature[i], new new_planet_feature( P_features.STC_Fragment))
			break;
			case 5:
			if (p_type[i]!="Ice") and (p_type[i]!="Dead") and (p_type[i]!="Feudal"){goo=1;
			    array_push(p_feature[i], new new_planet_feature( P_features.Ancient_Ruins))
			}
			break;
			//alternative spawn for necron tomb probably needs merging with other method
			case 6:
			if ((p_type[i]="Ice") or (p_type[i]="Dead")){
			    array_push(p_feature[i], new new_planet_feature( P_features.Necron_Tomb))

			}
			break;
			case 7:
			if (ranb=7) and ((p_type[i]="Dead") or (p_type[i]="Desert")){
			    var randum;randum=floor(random(100))+1;
			    if (randum<=25){
			        array_push(p_feature[i], new new_planet_feature( P_features.Cave_Network))
			    }
			}
			break;
			}
		}


		}}
	}

}





var hyu;hyu=0;i=0;
repeat(4){i+=1;
    if (p_tyranids[i]>=5){
        p_guardsmen[i]=0;
        p_pdf[i]=0;
        p_population[i]=0;
        hyu+=1;
        p_owner[i]=9;
    }
    if (p_first[i]<=5) and (dispo[i]>-5000) then dispo[i]=-20;
}
if (hyu=0) and (owner=9) then owner=2;


scr_star_ownership(false);

/*if (p_owner[1]=5) or (p_owner[2]=5) or (p_owner[3]=5) or (p_owner[4]=5){
    var ngood;ngood=0;
    if (p_owner[1]!=7) and (p_owner[2]!=7) and (p_owner[3]!=7) and (p_owner[4]!=7) then ngood+=1;
    if (p_owner[1]!=8) and (p_owner[2]!=8) and (p_owner[3]!=8) and (p_owner[4]!=8) then ngood+=1;
    if (p_owner[1]!=13) and (p_owner[2]!=13) and (p_owner[3]!=13) and (p_owner[4]!=13) then ngood+=1;
    if (ngood=3) then owner=5;
}*/
// Cult testing
// p_feature[1]="Artifact";
// if (planets>=1) and (global.debug=1) then p_feature[1]="Necron Tomb";
// p_problem[1,1]="bomb";
// p_timer[1,1]=30;
// p_orks[1]=2;
// p_tau[1]=3;
// p_owner[1]=8;
// p_pdf[1]=0;
// p_guardsmen[1]=0;
// p_population[1]=0;
/*    p_type[1]="Daemon";p_fortified[1]=6;p_traitors[1]=7;p_owner[1]=10;
    p_feature[1]="";
*/
// p_feature[1]="Ancient Ruins";
// p_feature[2]="Artifact";
// if (planets>=1){p_problem[1,1]="spyrer";p_timer[1,1]=100;}
// if (planets>=3){p_problem[3,1]="bomb";p_timer[3,1]=10;}

// if (p_type[2]!="Hive") and (p_type[2]!="Dead") and (choose(0,0,1)=1) then p_population[2]=0;


/*if (planets>=1) then p_tyranids[1]=choose(0,0,0,1,2,3);
if (planets>=2) then p_tyranids[2]=choose(0,0,0,1,2,3);
if (planets>=3) then p_tyranids[3]=choose(0,0,0,1,2,3);
if (planets>=4) then p_tyranids[4]=choose(0,0,0,1,2,3);*/


// if (owner=2) or (owner=3) {var i;i=0;repeat(4){i+=1;p_heresy[i]=40;}}



/*if (p_type[1]="Dead") and (present_fleets=0){
        fleet=instance_create(x,y+32,obj_en_fleet);
        fleet.owner=9;
        // Create ships here
        fleet.sprite_index=spr_fleet_tyranid;
        fleet.image_speed=0;
        fleet.capital_number=choose(1,2,3);
        fleet.frigate_number=round(random_range(3,5));
        fleet.escort_number=round(random_range(6,10));
        fleet.image_index=floor((fleet.capital_number)+(fleet.frigate_number/2)+(fleet.escort_number/4));
        fleet.image_alpha=0;
        
        obj_controller.x=fleet.x;
        obj_controller.y=fleet.y;
        
        present_fleets+=1;
}*/


/*p_pdf[1]=0;p_guardsmen[1]=0;
p_pdf[2]=0;p_guardsmen[2]=0;
p_tyranids[1]=3;
p_tyranids[2]=3;*/

// if (choose(0,0,0,1)=1) and (p_feature[2]="") then p_feature[floor(random(planets))+1]="Awakened Necron Tomb|";



if (obj_controller.test_map=true){
    /*if (p_owner[1]=3) then p_feature[1]="STC Fragment|";
    if (p_owner[2]=3) then p_feature[2]="STC Fragment|";
    if (p_owner[3]=3) then p_feature[3]="STC Fragment|";
    
    
    // Testing new guardsmen
    p_guardsmen[1]=5000000;
    p_tyranids[1]=4;
    
    p_guardsmen[2]=500000;
    p_tyranids[2]=3;
    
    p_guardsmen[3]=100000;
    p_tyranids[3]=2;
    
    p_orks[1]=0;p_orks[2]=0;p_orks[3]=0;*/
}

// if (obj_controller.test_map=true) and (p_owner[2]=1){

if (p_owner[2]=1){
    

    /*
    p_guardsmen[2]=10000000;
    p_pdf[2]=0;
    obj_controller.faction_status[2]="War";
    */
    
    
    // p_type[1]="Dead";
    // p_feature[2]="";
    
    // p_orks[2]=3;
    // p_feature[2]="Starship!0!|";
    
    /*repeat(4){
        var fleet;fleet=instance_create(x+(floor(random_range(100,200))*choose(1,-1)),y+(floor(random_range(100,200))*choose(1,-1)),obj_en_fleet);
        fleet.owner=10;fleet.sprite_index=spr_fleet_chaos;fleet.orbiting=0;
        fleet.action_x=x;fleet.action_y=y;fleet.alarm[4]=1;
        
        fleet.capital_number=0;
        fleet.frigate_number=1;
        fleet.escort_number=2;
        
        // Create ships here
        fleet.image_speed=0;
        var ii;ii=0;ii+=capital-1;ii+=round((frigate/2));ii+=round((escort/4));
        if (ii<=1) and (capital+frigate+escort>0) then ii=1;
        fleet.image_index=ii;
    }*/
    
}

obj_controller.alarm[9]=2;
if (obj_controller.test_map!=true) and (p_owner[2]!=1){i=0;repeat(4){i+=1;p_guardsmen[i]=0;}}

// var ii;ii=0;repeat(4){ii+=1;p_feature[ii]="STC Fragment|";}

/* */
/*  */
