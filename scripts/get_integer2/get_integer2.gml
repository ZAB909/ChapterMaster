function get_integer2(argument0, argument1, argument2, argument3) {

	// question,max,target,target2

	with(obj_popup_dialogue){instance_destroy();}
	var npd;npd=instance_create(650,326,obj_popup_dialogue);
	npd.question=argument0;
	keyboard_string="";npd.inputing="";
	npd.maximum=argument1;
	npd.target=argument2;
	npd.target2=argument3;


}
