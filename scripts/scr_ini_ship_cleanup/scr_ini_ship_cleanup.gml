function scr_ini_ship_cleanup() {

	var i,j,meh;
	i=0;j=0;meh=0;
	var co,ide;
	co=0;ide=0;


	/*
	    This is one of the scripts that has given me a lot of trouble
	    over the ages.  Formerly, when ships were destroyed, their
	    array would be crushed.  This meant that marine LID (ship ID)
	    variables had to be changed to take this into account and
	    assign them to the recently changed ship IP.
    
	    As of recent I have simply removed the 'clean and smash' ship
	    script, so that their ID's never change.  Instead of condensing
	    empty slots they are simply left empty.  Ideally this should, 
	    and so far has, prevent marines from teleporting from ship to
	    ship.
    
	    This scripts new purpose is to simply remove all variables
	    formerly assigned to a dead ship within the array.  This (should)
	    prevent the engine from mistaking a dead ship for still being
	    active and alive.
	*/




	// If the ship is dead then make it fucking dead man
	repeat(100){i+=1;
	    if (ship[i]!="") and (ship_hp[i]<=0){
	        ship[i]="";ship_owner[i]=0;ship_class[i]="";ship_size[i]=0;
	        ship_leadership[i]=0;ship_hp[i]=0;ship_maxhp[i]=0;ship_location[i]="";ship_shields[i]=0;
	        ship_conditions[i]="";ship_speed[i]=0;ship_turning[i]=0;
	        ship_front_armour[i]=0;ship_other_armour[i]=0;ship_weapons[i]=0;ship_shields[i]=0;
	        ship_wep[i,0]="";ship_wep_facing[i,0]="";ship_wep_condition[i,0]="";
	        ship_wep[i,1]="";ship_wep_facing[i,1]="";ship_wep_condition[i,1]="";
	        ship_wep[i,2]="";ship_wep_facing[i,2]="";ship_wep_condition[i,2]="";
	        ship_wep[i,3]="";ship_wep_facing[i,3]="";ship_wep_condition[i,3]="";
	        ship_wep[i,4]="";ship_wep_facing[i,4]="";ship_wep_condition[i,4]="";
	        ship_wep[i,5]="";ship_wep_facing[i,5]="";ship_wep_condition[i,5]="";
	        ship_capacity[i]=0;ship_carrying[i]=0;ship_contents[i]="";ship_turrets[i]=0;
	        capital[i]="";capital_num[i]=0;
	    }
	}

}
