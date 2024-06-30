
// show_message("Post-combat cleanup at obj_p_fleet.alarm[1]");


/*with(obj_ini){
    scr_dead_marines(2);
}

with(obj_ini){scr_ini_ship_cleanup();}*/


with(obj_fleet){
    repeat(2){scr_dead_marines(2);}
}



with(obj_ini){scr_ini_ship_cleanup();}















var i,t,yep;

i=0;repeat(8){i+=1;t=0;yep=0;
    if (capital[i]!="") and (capital_uid[i]>0){
        repeat(40){t+=1;
            if (obj_ini.ship_uid[t]=capital_uid[i]){yep=t;capital_num[i]=t;}// That ship is to stay
        }
        if (yep=0){capital[i]="";capital_num[i]=0;capital_sel[i]=0;capital_uid[i]=0;capital_number-=1;}// That ship no longer exists
    }
}

i=0;repeat(30){i+=1;t=0;yep=0;
    if (frigate[i]!="") and (frigate_uid[i]>0){
        repeat(40){t+=1;
            if (obj_ini.ship_uid[t]=frigate_uid[i]){yep=t;frigate_num[i]=t;}// That ship is to stay
        }
        if (yep=0){frigate[i]="";frigate_num[i]=0;frigate_sel[i]=0;frigate_uid[i]=0;frigate_number-=1;}// That ship no longer exists
    }
}

i=0;repeat(30){i+=1;t=0;yep=0;
    if (escort[i]!="") and (escort_uid[i]>0){
        repeat(40){t+=1;
            if (obj_ini.ship_uid[t]=escort_uid[i]){yep=t;escort_num[i]=t;}// That ship is to stay
        }
        if (yep=0){escort[i]="";escort_num[i]=0;escort_sel[i]=0;escort_uid[i]=0;escort_number-=1;}// That ship no longer exists
    }
}




if (capital_number<0) then capital_number=0;
if (frigate_number<0) then frigate_number=0;
if (escort_number<0) then escort_number=0;

    
// }



repeat(5){  

/*repeat(5){
    i=0;repeat(8){i+=1;if (capital[i]!="") and (obj_ini.ship[capital_num[i]]=""){capital[i]="";capital_num[i]=0;capital_sel[i]=0;}}
    i=0;repeat(30){i+=1;if (frigate[i]!="") and (obj_ini.ship[frigate_num[i]]=""){frigate[i]="";frigate_num[i]=0;frigate_sel[i]=0;}}
    i=0;repeat(30){i+=1;if (escort[i]!="") and (obj_ini.ship[escort_num[i]]=""){escort[i]="";escort_num[i]=0;escort_sel[i]=0;}}
    
    */
    
    
    
    
    
    
    
    
    
    
    i=0;repeat(8){i+=1;
        if (capital[i]="") and (capital[i+1]!=""){
            capital[i]=capital[i+1];capital_num[i]=capital_num[i+1];capital_sel[i]=capital_sel[i+1];capital_uid[i]=capital_uid[i+1];
            capital[i+1]="";capital_num[i+1]=0;capital_sel[i+1]=0;capital_uid[i+1]=0;
        }
    }
    i=0;repeat(30){i+=1;
        if (frigate[i]="") and (frigate[i+1]!=""){
            frigate[i]=frigate[i+1];frigate_num[i]=frigate_num[i+1];frigate_sel[i]=frigate_sel[i+1];frigate_uid[i]=frigate_uid[i+1];
            frigate[i+1]="";frigate_num[i+1]=0;frigate_sel[i+1]=0;frigate_uid[i+1]=0;
        }
        if (escort[i]="") and (escort[i+1]!=""){
            escort[i]=escort[i+1];escort_num[i]=escort_num[i+1];escort_sel[i]=escort_sel[i+1];escort_uid[i]=escort_uid[i+1];
            escort[i+1]="";escort_num[i+1]=0;escort_sel[i+1]=0;escort_uid[i+1]=0;
        }
    }

}



if (capital_uid[1]=0) and (frigate_uid[1]=0) and (escort_uid[1]=0) then instance_destroy();

// if ((capital_number+frigate_number+escort_number)<=0) then instance_destroy();


/* */
/*  */
