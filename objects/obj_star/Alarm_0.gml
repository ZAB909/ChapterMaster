

if (obj_controller.craftworld=0) and (space_hulk=0){
    var test,oldx,oldy;
    oldx=x;oldy=y;
    x-=5000;y-=5000;
    test=instance_nearest(oldx+choose(random(200),1*-random(200)),oldy+choose(random(200),1*-random(200)),obj_star);
    x2=test.x;y2=test.y;
    buddy=test;
    x=oldx;y=oldy;
}


repeat(80){
    if ((name="random") or (name="")) and (craftworld=0) and (space_hulk=0) then scr_star_name();
    if (name="") and (craftworld=1) then name=scr_eldar_name(3);
}



if (obj_controller.craftworld=1) and (space_hulk=0){
    star="craftworld";sprite_index=spr_craftworld;image_index=0;image_speed=0;
    planets=1;p_type[1]="Craftworld";heresy=-999;p_owner[1]=6;p_first[1]=6;owner=6;
    p_population[1]=floor(random_range(150000,300000));p_fortified[1]=6;p_eldar[1]=6;
    old_x=x;old_y=y;
    exit;
}
if (space_hulk=1){
    star="space_hulk";sprite_index=spr_star_hulk;image_index=0;image_speed=0;
    planets=1;p_type[1]="Space Hulk";heresy=-999;p_owner[1]=2;
    p_population[1]=0;p_fortified[1]=5;
    
    var loll;loll=choose(7,9,9,9,9,9,10);
    if (loll=7) then p_orks[1]=choose(3,4,5);
    /*if (loll=7) and (planets>=2) then p_orks[2]=choose(3,4,5);
    if (loll=7) and (planets>=3) then p_orks[3]=choose(3,4,5);
    if (loll=7) and (planets>=4) then p_orks[4]=choose(3,4,5);*/
    
    if (loll=9) then p_tyranids[1]=choose(3,4,5);
    /*if (loll=9) and (planets>=2) then p_tyranids[2]=choose(3,4,5);
    if (loll=9) and (planets>=3) then p_tyranids[3]=choose(3,4,5);
    if (loll=9) and (planets>=4) then p_tyranids[4]=choose(3,4,5);*/
    
    if (loll=10) then p_traitors[1]=choose(2,3,4);
    /*if (loll=10) and (planets>=2) then p_chaos[2]=choose(2,3,4);
    if (loll=10) and (planets>=3) then p_chaos[3]=choose(2,3,4);
    if (loll=10) and (planets>=4) then p_chaos[4]=choose(2,3,4);*/
    
    // show_message("space hulking#ORK:"+string(p_orks[1])+" | TYR:"+string(p_tyranids[1])+" | CSM:"+string(p_traitors[1]));
    
    p_first[1]=loll;
    
    old_x=x;old_y=y;p_owner[1]=loll;vision=1;
    exit;
}



var rui;
rui=choose(0,0,0,0,1,1,2,2,3,4,5);// had a 6 at the end of here; probably causing empty stars
if (rui=0){star="orange1";image_index=0;}
if (rui=1){star="orange2";image_index=1;}
if (rui=2){star="red";image_index=2;}
if (rui=3){star="white1";image_index=3;}
if (rui=4){star="white2";image_index=4;}
if (rui=5){star="blue";image_index=5;}
image_speed=0;
image_alpha=1;


if (star="orange1") or (star="orange2") then planets=choose(1,2,3,3,4);
if (star="red") then planets=choose(1,2,3);
if (star="white1") or (star="white2") then planets=choose(1,1,2);
if (star="blue") then planets=1;



rui=-1;




if (star="orange1") or (star="orange2"){rui=0;
    repeat(4){rui+=1;
        if (planets>=rui){
            planet[rui]=1;
            p_type[rui]=choose("Temperate","Temperate",choose("Temperate","Shrine"),"Feudal","Agri","Death","Desert","Ice","Hive");
            if (p_type[rui]="Agri") or (p_type[rui]="Hive"){p_owner[rui]=2;p_first[rui]=2;}
        }
    }
}
if (star="red"){rui=0;
    repeat(4){rui+=1;
        if (planets>=rui){
            planet[rui]=1;
            p_type[rui]=choose(choose("Temperate","Temperate","Temperate","Feudal","Feudal","Shrine"),"Desert","Dead","Hive","Lava");
        }
    }
}
if (star="white1") or (star="white2"){rui=0;
    repeat(4){rui+=1;
        if (planets>=rui){
            planet[rui]=1;
            p_type[rui]=choose(choose("Temperate","Temperate","Temperate","Feudal","Feudal","Shrine"),"Death","Ice","Hive","Dead");
        }
    }
}
if (star="blue"){rui=0;
    repeat(4){rui+=1;
        if (planets>=rui){
            planet[rui]=1;
            p_type[rui]=choose(choose("Temperate","Temperate","Temperate","Feudal","Feudal","Shrine"),"Ice","Ice","Dead","Dead");
        }
    }
}


