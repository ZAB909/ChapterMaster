


// Chaos influence / corruption
var times;times=max(1,round(turn/150));
if (known[10]=2) and (faction_defeated[10]=0) then times+=1;


var xx3, yy3, plani, stahr;stahr=0;
xx3=floor(random(room_width))+1;
yy3=floor(random(room_height))+1;
stahr=instance_nearest(xx3,yy3,obj_star);
plani=floor(random(stahr.planets))+1;


if (faction_gender[10]=1) and (faction_defeated[10]=0) and (turn>=chaos_turn) then repeat(times){
    if (stahr.p_type[plani]!="Dead") and (stahr.planets>0) and (turn>=20){
        var cathedral;cathedral=0;
        if (string_count("Cathedral",stahr.p_feature[plani])>0) then cathedral=choose(0,1,1);
    
        if (cathedral=0){
            if (stahr.p_heresy[plani]>=0) and (stahr.p_heresy[plani]<10){
                stahr.p_heresy[plani]+=choose(0,0,0,0,0,0,0,0,5);
            }
            if (stahr.p_heresy[plani]>=10) and (stahr.p_heresy[plani]<20){
                stahr.p_heresy[plani]+=choose(-2,-2,-2,5,10,15);
            }
            if (stahr.p_heresy[plani]>=20) and (stahr.p_heresy[plani]<40){
                stahr.p_heresy[plani]+=choose(-2,-1,0,0,0,0,0,0,5,10);
            }
            if (stahr.p_heresy[plani]>=40) and (stahr.p_heresy[plani]<60){
                stahr.p_heresy[plani]+=choose(-2,-1,0,0,0,0,0,0,5,10,15);
            }
            if (stahr.p_heresy[plani]>=60) and (stahr.p_heresy[plani]<100){
                stahr.p_heresy[plani]+=choose(-1,0,0,0,0,5,10,15);
            }
        }
        
        if (stahr.p_heresy[plani]<0) then stahr.p_heresy[plani]=0;
    }
}

instance_activate_object(obj_star);



// Build new Imperial Ships
with(obj_temp6){instance_destroy();}with(obj_temp5){instance_destroy();}with(obj_temp4){instance_destroy();}
imp_ships=0;
with(obj_en_fleet){
    if (owner=2){
        obj_controller.imp_ships+=capital_number;
        obj_controller.imp_ships+=frigate_number/2;
        obj_controller.imp_ships+=escort_number/4;
    }
}
with(obj_star){
    if (owner=2) then instance_create(x,y,obj_temp6);
    if (owner=3) then instance_create(x,y,obj_temp5);
    if (space_hulk=1) or (craftworld=1){x-=20000;y-=20000;}
}
var sha;sha=instance_number(obj_temp6)*1.3;// former
sha=instance_number(obj_temp6)*0.65;// new

with(obj_temp6){instance_destroy();}

if (instance_number(obj_temp5)>0) and (imp_ships<sha){
    var rando,rando2;rando=floor(random(100))+1;rando2=choose(1,2,2,3,3,3);
    var forge;forge=instance_nearest(random(room_width),random(room_height),obj_temp5);
    
    if (rando<=(12)*instance_number(obj_temp5)){
        var flit;flit=instance_create(forge.x,forge.y,obj_en_fleet);
        flit.owner=2;flit.sprite_index=spr_fleet_imperial;
        if (rando2=1) then flit.capital_number=1;
        if (rando2=2) then flit.frigate_number=1;
        if (rando2=3) then flit.escort_number=1;
        flit.trade_goods="merge";
    with(obj_temp5){instance_destroy();}
    with(obj_star){
        if (x>10) and (y>10) and ((owner=2) or (owner=3)){
            var mapre;mapre=0;
            mapre+=present_fleet[1];
            mapre+=present_fleet[2];
            mapre+=present_fleet[3];
            mapre+=present_fleet[4];
            mapre+=present_fleet[5];
            mapre+=present_fleet[6];
            mapre+=present_fleet[7];
            mapre+=present_fleet[8];
            mapre+=present_fleet[9];
            mapre+=present_fleet[10];
            mapre+=present_fleet[13];
            
            if (planets=4) and (mapre=0) then instance_create(x,y,obj_temp6);
            if (planets=3) and (mapre=0) then instance_create(x,y,obj_temp5);
            if ((planets=1) or (planets=2)) and (mapre=0) and (p_type[1]!="Dead") then instance_create(x,y,obj_temp4);
        }
    }
    var targeted;targeted=0;
    
    if (instance_number(obj_temp6)>0) and (targeted=0) then targeted=instance_nearest(random(room_width),random(room_height),obj_temp6);
    if (instance_number(obj_temp5)>0) and (targeted=0) then targeted=instance_nearest(random(room_width),random(room_height),obj_temp5);
    if (instance_number(obj_temp4)>0) and (targeted=0) then targeted=instance_nearest(random(room_width),random(room_height),obj_temp4);
    if (targeted!=0) and (instance_exists(targeted)){
    
    flit.action_x=targeted.x;flit.action_y=targeted.y;flit.alarm[4]=1;}
    
    with(obj_temp6){instance_destroy();}with(obj_temp5){instance_destroy();}with(obj_temp4){instance_destroy();}
    }
}



instance_activate_object(obj_star);
with(obj_star){
    if (x<-10000){x+=20000;y+=20000;}
    if (x<-10000){x+=20000;y+=20000;}
}



var tra;tra=0;

// Training here
if (training_apothecary=1) then apothecary_points+=0.8;
if (training_apothecary=2) then apothecary_points+=0.9;
if (training_apothecary=3) then apothecary_points+=1;
if (training_apothecary=4) then apothecary_points+=1.5;
if (training_apothecary=5) then apothecary_points+=2;
if (training_apothecary=6) then apothecary_points+=4;


if (training_apothecary>0) then tra=scr_role_count(string(obj_ini.role[100,15])+" Aspirant","");
if (apothecary_points>=4) and (apothecary_aspirant!=0) and (tra=0){apothecary_points=0;apothecary_aspirant=0;}
if (apothecary_points>=48){
    if (tra>0){
        var yoo, tid;tid=0;
        yoo=scr_random_marine(string(obj_ini.role[100,15])+" Aspirant",0);tid=yoo;
        // show_message(tid);
        // show_message(obj_ini.role[0,tid]);
        repeat(10){
            if (obj_ini.role[0,tid]!=(string(obj_ini.role[100,15])+" Aspirant")){
                yoo=scr_random_marine((obj_ini.role[100,15]+" Aspirant"),0);
                tid=yoo;// tco=(yoo-tid)*100;
            }
        }
        if (obj_ini.role[0,tid]=(obj_ini.role[100,15]+" Aspirant")){
            apothecary_points-=48;apothecary_aspirant=0;
            obj_ini.role[0,tid]=obj_ini.role[100,15];obj_ini.experience[0,tid]+=10;
            var eq1,eq2,eq3,t,r;eq1=1;eq2=1;eq3=1;t=0;r=0;
            if (obj_ini.wep1[0,tid]!=obj_ini.wep1[100,15]){
                repeat(50){t+=1;if (obj_ini.equipment[t]=obj_ini.wep1[100,15]) and (obj_ini.equipment_number[t]>=1) and (r=0) then r=t;}
                if (r!=0){if (obj_ini.wep1[0,tid]!="") then scr_add_item(obj_ini.wep1[0,tid],1);scr_add_item(obj_ini.wep1[100,15],-1);obj_ini.wep1[0,tid]=obj_ini.wep1[100,15];}
                if (r=0) then eq1=0;
            }
            if (obj_ini.wep2[0,tid]!=obj_ini.wep2[100,15]){
                repeat(50){t+=1;if (obj_ini.equipment[t]=obj_ini.wep2[100,15]) and (obj_ini.equipment_number[t]>=1) and (r=0) then r=t;}
                if (r!=0){if (obj_ini.wep2[0,tid]!="") then scr_add_item(obj_ini.wep2[0,tid],1);scr_add_item(obj_ini.wep2[100,15],-1);obj_ini.wep2[0,tid]=obj_ini.wep2[100,15];}
                if (r=0) then eq2=0;
            }
            if (obj_ini.gear[0,tid]!=obj_ini.gear[100,15]){
                repeat(50){t+=1;if (obj_ini.equipment[t]=obj_ini.gear[100,15]) and (obj_ini.equipment_number[t]>=1) and (r=0) then r=t;}
                if (r!=0){if (obj_ini.gear[0,tid]!="") then scr_add_item(obj_ini.gear[0,tid],1);scr_add_item(obj_ini.gear[100,15],-1);obj_ini.gear[0,tid]=obj_ini.gear[100,15];}
                if (r=0) then eq3=0;
            }
            scr_alert("green","recruitment",string(obj_ini.role[100,15])+" Aspirant "+string(obj_ini.name[0,tid])+" has finished training.",0,0);
            if (eq1+eq2+eq3!=3){
                var warn,w5;warn="";w5=0;
                if (eq1=0) then warn+=string(obj_ini.wep1[100,15])+", ";
                if (eq2=0) then warn+=string(obj_ini.wep2[100,15])+", ";
                if (eq3=0) then warn+=string(obj_ini.gear[100,15])+", ";
                
                w5=string_length(warn)-1;
                warn=string_delete(warn,w5,2);
                warn+=".";
                scr_alert("red","recruitment","Not enough equipment: "+string(warn),0,0);
            }
            with(obj_ini){scr_company_order(0);}
        }
    }
}tra=0;
if (apothecary_points>=4) and (apothecary_aspirant=0){    
    var yoo, tid, tco;tid=0;tco=0;
    repeat(10){
        if (tco<2) or (tco>10){
            yoo=scr_random_marine(choose(obj_ini.role[100,8],obj_ini.role[100,8],obj_ini.role[100,10],obj_ini.role[100,9]),60);
            tid=floor(yoo);tco=(yoo-tid)*100;
            if (obj_ini.role[tco,tid]="") or (obj_ini.role[tco,tid]=obj_ini.role[100,6]) or (obj_ini.role[tco,tid]="Venerable "+string(obj_ini.role[100,6])){yoo=0;tid=0;tco=0;}
        }
    }
    if (tco<=10) and (obj_ini.role[tco,tid]!=""){
        apothecary_aspirant=1;
        var g1,h;g1=0;g2=0;h=0;
        repeat(300){h+=1;if (g1=0){if (obj_ini.role[0,h]="") then g1=h;}}// This gets the last open slot for company 0
        if (g1!=0){command+=1;marines-=1;
            obj_ini.race[0,g1]=obj_ini.race[tco,tid];obj_ini.loc[0,g1]=obj_ini.loc[tco,tid];obj_ini.name[0,g1]=obj_ini.name[tco,tid];
            obj_ini.role[0,g1]=obj_ini.role[100,15]+" Aspirant";obj_ini.wep1[0,g1]=obj_ini.wep1[tco,tid];obj_ini.lid[0,g1]=obj_ini.lid[tco,tid];
            obj_ini.wid[0,g1]=obj_ini.wid[tco,tid];obj_ini.wep2[0,g1]=obj_ini.wep2[tco,tid];obj_ini.armor[0,g1]=obj_ini.armor[tco,tid];
            obj_ini.gear[0,g1]=obj_ini.gear[tco,tid];obj_ini.hp[0,g1]=obj_ini.hp[tco,tid];obj_ini.chaos[0,g1]=obj_ini.chaos[tco,tid];
            obj_ini.mobi[0,g1]=obj_ini.mobi[tco,tid];
            obj_ini.experience[0,g1]=obj_ini.experience[tco,tid];obj_ini.age[0,g1]=obj_ini.age[tco,tid];
            obj_ini.loc[tco,tid]="";obj_ini.name[tco,tid]="";obj_ini.wep1[tco,tid]="";obj_ini.lid[tco,tid]=0;obj_ini.role[tco,tid]="";
            obj_ini.wid[tco,tid]=0;obj_ini.wep2[tco,tid]="";obj_ini.armor[tco,tid]="";obj_ini.gear[tco,tid]="";obj_ini.hp[tco,tid]=0;
            obj_ini.chaos[tco,tid]=0;obj_ini.experience[tco,tid]=0;obj_ini.age[tco,tid]=0;obj_ini.mobi[tco,tid]="";
            if (obj_ini.gear[0,g1]!=""){scr_add_item(obj_ini.gear[0,g1],1);obj_ini.gear[0,g1]="";}
            if (obj_ini.mobi[0,g1]!=""){scr_add_item(obj_ini.mobi[0,g1],1);obj_ini.mobi[0,g1]="";}
            scr_alert("green","recruitment",string(obj_ini.role[100,15])+" Aspirant "+string(obj_ini.name[0,g1])+" begins training.",0,0);
            with(obj_ini){scr_company_order(tco);scr_company_order(0);}
        }    
    }
}










