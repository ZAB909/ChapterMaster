function scr_arti_descr(argument0) {

	// This script generates the longish artifact description.

	// argument0 = ID
	var p1,p2,p3,p4,p5,typ,good;
	p1="";p2="";p3="";p4="";p5="";
	typ="";good=0;

	var temp;temp=obj_ini.artifact_tags[argument0];

	typ="weapon";
	if (obj_ini.artifact[argument0]="Power Armour") then typ="armour";
	if (obj_ini.artifact[argument0]="Terminator Armour") then typ="armour";
	if (obj_ini.artifact[argument0]="Dreadnought") then typ="armour";
	if (obj_ini.artifact[argument0]="Artificer Armour") then typ="armour";
	if (obj_ini.artifact[argument0]="Rosarius") then typ="gear";
	if (obj_ini.artifact[argument0]="Bionics") then typ="gear";
	if (obj_ini.artifact[argument0]="Psychic Hood") then typ="gear";
	if (obj_ini.artifact[argument0]="Jump Pack") then typ="gear";
	if (obj_ini.artifact[argument0]="Servo Arms") then typ="gear";
	if (obj_ini.artifact[argument0]="Casket") then typ="device";
	if (obj_ini.artifact[argument0]="Chalice") then typ="device";
	if (obj_ini.artifact[argument0]="Statue") then typ="device";
	if (obj_ini.artifact[argument0]="Tome") then typ="device";
	if (obj_ini.artifact[argument0]="Robot") then typ="device";

	if (obj_ini.artifact[argument0]!="Power Armour") and (obj_ini.artifact[argument0]!="Terminator Armour") and (obj_ini.artifact[argument0]!="Artificer Armour"){
	    p1="This artifact is a "+string(obj_ini.artifact[argument0]);
	    if (string_count("inq",temp)>0) then p1+=", entrusted by the Inquisition.";
	    if (string_count("inq",temp)=0) then p1+=".";
	}

	if (obj_ini.artifact[argument0]="Power Armour") or (obj_ini.artifact[argument0]="Terminator Armour") or (obj_ini.artifact[argument0]="Artificer Armour"){
	    p1="This artifact is "+string(obj_ini.artifact[argument0]);
	    if (string_count("inq",temp)>0) then p1+=", entrusted by the Inquisition.";
	    if (string_count("inq",temp)=0) then p1+=".";
	}
	if (string_count("|cgf",temp)>0) then p1="This artifact is a "+string(obj_ini.artifact[argument0])+" gifted by the Chaos Lord.";


	if (typ="weapon"){
	    good=0;
	    if (good=0) and (string_count("RUN",temp)>0){good=1;p2="Several glowing runes have been carved along its surfaces.";string_replace(temp,"RUN","");}
	    if (good=0) and (string_count("SCO",temp)>0){good=1;p2="An extremely finely crafted scope, with several lenses, sits on top.";string_replace(temp,"SCO","");}
	    if (good=0) and (string_count("DUB",temp)>0){good=1;p2="Rather than a single power fist there is a matching pair of two.";string_replace(temp,"DUB","");}
	    if (good=0) and (string_count("ADA",temp)>0){good=1;p2="All ceremite on the weapon has been substituted for polished adamantium.";string_replace(temp,"ADA","");}
	    if (good=0) and (string_count("VOI",temp)>0){good=1;p2="The weapon is black as night, with green, pulsing veins of an unknown energy.";string_replace(temp,"VOI","");}
	    if (good=0) and (string_count("CHB",temp)>0){good=1;string_replace(temp,"CHB","");
	        if (obj_ini.artifact[argument0]!="Power Fist") then p2="The striking surface has been replaced with a very powerful chainblade.";
	        if (obj_ini.artifact[argument0]="Power Fist") then p2="The addition of a small chainblade has turned it into a chainfist.";
	    }
	    if (good=0) and (string_count("UFL",temp)>0){good=1;p2="A promethium flamethrower has been built in to the bottom of the weapon.";string_replace(temp,"UFL","");}
	    good=0;
	    if (good=0) and (string_count("GLD",temp)>0){good=1;p3="It is decorated with gold filigree.";string_replace(temp,"GLD","");}
	    if (good=0) and (string_count("GLO",temp)>0){good=1;p3="It glows with an eery, soft blue color.";string_replace(temp,"GLO","");}
	    if (good=0) and (string_count("UBL",temp)>0){good=1;p3="A bolter has been integrated.";string_replace(temp,"UBL","");}
	    if (good=0) and (string_count("UFL",temp)>0){good=1;p3="A flamethrower has been integrated.";string_replace(temp,"GOLD","");}
	}

	if (typ="armour"){
	    good=0;
	    if (good=0) and (string_count("ART",temp)>0){good=1;p2="Much of the armour is made up of finely articulated plates, neatly interlocking.";string_replace(temp,"ART","");}
	    if (good=0) and (string_count("SPI",temp)>0){good=1;p2="A multitude of spikes, of varying sizes, adorn the armour.";string_replace(temp,"SPI","");}
	    if (good=0) and (string_count("RUN",temp)>0){good=1;p2="Several glowing runes have been carved along its surfaces.";string_replace(temp,"RUN","");}
	    if (good=0) and (string_count("DRA",temp)>0){good=1;p2="Several areas of the armour have been patched over with Drake scales.";string_replace(temp,"DRA","");}
	    good=0;
	    if (good=0) and (string_count("GLD",temp)>0){good=1;p3="It is decorated with gold filigree.";string_replace(temp,"GLD","");}
	    if (good=0) and (string_count("GLO",temp)>0){good=1;p3="The optics glow dark red.";string_replace(temp,"GLO","");}
	    if (good=0) and (string_count("PUR",temp)>0){good=1;p3="It has many crude purity seals.";string_replace(temp,"UBL","");}
	}

	if (typ="gear"){
	    good=0;
	    if (good=0) and (string_count("SUP",temp)>0){good=1;p2="It has been carved with such intricate detail that the facets are uncountable.";string_replace(temp,"SUP","");}
	    if (good=0) and (string_count("ADA",temp)>0){good=1;p2="All ceremite on the item has been substituted for polished adamantium.";string_replace(temp,"ADA","");}
	    if (good=0) and (string_count("GOLD",temp)>0){good=1;p2="All ceremite on the item has been replaced with shining, polished gold.";string_replace(temp,"GOLD","");}
	    good=0;
	    if (good=0) and (string_count("SAL",temp)>0){good=1;p3="An emblem of a Fire Drake is embossed on the cover.";string_replace(temp,"SAL","");}
	    if (good=0) and (string_count("GLD",temp)>0){good=1;p3="It is decorated with gold filigree.";string_replace(temp,"GLD","");}
	    if (good=0) and (string_count("GLO",temp)>0){good=1;p3="It glows a soft green color.";string_replace(temp,"GLO","");}
	    if (good=0) and (string_count("BIG",temp)>0){good=1;p3="It is of unusually large size.";string_replace(temp,"BIG","");}
	    if (good=0) and (string_count("BUR",temp)>0){good=1;p3="Small, non-burning flames lick across the surface.";string_replace(temp,"BUR","");}
	    if (good=0) and (string_count("RUN",temp)>0){good=1;p3="Several glowing runes have been carved along its surfaces.";string_replace(temp,"RUN","");}
	    if (good=0) and (string_count("SOO",temp)>0){good=1;p3="It has a soothing appearance.";string_replace(temp,"SOO","");}
	    if (good=0) and (string_count("FIN",temp)>0){good=1;p3="Rather than normal tubes, or plates, it is made up of very fine cloth that is unshearable.";string_replace(temp,"FIN","");}
	    if (good=0) and (string_count("MASK",temp)>0){good=1;p3="It is shaped and contorted into a Fearsome Mask.";string_replace(temp,"MASK","");}
	    if (good=0) and (string_count("SPI",temp)>0){good=1;p3="A multitude of spikes, of varying sizes, adorn the armour.";string_replace(temp,"SPI","");}
	    if (good=0) and (string_count("SKRE",temp)>0){good=1;p3="While on it lets out a tormented scream.";string_replace(temp,"SKRE","");}
	    if (good=0) and (string_count("WHI",temp)>0){good=1;p3="The jet flames are an unatural, clean white.";string_replace(temp,"WHI","");}
	    if (good=0) and (string_count("SIL",temp)>0){good=1;p3="Somehow it is completely silent in operation.";string_replace(temp,"SIL","");}
	    if (good=0) and (string_count("TEN",temp)>0){good=1;p3="The arms are especially lengthy and massively strong.";string_replace(temp,"GOR","");}
	    if (good=0) and (string_count("GOR",temp)>0){good=1;p3="Instead of a single arm it is made up of many smaller tentacles.";string_replace(temp,"TEN","");}
	}

	if (typ="device"){
	    good=0;
	    if (obj_ini.artifact[argument0]!="Robot"){
	        if (good=0) and (string_count("ADA",temp)>0){good=1;p2="The devise is seemingly built of near-pure adamantium, impressively heavy.";string_replace(temp,"ADA","");}
	        if (good=0) and (string_count("GOLD",temp)>0){good=1;p2="The devise is covered in a thin layer of gold, which glitters and shines.";string_replace(temp,"GOLD","");}
	        if (good=0) and (string_count("CRU",temp)>0){good=1;p2="Many parts of the device are crumbling apart and cracking from old age.";string_replace(temp,"CRU","");}
	        if (good=0) and (string_count("GLO",temp)>0){good=1;p2="It emits a sickly, red glow that unnerves those that look upon it.";string_replace(temp,"GLO","");}
	        good=0;
	        if (good=0) and (string_count("SKU",temp)>0){good=1;p3="It is fashioned to resemble a massive pile of skulls of all races and ages.";string_replace(temp,"SKU","");}
	        if (good=0) and (string_count("FAL",temp)>0){good=1;p3="It resembles an angel, fallen with broken wings, a sad look on its face.";string_replace(temp,"FAL","");}
	        if (good=0) and (string_count("THI",temp)>0){good=1;p3="Carved on top is a strange creature with elongated limbs and small head.";string_replace(temp,"THI","");}
	        if (good=0) and (string_count("TEN",temp)>0){good=1;p3="Carved on top is a ball of wriggling tentacles, eyes, and fangs.";string_replace(temp,"TEN","");}
	        if (good=0) and (string_count("MIN",temp)>0){good=1;p3="The top panel seemingly writhes with motion, the geometric shapes blinding to behold.";string_replace(temp,"MIN","");}        
	        if (good=0) and (string_count("GOAT",temp)>0){good=1;p3="It resembles a bipedal goat with odd skin blemishes and four small horns.";string_replace(temp,"GOAT","");}
	        if (good=0) and (string_count("SPE",temp)>0){good=1;p3="The statue is of a man with no eyes, ears, or nose.  The teeth are rotted and mishappen.";string_replace(temp,"SPE","");}
	        if (good=0) and (string_count("DYI",temp)>0){good=1;p3="The statue is of an angel, sagging against a spear which has pierced its heart.";string_replace(temp,"DYI","");}
	        if (good=0) and (string_count("JUM",temp)>0){good=1;p3="It resembles a scene of small children with large heads happily jumping into a pit of magma.";string_replace(temp,"JUM","");}
	        if (good=0) and (string_count("CHE",temp)>0){good=1;p3="The statue resembles a fat grinx which smiles and looks outward with a malicious gaze.";string_replace(temp,"CHE","");}
	    }
	    if (obj_ini.artifact[argument0]="Robot"){
	        if (good=0) and (string_count("HU",temp)>0){good=1;p2="It is built in the likeness of an attractive human female.";string_replace(temp,"HU","");}
	        if (good=0) and (string_count("RO",temp)>0){good=1;p2="It is squat and fat, though tall, and has simple utilitarian limbs.";string_replace(temp,"RO","");}
	        if (good=0) and (string_count("SHI",temp)>0){good=1;p2="It resembles a roaring, four-armed woman with abundant curves.";string_replace(temp,"SHI","");}
	        good=0;
	        if (good=0) and (string_count("ADA",temp)>0){good=1;p3="The machine is seemingly built of near-pure adamantium, impressively heavy.";string_replace(temp,"ADA","");}
	        if (good=0) and (string_count("JAD",temp)>0){good=1;p3="The machine is built out of a type of jade, pure black, with many veins of green.";string_replace(temp,"JAD","");}
	        if (good=0) and (string_count("BRO",temp)>0){good=1;p3="The machine is made out of a strange bronze material that seems impossibly durable.";string_replace(temp,"BRO","");}
	        if (good=0) and (string_count("RUN",temp)>0){good=1;p3="Several glowing runes have been carved along its surfaces.";string_replace(temp,"RUN","");}
	    }
	}

	if (string_count("mnr",temp)>0){p3+="It is more crude and utilitarian than one might expect from an artifact.";}
	if (string_count("Chaos",temp)>0){p4="It bears the taint of Chaos.";}
	if (string_count("Daemonic",temp)>0){p4="It is infested with a Daemonic entity.";}

	p5=p1;
	if (p2!="") then p5+="  "+string(p2);
	if (p3!="") then p5+="  "+string(p3);
	if (p4!="") then p5+="  "+string(p4);

	return(string(p5));


}
