


// right here check for artifacts to be moved
var i;i=0;

if (capital_number=0) then exit;
var a, c, good;a=0;c=0;good=0;

repeat(capital_number){i+=1;// Find the healthiest capital ship
    if (obj_ini.ship_hp[capital_num[i]]>good){c=capital_num[i];good=obj_ini.ship_hp[capital_num[i]];}
}
i=0;

if (obj_controller.artifacts>0) then repeat(obj_controller.artifacts){
    a+=1;i=0;
    
    repeat(20){i+=1;// Frigates first
        if (obj_ini.artifact[a]!="") and ((obj_ini.artifact_sid[a]-500)=frigate_num[i]){// Found a match
            obj_ini.artifact_sid[a]=capital_num[c]+500;
            obj_ini.artifact_loc[a]=obj_ini.ship[capital_num[c]];
        }
        
        // show_message(string(a)+": "+string(obj_ini.artifact_sid[a]-500)+"="+string(escort_num[i])+"?");
        
        if (obj_ini.artifact[a]!="") and ((obj_ini.artifact_sid[a]-500)=escort_num[i]){// Found a match
            obj_ini.artifact_sid[a]=capital_num[c]+500;
            obj_ini.artifact_loc[a]=obj_ini.ship[capital_num[c]];
        }
    }
    
}

// Also something here to drop on planet?

