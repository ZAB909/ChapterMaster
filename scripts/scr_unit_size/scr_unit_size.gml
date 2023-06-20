function scr_unit_size(argument0, argument1, argument2) {

	// argument0: armor
	// argument1: role
	// argument2: +?

	var sz;sz=1;

	if (argument1!=""){
	    if (argument0="Tartaros") then sz+=1;
	    if (string_count("Terminator",argument0)>0) then sz+=1;
	    if (string_count("Dread",argument0)>0) then sz+=7;
	    if (argument1="Chapter Master") then sz+=1;
	    if (argument1="Harlequin Troupe") then sz+=4;
    
	    if (argument1="Rhino") then sz+=9;
	    if (argument1="Predator") then sz+=9;
	    if (argument1="Land Raider") then sz+=19;
	    if (argument1="Land Speeder") then sz+=5;
	    if (argument1="Whirlwind") then sz+=9;
    
	    if (argument2=false) then sz=sz*-1;
	    return(sz);
	}


}
