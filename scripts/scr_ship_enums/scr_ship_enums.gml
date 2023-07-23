enum SHIP_CLASS {
	battle_barge,
	strike_cruiser,
	gladius,
	hunter,
	apocalypse_class_battleship,
	nemesis_class_fleet_carrier,
	avenger_class_grand_cruiser,
	sword_class_frigate,
	void_stalker,
	shadow_class,
	hellebore,
	aconite,
	dethdeala,
	gorbags_revenge,
	kroolboy,
	slamblasta,
	battlekroozer,
	ravager,
	custodian,
	protector, 
	emissary,
	warden,
	castellan,
	desecrator,
	avenger,
	carnage,
	daemon,
	iconoclast,
	leviathan,
	razorfiend ,
	stalker,
	prowler,
	cairn,
	reaper,
	shroud,
	jackal,
	dirge,
};
function print_class(a) {
	switch (a) {
		case SHIP_CLASS.battle_barge:
			return "Battle Barge";
		case SHIP_CLASS.strike_cruiser:
			return "Strike Cruiser";
		case SHIP_CLASS.gladius:
			return "Gladius";
		case SHIP_CLASS.hunter:
			return "Hunter";
		case SHIP_CLASS.apocalypse_class_battleship:
			return "Apocalypse Class Battleship";
		case SHIP_CLASS.nemesis_class_fleet_carrier:
			return "Nemesis Class Fleet Carrier";
		case SHIP_CLASS.avenger_class_grand_cruiser:
			return "Avenger Class Grand Cruiser";
		case SHIP_CLASS.sword_class_frigate:
			return "Sword Class Frigate";
		case SHIP_CLASS.void_stalker:
			return "Void Stalker";
		case SHIP_CLASS.shadow_class:
			return "Shadow Class";
		case SHIP_CLASS.hellebore:
			return "Hellebore";
		case SHIP_CLASS.aconite:
			return "Aconite";
		case SHIP_CLASS.dethdeala:
			return "Dethdeala";
		case SHIP_CLASS.gorbags_revenge:
			return "Gorbag's Revenge";
		case SHIP_CLASS.kroolboy:
			return "Kroolboy";
		case SHIP_CLASS.slamblasta:
			return "Slamblasta";
		case SHIP_CLASS.battlekroozer:
			return "Battlekroozer";
		case SHIP_CLASS.custodian:
			return "Custodian";
		case SHIP_CLASS.protector:
			return "Protector";
		case SHIP_CLASS.emissary:
			return "Emissary";
		case SHIP_CLASS.warden:
			return "Warden";
		case SHIP_CLASS.castellan:
			return "Castellan";
		case SHIP_CLASS.desecrator:
			return "Desecrator";
		case SHIP_CLASS.avenger:
			return "Avenger";
		case SHIP_CLASS.carnage:
			return "Carnage";
		case SHIP_CLASS.daemon:
			return "Daemon";
		case SHIP_CLASS.iconoclast:
			return "Iconoclast";
		case SHIP_CLASS.leviathan:
			return "Leviathan";
		case SHIP_CLASS.razorfiend:
			return "Razorfiend";
		case SHIP_CLASS.stalker:
			return "Stalker";
		case SHIP_CLASS.prowler:
			return "Prowler";
		case SHIP_CLASS.cairn:
			return "Cairn";
		case SHIP_CLASS.reaper:
			return "Reaper";
		case SHIP_CLASS.shroud:
			return "Shroud";
		case SHIP_CLASS.jackal:
			return "Jackal";
		case SHIP_CLASS.dirge:
			return "Dirge";
		default:
			return "";
	}
};


/// this can take either a struct that has a class field, or just the value that is being passed
function get_ship_sprite(ship) {
	var class;
	if(is_struct(ship) && struct_exists(ship, "class")) {
		class = ship.class;
	}		
	else {
		class = ship;	
	}
	
	switch (class) {
		case SHIP_CLASS.battle_barge:
			return "Battle Barge";
		case SHIP_CLASS.strike_cruiser:
			return "Strike Cruiser";
		case SHIP_CLASS.gladius:
			return "Gladius";
		case SHIP_CLASS.hunter:
			return "Hunter";
		case SHIP_CLASS.apocalypse_class_battleship:
			return "Apocalypse Class Battleship";
		case SHIP_CLASS.nemesis_class_fleet_carrier:
			return "Nemesis Class Fleet Carrier";
		case SHIP_CLASS.avenger_class_grand_cruiser:
			return "Avenger Class Grand Cruiser";
		case SHIP_CLASS.sword_class_frigate:
			return "Sword Class Frigate";
		case SHIP_CLASS.void_stalker:
			return "Void Stalker";
		case SHIP_CLASS.shadow_class:
			return "Shadow Class";
		case SHIP_CLASS.hellebore:
			return "Hellebore";
		case SHIP_CLASS.aconite:
			return "Aconite";
		case SHIP_CLASS.dethdeala:
			return "Dethdeala";
		case SHIP_CLASS.gorbags_revenge:
			return "Gorbag's Revenge";
		case SHIP_CLASS.kroolboy:
			return "Kroolboy";
		case SHIP_CLASS.slamblasta:
			return "Slamblasta";
		case SHIP_CLASS.battlekroozer:
			return "Battlekroozer";
		case SHIP_CLASS.custodian:
			return "Custodian";
		case SHIP_CLASS.protector:
			return "Protector";
		case SHIP_CLASS.emissary:
			return "Emissary";
		case SHIP_CLASS.warden:
			return "Warden";
		case SHIP_CLASS.castellan:
			return "Castellan";
		case SHIP_CLASS.desecrator:
			return "Desecrator";
		case SHIP_CLASS.avenger:
			return "Avenger";
		case SHIP_CLASS.carnage:
			return "Carnage";
		case SHIP_CLASS.daemon:
			return "Daemon";
		case SHIP_CLASS.iconoclast:
			return "Iconoclast";
		case SHIP_CLASS.leviathan:
			return "Leviathan";
		case SHIP_CLASS.razorfiend:
			return "Razorfiend";
		case SHIP_CLASS.stalker:
			return "Stalker";
		case SHIP_CLASS.prowler:
			return "Prowler";
		case SHIP_CLASS.cairn:
			return "Cairn";
		case SHIP_CLASS.reaper:
			return "Reaper";
		case SHIP_CLASS.shroud:
			return "Shroud";
		case SHIP_CLASS.jackal:
			return "Jackal";
		case SHIP_CLASS.dirge:
			return "Dirge";
		default:
			return "";
	}
};