if (global.chapter_name!="Space Wolves") and (global.chapter_name!="Iron Hands"){

if (training_chaplain=1) then chaplain_points+=0.8;
if (training_chaplain=2) then chaplain_points+=0.9;
if (training_chaplain=3) then chaplain_points+=1;
if (training_chaplain=4) then chaplain_points+=1.5;
if (training_chaplain=5) then chaplain_points+=2;
if (training_chaplain=6) then chaplain_points+=4;

if (training_chaplain>0) then tra=scr_role_count(string(obj_ini.role[100,14])+" Aspirant","");
if (chaplain_points>=4) and (chaplain_aspirant!=0) and (tra=0){chaplain_points=0;chaplain_aspirant=0;}
if (chaplain_points>=48){
    if (tra>0){
        var yoo, tid;tid=0;
        yoo=scr_random_marine((obj_ini.role[100,14]+" Aspirant"),0);tid=yoo;
        repeat(10){
            if (obj_ini.role[0,tid]!=obj_ini.role[100,14]+" Aspirant"){
                yoo=scr_random_marine((obj_ini.role[100,14]+" Aspirant"),0);
                tid=yoo;// tco=(yoo-tid)*100;
            }
        }
        if (obj_ini.role[0,tid]=(obj_ini.role[100,14]+" Aspirant")){
            chaplain_points-=48;chaplain_aspirant=0;
            obj_ini.role[0,tid]=obj_ini.role[100,14];obj_ini.experience[0,tid]+=10;
            var eq1,eq2,eq3,t,r;eq1=1;eq2=1;eq3=1;t=0;r=0;
            if (obj_ini.wep1[0,tid]!=obj_ini.wep1[100,14]){
                repeat(50){t+=1;if (obj_ini.equipment[t]=obj_ini.wep1[100,14]) and (obj_ini.equipment_number[t]>=1) and (r=0) then r=t;}
                if (r!=0){if (obj_ini.wep1[0,tid]!="") then scr_add_item(obj_ini.wep1[0,tid],1);scr_add_item(obj_ini.wep1[100,14],-1);obj_ini.wep1[0,tid]=obj_ini.wep1[100,14];}
                if (r=0) then eq1=0;
            }
            if (obj_ini.wep2[0,tid]!=obj_ini.wep2[100,14]){
                repeat(50){t+=1;if (obj_ini.equipment[t]=obj_ini.wep2[100,14]) and (obj_ini.equipment_number[t]>=1) and (r=0) then r=t;}
                if (r!=0){if (obj_ini.wep2[0,tid]!="") then scr_add_item(obj_ini.wep2[0,tid],1);scr_add_item(obj_ini.wep2[100,14],-1);obj_ini.wep2[0,tid]=obj_ini.wep2[100,14];}
                if (r=0) then eq2=0;
            }
            if (obj_ini.gear[0,tid]!=obj_ini.gear[100,14]){
                repeat(50){t+=1;if (obj_ini.equipment[t]=obj_ini.gear[100,14]) and (obj_ini.equipment_number[t]>=1) and (r=0) then r=t;}
                if (r!=0){if (obj_ini.gear[0,tid]!="") then scr_add_item(obj_ini.gear[0,tid],1);scr_add_item(obj_ini.gear[100,14],-1);obj_ini.gear[0,tid]=obj_ini.gear[100,14];}
                if (r=0) then eq3=0;
            }
            scr_alert("green","recruitment",string(obj_ini.role[100,14])+" Aspirant "+string(obj_ini.name[0,tid])+" has finished training.",0,0);
            if (eq1+eq2+eq3!=3){
                var warn,w5;warn="";w5=0;
                if (eq1=0) then warn+=string(obj_ini.wep1[100,14])+", ";
                if (eq2=0) then warn+=string(obj_ini.wep2[100,14])+", ";
                if (eq3=0) then warn+=string(obj_ini.gear[100,14])+", ";
                
                w5=string_length(warn)-1;
                warn=string_delete(warn,w5,2);
                warn+=".";
                scr_alert("red","recruitment","Not enough equipment: "+string(warn),0,0);
            }
            with(obj_ini){scr_company_order(0);}
        }
    }
}
if (chaplain_points>=4) and (chaplain_aspirant=0){    
    var yoo, tid, tco;tid=0;tco=0;
    repeat(10){
        if (tco<1) or (tco>10){
            yoo=scr_random_marine(choose(obj_ini.role[100,8],obj_ini.role[100,8],obj_ini.role[100,10]),60);
            tid=floor(yoo);
            tco=(yoo-tid)*100;
            if (obj_ini.role[tco,tid]="") or (obj_ini.role[tco,tid]=obj_ini.role[100,6]) or (obj_ini.role[tco,tid]="Venerable "+string(obj_ini.role[100,6])){yoo=0;tid=0;tco=0;}
        }
    }
    if (tco<=10) and (obj_ini.role[tco,tid]!=""){
        chaplain_aspirant=1;
        var g1,h;g1=0;g2=0;h=0;
        repeat(300){h+=1;if (g1=0){if (obj_ini.role[0,h]="") then g1=h;}}// This gets the last open slot for company 0
        if (g1!=0){command+=1;marines-=1;
            obj_ini.race[0,g1]=obj_ini.race[tco,tid];obj_ini.loc[0,g1]=obj_ini.loc[tco,tid];obj_ini.name[0,g1]=obj_ini.name[tco,tid];
            obj_ini.role[0,g1]=obj_ini.role[100,14]+" Aspirant";obj_ini.wep1[0,g1]=obj_ini.wep1[tco,tid];obj_ini.lid[0,g1]=obj_ini.lid[tco,tid];
            obj_ini.wid[0,g1]=obj_ini.wid[tco,tid];obj_ini.wep2[0,g1]=obj_ini.wep2[tco,tid];obj_ini.armor[0,g1]=obj_ini.armor[tco,tid];
            obj_ini.gear[0,g1]=obj_ini.gear[tco,tid];obj_ini.hp[0,g1]=obj_ini.hp[tco,tid];obj_ini.chaos[0,g1]=obj_ini.chaos[tco,tid];
            obj_ini.experience[0,g1]=obj_ini.experience[tco,tid];obj_ini.age[0,g1]=obj_ini.age[tco,tid];
            obj_ini.mobi[0,g1]=obj_ini.mobi[tco,tid];
            obj_ini.loc[tco,tid]="";obj_ini.name[tco,tid]="";obj_ini.wep1[tco,tid]="";obj_ini.lid[tco,tid]=0;obj_ini.role[tco,tid]="";
            obj_ini.wid[tco,tid]=0;obj_ini.wep2[tco,tid]="";obj_ini.armor[tco,tid]="";obj_ini.gear[tco,tid]="";obj_ini.hp[tco,tid]=0;
            obj_ini.chaos[tco,tid]=0;obj_ini.experience[tco,tid]=0;obj_ini.age[tco,tid]=0;obj_ini.mobi[tco,tid]="";
            if (obj_ini.gear[0,g1]!=""){scr_add_item(obj_ini.gear[0,g1],1);obj_ini.gear[0,g1]="";}
            if (obj_ini.mobi[0,g1]!=""){scr_add_item(obj_ini.mobi[0,g1],1);obj_ini.mobi[0,g1]="";}
            scr_alert("green","recruitment",string(obj_ini.role[100,14])+" Aspirant "+string(obj_ini.name[0,g1])+" begins training.",0,0);
            with(obj_ini){scr_company_order(tco);scr_company_order(0);}
        }    
    }
}}tra=0;






if (training_psyker=1) then psyker_points+=0.8;
if (training_psyker=2) then psyker_points+=0.9;
if (training_psyker=3) then psyker_points+=1;
if (training_psyker=4) then psyker_points+=1.5;
if (training_psyker=5) then psyker_points+=2;
if (training_psyker=6) then psyker_points+=4;

var o,yep,goal;goal=48;yep=0;
o=0;repeat(4){o+=1;if (obj_ini.adv[o]="Psyker Abundance"){goal=30;yep=1;}}

