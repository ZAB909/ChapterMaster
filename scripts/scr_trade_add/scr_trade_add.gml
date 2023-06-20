function scr_trade_add(argument0) {

	// argument0: item

	var tomp1,thinz;
	tomp1=0;thinz=0;
	if (trade_take[4]="") then thinz=4;if (trade_take[3]="") then thinz=3;if (trade_take[2]="") then thinz=2;if (trade_take[1]="") then thinz=1;


	/*if (thinz!=0) and (trade_take[thinz]="Useful Information"){
	    if (random_event_next!="") and (string_count("WL10|",useful_info)>0) and (string_count("WL7|",useful_info)>0) and  (string_count("WG|",useful_info)>1) and (string_count("CM|",useful_info)>0) then exit;
	}*/


	if (thinz!=0){
	    trade_take[thinz]=argument0;
    
	    if (argument0="Requisition"){get_integer2("Requisition wanted?",100000,"t"+string(thinz),"Requisition");}
	    if (argument0="Terminator Armor"){get_integer2("Terminator Armor wanted?",5,"t"+string(thinz),"Terminator Armor");}
	    if (argument0="Tartaros"){trade_tnum[thinz]=1;tomp1=1;}
	    if (argument0="Land Raider"){trade_tnum[thinz]=1;tomp1=1;}
	    if (argument0="Castellax Battle Automata"){trade_tnum[thinz]=1;tomp1=1;}
    
	    if (argument0="Minor Artifact"){trade_tnum[thinz]=1;tomp1=1;}
	    if (argument0="Skitarii"){get_integer2("Skitarii wanted?",1000,"t"+string(thinz),"Skitarii");}
	    if (argument0="Techpriest"){trade_tnum[thinz]=3;tomp1=3;}
    
	    // if (argument0="Storm Trooper"){trade_tnum[thinz]=get_integr("Number of Storm Troopers?",10);tomp1=100;}
	    if (argument0="Recruiting Planet"){trade_tnum[thinz]=1;tomp1=1;}
	    if (argument0="License: Repair"){trade_tnum[thinz]=1;tomp1=1;}
	    if (argument0="License: Crusade"){trade_tnum[thinz]=1;tomp1=1;}
    
	    if (argument0="Eldar Power Sword"){get_integer2("Eldar Power Swords wanted?",5,"t"+string(thinz),"Eldar Power Sword");}
	    if (argument0="Archeotech Laspistol"){trade_tnum[thinz]=1;tomp1=1;}
	    if (argument0="Ranger"){get_integer2("Eldar Rangers wanted?",5,"t"+string(thinz),"Ranger");}
	    if (argument0="Useful Information"){
	        var woj;woj=trade_take[1]+trade_take[2]+trade_take[3]+trade_take[4];
	        if (string_count("Useful Info",woj)=1){trade_tnum[thinz]=1;tomp1=1;}
	        if (string_count("Useful Info",woj)>1){trade_tnum[thinz]=0;tomp1=0;trade_take[thinz]="";}
	    }
    
	    if (argument0="Condemnor Boltgun"){get_integer2("Condemnor Boltguns wanted?",20,"t"+string(thinz),"Condemnor Boltgun");}
	    if (argument0="Hellrifle"){get_integer2("Hellrifles wanted?",3,"t"+string(thinz),"Hellrifle");}
	    if (argument0="Incinerator"){get_integer2("Incinerators wanted?",10,"t"+string(thinz),"Incinerator");}
	    if (argument0="Crusader"){get_integer2("Crusaders wanted?",5,"t"+string(thinz),"Crusader");}
	    if (argument0="Exterminatus"){trade_tnum[thinz]=1;tomp1=1;}
	    if (argument0="Cyclonic Torpedo"){trade_tnum[thinz]=1;tomp1=1;}
	    if (argument0="Eviscerator"){get_integer2("Eviscerators wanted?",10,"t"+string(thinz),"Eviscerator");}
	    if (argument0="Heavy Flamer"){get_integer2("Heavy Flamers wanted?",10,"t"+string(thinz),"Heavy Flamer");}
	    if (argument0="Inferno Bolts"){trade_tnum[thinz]=20;tomp1=20;}
	    if (argument0="Sister of Battle"){get_integer2("Sisters of Battle wanted?",3,"t"+string(thinz),"Sister of Battle");}
	    if (argument0="Sister Hospitaler"){trade_tnum[thinz]=1;tomp1=1;}
    
	    if (argument0="Power Klaw"){get_integer2("Power Klaws wanted?",5,"t"+string(thinz),"Power Klaw");}
	    if (argument0="Ork Sniper"){get_integer2("Ork Snipers wanted?",20,"t"+string(thinz),"Ork Sniper");}
	    if (argument0="Flash Git"){get_integer2("Flash Gitz wanted?",6,"t"+string(thinz),"Flash Git");}
    
	    if (argument0="Test"){trade_tnum[thinz]=1;tomp1=1;}
    
	    // if (trade_tnum[thinz]=0){trade_tnum[thinz]=0;trade_take[thinz]="";}
	    // if (trade_tnum[thinz]>tomp1) then trade_tnum[thinz]=tomp1;
	}

	cooldown=8;
	scr_trade(false);


}
