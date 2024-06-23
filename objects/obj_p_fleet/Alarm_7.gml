


// right here check for artifacts to be moved
var i;i=0;

if (capital_number=0) then exit;
var a, c, good;a=0;c=0;good=0;
var capital_id;

for(var i=0;i<arraylength(capital_number);i++)// Find the healthiest capital ship
    capital_id = capital_num[i];
    if (obj_ini.ship[capital_id] == "") then continue
    if (obj_ini.ship_hp[capital_id]>good){
        c=capital_id;
        good=obj_ini.ship_hp[capital_id];
    }
}

var ships_list = fleet_full_ship_array(, true);
for (var a=0;a<array_length(obj_ini.artifact);a++){
    if (obj_ini.artifact[a]=="") then continue;
    if (array_contains(ships_list, obj_ini.artifact_sid[a]-500)){
        obj_ini.artifact_sid[a]=capital_num[c]+500;
        obj_ini.artifact_loc[a]=obj_ini.ship[capital_num[c]];       
    }
}