if (training_psyker>0) then tra=scr_role_count(string(obj_ini.role[100,17])+" Aspirant","");
if (psyker_points>=round(goal/2)) and (psyker_aspirant!=0) and (tra=0){psyker_points=0;psyker_aspirant=0;}
if (psyker_points>=goal){
    if (tra>0){
        var yoo, tid;tid=0;
        yoo=scr_random_marine((obj_ini.role[100,17]+" Aspirant"),0);tid=yoo;
        repeat(10){
            if (obj_ini.role[0,tid]!=obj_ini.role[100,17]+" Aspirant"){
                yoo=scr_random_marine((obj_ini.role[100,17]+" Aspirant"),0);
                tid=yoo;// tco=(yoo-tid)*100;
            }
        }
        if (obj_ini.role[0,tid]=(obj_ini.role[100,17]+" Aspirant")){
            psyker_points-=48;psyker_aspirant=0;
            obj_ini.role[0,tid]="Lexicanum";
            scr_alert("green","recruitment","Librarian Aspirant "+string(obj_ini.name[0,tid])+" has finished training.",0,0);
            with(obj_ini){scr_company_order(0);}
        }
    }
}
if (psyker_points>=round(goal/2)) and (psyker_aspirant=0){
    var yoo, tid, tco;tid=0;tco=0;
    repeat(15){
        if (tco<=2) or (tco>10){
            yoo=scr_random_marine(obj_ini.role[100,8],30);
            tid=floor(yoo);
            tco=(yoo-tid)*100;
            if (obj_ini.role[tco,tid]=""){yoo=0;tid=0;tco=0;}
            if (tid+tco!=0){if (obj_ini.role[tco,tid]="Company Champion"){yoo=0;tid=0;tco=0;}}
        }
    }
    if (tco<=10) and (obj_ini.role[tco,tid]!=""){
        psyker_aspirant=1;
        var g1,h;g1=0;g2=0;h=0;
        repeat(300){h+=1;if (g1=0){if (obj_ini.role[0,h]="") then g1=h;}}// This gets the last open slot for company 0
        if (g1!=0){command+=1;marines-=1;
            obj_ini.race[0,g1]=obj_ini.race[tco,tid];obj_ini.loc[0,g1]=obj_ini.loc[tco,tid];obj_ini.name[0,g1]=obj_ini.name[tco,tid];
            obj_ini.role[0,g1]=string(obj_ini.role[100,17])+" Aspirant";obj_ini.wep1[0,g1]=obj_ini.wep1[tco,tid];obj_ini.lid[0,g1]=obj_ini.lid[tco,tid];
            obj_ini.wid[0,g1]=obj_ini.wid[tco,tid];obj_ini.wep2[0,g1]=obj_ini.wep2[tco,tid];obj_ini.armor[0,g1]=obj_ini.armor[tco,tid];
            obj_ini.gear[0,g1]=obj_ini.gear[tco,tid];obj_ini.hp[0,g1]=obj_ini.hp[tco,tid];obj_ini.chaos[0,g1]=obj_ini.chaos[tco,tid];
            obj_ini.experience[0,g1]=obj_ini.experience[tco,tid];obj_ini.age[0,g1]=obj_ini.age[tco,tid];
            scr_powers_new(0,g1);
            
            if (string_count("Abund",obj_ini.strin)>0) then obj_ini.experience[0,g1]+=floor(random(5))+3;
            
            obj_ini.mobi[0,g1]=obj_ini.mobi[tco,tid];
            obj_ini.loc[tco,tid]="";obj_ini.name[tco,tid]="";obj_ini.wep1[tco,tid]="";obj_ini.lid[tco,tid]=0;obj_ini.role[tco,tid]="";
            obj_ini.wid[tco,tid]=0;obj_ini.wep2[tco,tid]="";obj_ini.armor[tco,tid]="";obj_ini.gear[tco,tid]="";obj_ini.hp[tco,tid]=0;
            obj_ini.chaos[tco,tid]=0;obj_ini.experience[tco,tid]=0;obj_ini.age[tco,tid]=0;obj_ini.mobi[tco,tid]="";
            if (obj_ini.gear[0,g1]!=""){scr_add_item(obj_ini.gear[0,g1],1);obj_ini.gear[0,g1]="";}
            if (obj_ini.mobi[0,g1]!=""){scr_add_item(obj_ini.mobi[0,g1],1);obj_ini.mobi[0,g1]="";}
            scr_alert("green","recruitment",string(obj_ini.role[100,17])+" Aspirant "+string(obj_ini.name[0,g1])+" begins training.",0,0);
            with(obj_ini){scr_company_order(tco);scr_company_order(0);}
        }    
    }
}tra=0;













/*var tm_num;tm_num=0;
tm_num=scr_role_count("Tech Recruit","");

if (tm_num>0){*/
if (training_techmarine=1) then tech_points+=1;
if (training_techmarine=2) then tech_points+=2;
if (training_techmarine=3) then tech_points+=4;
if (training_techmarine=4) then tech_points+=6;
if (training_techmarine=5) then tech_points+=8;
if (training_techmarine=6) then tech_points+=16;

if (training_techmarine>0) then tra=scr_role_count(string(obj_ini.role[100,16])+" Aspirant","");
if (tech_points>=4) and (tech_aspirant!=0) and (tra=0){tech_points=0;tech_aspirant=0;}
if (tech_points>=360){
    if (tra>0){
        var yoo, tid;tid=0;
        yoo=scr_random_marine((obj_ini.role[100,16]+" Aspirant"),0);tid=yoo;
        repeat(10){
            if (obj_ini.role[0,tid]!=obj_ini.role[100,16]+" Aspirant"){
                yoo=scr_random_marine((obj_ini.role[100,16]+" Aspirant"),0);
                tid=yoo;// tco=(yoo-tid)*100;
            }
        }
        if (obj_ini.role[0,tid]=(obj_ini.role[100,16]+" Aspirant")){
            tech_points-=360;tech_aspirant=0;
            obj_ini.role[0,tid]=obj_ini.role[100,16];obj_ini.experience[0,tid]+=10;
            
            var eq1,eq2,eq3,t,r;eq1=1;eq2=1;eq3=1;t=0;r=0;
            if (obj_ini.wep1[0,tid]!=obj_ini.wep1[100,16]){
                repeat(50){t+=1;if (obj_ini.equipment[t]=obj_ini.wep1[100,16]) and (obj_ini.equipment_number[t]>=1) and (r=0) then r=t;}
                if (r!=0){if (obj_ini.wep1[0,tid]!="") then scr_add_item(obj_ini.wep1[0,tid],1);scr_add_item(obj_ini.wep1[100,16],-1);obj_ini.wep1[0,tid]=obj_ini.wep1[100,16];}
                if (r=0) then eq1=0;
            }
            if (obj_ini.wep2[0,tid]!=obj_ini.wep2[100,16]){
                repeat(50){t+=1;if (obj_ini.equipment[t]=obj_ini.wep2[100,16]) and (obj_ini.equipment_number[t]>=1) and (r=0) then r=t;}
                if (r!=0){if (obj_ini.wep2[0,tid]!="") then scr_add_item(obj_ini.wep2[0,tid],1);scr_add_item(obj_ini.wep2[100,16],-1);obj_ini.wep2[0,tid]=obj_ini.wep2[100,16];}
                if (r=0) then eq2=0;
            }
            if (obj_ini.gear[0,tid]!=obj_ini.gear[100,16]){
                if (obj_ini.gear[0,tid]!="") then scr_add_item(obj_ini.gear[0,tid],1);
                obj_ini.gear[0,tid]="Servo Arms";
            }
            scr_alert("green","recruitment",string(obj_ini.name[0,tid])+" returns from Mars, a "+string(obj_ini.role[100,16])+".",0,0);
            
            if (eq1+eq2!=2){
                var warn,w5;warn="";w5=0;
                if (eq1=0) then warn+=string(obj_ini.wep1[100,16])+", ";
                if (eq2=0) then warn+=string(obj_ini.wep2[100,16])+", ";
                
                w5=string_length(warn)-1;warn=string_delete(warn,w5,2);warn+=".";
                scr_alert("red","recruitment","Not enough equipment: "+string(warn),0,0);
            }
            
            obj_ini.loc[0,tid]=obj_ini.home_name;obj_ini.wid[0,tid]=2;obj_ini.lid[0,tid]=0;
            // Probably want to change this to take into account fleet type chapters- also increase the man_size of that area by +X
            
            if (global.chapter_name!="Iron Hands") and (obj_ini.bio[0,tid]<4) then obj_ini.bio[0,tid]=choose(4,5,6);
            if (global.chapter_name="Iron Hands") and (obj_ini.bio[0,tid]<7) then obj_ini.bio[0,tid]=choose(7,8);
            
            // 135 ; probably also want to increase the p_player by 1 just because
            
            with(obj_ini){scr_company_order(0);}
        }
    }
}
if (tech_points>=4) and (tech_aspirant=0){    
    var yoo, tid, tco;tid=0;tco=0;
    repeat(10){
        if (tco<2) or (tco>10){
            yoo=scr_random_marine(choose(obj_ini.role[100,8],obj_ini.role[100,8],obj_ini.role[100,10],obj_ini.role[100,9]),30);
            tid=floor(yoo);
            tco=(yoo-tid)*100;
            if (obj_ini.role[tco,tid]="") or (string_count("Dread",obj_ini.armor[tco,tid])>0){yoo=0;tid=0;tco=0;}
        }
    }
    if (tco<=10) and (obj_ini.role[tco,tid]!=""){
        tech_aspirant=1;
        var g1,h;g1=0;g2=0;h=0;
        repeat(300){h+=1;if (g1=0){if (obj_ini.role[0,h]="") then g1=h;}}// This gets the last open slot for company 0
        if (g1!=0){command+=1;marines-=1;
            obj_ini.race[0,g1]=obj_ini.race[tco,tid];obj_ini.loc[0,g1]=obj_ini.loc[tco,tid];obj_ini.name[0,g1]=obj_ini.name[tco,tid];
            obj_ini.role[0,g1]=obj_ini.role[100,16]+" Aspirant";obj_ini.wep1[0,g1]=obj_ini.wep1[tco,tid];obj_ini.lid[0,g1]=obj_ini.lid[tco,tid];
            obj_ini.wid[0,g1]=obj_ini.wid[tco,tid];obj_ini.wep2[0,g1]=obj_ini.wep2[tco,tid];obj_ini.armor[0,g1]=obj_ini.armor[tco,tid];
            obj_ini.gear[0,g1]=obj_ini.gear[tco,tid];obj_ini.hp[0,g1]=obj_ini.hp[tco,tid];obj_ini.chaos[0,g1]=obj_ini.chaos[tco,tid];
            obj_ini.mobi[0,g1]=obj_ini.mobi[tco,tid];
            obj_ini.experience[0,g1]=obj_ini.experience[tco,tid];obj_ini.age[0,g1]=obj_ini.age[tco,tid];
            obj_ini.loc[tco,tid]="";obj_ini.name[tco,tid]="";obj_ini.wep1[tco,tid]="";obj_ini.lid[tco,tid]=0;obj_ini.role[tco,tid]="";
            obj_ini.wid[tco,tid]=0;obj_ini.wep2[tco,tid]="";obj_ini.armor[tco,tid]="";obj_ini.gear[tco,tid]="";obj_ini.hp[tco,tid]=0;
            obj_ini.chaos[tco,tid]=0;obj_ini.experience[tco,tid]=0;obj_ini.age[tco,tid]=0;obj_ini.mobi[tco,tid]="";
            if (obj_ini.lid[0,g1]>0){// Remove from ship
                var man_size;man_size=scr_unit_size(obj_ini.armor[0,g1],obj_ini.role[0,g1],true);
                obj_ini.ship_carrying[obj_ini.lid[0,g1]]-=man_size;
            }
            obj_ini.loc[0,g1]="Terra";obj_ini.wid[0,g1]=4;obj_ini.lid[0,g1]=0;
            if (obj_ini.wep1[0,g1]!="Power Weapon") and (obj_ini.wep1[0,g1]!=""){scr_add_item(obj_ini.wep1[0,g1],1);obj_ini.wep1[0,g1]="";}
            if (obj_ini.wep2[0,g1]!=""){scr_add_item(obj_ini.wep2[0,g1],1);obj_ini.wep2[0,g1]="";}
            if (obj_ini.gear[0,g1]!=""){scr_add_item(obj_ini.gear[0,g1],1);obj_ini.gear[0,g1]="";}
            if (obj_ini.mobi[0,g1]!=""){scr_add_item(obj_ini.mobi[0,g1],1);obj_ini.mobi[0,g1]="";}
            scr_alert("green","recruitment",string(obj_ini.role[100,16])+" Aspirant "+string(obj_ini.name[0,g1])+" journeys to Mars.",0,0);
            with(obj_ini){scr_company_order(tco);scr_company_order(0);}
        }    
    }
}tra=0;


