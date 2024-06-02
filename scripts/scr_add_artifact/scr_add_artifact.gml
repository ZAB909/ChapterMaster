function find_open_artifact_slot(){
	var i=0,last_artifact=-1;
	for (var i=0;i<array_length(obj_ini.artifact)){
		if (last_artifact=-1){
			i+=1;
			if (obj_ini.artifact[i]==""){
				last_artifact=i;
				break;
			}
		}
	}
	return last_artifact;
}

function scr_add_artifact(artifact_type, artifact_tags, is_identified, artifact_location, ship_id) {

	last_artifact = find_open_artifact_slot();
	if (last_artifact==-1) then exit;

	var good=true, new_tags;
	var rand1=floor(random(100))+1;
	var rand2=floor(random(100))+1;

	var t1="",t2="",t3="",t4="",t5="";

	if (artifact_type="random") or (artifact_type="random_nodemon"){
		if (good){
		    if (rand1<=45){t1="Weapon";}
		    else if (rand1<=80){t1="Armour";}
		    else if (rand1<=90){t1="Gear";}
		    else if (rand1<=100){t1="Device";}
		    good=false;
		}
	}
	if (t1==""){
		if (array_contains(["Weapon","Armour","Gear","Device"],artifact_type)) then t1=artifact_type ;
	
		    if (artifact_type="Robot"){
		    	t1="Device";t2="Robot";
		    }
		    else if (artifact_type="Tome"){
		    	t1="Device";
		    	t2="Tome";
		    }
		if (artifact_type="chaos_gift"){
			t1="Device";
			t2=choose("Casket","Chalice","Statue");
		}
	}

	if (t1="Weapon") and (t2==""){
	    if (rand2<=30){
	    	t2="Bolter";
	    	good=false;
	    }
	    else if (rand2<=40){t2="Plasma Pistol";}
	    else if (rand2<=50 ){t2="Plasma Gun";}
	    else if (rand2<=70){t2=choose("Power Sword","Power Axe","Power Spear","Lightning Claw");}
	    else if (rand2<=90 ){t2=choose("Power Fist","Power Fist","Lightning Claw");}
	    else if (rand2<=100 ){t2=choose("Relic Blade","Thunder Hammer");}
	}

	if (t1="Armour") and (t2=""){
	    if (rand2<=70){
	    	t2=global.power_armour[irandom(array_length(global.power_armour)-1)]
	    };
	    else if (rand2<=80){t2=choose("Terminator Armour","Tartaros","Cataphractii Pattern Terminator",);}
	    else if (rand2<=90){t2="Dreadnought Armour";}
	    else if (rand2<=100){t2="Artificer Armour";}
	}

	if (t1="Gear") and (t2=""){good=0;
	    if (rand2<=20){t2="Rosarius";}
	    else if (rand2<=45){t2="Psychic Hood";}
	    else if (rand2<=80){t2="Jump Pack";}
	    else if (rand2<=100){t2="Servo Arms";}
	}

	if (t1="Device") and (t2=""){good=0;
	    if (rand2<=30){t2="Casket";}
	    else if (rand2<=50){t2="Chalice";}
	    else if (rand2<=70){t2="Statue";}
	    else if (rand2<=90){t2="Tome";}
	    else if (rand2<=100){t2="Robot";}
	}

	if (artifact_type="good"){
	    var haha;haha=choose(1,2,3,4);
	    if (haha=1){t1="Weapon";t2="Relic Blade";}
	    else if (haha=2){t1="Weapon";t2="Plasma Gun";}
	    else if (haha=3){t1="Gear";t2="Rosarius";}
	    else if (haha=4){t1="Armour";t2="Terminator Armour";}
	}



	rand2=floor(random(100))+1;good=0;
	if (string_count("Shit",obj_ini.strin2)>0){rand2=min(rand2+20,100);}
	if (rand2<=70){t3="";}
	else if (rand2<=90 && artifact_type!="random_nodemon"){t3="chaos";}
	else if (rand2<=100 && artifact_type!="random_nodemon"){t3="daemonic";}

	if (t1="Weapon"){
	    // gold, glowing, underslung bolter, underslung flamer
	    t5=choose("GOLD","GLOW","UBOLT","UFL");
	    // Runes, scope, adamantium, void
	    t4=choose("RUNE","SCOPE","ADAMANTINE","VOI");
	    if ((t2="Power Sword") or (t2="Power Axe") or (t2="Power Spear")) and (t4="SCOPE") then t4="CHB";// chainblade
	    if ((t2="Power Fist") or (t2="Power Claw")) and (t4="SCOPE") then t4="DUB";// doubled up
		if (t2="Thunder Hammer") and (t4="RUNE") then t4="GLOW";//glowing runed
	    if (t2="Relic Blade") and (t4="SCOPE") then t4="UFL";// underslung flamer
	}else if (t1="Armour"){
	    // golden filigree, glowing optics, purity seals
	    t5=choose("GOLD","GLOW","PUR");
	    // articulated plates, spikes, runes, drake scales
	    t4=choose("ART","SPIKES","RUNE","DRA");
	}else if (t1="Gear"){
	    // supreme construction, adamantium, gold
	    t4=choose("SUP","ADAMANTINE","GOLD");// bur = ever burning
	    if (t2="Rosarius") then t5=choose("GOLD","GLOW","BIG","BUR");
	    if (t2="Bionics") then t5=choose("GOLD","GLOW","RUNE","SOO");// Soothing appearance
	    if (t2="Psychic Hood") then t5=choose("FIN","GOLD","BUR","MASK");// fine cloth, gold, ever burning, mask
	    if (t2="Jump Pack") then t5=choose("SPIKES","SKRE","WHI","SILENT");// spikes, screaming, white flame, silent
	    if (t2="Servo Arms") then t5=choose("GOLD","TENTACLES","GOR","SOO");// gold, tentacles, gorilla build, soothing appearance
	}else if (t1="Device") and (t2!="Robot"){
	    t4=choose("GOLD","CRU","GLOW","ADAMANTINE");// skulls, falling angel, thin, tentacle, mindfuck
	    if (t2!="Statue") then t5=choose("SKU","FAL","THI","TENTACLES","MIN");
	    // goat, speechless, dying angel, jumping into magma, cheshire grunx
	    if (t2="Statue") then t5=choose("GOAT","SPE","DYI","JUM","CHE");
	    // Gold, glowing, preserved flesh, adamantium
	    if (t2="Tome") then t4=choose("GOLD","GLOW","PRE","ADAMANTINE","SAL","BUR");
	    if (t4="PRE") and (t3="") then t3=choose("","chaos","daemonic");
	}else if (t1="Device") and (t2="Robot"){// human/robutt/shivarah
	    t4=choose("HU","RO","SHI");
	    t5=choose("ADAMANTINE","JAD","BRO","RUNE");
	}

	var big=choose(1,2);
	// if (big=1 || artifact_tags="minor") then t5="";
	if (artifact_tags="minor"){t4="";t5="";t3+="MINOR";}
	if (artifact_tags="inquisition") then t3+="inq";
	if ((artifact_tags="daemonic"||artifact_tags="daemonic")) and (t2!="Tome") then t3="daemonic"+choose("1a","2a","3a","4a");
	if ((artifact_tags="daemonic" || artifact_tags="daemonic")) and (t2="Tome") then t3="daemonic"+choose("2a","3a","4a");
	if (artifact_type="chaos_gift") then t3="daemonic";
	// show_message(string(t3));

	obj_ini.artifact[last_artifact]=t2;
	obj_ini.artifact_tags[last_artifact]=[t4,t5,t3];

	// show_message(string(obj_ini.artifact_tags[last_artifact]));

	obj_ini.artifact_identified[last_artifact] = is_identified;
	obj_ini.artifact_condition[last_artifact] = 100;
	obj_ini.artifact_loc[last_artifact] = artifact_location;
	obj_ini.artifact_sid[last_artifact] = ship_id;
	obj_ini.artifact_quality[last_artifact] = "artifact";
	obj_ini.artifact_equipped[last_artifact]=  false;
	obj_ini.artifact_struct[last_artifact] = new arti_struct(last_artifact);

	obj_controller.artifacts+=1;

	scr_recent("artifact_acquired",string(obj_ini.artifact_tags[last_artifact]),last_artifact);


}

