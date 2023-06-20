function scr_ork_name() {

	var nm,prefix,suffix,roll1;
	nm="";prefix=choose(1,2);roll1=floor(random(400))+1;
	if (prefix=1) then suffix=choose(2,2,1);
	if (prefix=2) then suffix=choose(1,1,2);

	if (prefix=1){rand=floor(random(18))+1;
	    if (rand=1) then nm+="Bad";
	    if (rand=2) then nm+="Daka";
	    if (rand=3) then nm+="Dreg";
	    if (rand=4) then nm+="Duff";
	    if (rand=5) then nm+="Dur";
	    if (rand=6) then nm+="Gob";
	    if (rand=7) then nm+="Gor";
	    if (rand=8) then nm+="Grim";
	    if (rand=9) then nm+="Grot";
	    if (rand=10) then nm+="Grub";
	    if (rand=11) then nm+="Grut";
	    if (rand=12) then nm+="Mag";
	    if (rand=13) then nm+="Mor";
	    if (rand=14) then nm+="Mek";
	    if (rand=15) then nm+="Mug";
	    if (rand=16) then nm+="Naff";
	    if (rand=17) then nm+="Nar";
	    if (rand=18) then nm+="Naz";
	}
	if (prefix=2){rand=floor(random(18))+1;
	    if (rand=1) then nm+="Nob";
	    if (rand=2) then nm+="Og";
	    if (rand=3) then nm+="Rot";
	    if (rand=4) then nm+="Shak";
	    if (rand=5) then nm+="Skab";
	    if (rand=6) then nm+="Skar";
	    if (rand=7) then nm+="Skum";
	    if (rand=8) then nm+="Snaga";
	    if (rand=9) then nm+="Snik";
	    if (rand=10) then nm+="Snot";
	    if (rand=11) then nm+="Ug";
	    if (rand=12) then nm+="Urty";
	    if (rand=13) then nm+="Uz";
	    if (rand=14) then nm+="Waa";
	    if (rand=15) then nm+="Waz";
	    if (rand=16) then nm+="Wort";
	    if (rand=17) then nm+="Zod";
	    if (rand=18) then nm+="Zog";
	}
	if (suffix=1){rand=floor(random(18))+1;
	    if (rand=1) then nm+="arg";
	    if (rand=2) then nm+="bad";
	    if (rand=3) then nm+="bag";
	    if (rand=4) then nm+="bog";
	    if (rand=5) then nm+="dreg";
	    if (rand=6) then nm+="fang";
	    if (rand=7) then nm+="fug";
	    if (rand=8) then nm+="gob";
	    if (rand=9) then nm+="gog";
	    if (rand=10) then nm+="gor";
	    if (rand=11) then nm+="grim";
	    if (rand=12) then nm+="grod";
	    if (rand=13) then nm+="grot";
	    if (rand=14) then nm+="grub";
	    if (rand=15) then nm+="gul";
	    if (rand=16) then nm+="gut";
	    if (rand=17) then nm+="kob";
	    if (rand=18) then nm+="lug";
	}
	if (suffix=2){rand=floor(random(18))+1;
	    if (rand=1) then nm+="nob";
	    if (rand=2) then nm+="og";
	    if (rand=3) then nm+="ork";
	    if (rand=4) then nm+="rot";
	    if (rand=5) then nm+="kill";
	    if (rand=6) then nm+="shak";
	    if (rand=7) then nm+="slag";
	    if (rand=8) then nm+="skab";
	    if (rand=9) then nm+="snik";
	    if (rand=10) then nm+="snaga";
	    if (rand=11) then nm+="sog";
	    if (rand=12) then nm+="stuf";
	    if (rand=13) then nm+="teef";
	    if (rand=14) then nm+="thug";
	    if (rand=15) then nm+="urty";
	    if (rand=16) then nm+="uz";
	    if (rand=17) then nm+="wort";
	    if (rand=18) then nm+="zod";
	}


	if (roll1=50) then nm="Robih Killyums";

	return(string(nm));


}
