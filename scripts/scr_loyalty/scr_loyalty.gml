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
	                amount=0;
	                noplus=1;
	                exit;
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

}
