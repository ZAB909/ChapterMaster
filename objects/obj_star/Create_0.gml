// Creates all variables, sets up default variables for different planets and if there is a fleet orbiting a system/planet
craftworld = 0; // orbit_angle=0;orbit_radius=0;
space_hulk = 0;
old_x = 0;
old_y = 0;

if (((x >= (room_width - 150)) and(y <= 450)) or(y < 100)) and(global.load == 0) { // was 300
    instance_destroy();
}

var run=0;
name="";
star="";
planets=0;
owner = eFACTION.Imperium;
image_speed=0;
image_alpha=0;
x2=0;
y2=0;
buddy=0;
if (global.load==0) then alarm[0]=1;
storm=0;
storm_image=0;
trader=0;
visited=0;

// sets up default planet variables
for(run=1; run<=8; run++){
    planet[run]=0;
    dispo[run]=-50;
    p_type[run]="";
    p_operatives[run]=[];
    p_feature[run]=[];
    p_owner[run]=0;
    p_first[run]=0;
    p_population[run]=0;
    p_max_population[run]=0;
    p_large[run]=0;
    p_pop[run]="";
    p_guardsmen[run]=0;
    p_pdf[run]=0;
    p_fortified[run]=0;
    p_station[run]=0;
	warlord=0;
    // Whether or not player forces are on the planet
    p_player[run] = 0;
    p_lasers[run] = 0;
    p_silo[run] = 0;
    p_defenses[run] = 0;
    p_upgrades[run] = [];
    // v how much of a problem they are from 1-5
    p_orks[run] = 0;
    p_tau[run] = 0;
    p_eldar[run] = 0;
    p_tyranids[run] = 0;
    p_traitors[run] = 0;
    p_chaos[run] = 0;
    p_demons[run] = 0;
    p_sisters[run] = 0;
    p_necrons[run] = 0;
    p_halp[run] = 0;
    // current planet heresy
    p_heresy[run] = 0;
    p_hurssy[run] = 0;
    p_hurssy_time[run] = 0;
    p_heresy_secret[run] = 0;
    p_influence[run] = 0;
    p_raided[run] = 0;
    // 
    p_problem[0, run] = "";
    p_timer[0, run] = 0;
    p_problem[1, run] = "";
    p_timer[1, run] = 0;
    p_problem[2, run] = "";
    p_timer[2, run] = 0;
    p_problem[3, run] = "";
    p_timer[3, run] = 0;
    p_problem[4, run] = "";
    p_timer[4, run] = 0;
    p_problem[5, run] = "";
    p_timer[5, run] = 0;
}

system_player_ground_forces = 0;

for(run=8; run<=30; run++){
    present_fleet[run]=0;
}
vision = 1;
// present_fleets=0;
// tau_fleets=0;

ai_a = -1;
ai_b = -1;
ai_c = -1;
ai_d = -1;
ai_e = -1;

global.star_name_colors = [
	38144,
	c_white, //player
	c_gray, //imperium
	c_red, // toaster fuckers
	38144, //nothing for inquisition
	c_white, //ecclesiarchy
	#FF8000, //Hi, I'm Elfo
	#009500, // waagh
	#FECB01, // the greater good
	#AD5272,// bug boys
	c_purple, // chaos
	38144, //nothing for heretics either
	38144, //why 12 is skipped in general, we will never know
	#80FF00 // Sleepy robots
]

ui_node = new UINode(x - sprite_xoffset, y - sprite_yoffset, sprite_width, sprite_height)

#region serialization

serialize = function(star_index) {

    // General stuff and init

    var _star_data = {
        _index: star_index,
        name,
        type: star,
        owner_index: owner,
        position: {
            x,
            y,
            x2,
            y2,
            old_x,
            old_y,
        },
        is_visible: vision,
        has_storm: storm,
        trader,
        is_craftworld: craftworld,
        is_space_hulk: space_hulk,
        planet_count: planets,
        planets: [],
    };

    // Planets

    for (var p = 0; p < planets; p++) {
        var _planet = planet[p];
        if (!_planet) {
            // TODO debug log error
            continue;
        }
        var _planet_data = {
            _index: p,
            //name: _planet, // TODO this is basically is_planet, does it make sense to store this?
            disposition: dispo[p],
            type: p_type[p],
            feature_count: array_length(p_feature[p]),
            features: [],
            owner_index: p_owner[p],
            first: p_first[p],
            population: p_population[p],
            max_population: p_max_population[p],
            is_large: p_large[p],
            pop: p_pop[p],
            guardsmen: p_guardsmen[p],
            pdf: p_pdf[p],
            fortified: p_fortified[p],
            station: p_station[p],
            player: p_player[p], // TODO ???
            player_defense_structures: {},
            player_upgrade_structures_count: array_length(p_upgrades[p]),
            player_upgrade_structures: [],
            hurssy: p_hurssy[p],
            hurssy_time: p_hurssy_time[p],
            heresy: p_heresy[p],
            heresy_secret: p_heresy_secret[p],
            influence: p_influence[p],
            raided: p_raided[p],
            problems: [],
        };

        // Planetary Features

        for (var f = 0; f < _planet_data.feature_count; f++) {
            var _feature = p_feature[p][f];
            var _feature_data = 0;

            if (!_feature) {
                // TODO debug log warning/error
            } else {
                _feature_data = _feature.serialize(f);
            }

            array_push(_planet_data.features, _feature_data);
        }

        // Planetary Player Structures

        if (_planet_data.first == 1 || _planet_data.owner_index == 1) { // Belongs to Player
            _planet_data.player_defense_structures.lasers = p_lasers[p];
            _planet_data.player_defense_structures.silos = p_silo[p];
            _planet_data.player_defense_structures.defenses = p_defenses[p];
        }

        // Planetary Player Upgrades

        for (var u = 0; u < _planet_data.player_upgrade_structures_count; u++) {
            var _planetary_upgrade = p_upgrades[p][u];
            var _planetary_upgrade_data = 0;

            if (!_planetary_upgrade) {
                // TODO debug log warning/error
            } else {
                _planetary_upgrade_data = _planetary_upgrade.serialize(u);
            }

            array_push(_planet_data.player_upgrade_structures, _planetary_upgrade_data);
        }

        // Planetary Faction presence

        _planet_data.faction_presence = {
            orks: p_orks[p],
            tau: p_tau[p],
            eldar: p_eldar[p],
            traitors: p_traitors[p],
            chaos: p_chaos[p],
            demons: p_demons[p],
            sisters: p_sisters[p],
            necrons: p_necrons[p],
            tyranids: p_tyranids[p],
            halp: p_halp[p], // TODO ???
        };

        // Planetary Problems

        for(var i = 1; i <= 4; i++){
            array_push(
                _planet_data.problems, 
                {
					_index: i,
                    problem: p_problem[p][i],
                    timer: p_timer[p][i]
                });
        }

        // Push planet data
        array_push(_star_data.planets, _planet_data);
    }

    return _star_data;
}

#endregion serialization