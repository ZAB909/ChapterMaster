function scr_loyalty(argument0, argument1) {
	// argument0 = name
	// argument1 = todo

	// This adds the crime to the chapter history

	if (argument1="+"){
	    var i, noplus;i=0;noplus=0;
    
	    repeat(30){
	        i+=1;noplus=0;
        
	        if (obj_controller.loyal[i]=argument0){// Increases detection chance by a variable amount
	            var amount;amount=0;
	            if (obj_controller.loyal_num[i]<1) then amount=0.03;
            
	            if (argument0="Xeno Associate"){
	                if (obj_controller.loyal_num[i]=0) then amount=0.09;
	                if (obj_controller.loyal_num[i]!=0) then amount=0;
	            }
            
	            if (argument0="Lack of Apothecary") or (argument0="Upset Machine Spirits") or (argument0="Undevout"){
	                if (obj_controller.loyal_num[i]=0) then amount=0.075;
	                if (obj_controller.loyal_num[i]!=0) then amount=0;
	            }
            
	            if (argument0="Xeno Trade") then amount=0.05;
	            if (argument0="Irreverance for His Servants") then amount=0.005;
            
            
	            // if (argument0="Heretic Contact") then amount=0.01;
	            if (argument0="Heretic Contact") then amount=0.099;
            
	            if (argument0="Non-Codex Size"){
	                if (obj_controller.loyal_num[i]=0) then amount=0.06;
	                if (obj_controller.loyal_num[i]!=0) then amount=0;
	            }
            
	            if (argument0="Mutant Gene-Seed"){
	                if (obj_controller.loyal_num[i]=0) then amount=0.01;
	                if (obj_controller.loyal_num[i]!=0) then amount=0;
	            }
            
	            if (argument0="Heretical Homeworld"){
	                if (obj_controller.loyal_num[i]=0) then amount=0.07;
	                if (obj_controller.loyal_num[i]!=0) then amount=0;
	            }
            
	            if (argument0="Inquisitor Killer"){
	                if (obj_controller.loyal_num[i]=0) then amount=0.005;
	                if (obj_controller.loyal_num[i]!=0) then amount=0;
	            }
            
	            if (argument0="Avoiding Inspections"){
	                obj_controller.loyalty-=5;
	                obj_controller.loyalty_hidden-=5;
	                obj_controller.loyal_num[i]+=5;
	                obj_controller.loyal_time[i]=120;
	                amount=0;noplus=1;exit;
	            }
            
	            if (argument0="Lost Standard"){
	                obj_controller.loyalty-=2;
	                obj_controller.loyalty_hidden-=2;
	                obj_controller.loyal_num[i]+=5;
	                obj_controller.loyal_time[i]=9999;
	                amount=0;noplus=1;exit;
	            }
            
	            if (argument0="Refusing to Crusade"){
	                obj_controller.loyalty-=20;
	                obj_controller.loyalty_hidden-=20;
	                obj_controller.loyal_num[i]+=20;
	                obj_controller.loyal_time[i]=9999;
	                amount=0;noplus=1;exit;
	            }
            
	            if (argument0="Crossing the Inquisition"){
	                obj_controller.loyalty-=40;
	                obj_controller.loyalty_hidden-=40;
	                obj_controller.loyal_num[i]+=40;
	                obj_controller.loyal_time[i]=9999;
	                amount=0;noplus=1;exit;
	            }
            
	            if (argument0="Use of Sorcery"){
	                if (string_count("|SC|",obj_controller.useful_info)=0){
	                    obj_controller.loyalty-=30;
	                    obj_controller.loyalty_hidden-=30;
	                    obj_controller.loyal_num[i]+=30;
	                    obj_controller.loyal_time[i]=9999;
	                }
	                amount=0;noplus=1;var one;one=0;
	                obj_controller.useful_info+="|SC|";
                
	                if (obj_controller.disposition[4]>=50) and (one=0) and (string_count("|SC|",obj_controller.useful_info)=1){obj_controller.disposition[4]=20;one=1;}
	                if (obj_controller.disposition[4]<50)  and (string_count("|SC|",obj_controller.useful_info)=1) and (obj_controller.disposition[4]>10) and (one=0){obj_controller.disposition[4]=0;one=2;}
	                if (string_count("|SC|",obj_controller.useful_info)>1){obj_controller.disposition[4]=0;one=2;}
                
	                if (obj_controller.loyalty<=0) and (one<2) then one=2;
	                if (one=1) then with(obj_controller){scr_audience(4,"sorcery1",0,"",0,0);}
	                if (one>=2) and (obj_controller.penitent=0){repeat(2){obj_controller.useful_info+="|SC|";}scr_audience(4,"loyalty_zero",0,"",0,0);}
	                if (one>=2) and (obj_controller.penitent=1){repeat(2){obj_controller.useful_info+="|SC|";}obj_controller.alarm[8]=1;}
                
	                exit;exit;
	            }
            
	            if (noplus=0) then obj_controller.loyal_num[i]+=amount;
	        }
	    }
	}

	if (argument1="inspect_world") or (argument1="inspect_fleet"){
	    var i,diceh,ca,ia,that,wid,hurr;
	    i=0;diceh=0;ca=0;ia=0;that=0;wid=0;hurr=0;
    
	    var sniper,finder,git,demonic;
	    sniper=0;finder=0;git=0;demonic=0;
    
    
	    if (argument1="inspect_world"){
	        with(obj_en_fleet){
	            // if (owner  = eFACTION.Inquisition) then show_message(trade_goods);
	            // if (string_count("Inqis",trade_goods)=0) or (owner  != eFACTION.Inquisition) then instance_deactivate_object(id);
	            if (string_count("Inqis",trade_goods)=0) then instance_deactivate_object(id);
	        }
	        // show_message(instance_number(obj_en_fleet));
	        if (instance_number(obj_en_fleet)>0){
	            that=instance_nearest(room_width/2,room_height/2,obj_star);
	            // show_message(that);
	            instance_activate_object(obj_en_fleet);
            
	            if (that.p_hurssy[1]>0) then hurr+=that.p_hurssy[1];
	            if (that.p_hurssy[2]>0) then hurr+=that.p_hurssy[2];
	            if (that.p_hurssy[3]>0) then hurr+=that.p_hurssy[3];
	            if (that.p_hurssy[4]>0) then hurr+=that.p_hurssy[4];
            
	            if (instance_exists(that)) then repeat(4400){
	                i+=1;
	                if (i<=30){
	                    if (obj_ini.artifact[i]!="") and (obj_ini.artifact_loc[i]=that.name) and (string_count("Daemon",obj_ini.artifact_tags[i])>0){
	                        if (obj_controller.und_armouries=0){hurr+=8;demonic+=1;}
	                    }
	                }
	                if (ca<=10) and (ca>=0){
	                    ia+=1;if (ia=400){ca+=1;ia=1;if (ca=11) then ca=-5;}
	                    if (ca>=0) and (ca<11){
	                        if (obj_ini.loc[ca,ia]=that.name){
	                            if (obj_ini.role[ca,ia]="Ork Sniper") and (obj_ini.race[ca,ia]!=1){hurr+=1;sniper+=1;}
	                            if (obj_ini.role[ca,ia]="Flash Git") and (obj_ini.race[ca,ia]!=1){hurr+=1;git+=1;}
	                            if (obj_ini.role[ca,ia]="Ranger") and (obj_ini.race[ca,ia]!=1){hurr+=1;finder+=1;}
	                            if (string_count("Daemon",obj_ini.wep1[ca,ia])>0){hurr+=8;demonic+=1;}
	                            if (string_count("Daemon",obj_ini.wep2[ca,ia])>0){hurr+=8;demonic+=1;}
	                            if (string_count("Daemon",obj_ini.armour[ca,ia])>0){hurr+=8;demonic+=1;}
	                            if (string_count("Daemon",obj_ini.mobi[ca,ia])>0){hurr+=8;demonic+=1;}
	                            if (string_count("Daemon",obj_ini.gear[ca,ia])>0){hurr+=8;demonic+=1;}
	                        }
	                    }
	                }
	            }
	        }
	    }
    
	    if (argument1="inspect_fleet"){
	        with(obj_en_fleet){
	            if (string_count("Inqis",trade_goods)=0) or (owner  != eFACTION.Inquisition) then instance_deactivate_object(id);
	        }
	        if (instance_exists(obj_en_fleet)) and (instance_exists(obj_p_fleet)){
	            that=instance_nearest(obj_en_fleet.x,obj_en_fleet.y,obj_p_fleet);
            
	            var valid,g,t;i=-1;t=0;valid[0]=0;g=0;
            
	            repeat(50){i+=1;valid[i]=0;}i=0;
	            repeat(that.capital_number){i+=1;if (that.capital_num[i]>0){t+=1;valid[t]=that.capital_num[i];}}i=0;
	            repeat(that.frigate_number){i+=1;if (that.frigate_num[i]>0){t+=1;valid[t]=that.frigate_num[i];}}i=0;
	            repeat(that.escort_number){i+=1;if (that.escort_num[i]>0){t+=1;valid[t]=that.escort_num[i];}}i=0;
            
	            repeat(30){g+=1;good=0;geh=0;
	                i=0;repeat(40){i+=1;if ((obj_ini.artifact_sid[g]-500)=valid[i]) and (valid[i]>0) then geh=1;}
	                if (obj_ini.artifact[g]!="") and (geh=1) and (string_count("Daemon",obj_ini.artifact_tags[g])>0){
	                    if (obj_controller.und_armouries=0){hurr+=8;demonic+=1;}
	                }
	            }
	            i=0;geh=0;good=0;
            
	            if (that.hurssy>0) then hurr+=that.hurssy;
            
	            if (t>0) then repeat(4400){
	                if (ca<=10) and (ca>=0){
	                    ia+=1;if (ia=400){ca+=1;ia=1;if (ca=11) then ca=-5;}
	                    if (ca>=0) and (ca<11){var geh;geh=0;
	                        i=0;repeat(40){i+=1;if (obj_ini.lid[ca,ia]=valid[i]) and (valid[i]>0) then geh=1;}
	                        if (geh=1){
	                            if (obj_ini.role[ca,ia]="Ork Sniper") and (obj_ini.race[ca,ia]!=1){hurr+=1;sniper+=1;}
	                            if (obj_ini.role[ca,ia]="Flash Git") and (obj_ini.race[ca,ia]!=1){hurr+=1;git+=1;}
	                            if (obj_ini.role[ca,ia]="Ranger") and (obj_ini.race[ca,ia]!=1){hurr+=1;finder+=1;}
	                            if (string_count("Daemon",obj_ini.wep1[ca,ia])>0){hurr+=8;demonic+=1;}
	                            if (string_count("Daemon",obj_ini.wep2[ca,ia])>0){hurr+=8;demonic+=1;}
	                            if (string_count("Daemon",obj_ini.armour[ca,ia])>0){hurr+=8;demonic+=1;}
	                            if (string_count("Daemon",obj_ini.mobi[ca,ia])>0){hurr+=8;demonic+=1;}
	                            if (string_count("Daemon",obj_ini.gear[ca,ia])>0){hurr+=8;demonic+=1;}
	                        }
	                    }
	                }
	            }
	        }
	        instance_activate_object(obj_en_fleet);
	    }
    
	    if (hurr>0){
	        var hurrr;hurrr=floor(random(12))+1;
	        if (hurrr<=hurr){
	            obj_controller.alarm[8]=1;
	            if (demonic>0) then scr_alert("red","inspect","Inquisitor discovers Daemonic item(s) in your posession.",0,0);
	            if (sniper>0) then scr_alert("red","inspect","Inquisitor discovers Ork Sniper(s) hired by your chapter.",0,0);
	            if (git>0) then scr_alert("red","inspect","Inquisitor discovers Flash Git(z) hired by your chapter.",0,0);
	            if (finder>0) then scr_alert("red","inspect","Inquisitor discovers Eldar Ranger(s) hired by your chapter.",0,0);
	            if (demonic+sniper+git+finder=0) then scr_alert("red","inspect","Inquisitor discovers heretical material in your posession.",0,0);
	        }
	    }
	    i=0;
    
	    repeat(22){
	        i+=1;diceh=0;
        
	        if (obj_controller.loyal_num[i]<1) and (obj_controller.loyal_num[i]>0) and (obj_controller.loyal[i]!="Avoiding Inspections"){
	            diceh=random(floor(100))+1;
            
	            if (diceh<=(obj_controller.loyal_num[i]*1000)){
	                if (obj_controller.loyal[i]="Heretic Contact"){
	                    obj_controller.loyal_num[i]=80;obj_controller.loyal_time[i]=9999;
	                    scr_alert("red","inspect","Inquisitor discovers evidence of Chaos Lord correspondence.",0,0);
                    
	                    var one;one=0;
	                    if (obj_controller.disposition[4]>=80) and (one=0){obj_controller.disposition[4]=30;one=1;}
	                    if (obj_controller.disposition[4]<80) and (obj_controller.disposition[4]>10) and (one=0){obj_controller.disposition[4]=5;one=2;}
	                    if (obj_controller.disposition[4]<=10) and (one=0){obj_controller.disposition[4]=0;one=3;}
                    
	                    if ((obj_controller.loyalty-80)<=0) and (one<3) then one=3;
	                    if (one=1) then with(obj_controller){scr_audience(4,"chaos_audience1",0,"",0,0);}
	                    if (one=2) then with(obj_controller){scr_audience(4,"chaos_audience2",0,"",0,0);}
	                    if (one=3) then obj_controller.alarm[8]=1;
	                }
	                if (obj_controller.loyal[i]="Heretical Homeworld"){obj_controller.loyal_num[i]=20;obj_controller.loyal_time[i]=3;}
	                if (obj_controller.loyal[i]="Traitorous Marines"){obj_controller.loyal_num[i]=30;obj_controller.loyal_time[i]=9999;}
	                // if (obj_controller.loyal[i]="Use of Sorcery"){obj_controller.loyal_num[i]=30;obj_controller.loyal_time[i]=9999;}
	                if (obj_controller.loyal[i]="Mutant Gene-Seed"){obj_controller.loyal_num[i]=30;obj_controller.loyal_time[i]=9999;}
                
	                if (obj_controller.loyal[i]="Non-Codex Arming"){obj_controller.loyal_num[i]=12;obj_controller.loyal_time[i]=3;}
	                if (obj_controller.loyal[i]="Non-Codex Size"){obj_controller.loyal_num[i]=12;obj_controller.loyal_time[i]=3;}
	                if (obj_controller.loyal[i]="Lack of Apothecary"){obj_controller.loyal_num[i]=8;obj_controller.loyal_time[i]=1;}
	                if (obj_controller.loyal[i]="Upset Machine Spirits"){obj_controller.loyal_num[i]=8;obj_controller.loyal_time[i]=1;}
	                if (obj_controller.loyal[i]="Undevout"){obj_controller.loyal_num[i]=20;obj_controller.loyal_time[i]=3;}
	                if (obj_controller.loyal[i]="Irreverance for His Servants"){obj_controller.loyal_num[i]=12;obj_controller.loyal_time[i]=5;}
	                if (obj_controller.loyal[i]="Unvigilant"){obj_controller.loyal_num[i]=12;obj_controller.loyal_time[i]=9999;}
	                if (obj_controller.loyal[i]="Conduct Unbecoming"){obj_controller.loyal_num[i]=8;obj_controller.loyal_time[i]=9999;}
	                if (obj_controller.loyal[i]="Refusing to Crusade"){obj_controller.loyal_num[i]=20;obj_controller.loyal_time[i]=9999;}
                
	                if (obj_controller.loyal[i]="Eldar Contact"){obj_controller.loyal_num[i]=4;obj_controller.loyal_time[i]=9999;}
	                if (obj_controller.loyal[i]="Ork Contact"){obj_controller.loyal_num[i]=4;obj_controller.loyal_time[i]=9999;}
	                if (obj_controller.loyal[i]="Tau Contact"){obj_controller.loyal_num[i]=4;obj_controller.loyal_time[i]=9999;}
	                if (obj_controller.loyal[i]="Xeno Trade"){obj_controller.loyal_num[i]=20;obj_controller.loyal_time[i]=9999;}
	                if (obj_controller.loyal[i]="Xeno Associate"){obj_controller.loyal_num[i]=20;obj_controller.loyal_time[i]=9999;}
                
	                if (obj_controller.loyal[i]="Inquisitor Killer"){obj_controller.loyal_num[i]=100;obj_controller.loyal_time[i]=9999;}
	                // if (obj_controller.loyal[i]="Avoiding Inspections"){obj_controller.loyal_num[i]=20;obj_controller.loyal_time[i]=120;}
	                // if (obj_controller.loyal[i]="Lost Standard"){obj_controller.loyal_num[i]=10;obj_controller.loyal_time[i]=9999;}
                
	                obj_controller.loyalty_hidden-=obj_controller.loyal_num[i];
	            }
	        }
	    }// End repeat
    
	    obj_controller.loyalty=obj_controller.loyalty_hidden;
	}







	/*
	if (argument1="+"){
	    var i;i=0;
    
	    repeat(20){
	        i+=1;
        
	        if (obj_controller.loyal[i]=argument0){// Increases detection chance by a variable amount
	            var amount;amount=0;
	            if (obj_controller.loyal_num[i]<1) then amount=0.03;
            
	            if (argument0="Xeno Associate"){
	                if (obj_controller.loyal_num[i]=0) then amount=0.09;
	                if (obj_controller.loyal_num[i]!=0) then amount=0;
	            }
            
	            if (argument0="Lack of Apothecary") or (argument0="Upset Machine Spirits") or (argument0="Undevout"){
	                if (obj_controller.loyal_num[i]=0) then amount=0.075;
	                if (obj_controller.loyal_num[i]!=0) then amount=0;
	            }
            
	            if (argument0="Xeno Trade") then amount=0.05;
	            if (argument0="Irreverance for His Servants") then amount=0.005;
            
	            if (argument0="Non-Codex Size"){
	                if (obj_controller.loyal_num[i]=0) then amount=0.06;
	                if (obj_controller.loyal_num[i]!=0) then amount=0;
	            }
            
	            if (argument0="Mutant Gene-Seed"){
	                if (obj_controller.loyal_num[i]=0) then amount=0.01;
	                if (obj_controller.loyal_num[i]!=0) then amount=0;
	            }
            
	            if (argument0="Heretical Homeworld"){
	                if (obj_controller.loyal_num[i]=0) then amount=0.07;
	                if (obj_controller.loyal_num[i]!=0) then amount=0;
	            }
            
	            if (argument0="Inquisitor Killer"){
	                if (obj_controller.loyal_num[i]=0) then amount=0.005;
	                if (obj_controller.loyal_num[i]!=0) then amount=0;
	            }
            
	            if (argument0="Avoiding Inspections"){
	                obj_controller.loyal_num[i]=floor(obj_controller.loyal_num[i]+5);
	                obj_controller.loyalty_hidden-=5;
	                obj_controller.loyal_time[i]=120;
	            }
            
	            if (argument0="Lost Standard"){
	                obj_controller.loyal_num[i]=floor(obj_controller.loyal_num[i]+8);
	                obj_controller.loyalty_hidden-=2;
	                obj_controller.loyal_time[i]=9999;
	            }
            
	            obj_controller.loyal_num[i]+=amount;
            
	        }
	    }	
	}

	if (argument1="inspect_world") or (argument1="inspect_fleet"){
	    var i,diceh;
	    i=0;diceh=0;
    
	    repeat(20){
	        i+=1;diceh=0;
        
	        // show_message(obj_controller.loyal_num[i]);
        
        
	        if (obj_controller.loyal_num[i]<1) and (obj_controller.loyal_num[i]>0) and (obj_controller.loyal[i]!="Avoiding Inspections"){
	            diceh=random(floor(100))+1;
            
	            if (diceh<=(obj_controller.loyal_num[i]*1000)){
	                if (obj_controller.loyal[i]="Heretic Contact"){obj_controller.loyal_num[i]=20;obj_controller.loyal_time[i]=5;}
	                if (obj_controller.loyal[i]="Heretical Homeworld"){obj_controller.loyal_num[i]=20;obj_controller.loyal_time[i]=3;}
	                if (obj_controller.loyal[i]="Traitorous Marines"){obj_controller.loyal_num[i]=30;obj_controller.loyal_time[i]=9999;}
	                if (obj_controller.loyal[i]="Mutant Gene-Seed"){obj_controller.loyal_num[i]=30;obj_controller.loyal_time[i]=9999;}
                
	                if (obj_controller.loyal[i]="Non-Codex Arming"){obj_controller.loyal_num[i]=12;obj_controller.loyal_time[i]=3;}
	                if (obj_controller.loyal[i]="Non-Codex Size"){obj_controller.loyal_num[i]=12;obj_controller.loyal_time[i]=3;}
	                if (obj_controller.loyal[i]="Lack of Apothecary"){obj_controller.loyal_num[i]=8;obj_controller.loyal_time[i]=1;}
	                if (obj_controller.loyal[i]="Upset Machine Spirits"){obj_controller.loyal_num[i]=8;obj_controller.loyal_time[i]=1;}
	                if (obj_controller.loyal[i]="Undevout"){obj_controller.loyal_num[i]=20;obj_controller.loyal_time[i]=3;}
	                if (obj_controller.loyal[i]="Irreverance for His Servants"){obj_controller.loyal_num[i]=12;obj_controller.loyal_time[i]=5;}
	                if (obj_controller.loyal[i]="Unvigilant"){obj_controller.loyal_num[i]=12;obj_controller.loyal_time[i]=9999;}
	                if (obj_controller.loyal[i]="Conduct Unbecoming"){obj_controller.loyal_num[i]=8;obj_controller.loyal_time[i]=9999;}
                
	                if (obj_controller.loyal[i]="Eldar Contact"){obj_controller.loyal_num[i]=4;obj_controller.loyal_time[i]=9999;}
	                if (obj_controller.loyal[i]="Ork Contact"){obj_controller.loyal_num[i]=4;obj_controller.loyal_time[i]=9999;}
	                if (obj_controller.loyal[i]="Tau Contact"){obj_controller.loyal_num[i]=4;obj_controller.loyal_time[i]=9999;}
	                if (obj_controller.loyal[i]="Xeno Trade"){obj_controller.loyal_num[i]=20;obj_controller.loyal_time[i]=9999;}
	                if (obj_controller.loyal[i]="Xeno Associate"){obj_controller.loyal_num[i]=20;obj_controller.loyal_time[i]=9999;}
                
	                if (obj_controller.loyal[i]="Inquisitor Killer"){obj_controller.loyal_num[i]=100;obj_controller.loyal_time[i]=9999;}
	                if (obj_controller.loyal[i]="Avoiding Inspections"){obj_controller.loyal_num[i]=20;obj_controller.loyal_time[i]=120;}
	                if (obj_controller.loyal[i]="Lost Standard"){obj_controller.loyal_num[i]=10;obj_controller.loyal_time[i]=9999;}
                
	                obj_controller.loyalty_hidden-=obj_controller.loyal_num[i];
	            }
	        }
	    }// End repeat
    
	    obj_controller.loyalty=obj_controller.loyalty_hidden;
	}*/


}