/*
training_apothecary=2;
apothecary_points=0;
apothecary_aspirant=0;
training_chaplain=2;
chaplain_points=0;
chaplain_aspirant=0;
training_psyker=2;
psyker_points=0;
psyker_aspirant=0;
training_techmarine=0;
tech_points=0;
recruiting=0;
recruits=0;
*/









var i, onceh, up, tot,stahp;
i=0;onceh=0;up=0;tot=0;stahp=0;

if (obj_ini.fleet_type!=1){
    with(obj_temp5){instance_destroy();}
    with(obj_p_fleet){
        if (action!="") then instance_create(x,y,obj_temp5);
        if (x<0) or (x>room_width) or (y<0) or (y>room_height) then instance_create(x,y,obj_temp5);
    }
    if (instance_number(obj_temp5)>=instance_number(obj_p_fleet)) then stahp=1;
    with(obj_temp5){instance_destroy();}
}









// probably rewrite all of this








var recruits_finished,tot,recruit_first;
recruits_finished=0;tot=0;recruit_first="";

i=0;
repeat(300){i+=1;
    if (recruit_name[i]!="") then tot+=1;
    if (recruit_name[i]!="") and (recruit_distance[i]<=0) then recruit_training[i]-=1;
}

i=0;
repeat(300){i+=1;
    if (recruit_name[i]!="") and (recruit_training[i]<=0){
        scr_add_man(obj_ini.role[100,12],10,"Scout Armor",obj_ini.role[100,12],"",recruit_exp[i],recruit_name[i],recruit_corruption[i],false,"default","");
        if (recruit_first="") then recruit_first=recruit_name[i];
        recruits_finished+=1;recruit_name[i]="";recruit_training[i]=-50;
    }
}

i=0;
repeat(299){i+=1;
    if (recruit_name[i]="") and (recruit_name[i+1]!=""){
        recruit_name[i]=recruit_name[i+1];
        recruit_corruption[i]=recruit_corruption[i+1];
        recruit_distance[i]=recruit_distance[i+1];
        recruit_training[i]=recruit_training[i+1];
        recruit_exp[i]=recruit_exp[i+1];
        
        recruit_name[i+1]="";recruit_corruption[i+1]=0;
        recruit_distance[i+1]=0;recruit_training[i+1]=0;
        recruit_exp[i+1]=0;
    }
}

if (recruits_finished=1) then scr_alert("green","recruitment",string(obj_ini.role[100,12])+" "+string(recruit_first)+" has joined the 10th Company.",0,0);
if (recruits_finished>1) then scr_alert("green","recruitment",string(recruits_finished)+"x "+string(obj_ini.role[100,12])+" have joined the 10th Company.",0,0);

recruits=tot;


// Gene-seed Test-Slaves
i=0;repeat(120){i+=1;
    if (obj_ini.slave_batch_num[i]>0){
        obj_ini.slave_batch_eta[i]-=1;
        if (obj_ini.slave_batch_eta[i]=0){
            obj_ini.slave_batch_eta[i]=60;
            obj_controller.gene_seed+=obj_ini.slave_batch_num[i];
            // color / type / text /x/y
            scr_alert("green","test-slaves","Test-Slave Incubators Batch "+string(i)+" harvested for "+string(obj_ini.slave_batch_num[i])+" Gene-Seed.",0,0);
        }
    }
}


/* */


if (turn=240) and (global.chapter_name="Lamenters"){obj_ini.strin2+="Black Rage";
    scr_popup("Geneseed Mutation","Your Chapter has begun to have visions and nightmares of Sanguinius' fall.  The less mentally disciplined of your battle-brothers no longer are able to sleep soundly, waking from sleep in a screaming, frothing rage.  It appears the Black Rage has returned.","black_rage","");    
}

if (obj_ini.adv[1]="Scavengers") or (obj_ini.adv[1]="Scavengers") or (obj_ini.adv[1]="Scavengers") or (obj_ini.adv[1]="Scavengers"){
    var lroll1,lroll2,loot;
    lroll1=floor(random(100))+1;
    lroll2=floor(random(100))+1;
    loot="";
    if (obj_ini.dis[1]="Shitty Luck") or (obj_ini.dis[2]="Shitty Luck") or (obj_ini.dis[3]="Shitty Luck") or (obj_ini.dis[4]="Shitty Luck"){lroll1+=2;lroll2+=25;}
    if (lroll1<=5){
        loot=choose("Chainsword","Bolt Pistol","Combat Knife","Narthecium");
        if (lroll2<=80) then loot=choose("Power Sword","Storm Bolter");
        if (lroll2<=60) then loot=choose("Plasma Pistol","Chainfist","Lascannon","Heavy Bolter","Assault Cannon","Bike");
        if (lroll2<=30) then loot=choose("Artificer Armor","Plasma Gun","Chainfist","Rosarius","Psychic Hood");
        if (lroll2<=10) then loot=choose("Terminator Armor","Artificer Armor","Dreadnought","Plasma Gun","Power Fist","Thunder Hammer","Iron Halo");
        var tix;tix="A "+string(loot)+" has been gifted to the Chapter.";
        tix=string_replace(tix,"A A","An A");tix=string_replace(tix,"A E","An E");
        tix=string_replace(tix,"A I","An I");tix=string_replace(tix,"A O","An O");
        scr_add_item(string(loot),1);scr_alert("","loot",tix,0,0);
    }
}


// Check number of navy fleets
with(obj_temp_inq){instance_destroy();}
with(obj_temp8){instance_destroy();}
with(obj_en_fleet){
    if (owner=2) and (navy=1) then instance_create(x,y,obj_temp_inq);
}
if (instance_number(obj_temp_inq)>target_navy_number){
    with(obj_en_fleet){if (navy=0) or (guardsmen_unloaded=1) then y-=20000;}
    var him;him=instance_nearest(random(room_width),random(room_height),obj_en_fleet);
    if (him.guardsmen_unloaded=0) and (him.navy=1) then with(him){instance_destroy();}
    with(obj_en_fleet){if (y<-10000) then y+=20000;}
}
if (instance_number(obj_temp_inq)<target_navy_number){
    with(obj_star){
        var o,good;o=0;good=0;
        repeat(4){o+=1;
            if (p_type[o]="Forge") and (p_owner[o]=3) and (p_orks[o]+p_tau[o]+p_tyranids[o]+p_chaos[o]+p_traitors[o]+p_necrons[o]=0){
                if (present_fleet[7]+present_fleet[8]+present_fleet[9]+present_fleet[10]+present_fleet[13]=0){
                    good=1;if (instance_nearest(x+24,y-24,obj_en_fleet).navy=1) then good=0;
                }
            }
        }
        if (good=1) then instance_create(x,y,obj_temp8);
    }
}
if (instance_exists(obj_temp8)){
    var newy,nav,ii;newy=instance_nearest(random(room_width),random(room_height),obj_temp8);
    nav=instance_create(newy.x+24,newy.y-24,obj_en_fleet);
    nav.owner=2;ii=0;
    
    nav.capital_number=0;
    nav.frigate_number=0;
    nav.escort_number=1;
    nav.home_x=x;nav.home_y=y;
    with(instance_nearest(newy.x,newy.y,obj_star)){present_fleet[2]+=1;}
    nav.orbiting=instance_nearest(newy.x,newy.y,obj_star);
    nav.navy=1;
    
    var ii;ii=0;ii+=nav.capital_number-1;ii+=round((nav.frigate_number/2));ii+=round((nav.escort_number/4));
    if (ii<=1) and (nav.capital_number+nav.frigate_number+nav.escort_number>0) then ii=1;
    nav.image_index=ii;nav.image_speed=0;
    
    nav.trade_goods="building_ships";
    with(obj_temp8){instance_destroy();}
}




if (gene_tithe=0) and (faction_status[2]!="War"){// Time for another tithe
    gene_tithe=24;
    
    var expected,onceh,txt,mech_mad;onceh=0;txt="";mech_mad=false;
    expected=max(1,round(obj_controller.gene_seed/20));
    if (obj_controller.faction_status[3]="War") then mech_mad=true;
    
    if (obj_controller.gene_seed<=0) or (mech_mad=true){onceh=2;gene_iou+=1;loyalty-=2;loyalty_hidden-=2;
        txt="No Gene-Seed for Adeptus Mechanicus tithe.  High Lords of Terra IOU increased to "+string(gene_iou)+".";
    }
    
    if (mech_mad=false){
        if (obj_controller.gene_seed>0) and (und_gene_vaults=0) and (onceh=0){
            obj_controller.gene_seed-=expected;onceh=1;
            
            if (obj_controller.gene_seed>=gene_iou) and (gene_iou>0){
                expected+=gene_iou;obj_controller.gene_seed-=gene_iou;gene_iou=0;
                onceh=3;
            }
            
            repeat(50){
                if (obj_controller.gene_seed<gene_iou) and (obj_controller.gene_seed>0) and (gene_iou>0){
                    expected+=1;obj_controller.gene_seed-=1;gene_iou-=1;if (gene_iou=0) then onceh=3;
                }
            }
            
            if (gene_iou<0) then gene_iou=0;
            
            txt=string(expected)+" Gene-Seed sent to Adeptus Mechanicus for tithe.";
            if (gene_iou>0) then txt+="  IOU remains at "+string(gene_iou)+".";
            if (onceh=3) then txt+="  IOU has been payed off.";
        }
        
        if (obj_controller.gene_seed>0) and (und_gene_vaults>0) and (onceh=0){
            expected=1;obj_controller.gene_seed-=expected;onceh=1;
            
            if (obj_controller.gene_seed<gene_iou) and (obj_controller.gene_seed>0) and (gene_iou>0){
                expected+=1;obj_controller.gene_seed-=1;gene_iou-=1;if (gene_iou=0) then onceh=3;
            }
            
            if (gene_iou<0) then gene_iou=0;
            
            txt=string(expected)+" Gene-Seed sent to Adeptus Mechanicus for tithe.";
            if (gene_iou>0) then txt+="  IOU remains at "+string(gene_iou)+".";
            if (onceh=3) then txt+="  IOU has been payed off.";
        }
        
        if (onceh!=2){scr_alert("green","tithes",txt,0,0);scr_event_log("",txt);}
        if (onceh=2){scr_alert("red","tithes",txt,0,0);scr_event_log("red",txt);}
    }
}
if (gene_sold>0){
    var disc,droll;disc=0;droll=0;
    gene_sold=floor(gene_sold*75)/100;

    if (gene_sold<1) then gene_sold=0;    
    if (gene_sold>=50){
        disc=round(gene_sold/7);
        droll=floor(random(100))+1;
        
        if (droll<=disc) and (obj_controller.known[4]!=0){// Inquisition takes notice
            var disp_change;disp_change=-3;
            if (gene_sold>=100) then disp_change=-5;
            if (gene_sold>=200) then disp_change=-7;
            if (gene_sold>=400) then disp_change=-10;
            gene_sold=0;scr_audience(4,"gene_trade",disp_change,"",2,0);
        }
    }
}
if (gene_xeno>0){
    var disc,droll;disc=0;droll=0;
    gene_xeno=floor(gene_xeno*90)/100;

    if (gene_xeno<1) then gene_xeno=0;    
    if (gene_xeno>=5){
        disc=round(gene_xeno/5);
        droll=floor(random(100))+1;
        
        if (droll<=disc) and (obj_controller.known[4]!=0){// Inquisition takes notice
            gene_xeno=99999;alarm[8]=1;
        }
    }
}











