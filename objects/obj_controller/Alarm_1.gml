
instance_activate_object(obj_star);
instance_activate_object(obj_restart_vars);
instance_activate_all();

// Should determine here, randomly what sort of enemy planets there are
// One of the following:
// Lots of damn orks
// Lots of damn tyranids
// Some damn orks and a few genestealer cults

var field;
field="tyranids"
/*
field=choose("orks","tyranids","both"); 
if (global.chapter_name="Lamenters") then field="both"; 
if (test_map=true) then field="orks"; 

*/



good_log=1;



var xx,yy,px,py,ed,ok,did,roar,rando;
ok=0;did=0;roar="";ed=0;px=0;py=0;rando=0;



repeat(100){
    if (ok=0){
        xx=floor(random((room_width-128)))+64;
        yy=floor(random((room_width-92)))+64;

        ed=instance_nearest(xx,yy,obj_star);

        if (instance_exists(ed)){
            if (ed.star="orange1") or (ed.star="orange2"){
                if (ed.p_type[1]="Temperate"){did=1;ok=1;if (obj_ini.fleet_type=1){ed.p_owner[1]=1;ed.p_first[1]=1;ed.owner=1;}px=ed.x;py=ed.y;}
                if (ed.p_type[2]="Temperate") and (did=0){did=1;ok=1;if (obj_ini.fleet_type=1){ed.p_owner[2]=1;ed.p_first[2]=1;ed.owner=1;}px=ed.x;py=ed.y;}
                if (ed.p_type[3]="Temperate") and (did=0){did=1;ok=1;if (obj_ini.fleet_type=1){ed.p_owner[3]=1;ed.p_first[3]=1;ed.owner=1;}px=ed.x;py=ed.y;}
                if (ed.p_type[4]="Temperate") and (did=0){did=1;ok=1;if (obj_ini.fleet_type=1){ed.p_owner[4]=1;ed.p_first[4]=1;ed.owner=1;}px=ed.x;py=ed.y;}
            }

            if (ok=0) and (did=0) then instance_deactivate_object(ed);

        }
    
    }

}


instance_activate_object(obj_star);


