function scr_wep_abbreviate(argument0) {

	// argument0: weapon/item/gear name

	var we,we2,artifact;
	we="";we2="";artifact=false;

	if (string_count("&",argument0)=0) then we=argument0;
	if (string_count("&",argument0)>0){var ttt;ttt=0;we=argument0;ttt=string_pos("&",we);we="*"+string(string_delete(we,ttt,99)+"*");}
	if (string_count("Master Crafted ",argument0)>0){
	    we=string_replace(argument0,"Master Crafted ","^");
	    // var ttt;ttt=0;we=argument0;ttt=string_pos("Master Crafted ",we);we="^"+string(string_delete(we,0,string_length("Master Crafted ")));
	}

	if (we="Scout Armor") then we2="Scout";
	if (we="MK3 Iron Armor") then we2="MK3";
	if (we="MK4 Maximus") then we2="MK4";
	if (we="MK6 Corvus") then we2="MK6";
	if (we="MK7 Aquila") then we2="MK7";
	if (we="MK8 Errant") then we2="MK8";
	if (we="Power Armor") then we2="PA";
	if (we="Artificer Armor") then we2="Arti";
	if (we="Terminator Armor") then we2="Termi";
	if (we="Tartaros") then we2="Tarta";
	if (we="Dreadnought") then we2="Dread";
	if (we="Jump Pack") then we2="Jump";
	if (we="Narthecium") then we2="Narth";
	if (we="Psychic Hood") then we2="Hood";
	if (we="Rosarius") then we2="Rosa";
	if (we="Iron Halo") then we2="Halo";
	if (we="Plasma Bomb") then we2="Bomb";
	if (we="Exterminatus") then we2="Exter";
	if (we="Bike") then we2="Bike";
	if (we="Company Standard") then we2="Stand";

	if (we="Storm Shield") then we2="StShield";
	if (we="Boarding Shield") then we2="BoShield";
	if (we="Hellgun") then we2="HGun";
	if (we="Hellrifle") then we2="HRifle";
	if (we="Archeotech Laspistol") then we2="Archeo";
	if (we="Combat Knife") then we2="Knife";
	if (we="Chainsword") then we2="ChSword";
	if (we="Chainaxe") then we2="ChAxe";
	if (we="Eviscerator") then we2="Evisc";
	if (we="Power Sword") then we2="PoSword";
	if (we="Eldar Power Sword") then we2="ElSword";
	if (we="Power Weapon") then we2="PoWeap";
	if (we="Power Axe") then we2="PoAxe";
	if (we="Power Fist") then we2="PoFist";
	if (we="Lightning Claw") then we2="LiClaw";
	if (we="Chainfist") then we2="ChFist";
	if (we="Lascutter") then we2="LCutter";
	if (we="Force Weapon") then we2="FoWeap";
	if (we="Thunder Hammer") then we2="Hammer";

	if (we="Bolt Pistol") then we2="BoltPist";
	if (we="Webber") then we2="Web";
	if (we="Bolter") then we2="Bolter";
	if (we="Combiflamer") then we2="CombiFl";
	if (we="Twin Linked Bolters") then we2="TL Bolt";
	if (we="Heavy Bolter") then we2="HVYBolt";
	if (we="Storm Bolter") then we2="StrmBolt";
	if (we="Flamer") then we2="Flamer";
	if (we="Incinerator") then we2="Incin";
	if (we="Heavy Flamer") then we2="HVYFlamer";
	if (we="Inferno Cannon") then we2="Inferno";
	if (we="Meltagun") then we2="Melta";
	if (we="Multi-Melta") then we2="M Melta";
	if (we="Plasma Pistol") then we2="PlaPist";
	if (we="Infernus Pistol") then we2="InfPist";
	if (we="Plasma Gun") then we2="PlaGun";
	if (we="Sniper Rifle") then we2="Snipe";
	if (we="Assault Cannon") then we2="Assa";
	if (we="Autocannon") then we2="AutoC";
	if (we="Missile Launcher") then we2="Missi";
	if (we="Lascannon") then we2="LasCan";
	if (we="Conversion Beam Projector") then we2="CBP";
	if (we="Integrated Bolters") then we2="IntBolt";
	if (we="Power Fists") then we2="2 PoFist";
	if (we="Close Combat Weapon") then we2="CCW";
	if (we="Twin Linked Heavy Bolter") then we2="TL Hvy Bolt";
	if (we="Twin Linked Lascannon") then we2="TL LasCan";
	if (we="Lascannons") then we2="2 LasCan";
	if (we="Heavy Bolters") then we2="2 HvyBolt";
	if (we="Whirlwind Missiles") then we2="Whirl";

	return(we2);


}
