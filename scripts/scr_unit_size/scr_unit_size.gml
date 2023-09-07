
// Modifies the size for each unit depending on their Type
function scr_unit_size(armour, role, other_factors, mobility) {
    var sz = 1;
    if (role!=""){
		var bulky_armour = ["Terminator Armour", "Tartaros"]
        if (string_count("Dread",armour)>0) {
			sz+=5;
		}else if (array_contains(bulky_armour,armour)){sz +=1};
        if (role="Rhino") {sz=10;}
        else if (role="Predator") {sz=10;}
        else if (role="Land Raider") {sz=20;} 
        else if (role="Land Speeder") {sz=5;}
        else if (role="Whirlwind") {sz=10;}
        else if (role="Harlequin Troupe") {sz=5;}
		else if (role="Chapter Master"){sz+=1;}
    
        return(sz);
    }
	return 0;
}