if (did=1){// Player star has been set
    // Begin player homeworld

    ed.planets=2;ed.vision=1;if (obj_ini.fleet_type=1) then ed.owner=1;
    ed.p_type[3]="";ed.planet[3]=0;
    ed.p_type[4]="";ed.planet[4]=0;
    
    if (obj_ini.fleet_type=1){
        if (obj_ini.recruiting_type!=obj_ini.home_type) and (obj_ini.home_name!=obj_ini.recruiting_name){
            ed.p_type[1]=obj_ini.recruiting_type;if (obj_ini.recruiting_name!="random") then ed.name=obj_ini.recruiting_name;
            ed.p_type[2]=obj_ini.home_type;ed.planet[2]=1;if (obj_ini.home_name!="random") then ed.name=obj_ini.home_name;
            ed.p_feature[1]="Recruiting World|";
            ed.p_feature[2]="Monastery|";ed.p_owner[2]=1;ed.p_first[2]=1;
            if (homeworld_rule!=1) then ed.dispo[2]=-5000;
            
            if (obj_ini.home_type="Shrine") then known[5]=1;
            if (obj_ini.recruiting_type="Shrine") then known[5]=1;
            
            ed.p_lasers[2]=8;ed.p_silo[2]=100;ed.p_defenses[2]=75;
            if (obj_ini.custom=0){ed.p_lasers[2]=32;ed.p_silo[2]=300;ed.p_defenses[2]=225;}
            
            if (ed.p_type[1]="random") then ed.p_type[1]=choose("Feral","Temperate","Desert","Ice");
            if (ed.p_type[2]="random") then ed.p_type[2]=choose("Feral","Temperate","Desert","Ice");
            // if (ed.name="random") then with(ed){scr_star_name();}
            if (global.chapter_name!="Lamenters") then obj_controller.recruiting_worlds+=string(ed.name)+" I|";
            
            ed.p_player[2]=obj_ini.man_size;
        }
        if (obj_ini.recruiting_type=obj_ini.home_type) or (obj_ini.home_name=obj_ini.recruiting_name){
            ed.p_type[1]="Dead";
            ed.p_type[2]=obj_ini.home_type;ed.planet[2]=1;if (obj_ini.home_name!="random") then ed.name=obj_ini.home_name;
            ed.p_feature[2]="Recruiting World|Monastery|";ed.p_owner[2]=1;ed.p_first[2]=1;
            if (homeworld_rule!=1) then ed.dispo[2]=-5000;
            
            if (obj_ini.home_type="Shrine") then known[5]=1;
            if (obj_ini.recruiting_type="Shrine") then known[5]=1;
            
            ed.p_lasers[2]=8;ed.p_silo[2]=100;ed.p_defenses[2]=75;
            if (obj_ini.custom=0){ed.p_lasers[2]=32;ed.p_silo[2]=300;ed.p_defenses[2]=225;}
            
            if (ed.p_type[1]="random") then ed.p_type[1]=choose("Feral","Temperate","Desert","Ice");
            if (ed.p_type[2]="random") then ed.p_type[2]=choose("Feral","Temperate","Desert","Ice");
            // if (ed.name="random") then with(ed){scr_star_name();}
            if (global.chapter_name!="Lamenters") then obj_controller.recruiting_worlds+=string(ed.name)+" II|";
            
            ed.p_player[2]=obj_ini.man_size;
        }
    }
    if (obj_ini.fleet_type!=1){// Crusade and fleet based
        if (obj_ini.recruiting_type!=obj_ini.home_type) and (obj_ini.home_name!=obj_ini.recruiting_name){
            ed.p_type[1]=obj_ini.recruiting_type;if (obj_ini.recruiting_name!="random") then ed.name=obj_ini.recruiting_name;
            ed.p_type[2]=obj_ini.home_type;ed.planet[2]=1;if (obj_ini.home_name!="random") then ed.name=obj_ini.home_name;
            ed.p_feature[1]="Recruiting World|";
            if (ed.p_type[1]="random") then ed.p_type[1]=choose("Feral","Temperate","Desert","Ice");
            if (ed.p_type[2]="random") then ed.p_type[2]=choose("Feral","Temperate","Desert","Ice");
            // if (ed.name="random") then with(ed){scr_star_name();}
            if (global.chapter_name!="Lamenters") then obj_controller.recruiting_worlds+=string(ed.name)+" I|";
            
            // ed.p_player[2]=obj_ini.man_size;
        }
        if (obj_ini.recruiting_type=obj_ini.home_type) or (obj_ini.home_name=obj_ini.recruiting_name){
            ed.p_type[1]="Dead";
            ed.p_type[2]=obj_ini.home_type;ed.planet[2]=1;if (obj_ini.home_name!="random") then ed.name=obj_ini.home_name;
            ed.p_feature[2]="Recruiting";
            if (ed.p_type[1]="random") then ed.p_type[1]=choose("Feral","Temperate","Desert","Ice");
            if (ed.p_type[2]="random") then ed.p_type[2]=choose("Feral","Temperate","Desert","Ice");
            // if (ed.name="random") then with(ed){scr_star_name();}
            if (global.chapter_name!="Lamenters") then obj_controller.recruiting_worlds+=string(ed.name)+" II|";
            
            // ed.p_player[2]=obj_ini.man_size;
        }
    }
    with(ed){
        var f;f=0;
        repeat(4){f+=1;
            if (string_count("Recruiting",p_feature[f])>0) and (string_count("Monastery",p_feature[f])=0){
                if (p_owner[f]=1) then p_owner[f]=2;
            }
            if (string_count("Monastery",p_feature[f])>0){
                if (p_owner[f]!=1) then p_owner[f]=1;
                owner=1;
            }
        }
    }
    if (obj_ini.veh_loc[1,1]="random") or (obj_ini.veh_loc[1,1]="Random"){
        var coh,iy;coh=-1;iy=-1;
        repeat(11){coh+=1;iy=0;
            repeat(60){iy+=1;obj_ini.veh_loc[coh,iy]=ed.name;}
        }
        ed.p_player[2]+=obj_ini.man_size;
    }
    
    
    
    var fleet, f;
    fleet=instance_create(ed.x+24,ed.y-24,obj_p_fleet);
    fleet.owner=1;
    // ed.present_fleets=1;
    fleet.alarm[5]=5;
    
    f=0;
    repeat(40){f+=1;
        if (obj_ini.ship_size[f]=1){fleet.escort_number+=1;fleet.escort[fleet.escort_number]=obj_ini.ship[f];fleet.escort_num[fleet.escort_number]=f;fleet.escort_uid[fleet.escort_number]=obj_ini.ship_uid[fleet.escort_num[fleet.escort_number]];}
        if (obj_ini.ship_size[f]=2){fleet.frigate_number+=1;fleet.frigate[fleet.frigate_number]=obj_ini.ship[f];fleet.frigate_num[fleet.frigate_number]=f;fleet.frigate_uid[fleet.frigate_number]=obj_ini.ship_uid[fleet.frigate_num[fleet.frigate_number]];}
        if (obj_ini.ship_size[f]=3){
            fleet.capital_number+=1;
            fleet.capital[fleet.capital_number]=obj_ini.ship[f];
            fleet.capital_num[fleet.capital_number]=f;
            fleet.capital_uid[fleet.capital_number]=obj_ini.ship_uid[fleet.capital_num[fleet.capital_number]];
        }
    }
    
    var ii;ii=0;ii+=fleet.capital_number;ii+=round((fleet.frigate_number/2));ii+=round((fleet.escort_number/4));
    if (ii<=1) then ii=1;fleet.image_index=ii;
    
    if (obj_ini.load_to_ships>0){
        scr_start_load(fleet,ed,obj_ini.load_to_ships);
        with(obj_p_fleet){instance_create(x,y,obj_fleet_show);}
    }
    
    
    
    
    // End player homeworld
    instance_deactivate_object(ed);
    
    ed=instance_nearest(px,py,obj_star);ed.star="white2";
    ed.planet[1]=1;ed.planet[2]=1;ed.image_index=4;
    ed.p_type[1]="Forge";ed.p_type[2]="Ice";
    ed.p_owner[1]=3;ed.p_owner[2]=3;ed.p_owner[3]=3;ed.p_owner[4]=3;
    ed.p_first[1]=3;ed.p_first[2]=3;ed.p_first[3]=3;ed.p_first[4]=3;
    ed.owner=3;if (ed.planets<2) then ed.planets=2;
    
    with(ed){// with ed
        var a,b,c,d,e,f,g,h;
a=99;b=99;c=99;d=99;e="";f=0;g="";h=0;

repeat(10){

    e=p_type[1];
    if (e="Lava") then a=1;if (e="Desert") then a=2;if (e="Hive") then a=3;
    if (e="Feral") then a=4;if (e="Agri") then a=5;if (e="Temperate") then a=6;
    if (e="Ice") then a=7;if (e="Dead") then a=1;if (e="Forge") then a=1.5;
    e=p_type[2];
    if (e="Lava") then b=1;if (e="Desert") then b=2;if (e="Hive") then b=3;
    if (e="Feral") then b=4;if (e="Agri") then b=5;if (e="Temperate") then b=6;
    if (e="Ice") then b=7;if (e="Dead") then b=2.5;if (e="Forge") then b=1.5;
    e=p_type[3];
    if (e="Lava") then c=1;if (e="Desert") then c=2;if (e="Hive") then c=3;
    if (e="Feral") then c=4;if (e="Agri") then c=5;if (e="Temperate") then c=6;
    if (e="Ice") then c=7;if (e="Dead") then c=3.5;if (e="Forge") then c=1.5;
    e=p_type[4];
    if (e="Lava") then d=1;if (e="Desert") then d=2;if (e="Hive") then d=3;
    if (e="Feral") then d=4;if (e="Agri") then d=5;if (e="Temperate") then d=6;
    if (e="Ice") then d=7;if (e="Dead") then d=4.5;if (e="Forge") then d=1.5;

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
    
    
    
    
}// end repeat

    if (p_type[1]!="Forge") and (p_type[1]!="Ice"){p_owner[1]=2;p_first[1]=2;}  // important later on for having other chapters homeworlds or civil war imperiums
    if (p_type[2]!="Forge") and (p_type[2]!="Ice"){p_owner[2]=2;p_first[2]=2;}
    if (p_type[3]!="Forge") and (p_type[3]!="Ice"){p_owner[3]=2;p_first[3]=2;}
    if (p_type[4]!="Forge") and (p_type[4]!="Ice"){p_owner[4]=2;p_first[4]=2;}

    }// end with ed
    
    
    
    // ed.explored=1;
    
    with(instance_nearest(xx,yy,obj_star)){}instance_deactivate_object(instance_nearest(xx,yy,obj_star));
    with(instance_nearest(xx,yy,obj_star)){}instance_deactivate_object(instance_nearest(xx,yy,obj_star));
    with(instance_nearest(xx,yy,obj_star)){}instance_deactivate_object(instance_nearest(xx,yy,obj_star));
    with(instance_nearest(xx,yy,obj_star)){}instance_deactivate_object(instance_nearest(xx,yy,obj_star));
    with(instance_nearest(xx,yy,obj_star)){}instance_deactivate_object(instance_nearest(xx,yy,obj_star));
    with(instance_nearest(xx,yy,obj_star)){}instance_deactivate_object(instance_nearest(xx,yy,obj_star));
    
    
    
    
    
    if (tau=1){
        ed=instance_furthest(px,py,obj_star);
        
        with(obj_star){if (planets=0) then instance_deactivate_object(id);}
        
        var stop;
        stop=0;
        
        repeat(100){
            if (stop!=5){
                if (ed.planets=1) and (ed.p_type[1]="Dead"){stop=1;with(ed){instance_deactivate_object(instance_id_get( 0 ));}}
                if (ed.planets>=1) or (ed.p_type[1]!="Dead") then stop=0;
                if (stop=0) then stop=5;
            }
        }
        
        ed.planet[1]=1;ed.p_owner[1]=8;ed.p_type[1]="Desert";xx=ed.x;yy=ed.y;ed.tau[1]=choose(3,4);ed.p_influence[1]=70;
        instance_deactivate_object(ed);
        
        rando=1
        if (rando=1){
            ed=instance_nearest(xx,yy,obj_star);
            if (ed.planets>0) and (ed.p_type[1]!="Dead") and (ed.owner=2){ed.p_owner[1]=8;ed.owner=8;ed.p_influence[1]=70;}
            instance_deactivate_object(ed);
        }
        
        rando=1;
        if (rando=1){
            ed=instance_nearest(xx,yy,obj_star);
            if (ed.planets>0) and (ed.p_type[1]!="Dead") and (ed.owner=2){ed.p_owner[1]=8;ed.owner=8;ed.p_influence[1]=70;}
            instance_deactivate_object(ed);
        }
        
        rando=1
        if (rando=1){
            ed=instance_nearest(xx,yy,obj_star);
            if (ed.planets>0) and (ed.p_type[1]!="Dead") and (ed.owner=2){ed.p_owner[1]=8;ed.owner=8;ed.p_influence[1]=70;}
            instance_deactivate_object(ed);
        }
        
        rando=1;
        if (rando=1){
            ed=instance_nearest(xx,yy,obj_star);
            if (ed.planets>0) and (ed.p_type[1]!="Dead") and (ed.owner=2){ed.p_owner[1]=8;ed.owner=8ed.p_influence[1]=70;}
            instance_deactivate_object(ed);
        }
        
        rando=1;
        if (rando=1){
            ed=instance_nearest(xx,yy,obj_star);
            if (ed.planets>0) and (ed.p_type[1]!="Dead") and (ed.owner=2){ed.p_owner[1]=8;ed.owner=8ed.p_influence[1]=70;}
            instance_deactivate_object(ed);
        }
		        
        rando=1;
        if (rando=1){
            ed=instance_nearest(xx,yy,obj_star);
            if (ed.planets>0) and (ed.p_type[1]!="Dead") and (ed.owner=2){ed.p_owner[1]=8;ed.owner=8ed.p_influence[1]=70;}
            instance_deactivate_object(ed);
        }
        
        instance_activate_object(obj_star);
    }
    
    
    // Chaos
    
    xx=floor(random(1152))+64;yy=floor(random(748))+64;
    ed=instance_nearest(xx,yy,obj_star);if (ed.planets>0) and (ed.owner=2){ed.planet[1]=1;ed.p_owner[1]=10;ed.owner=10;instance_deactivate_object(ed);}
	
    xx=floor(random(1152))+64;yy=floor(random(748))+64;
    ed=instance_nearest(xx,yy,obj_star);if (ed.planets>0) and (ed.owner=2){ed.planet[1]=1;ed.p_owner[1]=10;ed.owner=10;instance_deactivate_object(ed);}
	
    xx=floor(random(1152))+64;yy=floor(random(748))+64;
    ed=instance_nearest(xx,yy,obj_star);if (ed.planets>0) and (ed.owner=2){ed.planet[1]=1;ed.p_owner[1]=10;ed.owner=10;instance_deactivate_object(ed);}
	
	xx=floor(random(1152))+64;yy=floor(random(748))+64;
    ed=instance_nearest(xx,yy,obj_star);if (ed.planets>0) and (ed.owner=2){ed.planet[1]=1;ed.p_owner[1]=10;ed.owner=10;instance_deactivate_object(ed);}
    // More sneaky this way; you have to be noted of rising heresy or something, or have a ship in the system
    
    with(obj_star){
        if (name="Badab") or (name="Hellsiris") or (name="Vraks") or (name="Isstvan") or (name="Jhanna") or (name="Nostromo") or (name="Gangrenous Rot"){
            rando=choose(1,1); // make 1's 0's if you want less chaos
            if (rando=1){
                p_owner[1]=10;p_owner[2]=10;p_owner[3]=10;p_owner[4]=10;owner=10;
                p_heresy[1]=floor(random_range(80,100));p_heresy[2]=floor(random_range(80,100));
                p_heresy[3]=floor(random_range(80,100));p_heresy[4]=floor(random_range(80,100));
				// turns dead planets into 
				if (p_type[1]="Dead") then p_type[1]="Hive";if (p_type[2]="Dead") then p_type[2]="Temperate";
                if (p_type[3]="Dead") then p_type[3]="Desert";if (p_type[4]="Dead") then p_type[4]="Ice" or p_type[4]="Dead";
				
                if (p_type[1]!="Dead") then p_traitors[1]=6;if (p_type[2]!="Dead") then p_traitors[2]=6;
                if (p_type[3]!="Dead") then p_traitors[3]=6;if (p_type[4]!="Dead") then p_traitors[4]=6;
				
				

            }
        }
    }
    
    // Ork planets here
    with(obj_star){
        if (planets>0) and (owner=2) and (p_type[1]!="Dead"){
            instance_create(x,y,obj_temp3);
        }
    }
    
    var orkz,ed2,n,i;
    orkz=choose(4,5,6)+5;
    if (field="orks") then orkz+=20;
    if (field="both") then orkz+=3;
    if (obj_ini.fleet_type=3) then orkz+=2;
    if (test_map=true) then orkz=4;
    
    repeat(orkz){
        n=instance_number(obj_temp3);
        i=floor(random(n));
        ed=instance_find(obj_temp3, i);
        ed2=instance_nearest(ed.x,ed.y,obj_star);
        
        ed2.planet[1]=1;ed2.p_owner[1]=7;ed2.p_owner[2]=7;ed2.p_owner[3]=7;ed2.p_owner[4]=7;ed2.owner=7;
        with(ed){instance_destroy();}
    }
    with(obj_temp3){instance_destroy();}
    
    
    with(obj_star){
        if (planets>0) and (owner=2) and (p_type[1]!="Dead"){
            instance_create(x,y,obj_temp3);
        }
    }
    if (field="tyranids"){
        orkz=(choose(3,4,6)+7);
        if (obj_ini.fleet_type=3) then orkz+=2;
        
        repeat(orkz){
            n=instance_number(obj_temp3);
            i=floor(random(n));
            ed=instance_find(obj_temp3, i);
            ed2=instance_nearest(ed.x,ed.y,obj_star);
			
            ed2.planet[1]=1;ed2.p_owner[1]=7;ed2.owner=7;
            ed2.planet[1]=1;ed2.p_owner[1]=9;ed2.owner=9;
            with(ed){instance_destroy();}
        }
    }
    with(obj_temp3){instance_destroy();}
    
    with(obj_star){
        if (planets>0) and (owner<=5) and (p_type[1]!="Dead"){
            instance_create(x,y,obj_temp3);
        }
    }
    if (field="both"){
    if (obj_ini.fleet_type=3) then orkz+=3;
    orkz+=3;
        repeat(orkz){
            n=instance_number(obj_temp3);
            i=floor(random(n));
            ed=instance_find(obj_temp3, i);
            ed2=instance_nearest(ed.x,ed.y,obj_star);
            
            ed2.planet[1]=1;ed2.p_owner[1]=90;ed2.owner=90;
            with(ed){instance_destroy();}
        }
    
    }
    with(obj_temp3){instance_destroy();}
    
    
 
    
    
    
    // Another mechanicus
    xx=floor(random(1152+640))+64;yy=floor(random(748+480))+64;
    ed=instance_nearest(xx,yy,obj_star);if (ed.planets>0) and (ed.owner=2){ed.planet[1]=1;ed.p_type[1]="Forge";ed.p_owner[1]=3;ed.p_first[1]=3;ed.owner=3;instance_deactivate_object(ed);}
    
    xx=floor(random(1152+640))+64;yy=floor(random(748+480))+64;
    ed=instance_nearest(xx,yy,obj_star);if (ed.planets>0) and (ed.owner=2){ed.planet[1]=1;ed.p_type[1]="Forge";ed.p_owner[1]=3;ed.p_first[1]=3;ed.owner=3;instance_deactivate_object(ed);}

    xx=floor(random(1152+640))+64;yy=floor(random(748+480))+64;
    ed=instance_nearest(xx,yy,obj_star);if (ed.planets>0) and (ed.owner=2){ed.planet[1]=1;ed.p_type[1]="Forge";ed.p_owner[1]=3;ed.p_first[1]=3;ed.owner=3;instance_deactivate_object(ed);}

    xx=floor(random(1152+640))+64;yy=floor(random(748+480))+64;
    ed=instance_nearest(xx,yy,obj_star);if (ed.planets>0) and (ed.owner=2){ed.planet[1]=1;ed.p_type[1]="Forge";ed.p_owner[1]=3;ed.p_first[1]=3;ed.owner=3;instance_deactivate_object(ed);}
 
    xx=floor(random(1152+640))+64;yy=floor(random(748+480))+64;
    ed=instance_nearest(xx,yy,obj_star);if (ed.planets>0) and (ed.owner=2){ed.planet[1]=1;ed.p_type[1]="Forge";ed.p_owner[1]=3;ed.p_first[1]=3;ed.owner=3;instance_deactivate_object(ed);}

}



