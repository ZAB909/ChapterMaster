// TODO sizes should really be held in the vehicle's struct
var _vehicle_size_map = ds_map_create();
_vehicle_size_map[? "Rhino"] = 10;
_vehicle_size_map[? "Predator"] = 10;
_vehicle_size_map[? "Land Raider"] = 20;
_vehicle_size_map[? "Land Speeder"] = 5;
_vehicle_size_map[? "Whirlwind"] = 10;
_vehicle_size_map[? "Harlequin Troupe"] = 5;

// Modifies the size for each unit depending on their Type
function scr_unit_size(armour, role, other_factors, mobility) {
    var _size = 1;
    if (role == "") {
        return 0;
    }

	// TODO is_bulky should be in the armour's struct
    var bulky_armour = ["Terminator Armour", "Tartaros"]
    if (string_count("Dread", armour) > 0) {
        _size += 5;
    } else if (array_contains(bulky_armour, armour)) {
        _size++;
    };

    if (role == "Chapter Master") {
        _size++;
    } else if (ds_map_exists(_vehicle_size_map, role)) {
        _size = _vehicle_size_map[? role];
    } else {
        show_debug_message($"Could not find size for vehicle '{role}'");
    }

    return (_size);
}