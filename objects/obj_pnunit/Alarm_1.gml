


if (defenses=1){
    var i;i=0;

    i+=1;wep[i]="Heavy Bolter Emplacement";wep_num[i]=round(obj_ncombat.player_defenses/2);
    range[i]=99;att[i]=160*wep_num[i];apa[i]=0;ammo[i]=-1;splash[i]=1;

    i+=1;wep[i]="Missile Launcher Emplacement";wep_num[i]=round(obj_ncombat.player_defenses/2);
    range[i]=99;att[i]=200*wep_num[i];apa[i]=120*wep_num[i];ammo[i]=-1;splash[i]=1;

    i+=1;wep[i]="Missile Silo";wep_num[i]=min(30,obj_ncombat.player_silos);
    range[i]=99;att[i]=350*wep_num[i];apa[i]=200*wep_num[i];ammo[i]=-1;splash[i]=1;

    var rightest;rightest=instance_nearest(2000,240,obj_pnunit);
    if (rightest.id=self.id) then instance_destroy();
}
if (defenses=1) then exit;


var i,g;i=0;g=0;men=0;veh=0;dreads=0;
repeat(20){i+=1;
    // dudes[i]="";
    dudes_num[i]=0;
    // dudes_vehicle[i]=0;
    att[i]=0;apa[i]=0;wep_num[i]=0;wep_rnum[i]=0;
    // if (wep_owner[i]!="") and (wep_num[i]>1) then wep_owner[i]="assorted";// What if they are using two ranged weapons?  Hmmmmm?
}i=0;

i=0;
repeat(60){i+=1;
    lost[i]="";
    lost_num[i]=0;
}

var dreaded;dreaded=false;