x=px;y=py;

instance_activate_object(obj_star);


if (did=0) then alarm[1]=5;
if (did!=0) then obj_star.alarm[1]=1;






// Eldar craftworld here

var go, xx, yy;
go=0;xx=0;yy=0;

craftworld=1;


repeat(100){
    if (go=0){
        xx=floor(random(1152+600))+104;
        yy=floor(random(748+440))+104;
        if (point_distance(room_width/2,room_height/2,xx,yy)>=50) then go=1;
        me=instance_nearest(xx,yy,obj_star);
        if (go=1) and (point_distance(me.x,me.y,xx,yy)>=150) then go=2;
        if (go=1) then go=0;
        if (xx>=1050+640) or (yy<=300+480) then go=0;
    }
    
    if (go=2){
        var craft;
        craft=instance_create(xx,yy,obj_star);
        craft.craftworld=1;go=999;
        craft.p_feature[1]="WL6|";
        
        var elforce;
        elforce=instance_create(xx-24,yy-24,obj_en_fleet);
        elforce.sprite_index=spr_fleet_eldar;elforce.owner=6;
        elforce.capital_number=choose(2,3);
        elforce.frigate_number=choose(4,5,6);
        elforce.escort_number=floor(random_range(7,11))+1;
        elforce.image_alpha=0;
        elforce.orbiting=craft;
    }
    
    
}




