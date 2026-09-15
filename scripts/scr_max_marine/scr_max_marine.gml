function scr_max_marine(max_type) {
    // max_type : "chaos" or "age" or "exp"

    // Returns the marine with the highest value

    var man_c, man_i, value, unit;
    man_c = 0;
    man_i = 0;
    value = 0;

    for (co = 0; co <= obj_ini.companies; co++) {
        for (var i = 0; i < company_length(co); i++) {
            unit = fetch_unit([co, i]);
            if (!is_struct(unit)) {
                continue;
            }
            if (max_type == "chaos") {
                if (unit.corruption > value) {
                    value = unit.corruption;
                    man_c = co;
                    man_i = i;
                }
            } else if (max_type == "age") {
                if (unit.age() < value) {
                    value = unit.age();
                    man_c = co;
                    man_i = i;
                }
            } else if (max_type == "exp") {
                if (unit.experience > value) {
                    value = unit.experience;
                    man_c = co;
                    man_i = i;
                }
            }
        }
    }

    return fetch_unit([man_c, man_i]);
}
