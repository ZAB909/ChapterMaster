function scr_audience(argument0, argument1, argument2, argument3, argument4, argument5) {

	// argument0: faction
	// argument1: topic
	// argument2: new disposition
	// argument3: new status
	// argument4: turns ignored
	// argument5: new known

	var witch;witch=obj_controller;
	if (instance_exists(obj_turn_end)) then witch=obj_turn_end;

	witch.audiences+=1;witch.audien[witch.audiences]=argument0;
	witch.audien_topic[witch.audiences]=argument1;
	if (argument2!=0) then obj_controller.disposition[argument0]+=argument2;
	if (argument3!="") then obj_controller.faction_status[argument0]=argument3;
	if (argument4!=0) then obj_controller.turns_ignored[argument0]+=argument4;
	if (argument5!=0) then obj_controller.known[argument0]+=argument5;


}