// End craftworld

// instance_activate_object(obj_restart_vars);
// if (global.load=0) then 
scr_restart_variables(2);
// with(obj_restart_vars){instance_destroy();}


if (!instance_exists(obj_saveload)) and (instance_exists(obj_creation)) and (global.load=0){
    
    var i;i=0;
    repeat(10){i+=1;
        if (obj_creation.world[i]!=""){
            with(obj_star){
                var run;run=0;
                repeat(4){run+=1;
                    if (p_type[run]=obj_creation.world_type[i]) then instance_create(x,y,obj_temp3);
                }
            
            }
            
            var him;him=instance_nearest(random(room_width),random(room_height),obj_temp3);
            
            if (instance_exists(him)){
                var him2;him2=instance_nearest(him.x,him.y,obj_star);
                with(obj_temp3){instance_destroy();}
                
                var run;run=0;
                
                repeat(4){run+=1;
                    if (him2.p_type[run]=obj_creation.world_type[i]){
                        him2.name=obj_creation.world[i];
                        if (obj_creation.world_feature[i]!="") then him2.p_feature[run]=obj_creation.world_feature[i];
                        obj_creation.world[i]="";obj_creation.world_type[i]="";obj_creation.world_feature[i]="";
                    }
                    
                }
                
                instance_deactivate_object(him2);
            
            }
        
        
        
        /*world[i]="";
        world_type[i]="";
        world_feature[i]="";*/
        }
    
    }



}


