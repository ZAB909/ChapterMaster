
// lets face it this should all be solved in a method in the marines struct....
function scr_unit_size(armour, role, other_factors, mobility) {

    // armour: armour
    // role: role
    // other_factors: +?
	//mobility item
    var sz = 1;
    if (role!=""){
		var bulky_armour = ["Terminator Armour", "Tartaros"]
        if (string_count("Dread",armour)>0) {sz+=5;}else if (array_contains(bulky_armour,armour)){sz +=1};
        if (role="Rhino") {sz=10;}
        else if (role="Predator") {sz=10;}
        else if (role="Land Raider") {sz=20;} 
        else if (role="Land Speeder") {sz=5;}
        else if (role="Whirlwind") {sz=10;}
        else if (role="Harlequin Troupe") {sz=5;}
		else if (role="Chapter Master"){sz+=1;}
    
        if (other_factors=false) then sz=sz*-1;
        return(sz);
    }
	
	return 0;


}