var c,e,p;c=-1;e=0;p=0;penitorium=0;
repeat(11){c+=1;e=0;
    repeat(250){e+=1;
        if (obj_ini.god[c,e]>=10){
            p+=1;penit_co[p]=c;penit_id[p]=e;penitorium+=1;
            if (obj_ini.chaos[c,e]<90) and (obj_ini.chaos[c,e]>0){
                var heresy_old,heresy_new;heresy_old=0;heresy_new=0;
                heresy_old=round((obj_ini.chaos[c,e]*obj_ini.chaos[c,e])/50)-0.5;
                heresy_new=(heresy_old*50)/obj_ini.chaos[c,e];
                obj_ini.chaos[c,e]=max(0,heresy_new);
            }
        }
    }
}

// STC Bonuses
if (obj_controller.stc_ships>=6){var v;v=0;
    repeat(40){v+=1;
        if (obj_ini.ship_hp[v]<obj_ini.ship_maxhp[v]) then obj_ini.ship_hp[v]+=round(obj_ini.ship_maxhp[v]*0.06);
        if (obj_ini.ship_hp[v]>obj_ini.ship_maxhp[v]) then obj_ini.ship_hp[v]=obj_ini.ship_maxhp[v];
    }
}




// if (turn=chaos_turn) and (faction_gender[10]=1){// show_message("Turn 100");
if (turn=5) and (faction_gender[10]=1){// show_message("Turn 100");
    var xx4,yy4,plant,planeh,fleeta,testi;
    xx4=0;yy4=0;plant=0;planeh=0;testi=0;fleeta=0;
    
    with(obj_en_fleet){if (owner!=2) then y-=20000;}
    
    repeat(50){
        if (planeh=0){xx4=floor(random(room_width))+1;yy4=floor(random(room_height))+1;plant=instance_nearest(xx4,yy4,obj_star);}
        if (planeh=0) and (plant.owner=2) and (plant.planets>1){
            planeh=instance_nearest(xx4,yy4,obj_star);
            
            if (planeh.present_fleet[2]>0){
                fleeta=instance_nearest(planeh.x,planeh.y,obj_en_fleet);
                if (point_distance(fleeta.x,fleeta.y,planeh.x,planeh.y)>40) then planeh=0;
            }
            if (planeh.present_fleet[2]=0) then planeh=0;
        }
    }
    if (planeh!=0){
        if (planeh.p_type[1]="Dead") then testi=2;
        if (planeh.p_type[1]!="Dead") then testi=1;
        
        planeh.p_feature[testi]+="WL10|";
        if (planeh.p_type[testi]="Hive") then planeh.p_heresy[testi]+=25;
        if (planeh.p_type[testi]!="Hive") then planeh.p_heresy[testi]+=10;
        if (planeh.p_heresy[testi]<50) then planeh.p_heresy_secret[testi]=10;
        
        // show_message("Placed the chaos warlord on "+string(planeh.name)+" "+scr_roman(testi));// 139
        // obj_controller.x=planeh.x;obj_controller.y=planeh.y;
    }
    
    with(obj_en_fleet){if (owner!=2) then y+=20000;}
}



if (blood_debt=1) and (penitent=1){
    penitent_turn+=1;
    // was -60
    penitent_turnly=((penitent_turn*penitent_turn)-512)*-1;
    if (penitent_turnly>0) then penitent_turnly=0;
    penitent_current+=penitent_turnly;
    
    if (penitent_current<=0){penitent=0;alarm[8]=1;}
    if (penitent_end<30000) then penitent_end+=41000;
    
    if (penitent_current>=penitent_max) or (((obj_controller.millenium*1000)+obj_controller.year)>=penitent_end){
        penitent=0;
        if (known[4]=2) or (known[4]>=4) then scr_audience(4,"penitent_end",0,"",0,0);
        if (known[5]>=2) then scr_audience(5,"penitent_end",0,"",0,0);
        disposition[2]+=20;disposition[3]+=15;disposition[4]+=20;disposition[5]+=20;
        var o;o=0;repeat(4){if (o<=4){o+=1;if (obj_ini.adv[o]="Reverent Guardians") then o=500;}}if (o>100) then obj_controller.disposition[5]+=10;
        scr_event_log("","Blood Debt payed off.  You may once more recruit Astartes.");
    }
}

if (penitent=1) and (blood_debt=0){
    penitent_turn+=1;penitent_current+=1;penitent_turnly=0;
    
    if (penitent_current<=0){penitent=0;alarm[8]=1;}
    if (penitent_current>=penitent_max){penitent=0;
        if (known[4]=2) or (known[4]>=4) then scr_audience(4,"penitent_end",0,"",0,0);
        if (known[5]>=2) then scr_audience(5,"penitent_end",0,"",0,0);
        disposition[2]+=20;disposition[3]+=15;disposition[4]+=20;disposition[5]+=20;
        var o;o=0;repeat(4){if (o<=4){o+=1;if (obj_ini.adv[o]="Reverent Guardians") then o=500;}}if (o>100) then obj_controller.disposition[5]+=10;
        scr_event_log("","Penitent Crusade ends.  You may once more recruit Astartes.");
    }
}














// if (obj_controller.known[7]=0){
if ((turn>=10) or (obj_ini.fleet_type=3)) and (faction_defeated[7]=0){
    var waaagh;waaagh=floor(random(100))+1;
    with(obj_star){
        if (owner=7) then instance_create(x,y,obj_temp2);
    }
    if ((instance_number(obj_temp2)>=5) and (waaagh<=instance_number(obj_temp2)) and (obj_controller.known[7]=0))/* or (obj_controller.test_map=true)*/{
        obj_controller.known[7]=0.5;
        with(obj_star){
            if (owner=7) then alarm[4]=1;
        }
        
        if (!instance_exists(obj_turn_end)) then scr_popup("WAAAAGH!","The greenskins have swelled in activity, their numbers increasing seemingly without relent.  A massive Warboss has risen to take control, leading most of the sector's Orks on a massive WAAAGH!","waaagh","");
        if (instance_exists(obj_turn_end)){
            obj_turn_end.popups+=1;
            obj_turn_end.popup[obj_turn_end.popups]=1;
            obj_turn_end.popup_type[obj_turn_end.popups]="WAAAAGH!";
            obj_turn_end.popup_text[obj_turn_end.popups]="The greenskins have swelled in activity, their numbers increasing seemingly without relent.  A massive Warboss has risen to take control, leading most of the sector's Orks on a massive WAAAGH!";
            obj_turn_end.popup_image[obj_turn_end.popups]="waaagh";
            scr_event_log("red","Ork WAAAAGH! begins.");
            
            with(obj_star){
                if (owner=7){
                    var rund;rund=floor(random(planets))+1;
                    if (rund=1) and (p_owner[1]=7) and (p_pdf[1]=0) and (p_guardsmen[1]=0) and (p_orks[1]>=2) then instance_create(x,y,obj_temp6);
                    if (rund=2) and (p_owner[2]=7) and (p_pdf[2]=0) and (p_guardsmen[2]=0) and (p_orks[2]>=2) then instance_create(x,y,obj_temp6);
                    if (rund=3) and (p_owner[3]=7) and (p_pdf[3]=0) and (p_guardsmen[3]=0) and (p_orks[3]>=2) then instance_create(x,y,obj_temp6);
                    if (rund=4) and (p_owner[4]=7) and (p_pdf[4]=0) and (p_guardsmen[4]=0) and (p_orks[4]>=2) then instance_create(x,y,obj_temp6);
                }
            }
            if (instance_exists(obj_temp6)){
                var you2,you,rund;
                you2=instance_nearest(random(room_width),random(room_height),obj_temp6);
                you=instance_nearest(you2.x,you2.y,obj_star);
                
                with(obj_temp2){instance_destroy();}
                repeat(10){
                    if (!instance_exists(obj_temp2)){
                        rund=round(random(you.planets));
                        if (rund=1) and (you.p_owner[1]=7) and (you.p_pdf[1]+you.p_guardsmen[1]=0) and (you.p_orks[1]>=2) then you.p_feature[rund]+="WL7|";
                        if (rund=2) and (you.p_owner[2]=7) and (you.p_pdf[2]+you.p_guardsmen[2]=0) and (you.p_orks[2]>=2) then you.p_feature[rund]+="WL7|";
                        if (rund=3) and (you.p_owner[3]=7) and (you.p_pdf[3]+you.p_guardsmen[3]=0) and (you.p_orks[3]>=2) then you.p_feature[rund]+="WL7|";
                        if (rund=4) and (you.p_owner[4]=7) and (you.p_pdf[4]+you.p_guardsmen[4]=0) and (you.p_orks[4]>=2) then you.p_feature[rund]+="WL7|";
                        if (you.p_orks[rund]<4) then you.p_orks[rund]=4;
                        if (string_count("WL7",you.p_feature[rund])>0) then instance_create(x,y,obj_temp2);
                    }
                }
            }
            with(obj_temp6){instance_destroy();}
            with(obj_temp2){instance_destroy();}
        }
    }
    with(obj_temp2){instance_destroy();}
}


// if (known[5]=1){var spikky;spikky=choose(0,0,0,1,1);if (spikky=1) then with(obj_turn_end){audiences+=1;audien[audiences]=5;audien_topic[audiences]="intro";}}
if (known[5]=1){var spikky;spikky=choose(0,1,1);if (spikky=1) then with(obj_turn_end){audiences+=1;audien[audiences]=5;known[5]=2;audien_topic[audiences]="intro";if (obj_controller.faction_status[5]="War") then audien_topic[audiences]="declare_war";}}
if (known[6]=1) and (faction_defeated[6]=0){var spikky;spikky=choose(0,1);if (spikky=1) then with(obj_turn_end){audiences+=1;audien[audiences]=6;audien_topic[audiences]="intro1";}}
if (known[7]=0.5) and (faction_defeated[7]=0){var spikky;spikky=floor(random(7));if (spikky=1) then with(obj_turn_end){audiences+=1;audien[audiences]=7;audien_topic[audiences]="intro";}}
if (known[8]=1) and (faction_defeated[8]=0){with(obj_turn_end){audiences+=1;audien[audiences]=8;audien_topic[audiences]="intro";}}




