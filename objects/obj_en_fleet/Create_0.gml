owner = 0;
capital_number = 0;
frigate_number = 0;
escort_number = 0;
guardsmen = 0;
home_x = 0;
home_y = 0;
selected = 0;
ret = 0;
hurt = 0;
orbiting = 0;
rep = 3;
minimum_eta = 0;
navy = 0;
guardsmen_ratio = 0;
guardsmen_unloaded = 0;
ii_check = floor(random(5)) + 1;
etah = 0;
safe = 0;

image_xscale = 1.25;
image_yscale = 1.25;

var i;
i = -1;
repeat(21) {
    i += 1;
    capital[i] = "";
    capital_num[i] = 0;
    capital_sel[i] = 1;
    capital_imp[i] = 0;
    capital_max_imp[i] = 0;
}

var i;
i = -1;
repeat(31) {
    i += 1;
    frigate[i] = "";
    frigate_num[i] = 0;
    frigate_sel[i] = 1;
    frigate_imp[i] = 0;
    frigate_max_imp[i] = 0;
}

var i;
i = -1;
repeat(31) {
    i += 1;
    escort[i] = "";
    escort_num[i] = 0;
    escort_sel[i] = 1;
    escort_imp[i] = 0;
    escort_max_imp[i] = 0;
}

image_speed = 0;


action = "";
action_x = 0;
action_y = 0;
target = 0;
target_x = 0;
target_y = 0;
action_spd = 64;
if (owner <= 6) then action_spd = 128;
action_eta = 0;
connected = 0;
loaded = 0;

trade_goods = "";


capital_health = 100;
frigate_health = 100;
escort_health = 100;

alarm[8] = 1;

#region serialization

serialize = function(fleet_index) {
    var _enemy_fleet_data = {
        _index: fleet_index,
        owner_index: owner,
        position: {
            x,
            y,
        },
        sprite_index,
        image_index,
        image_alpha,
        capital_ships_count: capital_number,
        capital_ships: [],
        capital_hp: capital_health,
        frigate_ships_count: frigate_number,
        frigate_ships: [],
        frigate_hp: frigate_health,
        escort_ships_count: escort_number,
        escort_ships: [],
        escort_hp: escort_health,
        selected,
        action: {
            name: action,
            position: {
                x: action_x,
                y: action_y,
            },
            speed: action_spd,
            eta: action_eta,
        },
        home: {
            position: {
                x: home_x,
                y: home_y,
            }
        },
        target: {
            name: target,
            position: {
                x: target_x,
                y: target_y
            }
        },
        is_connected: connected,
        is_loaded: loaded,
        trade_goods,
        guardsmen,
        orbiting,
        is_imperial_navy: navy,
        guardsmen_unloaded,
    };

    // TODO, why are these special?
    if (_enemy_fleet_data.is_imperial_navy) {

        // Capital ships

        var imperial_capital_ship_count = array_length(capital_imp);

        if(imperial_capital_ship_count != _enemy_fleet_data.capital_ships_count){
            show_debug_message($"obj_en_fleet.create_0.serialize(): imperial_capital_ship_count != _enemy_fleet_data.capital_ships_count: ({imperial_capital_ship_count} != {_enemy_fleet_data.capital_ships_count})");
        }

        for (var s = 0; s < imperial_capital_ship_count; s++) {      
            if(!capital_imp[s])
            {
                continue;
            }

            var _ship_data = {
                _index: s,
                //name: capital[s],    // TODO Doesn't seem to be used
                //num: capital_num[s], // TODO Doesn't seem to be used
                //sel: capital_sel[s], // TODO Doesn't seem to be used
                crew_amount: capital_imp[s],
                crew_amount_max: capital_max_imp[s],
            };
            array_push(_enemy_fleet_data.capital_ships, _ship_data);
        }

        // Frigate ships

        var imperial_frigate_ship_count = array_length(frigate_imp);

        if(imperial_frigate_ship_count != _enemy_fleet_data.frigate_ships_count){
            show_debug_message($"obj_en_fleet.create_0.serialize(): imperial_frigate_ship_count != _enemy_fleet_data.frigate_ships_count: ({imperial_frigate_ship_count} != {_enemy_fleet_data.frigate_ships_count})");
        }

        for (var s = 0; s < imperial_frigate_ship_count; s++) {
            if(!frigate_imp[s])
            {
                continue;
            }

            var _ship_data = {
                _index: s,
                //name: frigate[s],    // TODO Doesn't seem to be used
                //num: frigate_num[s], // TODO Doesn't seem to be used
                //sel: frigate_sel[s], // TODO Doesn't seem to be used
                crew_amount: frigate_imp[s],
                crew_amount_max: frigate_max_imp[s],
            };
            array_push(_enemy_fleet_data.frigate_ships, _ship_data);
        }

        // Escort ships

        var imperial_escort_ship_count = array_length(escort_imp);

        if(imperial_escort_ship_count != _enemy_fleet_data.escort_ships_count){
            show_debug_message($"obj_en_fleet.create_0.serialize(): imperial_escort_ship_count != _enemy_fleet_data.escort_ships_count: ({imperial_escort_ship_count} != {_enemy_fleet_data.escort_ships_count})");
        }

        for (var s = 0; s < imperial_escort_ship_count; s++) {
            if(!escort_imp[s])
            {
                continue;
            }

            var _ship_data = {
                _index: s,
               // name: escort[s],    // TODO Doesn't seem to be used
              //  num: escort_num[s], // TODO Doesn't seem to be used
               // sel: escort_sel[s], // TODO Doesn't seem to be used
                crew_amount: escort_imp[s],
                crew_amount_max: escort_max_imp[s],
            };
            array_push(_enemy_fleet_data.escort_ships, _ship_data);
        }
    }

    return _enemy_fleet_data;
}

#endregion