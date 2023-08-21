function scr_enemy_ai_a() {
//test
	// guardsmen hop from planet to planet
	if (p_guardsmen[1]+p_guardsmen[2]+p_guardsmen[3]+p_guardsmen[4]>0) and (present_fleet[2]>0){
	    var o,mx,cr,tr;o=0;mx=0;cr=0;tr=0;
	    repeat(4){o+=1;if (p_guardsmen[o]>0) and (cr=0) then cr=o;}
	    o=0;
	    repeat(4){o+=1;
	        if (p_orks[o]+p_tau[o]+p_chaos[o]+p_traitors[o]+p_tyranids[o]+p_necrons[o]>mx){
	            mx=p_orks[o]+p_tau[o]+p_chaos[o]+p_traitors[o]+p_tyranids[o]+p_necrons[o];
	            tr=o;
	        }
	    }
	    if (p_orks[cr]+p_tau[cr]+p_chaos[cr]+p_traitors[cr]+p_tyranids[cr]+p_necrons[cr]=0) and (tr!=cr){
	        p_guardsmen[tr]=p_guardsmen[cr];p_guardsmen[cr]=0;
	    }
	}

	if (obj_controller.faction_defeated[10]>0) and (obj_controller.faction_gender[10]=2){
	    var o;o=0;repeat(4){o+=1;
	        if (array_length(p_feature[o])!=0){
	            if (planet_feature_bool(p_feature[o], P_features.World_Eaters)==1) and (p_chaos[o]<=0){
	                delete_features(p_feature[o],P_features.World_Eaters);
	            }
	        }
	    }
	}

	// checking for inquisition dead world inspections here
	if (present_fleet[1]>=0) and (present_fleet[4]=0){
	    var o,yep,chanceh,stop,shitty;o=0;yep=0;stop=false;shitty=false;
    
	    chanceh=floor(random(200))+1;
	    repeat(4){o+=1;if (obj_ini.dis[o]="Shitty Luck") then shitty=true;}
	    if (shitty=true) then chanceh=floor(random(50))+1;
    
	    if (present_fleet[1]=0){
	        chanceh=floor(random(2000))+1;
	        if (shitty=true) then chanceh=floor(random(800))+1;
	    }
    
	    // 137 ; chanceh=floor(random(20))+1;
    
	    o=0;
	    repeat(4){o+=1;
	        if (p_first[o]=1) and (p_owner[o]=2) then p_owner[o]=1;
	        if (p_type[o]="Dead") and (p_upgrades[o]!=""){
	            if (planet_feature_bool(p_feature[o], P_features.Secret_Base)==0) and (string_count(".0|",p_upgrades[o])>0){
	                if (chanceh<=2) then yep=o;
	            }
	        }
	    }
    
	    if (yep>0){
	        with(obj_temp2){instance_destroy();}
	        with(obj_temp3){instance_destroy();}
	        instance_create(x,y,obj_temp2);
	        with(obj_en_fleet){
	            if (owner=4){
	                var near;near=instance_nearest(action_x,action_y,obj_temp2);
	                if (point_distance(action_x,action_y,near.x,near.y)<2) and (string_count("investigate_dead",trade_goods)>0) then instance_create(action_x,action_y,obj_temp3);
	            }
	        }
	        if (instance_exists(obj_temp3)) then stop=true;
	        with(obj_temp2){instance_destroy();}
	        with(obj_temp3){instance_destroy();}
        
	        if (stop=false){
	            var plap,old_x,old_y,flee;plap=0;old_x=x;old_y=y;flee=0;
	            x-=20000;y-=20000;
            
	            repeat(choose(2,3)){
	                plap=instance_nearest(old_x,old_y,obj_star);
	                with(plap){x-=20000;y-=20000;}
	            }
	            plap=instance_nearest(old_x,old_y,obj_star);
	            flee=instance_create(plap.x,plap.y-24,obj_en_fleet);
	            flee.owner=4;flee.frigate_number=1;
	            flee.action_x=old_x;flee.action_y=old_y;
	            flee.sprite_index=spr_fleet_inquisition;
	            flee.image_index=0;
            
	            var roll;roll=floor(random(100))+1;
	            if (roll<=60) then flee.trade_goods="Inqis1";
	            if (roll<=70) and (roll>60) then flee.trade_goods="Inqis2";
	            if (roll<=80) and (roll>70) then flee.trade_goods="Inqis3";
	            if (roll<=90) and (roll>80) then flee.trade_goods="Inqis4";
	            if (roll<=100) and (roll>90) then flee.trade_goods="Inqis5";
	            flee.trade_goods+="|investigate_dead|";
	            flee.alarm[4]=1;
	        }
	    }
    
	}

	with(obj_star){repeat(50){if (x<-15000){x+=20000;y+=20000;}}}















	// This is all executed by the star object


	var run, stop;run=0;
	var rand;rand=0;

    
	repeat(4){run+=1;stop=0;
	    if (p_eldar[run]<0) then p_eldar[run]=0;
	    if (p_orks[run]<0) then p_orks[run]=0;
	    if (p_tau[run]<0) then p_tau[run]=0;
	    if (p_traitors[run]<0) then p_traitors[run]=0;
	    if (p_tyranids[run]<0) then p_tyranids[run]=0;
	    if (p_necrons[run]<0) then p_necrons[run]=0;
	    if (p_player[run]<0) then p_player[run]=0;
	    if (p_sisters[run]<0) then p_sisters[run]=0;
    

	    var guard_score, pdf_score, ork_score, tau_score, traitors_score, csm_score, eldar_score, tyranids_score, necrons_score, sisters_score, large;
	    large=0;guard_score=0;pdf_score=0;ork_score=0;tau_score=0;traitors_score=0;csm_score=0;eldar_score=0;tyranids_score=0;necrons_score=0;sisters_score=0;
    
	    var guard_attack, pdf_attack, ork_attack, tau_attack, traitors_attack, csm_attack, eldar_attack, tyranids_attack, necrons_attack, sisters_attack;
	    guard_attack="";pdf_attack="";ork_attack="";tau_attack="";traitors_attack="";csm_attack="";
	    eldar_attack="";tyranids_attack="";necrons_attack="";sisters_attack="";
    
	    ork_score=p_orks[run];tau_score=p_tau[run];traitors_score=p_traitors[run];csm_score=p_chaos[run];
	    tyranids_score=p_tyranids[run];necrons_score=p_necrons[run];sisters_score=p_sisters[run];
	    // if (p_eldar[run]>0) then eldar_score=p_eldar[run]+1;
    
    
	    if (p_tyranids[run]<4) then tyranids_score=0;
	    if (p_chaos[run]=6.1) and (p_tyranids[run]>0) then tyranids_score=p_tyranids[run];
	    if (p_tau[run]=0) and (p_orks[run]=0) and (p_traitors[run]=0) and (p_chaos[run]=0) and (p_player[run]<=0) and (tyranids_score<5) and (p_necrons[run]=0) and (p_owner[run]=8) and (p_sisters[run]=0) then stop=1;
    
    
	    // if (p_eldar[run]>0) and (p_guardsmen[run]+p_pdf[run]+p_traitors[run]+p_tau[run]+p_orks[run]=0){stop=1;p_owner[run]=6;}
	    if (p_orks[run]>0) and (p_guardsmen[run]+p_pdf[run]+p_traitors[run]+p_tau[run]+tyranids_score+p_player[run]+p_necrons[run]+p_sisters[run]=0){stop=1;p_owner[run]=7;/*if (p_owner[run]!=7) then scr_alert("red","owner",string(name)+" "+string(run)+" has been overwhelmed by Orks!");*/}
	    if (p_tau[run]>0) and (p_guardsmen[run]+p_pdf[run]+p_orks[run]+p_traitors[run]+tyranids_score+p_player[run]+p_necrons[run]+p_sisters[run]=0){stop=1;p_owner[run]=8;/*if (p_owner[run]!=10) then scr_alert("red","owner",string(name)+" "+string(run)+" has fallen to traitors!");*/}
	    if (p_traitors[run]>0) and (p_guardsmen[run]+p_pdf[run]+p_orks[run]+p_tau[run]+tyranids_score+p_player[run]+p_necrons[run]+p_sisters[run]=0){stop=1;p_owner[run]=10;/*if (p_owner[run]!=10) then scr_alert("red","owner",string(name)+" "+string(run)+" has fallen to traitors!");*/}
	    if (p_chaos[run]>0) and (p_guardsmen[run]+p_pdf[run]+p_orks[run]+p_tau[run]+tyranids_score+p_player[run]+p_necrons[run]+p_sisters[run]=0){stop=1;p_owner[run]=10;/*if (p_owner[run]!=10) then scr_alert("red","owner",string(name)+" "+string(run)+" has fallen to traitors!");*/}
	    if (p_necrons[run]>0) and (p_guardsmen[run]+p_pdf[run]+p_orks[run]+p_tau[run]+tyranids_score+p_player[run]+p_chaos[run]+p_sisters[run]=0){stop=1;p_owner[run]=13;/*if (p_owner[run]!=10) then scr_alert("red","owner",string(name)+" "+string(run)+" has fallen to traitors!");*/}
    
	    if (p_owner[run]=8){
	        if (p_traitors[run]+p_orks[run]+tyranids_score+p_sisters[run]=0) then stop=1;
	    }
	    if (p_owner[run]=2) and (p_player[run]<=0) and (p_orks[run]>0) then p_owner[run]=7;
	    if (p_owner[run]=6) and (p_player[run]<=0) and (p_orks[run]>0) then p_owner[run]=7;
    
	    if (p_orks[run]>0) and (p_sisters[run]>0) then stop=0;
	    if (p_necrons[run]>=5) and ((p_guardsmen[run]>0) or (p_pdf[run]>0) or (p_sisters[run]>0)) then stop=0;
	    if (p_tyranids[run]>=5) and ((p_guardsmen[run]>0) or (p_pdf[run]>0) or (p_sisters[run]>0)) then stop=0;
	    if ((p_guardsmen[run]>0) or (p_sisters[run]>0)) and ((p_pdf[run]>0) or (p_tau[run]>0)) and (p_owner[run]=8) and (stop=1) then stop=0;
    
	    // Attack heretics whenever possible, even player controlled ones
	    if (p_player[run]+p_pdf[run]>0) and (p_guardsmen[run]>0) and (obj_controller.faction_status[2]="War") then stop=0;
	    if (p_player[run]+p_pdf[run]>0) and (p_sisters[run]>0) and (obj_controller.faction_status[5]="War") then stop=0;
    
    
	    if (p_tyranids[run]>0) and (stop!=1) and (p_owner[run]!=9){// This might have been causing the problem
	        /*if (p_tyranids[run]<5) and (p_guardsmen[run]>0){
	            if (p_tyranids[run]=4) then p_guardsmen[run]=max(0,p_guardsmen[run]-100000);
	            if (p_tyranids[run]=3) then p_guardsmen[run]=max(0,p_guardsmen[run]-20000);
	            if (p_tyranids[run]=2) then p_guardsmen[run]=max(0,p_guardsmen[run]-5000);
	            if (p_tyranids[run]=1) then p_guardsmen[run]=max(0,p_guardsmen[run]-500);
	        }*/
	        if (p_tyranids[run]>=5) then tyranids_score=7;
	    }
    
    
    
	    if (p_guardsmen[run]>0) and (stop!=1){
	        if (p_guardsmen[run]<50000000) and (p_guardsmen[run]>=15000000) then guard_score=5;
	        if (p_guardsmen[run]<15000000) and (p_guardsmen[run]>=6000000) then guard_score=4;
	        if (p_guardsmen[run]<6000000) and (p_guardsmen[run]>=1000000) then guard_score=3;
	        if (p_guardsmen[run]<1000000) and (p_guardsmen[run]>=100000) then guard_score=2;
	        if (p_guardsmen[run]<100000) and (p_guardsmen[run]>=2000) then guard_score=1;
	        if (p_guardsmen[run]<2000) then guard_score=0.5;
	        if (p_guardsmen[run]<500) then guard_score=0.1;
	        if (p_guardsmen[run]>=50000000) then guard_score=6;
	        if (p_guardsmen[run]>=100000000) then guard_score=7;
        
	        // if (p_eldar[run]>0) and (p_owner[run]!=6) then guard_attack="eldar";
	        if (p_tau[run]>0) then guard_attack="tau";
	        if (p_orks[run]>0) then guard_attack="ork";
	        if (p_traitors[run]>0) then guard_attack="traitors";
	        if (p_chaos[run]>0) then guard_attack="csm";
	        if (p_pdf[run]>0) and (p_owner[run]=8) then guard_attack="pdf";
	        if (p_pdf[run]>0) and (p_owner[run]=1) and (obj_controller.faction_status[2]="War") then guard_attack="pdf";
	        // Always goes after traitors first, unless
	        if (p_traitors[run]<=1) and (p_tau[run]>=4) and (p_owner[run]!=8) then guard_attack="tau";
	        if (p_pdf[run]>0) and (obj_controller.faction_status[2]="War") and (p_owner[run]=1) then guard_attack="pdf";
	        if (p_traitors[run]<=1) and (p_orks[run]>=4) then guard_attack="ork";
	        // if (p_tyranids[run]>0) and (guard_attack="") then guard_attack="tyranids";
	        if (p_tyranids[run]>=4) then guard_attack="tyranids";
        
	        if (guard_attack="tyranids") then tyranids_score=p_tyranids[run];
	        // Tend to prioritize traitors > Orks > Tau
	        // Eldar don't get into pitched battles so nyuck nyuck nyuck
	    }
    
	    if (((p_guardsmen[run]=0) or ((guard_score<=0.5))) or (p_owner[run]=8)) or ((p_guardsmen[run]>0) and (obj_controller.faction_status[2]="War")) and (p_pdf[run]>0) and (stop!=1){
	        if (p_pdf[run]>=50000000) then pdf_score=6;
	        if (p_pdf[run]<50000000) and (p_pdf[run]>=15000000) then pdf_score=5;
	        if (p_pdf[run]<15000000) and (p_pdf[run]>=6000000) then pdf_score=4;
	        if (p_pdf[run]<6000000) and (p_pdf[run]>=1000000) then pdf_score=3;
	        if (p_pdf[run]<1000000) and (p_pdf[run]>=100000) then pdf_score=2;
	        if (p_pdf[run]<100000) and (p_pdf[run]>=2000) then pdf_score=1;
	        if (p_pdf[run]<2000) then pdf_score=0.5;
	        if (p_pdf[run]<500) then pdf_score=0.1;
	        // 
	        // if (p_eldar[run]>0) and (p_owner[run]!=6) then pdf_attack="eldar";
	        if (p_tyranids[run]>=4) then pdf_attack="tyranids";
	        if (p_tau[run]>0) and (p_owner[run]!=8) then pdf_attack="tau";
	        if (p_orks[run]>0) then pdf_attack="ork";
	        if (p_traitors[run]>0) then pdf_attack="traitors";
	        if (p_chaos[run]>0) then pdf_attack="csm";
	        if (p_guardsmen[run]>0) and (p_owner[run]=8) then pdf_attack="guard";
	        if (p_guardsmen[run]>0) and (p_owner[run]=1) and (obj_controller.faction_status[2]="War") then pdf_attack="guard";
	        // Always goes after traitors first, unless
	        if (p_traitors[run]<=1) and (p_tau[run]>=4) and (p_owner[run]!=8) then pdf_attack="tau";
	        if (p_traitors[run]<=1) and (p_orks[run]>=4) then pdf_attack="ork";
	        if (p_tyranids[run]>=4) then pdf_attack="tyranids";
	    }
    
	    if (p_sisters[run]>0) and (stop!=1){// THEY MARCH FOR THE ECCLESIARCHY
	        if (p_tau[run]>0) then sisters_attack="tau";
	        if (p_orks[run]>0) then sisters_attack="ork";
	        if (p_necrons[run]>0) then sisters_attack="necrons";
	        if (p_pdf[run]>0) and (p_owner[run]=8) then sisters_attack="pdf";
	        if (p_pdf[run]>0) and (p_owner[run]=1) and (obj_controller.faction_status[5]="War") then sisters_attack="pdf";
	        if (p_traitors[run]>0) then sisters_attack="traitors";
	        if (p_chaos[run]>0) then sisters_attack="csm";
	        if (p_player[run]>0) and (obj_controller.faction_status[5]="War") then sisters_attack="player";
	        // Always goes after traitors first
	        if (sisters_attack="tyranids") then tyranids_score=p_tyranids[run];
	    }
    
	    if (p_orks[run]>0) and (stop!=1){
	        if (p_traitors[run]=0) and (p_tau[run]=0) and (p_eldar[run]=0) then ork_attack="imp";
	        rand=choose(1,2,3,4,5);
	        // if (rand=1) and (ork_attack="imp") then ork_attack="imp";
	            if (ork_attack="imp") then ork_attack="guard";
	            if (ork_attack="guard") and (p_guardsmen[run]=0) then ork_attack="pdf";
	        if (rand=2) and (p_tau[run]>0) then ork_attack="tau";
	        if (rand=3) and (p_traitors[run]>0) then ork_attack="traitors";
	        if (rand=4) and (p_chaos[run]>0) then ork_attack="csm";
	        if (rand=5) and (p_sisters[run]>0) then ork_attack="sisters";
	        // if (rand=5) and (p_necrons[run]>0) then ork_attack="necrons";
        
	        if (rand=5) and (p_sisters[run]=0) then rand=choose(1,2,3,4);
	        if (rand=2) and (p_tau[run]=0) then rand=choose(1,3,4,5);if (rand=3) and (p_traitors[run]=0) then rand=choose(1,2,3,4,5);
	        if (rand=2) and (p_tau[run]=0) then rand=1;if (rand=3) and (p_traitors[run]=0) then rand=1;
	        if (rand=4) and (p_chaos[run]=0) then rand=choose(1,2,3,5);
	        if (rand=5) and (p_sisters[run]=0) then rand=choose(1,2,3,4);
	        if (rand=2) and (p_tau[run]=0) then rand=choose(1,3,4,5);if (rand=3) and (p_traitors[run]=0) then rand=choose(1,2,3,4,5);
	        if (rand=2) and (p_tau[run]=0) then rand=1;if (rand=3) and (p_traitors[run]=0) then rand=1;
	        if (rand=5) and (p_sisters[run]=0) then rand=choose(1,2,3,4);
	        if (rand=1) and (p_guardsmen[run]<=0) and (p_pdf[run]<=0){
	            rand=choose(1,2,4,5);
	            if (p_eldar[run]=0) and (rand=4) then rand=1;
	            if (p_tau[run]=0) and (rand=1) then rand=2;
	            if (p_traitors[run]=0) and (rand=2) then rand=1;
	            if (p_sisters[run]=0) and (rand=5) then rand=1;
	        }
        
	        if (ork_attack="") and (p_player[run]>0) then ork_attack="player";
	    }
    
	    if (p_traitors[run]>0) and (stop!=1){
	        if (ork_score=0) and (tau_score=0) then traitors_attack="imp";
	        if (ork_score>tau_score) and (ork_score>guard_score) and (ork_score>pdf_score) then traitors_attack="orks";
	        if (sisters_score>tau_score) and (sisters_score>ork_score) and (sisters_score>pdf_score) then traitors_attack="sisters";
	        if (guard_score>tau_score) and (guard_score>ork_score) then traitors_attack="imp";
	        if (traitors_attack="") and (p_player[run]>0) then traitors_attack="player";
	    }
	    if (p_chaos[run]>0) and (stop!=1){
	        if (ork_score=0) and (tau_score=0) then csm_attack="imp";
	        if (ork_score>tau_score) and (ork_score>guard_score) and (ork_score>pdf_score) then csm_attack="orks";
	        if (sisters_score>tau_score) and (sisters_score>ork_score) and (sisters_score>pdf_score) then csm_attack="sisters";
	        if (guard_score>tau_score) and (guard_score>ork_score) then csm_attack="imp";
	        if (csm_attack="") and (p_player[run]>0) then csm_attack="player";
	    }
    
    
	    if (p_tau[run]>0) and (stop!=1) and (p_owner[run]!=8){// They don't own the planet, go ham    
	        // if (eldar_score>0) then tau_attack="eldar";
	        if (guard_score>0) then tau_attack="imp";
	        if (traitors_score>0) then tau_attack="traitors";
	        if (csm_score>0) then tau_attack="csm";
	        if (ork_score>0) then tau_attack="ork";
	        if (traitors_score>=3) and (ork_score<=2) then tau_attack="traitors";
	        if (traitors_score>=4) then tau_attack="traitors";
	        if (csm_score>=3) and (ork_score<=2) then tau_attack="csm";
	        if (csm_score>=4) then tau_attack="csm";
	        if (ork_score>=4) then tau_attack="ork";
	        if (tau_attack="") and (p_sisters[run]>0) then tau_attack="sisters";
	        if (tau_attack="") and (obj_controller.faction_status[8]="War") and (p_player[run]>0) then tau_attack="player";
	    }
	    if (p_tau[run]>0) and (stop!=1) and (p_owner[run]=8){// They own the planet
	        // if (eldar_score>0) then tau_attack="eldar";
	        if (traitors_score>0) then tau_attack="traitors";
	        if (ork_score>0) then tau_attack="ork";
	        if (guard_score>0) then tau_attack="imp";
	        if (traitors_score>=4) then tau_attack="traitors";
	        if (csm_score>=4) then tau_attack="csm";
	        if (ork_score>=4) then tau_attack="ork";
	        if (tau_attack="") and (p_sisters[run]>0) then tau_attack="sisters";
	        if (tau_attack="") and (obj_controller.faction_status[8]="War") and (p_player[run]>0) then tau_attack="player";
	    }
    
	    if ((p_tyranids[run]>=4) or (guard_attack="tyranids")) and (stop!=1){
	        if (p_traitors[run]=0) and (p_tau[run]=0) and (p_eldar[run]=0) and (p_orks[run]=0) then tyranids_attack="imp";
        
	        rand=choose(1,2,3,4,5,6);
	        if (rand=1) and (tyranids_attack="imp") then tyranids_attack="imp";
	        if (rand=2) and (p_tau[run]>0) then tyranids_attack="tau";
	        if (rand=3) and (p_traitors[run]>0) then tyranids_attack="traitors";
	        if (rand=4) and (p_orks[run]>0) then tyranids_attack="orks";
	        if (rand=5) and (p_chaos[run]>0) then tyranids_attack="csm";
	        if (rand=6) and (p_sisters[run]>0) then tyranids_attack="sisters";
        
	        if (rand=6) and (p_sisters[run]=0) then rand=choose(1,2,3,4);
	        if (rand=5) and (p_chaos[run]=0) then rand=choose(1,2,3,4);
	        if (rand=2) and (p_tau[run]=0) then rand=choose(1,3,4);if (rand=3) and (p_traitors[run]=0) then rand=choose(1,2,3,4);
	        if (rand=2) and (p_tau[run]=0) then rand=1;if (rand=3) and (p_traitors[run]=0) then rand=1;
	        if (rand=4) and (p_orks[run]=0) then rand=choose(1,2,3);
	        if (rand=2) and (p_tau[run]=0) then rand=choose(1,3,4);if (rand=3) and (p_traitors[run]=0) then rand=choose(1,2,3,4);
	        if (rand=2) and (p_tau[run]=0) then rand=1;if (rand=3) and (p_traitors[run]=0) then rand=1;
	        if (rand=1) and (p_guardsmen[run]<=0) and (p_pdf[run]<=0){
	            rand=choose(1,2,4);
	            if (p_orks[run]=0) and (rand=4) then rand=1;
	            if (p_tau[run]=0) and (rand=1) then rand=2;
	            if (p_traitors[run]=0) and (rand=2) then rand=1;
	        }
        
	        if (tyranids_attack="") and (p_player[run]>0) then tyranids_attack="player";
	    }
    
	    if (p_necrons[run]>0) and (stop!=1){
	        if (p_traitors[run]=0) and (p_tau[run]=0) and (p_eldar[run]=0) and (p_orks[run]=0) and (p_chaos[run]=0) then necrons_attack="imp";
        
	        rand=choose(1,2,3,4,5,6);
	        if (rand=1) and (necrons_attack="imp") then necrons_attack="imp";
	        if (rand=2) and (p_tau[run]>0) then necrons_attack="tau";
	        if (rand=3) and (p_traitors[run]>0) then necrons_attack="traitors";
	        if (rand=4) and (p_orks[run]>0) then necrons_attack="orks";
	        if (rand=5) and (p_chaos[run]>0) then necrons_attack="csm";
	        if (rand=6) and (p_sisters[run]>0) then necrons_attack="sisters";
        
	        if (rand=6) and (p_sisters[run]=0) then rand=choose(1,2,3,4,5);
	        if (rand=5) and (p_chaos[run]=0) then rand=choose(1,2,3,4,6);
	        if (rand=2) and (p_tau[run]=0) then rand=choose(1,3,4,6);if (rand=3) and (p_traitors[run]=0) then rand=choose(1,2,3,4);
	        if (rand=2) and (p_tau[run]=0) then rand=1;if (rand=3) and (p_traitors[run]=0) then rand=1;
	        if (rand=4) and (p_orks[run]=0) then rand=choose(1,2,3,6);
	        if (rand=6) and (p_sisters[run]=0) then rand=choose(1,2,3,4,5);
	        if (rand=2) and (p_tau[run]=0) then rand=choose(1,3,4);if (rand=3) and (p_traitors[run]=0) then rand=choose(1,2,3,4);
	        if (rand=2) and (p_tau[run]=0) then rand=1;if (rand=3) and (p_traitors[run]=0) then rand=1;
	        if (rand=1) and (p_guardsmen[run]<=0) and (p_pdf[run]<=0){
	            rand=choose(1,2,4);
	            if (p_orks[run]=0) and (rand=4) then rand=1;
	            if (p_tau[run]=0) and (rand=1) then rand=2;
	            if (p_traitors[run]=0) and (rand=2) then rand=1;
	        }
        
	        if (necrons_attack="") and (p_player[run]>0) then necrons_attack="player";
	    }
    
    
    
    
    
	    if (stop=0){// Start stop
    
	    if (ork_attack="imp") and (guard_score>0) then ork_attack="guard";if (ork_attack="imp") and (guard_score<=0) then ork_attack="pdf";
	    if (tau_attack="imp") and (guard_score>0) then tau_attack="guard";// if (tau_attack="imp") and (guard_score<=0) then tau_attack="pdf";
	    if (traitors_attack="imp") and (guard_score>0) then traitors_attack="guard";if (traitors_attack="imp") and (guard_score<=0) then traitors_attack="pdf";
	    if (csm_attack="imp") and (guard_score>0) then csm_attack="guard";if (csm_attack="imp") and (guard_score<=0) then csm_attack="pdf";
	    if (necrons_attack="imp") and (guard_score>0) then necrons_attack="guard";if (necrons_attack="imp") and (guard_score<=0) then necrons_attack="pdf";
	    if (sisters_attack="imp") and (pdf_score>0) then sisters_attack="pdf";
	    // if (eldar_attack="imp") and (guard_score>0) then eldar_attack="guard";if (eldar_attack="imp") and (guard_score<=0) then eldar_attack="pdf";
    
	    if (ork_attack="guard") and ((guard_score<=0.5) and (pdf_score>1)) then ork_attack="pdf";
	    if (tau_attack="guard") and ((guard_score<=0.5) and (pdf_score>1)) then tau_attack="pdf";
	    if (traitors_attack="guard") and ((guard_score<=0.5) and (pdf_score>1)) then traitors_attack="pdf";
	    if (csm_attack="guard") and ((guard_score<=0.5) and (pdf_score>1)) then csm_attack="pdf";
	    if (necrons_attack="guard") and ((guard_score<=0.5) and (pdf_score>1)) then necrons_attack="pdf";
	    // if (eldar_attack="guard") and ((guard_score<=0.5) and (pdf_score>1)) then eldar_attack="pdf";
    
	    // if ((traitors_attack="guard") or (traitors_attack="pdf")) and (traitors_score>=3){obj_controller.x=self.x;obj_controller.y=self.y;}
    
    
	    var temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8, temp9, temp10, temp11, tempor, rand1, rand2;
	    temp1=guard_score;temp10=p_guardsmen[run];
	    temp2=pdf_score;
	    temp3=ork_score;
	    temp4=tau_score;
	    temp5=traitors_score;
	    temp6=csm_score;if (csm_score=6.1) then csm_score=8;
	    temp8=necrons_score;
	    temp9=tyranids_score;
	    temp11=sisters_score;
	    tempor=0;rand1=0;rand2=0;
    
	    // Guard attack
	    if (guard_score>0) and (guard_attack!="") and (guard_score>0.5){
        
	        if (guard_attack="ork") then tempor=choose(1,2,3,4,5,6)*ork_score;
	        if (guard_attack="tau") then tempor=choose(1,2,3,4,5,6)*tau_score;
	        if (guard_attack="traitors") then tempor=choose(1,2,3,4,5,6)*traitors_score;
	        if (guard_attack="csm") then tempor=choose(2,3,4,5,6,7)*csm_score;
	        if (guard_attack="tyranids") then tempor=choose(2,3,4,5,6,7)*tyranids_score;
        
	        rand1=choose(1,2,3,4,5)*guard_score;
        
	        if (guard_attack="ork") and (ork_score>guard_score) then rand1=0;
	        if (guard_attack="tau") and (tau_score>guard_score) then rand1=0;
	        if (guard_attack="traitors") and (traitors_score>guard_score) then rand1=0;
	        if (guard_attack="csm") and (csm_score>guard_score) then rand1=0;
	        if (guard_attack="tyranids") and (tyranids_score>guard_score) then rand1=0;
        
	        if (guard_attack="pdf"){
	            rand1=(choose(3,4,5,6)*guard_score)*choose(1,1.25,1.25);
	            rand2=(choose(1,2,3,4,5,6)*pdf_score)*choose(1,1.25);
	            if (rand1>rand2){
	                if (guard_score<=3) then p_pdf[run]=floor(p_pdf[run]*0.7);
	                if (guard_score>=4) then p_pdf[run]=floor(p_pdf[run]*0.6);
	                if (guard_score>=4) and (p_pdf[run]<30000) then p_pdf[run]=0;
	                if (guard_score>=3) and (p_pdf[run]<10000) then p_pdf[run]=0;
	                if (guard_score>=2) and (p_pdf[run]<2000) then p_pdf[run]=0;
	                if (guard_score>=1) and (p_pdf[run]<200) then p_pdf[run]=0;
	            }
	            if (p_pdf[run]=0) and (p_owner[run]=1) and (obj_controller.faction_status[2]="War"){
	                if (planet_feature_bool(p_feature[run],P_features.Monastery)==0) and (p_player[run]<=0){p_owner[run]=2;dispo[run]=-50;}
	            }
	        }
	        if (guard_attack!="pdf") and (rand1>tempor){
	            if (guard_attack="ork") then temp3-=1;
	            if (guard_attack="tau") then temp4-=1;
	            if (guard_attack="traitors") then temp5-=1;
	            if (guard_attack="csm") then temp6-=1;
	            if (guard_attack="tyranids") then temp9-=1;
	        }
	    }
    
	    // PDF attack
	    if ((pdf_score>0) and (pdf_attack!="")) or ((pdf_score>1) and (guard_score<0.5)){
	        if (pdf_attack="ork") then tempor=ork_score;
	        if (pdf_attack="tau") then tempor=tau_score;
	        if (pdf_attack="traitors") then tempor=traitors_score;
	        if (pdf_attack="csm") then tempor=csm_score;
	        if (pdf_attack="guard") then tempor=guard_score;
	        if (pdf_attack="tyranids") then tempor=tyranids_score;
	        if (pdf_attack="sisters") then tempor=sisters_score;
        
	        rand1=floor(random(pdf_score+tempor+2))+1;rand2=choose(1,1,2);
	        if (pdf_attack="ork") and (ork_score>=3) and (pdf_score<=2) then rand2=1;
	        if (pdf_attack="traitors") and (traitors_score>=6) then rand2=1;
	        if (pdf_attack="csm") and (csm_score>=3) then rand2=1;
	        if (pdf_attack="tyranids") and (tyranids_score>=pdf_score) then rand2=1;
	        if (pdf_attack="sisters") and (traitors_score>=5) then rand2=1;
        
	        if (rand1<=pdf_score) and (rand2=2) then tempor-=1;
	        if (tempor=1) and (pdf_score>=6) and (rand2=2) then tempor=0;
        
	        if (pdf_attack="ork") then temp3=tempor;
	        if (pdf_attack="tau") then temp4=tempor;
	        if (pdf_attack="traitors") then temp5=tempor;
	        if (pdf_attack="csm") then temp6=tempor;
	        if (pdf_attack="tyranids") and (tyranids_score>=4) then temp9=tempor;
	        if (pdf_attack="sisters") then temp11=tempor;
        
	        if (pdf_attack="guard"){
	            rand2=(choose(1,2,3,4,5,6)*guard_score)*choose(1,1.25,2);
	            if (rand1>rand2){
	                if (pdf_score<=3) then p_guardsmen[run]=floor(p_guardsmen[run]*0.7);
	                if (pdf_score>=4) then p_guardsmen[run]=floor(p_guardsmen[run]*0.6);
	                if (pdf_score>=4) and (p_guardsmen[run]<15000) then p_guardsmen[run]=0;
	                if (pdf_score>=3) and (p_guardsmen[run]<5000) then p_guardsmen[run]=0;
	            }
	        }
	    }
    
	    // sisters attack
	    if (sisters_score>0) and (sisters_attack!="") and (sisters_attack!="player"){
	        rand1=choose(2,3,4,5,6)*sisters_score;
        
	        if (sisters_attack="tau"){
	            rand2=(choose(2,3,4,5)*tau_score)*choose(1,1.25);
	            if (rand1>rand2) then temp4-=1;
	        }
	        if (sisters_attack="ork"){
	            rand2=(choose(2,3,4,5)*ork_score)*choose(1,1.25);
	            if (rand1>rand2) then temp3-=1;
	        }
	        if (sisters_attack="traitors"){
	            rand2=(choose(1,2,3,4,5)*traitors_score)*choose(1,1.25);
	            if (rand1>rand2) then temp5-=1;
	        }
	        if (sisters_attack="csm"){
	            rand2=(choose(2,3,4,5,6)*csm_score)*choose(1,1.25);
	            if (csm_score=6.1) then rand2=999;
	            if (rand1>rand2) then temp6-=1;
	        }
	        if (sisters_attack="necrons"){
	            rand2=(choose(4,5,6,7)*necrons_score)*choose(1,1.25);
	            if (rand1>rand2) then temp8-=1;
	        }
	        if (sisters_attack="tyranids"){
	            rand2=(choose(3,4,5,6,7)*tyranids_score)*choose(1,1.25);
	            if (rand1>rand2) and (tyranids_score>=4) then temp9-=1;
	        }
	        if (sisters_attack="pdf"){
	            rand2=(choose(1,2,3,4,5)*pdf_score)*choose(1,1.25);
	            if (rand1>rand2){
	                if (csm_score>=6) then p_pdf[run]=0;
	                if (csm_score<=3) then p_pdf[run]=floor(p_pdf[run]*0.7);
	                if (csm_score>=4) then p_pdf[run]=floor(p_pdf[run]*0.6);
	                if (csm_score>=4) and (p_pdf[run]<60000) then p_pdf[run]=0;
	                if (csm_score>=3) and (p_pdf[run]<20000) then p_pdf[run]=0;
	                if (csm_score>=2) and (p_pdf[run]<3000) then p_pdf[run]=0;
	                if (csm_score>=1) and (p_pdf[run]<1000) then p_pdf[run]=0;
	            }
	        }
        
	    }
    
	    // Tau attack
	    if (tau_score>0) and (tau_attack!="") and (tau_attack!="player"){
	        rand1=choose(1,2,3,4,5,6)*tau_score;
        
	        if (tau_attack="ork"){
	            rand2=(choose(1,2,3,4,5,6)*ork_score)*choose(1,1.25);
	            if (rand1>rand2) then temp3-=1;
	        }
	        if (tau_attack="traitors"){
	            rand2=(choose(1,2,3,4,5,6)*traitors_score)*choose(1,1.25);
	            if (rand1>rand2) and (traitors_score!=7) then temp5-=1;
	        }
	        if (tau_attack="csm"){
	            rand2=(choose(1,2,3,4,5,6)*csm_score)*choose(1,1.25);
	            if (csm_score=6.1) then rand2=999;
	            if (rand1>rand2) then temp6-=1;
	        }
        
	        if (tau_attack="guard"){
	            rand2=(choose(1,2,3,4,5,6)*guard_score)*choose(1,1.25);
	            if (rand1>rand2){
	                if (tau_score<=3) then p_guardsmen[run]=floor(p_guardsmen[run]*0.7);
	                if (tau_score>=4) then p_guardsmen[run]=floor(p_guardsmen[run]*0.6);
	            }
	        }
	        if (tau_attack="pdf"){
	            rand2=(choose(1,2,3,4,5,6)*pdf_score)*choose(1,1.25);
	            if (rand1>rand2){
	                if (tau_score<=3) then p_pdf[run]=floor(p_pdf[run]*0.7);
	                if (tau_score>=4) then p_pdf[run]=floor(p_pdf[run]*0.6);
	            }
	        }
	        if (tau_attack="sisters"){
	            rand2=(choose(1,2,3,4,5,6)*sisters_score)*choose(1,1.25);
	            if (rand1>rand2) then temp11-=1;
	        }
	    }
    
	    // ork attack
	    if (ork_score>0) and (ork_attack!="") and (ork_attack!="player"){
	        rand1=choose(1,2,3,4,5,6)*ork_score;

	        if (ork_attack="tau"){
	            rand2=(choose(1,2,3,4,5,6)*tau_score)*choose(1,1.25);
	            if (rand1>rand2) then temp4-=1;
	        }
	        if (ork_attack="traitors"){
	            rand2=(choose(1,2,3,4,5,6,7)*traitors_score)*choose(1,1.25);
	            if (rand1>rand2) and (traitors_score<6) then temp5-=1;
	        }
	        if (ork_attack="csm"){
	            rand2=(choose(1,2,3,4,5,6)*csm_score)*choose(1,1.25);
	            if (rand1>rand2) and (csm_score!=6) then temp6-=1;
	        }
        
	        if (ork_attack="guard"){var onc;onc=0;
	            rand2=(choose(1,2,3,4,5,6)*guard_score)*choose(1,1.25);
	            if (rand1>rand2){
	                if (ork_score<=3) and (onc=0){p_guardsmen[run]=floor(p_guardsmen[run]*0.7);onc=1;}
	                if (ork_score>=4) and (onc=0){p_guardsmen[run]=floor(p_guardsmen[run]*0.6);onc=1;}
	                if (ork_score>=4) and (p_guardsmen[run]<15000) and (onc=0){p_guardsmen[run]=0;onc=1;}
	                if (ork_score>=3) and (p_guardsmen[run]<5000) and (onc=0){p_guardsmen[run]=0;onc=1;}
	            }
	        }
	        if (ork_attack="pdf"){
	            rand2=(choose(1,2,3,4,5,6)*pdf_score)*choose(1,1.25);
	            if (rand1>rand2){
	                if (ork_score<=3) then p_pdf[run]=floor(p_pdf[run]*0.7);
	                if (ork_score>=4) then p_pdf[run]=floor(p_pdf[run]*0.6);
	                if (ork_score>=4) and (p_pdf[run]<30000) then p_pdf[run]=0;
	                if (ork_score>=3) and (p_pdf[run]<10000) then p_pdf[run]=0;
	                if (ork_score>=2) and (p_pdf[run]<2000) then p_pdf[run]=0;
	                if (ork_score>=1) and (p_pdf[run]<200) then p_pdf[run]=0;
	            }
	            if (p_pdf[run]=0) and (p_player[run]<=0){
	                var badd;badd=1;
                
	                if (p_pdf[1]+p_pdf[2]+p_pdf[3]+p_pdf[4]=0) and (p_guardsmen[1]+p_guardsmen[2]+p_guardsmen[3]+p_guardsmen[4]=0){
	                    badd=2;
	                }
                
	                if (owner<=5){
	                    if (badd=1) and (p_tyranids[run]=0) and (p_necrons[run]=0) and (p_sisters[run]=0) then scr_alert("red","owner",string(name)+" "+string(run)+" has been overwhelmed by Orks!",x,y);
	                    if (badd=2) and (p_tyranids[run]=0) and (p_necrons[run]=0) and (p_sisters[run]=0){
	                        scr_popup("System Lost","The "+string(name)+" system has been ovewhelmed by Orks!","orks","");
	                        scr_event_log("red","System "+string(name)+" has been overwhelmed by Orkz.");
	                        // owner=7;p_owner[1]=7;p_owner[2]=7;p_owner[3]=7;p_owner[4]=7;
	                    }
	                }
	            }
	        }
	        if (ork_attack="sisters"){
	            rand2=(choose(1,2,3,4,5,6)*sisters_score)*choose(1,1.25);
	            if (rand1>rand2) then temp11-=1;
	        }
	    }
    
	    // traitors attack
	    if (traitors_score>0) and (traitors_attack!="") and (traitors_attack!="player"){
	        rand1=choose(1,2,3,4,5,6,7)*traitors_score;
	        if (traitors_score=6) then rand1=choose(30,36);
	        if (traitors_score=7) then rand1=999;
        
	        if (traitors_attack="tau"){
	            rand2=(choose(1,2,3,4,5)*tau_score)*choose(1,1.25);
	            if (rand1>rand2) then temp4-=1;
	        }
	        if (traitors_attack="ork"){
	            rand2=(choose(1,2,3,4,5)*ork_score)*choose(1,1.25);
	            if (rand1>rand2) then temp3-=1;
	        }
	        /*if (traitors_attack="eldar"){
	            rand2=(choose(1,2,3,4,5)*eldar_score)*choose(1,1.25);
	            if (rand1>rand2) then temp6-=1;
	        }*/
        
	        if (traitors_attack="guard"){
	            rand2=(choose(1,2,3,4,5)*guard_score)*choose(1,1.25);
	            if (rand1>rand2){
	                if (traitors_score<=3) then p_guardsmen[run]=floor(p_guardsmen[run]*0.7);
	                if (traitors_score>=4) then p_guardsmen[run]=floor(p_guardsmen[run]*0.6);
	                if (traitors_score>=6) then p_guardsmen[run]=floor(p_guardsmen[run]*0.3);
	                if (traitors_score>=4) and (p_guardsmen[run]<15000) then p_guardsmen[run]=0;
	                if (traitors_score>=3) and (p_guardsmen[run]<5000) then p_guardsmen[run]=0;
	                if (traitors_score>=2) and (p_guardsmen[run]<1000) then p_guardsmen[run]=0;
	                if (traitors_score>=1) and (p_guardsmen[run]<500) then p_guardsmen[run]=0;
	            }
	        }
	        if (traitors_attack="pdf"){
	            rand2=(choose(1,2,3,4,5)*pdf_score)*choose(1,1.25);
	            if (rand1>rand2){
	                if (traitors_score>=6) then p_pdf[run]=0;
	                if (traitors_score<=3) then p_pdf[run]=floor(p_pdf[run]*0.7);
	                if (traitors_score>=4) then p_pdf[run]=floor(p_pdf[run]*0.6);
	                if (traitors_score>=4) and (p_pdf[run]<60000) then p_pdf[run]=0;
	                if (traitors_score>=3) and (p_pdf[run]<20000) then p_pdf[run]=0;
	                if (traitors_score>=2) and (p_pdf[run]<3000) then p_pdf[run]=0;
	                if (traitors_score>=1) and (p_pdf[run]<1000) then p_pdf[run]=0;
	            }
	        }
	        if (traitors_attack="sisters"){
	            rand2=(choose(1,2,3,4,5,6,7)*sisters_score)*choose(1,1.25);
	            if (rand1>rand2) then temp11-=1;
	        }
	    }
    
    
	    // CSM attack
	    if (csm_score>0) and (csm_attack!="") and (csm_attack!="player"){
	        rand1=choose(2,3,4,5,6,7)*csm_score;
	        if (csm_score>=5) then rand1=choose(30,36);
        
	        if (csm_attack="tau"){
	            rand2=(choose(1,2,3,4,5)*tau_score)*choose(1,1.25);
	            if (rand1>rand2) then temp4-=1;
	        }
	        if (csm_attack="ork"){
	            rand2=(choose(1,2,3,4,5)*ork_score)*choose(1,1.25);
	            if (rand1>rand2) then temp3-=1;
	        }
        
	        if (csm_attack="guard"){
	            rand2=(choose(1,2,3,4,5)*guard_score)*choose(1,1.25);
	            if (rand1>rand2){
	                if (csm_score<=3) then p_guardsmen[run]=floor(p_guardsmen[run]*0.7);
	                if (csm_score>=4) then p_guardsmen[run]=floor(p_guardsmen[run]*0.6);
	                if (csm_score>=6) then p_guardsmen[run]=floor(p_guardsmen[run]*0.3);
	                if (csm_score>=4) and (p_guardsmen[run]<15000) then p_guardsmen[run]=0;
	                if (csm_score>=3) and (p_guardsmen[run]<5000) then p_guardsmen[run]=0;
	                if (csm_score>=2) and (p_guardsmen[run]<1000) then p_guardsmen[run]=0;
	                if (csm_score>=1) and (p_guardsmen[run]<500) then p_guardsmen[run]=0;
	            }
	        }
	        if (csm_attack="pdf"){
	            rand2=(choose(1,2,3,4,5)*pdf_score)*choose(1,1.25);
	            if (rand1>rand2){
	                if (csm_score>=6) then p_pdf[run]=0;
	                if (csm_score<=3) then p_pdf[run]=floor(p_pdf[run]*0.7);
	                if (csm_score>=4) then p_pdf[run]=floor(p_pdf[run]*0.6);
	                if (csm_score>=4) and (p_pdf[run]<60000) then p_pdf[run]=0;
	                if (csm_score>=3) and (p_pdf[run]<20000) then p_pdf[run]=0;
	                if (csm_score>=2) and (p_pdf[run]<3000) then p_pdf[run]=0;
	                if (csm_score>=1) and (p_pdf[run]<1000) then p_pdf[run]=0;
	            }
	        }
	        if (csm_attack="sisters"){
	            rand2=(choose(2,3,4,5,6)*sisters_score)*choose(1,1.25);
	            if (rand1>rand2) then temp11-=1;
	        }
	    }
    
    
    
    
    
    
    
	    // eldar attack
	    /*if (eldar_score>0) and (eldar_attack!="") and (eldar_attack!="player"){
	        rand1=choose(1,2,3,4,5,6,7)*eldar_score;
	        if (eldar_score=6) then rand1=choose(30,36);
        
	        if (eldar_attack="tau"){
	            rand2=(choose(1,2,3,4,5)*tau_score)*choose(1,1.25);
	            if (rand1>rand2) then temp4-=1;
	        }
	        if (eldar_attack="ork"){
	            rand2=(choose(1,2,3,4,5)*ork_score)*choose(1,1.25);
	            if (rand1>rand2) then temp3-=1;
	        }
	        if (eldar_attack="traitors"){
	            rand2=(choose(1,2,3,4,5)*traitors_score)*choose(1,1.25);
	            if (rand1>rand2) then temp10=1;
	        }
        
	        if (eldar_attack="guard"){
	            rand2=(choose(1,2,3,4,5)*guard_score)*choose(1,1.25);
	            if (rand1>rand2){
	                if (eldar_score<=3) then p_guardsmen[run]=floor(p_guardsmen[run]*0.7);
	                if (eldar_score>=4) then p_guardsmen[run]=floor(p_guardsmen[run]*0.6);
	                if (eldar_score>=6) then p_guardsmen[run]=floor(p_guardsmen[run]*0.3);
	                if (eldar_score>=4) and (p_guardsmen[run]<15000) then p_guardsmen[run]=0;
	                if (eldar_score>=3) and (p_guardsmen[run]<5000) then p_guardsmen[run]=0;
	                if (eldar_score>=2) and (p_guardsmen[run]<1000) then p_guardsmen[run]=0;
	                if (eldar_score>=1) and (p_guardsmen[run]<500) then p_guardsmen[run]=0;
	            }
	        }
	        if (eldar_attack="pdf"){
	            rand2=(choose(1,2,3,4,5)*pdf_score)*choose(1,1.25);
	            if (rand1>rand2){
	                if (eldar_score>=6) then p_pdf[run]=0;
	                if (eldar_score<=3) then p_pdf[run]=floor(p_pdf[run]*0.7);
	                if (eldar_score>=4) then p_pdf[run]=floor(p_pdf[run]*0.6);
	                if (eldar_score>=4) and (p_pdf[run]<60000) then p_pdf[run]=0;
	                if (eldar_score>=3) and (p_pdf[run]<20000) then p_pdf[run]=0;
	                if (eldar_score>=2) and (p_pdf[run]<3000) then p_pdf[run]=0;
	                if (eldar_score>=1) and (p_pdf[run]<1000) then p_pdf[run]=0;
	            }
	        }
	    }*/
    
    
    
    
	    // Tyranids attack
	    if ((tyranids_score>4) or (guard_attack="tyranids")) and (tyranids_attack!="") and (tyranids_attack!="player"){
	    // if (tyranids_score>4) and (tyranids_attack!="") and (tyranids_attack!="player"){
	        rand1=choose(3,4,5,6,7)*tyranids_score;
	        if (tyranids_score>=6) then rand1=choose(30,36);
        
	        if (tyranids_attack="tau"){
	            rand2=(choose(1,2,3,4,5)*tau_score)*choose(1,1.25);
	            if (rand1>rand2) then temp4-=1;
	        }
	        if (tyranids_attack="ork"){
	            rand2=(choose(1,2,3,4,5)*ork_score)*choose(1,1.25);
	            if (rand1>rand2) then temp3-=1;
	        }
	        if (tyranids_attack="csm"){
	            rand2=(choose(1,2,3,4,5)*csm_score)*choose(1,1.25);
	            if (rand1>rand2) then temp6-=1;
	        }
	        if (tyranids_attack="traitors"){
	            rand2=(choose(1,2,3,4,5)*traitors_score)*choose(1,1.25);
	            if (rand1>rand2) and (traitors_score!=7) then temp5-=1;
	        }
	        if (tyranids_attack="imp"){
	            if (p_pdf[run]>0) then tyranids_attack="pdf";
	            if (p_guardsmen[run]>0) then tyranids_attack="guard";
	        }
	        if (tyranids_attack="guard"){
	            rand1=(choose(1,2,3,4,5,6,7)*tyranids_score)*choose(1,1.25);
	            rand2=(choose(1,2,3,4,5)*guard_score)*choose(1,1.25);
	            if (rand1>rand2){
	                /*if (tyranids_score<=3) then p_guardsmen[run]=floor(p_guardsmen[run]*0.6);
	                if (tyranids_score>=4) then p_guardsmen[run]=floor(p_guardsmen[run]*0.5);*/
	                var onh;onh=0;
	                if (tyranids_score=1) and (onh=0){p_guardsmen[run]-=2000;onh=1;}
	                if (tyranids_score=2) and (onh=0){p_guardsmen[run]-=30000;onh=1;}
	                if (tyranids_score=3) and (onh=0){p_guardsmen[run]-=100000;onh=1;}
	                if (tyranids_score=4) and (onh=0){p_guardsmen[run]-=500000;onh=1;}
	                if (tyranids_score>=4) and (onh=0) and (p_guardsmen[run]<=15000){p_guardsmen[run]=0;onh=1;}
	                if (tyranids_score>=5) and (onh=0){p_guardsmen[run]-=max(floor(p_guardsmen[run]*0.2),2000000);onh=1;}
	                // if (tyranids_score>=6) and (onh=0){p_guardsmen[run]=floor(p_guardsmen[run]*0.2);onh=1;}
                
	                if (p_guardsmen[run]<0) then p_guardsmen[run]=0;
	            }
	        }
	        if (tyranids_attack="pdf"){
	            rand2=(choose(1,2,3,4,5)*pdf_score)*choose(1,1.25);
	            if (rand1>rand2){
	                if (tyranids_score>=6) then p_pdf[run]=0;
	                if (tyranids_score<=3) then p_pdf[run]=floor(p_pdf[run]*0.4);
	                if (tyranids_score>=4) then p_pdf[run]=floor(p_pdf[run]*0.2);
	                if (tyranids_score>=4) and (p_pdf[run]<60000) then p_pdf[run]=0;
	            }
	        }
	        if (tyranids_attack="sisters"){
	            rand2=(choose(1,2,3,4,5)*sisters_score)*choose(1,1.25);
	            if (rand1>rand2) then temp11-=1;
	        }
	    }
    
    
    
	    // Necrons attack
	    if (necrons_score>0) and (necrons_attack!="") and (necrons_attack!="player"){
	        rand1=choose(3,4,5,6,7)*necrons_score;
	        if (necrons_score>=6) then rand1=choose(30,36);
        
	        if (necrons_attack="tau"){
	            rand2=(choose(1,2,3,4,5)*tau_score)*choose(1,1.25);
	            if (rand1>rand2) then temp4-=1;
	        }
	        if (necrons_attack="ork"){
	            rand2=(choose(1,2,3,4,5)*ork_score)*choose(1,1.25);
	            if (rand1>rand2) then temp3-=1;
	        }
	        if (necrons_attack="csm"){
	            rand2=(choose(1,2,3,4,5)*csm_score)*choose(1,1.25);
	            if (rand1>rand2) then temp6-=1;
	        }
	        if (necrons_attack="traitors"){
	            rand2=(choose(1,2,3,4,5)*traitors_score)*choose(1,1.25);
	            if (rand1>rand2) and (traitors_score!=7) then temp6-=1;
	        }
	        if (necrons_attack="imp"){
	            if (p_pdf[run]>0) then necrons_attack="pdf";
	            if (p_guardsmen[run]>0) then necrons_attack="guard";
	        }
	        if (necrons_attack="guard"){
	            rand2=(choose(1,2,3,4,5)*guard_score)*choose(1,1.25);
	            if (rand1>rand2){
	                if (necrons_score<=3) then p_guardsmen[run]=floor(p_guardsmen[run]*0.6);
	                if (necrons_score>=4) then p_guardsmen[run]=floor(p_guardsmen[run]*0.5);
	                if (necrons_score>=6) then p_guardsmen[run]=floor(p_guardsmen[run]*0.2);
	                if (necrons_score>=4) and (p_guardsmen[run]<15000) then p_guardsmen[run]=0;
	            }
	        }
	        if (necrons_attack="pdf"){
	            rand2=(choose(1,2,3,4,5)*pdf_score)*choose(1,1.25);
	            if (rand1>rand2){
	                if (necrons_score>=6) then p_pdf[run]=0;
	                if (necrons_score<=3) then p_pdf[run]=floor(p_pdf[run]*0.4);
	                if (necrons_score>=4) then p_pdf[run]=floor(p_pdf[run]*0.2);
	                if (necrons_score>=4) and (p_pdf[run]<60000) then p_pdf[run]=0;
	            }
            
            
	            if (p_pdf[run]=0) and (p_player[run]<=0) and (p_necrons[run]>0){
	                var badd;badd=1;
                
	                if (p_pdf[1]+p_pdf[2]+p_pdf[3]+p_pdf[4]=0) and (p_guardsmen[1]+p_guardsmen[2]+p_guardsmen[3]+p_guardsmen[4]=0){
	                    badd=2;
	                }
                
	                if (badd=1) and (p_tyranids[run]<5) and (p_orks[run]=0) and (p_traitors[run]=0) then scr_alert("red","owner",string(name)+" "+string(run)+" has been overwhelmed by Necrons!",x,y);
	                if (badd=2) and (p_tyranids[run]<5) and (p_orks[run]=0) and (p_traitors[run]=0){
	                    scr_popup("System Lost","The "+string(name)+" system has been ovewhelmed by Necrons!","necron_army","");
	                    scr_event_log("red","System "+string(name)+" has been overwhelmed by Necrons.");
	                }
	            }
            
	        }
	        if (necrons_attack="sisters"){
	            rand2=(choose(1,2,3,4,5)*sisters_score)*choose(1,1.25);
	            if (rand1>rand2) then temp11-=1;
	        }
	    }
    
    
    
	    p_orks[run]=temp3;
	    p_tau[run]=temp4;
	    p_traitors[run]=temp5;
	    p_chaos[run]=temp6;
	    p_necrons[run]=temp8;
	    if (p_tyranids[run]>4) then p_tyranids[run]=temp9;
	    p_sisters[run]=temp11;
    
    
	    // End stop
	    }
    
    
    
	    // 135;
    
	    if (p_owner[run]=7) and (p_player[run]+p_raided[run]>0) and (p_orks[run]=0) and (p_tyranids[run]<4) and (p_chaos[run]=0) and (p_traitors[run]=0) and (p_necrons[run]=0) and (p_tau[run]=0){
	        scr_event_log("","Orks cleansed from "+string(name)+" "+scr_roman(run));
	        if (p_first[run]=1){p_owner[run]=1;scr_alert("green","owner","Orks cleansed from "+string(name)+" "+scr_roman(run)+".",x,y);}
	        if (p_first[run]=2){p_owner[run]=2;scr_alert("green","owner","Orks cleansed from "+string(name)+" "+scr_roman(run)+".  Control returned to the governor.",x,y);}
	        if (p_first[run]=3){p_owner[run]=3;scr_alert("green","owner","Orks cleansed from "+string(name)+" "+scr_roman(run)+".  Control returned to Mechanicus.",x,y);}
	        if (dispo[run]=101) then p_owner[run]=1;
	    }
	    if (p_owner[run]=8) and (p_player[run]+p_raided[run]>0) and (p_orks[run]=0) and (p_tyranids[run]<4) and (p_chaos[run]=0) and (p_traitors[run]=0) and (p_necrons[run]=0) and (p_tau[run]=0) and (p_pdf[run]=0){
	        scr_event_log("","Tau cleansed from "+string(name)+" "+scr_roman(run));
	        if (p_first[run]=1){p_owner[run]=1;scr_alert("green","owner","Tau cleansed from "+string(name)+" "+scr_roman(run)+".",x,y);}
	        if (p_first[run]=2){p_owner[run]=2;scr_alert("green","owner","Tau cleansed from "+string(name)+" "+scr_roman(run)+".  Control given to new governor.",x,y);}
	        if (p_first[run]=3){p_owner[run]=3;scr_alert("green","owner","Tau cleansed from "+string(name)+" "+scr_roman(run)+".  Control returned to Mechanicus.",x,y);}
	        if (dispo[run]=101) then p_owner[run]=1;
	    }
	    if (p_owner[run]=10) and (p_player[run]+p_raided[run]>0) and (p_orks[run]=0) and (p_tyranids[run]<4) and (p_chaos[run]=0) and (p_traitors[run]=0) and (p_necrons[run]=0) and (p_tau[run]=0){
	        scr_event_log("","Chaos cleansed from "+string(name)+" "+scr_roman(run));
	        if (p_first[run]=1){p_owner[run]=1;scr_alert("green","owner","Chaos cleansed from "+string(name)+" "+scr_roman(run)+".",x,y);}
	        if (p_first[run]=2){p_owner[run]=2;scr_alert("green","owner","Chaos cleansed from "+string(name)+" "+scr_roman(run)+".  Control returned to the governor.",x,y);}
	        if (p_first[run]=3){p_owner[run]=3;scr_alert("green","owner","Chaos cleansed from "+string(name)+" "+scr_roman(run)+".  Control returned to Mechanicus.",x,y);}
	        if (dispo[run]=101) then p_owner[run]=1;
	    }
	    if (p_owner[run]=13) and (p_player[run]+p_raided[run]>0) and (p_orks[run]=0) and (p_tyranids[run]<4) and (p_chaos[run]=0) and (p_traitors[run]=0) and (p_necrons[run]=0) and (p_tau[run]=0){
	        if (awake_tomb_world(p_feature[run])!=1){
	            scr_event_log("","Necrons cleansed from "+string(name)+" "+scr_roman(run));
	            if (p_first[run]=1){p_owner[run]=1;scr_alert("green","owner","Necrons cleansed from "+string(name)+" "+scr_roman(run)+".",x,y);}
	            if (p_first[run]=2){p_owner[run]=2;scr_alert("green","owner","Necrons cleansed from "+string(name)+" "+scr_roman(run)+".  Control returned to the governor.",x,y);}
	            if (p_first[run]=3){p_owner[run]=3;scr_alert("green","owner","Necrons cleansed from "+string(name)+" "+scr_roman(run)+".  Control returned to Mechanicus.",x,y);}
	            if (dispo[run]=101) then p_owner[run]=1;
	        }
	    }
	    if (p_raided[run]>0) then p_raided[run]=0;
	}// end repeat here


	// quene player battles here


	// End quene player battles



	scr_star_ownership(true);




	// Restock PDF and military
	var i;i=0;repeat(4){i+=1;
	    if (p_type[i]="Daemon"){p_heresy[i]=200;p_owner[i]=10;}
    
	    if (p_population[i]<=0) and (p_large[i]=0) and (p_chaos[i]=0) and (p_traitors[i]=0) and (p_tau[i]=0) and (p_type[i]!="Daemon") then p_heresy[i]=0;
	    if (p_population[i]<1) and (p_large[i]=1){p_population[i]=p_population[i]*100000000;p_large[i]=0;}
    
	    if (p_owner[i]=2) and (p_type[i]!="Dead") and (planets>=i) and (p_tyranids[i]=0) and (p_chaos[i]=0) and (p_traitors[i]=0) and (p_eldar[i]=0) and (p_tau[i]=0){
	        var military, pdf,rando,contin;
	        military=0;pdf=0;contin=0;
	        rando=floor(random(100))+1;
        
	        if (p_population[i]>=10000000){military=(p_population[i]/470);pdf=floor(military*0.75);military=floor(military*0.25);}
	        if (p_population[i]>=5000000) and (p_population[i]<10000000){military=p_population[i]/200;pdf=floor(military*0.75);military=floor(military*0.25);}
	        if (p_population[i]>=100000) and (p_population[i]<5000000){military=p_population[i]/50;pdf=floor(military*0.75);military=floor(military*0.25);}
	        if (p_large[i]=1){military=military*1000000000;pdf=pdf*1000000000;}
        
	        if (p_large[i]=0) and (rando<50) and (military!=0) and (pdf!=0){
	            // if (p_guardsmen[i]<military) and (rando<50){rando=10;contin=max(floor(p_guardsmen[i]*1.05),500);p_population[i]-=contin;p_guardsmen[i]+=contin;}/
	            if (p_pdf[i]<pdf) and (rando<50){rando=1;rando=10;contin=max(floor(p_pdf[i]*1.02),1000);p_population[i]-=contin;p_pdf[i]+=contin;}
	        }
	        if (p_large[i]=1) and (rando<50) and (military!=0) and (pdf!=0){
	            // if (p_guardsmen[i]<military) and (rando<50){rando=10;contin=0.01*p_population[i];p_guardsmen[i]+=contin*1250000;}
	            if (p_pdf[i]<pdf) and (rando<50){rando=1;rando=10;contin=0.01*p_population[i];p_pdf[i]+=contin*1250000;}
	        }
        
	        if (p_large[i]=1){military=floor(p_population[i]*1250000);pdf=military*3;}
	        if (p_population[i]<100000) and (p_population[i]>5) and (p_large[i]=0){pdf=floor(p_population[i]/25);military=0;}
	        if (p_population[i]<2000) and (p_population[i]>5) and (p_large[i]=0){pdf=floor(p_population[i]/10);military=0;}
        
	        if (p_large[i]=0) and (rando<3){
	            // if (p_guardsmen[i]<military) and (rando<3){rando=1;contin=max(floor(p_guardsmen[i]*1.05),500);p_population[i]-=contin;p_guardsmen[i]+=contin;}
	            if (p_pdf[i]<pdf) and (rando<3){rando=1;rando=1;contin=max(floor(p_pdf[i]*1.02),1000);p_population[i]-=contin;p_pdf[i]+=contin;}
	        }
	        if (p_large[i]=1) and (rando<3){
	            // if (p_guardsmen[i]<military) and (rando<3){rando=1;contin=0.01*p_population[i];p_guardsmen[i]+=floor(contin*1250000);}
	            if (p_pdf[i]<pdf) and (rando<3){rando=1;rando=1;contin=0.01*p_population[i];p_pdf[i]+=floor(contin*1250000);}
	        }
	    }
	}


}