// Quests here
var i;i=0;// 135 ; quests
repeat(40){i+=1;
    if (quest_end[i]<=turn) and (quest[i]!=""){
        scr_quest(1,quest[i],quest_faction[i],0);
        quest[i]="";
    }
    if (quest[i]="") and (quest[i+1]!=""){
        quest[i]=quest[i+1];quest_faction[i]=quest_faction[i+1];quest_end[i]=quest_end[i+1];
        quest[i+1]+="";quest_faction[i+1]=0;quest_end[i+1]=0;
    }
}







// Inquisition stuff here
if (disposition[6]>=60) then scr_loyalty("Xeno Associate","+");
if (disposition[7]>=60) then scr_loyalty("Xeno Associate","+");
if (disposition[8]>=60) then scr_loyalty("Xeno Associate","+");

var fuck1;
fuck1=0;fuck1=scr_role_count(obj_ini.role[100,15],"");if (fuck1=0) then scr_loyalty("Lack of Apothecary","+");
fuck1=0;fuck1=scr_role_count(obj_ini.role[100,16],"");if (fuck1=0) then scr_loyalty("Upset Machine Spirits","+");
fuck1=0;fuck1=scr_role_count(obj_ini.role[100,14],"");if (fuck1=0) then scr_loyalty("Undevout","+");

if (marines>=1050) then scr_loyalty("Non-Codex Size","+");






var laas;laas=0;
if (obj_ini.fleet_type=1) then laas=last_world_inspection;
if (obj_ini.fleet_type!=1) then laas=last_fleet_inspection;

var inspec;inspec=0;
if (loyalty>=85) and ((laas+59)<turn) then inspec=1;
if (loyalty>=70) and (loyalty<85) and ((laas+47)<turn) then inspec=1;
if (loyalty>=50) and (loyalty<70) and ((laas+35)<turn) then inspec=1;
if (loyalty<50) and ((laas+11+choose(1,2,3,4))<turn) then inspec=1;

if (obj_ini.fleet_type!=1){
    with(obj_p_fleet){if (capital_number<=0) then instance_deactivate_object(id);}
    if (instance_number(obj_p_fleet)=1) and (obj_ini.fleet_type!=1){// Might be crusading, right?
        if (obj_p_fleet.x<0) or (obj_p_fleet.x>room_width) or (obj_p_fleet.y<0) or (obj_p_fleet.y>room_height) then inspec=0;
    }
    if (instance_number(obj_p_fleet)=0) then inspec=0;
}
instance_activate_object(obj_p_fleet);


with(obj_fleet){if (owner=4) then instance_create(x,y,obj_temp6);}


if (inspec=1) and (faction_status[4]!="War") and (obj_ini.fleet_type=1) and (instance_number(obj_temp6)=0){// Find planet near homeworld to have an inquisitor ship pop from
    // If player does not own their homeworld than do a fleet inspection instead
    with(obj_star){if (owner=1) then instance_create(x,y,obj_temp3);}
    
    if (instance_number(obj_temp3)=1){
        var xy,yx,tar,flit;
        xy=obj_temp3.x;yx=obj_temp3.y;
        
        
        repeat(choose(2,3)){
            tar=instance_nearest(obj_temp3.x,obj_temp3.y,obj_star);
            instance_deactivate_object(tar);
        }
        
        repeat(5){
            tar=instance_nearest(obj_temp3.x,obj_temp3.y,obj_star);
            if (tar.owner=6) then instance_deactivate_object(tar);
        }
        
        tar=instance_nearest(obj_temp3.x,obj_temp3.y,obj_star);
        flit=instance_create(tar.x,tar.y-24,obj_en_fleet);
        flit.owner=4;
        flit.frigate_number=1;
        flit.action_x=xy;
        flit.action_y=yx;
        flit.sprite_index=spr_fleet_inquisition;
        flit.image_index=0;
        
        var roll;
        roll=floor(random(100))+1;
        
        if (roll<=60) then flit.trade_goods="Inqis1";
        if (roll<=70) and (roll>60) then flit.trade_goods="Inqis2";
        if (roll<=80) and (roll>70) then flit.trade_goods="Inqis3";
        if (roll<=90) and (roll>80) then flit.trade_goods="Inqis4";
        if (roll<=100) and (roll>90) then flit.trade_goods="Inqis5";
        
        flit.alarm[4]=1;
        
        instance_activate_object(obj_star);
        with(obj_temp3){instance_destroy();}
        last_world_inspection=turn;
    }
}


if (inspec=1) and (faction_status[4]!="War") and (obj_ini.fleet_type!=1) and (instance_number(obj_temp6)=0){// Find planet near homeworld to have an inquisitor ship pop from
    // If player does not own their homeworld than do a fleet inspection instead
    
    with(obj_temp4){instance_destroy();}
    with(obj_temp5){instance_destroy();}
    
    if (instance_exists(obj_p_fleet)){
        with(obj_p_fleet){
            if (capital_number>0) and (action=""){instance_create(x,y,obj_temp5);}
            if (capital_number>0) and (action!=""){instance_create(action_x,action_y,obj_temp5);}
            if (frigate_number>0) and (action="") then instance_create(x,y,obj_temp4);
            if (frigate_number>0) and (action!="") then instance_create(action_x,action_y,obj_temp4);
        }
    
        var obj,x4,y4,from,target,flit;
        if (instance_exists(obj_p_ship)) then obj=instance_nearest(random(room_width),random(room_height),obj_p_ship);
        if (instance_exists(obj_temp4)) then obj=instance_nearest(random(room_width),random(room_height),obj_temp4);
        if (instance_exists(obj_temp5)) then obj=instance_nearest(random(room_width),random(room_height),obj_temp5);
        
        
        x4=obj.x;y4=obj.y;
        
        with(obj_star){if (owner=6) then instance_deactivate_object(id);}
        
        
        repeat(choose(2,3)){
            from=instance_nearest(x4,y4,obj_star);with(from){instance_deactivate_object(id);};
        }
        from=instance_nearest(x4,y4,obj_star);
        instance_activate_object(obj_star);
        
        
        
        flit=instance_create(from.x,from.y-24,obj_en_fleet);
        flit.owner=4;
        flit.frigate_number=1;
        
        flit.target=instance_nearest(x4,y4,obj_p_fleet);
        flit.action_x=instance_nearest(x4,y4,obj_star).x;
        flit.action_y=instance_nearest(x4,y4,obj_star).y;
        if (flit.target.action!="") then flit.action_eta=flit.target.action_eta;
        // show_message(string(flit.action_eta));
        
        flit.sprite_index=spr_fleet_inquisition;
        flit.image_index=0;
        
        var roll, messi;
        mess="Inquisitor ";
        roll=floor(random(100))+1;
        
        if (roll<=60){flit.trade_goods="Inqis1";mess+=string(obj_controller.inquisitor[1]);}
        if (roll<=70) and (roll>60){flit.trade_goods="Inqis2";mess+=string(obj_controller.inquisitor[2]);}
        if (roll<=80) and (roll>70){flit.trade_goods="Inqis3";mess+=string(obj_controller.inquisitor[3]);}
        if (roll<=90) and (roll>80){flit.trade_goods="Inqis4";mess+=string(obj_controller.inquisitor[4]);}
        if (roll<=100) and (roll>90){flit.trade_goods="Inqis5";mess+=string(obj_controller.inquisitor[5]);}
        flit.trade_goods+="_fleet";
        
        obj=instance_nearest(x4,y4,obj_star);
        
        mess+=" wishes to inspect your fleet at "+string(obj.name);
        scr_alert("green","inspect",mess,obj.x,obj.y);
        if (instance_exists(obj_turn_end)) then obj_turn_end.alerts+=1;
        
        
        flit.alarm[4]=1;
        
        with(obj_temp4){instance_destroy();}
        with(obj_temp5){instance_destroy();}
        last_fleet_inspection=turn;
        
        
        // if (roll<=60)
        
    }
}

with(obj_temp6){instance_destroy();}




i=0;
repeat(10){
    i+=1;
    if (turns_ignored[i]=0) and (annoyed[i]>0) then annoyed[i]-=1;
}


