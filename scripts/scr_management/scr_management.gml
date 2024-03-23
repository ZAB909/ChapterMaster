function scr_management(argument0) {

	// argument0        1: overview         10+: that chapter -10
	// Creates the company blocks in the main management screen and assigns text to them
	var roles  = obj_ini.role[100];

	// Variable creation
	var num=0, nam="", company=50, q=0;	
	var romanNumerals=scr_roman_numerals();
	var chapter_name = global.chapter_name;

	if (argument0=1){
	    with(obj_managment_panel){instance_destroy();}

	    var pane;
		
		pane=instance_create(700,180-48,obj_managment_panel);
	    pane.company=0;
		pane.manage=11;
		pane.header=3;
		pane.title="CHAPTER COMMAND";
    
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
	    q=0;
	    company=0;
		obj_controller.temp[71]=11;

	    for (var i = 0; i < 50; i++) {
			num[i] = 0;
			nam[i] = "";
		}
	    nam[2]=roles[Role.HONOR_GUARD];

	    for (var i = 1; i <= 200; i++) {
			if (obj_ini.role[0, i] == "Chapter Master") {
				num[1] += 1;
				if (nam[1] == "") then nam[1] = obj_ini.name[0, i];
			}
			if (obj_ini.role[0, i] == roles[Role.HONOR_GUARD]) then num[2] += 1;
		}
		

	    // if (num[2]=0) then nam[2]="Strategic Staff";// reserved for co-master alien or something
		
	    // if (num[2]>0) {
		// 	nam[2]=string(num)+"x "+string(roles[Role.HONOR_GUARD]);
		// 	nam[3]="Strategic Staff";
		// 	num[3]=1;
		// }
		
	    with(obj_managment_panel){if (manage!=obj_controller.temp[71]) then instance_deactivate_object(id);}
		
	
	    if (num[1]>0){
			q++;
			obj_managment_panel.line[q]=string(nam[1]);
			obj_managment_panel.italic[q]=1;
		}
	    if (num[2]>0){
			q++;
			obj_managment_panel.line[q]=string(num[2])+"x "+string(nam[2]);
		}

	    obj_managment_panel.italic[1]=1;
		instance_activate_object(obj_managment_panel);
    
	    // ll=0;ll2=0;repeat(200){ll2++;if (obj_ini.role[company,ll2]=roles[Role.HONOR_GUARD]) then ll++;}
	    // if (ll>0) then temp[3]=string(ll)+"x "+string(roles[Role.HONOR_GUARD]);
    
	
    
	    // ** Apothecarium **
	    q=0;
		company=0;
		obj_controller.temp[71]=12;
	    for (var i = 0; i < 50; i++) {
			num[i] = 0;
			nam[i] = "";
		}
	    nam[2]=roles[Role.APOTHECARY];
		
		// Ranks
		nam[3]=string(roles[Role.APOTHECARY])+" Aspirant";// nam[4]="Sister Hospitaler";
		
	    for (var i = 1; i <= 200; i++) {
			if (obj_ini.role[0, i] == "Master of the Apothecarion") {
				num[1] += 1;
				if (nam[1] == "") then nam[1] = obj_ini.name[0, i];
			}
    
			if (obj_ini.role[0, i] == roles[Role.APOTHECARY]) then num[2] += 1;
    
			if (obj_ini.role[0, i] == string(roles[Role.APOTHECARY]) + " Aspirant") then num[3] += 1;
			// if (obj_ini.role[0, i] == "Sister Hospitaler") then num[4] += 1;
		}
		
	    with(obj_managment_panel){if (manage!=obj_controller.temp[71]) then instance_deactivate_object(id);}
		
	    if (num[1]>0){
			q++;obj_managment_panel.line[q]=string(nam[1]);
			obj_managment_panel.italic[q]=1;
		}
	    if (num[2]>0){
			q++;
			obj_managment_panel.line[q]=string(num[2])+"x "+string(nam[2]);
		}
	    if (num[3]>0){
			q++;
			obj_managment_panel.line[q]=string(num[3])+"x "+string(nam[3]);
		}
	    // if (num[4]>0){q++;obj_managment_panel.line[q]=string(num[4])+"x "+string(nam[4]);}
	    instance_activate_object(obj_managment_panel);
	
	    // ** Reclusium **
		q=0;
	    company=0;
		obj_controller.temp[71]=14;
		
	    for (var i = 0; i < 50; i++) {
			num[i] = 0;
			nam[i] = "";
		}
		
	    nam[2]=roles[Role.CHAPLAIN];
		
		// Ranks
		nam[3]=string(roles[Role.CHAPLAIN])+" Aspirant";
		
	    for (var i = 1; i <= 200; i++) {
			if (obj_ini.role[0, i] == "Master of Sanctity") {
				num[1] += 1;
				if (nam[1] == "") then nam[1] = obj_ini.name[0, i];
			}
    
			if (obj_ini.role[0, i] == roles[Role.CHAPLAIN]) then num[2] += 1;
    
			if (obj_ini.role[0, i] == string(roles[Role.CHAPLAIN]) + " Aspirant") then num[3] += 1;
		}
		
	    with(obj_managment_panel){if (manage!=obj_controller.temp[71]) then instance_deactivate_object(id);}
		
	    if (num[1]>0){
			q++;
			obj_managment_panel.line[q]=string(nam[1]);
			obj_managment_panel.italic[q]=1;
		}
		
		// TODO add specific Space Wolves and successor chapter logic for Master of Sanctity
	    // if (global.chapter_name!="Space Wolves")
		
		// Specific Iron Hands chapter logic
	    if (chapter_name!="Iron Hands"){
	        if (num[2]>0){
				q++;
				obj_managment_panel.line[q]=string(num[2])+"x "+string(nam[2]);
			}
	        if (num[3]>0){
				q++;
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
		
	    nam[2]=roles[Role.TECHMARINE];
		
		// Ranks
		nam[3]=string(roles[Role.TECHMARINE])+" Aspirant";
		nam[4]="Techpriest";
		
	    for (var i = 1; i <= 200; i++) {
			if (obj_ini.role[0, i] == "Forge Master") {
				num[1] += 1;
				if (nam[1] == "") then nam[1] = obj_ini.name[0, i];
			}
    
			if (obj_ini.role[0, i] == roles[Role.TECHMARINE]) then num[2] += 1;
    
			if (obj_ini.role[0, i] == string(roles[Role.TECHMARINE]) + " Aspirant") then num[3] += 1;
    
			if (obj_ini.role[0, i] == "Techpriest") then num[4] += 1;
		}
		
	    with(obj_managment_panel){if (manage!=obj_controller.temp[71]) then instance_deactivate_object(id);}
		
	    if (num[1]>0){
			q++;
			obj_managment_panel.line[q]=string(nam[1]);
			obj_managment_panel.italic[q]=1;
		}
		
	    if (num[2]>0){
			q++;
			obj_managment_panel.line[q]=string(num[2])+"x "+string(nam[2]);
		}
		
	    if (num[3]>0){
			q++;
			obj_managment_panel.line[q]=string(num[3])+"x "+string(nam[3]);
		}
		
	    if (num[4]>0){
			q++;
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
		
	    nam[2]=roles[Role.LIBRARIAN];
		
		// Ranks
		nam[3]="Codiciery";
		nam[4]="Lexicanum";
		nam[5]=string(roles[Role.LIBRARIAN])+" Aspirant";
		
	    for (var i = 1; i <= 200; i++) {
			if (obj_ini.role[0, i] == "Chief " + string(roles[Role.LIBRARIAN])) {
				num[1] += 1;
				if (nam[1] == "") then nam[1] = obj_ini.name[0, i];
			}
    
			if (obj_ini.role[0, i] == roles[Role.LIBRARIAN]) then num[2] += 1;
    
			if (obj_ini.role[0, i] == "Codiciery") then num[3] += 1;
    
			if (obj_ini.role[0, i] == "Lexicanum") then num[4] += 1;
    
			if (obj_ini.role[0, i] == string(roles[Role.APOTHECARY]) + " Aspirant") then num[5] += 1;
		}
		
	    with(obj_managment_panel){if (manage!=obj_controller.temp[71]) then instance_deactivate_object(id);}
		
	    if (num[1]>0){
			q++;
			obj_managment_panel.line[q]=string(nam[1]);obj_managment_panel.italic[q]=1;
		}
		
	    if (num[2]>0){
			q++;
			obj_managment_panel.line[q]=string(num[2])+"x "+string(nam[2]);
		}
		
	    if (num[3]>0){
			q++;
			obj_managment_panel.line[q]=string(num[3])+"x "+string(nam[3]);
		}
		
	    if (num[4]>0){
			q++;
			obj_managment_panel.line[q]=string(num[4])+"x "+string(nam[4]);
		}
		
	    if (num[5]>0){
			q++;
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
			nam[1] = obj_ini.name[company][1];
			nam[2] = roles[Role.CHAPLAIN];
			nam[3] = roles[Role.APOTHECARY];
			nam[4] = roles[Role.TERMINATOR];
			nam[5] = "Codiciery";
			nam[6] = "Lexicanum";
			nam[7] = "Standard Bearer";
			nam[8] = roles[Role.TERMINATOR];
			nam[9] = roles[Role.TECHMARINE];
			nam[10] = roles[Role.SERGEANT];
			nam[11] = roles[Role.VETERAN_SERGEANT];	        
			nam[12] = roles[Role.VETERAN];
			nam[13] = roles[Role.TACTICAL];
			nam[14] = roles[Role.ASSAULT];
			nam[15] = roles[Role.DEVASTATOR];
			nam[16] = roles[Role.DREADNOUGHT];
			nam[17] = roles[Role.COMPANY_CHAMPION];
			nam[18] = roles[Role.COMPANY_CHAMPION];	        
			nam[19] = "Land Raider";
			nam[20] = "Predator";
			nam[21] = "Rhino";
			nam[22] = "Land Speeder";
			nam[23] = "Whirlwind";			
        	var unit;
	        for (var i=1;i<500;i++) {
	        	if (obj_ini.name[company][i] == "") then continue;
	        	unit = fetch_unit([company,i]);
	            if (unit.role()=roles[Role.CAPTAIN]) then num[1]++;
	            if (unit.role()=roles[Role.CHAPLAIN]) then num[2]++;
				// Space Wolves exception
				if (chapter_name!="Space Wolves" && unit.role()=roles[Role.APOTHECARY]) then num[3]++;
	            if (unit.role()=roles[Role.LIBRARIAN]) then num[4]++;
	            if (unit.role()="Codiciery") then num[5]++;
	            if (unit.role()="Lexicanum") then num[6]++;
	            if (unit.role()="Standard Bearer") then num[7]++;
	            if (unit.role()=roles[Role.TERMINATOR]) then num[8]++;
	            if (unit.role()=roles[Role.TECHMARINE]) then num[9]++;
	             if (unit.role()=roles[Role.VETERAN_SERGEANT]) then num[10]++;
	             if (unit.role()=roles[Role.SERGEANT]) then num[11]++;
	            if (unit.role()=roles[Role.VETERAN]) then num[12]++;
	            if (unit.role()=roles[Role.TACTICAL]) then num[13]++;
	            if (unit.role()=roles[Role.ASSAULT]) then num[14]++;
	            if (unit.role()=roles[Role.DEVASTATOR]) then num[15]++;
	            if (unit.role()=roles[Role.SCOUT]) then num[16]++;
	            if (unit.role()="Venerable "+string(roles[Role.DREADNOUGHT])) then num[17]++;
	            if (unit.role()=roles[Role.DREADNOUGHT]) then num[18]++;
	            // Vehicles
				if (i<=100){
	                if (obj_ini.veh_role[company,i]="Land Raider") then num[19]++;
	                if (obj_ini.veh_role[company,i]="Predator") then num[20]++;
	                if (obj_ini.veh_role[company,i]="Rhino") then num[21]++;
	                if (obj_ini.veh_role[company,i]="Land Speeder") then num[22]++;
	                if (obj_ini.veh_role[company,i]="Whirlwind") then num[23]++;
	            }
	        }
			
	        with(obj_managment_panel){
	        	if (manage!=obj_controller.temp[71]) then instance_deactivate_object(id);
	        }
			
	        q=0;
				for (var d = 1; d <= 23; d++) {
					if (num[d] > 0) {
							q += 1;
							if (d == 1) {
									obj_managment_panel.line[q] = string(nam[d]); obj_managment_panel.italic[q]=1;
							} else {
									obj_managment_panel.line[q] = string(num[d]) + "x " + string(nam[d]);
							}
					}
			}
			
	        instance_activate_object(obj_managment_panel);
	    }
	}
}
