function scr_load_all(argument0) {



	var i, sell;
	i=0;sell="";

	if (argument0=true){// Load
	    alll=1;man_size=0;
	    repeat(300){i+=1;
	        if (man[i]="man") and (ma_loc[i]=selecting_location) and (ma_god[i]<10){man_sel[i]=1;
	            man_size+=scr_unit_size(ma_armour[i],ma_role[i],true);
            
	        }
	        if (i<=200){
	            if (man[i]="vehicle") and (ma_loc[i]=selecting_location){man_sel[i]=1;
	                man_size+=scr_unit_size("",ma_role[i],true);
	            }
	        }
	    }
	}

	if (argument0=false){// Unload
	    alll=0;man_size=0;
	    repeat(300){i+=1;
	        man_sel[i]=0;
	            /*if (man[i]="man") then man_size-=1;
	            if (man[i]="man") and (ma_armour[i]="Terminator Armour") then man_size-=1;
	            if (man[i]="man") and (ma_armour[i]="Tartaros") then man_size-=1;
	            if (man[i]="man") and (ma_armour[i]="Dreadnought") then man_size-=7;
	            // if (man[i]="man") and (ma_mobi[i]="Jump Pack") then man_size-=1;
	            if (man[i]="man") and (ma_role[i]="Chapter Master") then man_size-=1;
	            if (man[i]="man") and (ma_role[i]="Harlequin Troupe") then man_size-=4;*/
	        // }
	        // if (i<=150){
	            // if (man[i]="vehicle") and (man_sel[i]=1){
	                // man_sel[i]=0;
	                /*if (ma_role[i]="Rhino") then man_size-=10;
	                if (ma_role[i]="Predator") then man_size-=10;
	                if (ma_role[i]="Land Raider") then man_size-=20;
	                if (ma_role[i]="Bike") then man_size-=2;
	                if (ma_role[i]="Land Speeder") then man_size-=6;
	                if (ma_role[i]="Whirlwind") then man_size-=10;*/
	            // }
	        // }
	    }
	}


}