instance_activate_all();
with(obj_creation){instance_destroy();}


/* //135 testing crusade object
instance_create(x,y,obj_crusade);
obj_crusade.placing=1;scr_zoom();*/



// 135 ; testing artifacts with combat
// argument0 : type
// argument1 : tags
// argument2 : identified
// argument3: location
// argument4: sid

// scr_add_artifact("Weapon","",4,obj_ini.home_name,1);

/*scr_add_artifact("good","daemonic",0,obj_ini.ship[1],501);
scr_add_artifact("good","daemonic",0,obj_ini.ship[1],501);
scr_add_artifact("good","daemonic",0,obj_ini.ship[1],501);
scr_add_artifact("good","daemonic",0,obj_ini.ship[1],501);
scr_add_artifact("good","daemonic",0,obj_ini.ship[1],501);
scr_add_artifact("good","daemonic",0,obj_ini.ship[1],501);
scr_add_artifact("good","daemonic",0,obj_ini.ship[1],501);*/


// scr_add_item("Cyclonic Torpedo",5);
// scr_add_item("Exterminatus",5);
    
if (test_map=true){
    // scr_add_item("Exterminatus",5);
    /*scr_add_artifact("good","",0,obj_ini.ship[1],501);
    scr_add_artifact("good","",0,obj_ini.ship[1],501);
    scr_add_artifact("good","",0,obj_ini.ship[1],501);
    scr_add_artifact("good","",0,obj_ini.ship[1],501);
    scr_add_artifact("good","",0,obj_ini.ship[1],501);
    scr_add_artifact("good","",0,obj_ini.ship[1],501);
    scr_add_artifact("good","",0,obj_ini.ship[1],501);*/
}

with(obj_temp7){instance_destroy();}
with(obj_en_fleet){
    if (owner=8) and (instance_nearest(x,y,obj_star).owner=8) then instance_create(x,y,obj_temp7);
}
if (instance_exists(obj_temp7)){var t1;
    t1=instance_nearest(room_width/2,room_height/2,obj_temp7);
    terra_direction=point_direction(obj_temp7.x,obj_temp7.y,room_width/2,room_height/2);
}

/*with(obj_star){
    scr_star_ownership(false);
}*/


// x=0;y=0;

/* */
/*  */
