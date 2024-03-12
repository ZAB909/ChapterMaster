function scr_arti_descr() {
	var mission_data="",basic_asthetic="",p3="",p4="",final_description="",typ="",good=0;
	// This script generates the longish artifact description.
	if (custom_description==""){
	
		var temp=tags();
	
		typ="weapon";
		if (type()=="Power Armour") then typ="armour";
		else if (type()=="Terminator Armour") then typ="armour";
		else if (type()=="Dreadnought") then typ="armour";
		else if (type()=="Artificer Armour") then typ="armour";
		else if (type()=="Rosarius") then typ="gear";
		else if (type()=="Bionics") then typ="gear";
		else if (type()=="Psychic Hood") then typ="gear";
		else if (type()=="Jump Pack") then typ="gear";
		else if (type()=="Servo Arms") then typ="gear";
		else if (type()=="Casket") then typ="device";
		else if (type()=="Chalice") then typ="device";
		else if (type()=="Statue") then typ="device";
		else if (type()=="Tome") then typ="device";
		else if (type()=="Robot") then typ="device";
	
		if (type()!="Power Armour") and (type()!="Terminator Armour") and (type()!="Artificer Armour"){
		    mission_data="This artifact is a "+string(type());
		    if (string_count("inq",temp)>0) then mission_data+=", entrusted by the Inquisition.";
		    else if (string_count("inq",temp)=0) then mission_data+=".";
		}
	
		if (type()=="Power Armour") or (type()=="Terminator Armour") or (type()=="Artificer Armour"){
		    mission_data="This artifact is "+string(type());
		    if (string_count("inq",temp)>0) then mission_data+=", entrusted by the Inquisition.";
		    else if (string_count("inq",temp)=0) then mission_data+=".";
		}
		else if (string_count("|cgf",temp)>0) then mission_data="This artifact is a "+string(type())+" gifted by the Chaos Lord.";
	
	
		if (typ="weapon"){
		    good=0;
		    if (good=0) and (string_count("RUN",temp)>0){
		    	basic_asthetic="Several glowing runes have been carved along its surfaces.";string_replace(temp,"RUN","");}
		    else if (good=0) and (string_count("SCO",temp)>0){
		    	basic_asthetic="An extremely finely crafted scope, with several lenses, sits on top.";string_replace(temp,"SCO","");}
		    else if (good=0) and (string_count("DUB",temp)>0){
		    	basic_asthetic="Rather than a single power fist there is a matching pair of two.";string_replace(temp,"DUB","");}
		    else if (good=0) and (string_count("ADA",temp)>0){
		    	basic_asthetic="All ceremite on the weapon has been substituted for polished adamantium.";string_replace(temp,"ADA","");}
		    else if (good=0) and (string_count("VOI",temp)>0){
		    	basic_asthetic="The weapon is black as night, with green, pulsing veins of an unknown energy.";string_replace(temp,"VOI","");}
		    else if (good=0) and (string_count("CHB",temp)>0){
		    	string_replace(temp,"CHB","");
		        if (type()!="Power Fist") then basic_asthetic="The striking surface has been replaced with a very powerful chainblade.";
		        else if (type()=="Power Fist") then basic_asthetic="The addition of a small chainblade has turned it into a chainfist.";
		    }
		    else if (good=0) and (string_count("UFL",temp)>0){
		    	basic_asthetic="A promethium flamethrower has been built in to the bottom of the weapon.";string_replace(temp,"UFL","");}
		    good=0;
		    if (good=0) and (string_count("GLD",temp)>0){
		    	p3="It is decorated with gold filigree.";string_replace(temp,"GLD","");}
		    else if (good=0) and (string_count("GLO",temp)>0){
		    	p3="It glows with an eery, soft blue color.";string_replace(temp,"GLO","");}
		    else if (good=0) and (string_count("UBL",temp)>0){
		    	p3="A bolter has been integrated.";string_replace(temp,"UBL","");}
		    else if (good=0) and (string_count("UFL",temp)>0){
		    	p3="A flamethrower has been integrated.";string_replace(temp,"GOLD","");}
		}
	
		else if (typ="armour"){
		    good=0;
		    if (good=0) and (string_count("ART",temp)>0){
		    	basic_asthetic="Much of the armour is made up of finely articulated plates, neatly interlocking.";string_replace(temp,"ART","");}
		    else if (good=0) and (string_count("SPI",temp)>0){
		    	basic_asthetic="A multitude of spikes, of varying sizes, adorn the armour.";string_replace(temp,"SPI","");}
		    else if (good=0) and (string_count("RUN",temp)>0){
		    	basic_asthetic="Several glowing runes have been carved along its surfaces.";string_replace(temp,"RUN","");}
		    else if (good=0) and (string_count("DRA",temp)>0){
		    	basic_asthetic="Several areas of the armour have been patched over with Drake scales.";string_replace(temp,"DRA","");}
		    good=0;
		    if (good=0) and (string_count("GLD",temp)>0){
		    	p3="It is decorated with gold filigree.";string_replace(temp,"GLD","");}
		    else if (good=0) and (string_count("GLO",temp)>0){
		    	p3="The optics glow dark red.";string_replace(temp,"GLO","");}
		    else if (good=0) and (string_count("PUR",temp)>0){
		    	p3="It has many crude purity seals.";string_replace(temp,"UBL","");}
		}
	
		else if (typ="gear"){
		    good=0;
		    if (good=0) and (string_count("SUP",temp)>0){
		    	basic_asthetic="It has been carved with such intricate detail that the facets are uncountable.";string_replace(temp,"SUP","");}
		    else if (good=0) and (string_count("ADA",temp)>0){
		    	basic_asthetic="All ceremite on the item has been substituted for polished adamantium.";string_replace(temp,"ADA","");}
		    else if (good=0) and (string_count("GOLD",temp)>0){
		    	basic_asthetic="All ceremite on the item has been replaced with shining, polished gold.";string_replace(temp,"GOLD","");}
		    good=0;
		    if (good=0) and (string_count("SAL",temp)>0){
		    	p3="An emblem of a Fire Drake is embossed on the cover.";string_replace(temp,"SAL","");}
		    else if (good=0) and (string_count("GLD",temp)>0){
		    	p3="It is decorated with gold filigree.";string_replace(temp,"GLD","");}
		    else if (good=0) and (string_count("GLO",temp)>0){
		    	p3="It glows a soft green color.";string_replace(temp,"GLO","");}
		    else if (good=0) and (string_count("BIG",temp)>0){
		    	p3="It is of unusually large size.";string_replace(temp,"BIG","");}
		    else if (good=0) and (string_count("BUR",temp)>0){
		    	p3="Small, non-burning flames lick across the surface.";string_replace(temp,"BUR","");}
		    else if (good=0) and (string_count("RUN",temp)>0){
		    	p3="Several glowing runes have been carved along its surfaces.";string_replace(temp,"RUN","");}
		    else if (good=0) and (string_count("SOO",temp)>0){
		    	p3="It has a soothing appearance.";string_replace(temp,"SOO","");}
		    else if (good=0) and (string_count("FIN",temp)>0){
		    	p3="Rather than normal tubes, or plates, it is made up of very fine cloth that is unshearable.";string_replace(temp,"FIN","");}
		    else if (good=0) and (string_count("MASK",temp)>0){
		    	p3="It is shaped and contorted into a Fearsome Mask.";string_replace(temp,"MASK","");}
		    else if (good=0) and (string_count("SPI",temp)>0){
		    	p3="A multitude of spikes, of varying sizes, adorn the armour.";string_replace(temp,"SPI","");}
		    else if (good=0) and (string_count("SKRE",temp)>0){
		    	p3="While on it lets out a tormented scream.";string_replace(temp,"SKRE","");}
		    else if (good=0) and (string_count("WHI",temp)>0){
		    	p3="The jet flames are an unatural, clean white.";string_replace(temp,"WHI","");}
		    else if (good=0) and (string_count("SIL",temp)>0){
		    	p3="Somehow it is completely silent in operation.";string_replace(temp,"SIL","");}
		    else if (good=0) and (string_count("TEN",temp)>0){
		    	p3="The arms are especially lengthy and massively strong.";string_replace(temp,"GOR","");}
		    else if (good=0) and (string_count("GOR",temp)>0){
		    	p3="Instead of a single arm it is made up of many smaller tentacles.";string_replace(temp,"TEN","");}
		}
	
		else if (typ="device"){
		    good=0;
		    if (type()!="Robot"){
		        if (good=0) and (string_count("ADA",temp)>0){
		        	basic_asthetic="The devise is seemingly built of near-pure adamantium, impressively heavy.";string_replace(temp,"ADA","");}
		        else if (good=0) and (string_count("GOLD",temp)>0){
		        	basic_asthetic="The devise is covered in a thin layer of gold, which glitters and shines.";string_replace(temp,"GOLD","");}
		        else if (good=0) and (string_count("CRU",temp)>0){
		        	basic_asthetic="Many parts of the device are crumbling apart and cracking from old age.";string_replace(temp,"CRU","");}
		        else if (good=0) and (string_count("GLO",temp)>0){
		        	basic_asthetic="It emits a sickly, red glow that unnerves those that look upon it.";string_replace(temp,"GLO","");}
		        good=0;
		        if (good=0) and (string_count("SKU",temp)>0){
		        	p3="It is fashioned to resemble a massive pile of skulls of all races and ages.";string_replace(temp,"SKU","");}
		        else if (good=0) and (string_count("FAL",temp)>0){
		        	p3="It resembles an angel, fallen with broken wings, a sad look on its face.";string_replace(temp,"FAL","");}
		        else if (good=0) and (string_count("THI",temp)>0){
		        	p3="Carved on top is a strange creature with elongated limbs and small head.";string_replace(temp,"THI","");}
		        else if (good=0) and (string_count("TEN",temp)>0){
		        	p3="Carved on top is a ball of wriggling tentacles, eyes, and fangs.";string_replace(temp,"TEN","");}
		        else if (good=0) and (string_count("MIN",temp)>0){
		        	p3="The top panel seemingly writhes with motion, the geometric shapes blinding to behold.";string_replace(temp,"MIN","");}        
		        else if (good=0) and (string_count("GOAT",temp)>0){
		        	
	
		        	p3="It resembles a bipedal goat with odd skin blemishes and four small horns.";
		        	string_replace(temp,"GOAT","");
		        }
		        else if (good=0) and (string_count("SPE",temp)>0){
		        	p3="The statue is of a man with no eyes, ears, or nose.  The teeth are rotted and mishappen.";string_replace(temp,"SPE","");}
		        else if (good=0) and (string_count("DYI",temp)>0){
		        	p3="The statue is of an angel, sagging against a spear which has pierced its heart.";string_replace(temp,"DYI","");}
		        else if (good=0) and (string_count("JUM",temp)>0){
		        	p3="It resembles a scene of small children with large heads happily jumping into a pit of magma.";string_replace(temp,"JUM","");}
		        else if (good=0) and (string_count("CHE",temp)>0){
		        	p3="The statue resembles a fat grinx which smiles and looks outward with a malicious gaze.";string_replace(temp,"CHE","");}
		    }
		    else if (type()=="Robot"){
		        if (good=0) and (string_count("HU",temp)>0){
		        	basic_asthetic="It is built in the likeness of an attractive human female.";string_replace(temp,"HU","");}
		        else if (good=0) and (string_count("RO",temp)>0){
		        	basic_asthetic="It is squat and fat, though tall, and has simple utilitarian limbs.";string_replace(temp,"RO","");}
		        else if (good=0) and (string_count("SHI",temp)>0){
		        	basic_asthetic="It resembles a roaring, four-armed woman with abundant curves.";string_replace(temp,"SHI","");}
		        good=0;
		        if (good=0) and (string_count("ADA",temp)>0){
		        	p3="The machine is seemingly built of near-pure adamantium, impressively heavy.";string_replace(temp,"ADA","");}
		        else if (good=0) and (string_count("JAD",temp)>0){
		        	p3="The machine is built out of a type of jade, pure black, with many veins of green.";string_replace(temp,"JAD","");}
		        else if (good=0) and (string_count("BRO",temp)>0){
		        	p3="The machine is made out of a strange bronze material that seems impossibly durable.";string_replace(temp,"BRO","");}
		        else if (good=0) and (string_count("RUN",temp)>0){
		        	p3="Several glowing runes have been carved along its surfaces.";string_replace(temp,"RUN","");}
		    }
		}
	} else {
		final_description = custom_description
	}

	if (has_tag("mnr")){p3+="It is more crude and utilitarian than one might expect from an artifact.";}
	if (has_tag("Chaos")){p4="It bears the taint of Chaos.";}
	if (has_tag("Daemonic")){p4="It is infested with a Daemonic entity.";}

	final_description+=mission_data;
	if (basic_asthetic!="") then final_description+="  "+string(basic_asthetic);
	if (p3!="") then final_description+="  "+string(p3);
	if (p4!="") then final_description+="  "+string(p4);

	if (equipped() && is_array(bearer)){
		var unit = fetch_unit(bearer);
		final_description += $". It is currently in the possession of {unit.name_role()}."
	}

	return(string(final_description));


}
