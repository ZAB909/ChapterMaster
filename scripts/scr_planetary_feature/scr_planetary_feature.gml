enum P_features {
			Sororitas_Cathedral,
			Necron_Tomb,
			Artifact, 
			STC_Fragment,
			Ancient_Ruins,
			Cave_Network,
			Recruiting_World, 
			Monastery,
			Warlord6,
			Warlord7,
			Warlord10,
			Special_Force,
			World_Eaters,
			Webway
	};
	
function new_planet_feature(feature_type) constructor
{
	f_type = feature_type;
	if(f_type == P_features.Necron_Tomb){
		awake = 0;
		sealed = 0;
	}
}

// returns an array of all the positions that a certain planet feature occurs on a planet
function search_planet_features(planet, search_feature){
	var feature_count = array_length(planet);
	var feature_positions = [];
	if (feature_count > 0){
	for (var fc = 0; fc < feature_count; fc++;){
		if (planet[fc].f_type == search_feature){
			array_push(feature_positions, fc);
		}
	}}
	return feature_positions;
}

function planet_feature_bool(planet, search_feature){
	var feature_count = array_length(planet);
	var feature_exists = 0;
	if (feature_count > 0){
	for (var fc = 0; fc < feature_count; fc++;){
		if (planet[fc].f_type == search_feature){
			feature_exists = 1;
		}
		if (feature_exists == 1){break;}
	}}
	return feature_exists;	
}