enum SHIP_WEAPON {
	weapons_battery,
	thunderhawk_launch_bays,
	torpedo_tubes,
	torpedoes,
	bombardment_cannons,
	lance_battery,
	nova_cannon,
	interceptor_launch_bays,
	eldar_launch_bay,
	pulsar_lances,
	gunz_battery,
	heavy_gunz,
	fighta_bommerz,
	gravitic_launcher,
	railgun_battery,
	ion_cannons,
	manta_launch_bay,
	feeder_tendrils,
	bio_plasma_discharge,
	pyro_acid_battery,
	launch_glands,
	massive_claws,
	lightning_arc,
	star_pulse_generator,
	gauss_particle_whip
	
};
function print_weapon(a) {
	switch (a) {
		case SHIP_WEAPON.bombardment_cannons:
			return "Bombardment Cannons";
		case SHIP_WEAPON.thunderhawk_launch_bays:
			return "Thunderhawk Launch Bays";
		case SHIP_WEAPON.torpedo_tubes:
			return "Torpedo Tubes";
		case SHIP_WEAPON.torpedoes:
			return "Torpedoes";
		case SHIP_WEAPON.weapons_battery:
			return "Weapons Battery";
		case SHIP_WEAPON.lance_battery:
			return "Lance Battery";
		case SHIP_WEAPON.nova_cannon:
			return "Nova Cannon";
		case SHIP_WEAPON.interceptor_launch_bays:
			return "Interceptor Launch Bays";
		case SHIP_WEAPON.eldar_launch_bay:
			return "Eldar Launch Bay";
		case SHIP_WEAPON.pulsar_lances:
			return "Pulsar Lances";
		case SHIP_WEAPON.gunz_battery:
			return "Gunz Battery";
		case SHIP_WEAPON.heavy_gunz:
			return "Heavy Gunz";
		case SHIP_WEAPON.fighta_bommerz:
			return "Fighta Bommerz";
		case SHIP_WEAPON.gravitic_launcher:
			return "Gravitic Launcher";
		case SHIP_WEAPON.ion_cannons:
			return "Ion Cannons";
		case SHIP_WEAPON.railgun_battery:
			return "Railgun Battery";
		case SHIP_WEAPON.manta_launch_bay:
			return "Manta Launch Bay";
		case SHIP_WEAPON.feeder_tendrils:
			return "Feeder Tendrils";
		case SHIP_WEAPON.bio_plasma_discharge:
			return "Bio-Plasma Discharge";
		case SHIP_WEAPON.pyro_acid_battery:
			return "Pyro-Acid Battery";
		case SHIP_WEAPON.launch_glands:
			return "Launch Glands";
		case SHIP_WEAPON.massive_claws:
			return "Massive Claws";
		case SHIP_WEAPON.lightning_arc:
			return "Lightning Arc";
		case SHIP_WEAPON.star_pulse_generator:
			return "Star Pulse Generator";
		case SHIP_WEAPON.gauss_particle_whip:
			return "Gauss Particle Whip";
		default:
			return "";
	}
}

enum WEAPON_FACING {
	front,
	side, 
	special,
	left,
	right,
	most // I don't know what that means
}
function print_facing(a) {
	switch (a) {
		case WEAPON_FACING.front:
			return "front";
		case WEAPON_FACING.side:
			return "side";
		case WEAPON_FACING.special:
			return "special";
		case WEAPON_FACING.left:
			return "left";
		case WEAPON_FACING.right:
			return "right";
		case WEAPON_FACING.most:
			return "most";
		default:
			return "";
	}
}

enum SHIP_SIZE {
	capital,
	frigate,
	escort
}