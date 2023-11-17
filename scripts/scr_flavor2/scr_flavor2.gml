function scr_flavor2(argument0, argument1) {

	// argument0: total_lost
	// argument1: "wall" or ""

	// Generates flavor based on the damage and casualties from scr_shoot, only for the opponent

	if (obj_ncombat.wall_destroyed=1) then exit;

	var m1,m2,m3;
	m1="";m2="";m3="";

	var j1,j2,j3,j4,j5;
	j1="your men";
	j2="your ranks";
	j3="your marines";
	j4="your formation";
	j5="your vehicles";



	// show_message(enemy.dudes[1]);

	/*if (enemy.dreads>0) and (enemy.men=0) and (enemy.veh=0){
	    j1="your "+string(obj_ini.role[100][6])+"s";
	    j2="your "+string(obj_ini.role[100][6])+"s";
	    j3="your "+string(obj_ini.role[100][6])+"s";
	    j5="your "+string(obj_ini.role[100][6])+"s";
	}*/


	var hr,hw,hs;
	hr=0;hw="";hs=0;

	if (argument1!="wall"){
	    hr=hostile_range;
	    hw=hostile_weapon;
	    hs=hostile_shots;
	}



	if (argument1="wall") and (instance_exists(obj_nfort)){
	    var hehh;
	    hehh="the fortification";
    
	    j1=hehh;
	    j2=hehh;
	    j3=hehh;
	    j4=hehh;
	    j5=hehh;
    
	    hr=999;
	    hw=obj_nfort.hostile_weapon;
	    hs=obj_nfort.hostile_shots;
	}


	if (hw="Fleshborer") then hs=hs*10;
	if (hostile_splash=1) then hs=max(1,round(hs/3));

	// show_message(string(hostile_weapon)+"|"+string(hw)+"#"+string(los)+"#"+string(los_num));

	var flavor;flavor=0;


	/*
	if (argument0="Venom Claws"){atta=200;arp=0;rang=1;spli=0;if (obj_ini.preomnor=1){atta=240;}}
	if (argument0="Web Spinner"){atta=40;arp=0;rang=2.1;spli=1;amm=1;}
	if (argument0="Warpsword"){atta=300;arp=200;rang=1;spli=1;}
	if (argument0="Iron Claw"){atta=300;arp=400;rang=1;spli=0;}
	if (argument0="Maulerfiend Claws"){atta=300;arp=300;rang=1;spli=1;}

	if (argument0="Eldritch Fire"){atta=80;arp=40;rang=5.1;}
	if (argument0="Khorne Demon Melee"){atta=350;arp=400;rang=1;spli=1;}
	if (argument0="Demon Melee"){atta=250;arp=300;rang=1;spli=1;}
	if (argument0="Lash Whip"){atta=80;arp=0;rang=2;}
	*/

	if (hw="Daemonette Melee"){flavor=1;
	    if (hs>1) then m1=string(hs)+" Daemonettes rake and claw at "+string(j1)+".  ";
	    if (hs=1) then m1="A Daemonette rakes and claws at "+string(j1)+".  ";
	}
	if (hw="Plaguebearer Melee"){flavor=1;
	    if (hs>1) then m1=string(hs)+" Plague Swords slash into "+string(j1)+".  ";
	    if (hs=1) then m1="A Plaguesword is swung into "+string(j1)+".  ";
	}
	if (hw="Bloodletter Melee"){flavor=1;
	    if (hs>1) then m1=string(hs)+" Hellblades hiss and slash into "+string(j1)+".  ";
	    if (hs=1) then m1="A Bloodletter swings a Hellblade into "+string(j1)+".  ";
	}
	if (hw="Nurgle Vomit"){flavor=1;
	    if (hs>1) then m1=string(hs)+" putrid, corrosive streams of Daemonic vomit spew into "+string(j1)+".  ";
	    if (hs=1) then m1="A putrid, corrosive stream of Daemonic vomit spews into "+string(j1)+".  ";
	}
	if (hw="Maulerfiend Claws"){flavor=1;
	    if (hs>1) then m1=string(hs)+" Maulerfiends advance, wrenching and smashing their claws into "+string(j1)+".  ";
	    if (hs=1) then m1="A Maulerfiend advances, wrenching and smashing its claws into "+string(j1)+".  ";
	}


	if (hostile_range>1){
	    if (hw="Big Shoota"){m1=string(hs)+" "+string(hw)+"z roar and blast away at "+string(j1)+".  ";flavor=1;}
	    if (hw="Dakkagun"){m1=string(hs)+" "+string(hw)+"z scream and rattle, blasting into "+string(j2)+".  ";flavor=1;}
	    if (hw="Deffgun"){m1=string(hs)+" "+string(hw)+"z scream and rattle, blasting into "+string(j2)+".  ";flavor=1;}
	    if (hw="Snazzgun"){m1=string(hs)+" "+string(hw)+"z scream and rattle, blasting into "+string(j2)+".  ";flavor=1;}
	    if (hw="Grot Blasta"){m1="The Gretchin fire their shoddy weapons and club at your "+string(j3)+".  ";flavor=1;}
	    if (hw="Kannon"){flavor=1;
	        if (hs>1) then m1=string(hs)+" "+string(hw)+"z belch out large caliber shells.  ";
	        if (hs=1) then m1="A "+string(hw)+"z belches out a large caliber shell.  ";
	    }
	    if (hw="Shoota"){flavor=1;
	        var ranz;ranz=choose(1,2,3,4);
	        if (ranz=1) then m1=string(hs)+" "+string(hw)+"z fire away at "+string(j3)+".  ";
	        if (ranz=2) then m1=string(hs)+" "+string(hw)+"z spit lead at "+string(j3)+".  ";
	        if (ranz=3) then m1=string(hs)+" "+string(hw)+"z blast at "+string(j3)+".  ";
	        if (ranz=4) then m1=string(hs)+" "+string(hw)+"z roar and fire at "+string(j3)+".  ";
	    }
	    if (hw="Burna"){m1=string(hs)+" "+string(hw)+"z spray napalm into "+string(j3)+".  ";flavor=1;}
	    if (hw="Skorcha"){m1=string(hs)+" "+string(hw)+"z spray huge gouts of napalm into "+string(j3)+".  ";flavor=1;}
	    if (hw="Rokkit Launcha"){flavor=1;
	        var ranz;ranz=choose(1,2,2,3,3);
	        if (ranz=1) then m1=string(hs)+" rokkitz shoot at "+string(j4)+", the explosions disrupting.  ";
	        if (ranz=2) then m1=string(hs)+" rokkitz scream upward and then fall upon "+string(j4)+".  ";
	        if (ranz=3) then m1=string(hs)+" "+string(hw)+"z roar and fire their payloads.  ";
	    }
    
    
	    if (hw="Staff of Light Shooting") and (hs=1){m1="A Staff of Light crackles with energy and fires upon "+string(j1)+".  ";flavor=1;}
	    if (hw="Staff of Light Shooting") and (hs>1){m1=string(hs)+" Staves of Light crackle with energy and fire upon "+string(j1)+".  ";flavor=1;}
	    if (hw="Gauss Flayer") or (hw="Gauss Blaster") or (hw="Gauss Flayer Array"){flavor=1;
	        var ranz;ranz=choose(1,2,3,4);
	        if (ranz=1) then m1=string(hs)+" "+string(hw)+"s shoot at "+string(j3)+".  ";
	        if (ranz=2) then m1=string(hs)+" "+string(hw)+"s crackle and fire at "+string(j3)+".  ";
	        if (ranz=3) then m1=string(hs)+" "+string(hw)+"s discharge upon "+string(j3)+".  ";
	        if (ranz=4) then m1=string(hs)+" "+string(hw)+"s spew green energy at "+string(j3)+".  ";
	    }
	    if (hw="Gauss Cannon") or (hw="Overcharged Gauss Cannon") or (hw="Gauss Flux Arc"){flavor=1;
	        var ranz;ranz=choose(1,2,3);
	        if (ranz=1) then m1=string(hs)+" "+string(hw)+"s charge and then blast at "+string(j3)+".  ";
	        if (ranz=2) then m1=string(hs)+" "+string(hw)+"s crackle with a sick amount of energy before firing at "+string(j3)+".  ";
	        if (ranz=3) then m1=string(hs)+" "+string(hw)+"s pulse with energy and then discharge upon "+string(j3)+".  ";
	    }
	    if (hw="Gauss Particle Cannon"){flavor=1;
	        m1=string(hs)+" "+string(hw)+"s shine a sick green, pulsing with energy, and then blast solid beams of energy into "+string(j3)+".  ";
	    }
	    if (hw="Particle Whip"){flavor=1;
	        if (hs=1) then m1="The apex of the Monolith pulses with energy.  An instant layer it fires, the solid beam of energy crashing into "+string(j3)+".  ";
	        if (hs>1) then m1="The apex of "+string(hs)+" Monoliths pulse with energy.  An instant later they fire, the solid beams of energy crashing into "+string(j3)+".  ";
	    }
	    if (hw="Doomsday Cannon"){flavor=1;
	        if (hs=1) then m1="A Doomsday Arc crackles with energy and then fires.  The resulting blast is blinding in intensity, the ground shaking before its might.  ";
	        if (hs>1) then m1=string(hs)+" Doomsday Arcs crackle with energy and then fire.  The resulting blasts are blinding in intensity, the ground shaking.  ";
	    }
    
	    if (hw="Eldritch Fire"){flavor=1;
	        if (hs=1) then m1="A Pink Horror spits out a globlet of bright energy.  The bolt smashes into "+string(j3)+".  ";
	        if (hs>1) then m1=string(hs)+" Pink Horrors spit and throw bolts of warp energy into "+string(j3)+".  ";
	    }
	}


	if (hs>0){
	    if (hw="Choppa"){m1=string(hs)+" "+string(hw)+"z cleave into "+string(j2)+".  ";flavor=1;}
	    if (hw="Power Klaw"){m1=string(hs)+" "+string(hw)+"z rip and tear at "+string(j4)+".  ";flavor=1;}
	    if (hw="Venom Claws"){
	        if (hs>1) then m1=string(hs)+" "+string(hw)+" rake at "+string(j4)+".  ";flavor=1;
	        if (hs=1) then m1="The Spyrer rakes at "+string(j4)+" with his "+string(hw)+".  ";flavor=1;
	    }
	    if (hw="Slugga"){flavor=1;
	        var ranz;ranz=choose(1,2,3,4);
	        if (ranz=1) then m1=string(hs)+" "+string(hw)+"z fire away at "+string(j3)+".  ";
	        if (ranz=2) then m1=string(hs)+" "+string(hw)+"z spit lead at "+string(j3)+".  ";
	        if (ranz=3) then m1=string(hs)+" "+string(hw)+"z blast at "+string(j3)+".  ";
	        if (ranz=4) then m1=string(hs)+" "+string(hw)+"z roar and fire at "+string(j3)+".  ";
	    }
	    if (hw="Tankbusta Bomb"){flavor=1;
	        var ranz;ranz=choose(1,2,3);
	        if (ranz=1) then m1=string(hs)+" "+string(hw)+"z are attached to "+string(j5)+".  ";
	        if (ranz=2) then m1=string(hs)+" "+string(hw)+"z are clamped onto "+string(j5)+".  ";
	        if (ranz=3) then m1=string(hs)+" "+string(hw)+"z are flung into "+string(j2)+".  ";
	    }
	    if (hw="Melee1") and (enemy=7){flavor=1;
	        var ranz;ranz=choose(1,2,3);
	        if (ranz=1) then m1=string(hs)+" Orks club and smash at "+string(j3)+".  ";
	        if (ranz=2) then m1=string(hs)+" Orks shoot their Slugas and smash gunbarrels into "+string(j2)+".  ";
	        if (ranz=3) then m1=string(hs)+" Orks claw and punch at "+string(j3)+".  ";
	    }
    
	    if (hw="Staff of Light"){flavor=1;
	        if (hs=1){
	            var ranz;ranz=choose(1,2,3);
	            if (ranz=1) then m1="A "+string(hw)+" crackles and is swung into "+string(j3)+".  ";
	            if (ranz=2) then m1="A "+string(hw)+" pulses and smashes through "+string(j3)+".  ";
	            if (ranz=3) then m1="A "+string(hw)+" crackles and smashes into "+string(j3)+".  ";
	        }
	        if (hs>1){
	            var ranz;ranz=choose(1,2,3);
	            if (ranz=1) then m1=string(hs)+" Staves of Light strike at "+string(j3)+".  ";
	            if (ranz=2) then m1=string(hs)+" Staves of Light smash at "+string(j3)+".  ";
	            if (ranz=3) then m1=string(hs)+" Staves of Light swing into "+string(j3)+".  ";
	        }
	    }
	    if (hw="Warscythe"){flavor=1;
	        var ranz;ranz=choose(1,2,3);
	        if (ranz=1) then m1=string(hs)+" Warscythes strike at "+string(j3)+".  ";
	        if (ranz=2) then m1=string(hs)+" Warscythes of Light slice into "+string(j3)+".  ";
	        if (ranz=3) then m1=string(hs)+" Warscythes of Light hew "+string(j3)+".  ";
	    }
	    if (hw="Claws"){flavor=1;
	        if (hs=1){
	            var ranz;ranz=choose(1,2,3);
	            if (ranz=1) then m1="A massive claw slices through "+string(j3)+".  ";
	            if (ranz=2) then m1="A razor-sharp claw slashes into "+string(j3)+".  ";
	            if (ranz=3) then m1="A large necron claw strikes at "+string(j3)+".  ";
	        }
	        if (hs>1){
	            var ranz;ranz=choose(1,2,3);
	            if (ranz=1) then m1=string(hs)+" massive claws strike and slice at "+string(j3)+".  ";
	            if (ranz=2) then m1=string(hs)+" razor-sharp claws assault "+string(j3)+".  ";
	            if (ranz=3) then m1=string(hs)+" large necron claws strike at and shred "+string(j3)+".  ";
	        }
	    }
    
    
	}


	if (flavor=0) then m1=string(hs)+"|"+string(hw)+"|";

	// show_message(mes);

	// m2="Blah blah blah";


	if (argument1="wall"){
	    mes=m1+m2+m3;

	    if (string_length(mes)>3){
	        obj_ncombat.messages+=1;
	        obj_ncombat.message[obj_ncombat.messages]=mes;    
	        obj_ncombat.message_sz[obj_ncombat.messages]=obj_nfort.hostile_damage;
	        obj_ncombat.message_priority[obj_ncombat.messages]=0;
	        obj_ncombat.alarm[3]=2;
	    }
	    if (obj_nfort.hp[1]<=0){
	        s=0;him=0;
	        obj_ncombat.dead_jims+=1;
	        obj_ncombat.dead_jim[obj_ncombat.dead_jims]="The fortified wall has been breached!";
	        obj_ncombat.wall_destroyed=1;
	        with(obj_nfort){instance_destroy();}
	    }
	    exit;
	}


	var w;w=0;var s,him;
	repeat(20){
	    w+=1;
    
	    if (lost[w]!="") and (lost_num[w]>0){
	        var speshul;speshul=0;
	        if (lost[w]="Chapter Master") then speshul=1;
	        if (lost[w]="Chief "+string(obj_ini.role[100,17])) then speshul=1;
	        if (lost[w]="Forge Master") then speshul=1;
	        if (lost[w]="Master of Sanctity") then speshul=1;
	        if (lost[w]="Master of the Apothecarion") then speshul=1;
	        if (lost[w]="Venerable "+string(obj_ini.role[100][6])) then speshul=1;
	        if (lost[w]=obj_ini.role[100][5]) then speshul=1;
        
	        if (obj_ncombat.player_max<=6) then speshul=1;
        
	        // if (speshul=1) then show_message("Lost "+string(lost[w]));
        
	        if (speshul=0){
	            m2+=string(lost_num[w])+" "+string(lost[w]);
	            if (lost_num[w]>1) then m2+="s";
	            m2+=", ";
	        }        
	        if (speshul=1){
	            s=0;him=0;// Find which dude this is
	            repeat(100){s+=1;// was 700
	                // show_message("["+string(s)+"]"+string(marine_type[s])+" = ["+string(w)+"]"+string(lost[w])+"?");
	                if (marine_type[s]=lost[w]) and (marine_hp[s]<=0) and (him=0){
	                    him=s;// show_message(string(marine_type[s])+"=="+string(lost[w]));
	                }
	            }
	            if (him!=0){obj_ncombat.dead_jims+=1;
	                if (marine_type[him]=obj_ini.role[100][5]) then obj_ncombat.dead_jim[obj_ncombat.dead_jims]="A "+string(marine_type[him])+" has been critically injured!";
	                if (marine_type[him]!=obj_ini.role[100][5]){
	                    obj_ncombat.dead_jim[obj_ncombat.dead_jims]=string(marine_type[him])+" "+string(obj_ini.name[marine_co[him],marine_id[him]])+" has been critically injured!";
	                    // show_message(string(obj_ncombat.dead_jim[obj_ncombat.dead_jims]));
	                }
	            }
            
	        }
	    }
	}


	var unce;unce=0;


	if (string_count(", ",m2)>1){
    
	    // show_message(m2);
    
	    var lis,y1,y2;
	    lis=string_rpos(", ",m2);
	    m2=string_delete(m2,lis,3);// This clears the last ', ' and replaces it with the end statement
	    if (argument0>1) then m2+=" have been lost.";
    
	    // show_message(m2);
    
	    lis=string_rpos(", ",m2);// Find the new last ', ' and replace it with the and part
	    m2=string_delete(m2,lis,2);
    
	    // show_message(m2);
    
	    if (string_count(",",m2)>1) then m2=string_insert(", and ",m2,lis);
	    if (string_count(",",m2)=0) then m2=string_insert(" and ",m2,lis);
    
	    // show_message(m2);
    
	    unce=1;
	}

	if (string_count(", ",m2)=1) and (unce=0) and (hostile_weapon!="Web Spinner"){
	    var lis,y1,y2;lis=string_rpos(", ",m2);m2=string_delete(m2,lis,3);
	    if (argument0>1) then m2+=" have been lost.";
	    if (argument0=1) then m2+=" has been lost.";
	}
	if (string_count(", ",m2)=1) and (unce=0) and (hostile_weapon="Web Spinner"){
	    var lis,y1,y2;lis=string_rpos(", ",m2);m2=string_delete(m2,lis,3);
	    if (argument0>1) then m2+=" have been incapitated.";
	    if (argument0=1) then m2+=" has been incapitated.";
	}




	i=0;
	repeat(60){i+=1;
	    lost[i]="";
	    lost_num[i]=0;
	}


	mes=m1+m2+m3;
	// show_message(mes);

	if (string_length(mes)>3){
	    obj_ncombat.messages+=1;
	    obj_ncombat.message[obj_ncombat.messages]=mes;    
	    obj_ncombat.message_sz[obj_ncombat.messages]=argument0+(0.5-(obj_ncombat.messages/100));
	    obj_ncombat.message_priority[obj_ncombat.messages]=0;
	    obj_ncombat.alarm[3]=2;
	}


}
