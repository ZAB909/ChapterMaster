function scr_unit_size(argument0, argument1, argument2) {

    // argument0: armor
    // argument1: role
    // argument2: +?
    var sz = 1;
    if (argument1!=""){

        if (string_count("Dread",argument0)>0) {sz=5;}
        else if (argument1="Rhino") {sz=10;}
        else if (argument1="Predator") {sz=10;}
        else if (argument1="Land Raider") {sz=20;} 
        else if (argument1="Land Speeder") {sz=5;}
        else if (argument1="Whirlwind") {sz=10;}
        else if (argument1="Harlequin Troupe") {sz=5;}
    
        if (argument2=false) then sz=sz*-1;
        return(sz);
    }


}