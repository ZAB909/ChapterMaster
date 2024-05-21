
role_names_all="";

var derpaderp,z,idd;
derpaderp=0;idd=0;
if (!is_string(type)){
    if (type>=100) then z=type-100;
    if (type<100) then z=type;

    if (type>=100){
        repeat(13){derpaderp+=1;
            if (derpaderp=1) then idd=15;
            if (derpaderp=2) then idd=14;
            if (derpaderp=3) then idd=17;
            if (derpaderp=4) then idd=16;
            if (derpaderp=5) then idd=5;
            if (derpaderp=6) then idd=2;
            if (derpaderp=7) then idd=4;
            if (derpaderp=8) then idd=3;
            if (derpaderp=9) then idd=6;
            if (derpaderp=10) then idd=8;
            if (derpaderp=11) then idd=9;
            if (derpaderp=12) then idd=10;
            if (derpaderp=13) then idd=12;
            
            role_names_all+=string(obj_creation.role[100,idd])+"|";
        }
        
        role_names_all+="Chapter Master|";
        role_names_all+="Master of Sanctity|";
        role_names_all+="Master of the Apothecarion|";
        role_names_all+="Forge Master|";
        // role_names_all+="Crusader|";
        // role_names_all+="Ranger|";
        
        if (obj_creation.role[100,z]!=""){
            if (string_count(obj_creation.role[100,z],role_names_all)>1) then badname=1;
            if (string_count(obj_creation.role[100,z],role_names_all)<=1) then badname=0;
        }
    }
}

