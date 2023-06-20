function scr_start_allow(argument0, argument1, argument2) {

	/*
	if (name[100,i]!="") then scr_start_allow(i,"wep1",wep1[100,i]);
	if (name[100,i]!="") then scr_start_allow(i,"wep2",wep2[100,i]);
	if (name[100,i]!="") then scr_start_allow(i,"mobi",mobi[100,i]);
	if (name[100,i]!="") then scr_start_allow(i,"gear",gear[100,i]);
	*/

	// argument0: array ID
	// argument1: slot
	// argument2: attempting

	var specialist,allow;
	specialist=0;allow=false;
	if (argument0=2) then specialist=1;
	if (argument0=3) then specialist=1;
	if (argument0=4) then specialist=2;
	if (argument0=5) then specialist=2;
	if (argument0=6) then specialist=2;
	if (argument0>=14) then specialist=2;


	if (specialist>=0){
	    if (argument2="Combat Knife") then allow=true;
	    if (argument2="Chainsword") then allow=true;
	    if (argument2="Chainaxe") then allow=true;
	    if (argument2="Boarding Shield") then allow=true;
	    if (argument2="Bolt Pistol") then allow=true;
	    if (argument2="Bolter") then allow=true;
	    if (argument2="Flamer") then allow=true;
	    if (argument2="Sniper Rifle") then allow=true;
    
	    if (argument0!=8) and (argument0!=9) and (argument0!=4) and (argument0!=6){
	        if (argument2="Jump Pack") then allow=true;
	    }
	}
	if (specialist>=1){
	    if (argument2="Storm Bolter") then allow=true;
	    if (argument2="Meltagun") then allow=true;
	    if (argument2="Power Fist") then allow=true;
	    if (argument2="Power Sword") then allow=true;
	    if (argument2="Power Axe") then allow=true;
	    if (argument2="Narthecium") then allow=true;
    
	    if (argument0!=8) and (argument0!=9) and (argument0!=4) and (argument0!=6){
	        if (argument2="Bike") then allow=true;
	    }
	}
	if (specialist>=2){if (argument1!="mobi") and (argument1!="gear") then allow=true;
	    if (argument2="Plasma Gun") then allow=false;
	    if (argument0=14) and (argument2="Rosarius") then allow=true;
	    if (argument0=16) and (argument2="Servo Arms") then allow=true;
	    if (argument0=17) and (argument2="Psychic Hood") then allow=true;
	}

	if (allow=true){
	    if (argument1="wep1") then wep1[101,argument0]=argument2;
	    if (argument1="wep2") then wep2[101,argument0]=argument2;
	    if (argument1="gear") then gear[101,argument0]=argument2;
	    if (argument1="mobi") then mobi[101,argument0]=argument2;
	}


}