repeat(700){g+=1;
    if (marine_casting[g]>=0) then marine_casting[g]=0;
    if (marine_casting[g]<0) then marine_casting[g]+=1;

    if ((marine_id[g]>0) or (ally[g]=true)) and (marine_hp[g]>0) then marine_dead[g]=0;
    if ((marine_id[g]>0) or (ally[g]=true)) and (marine_hp[g]>0) and (marine_dead[g]!=1){
        if (marine_hp[g]>0) then men+=1;


        if (marine_type[g]=obj_ini.role[100][6]) or (marine_type[g]="Venerable "+obj_ini.role[100][6]) and (marine_hp[g]>0){dreads+=1;dreaded=true;}
        if (marine_mobi[g]="Bike") then scr_special_weapon("Twin Linked Bolters",g,true);


        if (marine_mobi[g]!="Bike") and (marine_mobi[g]!=""){if (string_count("Jump Pack",marine_mobi[g])>0) then scr_special_weapon("hammer_of_wrath",g,false);}


        /*var j,good,open;j=0;good=0;open=0;
        if (string_count("Jump Pack",marine_mobi[g])>0) then repeat(20){j+=1;
            if (wep[j]="") and (open=0){open=j;}
            if (wep[j]="hammer_of_wrath"){good=1;scr_weapon("hammer_of_wrath","hammer_of_wrath",true,g,false,"","");}
            if (good=0) and (open!=0){wep[open]="hammer_of_wrath";good=1;scr_weapon("hammer_of_wrath","hammer_of_wrath",true,g,false,"","");}
        }*/




        if (marine_gear[g]="Servo Arms") then scr_special_weapon("Flamer",g,true);
        if (marine_gear[g]="Master Servo Arms") then scr_special_weapon("Heavy Flamer",g,true);


        if (marine_casting[g]>-1){
            var cast_dice;cast_dice=floor(random(100))+1;

            if (obj_ini.dis[1]="Warp Touched") then cast_dice-=5;
            if (obj_ini.dis[2]="Warp Touched") then cast_dice-=5;
            if (obj_ini.dis[3]="Warp Touched") then cast_dice-=5;
            if (obj_ini.dis[4]="Warp Touched") then cast_dice-=5;

            if (marine_type[g]="Lexicanum") and (cast_dice<=20) then marine_casting[g]=1;
            if (marine_type[g]="Codiciery") and (cast_dice<=25) then marine_casting[g]=1;
            if (marine_type[g]=obj_ini.role[100,17]) and (cast_dice<=25) then marine_casting[g]=1;
            if (marine_type[g]="Chief "+string(obj_ini.role[100,17])) and (cast_dice<=80) then marine_casting[g]=1;
            if (marine_type[g]="Chapter Master") and (obj_ncombat.chapter_master_psyker=1){
                if (cast_dice<=66) then marine_casting[g]=1;
                if (obj_ncombat.big_boom>0) and (obj_ncombat.kamehameha=true) then marine_casting[g]=1;
            }
        }

        var j,good,open;j=0;good=0;open=0;// Counts the number and types of marines within this object
        repeat(20){j+=1;
            if (dudes[j]="") and (open=0){
                open=j;// Determine if vehicle here

                if (dudes[j]="Venerable "+string(obj_ini.role[100][6])) then dudes_vehicle[j]=1;
                if (dudes[j]=obj_ini.role[100][6]) then dudes_vehicle[j]=1;
            }
            if (marine_type[g]=dudes[j]){good=1;dudes_num[j]+=1;}
            if (good=0) and (open!=0){dudes[open]=marine_type[g];dudes_num[open]=1;}
        }

        if (marine_wep1[g]!="") and (marine_casting[g]!=1){// Do not add weapons to the roster while casting
            if (marine_type[g]="Chapter Master") or (obj_ncombat.player_max<=6) then scr_weapon(string(marine_wep1[g]),string(marine_wep2[g]),true,g,dreaded,obj_ini.name[marine_co[g],marine_id[g]],"");
            if ((marine_type[g]!="Chapter Master")) and (obj_ncombat.player_max>6) then scr_weapon(string(marine_wep1[g]),string(marine_wep2[g]),true,g,dreaded,"","");

            if (marine_wep1[g]="Close Combat Weapon") then scr_special_weapon("CCW Heavy Flamer",g,dreaded);
            if (string_count("UBL",marine_wep1[g])>0) then scr_special_weapon("Underslung Bolter",g,false);
            if (string_count("UFL",marine_wep1[g])>0) then scr_special_weapon("Underslung Flamer",g,false);
        }
        if (marine_wep2[g]!="") and (marine_casting[g]!=1){
            if (marine_type[g]="Chapter Master") or (obj_ncombat.player_max<=6) then scr_weapon(string(marine_wep2[g]),string(marine_wep1[g]),true,g,dreaded,obj_ini.name[marine_co[g],marine_id[g]],"");
            if ((marine_type[g]!="Chapter Master")) and (obj_ncombat.player_max>6) then scr_weapon(string(marine_wep2[g]),string(marine_wep1[g]),true,g,dreaded,"","");

            if (marine_wep2[g]="Close Combat Weapon") then scr_special_weapon("CCW Heavy Flamer",g,dreaded);
            if (string_count("UBL",marine_wep2[g])>0) then scr_special_weapon("Underslung Bolter",g,false);
            if (string_count("UFL",marine_wep2[g])>0) then scr_special_weapon("Underslung Flamer",g,false);
        }
    }

    if (veh_id[g]>0) and (veh_hp[g]>0) and (veh_dead[g]!=1){
        if (veh_id[g]>0) and (veh_hp[g]>0) then veh_dead[g]=0;
        if (veh_hp[g]>0) then veh+=1;

        var j,good,open;j=0;good=0;open=0;// Counts the number and types of marines within this object
        if (veh_dead[g]!=1) then repeat(20){j+=1;
            if (dudes[j]="") and (open=0){open=j;}
            if (veh_type[g]=dudes[j]){good=1;dudes_num[j]+=1;dudes_vehicle[j]=1;}
            if (good=0) and (open!=0){dudes[open]=veh_type[g];dudes_num[open]=1;dudes_vehicle[open]=1;}
        }

        var j,good,open;j=0;good=0;open=0;
        if (veh_dead[g]!=1) then repeat(20){j+=1;
            if (veh_wep1[g]!=""){
                if (wep[j]="") and (open=0){open=j;}
                if (veh_wep1[g]=wep[j]){good=1;scr_weapon(string(veh_wep1[g]),string(veh_wep2[g]),false,g,dreaded,"","");}
                if (good=0) and (open!=0){wep[open]=veh_wep1[g];good=1;scr_weapon(string(veh_wep1[g]),string(veh_wep2[g]),false,g,dreaded,"","");}
            }
        }
        j=0;good=0;open=0;
        if (veh_dead[g]!=1) then repeat(20){j+=1;
            if (veh_wep2[g]!=""){
                if (wep[j]="") and (open=0){open=j;}
                if (veh_wep2[g]=wep[j]){good=1;scr_weapon(string(veh_wep2[g]),string(veh_wep1[g]),false,g,dreaded,"","");}
                if (good=0) and (open!=0){wep[open]=veh_wep2[g];good=1;scr_weapon(string(veh_wep2[g]),string(veh_wep1[g]),false,g,dreaded,"","");}
            }
        }
        j=0;good=0;open=0;
        if (veh_dead[g]!=1) then repeat(20){j+=1;
            if (veh_wep3[g]!=""){
                if (wep[j]="") and (open=0){open=j;}
                if (veh_wep3[g]=wep[j]){good=1;scr_weapon(string(veh_wep3[g]),"",false,g,dreaded,"","");}
                if (good=0) and (open!=0){wep[open]=veh_wep3[g];good=1;scr_weapon(string(veh_wep3[g]),"",false,g,dreaded,"","");}
            }
        }
    }
}