i=0;
repeat(99){i+=1;
    if (event[i]!="") and (event_duration[i]>0){
        event_duration[i]-=1;
        if (event_duration[i]=0){
        
            if (event[i]="game_over_man") then obj_controller.alarm[8]=1;
            
            if (string_count("remove_serf",event[i])>0){
                var ta,tb,tc,pp;
                explode_script(event[i],"|");
                ta=string(explode[0]);tb=string(explode[1]);tc=real(explode[2]);
                obj_controller.temp[1007]=string(tb);
                with(obj_temp5){instance_destroy();}
                with(obj_star){if (name=obj_controller.temp[1007]) then instance_create(x,y,obj_temp5);}
                if (instance_exists(obj_temp5)){
                    pp=instance_nearest(obj_temp5.x,obj_temp5.y,obj_star);pp.dispo[tc]=-10;// Resets
                    var twix;twix="Inquisition executes Chapter Serf in control of "+string(tb)+" "+string(tc)+" and installs a new Planetary Governor.";
                    if (pp.p_owner[tc]=1) then pp.p_owner[tc]=pp.p_first[tc];
                    scr_alert("","",string(twix),0,0);scr_event_log("",string(twix));
                }
                with(obj_temp5){instance_destroy();}
            }
            
            if (event[i]="enemy_imperium"){scr_alert("green","enemy","You have made amends with your enemy in the Imperium.",0,0);disposition[2]+=20;scr_event_log("","Amends made with Imperium.");}
            if (event[i]="enemy_mechanicus"){scr_alert("green","enemy","You have made amends with your Mechanicus enemy.",0,0);disposition[3]+=20;scr_event_log("","Amends made with Mechanicus enemy.");}
            if (event[i]="enemy_inquisition"){scr_alert("green","enemy","You have made amends with your enemy in the Inquisition.",0,0);disposition[4]+=20;scr_event_log("","Amends made with Inquisition enemy.");}
            if (event[i]="enemy_ecclesiarchy"){scr_alert("green","enemy","You have made amends with your enemy in the Ecclesiarchy.",0,0);disposition[5]+=20;scr_event_log("","Amends made with Ecclesiarchy enemy.");}
            
            if (event[i]="imperium_daemon"){scr_alert("red","lol","Sector Commander "+string(faction_leader[2])+" has gone insane.",0,0);faction_defeated[2]=1;scr_event_log("red","Sector Commander "+string(faction_leader[2])+" has gone insane.");}
            
            if (event[i]="chaos_invasion"){
                // check if homeworld type fleet here
                // if (
                    var xx,yy,flee,dirr;xx=0;yy=0;flee=0;dirr=0;
                    scr_random_find(1,true,"","");
                    
                    if (instance_exists(obj_temp5)){
                        var tee;tee=instance_nearest(obj_temp5.x,obj_temp5.y,obj_star);
                        scr_event_log("purple","Chaos Fleets exit the warp near the "+string(tee.name)+" system.");
                        repeat(4){
                            dirr+=floor(random_range(50,100))+1;
                            xx=obj_temp5.x+lengthdir_x(72,dirr);yy=obj_temp5.y+lengthdir_y(72,dirr);
                            flee=instance_create(xx,yy,obj_en_fleet);flee.owner=10;
                            flee.sprite_index=spr_fleet_chaos;flee.image_index=4;
                            flee.capital_number=choose(0,1);flee.frigate_number=choose(2,3);flee.escort_number=choose(4,5,6);
                            flee.trade_goods="csm";obj_controller.chaos_fleets+=1;
                            flee.action_x=obj_temp5.x;flee.action_y=obj_temp5.y;flee.alarm[4]=1;
                        }
                    }
                    with(obj_temp5){instance_destroy();}
                // }
            }
            
            if (string_count("new_",event[i])>0){var fucking;fucking=event[i];
                // show_message(fucking);
                with(obj_temp5){instance_destroy();}
                with(obj_star){
                    if (owner=3){
                        if (p_type[1]="Forge") and (p_owner[1]=3) then instance_create(x,y,obj_temp5);
                        if (p_type[2]="Forge") and (p_owner[2]=3) then instance_create(x,y,obj_temp5);
                        if (p_type[3]="Forge") and (p_owner[3]=3) then instance_create(x,y,obj_temp5);
                        if (p_type[4]="Forge") and (p_owner[4]=3) then instance_create(x,y,obj_temp5);
                    }
                }
                if (instance_number(obj_temp5)>0){
                    var that,that2,flit;
                    that=instance_nearest(random(room_width),random(room_height),obj_temp5);
                    that2=instance_nearest(that.x,that.y,obj_star);
                    
                    flit=instance_create(that2.x+24,that2.y-24,obj_p_fleet);
                    
                    var new_name,ship_names,i,last_ship;
                    
                    i=0;ship_names="";new_name="";last_ship=0;
                    repeat(40){
                        i+=1;if (obj_ini.ship[i]!="") then ship_names+=string(obj_ini.ship[i]);
                        if (last_ship=0) and (obj_ini.ship[i]="") then last_ship=i;
                    }
                    
                    i=0;repeat(50){
                        if (new_name=""){
                            new_name=scr_ship_name("imperial");
                            if (string_count(new_name,ship_names)>0) then new_name="";
                        }
                    }
                    
                    obj_ini.ship[last_ship]=new_name;
                    obj_ini.ship_uid[last_ship]=floor(random(99999999))+1;
                    obj_ini.ship_owner[last_ship]=1;
                    obj_ini.ship_size[last_ship]=1;
                    obj_ini.ship_location[last_ship]=that2.name;
                    obj_ini.ship_leadership[last_ship]=100;
                    
                    // show_message(string(fucking));
                    
                    if (string_count("Battle Barge",fucking)>0){
                        obj_ini.ship_class[last_ship]="Battle Barge";
                        obj_ini.ship_size[last_ship]=3;
                        // show_message("A");
                        obj_ini.ship_hp[last_ship]=1200;obj_ini.ship_maxhp[last_ship]=1200;
                        obj_ini.ship_conditions[last_ship]="";obj_ini.ship_speed[last_ship]=20;obj_ini.ship_turning[last_ship]=45;
                        obj_ini.ship_front_armor[last_ship]=6;obj_ini.ship_other_armor[last_ship]=6;obj_ini.ship_weapons[last_ship]=5;obj_ini.ship_shields[last_ship]=12;
                        obj_ini.ship_wep[last_ship,1]="Weapons Battery";ship_wep_facing[last_ship,1]="left";obj_ini.ship_wep_condition[last_ship,1]="";
                        obj_ini.ship_wep[last_ship,2]="Weapons Battery";ship_wep_facing[last_ship,2]="right";obj_ini.ship_wep_condition[last_ship,2]="";
                        obj_ini.ship_wep[last_ship,3]="Thunderhawk Launch Bays";obj_ini.ship_wep_facing[last_ship,3]="special";obj_ini.ship_wep_condition[last_ship,3]="";
                        obj_ini.ship_wep[last_ship,4]="Torpedo Tubes";obj_ini.ship_wep_facing[last_ship,4]="front";obj_ini.ship_wep_condition[last_ship,4]="";
                        obj_ini.ship_wep[last_ship,5]="Bombardment Cannons";obj_ini.ship_wep_facing[last_ship,5]="most";obj_ini.ship_wep_condition[last_ship,5]="";
                        obj_ini.ship_capacity[last_ship]=600;obj_ini.ship_carrying[last_ship]=0;obj_ini.ship_contents[last_ship]="";
                        obj_ini.ship_turrets[last_ship]=3;// obj_ini.ship_names+=string(obj_ini.ship[last_ship])+"|";
                        flit.capital[1]=obj_ini.ship[last_ship];flit.capital_number=1;flit.capital_num[1]=last_ship;flit.capital_uid[1]=obj_ini.ship_uid[last_ship];
                    }
                    if (string_count("Strike Cruiser",fucking)>0){
                        obj_ini.ship_class[last_ship]="Strike Cruiser";
                        obj_ini.ship_size[last_ship]=2;
                        // show_message("B");
                        obj_ini.ship_hp[last_ship]=600;obj_ini.ship_maxhp[last_ship]=600;
                        obj_ini.ship_conditions[last_ship]="";obj_ini.ship_speed[last_ship]=25;obj_ini.ship_turning[last_ship]=90;
                        obj_ini.ship_front_armor[last_ship]=6;obj_ini.ship_other_armor[last_ship]=6;obj_ini.ship_weapons[last_ship]=4;obj_ini.ship_shields[last_ship]=6;
                        obj_ini.ship_wep[last_ship,1]="Weapons Battery";ship_wep_facing[last_ship,1]="left";obj_ini.ship_wep_condition[last_ship,1]="";
                        obj_ini.ship_wep[last_ship,2]="Weapons Battery";ship_wep_facing[last_ship,2]="right";obj_ini.ship_wep_condition[last_ship,2]="";
                        obj_ini.ship_wep[last_ship,3]="Thunderhawk Launch Bays";obj_ini.ship_wep_facing[last_ship,3]="special";obj_ini.ship_wep_condition[last_ship,3]="";
                        obj_ini.ship_wep[last_ship,4]="Bombardment Cannons";obj_ini.ship_wep_facing[last_ship,4]="most";obj_ini.ship_wep_condition[last_ship,4]="";
                        obj_ini.ship_capacity[last_ship]=250;obj_ini.ship_carrying[last_ship]=0;obj_ini.ship_contents[last_ship]="";
                        obj_ini.ship_turrets[last_ship]=1;// obj_ini.ship_names+=string(obj_ini.ship[last_ship])+"|";
                        flit.frigate[1]=obj_ini.ship[last_ship];flit.frigate_number=1;flit.frigate_num[1]=last_ship;flit.frigate_uid[1]=obj_ini.ship_uid[last_ship];
                    }
                    if (string_count("Gladius",fucking)>0){
                        obj_ini.ship_class[last_ship]="Gladius";
                        // show_message("C");
                        obj_ini.ship_hp[last_ship]=200;obj_ini.ship_maxhp[last_ship]=200;
                        obj_ini.ship_conditions[last_ship]="";obj_ini.ship_speed[last_ship]=30;obj_ini.ship_turning[last_ship]=90;
                        obj_ini.ship_front_armor[last_ship]=5;obj_ini.ship_other_armor[last_ship]=5;obj_ini.ship_weapons[last_ship]=1;obj_ini.ship_shields[last_ship]=1;
                        obj_ini.ship_wep[last_ship,1]="Weapons Battery";ship_wep_facing[last_ship,1]="most";obj_ini.ship_wep_condition[last_ship,1]="";
                        obj_ini.ship_capacity[last_ship]=30;obj_ini.ship_carrying[last_ship]=0;obj_ini.ship_contents[last_ship]="";
                        obj_ini.ship_turrets[last_ship]=1;// obj_ini.ship_names+=string(obj_ini.ship[last_ship])+"|";
                        flit.escort[1]=obj_ini.ship[last_ship];flit.escort_number=1;flit.escort_num[1]=last_ship;flit.escort_uid[1]=obj_ini.ship_uid[last_ship];
                    }
                    if (string_count("Hunter",fucking)>0){
                        obj_ini.ship_class[last_ship]="Hunter";
                        // show_message("D");
                        obj_ini.ship_hp[last_ship]=200;obj_ini.ship_maxhp[last_ship]=200;
                        obj_ini.ship_conditions[last_ship]="";obj_ini.ship_speed[last_ship]=30;obj_ini.ship_turning[last_ship]=90;
                        obj_ini.ship_front_armor[last_ship]=5;obj_ini.ship_other_armor[last_ship]=5;obj_ini.ship_weapons[last_ship]=2;obj_ini.ship_shields[last_ship]=1;
                        obj_ini.ship_wep[last_ship,1]="Torpedoes";ship_wep_facing[last_ship,1]="front";obj_ini.ship_wep_condition[last_ship,1]="";
                        obj_ini.ship_wep[last_ship,2]="Weapons Battery";ship_wep_facing[last_ship,2]="most";obj_ini.ship_wep_condition[last_ship,2]="";
                        obj_ini.ship_capacity[last_ship]=25;obj_ini.ship_carrying[last_ship]=0;obj_ini.ship_contents[last_ship]="";
                        obj_ini.ship_turrets[last_ship]=1;// obj_ini.ship_names+=string(obj_ini.ship[last_ship])+"|";
                        flit.escort[1]=obj_ini.ship[last_ship];flit.escort_number=1;flit.escort_num[1]=last_ship;flit.escort_uid[1]=obj_ini.ship_uid[last_ship];
                    }
                    
                    // show_message(string(obj_ini.ship_class[last_ship])+":"+string(obj_ini.ship[last_ship]));
                
                
                    if (instance_exists(that2)){
                        if (obj_ini.ship_size[last_ship]!=1) then scr_popup("Ship Constructed","Your new "+string(obj_ini.ship_class[last_ship])+" '"+string(obj_ini.ship[last_ship])+"' has finished being constructed.  It is orbiting "+string(that2.name)+" and awaits its maiden voyage.","shipyard","");
                        if (obj_ini.ship_size[last_ship]=1) then scr_popup("Ship Constructed","Your new "+string(obj_ini.ship_class[last_ship])+" Escort '"+string(obj_ini.ship[last_ship])+"' has finished being constructed.  It is orbiting "+string(that2.name)+" and awaits its maiden voyage.","shipyard","");
                        var bob;bob=instance_create(that2.x+16,that2.y-24,obj_star_event);bob.image_alpha=1;bob.image_speed=1; 
                    }
                }
                if (instance_number(obj_temp5)=0) then event_duration[i]=2;
                with(obj_temp5){instance_destroy();}
                event[i]="";event_duration[i]-=1;
            }
            
            
            if (string_count("inquisitor_spared",event[i])>0){
                var diceh;diceh=floor(random(100))+1;
                
                if (string_count("Shit",obj_ini.strin2)>0) then diceh-=25;
                
                if (diceh<=25){alarm[8]=1;scr_loyalty("Crossing the Inquisition","+");}
                if (diceh>25) and (diceh<=50){scr_loyalty("Crossing the Inquisition","+");}
                if (diceh>50) and (diceh<=85){}
                if (diceh>85) and (event[i]="inquisitor_spared2"){
                    scr_popup("Anonymous Message","You recieve an anonymous letter of thanks.  It mentions that motions are underway to destroy any local forces of Chaos.","","");
                    with(obj_star){var o;o=0;repeat(4){o+=1;p_heresy[o]=max(0,p_heresy[o]-10);}}
                }
            
            }
            
            
            if (string_count("strange_building",event[i])>0){
                var aa,bb,cc,dd,ee;
                aa="";bb="";cc=0;dd=0;ee="";
                explode_script(event[i],"|");
                aa=string(explode[0]);// event
                bb=string(explode[1]);// marine name
                cc=real(explode[2]);// company
                dd=real(explode[3]);// marine
                ee=string(explode[4]);// item
                
                var killy,tixt;killy=0;tixt=string(obj_ini.role[100,16])+" "+string(bb)+" has finished his work- ";
                
                if (ee="Icon"){tixt+="it is a "+string(global.chapter_name)+" Icon wrought in metal, finely decorated.  Pride for his chapter seems to have overtaken him.  There are no corrections to be made and the item is placed where many may view it.";}
                if (ee="Statue"){tixt+="it is a small, finely crafted statue wrought in metal.  The "+string(obj_ini.role[100,16])+" is scolded for the waste of material, but none daresay the quality of the piece.";}                
                if (ee="Bike"){scr_add_item("Bike",1);
                    tixt+="it is a finely crafted Bike, conforming mostly to STC standards.  The other "+string(obj_ini.role[100,16])+" are surprised at the rapid pace of his work.";
                }
                if (ee="Rhino"){scr_add_vehicle("Rhino",0,"Storm Bolter","Storm Bolter","","Dozer Blades");
                    tixt+="it is a finely crafted Rhino, conforming to STC standards.  The other "+string(obj_ini.role[100,16])+" are surprised at the rapid pace of his work.";
                }
                if (ee="Artifact"){
                    scr_event_log("",string(obj_ini.role[100,16])+" "+string(bb)+" constructs an Artifact.");
                    if (obj_ini.fleet_type=1) then scr_add_artifact("random_nodemon","",0,obj_ini.home_name,2);
                    if (obj_ini.fleet_type!=1) then scr_add_artifact("random_nodemon","",0,obj_ini.ship_location[1],501);
                    var k,last_artifact;k=0;last_artifact=0;
                    repeat(100){if (last_artifact=0){k+=1;if (obj_ini.artifact[k]="") then last_artifact=k-1;}}
                    tixt+="some form of divine inspiration has seemed to have taken hold of him.  An artifact "+string(obj_ini.artifact[k])+" has been crafted.";
                }
                if (ee="baby"){
                    obj_ini.chaos[cc,dd]+=choose(8,12,16,20);
                    tixt+="some form of horrendous statue.  A weird amalgram of limbs and tentacles, the sheer atrocity of it is made worse by the tiny, baby-like form, the once natural shape of a human child twisted nearly beyond recognition.";
                }
                if (ee="robot"){
                    obj_ini.chaos[cc,dd]+=choose(2,4,6,8,10);
                    tixt+="some form of small, box-like robot.  It seems to teeter around haphazardly, nearly falling over with each step.  "+string(bb)+" maintains that it has no AI, though the other "+string(obj_ini.role[100,16])+" express skepticism.";
                }
                if (ee="demon"){
                    obj_ini.chaos[cc,dd]+=choose(8,12,16,20);
                    tixt+="some form of horrendous statue.  What was meant to be some sort of angel, or primarch, instead has a mishappen face that is hardly human in nature.  Between the fetid, ragged feathers and empty sockets it is truly blasphemous.";
                }
                if (ee="fusion"){
                    // obj_ini.chaos[cc,dd]+=choose(70);
                    tixt+="some kind of ill-mannered ascension.  One of your battle-brothers enters the armamentarium to find "+string(bb)+" fused to a vehicle, his flesh twisted and submerged into the frame.  Mechendrites and weapons fire upon the marine without warning, a windy scream eminating from the abomination.  It takes several battle-brothers to take out what was once a "+string(obj_ini.role[100,16])+".";
                    
                    // This is causing the problem
                    
                    obj_ini.race[cc,dd]=0;obj_ini.loc[cc,dd]="";obj_ini.name[cc,dd]="";obj_ini.role[cc,dd]="";obj_ini.wep1[cc,dd]="";obj_ini.lid[cc,dd]=0;
                    obj_ini.wep2[cc,dd]="";obj_ini.armor[cc,dd]="";obj_ini.gear[cc,dd]="";obj_ini.hp[cc,dd]=100;obj_ini.chaos[cc,dd]=0;obj_ini.experience[cc,dd]=0;
                    obj_ini.mobi[cc,dd]="";obj_ini.age[cc,dd]=0;
                    with(obj_ini){scr_company_order(0);}
                }
                
                scr_popup("He Built It",tixt,"tech_build","target_marine|"+string(bb)+"|"+string(cc)+"|"+string(dd)+"|");
            }
            
            if (event_duration[i]<=0) then event[i]="";
        }
    }
}
i=0;
repeat(99){i+=1;
    if (event[i]!="") and (event_duration[i]<=0) then event[i]="";
    if (event[i]="") and (event_duration[i]=0) and (event[i+1]!=""){
        event[i]=event[i+1];
        event_duration[i]=event_duration[i+1];
        event[i+1]="";event_duration[i+1]=0;
    }
}