function artifact_has_tag(index, wanted_tag){
	return array_contains(obj_ini.artifact_tags[index], wanted_tag);
}
//TODO make a proper artifact struct
function arti_struct(Index)constructor{
	index = Index
	static type = function(){
		return obj_ini.artifact[index];
	}
	static condition = function(){
		return obj_ini.artifact_condition[index];
	}
	static loc = function(){
		return obj_ini.artifact_loc[index];
	}
	static sid = function(){
		return obj_ini.artifact_sid[index];
	}
	static quality = function(){
		return obj_ini.artifact_quality[index];
	}
	static tags = function(){
		return obj_ini.artifact_tags[index];
	}
	static equipped = function(){
		return obj_ini.artifact_equipped[index];
	}

	static identified = function(){
		return obj_ini.artifact_identified[index];
	}

	static has_tag = function(wanted_tag){
		return array_contains(tags(), wanted_tag);
	}
	static has_tags = function(wanted_tags){
		for (var i=0;i<array_length(wanted_tags);i++){
			if (array_contains(tags(), wanted_tag)){
				return true;
			}
		}
		return false;
	}	

	static inquisition_disprove = function(){
		var inquis_tags = ["daemonic","chaos_gift", "chaos"];
		if (has_tag("inq")) then return false;

	}
	static load_json_data = function(data){
		 var names = variable_struct_get_names(data);
		 for (var i = 0; i < array_length(names); i++) {
            variable_struct_set(self, names[i], variable_struct_get(data, names[i]))
        }
	}

	static determine_base_type = function(){
		var item_type = "device";
	    if struct_exists(global.gear[$ "armour"],type()){
            item_type = "armour";
        }
        else if struct_exists(global.gear[$ "mobility"],type()){
            item_type = "mobility";
        }
        else if struct_exists(global.gear[$ "gear"],type()){
            item_type = "gear";
        }
        else if struct_exists(global.weapons,type()){
            item_type = "weapon";
        }
		else if (type()=="Casket") { item_type="device";}
		else if (type()=="Chalice") { item_type="device";}
		else if (type()=="Statue") { item_type="device";}
		else if (type()=="Tome") { item_type="device";}
		else if (type()=="Robot") { item_type="device";}      
        return (item_type);
	};

	static unequip_from_unit = function(){
		if (equipped() && is_array(bearer)){
			var b_type = determine_base_type();
			var unit = fetch_unit(bearer);
			if (b_type=="weapon"){
				if (unit.weapon_one(true) == index){
					unit.update_weapon_one("", false, false);
				} else if (unit.weapon_two(true) == index){
					unit.update_weapon_two("", false, false);
				} 
			} else if (b_type=="gear"){
				unit.update_gear("", false, false);
			} else if (b_type=="armour"){
				unit.update_armour("", false, false);
			} else if (b_type=="mobility"){
				unit.update_mobility_item("", false, false);
			}
		}
	}
	custom_data = {};
	name = "";
	custom_description="";
	bearer=false;

	static description = scr_arti_descr;
}


