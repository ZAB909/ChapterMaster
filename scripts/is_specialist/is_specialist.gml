function is_specialist(argument0) {

	// argument0: role

	var ahah;ahah=false;

	if (argument0="Chapter Master") then ahah=true;
	if (argument0="Forge Master") then ahah=true;
	if (argument0="Master of Sanctity") then ahah=true;
	if (argument0="Master of the Apothecarion") then ahah=true;
	if (argument0="Chief "+string(obj_ini.role[100,17])) then ahah=true;
	if (argument0=obj_ini.role[100][5]) then ahah=true;
	if (argument0=obj_ini.role[100][6]) then ahah=true;
	if (argument0="Venerable "+string(obj_ini.role[100][6])) then ahah=true;
	if (argument0=obj_ini.role[100][7]) then ahah=true;
	if (argument0=obj_ini.role[100][14]) then ahah=true;
	if (argument0=obj_ini.role[100][15]) then ahah=true;
	if (argument0=obj_ini.role[100][16]) then ahah=true;
	if (argument0=obj_ini.role[100,17]) then ahah=true;
	if (argument0="Codiciery") then ahah=true;
	if (argument0="Lexicanum") then ahah=true;
	if (argument0=obj_ini.role[100][2]) then ahah=true;

	return(ahah);


}
