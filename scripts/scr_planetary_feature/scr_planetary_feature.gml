function scr_planetary_feature(argument0) {

	// self: obj_star
	// argument0: planet number
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


	var ranb;ranb=0;
	// if (ranb=1) and (p_owner[argument0]!=1) and (p_owner[argument0]!=2) and (p_owner[argument0]!=3) then ranb=floor(random(4))+2;


	var goo;goo=0;
	repeat(10){if (goo=0){ranb=floor(random(6))+1;

	if (name="Vulvis Major") then ranb=1;
	if (name="Necron Assrape") then ranb=2;
	if (name="Morrowynd") then ranb=5;

	if (ranb=1) and (goo=0){
	    p_feature[argument0]=string_replace(p_feature[argument0],"????|","Sororitas Cathedral|");if (obj_controller.known[5]=0) then obj_controller.known[5]=1;
	    var lop;lop="Sororitas Cathedral discovered on "+string(name)+" "+scr_roman(argument0)+".";debugl(lop);
	    scr_alert("green","feature",lop,x,y);scr_event_log("",lop);
	    if (p_heresy[argument0]>10) then p_heresy[argument0]-=10;
	    p_sisters[argument0]=choose(2,2,3);goo=1;
	}
	if (ranb=2) and (p_type[argument0]!="Hive") and (p_type[argument0]!="Lava") and (goo=0){
	    p_feature[argument0]=string_replace(p_feature[argument0],"????|","Necron Tomb|");goo=1;
	    var lop;lop="Necron Tomb discovered on "+string(name)+" "+scr_roman(argument0)+"."debugl(lop);
	    scr_alert("red","feature",lop,x,y);scr_event_log("red",lop);
	}
	if (ranb=3) and (goo=0){
	    p_feature[argument0]=string_replace(p_feature[argument0],"????|","Artifact|");goo=1;
	    var lop;lop="Artifact discovered on "+string(name)+" "+scr_roman(argument0)+"."debugl(lop);
	    scr_alert("green","feature",lop,x,y);scr_event_log("",lop);
	}
	if (ranb=4) and (goo=0){
	    p_feature[argument0]=string_replace(p_feature[argument0],"????|","STC Fragment|");goo=1;
	    var lop;lop="STC Fragment located on "+string(name)+" "+scr_roman(argument0)+"."debugl(lop);
	    scr_alert("green","feature",lop,x,y);scr_event_log("",lop);
	}
	if (ranb=5) and (p_type[argument0]!="Ice") and (p_type[argument0]!="Dead") and (goo=0){goo=1;
	    p_feature[argument0]=string_replace(p_feature[argument0],"????|","Ancient Ruins|");
	    var lop;lop="Ancient Ruins discovered on "+string(name)+" "+scr_roman(argument0)+"."debugl(lop);
	    scr_alert("green","feature",lop,x,y);scr_event_log("",lop);
	}
	if (ranb=5) and ((p_type[argument0]="Ice") or (p_type[argument0]="Dead")) and (goo=0){
	    p_feature[argument0]=string_replace(p_feature[argument0],"????|","Necron Tomb|");goo=1;
	    var lop;lop="Necron Tomb discovered on "+string(name)+" "+scr_roman(argument0)+"."debugl(lop);
	    scr_alert("red","feature",lop,x,y);scr_event_log("red",lop);
	}
	if (ranb=6) and ((p_type[argument0]="Dead") or (p_type[argument0]="Desert")) and (goo=0){
	    var randum;randum=floor(random(100))+1;
	    if (randum<=25){
	        p_feature[argument0]=string_replace(p_feature[argument0],"????|","Cave Network|");goo=1;
	        var lop;lop="Extensive Cave Network discovered on "+string(name)+" "+scr_roman(argument0)+"."debugl(lop);
	        scr_alert("green","feature",lop,x,y);scr_event_log("",lop);
	    }
	}


	}}





	// show_message("Random Planetary Feature: "+string(ranb));


}
