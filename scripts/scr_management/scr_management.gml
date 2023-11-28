function scr_management(argument0) {

	// argument0        1: overview         10+: that chapter -10
	// Creates the company blocks in the main management screen and assigns text to them


	// Variable creation
	var num=0, nam="", company=50, q=0;	
	var romanNumerals=scr_roman_numerals();

	if (argument0=1){
	    with(obj_managment_panel){instance_destroy();}

	    var pane;
		
		pane=instance_create(700,180-48,obj_managment_panel);
	    pane.company=0;
		pane.manage=11;
		pane.header=3;
		pane.title="CHAPTER MASTER";
    
	    pane=instance_create(475,180-48,obj_managment_panel);
	    pane.company=0;
		pane.manage=14;
		pane.header=2;
		pane.title="RECLUSIUM";
    
	    pane=instance_create(275,180-48,obj_managment_panel);
	    pane.company=0;
		pane.manage=12;
		pane.header=2;
		pane.title="APOTHECARIUM";
    
	    pane=instance_create(925,180-48,obj_managment_panel);
	    pane.company=0;
		pane.manage=15;
		pane.header=2;
		pane.title="ARMOURY";
    
	    pane=instance_create(1125,180-48,obj_managment_panel);
	    pane.company=0;
		pane.manage=13;
		pane.header=2;
		pane.title="LIBRARIUM";

		// Coordinates declaration and text initiation
	    var xx=25,yy=400-48,t;
    
		// Creates the first 10 companies using roman numerals
	    for (var i = 1; i <= 10; i++) {
			t = string(romanNumerals[i - 1]);
			t += " COMPANY";
    
			var pane = instance_create(xx, yy, obj_managment_panel);
			pane.company = i;
			pane.manage = i;
			pane.header = 1;
			pane.title = t;
    
			xx += 156;
		}
		
		// Generates the company if there are more than 10 companites
		// TODO improve logic or add extra romanNumerals to array TBD
	    if (obj_ini.companies>10){
	        xx=25;
			yy=400-48+(258);
			t="";
        
	        for (var i = 11; i <= obj_ini.companies; i++) {
				t = string(i) + "th ";
				t += "COMPANY";
        
				var pane = instance_create(xx, yy, obj_managment_panel);
				pane.company = i;
				pane.manage = i + 100;
				pane.header = 1;
				pane.title = t;
        
				xx += 156;
			}
	    }

		for(var i=1;i<=50;i++) {
			num[i] = 0;
			nam[i] = "";
		}
		
	    // ****** MAIN PANEL ******
	    company=0;
		obj_controller.temp[71]=11;
	    num[1]=1;
		nam[1]=obj_ini.name[company,1];
		
	    for (var i = 1; i <= 200; i++) {
			if (obj_ini.role[0, i] == obj_ini.role[100, 2]) then num[2] += 1;
		}
		
	    if (num[2]=0) then nam[2]="Strategic Staff";// reserved for co-master alien or something
		
	    if (num[2]>0) {
			nam[2]=string(num)+"x "+string(obj_ini.role[100][2]);
			nam[3]="Strategic Staff";
			num[3]=1;
		}
		
	    with(obj_managment_panel){if (manage!=obj_controller.temp[71]) then instance_deactivate_object(id);}
		
	    for (var i = 1; i <= 10; i++) {
			obj_managment_panel.line[i] = nam[i];
		}
	    obj_managment_panel.italic[1]=1;
		instance_activate_object(obj_managment_panel);
    
	    // ll=0;ll2=0;repeat(200){ll2+=1;if (obj_ini.role[company,ll2]=obj_ini.role[100][2]) then ll+=1;}
	    // if (ll>0) then temp[3]=string(ll)+"x "+string(obj_ini.role[100][2]);
    
	
    
	    // ** Apothecarium **
	    q=0;
		company=0;
		obj_controller.temp[71]=12;
	    for (var i = 0; i < 50; i++) {
			num[i] = 0;
			nam[i] = "";
		}
	    nam[2]=obj_ini.role[100][15];
		
		// Ranks
		nam[3]=string(obj_ini.role[100][15])+" Aspirant";// nam[4]="Sister Hospitaler";
		
	    for (var i = 1; i <= 200; i++) {
			if (obj_ini.role[0, i] == "Master of the Apothecarion") {
				num[1] += 1;
				if (nam[1] == "") then nam[1] = obj_ini.name[0, i];
			}
    
			if (obj_ini.role[0, i] == obj_ini.role[100, 15]) then num[2] += 1;
    
			if (obj_ini.role[0, i] == string(obj_ini.role[100, 15]) + " Aspirant") then num[3] += 1;
			// if (obj_ini.role[0, i] == "Sister Hospitaler") then num[4] += 1;
		}
		
	    with(obj_managment_panel){if (manage!=obj_controller.temp[71]) then instance_deactivate_object(id);}
		
	    if (num[1]>0){
			q+=1;obj_managment_panel.line[q]=string(nam[1]);
			obj_managment_panel.italic[q]=1;
		}
	    if (num[2]>0){
			q+=1;
			obj_managment_panel.line[q]=string(num[2])+"x "+string(nam[2]);
		}
	    if (num[3]>0){
			q+=1;
			obj_managment_panel.line[q]=string(num[3])+"x "+string(nam[3]);
		}
	    // if (num[4]>0){q+=1;obj_managment_panel.line[q]=string(num[4])+"x "+string(nam[4]);}
	    instance_activate_object(obj_managment_panel);
	
	    // ** Reclusium **
		q=0;
	    company=0;
		obj_controller.temp[71]=14;
		
	    for (var i = 0; i < 50; i++) {
			num[i] = 0;
			nam[i] = "";
		}
		
	    nam[2]=obj_ini.role[100][14];
		
		// Ranks
		nam[3]=string(obj_ini.role[100][14])+" Aspirant";
		
	    for (var i = 1; i <= 200; i++) {
			if (obj_ini.role[0, i] == "Master of Sanctity") {
				num[1] += 1;
				if (nam[1] == "") then nam[1] = obj_ini.name[0, i];
			}
    
			if (obj_ini.role[0, i] == obj_ini.role[100, 14]) then num[2] += 1;
    
			if (obj_ini.role[0, i] == string(obj_ini.role[100, 14]) + " Aspirant") then num[3] += 1;
		}
		
	    with(obj_managment_panel){if (manage!=obj_controller.temp[71]) then instance_deactivate_object(id);}
		
	    if (num[1]>0){
			q+=1;
			obj_managment_panel.line[q]=string(nam[1]);
			obj_managment_panel.italic[q]=1;
		}
		
		// TODO add specific Space Wolves and successor chapter logic for Master of Sanctity
	    // if (global.chapter_name!="Space Wolves")
		
		// Specific Iron Hands chapter logic
	    if (global.chapter_name!="Iron Hands"){
	        if (num[2]>0){
				q+=1;
				obj_managment_panel.line[q]=string(num[2])+"x "+string(nam[2]);
			}
	        if (num[3]>0){
				q+=1;
				obj_managment_panel.line[q]=string(num[3])+"x "+string(nam[3]);
			}
	    }
	    instance_activate_object(obj_managment_panel);
    
	
	
	    // ** Armoury **
	    q=0;
		company=0;
		obj_controller.temp[71]=15;
		
	    for (var i = 0; i < 50; i++) {
			num[i] = 0;
			nam[i] = "";
		}
		
	    nam[2]=obj_ini.role[100][16];
		
		// Ranks
		nam[3]=string(obj_ini.role[100][16])+" Aspirant";
		nam[4]="Techpriest";
		
	    for (var i = 1; i <= 200; i++) {
			if (obj_ini.role[0, i] == "Forge Master") {
				num[1] += 1;
				if (nam[1] == "") then nam[1] = obj_ini.name[0, i];
			}
    
			if (obj_ini.role[0, i] == obj_ini.role[100, 16]) then num[2] += 1;
    
			if (obj_ini.role[0, i] == string(obj_ini.role[100, 16]) + " Aspirant") then num[3] += 1;
    
			if (obj_ini.role[0, i] == "Techpriest") then num[4] += 1;
		}
		
	    with(obj_managment_panel){if (manage!=obj_controller.temp[71]) then instance_deactivate_object(id);}
		
	    if (num[1]>0){
			q+=1;
			obj_managment_panel.line[q]=string(nam[1]);
			obj_managment_panel.italic[q]=1;
		}
		
	    if (num[2]>0){
			q+=1;
			obj_managment_panel.line[q]=string(num[2])+"x "+string(nam[2]);
		}
		
	    if (num[3]>0){
			q+=1;
			obj_managment_panel.line[q]=string(num[3])+"x "+string(nam[3]);
		}
		
	    if (num[4]>0){
			q+=1;
			obj_managment_panel.line[q]=string(num[4])+"x "+string(nam[4]);
		}
		
	    instance_activate_object(obj_managment_panel);
	
	    // ** Librarium **
		q=0;
	    company=0;
		obj_controller.temp[71]=13;
	    for (var i=0;i<50;i++) {
			num[i] = 0;
			nam[i] = "";
		}
		
	    nam[2]=obj_ini.role[100,17];
		
		// Ranks
		nam[3]="Codiciery";
		nam[4]="Lexicanum";
		nam[5]=string(obj_ini.role[100,17])+" Aspirant";
		
	    for (var i = 1; i <= 200; i++) {
			if (obj_ini.role[0, i] == "Chief " + string(obj_ini.role[100, 17])) {
				num[1] += 1;
				if (nam[1] == "") then nam[1] = obj_ini.name[0, i];
			}
    
			if (obj_ini.role[0, i] == obj_ini.role[100, 17]) then num[2] += 1;
    
			if (obj_ini.role[0, i] == "Codiciery") then num[3] += 1;
    
			if (obj_ini.role[0, i] == "Lexicanum") then num[4] += 1;
    
			if (obj_ini.role[0, i] == string(obj_ini.role[100, 15]) + " Aspirant") then num[5] += 1;
		}
		
	    with(obj_managment_panel){if (manage!=obj_controller.temp[71]) then instance_deactivate_object(id);}
		
	    if (num[1]>0){
			q+=1;
			obj_managment_panel.line[q]=string(nam[1]);obj_managment_panel.italic[q]=1;
		}
		
	    if (num[2]>0){
			q+=1;
			obj_managment_panel.line[q]=string(num[2])+"x "+string(nam[2]);
		}
		
	    if (num[3]>0){
			q+=1;
			obj_managment_panel.line[q]=string(num[3])+"x "+string(nam[3]);
		}
		
	    if (num[4]>0){
			q+=1;
			obj_managment_panel.line[q]=string(num[4])+"x "+string(nam[4]);
		}
		
	    if (num[5]>0){
			q+=1;
			obj_managment_panel.line[q]=string(num[5])+"x "+string(nam[5]);
		}
		
	    instance_activate_object(obj_managment_panel);
	    
		// ** Marines and vehicles per company and HQ by ranks **
		
	    for (company=1;company<=obj_ini.companies;company++){
	        q=0;
			obj_controller.temp[71]=company;
			
	        for (var i=0;i<50;i++) {
				num[i] = 0;
				nam[i] = "";
			}
        
			// Indexing the names to nam array
	        nam[1]=obj_ini.role[100][5];
	        nam[2]=obj_ini.role[100][14];
	        nam[3]=obj_ini.role[100][15];
	        nam[4]=obj_ini.role[100,17];
	        nam[5]="Codiciery";
	        nam[6]="Lexicanum";
	        nam[7]="Standard Bearer";
	        nam[8]=obj_ini.role[100][4];
	        nam[9]="Techmarine";
	        nam[10]=obj_ini.role[100][3];
	        nam[11]=obj_ini.role[100][8];
	        nam[12]=obj_ini.role[100][10];
	        nam[13]=obj_ini.role[100][9];
	        nam[14]=obj_ini.role[100][12];
	        nam[15]="Venerable "+string(obj_ini.role[100][6]);
	        nam[16]=obj_ini.role[100][6];
	        nam[17]="Land Raider";
	        nam[18]="Predator";
	        nam[19]="Rhino";
	        nam[20]="Land Speeder";
	        nam[21]="Whirlwind";
        
	        for (var i=1;i<=300;i++) {
	            if (obj_ini.role[company,i]=obj_ini.role[100][5]) then num[1]+=1;
	            if (obj_ini.role[company,i]=obj_ini.role[100][14]) then num[2]+=1;
				// Space Wolves exception
	            if (global.chapter_name!="Space Wolves"){
					if (obj_ini.role[company,i]=obj_ini.role[100][15]) then num[3]+=1;
				}
	            if (obj_ini.role[company,i]=obj_ini.role[100,17]) then num[4]+=1;
	            if (obj_ini.role[company,i]="Codiciery") then num[5]+=1;
	            if (obj_ini.role[company,i]="Lexicanum") then num[6]+=1;
	            if (obj_ini.role[company,i]="Standard Bearer") then num[7]+=1;
	            if (obj_ini.role[company,i]=obj_ini.role[100][4]) then num[8]+=1;
	            if (obj_ini.role[company,i]="Techmarine") then num[9]+=1;
	            if (obj_ini.role[company,i]=obj_ini.role[100][3]) then num[10]+=1;
	            if (obj_ini.role[company,i]=obj_ini.role[100][8]) then num[11]+=1;
	            if (obj_ini.role[company,i]=obj_ini.role[100][10]) then num[12]+=1;
	            if (obj_ini.role[company,i]=obj_ini.role[100][9]) then num[13]+=1;
	            if (obj_ini.role[company,i]=obj_ini.role[100][12]) then num[14]+=1;
	            if (obj_ini.role[company,i]="Venerable "+string(obj_ini.role[100][6])) then num[15]+=1;
	            if (obj_ini.role[company,i]=obj_ini.role[100][6]) then num[16]+=1;
	            // Vehicles
				if (i<=100){
	                if (obj_ini.veh_role[company,i]="Land Raider") then num[17]+=1;
	                if (obj_ini.veh_role[company,i]="Predator") then num[18]+=1;
	                if (obj_ini.veh_role[company,i]="Rhino") then num[19]+=1;
	                if (obj_ini.veh_role[company,i]="Land Speeder") then num[20]+=1;
	                if (obj_ini.veh_role[company,i]="Whirlwind") then num[21]+=1;
	            }
	        }
			
	        with(obj_managment_panel){if (manage!=obj_controller.temp[71]) then instance_deactivate_object(id);}
			
	        q=0;
			for (var d=1;d<=21;d++) {
				if (num[d] > 0) {
					q += 1;
					obj_managment_panel.line[q] = string(num[d]) + "x " + string(nam[d]);
				}
			}
			
	        instance_activate_object(obj_managment_panel);
	    }
	}
	exit;


	    /*
	    temp[6]=string(obj_ini.name[company,2]);
	    ll2=0;ll=0;trainee=0;
	    repeat(200){ll2+=1;
	        if (obj_ini.role[company,ll2]=obj_ini.role[100][16]) then ll+=1;
	        if (obj_ini.role[company,ll2]=obj_ini.role[100][16]+" Aspirant") then trainee+=1;
	    }
	    if (ll>0){
	        temp[7]=string(ll)+"x "+string(obj_ini.role[100][16]);
	        temp[8]="Numerous Servitors";
	        if (trainee>0){temp[9]=temp[8];temp[8]=string(trainee)+"x Aspirant";}
        
	    }
	    if (ll=0){
	        temp[7]="Numerous Servitors";
	        if (trainee>0){temp[8]=temp[7];temp[7]=string(trainee)+"x Aspirant";}
	    }
	    if (trainee=0) then temp[9]="";
    
    
    
	    temp[12]=string(obj_ini.name[company,4]);
	    ll2=0;ll=0;trainee=0;
	    repeat(200){ll2+=1;
	        if (obj_ini.role[company,ll2]=obj_ini.role[100][15]) then ll+=1;
	        if (obj_ini.role[company,ll2]=string(obj_ini.role[100][15])+" Aspirant") then trainee+=1;
	    }
	    if (ll>0){
	        temp[13]=string(ll)+"x "+string(obj_ini.role[100][15]);
	        if (trainee>0) then temp[14]=string(trainee)+"x Aspirant";
	    }
	    if (ll=0){
	        if (trainee>0) then temp[13]=string(trainee)+"x Aspirant";
	    }
	    if (trainee=0) then temp[14]="";
    
    
	    temp[16]=string(obj_ini.name[company,3]);
	    ll2=0;ll=0;trainee=0;
	    if (global.chapter_name!="Space Wolves"){repeat(200){ll2+=1;
	        if (obj_ini.role[company,ll2]=obj_ini.role[100][14]) then ll+=1;
	        if (obj_ini.role[company,ll2]=string(obj_ini.role[100][14])+" Aspirant") then trainee+=1;
	    }
	    if (ll>0){
	        temp[17]=string(ll)+"x "+string(obj_ini.role[100][14]);
	        if (trainee>0) then temp[18]=string(trainee)+"x Aspirant";
	    }
	    if (ll=0){
	        if (trainee>0) then temp[17]=string(trainee)+"x Aspirant";
	    }
	    }
	    if (trainee=0) then temp[18]="";
	    if (global.chapter_name="Space Wolves"){temp[18]="";trainee=0;}
    
    
	    temp[20]=string(obj_ini.name[company,5]);trainee=0;
	    ll2=0;ll=0;
	    repeat(200){ll2+=1;
	        if (obj_ini.role[company,ll2]=obj_ini.role[100,17]) then ll+=1;
	    }
	    if (ll>0){
	        temp[21]=string(ll)+"x "+string(obj_ini.role[100,17]);
	    }
    
	    ll2=0;ll=0;
	    repeat(200){
	        ll2+=1;
	        if (obj_ini.role[company,ll2]="Codiciery") then ll+=1;
	    }
	    if (ll>0){
	        temp[22]=string(ll)+"x Codiciery";
	    }
    
	    ll2=0;ll=0;
	    repeat(200){
	        ll2+=1;if (obj_ini.role[company,ll2]="Lexicanum") then ll+=1;
	    }
	    if (ll>0){
	        temp[23]=string(ll)+"x Lexicanum";
	    }
    
	    ll2=0;ll=0;
	    repeat(200){
	        ll2+=1;if (obj_ini.role[company,ll2]=string(obj_ini.role[100,17])+" Aspirant") then trainee+=1;
	    }
	    if (trainee>0){
	        temp[24]=string(trainee)+"x Aspirant";
	    }
	    if (trainee=0) then temp[24]="";
    
    
    
	    // First Company
	    var termi, veter, capt, chap, apoth, stand, dread, tact, assa, deva, rhino, speeder, raider, standard, bike, scou, whirl, pred;
	    termi=0;veter=0;capt=0;chap=0;apoth=0;stand=0;dread=0;tact=0;assa=0;deva=0;rhino=0;speeder=0;raider=0;standard=0;bike=0;ll=0;scou=0;whirl=0;pred=0;company=1;
	    repeat(max(100,obj_ini.firsts)){ll+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][5]) then capt+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][14]) and (global.chapter_name!="Space Wolves") then chap+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][15]) then apoth+=1;
	        if (obj_ini.role[company,ll]="Standard Bearer") then standard+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][4]) then termi+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][3]) then veter+=1;
	        if (obj_ini.role[company,ll]="Venerable "+string(obj_ini.role[100][6])) then dread+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][12]) then scou+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][8]) then tact+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][10]) then assa+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][9]) then deva+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][6]) then dread+=1;    
	        if (obj_ini.veh_role[company,ll]="Rhino") then rhino+=1;
	        if (obj_ini.veh_role[company,ll]="Land Raider") then raider+=1;
	        if (obj_ini.veh_role[company,ll]="Bike") then bike+=1;
	    }
	    temp[30]="";
	    if (capt>=1) then temp[30]=string(obj_ini.role[100][5])+"#";
	    if (standard>=1) then temp[30]+="Standard Bearer#";
	    if (chap>=1) then temp[30]+=string(chap)+"x "+string(obj_ini.role[100][14])+"#";
	    if (apoth>=1) then temp[30]+=string(apoth)+"x "+string(obj_ini.role[100][15])+"#";
	    if (termi>0) then temp[30]+=string(termi)+"x Terminator#";
	    if (veter>0) then temp[30]+=string(veter)+"x "+string(obj_ini.role[100][3])+"#";
	    if (dread>0) then temp[30]+=string(dread)+"x Ven. "+string(obj_ini.role[100][6])+"#";
	    if (raider>0) then temp[30]+=string(raider)+" Land Raider#";
	    if (rhino>0) then temp[30]+=string(rhino)+" Rhino#";
	    if (bike>0) then temp[30]+=string(bike)+" Bike#";
    
    
    
	    // Second Company
	    termi=0;veter=0;capt=0;chap=0;apoth=0;stand=0;dread=0;tact=0;assa=0;deva=0;rhino=0;speeder=0;raider=0;standard=0;bike=0;ll=0;whirl=0;pred=0;company=2;
	    repeat(400){ll+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][5]) then capt+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][14]) and (global.chapter_name!="Space Wolves") then chap+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][15]) then apoth+=1;
	        if (obj_ini.role[company,ll]="Standard Bearer") then standard+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][12]) then scou+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][8]) then tact+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][10]) then assa+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][9]) then deva+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][6]) then dread+=1;
        
	        if (ll<=100){
	        if (obj_ini.veh_role[company,ll]="Land Raider") then raider+=1;
	        if (obj_ini.veh_role[company,ll]="Rhino") then rhino+=1;
	        if (obj_ini.veh_role[company,ll]="Land Speeder") then speeder+=1;
	        if (obj_ini.veh_role[company,ll]="Bike") then bike+=1;
	        if (obj_ini.veh_role[company,ll]="Predator") then pred+=1;
	        if (obj_ini.veh_role[company,ll]="Whirlwind") then whirl+=1;}
        
	    }temp[31]="";
	    if (capt>=1) then temp[31]=string(obj_ini.role[100][5])+"#";
	    if (standard>=1) then temp[31]+="Standard Bearer#";
	    if (chap>=1) then temp[31]+=string(chap)+"x "+string(obj_ini.role[100][14])+"#";
	    if (apoth>=1) then temp[31]+=string(apoth)+"x "+string(obj_ini.role[100][15])+"#";
	    if (tact>0) then temp[31]+=string(tact)+"x "+string(obj_ini.role[100][8])+"#";
	    if (assa>0) then temp[31]+=string(assa)+"x "+string(obj_ini.role[100][10])+"#";
	    if (deva>0) then temp[31]+=string(deva)+"x "+string(obj_ini.role[100][9])+"#";
	    if (termi>0) then temp[31]+=string(termi)+"x Terminator#";
	    if (veter>0) then temp[31]+=string(veter)+"x "+string(obj_ini.role[100][3])+"#";
	    if (dread>0) then temp[31]+=string(dread)+"x "+string(obj_ini.role[100][6])+"#";
	    if (raider>0) then temp[31]+=string(raider)+" Land Raider#";
	    if (rhino>0) then temp[31]+=string(rhino)+" Rhino#";
	    if (pred>0) then temp[31]+=string(pred)+" Predator#";
	    if (whirl>0) then temp[31]+=string(whirl)+" Whirlwind#";
	    if (raider>0) then temp[31]+=string(speeder)+" Land Speeder#";
	    if (bike>0) then temp[31]+=string(bike)+" Bike#";
    
    
    
	    // Third Company
	    termi=0;veter=0;capt=0;chap=0;apoth=0;stand=0;dread=0;tact=0;assa=0;deva=0;rhino=0;speeder=0;raider=0;standard=0;bike=0;ll=0;whirl=0;pred=0;company=3;
	    repeat(400){ll+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][5]) then capt+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][14]) and (global.chapter_name!="Space Wolves") then chap+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][15]) then apoth+=1;
	        if (obj_ini.role[company,ll]="Standard Bearer") then standard+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][12]) then scou+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][8]) then tact+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][10]) then assa+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][9]) then deva+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][6]) then dread+=1;
        
	        if (ll<=100){
	        if (obj_ini.veh_role[company,ll]="Land Raider") then raider+=1;
	        if (obj_ini.veh_role[company,ll]="Rhino") then rhino+=1;
	        if (obj_ini.veh_role[company,ll]="Land Speeder") then speeder+=1;
	        if (obj_ini.veh_role[company,ll]="Bike") then bike+=1;
	        if (obj_ini.veh_role[company,ll]="Predator") then pred+=1;
	        if (obj_ini.veh_role[company,ll]="Whirlwind") then whirl+=1;}
	    }temp[32]="";
	    if (capt>=1) then temp[32]=string(obj_ini.role[100][5])+"#";
	    if (standard>=1) then temp[32]+="Standard Bearer#";
	    if (chap>=1) then temp[32]+=string(chap)+"x "+string(obj_ini.role[100][14])+"#";
	    if (apoth>=1) then temp[32]+=string(apoth)+"x "+string(obj_ini.role[100][15])+"#";
	    if (tact>0) then temp[32]+=string(tact)+"x "+string(obj_ini.role[100][8])+"#";
	    if (assa>0) then temp[32]+=string(assa)+"x "+string(obj_ini.role[100][10])+"#";
	    if (deva>0) then temp[32]+=string(deva)+"x "+string(obj_ini.role[100][9])+"#";
	    if (termi>0) then temp[32]+=string(termi)+"x Terminator#";
	    if (veter>0) then temp[32]+=string(veter)+"x "+string(obj_ini.role[100][3])+"#";
	    if (dread>0) then temp[32]+=string(dread)+"x "+string(obj_ini.role[100][6])+"#";
	    if (raider>0) then temp[32]+=string(raider)+" Land Raider#";
	    if (rhino>0) then temp[32]+=string(rhino)+" Rhino#";
	    if (pred>0) then temp[32]+=string(pred)+" Predator#";
	    if (whirl>0) then temp[32]+=string(whirl)+" Whirlwind#";
	    if (raider>0) then temp[32]+=string(speeder)+" Land Speeder#";
	    if (bike>0) then temp[32]+=string(bike)+" Bike#";
    
	    // Fourth Company
	    termi=0;veter=0;capt=0;chap=0;apoth=0;stand=0;dread=0;tact=0;assa=0;deva=0;rhino=0;speeder=0;raider=0;standard=0;bike=0;ll=0;whirl=0;pred=0;company=4;
	    repeat(400){ll+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][5]) then capt+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][14]) and (global.chapter_name!="Space Wolves") then chap+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][15]) then apoth+=1;
	        if (obj_ini.role[company,ll]="Standard Bearer") then standard+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][12]) then scou+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][8]) then tact+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][10]) then assa+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][9]) then deva+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][6]) then dread+=1;
        
	        if (ll<=100){
	        if (obj_ini.veh_role[company,ll]="Land Raider") then raider+=1;
	        if (obj_ini.veh_role[company,ll]="Rhino") then rhino+=1;
	        if (obj_ini.veh_role[company,ll]="Land Speeder") then speeder+=1;
	        if (obj_ini.veh_role[company,ll]="Bike") then bike+=1;
	        if (obj_ini.veh_role[company,ll]="Predator") then pred+=1;
	        if (obj_ini.veh_role[company,ll]="Whirlwind") then whirl+=1;}
	    }temp[33]="";
	    if (capt>=1) then temp[33]=string(obj_ini.role[100][5])+"#";
	    if (standard>=1) then temp[33]+="Standard Bearer#";
	    if (chap>=1) then temp[33]+=string(chap)+"x "+string(obj_ini.role[100][14])+"#";
	    if (apoth>=1) then temp[33]+=string(apoth)+"x "+string(obj_ini.role[100][15])+"#";
	    if (tact>0) then temp[33]+=string(tact)+"x "+string(obj_ini.role[100][8])+"#";
	    if (assa>0) then temp[33]+=string(assa)+"x "+string(obj_ini.role[100][10])+"#";
	    if (deva>0) then temp[33]+=string(deva)+"x "+string(obj_ini.role[100][9])+"#";
	    if (termi>0) then temp[33]+=string(termi)+"x Terminator#";
	    if (veter>0) then temp[33]+=string(veter)+"x "+string(obj_ini.role[100][3])+"#";
	    if (dread>0) then temp[33]+=string(dread)+"x "+string(obj_ini.role[100][6])+"#";
	    if (raider>0) then temp[33]+=string(raider)+" Land Raider#";
	    if (rhino>0) then temp[33]+=string(rhino)+" Rhino#";
	    if (pred>0) then temp[33]+=string(pred)+" Predator#";
	    if (whirl>0) then temp[33]+=string(whirl)+" Whirlwind#";
	    if (raider>0) then temp[33]+=string(speeder)+" Land Speeder#";
	    if (bike>0) then temp[33]+=string(bike)+" Bike#";
    
	    // Fifth Company
	    termi=0;veter=0;capt=0;chap=0;apoth=0;stand=0;dread=0;tact=0;assa=0;deva=0;rhino=0;speeder=0;raider=0;standard=0;bike=0;ll=0;whirl=0;pred=0;company=5;
	    repeat(400){ll+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][5]) then capt+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][14]) and (global.chapter_name!="Space Wolves") then chap+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][15]) then apoth+=1;
	        if (obj_ini.role[company,ll]="Standard Bearer") then standard+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][12]) then scou+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][8]) then tact+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][10]) then assa+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][9]) then deva+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][6]) then dread+=1;
        
	        if (ll<=100){
	        if (obj_ini.veh_role[company,ll]="Land Raider") then raider+=1;
	        if (obj_ini.veh_role[company,ll]="Rhino") then rhino+=1;
	        if (obj_ini.veh_role[company,ll]="Land Speeder") then speeder+=1;
	        if (obj_ini.veh_role[company,ll]="Bike") then bike+=1;
	        if (obj_ini.veh_role[company,ll]="Predator") then pred+=1;
	        if (obj_ini.veh_role[company,ll]="Whirlwind") then whirl+=1;}
	    }temp[34]="";
	    if (capt>=1) then temp[34]=string(obj_ini.role[100][5])+"#";
	    if (standard>=1) then temp[34]+="Standard Bearer#";
	    if (chap>=1) then temp[34]+=string(chap)+"x "+string(obj_ini.role[100][14])+"#";
	    if (apoth>=1) then temp[34]+=string(apoth)+"x "+string(obj_ini.role[100][15])+"#";
	    if (tact>0) then temp[34]+=string(tact)+"x "+string(obj_ini.role[100][8])+"#";
	    if (assa>0) then temp[34]+=string(assa)+"x "+string(obj_ini.role[100][10])+"#";
	    if (deva>0) then temp[34]+=string(deva)+"x "+string(obj_ini.role[100][9])+"#";
	    if (termi>0) then temp[34]+=string(termi)+"x Terminator#";
	    if (veter>0) then temp[34]+=string(veter)+"x "+string(obj_ini.role[100][3])+"#";
	    if (dread>0) then temp[34]+=string(dread)+"x "+string(obj_ini.role[100][6])+"#";
	    if (raider>0) then temp[34]+=string(raider)+" Land Raider#";
	    if (rhino>0) then temp[34]+=string(rhino)+" Rhino#";
	    if (pred>0) then temp[34]+=string(pred)+" Predator#";
	    if (whirl>0) then temp[34]+=string(whirl)+" Whirlwind#";
	    if (raider>0) then temp[34]+=string(speeder)+" Land Speeder#";
	    if (bike>0) then temp[34]+=string(bike)+" Bike#";
    
	    // Sixth Company
	    termi=0;veter=0;capt=0;chap=0;apoth=0;stand=0;dread=0;tact=0;assa=0;deva=0;rhino=0;speeder=0;raider=0;standard=0;bike=0;ll=0;whirl=0;pred=0;company=6;
	    repeat(400){ll+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][5]) then capt+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][14]) and (global.chapter_name!="Space Wolves") then chap+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][15]) then apoth+=1;
	        if (obj_ini.role[company,ll]="Standard Bearer") then standard+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][12]) then scou+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][8]) then tact+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][10]) then assa+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][9]) then deva+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][6]) then dread+=1;
        
	        if (ll<=100){
	        if (obj_ini.veh_role[company,ll]="Land Raider") then raider+=1;
	        if (obj_ini.veh_role[company,ll]="Rhino") then rhino+=1;
	        if (obj_ini.veh_role[company,ll]="Land Speeder") then speeder+=1;
	        if (obj_ini.veh_role[company,ll]="Bike") then bike+=1;
	        if (obj_ini.veh_role[company,ll]="Predator") then pred+=1;
	        if (obj_ini.veh_role[company,ll]="Whirlwind") then whirl+=1;}
	    }temp[35]="";
	    if (capt>=1) then temp[35]=string(obj_ini.role[100][5])+"#";
	    if (standard>=1) then temp[35]+="Standard Bearer#";
	    if (chap>=1) then temp[35]+=string(chap)+"x "+string(obj_ini.role[100][14])+"#";
	    if (apoth>=1) then temp[35]+=string(apoth)+"x "+string(obj_ini.role[100][15])+"#";
	    if (tact>0) then temp[35]+=string(tact)+"x "+string(obj_ini.role[100][8])+"#";
	    if (assa>0) then temp[35]+=string(assa)+"x "+string(obj_ini.role[100][10])+"#";
	    if (deva>0) then temp[35]+=string(deva)+"x "+string(obj_ini.role[100][9])+"#";
	    if (termi>0) then temp[35]+=string(termi)+"x Terminator#";
	    if (veter>0) then temp[35]+=string(veter)+"x "+string(obj_ini.role[100][3])+"#";
	    if (dread>0) then temp[35]+=string(dread)+"x "+string(obj_ini.role[100][6])+"#";
	    if (raider>0) then temp[35]+=string(raider)+" Land Raider#";
	    if (rhino>0) then temp[35]+=string(rhino)+" Rhino#";
	    if (pred>0) then temp[35]+=string(pred)+" Predator#";
	    if (whirl>0) then temp[35]+=string(whirl)+" Whirlwind#";
	    if (raider>0) then temp[35]+=string(speeder)+" Land Speeder#";
	    if (bike>0) then temp[35]+=string(bike)+" Bike#";
    
	    // Seventh Company
	    termi=0;veter=0;capt=0;chap=0;apoth=0;stand=0;dread=0;tact=0;assa=0;deva=0;rhino=0;speeder=0;raider=0;standard=0;bike=0;ll=0;whirl=0;pred=0;company=7;
	    repeat(400){ll+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][5]) then capt+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][14]) and (global.chapter_name!="Space Wolves") then chap+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][15]) then apoth+=1;
	        if (obj_ini.role[company,ll]="Standard Bearer") then standard+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][12]) then scou+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][8]) then tact+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][10]) then assa+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][9]) then deva+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][6]) then dread+=1;
        
	        if (ll<=100){
	        if (obj_ini.veh_role[company,ll]="Land Raider") then raider+=1;
	        if (obj_ini.veh_role[company,ll]="Rhino") then rhino+=1;
	        if (obj_ini.veh_role[company,ll]="Land Speeder") then speeder+=1;
	        if (obj_ini.veh_role[company,ll]="Bike") then bike+=1;
	        if (obj_ini.veh_role[company,ll]="Predator") then pred+=1;
	        if (obj_ini.veh_role[company,ll]="Whirlwind") then whirl+=1;}
	    }temp[36]="";
	    if (capt>=1) then temp[36]=string(obj_ini.role[100][5])+"#";
	    if (standard>=1) then temp[36]+="Standard Bearer#";
	    if (chap>=1) then temp[36]+=string(chap)+"x "+string(obj_ini.role[100][14])+"#";
	    if (apoth>=1) then temp[36]+=string(apoth)+"x "+string(obj_ini.role[100][15])+"#";
	    if (tact>0) then temp[36]+=string(tact)+"x "+string(obj_ini.role[100][8])+"#";
	    if (assa>0) then temp[36]+=string(assa)+"x "+string(obj_ini.role[100][10])+"#";
	    if (deva>0) then temp[36]+=string(deva)+"x "+string(obj_ini.role[100][9])+"#";
	    if (termi>0) then temp[36]+=string(termi)+"x Terminator#";
	    if (veter>0) then temp[36]+=string(veter)+"x "+string(obj_ini.role[100][3])+"#";
	    if (dread>0) then temp[36]+=string(dread)+"x "+string(obj_ini.role[100][6])+"#";
	    if (raider>0) then temp[36]+=string(raider)+" Land Raider#";
	    if (rhino>0) then temp[36]+=string(rhino)+" Rhino#";
	    if (pred>0) then temp[36]+=string(pred)+" Predator#";
	    if (whirl>0) then temp[36]+=string(whirl)+" Whirlwind#";
	    if (raider>0) then temp[36]+=string(speeder)+" Land Speeder#";
	    if (bike>0) then temp[36]+=string(bike)+" Bike#";
    
	    // Eighth Company
	    termi=0;veter=0;capt=0;chap=0;apoth=0;stand=0;dread=0;tact=0;assa=0;deva=0;rhino=0;speeder=0;raider=0;standard=0;bike=0;ll=0;whirl=0;pred=0;company=8;
	    repeat(400){ll+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][5]) then capt+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][14]) and (global.chapter_name!="Space Wolves") then chap+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][15]) then apoth+=1;
	        if (obj_ini.role[company,ll]="Standard Bearer") then standard+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][12]) then scou+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][8]) then tact+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][10]) then assa+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][9]) then deva+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][6]) then dread+=1;
        
	        if (ll<=100){
	        if (obj_ini.veh_role[company,ll]="Land Raider") then raider+=1;
	        if (obj_ini.veh_role[company,ll]="Rhino") then rhino+=1;
	        if (obj_ini.veh_role[company,ll]="Land Speeder") then speeder+=1;
	        if (obj_ini.veh_role[company,ll]="Bike") then bike+=1;
	        if (obj_ini.veh_role[company,ll]="Predator") then pred+=1;
	        if (obj_ini.veh_role[company,ll]="Whirlwind") then whirl+=1;}
	    }temp[37]="";
	    if (capt>=1) then temp[37]=string(obj_ini.role[100][5])+"#";
	    if (standard>=1) then temp[37]+="Standard Bearer#";
	    if (chap>=1) then temp[37]+=string(chap)+"x "+string(obj_ini.role[100][14])+"#";
	    if (apoth>=1) then temp[37]+=string(apoth)+"x "+string(obj_ini.role[100][15])+"#";
	    if (tact>0) then temp[37]+=string(tact)+"x "+string(obj_ini.role[100][8])+"#";
	    if (assa>0) then temp[37]+=string(assa)+"x "+string(obj_ini.role[100][10])+"#";
	    if (deva>0) then temp[37]+=string(deva)+"x "+string(obj_ini.role[100][9])+"#";
	    if (termi>0) then temp[37]+=string(termi)+"x Terminator#";
	    if (veter>0) then temp[37]+=string(veter)+"x "+string(obj_ini.role[100][3])+"#";
	    if (dread>0) then temp[37]+=string(dread)+"x "+string(obj_ini.role[100][6])+"#";
	    if (raider>0) then temp[37]+=string(raider)+" Land Raider#";
	    if (rhino>0) then temp[37]+=string(rhino)+" Rhino#";
	    if (pred>0) then temp[37]+=string(pred)+" Predator#";
	    if (whirl>0) then temp[37]+=string(whirl)+" Whirlwind#";
	    if (raider>0) then temp[37]+=string(speeder)+" Land Speeder#";
	    if (bike>0) then temp[37]+=string(bike)+" Bike#";
    
	    // Ninth Company
	    termi=0;veter=0;capt=0;chap=0;apoth=0;stand=0;dread=0;tact=0;assa=0;deva=0;rhino=0;speeder=0;raider=0;standard=0;bike=0;ll=0;whirl=0;pred=0;company=9;
	    repeat(400){ll+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][5]) then capt+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][14]) and (global.chapter_name!="Space Wolves") then chap+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][15]) then apoth+=1;
	        if (obj_ini.role[company,ll]="Standard Bearer") then standard+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][12]) then scou+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][8]) then tact+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][10]) then assa+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][9]) then deva+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][6]) then dread+=1;
        
	        if (ll<=100){
	        if (obj_ini.veh_role[company,ll]="Land Raider") then raider+=1;
	        if (obj_ini.veh_role[company,ll]="Rhino") then rhino+=1;
	        if (obj_ini.veh_role[company,ll]="Land Speeder") then speeder+=1;
	        if (obj_ini.veh_role[company,ll]="Bike") then bike+=1;
	        if (obj_ini.veh_role[company,ll]="Predator") then pred+=1;
	        if (obj_ini.veh_role[company,ll]="Whirlwind") then whirl+=1;}
	    }temp[38]="";
	    if (capt>=1) then temp[38]=string(obj_ini.role[100][5])+"#";
	    if (standard>=1) then temp[38]+="Standard Bearer#";
	    if (chap>=1) then temp[38]+=string(chap)+"x "+string(obj_ini.role[100][14])+"#";
	    if (apoth>=1) then temp[38]+=string(apoth)+"x "+string(obj_ini.role[100][15])+"#";
	    if (tact>0) then temp[38]+=string(tact)+"x "+string(obj_ini.role[100][8])+"#";
	    if (assa>0) then temp[38]+=string(assa)+"x "+string(obj_ini.role[100][10])+"#";
	    if (deva>0) then temp[38]+=string(deva)+"x "+string(obj_ini.role[100][9])+"#";
	    if (termi>0) then temp[38]+=string(termi)+"x Terminator#";
	    if (veter>0) then temp[38]+=string(veter)+"x "+string(obj_ini.role[100][3])+"#";
	    if (dread>0) then temp[38]+=string(dread)+"x "+string(obj_ini.role[100][6])+"#";
	    if (raider>0) then temp[38]+=string(raider)+" Land Raider#";
	    if (rhino>0) then temp[38]+=string(rhino)+" Rhino#";
	    if (pred>0) then temp[38]+=string(pred)+" Predator#";
	    if (whirl>0) then temp[38]+=string(whirl)+" Whirlwind#";
	    if (raider>0) then temp[38]+=string(speeder)+" Land Speeder#";
	    if (bike>0) then temp[38]+=string(bike)+" Bike#";
    
	    // Tenth Company
	    termi=0;veter=0;capt=0;chap=0;apoth=0;stand=0;dread=0;tact=0;assa=0;deva=0;rhino=0;speeder=0;raider=0;standard=0;bike=0;scou=0;ll=0;whirl=0;pred=0;company=10;
	    repeat(400){ll+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][5]) then capt+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][14]) and (global.chapter_name!="Space Wolves") then chap+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][15]) then apoth+=1;
	        if (obj_ini.role[company,ll]="Standard Bearer") then standard+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][12]) then scou+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][8]) then tact+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][10]) then assa+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][9]) then deva+=1;
	        if (obj_ini.role[company,ll]=obj_ini.role[100][6]) then dread+=1;
        
	        if (ll<=100){
	        if (obj_ini.veh_role[company,ll]="Land Raider") then raider+=1;
	        if (obj_ini.veh_role[company,ll]="Rhino") then rhino+=1;
	        if (obj_ini.veh_role[company,ll]="Land Speeder") then speeder+=1;
	        if (obj_ini.veh_role[company,ll]="Bike") then bike+=1;
	        if (obj_ini.veh_role[company,ll]="Predator") then pred+=1;
	        if (obj_ini.veh_role[company,ll]="Whirlwind") then whirl+=1;}
	    }temp[39]="";
	    if (capt>=1) then temp[39]=string(obj_ini.role[100][5])+"#";
	    if (chap>=1) then temp[39]+=string(chap)+"x "+string(obj_ini.role[100][14])+"#";
	    if (apoth>=1) then temp[39]+=string(apoth)+"x "+string(obj_ini.role[100][15])+"#";
	    if (scou>0) then temp[39]+=string(scou)+"x "+string(obj_ini.role[100][12])+"#";
	    if (tact>0) then temp[39]+=string(tact)+"x "+string(obj_ini.role[100][8])+"#";
	    if (assa>0) then temp[39]+=string(assa)+"x "+string(obj_ini.role[100][10])+"#";
	    if (deva>0) then temp[39]+=string(deva)+"x "+string(obj_ini.role[100][9])+"#";
	    if (termi>0) then temp[39]+=string(termi)+"x Terminator#";
	    if (veter>0) then temp[39]+=string(veter)+"x "+string(obj_ini.role[100][3])+"#";
	    if (dread>0) then temp[39]+=string(dread)+"x "+string(obj_ini.role[100][6])+"#";
	    if (raider>0) then temp[39]+=string(raider)+" Land Raider#";
	    if (rhino>0) then temp[39]+=string(rhino)+" Rhino#";
	    if (pred>0) then temp[39]+=string(pred)+" Predator#";
	    if (whirl>0) then temp[39]+=string(whirl)+" Whirlwind#";
	    if (raider>0) then temp[39]+=string(speeder)+" Land Speeder#";
	    if (bike>0) then temp[39]+=string(bike)+" Bike#";

	}

/* end scr_management */
}
