
function scr_unit_size(armour, role, other_factors) {

    // armour: armor
    // role: role
    // other_factors: +?
    var sz = 1;
    if (role!=""){

        if (string_count("Dread",armour)>0) {sz=5;}
        else if (role="Rhino") {sz=10;}
        else if (role="Predator") {sz=10;}
        else if (role="Land Raider") {sz=20;} 
        else if (role="Land Speeder") {sz=5;}
        else if (role="Whirlwind") {sz=10;}
        else if (role="Harlequin Troupe") {sz=5;}
    
        if (other_factors=false) then sz=sz*-1;
        return(sz);
    }


}