// Right here need to sort the battles within the obj_turn_end
with(obj_turn_end){scr_battle_sort();}

var i;i=0;
repeat(10){
    i+=1;
    if (turns_ignored[i]>0) and (turns_ignored[i]<500) then turns_ignored[i]-=1;
}
if (known[6]>=2) and (faction_gender[6]=2) and (floor(turn/10)=(turn/10)) then turns_ignored[6]+=floor(random_range(0,6));

with(obj_temp4){instance_destroy();}
if (instance_exists(obj_p_fleet)) then with(obj_p_fleet){scr_apothecary_ship();}// asgsdgasdgasdgdsag
scr_random_event(true);

// Random events here

if (hurssy_time>0) and (hurssy>0) then hurssy_time-=1;
if (hurssy_time=0) and (hurssy>0){hurssy_time=-1;hurssy=0;}
with(obj_p_fleet){
    if (hurssy_time>0) and (hurssy>0) then hurssy_time-=1;
    if (hurssy_time=0) and (hurssy>0){hurssy_time=-1;hurssy=0;}
}
with(obj_star){
    if (p_hurssy_time[1]>0) and (p_hurssy[1]>0) then p_hurssy_time[1]-=1;if (p_hurssy_time[1]=0) and (p_hurssy[1]>0){p_hurssy_time[1]=-1;p_hurssy[1]=0;}
    if (p_hurssy_time[2]>0) and (p_hurssy[2]>0) then p_hurssy_time[2]-=1;if (p_hurssy_time[2]=0) and (p_hurssy[2]>0){p_hurssy_time[2]=-1;p_hurssy[2]=0;}
    if (p_hurssy_time[3]>0) and (p_hurssy[3]>0) then p_hurssy_time[3]-=1;if (p_hurssy_time[3]=0) and (p_hurssy[3]>0){p_hurssy_time[3]=-1;p_hurssy[3]=0;}
    if (p_hurssy_time[4]>0) and (p_hurssy[4]>0) then p_hurssy_time[4]-=1;if (p_hurssy_time[4]=0) and (p_hurssy[4]>0){p_hurssy_time[4]=-1;p_hurssy[4]=0;}
}

if (turn=2){
    if (obj_ini.master_name="Zakis Randi") or (global.chapter_name="Knights Inductor") and (obj_controller.faction_status[2]!="War") then alarm[8]=1;
}






// Player-set events
if (fest_scheduled>0) and (fest_repeats>0){
    var cm_present,lock;cm_present=false;
    fest_repeats-=1;lock="";lock=scr_master_loc();
    
    if (fest_sid>0) and (obj_ini.ship[fest_sid]=lock) then cm_present=true;
    if (fest_wid>0) and (string(fest_star)+"."+string(fest_wid)=lock) then cm_present=true;
    
    if (cm_present=true){
        var imag;imag="";
        
        if (fest_type="Great Feast") then imag="event_feast";
        if (fest_type="Tournament") then imag="event_tournament";
        if (fest_type="Deathmatch") then imag="event_deathmatch";
        if (fest_type="Imperial Mass") then imag="event_mass";
        if (fest_type="Cult Sermon") then imag="event_ccult";
        if (fest_type="Chapter Relic") then imag="event_ccrelic";
        if (fest_type="Triumphal March") then imag="event_march";
        
        if (fest_wid>0) then scr_popup("Scheduled Event","Your "+string(fest_type)+" takes place on "+string(fest_star)+" "+scr_roman(fest_wid)+".  Would you like to spectate the event?",imag,"");
        if (fest_sid>0) then scr_popup("Scheduled Event","Your "+string(fest_type)+" takes place on the ship '"+string(obj_ini.ship[fest_sid])+".  Would you like to spectate the event?",imag,"");
    }
    
    // if (fest_repeats=0) then fest_scheduled=0;
}









// Income
if (income_controlled_planets>0){
    with(obj_turn_end){
        var a;a=90;
        repeat(90){a-=1;
            if (alert[a]!=0){
                alert[a+1]=alert[a];
                alert_type[a+1]=alert_type[a];
                alert_text[a+1]=alert_text[a];
                alert_char[a+1]=alert_char[a];
                alert_txt[a+1]=alert_color[a];
            }
        }
    }
    obj_turn_end.alert[1]=1;
    obj_turn_end.alert_type[1]="";
    obj_turn_end.alert_char[1]=0;
    obj_turn_end.alert_txt[1]="";
    obj_turn_end.alert_color[1]="yellow";
    obj_turn_end.alerts+=1;
        
    if (income_controlled_planets=1) then obj_turn_end.alert_text[1]="-"+string(income_tribute)+" Requisition granted by tithes from 1 planet.";
    if (income_controlled_planets>1) then obj_turn_end.alert_text[1]="-"+string(income_tribute)+" Requisition granted by tithes from "+string(income_controlled_planets)+" planets.";
}

instance_activate_object(obj_p_fleet);

with(obj_star){if (x<-10000){x+=20000;y+=20000;}};



/* */
/*  */