// Right here should be retreat- if important units are exposed they should try to hop left




if (dudes_num[1]=0) and (obj_ncombat.started=0){
    instance_destroy();
    exit;
}

































/*


var i,g;i=0;g=0;men=0;veh=0;dreads=0;
repeat(20){i+=1;
    // dudes[i]="";
    dudes_num[i]=0;
    // dudes_vehicle[i]=0;
    att[i]=0;apa[i]=0;wep_num[i]=0;wep_rnum[i]=0;

    // if (wep_owner[i]!="") and (wep_num[i]>1) then wep_owner[i]="assorted";// What if they are using two ranged weapons?  Hmmmmm?
}i=0;

i=0;
repeat(60){i+=1;
    lost[i]="";
    lost_num[i]=0;
}

var dreaded;dreaded=false;

repeat(700){g+=1;
    if (marine_id[g]>0) and (marine_hp[g]>0) then marine_dead[g]=0;
    if (marine_id[g]>0) and (marine_hp[g]>0) and (marine_dead[g]!=1){
        men+=1;

        if (marine_type[g]="Dreadnought") or (marine_type[g]="Venerable Dreadnought"){dreads+=1;dreaded=true;}
        if (marine_mobi[g]="Bike") then scr_special_weapon("Twin Linked Bolters",g,true);

        var j,good,open;j=0;good=0;open=0;// Counts the number and types of marines within this object
        repeat(20){j+=1;
            if (dudes[j]="") and (open=0){
                open=j;
                // Determine if vehicle here
            }
            if (marine_type[g]=dudes[j]){good=1;dudes_num[j]+=1;}
            if (good=0) and (open!=0){dudes[open]=marine_type[g];dudes_num[open]=1;}
        }
        j=0;good=0;open=0;
        repeat(20){j+=1;
            if (marine_wep1[g]!=""){
                if (wep[j]="") and (open=0){open=j;}
                var onk;onk=0;
                if (marine_wep1[g]=wep[j]) and (onk=0){onk=1;
                    good=1;

                    if (marine_type[g]="Chapter Master") or (obj_ncombat.player_forces<=6) then scr_weapon(string(marine_wep1[g]),string(marine_wep2[g]),true,g,dreaded,obj_ini.name[marine_co[g],marine_id[g]]);
                    if ((marine_type[g]!="Chapter Master")) and (obj_ncombat.player_forces>6) then scr_weapon(string(marine_wep1[g]),string(marine_wep2[g]),true,g,dreaded,"");

                    if (marine_wep1[g]="Close Combat Weapon") then scr_special_weapon("Heavy Flamer",g,dreaded);
                    if (string_count("UBL",marine_wep1[g])>0) then scr_special_weapon("Underslung Bolter",g,false);
                    if (string_count("UFL",marine_wep1[g])>0) then scr_special_weapon("Underslung Flamer",g,false);
                }
                if (good=0) and (open!=0) and (onk=0){onk=1;
                    wep[open]=marine_wep1[g];
                    // scr_weapon(string(marine_wep1[g]),string(marine_wep2[g]),true,g,dreaded);
                    good=1;

                    if (marine_type[g]="Chapter Master") or (obj_ncombat.player_forces<=6) then scr_weapon(string(marine_wep1[g]),string(marine_wep2[g]),true,g,dreaded,obj_ini.name[marine_co[g],marine_id[g]]);
                    if ((marine_type[g]!="Chapter Master")) and (obj_ncombat.player_forces>6) then scr_weapon(string(marine_wep1[g]),string(marine_wep2[g]),true,g,dreaded,"");

                    if (marine_wep1[g]="Close Combat Weapon") then scr_special_weapon("Heavy Flamer",g,dreaded);
                    if (string_count("UBL",marine_wep1[g])>0) then scr_special_weapon("Underslung Bolter",g,false);
                    if (string_count("UFL",marine_wep1[g])>0) then scr_special_weapon("Underslung Flamer",g,false);
                }
            }
        }
        j=0;good=0;open=0;
        repeat(20){j+=1;
            if (marine_wep2[g]!=""){
                if (wep[j]="") and (open=0){open=j;}
                var onk;onk=0;
                if (marine_wep2[g]=wep[j]) and (onk=0){onk=1;
                    good=1;// scr_weapon(string(marine_wep2[g]),string(marine_wep1[g]),true,g,dreaded);

                    if (marine_type[g]="Chapter Master") or (obj_ncombat.player_forces<=6) then scr_weapon(string(marine_wep2[g]),string(marine_wep1[g]),true,g,dreaded,obj_ini.name[marine_co[g],marine_id[g]]);
                    if ((marine_type[g]!="Chapter Master")) and (obj_ncombat.player_forces>6) then scr_weapon(string(marine_wep2[g]),string(marine_wep1[g]),true,g,dreaded,"");


                    if (marine_wep2[g]="Close Combat Weapon") then scr_special_weapon("Heavy Flamer",g,dreaded);
                    if (string_count("UBL",marine_wep2[g])>0) then scr_special_weapon("Underslung Bolter",g,false);
                    if (string_count("UFL",marine_wep2[g])>0) then scr_special_weapon("Underslung Flamer",g,false);
                }
                if (good=0) and (open!=0) and (onk=0){onk=1;
                    wep[open]=marine_wep2[g];// scr_weapon(string(marine_wep2[g]),string(marine_wep1[g]),true,g,dreaded);
                    good=1;

                    if (marine_type[g]="Chapter Master") or (obj_ncombat.player_forces<=6) then scr_weapon(string(marine_wep2[g]),string(marine_wep1[g]),true,g,dreaded,obj_ini.name[marine_co[g],marine_id[g]]);
                    if ((marine_type[g]!="Chapter Master")) and (obj_ncombat.player_forces>6) then scr_weapon(string(marine_wep2[g]),string(marine_wep1[g]),true,g,dreaded,"");


                    if (marine_wep2[g]="Close Combat Weapon") then scr_special_weapon("Heavy Flamer",g,dreaded);
                    if (string_count("UBL",marine_wep2[g])>0) then scr_special_weapon("Underslung Bolter",g,false);
                    if (string_count("UFL",marine_wep2[g])>0) then scr_special_weapon("Underslung Flamer",g,false);
                }
            }
        }
    }




    if (veh_id[g]>0) and (veh_hp[g]>0) and (veh_dead[g]!=1){
        if (veh_id[g]>0) and (veh_hp[g]>0) then veh_dead[g]=0;
        veh+=1;

        var j,good,open;j=0;good=0;open=0;// Counts the number and types of marines within this object
        if (veh_dead[g]!=1) then repeat(20){j+=1;
            if (dudes[j]="") and (open=0){open=j;}
            if (veh_type[g]=dudes[j]){good=1;dudes_num[j]+=1;dudes_vehicle[j]=1;}
            if (good=0) and (open!=0){dudes[open]=veh_type[g];dudes_num[open]=1;dudes_vehicle[open]=1;}
        }

        var j,good,open;j=0;good=0;open=0;
        if (veh_dead[g]!=1) then repeat(20){j+=1;
            if (veh_wep3[g]!="") then scr_special_weapon(string(veh_wep3[g]),g,true);
            if (veh_wep1[g]!=""){
                if (wep[j]="") and (open=0){open=j;}
                if (veh_wep1[g]=wep[j]){good=1;scr_weapon(string(veh_wep1[g]),string(veh_wep2[g]),false,g,dreaded,"");}
                if (good=0) and (open!=0){wep[open]=veh_wep1[g];good=1;scr_weapon(string(veh_wep1[g]),string(veh_wep2[g]),false,g,dreaded,"");}
            }
        }
        j=0;good=0;open=0;
        if (veh_dead[g]!=1) then repeat(20){j+=1;
            if (veh_wep2[g]!=""){
                if (wep[j]="") and (open=0){open=j;}
                if (veh_wep2[g]=wep[j]){good=1;scr_weapon(string(veh_wep2[g]),string(veh_wep1[g]),false,g,dreaded,"");}
                if (good=0) and (open!=0){wep[open]=veh_wep2[g];good=1;scr_weapon(string(veh_wep2[g]),string(veh_wep1[g]),false,g,dreaded,"");}
            }
        }
        j=0;good=0;open=0;
        if (veh_dead[g]!=1) then repeat(20){j+=1;
            if (veh_wep3[g]!=""){
                if (wep[j]="") and (open=0){open=j;}
                if (veh_wep3[g]=wep[j]){good=1;scr_weapon(string(veh_wep3[g]),"",false,g,dreaded,"");}
                if (good=0) and (open!=0){wep[open]=veh_wep3[g];good=1;scr_weapon(string(veh_wep3[g]),"",false,g,dreaded,"");}
            }
        }
    }
}


// Right here should be retreat- if important units are exposed they should try to hop left




if (dudes_num[1]=0) and (obj_ncombat.started=0){
    instance_destroy();
    exit;
}



*/


if (men+veh=1) and (obj_ncombat.player_forces=1){
    if (men=1) and (veh=0){
        var i,h;i=0;h=0;
        repeat(500){if (h=0){i+=1;if (marine_hp[i]>0) and (marine_dead[i]=0){
            h=marine_hp[i];obj_ncombat.display_p1=h;
            obj_ncombat.display_p1n=string(marine_type[i])+" "+string(obj_ini.name[marine_co[i],marine_id[i]]);}
        }}
    }
}

/* */
/*  */
