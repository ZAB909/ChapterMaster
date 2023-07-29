function scr_enemy_ai_b() {

	// Imperial Repleneshes numbers
	// If no enemies and guard < pop /470 then increase guardsman
	// If no enemies and population < max_pop then increase by like 1%
	var rando, contin, i;
	rando=0;contin=0;i=0;


	i=0;
	repeat(4){
	    i+=1;
	    if (p_population[i]<p_max_population[i]) and (planets<=i) and (p_type[i]!="Dead") and (p_type[i]!="Craftworld") and (p_traitors[i]=0) and (p_tau[i]=0) and (p_orks[i]=0) and (p_necrons[i]=0) and (p_tyranids[i]=0) and (p_owner[i]<=5){
	        if (p_large[i]=0) then p_population[i]=round(p_population[i]*1.0008);
	        if (p_large[i]=1) then p_population[i]+=choose(0,0.01);
	    }
    
	    if (array_length(p_feature[i])!=0){var nfleet,nforce;nforce=0;nfleet=0;
	        if (awake_tomb_world(p_feature[i])==1) then nforce=1;
	        if (nforce=1) and (p_necrons[i]<6) then p_necrons[i]+=1;
	        if (nforce=1) and (p_necrons[i]<3) then p_necrons[i]+=1;
        
        
	        if (nforce=1){// Necron fleets, woooo
	            if (p_population[i]>0) and (p_player[i]+p_pdf[i]+p_guardsmen[i]+p_tyranids[i]=0){
	                p_population[i]=p_population[i]*0.75;
	                if (p_large[i]=0) and (p_population[i]<=5000) then p_population[i]=0;
	            }
            
	            var rob,onceh;rob=floor(random(100))+1;onceh=0;
	            if (obj_ini.dis[1]="Shitty Luck") or (obj_ini.dis[2]="Shitty Luck") then rob-=5;
	            if (obj_ini.dis[3]="Shitty Luck") or (obj_ini.dis[4]="Shitty Luck") then rob-=5;
            
	            if (rob<=15){
	                if (present_fleet[13]>0){
	                    nforce=instance_nearest(x+32,y+32,obj_en_fleet);
	                    if (nforce.owner=13){
	                        if (nforce.escort_number<nforce.capital_number*3) and (onceh=0){onceh=1;nforce.escort_number+=2;}
	                        if (nforce.frigate_number<nforce.capital_number*1.5) and (onceh=0){onceh=1;nforce.frigate_number+=1;}
	                        if (onceh=0) then nforce.capital_number+=1;
	                    }
	                }
	                if (present_fleet[13]=0){
	                    nforce=instance_create(x+32,y+32,obj_en_fleet);
	                    nforce.owner=13;nforce.capital_number=1;
	                    nforce.sprite_index=spr_fleet_necron;nforce.image_speed=0;
	                    nforce.image_index=1;present_fleet[13]+=1;
	                }
                
	                with(nforce){
	                    if (owner=13){
	                        var ii;ii=0;ii+=capital_number;ii+=round((frigate_number/2));ii+=round((escort_number/4));
	                        if (ii<=1) then ii=1;// image_index=max(8,round(ii));
                        
	                        if (ii>=7) and (capital_number>1){
	                            var g;g=0;
	                            if (orbiting.present_fleet[1]>0) then g+=1;
	                            if (orbiting.present_fleet[2]>0) then g+=1;
	                            if (orbiting.present_fleet[6]>0) then g+=1;
	                            if (orbiting.present_fleet[7]>0) then g+=1;
	                            if (orbiting.present_fleet[8]>0) then g+=1;
	                            if (orbiting.present_fleet[9]>0) then g+=1;
	                            if (orbiting.present_fleet[10]>0) then g+=1;
                            
	                            with(obj_temp6){instance_destroy();}
	                            if (g=0) then instance_create(x,y,obj_temp6);
	                        }
	                    }
	                }
                
	                if (instance_exists(obj_temp6)){
	                    with(obj_temp6){instance_destroy();}
	                    with(obj_temp5){instance_destroy();}
                    
	                    var nforce2;
	                    nforce2=instance_create(x+32,y+32,obj_en_fleet);
	                    nforce2.owner=13;nforce2.sprite_index=spr_fleet_necron;
	                    // nforce2.image_index=0;
	                    nforce.image_speed=0;
	                    nforce2.capital_number=1;
	                    nforce2.frigate_number=round(nforce.frigate_number/2);
	                    nforce2.escort_number=round(nforce.escort_number/2);
	                    present_fleet[13]+=1;
                    
	                    nforce.capital_number-=1;
	                    nforce.frigate_number-=nforce2.frigate_number;
	                    nforce.escort_number-=nforce2.escort_number;
                    
	                    with(obj_star){
	                        if (present_fleet[13]=0){
	                            if (p_owner[1]<=5) and (p_type[1]!="Dead") then instance_create(x,y,obj_temp5);
	                            if (p_owner[2]<=5) and (p_type[2]!="Dead") then instance_create(x,y,obj_temp5);
	                            if (p_owner[3]<=5) and (p_type[3]!="Dead") then instance_create(x,y,obj_temp5);
	                            if (p_owner[4]<=5) and (p_type[4]!="Dead") then instance_create(x,y,obj_temp5);
	                        }
	                    }
                    
	                    if (instance_exists(obj_temp5)){
	                        var tgt1,tgt2;
	                        tgt1=instance_nearest(x,y,obj_temp5);
                        
	                        if (instance_exists(tgt1)){
	                            tgt2=instance_nearest(tgt1.x,tgt1.y,obj_star);
	                            nforce2.action_x=tgt2.x;nforce2.action_y=tgt2.y;
	                            nforce2.alarm[4]=1;
	                        }
	                    }
	                    with(obj_temp6){instance_destroy();}
	                    with(obj_temp5){instance_destroy();}
	                }
	                with(obj_temp6){instance_destroy();}
	                with(obj_temp5){instance_destroy();}
	            }
            
	        }
	    }
	}






	// Orks grow in number
	repeat(4){i+=1;rando=floor(random(100))+1;contin=0;// This part handles the increasing in numbers
	    if (p_owner[i]=7) and (p_orks[i]<5) and (p_traitors[i]=0) and (p_player[i]<=0){
	        if (p_orks[i]=1) and (rando<=15) and (contin=0){p_orks[i]+=1;contin=1;}
	        if (p_orks[i]=2) and (rando<=15) and (contin=0){p_orks[i]+=1;contin=1;}
	        if (p_orks[i]=3) and (rando<=15) and (contin=0){p_orks[i]+=1;contin=1;}
	        if (p_orks[i]=4) and (rando<=15) and (contin=0){p_orks[i]+=1;contin=1;}
	    }
	}





	// traitors cults
	i=0;
	repeat(4){
	    var notixt;notixt=false;i+=1;
	    rando=floor(random(100))+1;
	    if (p_owner[i]=10) and (p_heresy[i]<80) then p_heresy[i]+=1;
    
	    if (p_owner[i]!=10) and (p_owner[i]!=6) and (planets>=i) and (p_type[i]!="Dead") and (p_type[i]!="Craftworld"){contin=0;
	        if (p_heresy[i]+p_heresy_secret[i]>=25) and (rando<=3) and (p_owner[i]!=7) then contin=1;
	        if (p_heresy[i]+p_heresy_secret[i]>=50) and (rando<=10) and (p_owner[i]!=7) then contin=1;
	        if (p_heresy[i]+p_heresy_secret[i]>=70) and (rando<=25) and (p_owner[i]!=7) then contin=1;
	        if (p_heresy[i]+p_heresy_secret[i]>=90) and (rando<=40) and (p_owner[i]!=7) then contin=1;
        
	        if (contin>0) and (p_pdf[i]=0) and (p_guardsmen[i]=0) and (p_tau[i]=0) and (p_orks[i]=0){p_owner[i]=10;
	            scr_alert("red","owner",string(name)+" "+string(i)+" has fallen to heretics!",x,y);
	        }
        
	        if (contin>0) and (p_type[i]!="Space Hulk"){
	            rando=floor(random(100))+1;
	            // // // obj_controller.x=self.x;obj_controller.y=self.y;
	            var tixt;tixt="";
            
	            if (rando<=40){
	                var lost;lost=0;lost=floor(p_pdf[i]*choose(0.05,0.1,0.15,0.2));
	                if (p_pdf[i]<=500){lost=p_pdf[i];p_traitors[i]=1;}
	                p_pdf[i]-=lost;
	                if (p_traitors[i]=0){
	                    if (p_pdf[i]>0) then tixt=string(scr_display_number(lost))+" PDF killed in a rebelion on "+string(name)+" "+string(i)+"."
	                    if (p_pdf[i]=0) then tixt="Heretic cults have appeared in "+string(name)+" "+string(i)+".";
	                    scr_alert("purple","owner",tixt,x,y);scr_event_log("purple",tixt);
	                }
	            // Cult crushed; don't bother showing if there's already fighting going on over there
	            }
            
	            if (rando>=41) and (rando<81) and (p_traitors[i]<1){p_traitors[i]=2;tixt="Heretic cults have appeared in "+string(name)+" "+string(i)+".";}// Minor uprising
	            if (rando>=81) and (rando<91) and (p_traitors[i]<3){p_traitors[i]=3;tixt="Heretic cults have spread around "+string(name)+" "+string(i)+".";}// Major uprising
	            if (rando>=91) and (rando<100) and (p_traitors[i]<4){notixt=true;
	                p_traitors[i]=4;if (obj_controller.faction_defeated[10]=0) and (obj_controller.faction_gender[10]=1) then p_traitors[i]=5;
	                scr_popup("Heretic Revolt","A massive heretic uprising on "+string(name)+" "+scr_roman(i)+" threatens to plunge the star system into chaos.","chaos_cultist","");
	                scr_alert("red","owner","Massive heretic uprising on "+string(name)+" "+scr_roman(i)+".",x,y);
	                scr_event_log("purple","Massive heretic uprising on "+string(name)+" "+scr_roman(i)+".");
	            }// Huge uprising
	            if (rando>=100) and (p_traitors[i]<5){
	                p_traitors[i]=6;p_owner[i]=10;array_push(p_feature[i], new new_planet_feature(P_features.Daemonic_Incursion));
	                if (p_heresy[i]>=80) then p_heresy[i]=95;
	                if (p_heresy[i]<80) then p_heresy[i]=80;
	                tixt="Daemonic incursion on "+string(name)+" "+string(i)+"!";
	            }// Oh god what
            
	            if (rando>=41) and (notixt=false){
	                scr_alert("red","owner",tixt,x,y);scr_event_log("purple",tixt);
	            }
            
	            // if (p_traitors[i]>2){obj_controller.x=self.x;obj_controller.y=self.y;}
            
	        }
	    }
	}// End traitors cults



	i=0;
	repeat(4){// Spread influence on controlled sector
	    i+=1;
	    if (p_heresy[i]<70) and (owner=10) and (p_type[i]!="Space Hulk") and (p_type[i]!="Dead") then p_heresy[i]+=2;
	    if (p_heresy[i]<70) and (owner=8) and (p_type[i]!="Space Hulk") and (p_type[i]!="Dead"){
	        var doggy;doggy=floor(random(100))+1;
	        if (doggy<=5) and (p_heresy[i]>=20) then p_heresy[i]+=1;
	    }
    
	    if (p_type[i]="Daemon") and (p_type[i]!="Space Hulk"){
	        if (p_pdf[i]>0) then p_pdf[i]=0;
	        if (p_guardsmen[i]>0) then p_guardsmen[i]=0;
	    }
	    // if (p_heresy[i]>0) and (owner!=10) then p_heresy[i]-=2;
	}






	// Tau rebellions
	if (present_fleet[8]>=1) and (owner!=8){
	    var flit, siz, ran1, ran2, ran3;
	    flit=instance_nearest(x-24,y-24,obj_en_fleet);
	    ran1=0;ran2=floor(random(planets))+1;
    
    
	    if (flit.owner=8){
	        ran1=floor(random(100))+1;
        
	        if (flit.image_index=1) and (ran1<=90){
	            if (p_type[ran2]!="Dead") and (p_influence[ran2]<90) then p_influence[ran2]+=choose(2,3);
	            if (p_type[ran2]="Forge") and (p_influence[ran2]>=3) then p_influence[ran2]-=3;
	        }
	        if (flit.image_index>1) and (flit.image_index<4) and (ran1<=90){
	            if (p_type[ran2]!="Dead") and (p_influence[ran2]<90) then p_influence[ran2]+=choose(7,9,11,13);
	            if (p_type[ran2]="Forge") and (p_influence[ran2]>=10) then p_influence[ran2]-=10;
	        }
	        if (flit.image_index>=4){
	            if (p_type[ran2]!="Dead") and (p_influence[ran2]<90) then p_influence[ran2]+=choose(9,11,13,15,17);
	            if (p_type[ran2]="Forge") and (p_influence[ran2]>=13) then p_influence[ran2]-=13;
	        }
	        if (p_type[ran2]="Lava") and (p_influence[ran2]<90) then p_influence[ran2]+=10;
	    }
    
    
	    var i;i=0;
	    repeat(4){i+=1;
	        ran3=floor(random(100))+1;
        
	        if (i<=planets) and (p_influence[i]>=70) and (p_owner[i]!=8) and (p_owner[i]!=10) and (p_owner[i]!=7) and (p_owner[i]!=9) and (p_type[i]!="Space Hulk"){
	            if (p_owner[1]=8) then ran3+=5;if (p_owner[2]=8) then ran3+=5;if (p_owner[3]=8) then ran3+=5;if (p_owner[4]=8) then ran3+=5;
	            if (flit.owner=8){ran3+=(flit.image_index*5)-5;}
            
            
	            if (ran3>=95){/*obj_controller.x=self.x;obj_controller.y=self.y;show_message(string(ran3)+" |"+string(p_orks[i])+"|"+string(p_traitors[i]));*/}
            
	            if (ran3>=95) and (p_orks[i]=0) and (p_traitors[i]=0) and (p_necrons[i]=0) and (p_demons[i]=0) and (p_chaos[i]=0){
	                p_owner[i]=8;
	                if (p_guardsmen[i]>0){p_pdf[i]+=p_guardsmen[i];p_guardsmen[i]=0;}
                
	                var badd, targ, have;
	                targ=0;have=0;badd=1;
                
	                targ=planets;
	                if (p_type[1]="Dead") then targ-=1;if (p_type[2]="Dead") then targ-=1;if (p_type[3]="Dead") then targ-=1;if (p_type[4]="Dead") then targ-=1;
	                if (p_owner[1]=8) then have+=1;if (p_owner[2]=8) then have+=1;if (p_owner[3]=8) then have+=1;if (p_owner[4]=8) then have+=1;
                
	                if (have=targ) then badd=2;
                
	                if (badd=1) then scr_alert("red","owner","Planet "+string(name)+" "+string(i)+" has succeeded to the Tau Empire!",x,y);
	                if (badd=2){
	                    scr_popup("System Lost","The "+string(name)+" system has been taken by the Tau Empire!","tau","");owner=8;
	                    scr_event_log("red","System "+string(name)+" has been taken by the Tau Empire.");
	                }
                
	                if (p_pdf[i]!=0) then p_pdf[i]=round(p_pdf[i]*0.75);
	                if (p_guardsmen[i]!=0) then p_guardsmen[i]=round(p_guardsmen[i]*0.75);
	            }
	        }
        
    
    
	    }// End repeat
    
    
    
    
	}


	// Genestealer cults grow in number
	i=0;repeat(4){i+=1;// This part handles the increasing in numbers
	    if (p_tyranids[i]>0) and (p_tyranids[i]<=3) and (p_type[i]!="Space Hulk"){
	        var spread;
	        spread=0;
	        rando=floor(random(100))+1;
        
	        if (rando<=15) then spread=1;
        
	        if (p_type[i]="Lava") and (p_tyranids[i]=2) then spread=0;
	        if ((p_type[i]="Ice") or (p_type[i]="Desert")) and (p_tyranids[i]=3) then spread=0;
        
	        if (spread=1) then p_tyranids[i]+=1;
	    }
	}









	i=0;
	repeat(4){i+=1;
	    if (p_owner[i]=8) and (p_influence[i]<80) and ((p_type[i]!="Forge") and (p_type[i]!="Shrine")) then p_influence[i]+=2;
	    if (p_owner[i]=8) and (p_influence[i]<80) and ((p_type[i]="Forge") or (p_type[i]="Shrine")) then p_influence[i]+=choose(0,1);
	}


}