function corrupt_artifact_collectors(last_artifact){
	try{
		var arti = obj_ini.artifact_struct[last_artifact];
		if (arti.inquisition_disprove()){
		    for (var i=0;i<array_length(obj_controller.display_unit);i++){
		        if (obj_controller.man_sel[i]=1){
		            if (obj_controller.man[i]="man"){
		            	if (is_struct(obj_controller.display_unit[i])) then obj_controller.display_unit[i].edit_corruption(choose(0,2,4,6,8));
		            }
		            else if (obj_controller.man[i]="vehicle" && is_array(obj_controller.display_unit[i])){
		                obj_ini.veh_chaos[obj_controller.display_unit[i][0]][obj_controller.display_unit[i][1]]+=choose(0,2,4,6,8);
		            }
		        }
		    }
		}
	}
	catch( _exception){
	    show_debug_message(_exception.message);	
	}
}

function delete_artifact(index){
	if (!(index>=array_length(obj_ini.artifact))){
		with (obj_ini){
	        obj_ini.artifact[index]="";
	        obj_ini.artifact_tags[index]=[];
	        obj_ini.artifact_identified[index]=0;
	        obj_ini.artifact_condition[index]=0;
	        obj_ini.artifact_loc[index]="";
	        obj_ini.artifact_sid[index]=0;
	        obj_ini.artifact_struct[index]=new arti_struct(index);
		}
		obj_controller.artifacts-=1;
	}
}
