

// Cycle through boarders, remove the really dead ones


/*var i, cmp, shi;
i=0;cmp=0;shi=999;


var clean;i=-1;
repeat(30){i+=1;clean[i]=0;}
*/


// obj_controller.marines=0;
// obj_controller.command=0;


var co,i,o;
co=0;i=0;o=0;


o=0;repeat(20){o+=1;
    co=origin.board_co[o];i=origin.board_id[o];
    
    if (obj_ini.hp[co][i]<=-15) and (obj_ini.race[co][i]=1) and (obj_ini.role[co][i]!=""){var seed_max;seed_max=0;
        if (apothecary<=0){
            if (is_specialist(obj_ini.role[co][i])=true) then obj_fleet.fallen_command+=1;
            if (is_specialist(obj_ini.role[co][i])=false) then obj_fleet.fallen+=1;
            
            if (apothecary_had>0){
                if (obj_ini.race[co][i]=1){
                    var age;age=obj_ini.age[co][i];
                    if (age<=((obj_controller.millenium*1000)+obj_controller.year)-10) and (obj_ini.zygote=0) then seed_max+=1;
                    if (age<=((obj_controller.millenium*1000)+obj_controller.year)-5) then seed_max+=1;
                }
            }
            
            // obj_fleet.marines_lost+=1;
            if (obj_ini.role[co][i]="Chapter Master"){obj_controller.alarm[7]=1;if (global.defeat<=1) then global.defeat=1;}
            if (obj_ini.wep1[co][i]="Company Standard") then scr_loyalty("Lost Standard","+");
            if (obj_ini.wep2[co][i]="Company Standard") then scr_loyalty("Lost Standard","+");
            
            obj_ini.race[co][i]=0;obj_ini.loc[co][i]="";obj_ini.name[co][i]="";obj_ini.role[co][i]="";obj_ini.wep1[co][i]="";obj_ini.lid[co][i]=0;
            obj_ini.wep2[co][i]="";obj_ini.armour[co][i]="";obj_ini.gear[co][i]="";obj_ini.hp[co][i]=100;obj_ini.chaos[co][i]=0;obj_ini.experience[co][i]=0;
            obj_ini.mobi[co][i]="";obj_ini.age[co][i]=0;obj_ini.spe[co][i]="";obj_ini.god[co][i]=0;obj_ini.bio[co][i]=0;
            
            if (obj_fleet.capital+obj_fleet.frigate+obj_fleet.escort>0) then obj_controller.gene_seed+=seed_max;
        }
        if (apothecary>0){obj_ini.hp[co][i]=floor(random_range(1,10))+1;apothecary-=0.5;}
    }
}


/* */
/*  */