function scr_planetary_feature(planet_num) {
	//need to iterate over features instead of just looking at first
	switch (p_feature[planet_num][0].f_type){
		case P_features.Sororitas_Cathedral:
			if (obj_controller.known[5]=0) then obj_controller.known[5]=1;
		    var lop;lop="Sororitas Cathedral discovered on "+string(name)+" "+scr_roman(planet_num)+".";debugl(lop);
		    scr_alert("green","feature",lop,x,y);scr_event_log("",lop);
		    if (p_heresy[planet_num]>10) then p_heresy[planet_num]-=10;
		    p_sisters[planet_num]=choose(2,2,3);goo=1;
			break;
		case P_features.Necron_Tomb:
		    var lop;lop="Necron Tomb discovered on "+string(name)+" "+scr_roman(planet_num)+"."debugl(lop);
		    scr_alert("red","feature",lop,x,y);scr_event_log("red",lop);
			break;
		case P_features.Artifact:
			var lop;lop="Artifact discovered on "+string(name)+" "+scr_roman(planet_nu)+"."debugl(lop);
			scr_alert("green","feature",lop,x,y);scr_event_log("",lop);
			break;
		case P_features.STC_Fragment:
			var lop;lop="STC Fragment located on "+string(name)+" "+scr_roman(planet_num)+"."debugl(lop);
			 scr_alert("green","feature",lop,x,y);scr_event_log("",lop);
			 break;
		case P_features.Ancient_Ruins:
			var lop;lop="Ancient Ruins discovered on "+string(name)+" "+scr_roman(planet_num)+"."debugl(lop);
			scr_alert("green","feature",lop,x,y);scr_event_log("",lop);
			break;
		case P_features.Cave_Network:
			var lop;lop="Extensive Cave Network discovered on "+string(name)+" "+scr_roman(planet_num)+"."debugl(lop);
	        scr_alert("green","feature",lop,x,y);scr_event_log("",lop);
			break;
		
			
	}
		

	// self: obj_star
	// planet_num: planet number
	// Ran when something is discovered on a planet

	/*
	    Now, I've put some thought into this.  It would probably be best to have the planetary feature be some
	    sort of integer, rather than a string, so that it can be calculated and assigned at the start.  This
	    way a player wouldn't neccesary be able to save-skum in order to get a better planetary feature.
	    Actually implimenting this would require a bit of work, due to how planetary features currently work,
	    but take that much more away from the player.
    
	    Because that is the name of the game.
    
	    Although this would prevent new planetary features from appearing in older save games.
	*/


	/*var ranb;ranb=0;
	// if (ranb=1) and (p_owner[argument0]!=1) and (p_owner[argument0]!=2) and (p_owner[argument0]!=3) then ranb=floor(random(4))+2;


	var goo;goo=0;
	repeat(10){if (goo=0){ranb=floor(random(6))+1;

	if (name="Vulvis Major") then ranb=1;
	if (name="Necron Assrape") then ranb=2;
	if (name="Morrowynd") then ranb=5;

	if (ranb=1) and (goo=0){
	    p_feature[argument0]=string_replace(p_feature[argument0],"|","Sororitas Cathedral|");if (obj_controller.known[5]=0) then obj_controller.known[5]=1;
	    var lop;lop="Sororitas Cathedral discovered on "+string(name)+" "+scr_roman(argument0)+".";debugl(lop);
	    scr_alert("green","feature",lop,x,y);scr_event_log("",lop);
	    if (p_heresy[argument0]>10) then p_heresy[argument0]-=10;
	    p_sisters[argument0]=choose(2,2,3);goo=1;
	}
	if (ranb=2) and (p_type[argument0]!="Hive") and (p_type[argument0]!="Lava") and (goo=0){
	    p_feature[argument0]=string_replace(p_feature[argument0],"?|","Necron Tomb|");goo=1;
	    var lop;lop="Necron Tomb discovered on "+string(name)+" "+scr_roman(argument0)+"."debugl(lop);
	    scr_alert("red","feature",lop,x,y);scr_event_log("red",lop);
	}
	if (ranb=3) and (goo=0){
	    p_feature[argument0]=string_replace(p_feature[argument0],"??|","Artifact|");goo=1;
	    var lop;lop="Artifact discovered on "+string(name)+" "+scr_roman(argument0)+"."debugl(lop);
	    scr_alert("green","feature",lop,x,y);scr_event_log("",lop);
	}
	if (ranb=4) and (goo=0){
	    p_feature[argument0]=string_replace(p_feature[argument0],"??|","STC Fragment|");goo=1;
	    var lop;lop="STC Fragment located on "+string(name)+" "+scr_roman(argument0)+"."debugl(lop);
	    scr_alert("green","feature",lop,x,y);scr_event_log("",lop);
	}
	if (ranb=5) and (p_type[argument0]!="Ice") and (p_type[argument0]!="Dead") and (p_type[argument0]!="Feudal") and (goo=0){goo=1;
	    p_feature[argument0]=string_replace(p_feature[argument0],"??|","Ancient Ruins|");
	    var lop;lop="Ancient Ruins discovered on "+string(name)+" "+scr_roman(argument0)+"."debugl(lop);
	    scr_alert("green","feature",lop,x,y);scr_event_log("",lop);
	}
	if (ranb=5) and ((p_type[argument0]="Ice") or (p_type[argument0]="Dead")) and (goo=0){
	    p_feature[argument0]=string_replace(p_feature[argument0],"??|","Necron Tomb|");goo=1;
	    var lop;lop="Necron Tomb discovered on "+string(name)+" "+scr_roman(argument0)+"."debugl(lop);
	    scr_alert("red","feature",lop,x,y);scr_event_log("red",lop);
	}
	if (ranb=6) and ((p_type[argument0]="Dead") or (p_type[argument0]="Desert")) and (goo=0){
	    var randum;randum=floor(random(100))+1;
	    if (randum<=25){
	        p_feature[argument0]=string_replace(p_feature[argument0],"??|","Cave Network|");goo=1;
	        var lop;lop="Extensive Cave Network discovered on "+string(name)+" "+scr_roman(argument0)+"."debugl(lop);
	        scr_alert("green","feature",lop,x,y);scr_event_log("",lop);
	    }
	}


	}}

	// show_message("Random Planetary Feature: "+string(ranb));
*/

}