if (name="Kim Jong"){
    planets=3;
    p_type[1]="Dead";planet[1]=1;
    p_type[2]="Temperate";planet[2]=1;
    p_type[3]="Dead";planet[3]=1;
}
if (name="Muric"){
    planets=4;
    p_type[1]="Hive";planet[1]=1;
    p_type[2]="Temperate";planet[2]=1;
    p_type[3]="Agri";planet[3]=1;
    p_type[4]="Agri";planet[4]=1;
}
if (name="Morrowynd"){planets=3;
    p_type[1]="Feudal";planet[1]=1;array_push(p_feature[1], new new_planet_feature(P_features.Necron_Tomb);
    p_type[2]="Dead";planet[2]=1;
    p_type[3]="Dead";planet[3]=1;
}





var a,b,c,d,e,f,g,h;
a=99;b=99;c=99;d=99;e="";f=0;g="";h=0;

repeat(10){
    e=p_type[1];
    if (e="Lava") then a=1;if (e="Desert") then a=2;if (e="Hive") then a=3;
    if (e="Death") then a=4;if (e="Agri") then a=5;if (e="Temperate") then a=6;if (e="Feudal") then a=choose(5.5,6.5);if (e="Shrine") then a=choose(5.6,6.6);
    if (e="Ice") then a=7;if (e="Dead") then a=1;
    e=p_type[2];
    if (e="Lava") then b=1;if (e="Desert") then b=2;if (e="Hive") then b=3;
    if (e="Death") then b=4;if (e="Agri") then b=5;if (e="Temperate") then b=6;if (e="Feudal") then b=choose(5.5,6.5);if (e="Shrine") then b=choose(5.6,6.6);
    if (e="Ice") then b=7;if (e="Dead") then b=2.5;
    e=p_type[3];
    if (e="Lava") then c=1;if (e="Desert") then c=2;if (e="Hive") then c=3;
    if (e="Death") then c=4;if (e="Agri") then c=5;if (e="Temperate") then c=6;if (e="Feudal") then c=6choose(5.5,6.5);if (e="Shrine") then c=choose(5.6,6.6);
    if (e="Ice") then c=7;if (e="Dead") then c=3.5;
    e=p_type[4];
    if (e="Lava") then d=1;if (e="Desert") then d=2;if (e="Hive") then d=3;
    if (e="Death") then d=4;if (e="Agri") then d=5;if (e="Temperate") then d=6;if (e="Feudal") then d=choose(5.5,6.5);if (e="Shrine") then d=choose(5.6,6.6);
    if (e="Ice") then d=7;if (e="Dead") then d=4.5;

    if (d<c){
        f=c;e=p_type[3];
        c=d;p_type[3]=p_type[4];
        p_type[4]=e;d=f;
    }
    
    if (c<b){
        f=b;e=p_type[2];
        b=c;p_type[2]=p_type[3];
        p_type[3]=e;c=f;
    }
    
    if (b<a){
        f=a;e=p_type[1];
        a=b;p_type[1]=p_type[2];
        p_type[2]=e;b=f;
    }
    
    
    
    
}





if (p_type[1]!=""){p_owner[1]=2;p_first[1]=2;}
if (p_type[2]!=""){p_owner[2]=2;p_first[2]=2;}
if (p_type[3]!=""){p_owner[3]=2;p_first[3]=2;}
if (p_type[4]!=""){p_owner[4]=2;p_first[4]=2;}

if (p_type[1]!="Dead") then p_heresy[1]=floor(random(10))+1;
if (p_type[2]!="Dead") then p_heresy[2]=floor(random(10))+1;
if (p_type[3]!="Dead") then p_heresy[3]=floor(random(10))+1;
if (p_type[4]!="Dead") then p_heresy[4]=floor(random(10))+1;

/* */
/*  */
