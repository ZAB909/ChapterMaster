function scr_diplomacy_chaos_accept_peace() {

    var _accept_chance = 0;
    var _result = "";
    var _chapter_has_shitty_luck = false;
    var _power_projection_factor = 0.00375;

    _accept_chance += (obj_controller.marines * _power_projection_factor);
    _accept_chance += (obj_controller.command * _power_projection_factor);
	
    var _index = 0;
    // TODO refactor this, because it assumes there are always 4 (dis)advantages.
    // Also create a separate, global function to check for (dis)advantages,
    // or even better, create a Chapter obj 
    repeat(4) {
        _index++;
        if (obj_ini.adv[_index] = "Daemon Binders") then _accept_chance += 2;
        if (obj_ini.dis[_index] = "Suspicious") then _accept_chance += 1;
        if (obj_ini.adv[_index] = "Psyker Abundance") then _accept_chance += 1;
        if (obj_ini.adv[_index] = "Reverent Guardians") then _accept_chance -= 2;
        if (obj_ini.dis[_index] = "Never Forgive") then _accept_chance -= 2;
        if (obj_ini.adv[_index] = "Enemy: Fallen") {
            _accept_chance -= 999;
            _result = "fail_fallen";
        }
        if (obj_ini.dis[_index] = "Shitty Luck") then _chapter_has_shitty_luck = true;
    }

	// TODO horrible, refactor useful_info in general
    if (string_count("|CPF|", obj_controller.useful_info) > 0) then _result = "fail_angry";
    if (string_count("CHTRP2|", obj_controller.useful_info) > 0) then _result = "fail";

    if (_result = "") {
        if (_accept_chance < 3) then _result = "fail";
        else {
            _accept_chance = round(_accept_chance * 15);
            if (_chapter_has_shitty_luck) then _accept_chance -= 20;

            var _is_trap_roll = floor(random(100)) + 1;
            _result = _is_trap_roll ? "success_trap" : "success";
        }
    }

    if (_result = "success") or(_result = "success_trap") {
        // Determine star, planet, and p_problem number here
        var _that_star = 0;
        var _that_planet = 0;
        var _that_title = "";

        with(obj_temp8) {
            instance_destroy();
        }
        with(obj_star) {
            var _wl10_feature_count = 0;
            var _ii = 0;
            repeat(4) {
                _ii++;
                if (p_feature[_ii] != "") {
                    if (string_count("WL10", p_feature[_ii]) > 0) then _wl10_feature_count = _ii;
                }
            }
            if (_wl10_feature_count > 0) then repeat(_wl10_feature_count) {
                instance_create(x, y, obj_temp8);
            }
        }
        if (instance_exists(obj_temp8)) {
            _that_star = instance_nearest(obj_temp8.x, obj_temp8.y, obj_star);
            _that_planet = instance_number(obj_temp8);
            _that_title = $"{string(_that_star.name)} {scr_roman(_that_planet)}";
            with(obj_temp8) {
                instance_destroy();
            }
        }
        with(obj_temp8) {
            instance_destroy();
        }

        if (!instance_exists(_that_star)) then diplo_text = "[Error: No WL10 planet feature found.]";
        else {
            var _ii = 0;
            var _fprob = 0;
            repeat(4) {
                if (_fprob = 0) {
                    _ii++;
                    if (_that_star.p_problem[_that_planet, _ii] = "") {
                        _that_star.p_problem[_that_planet, _ii] = "meeting";
                        if (_result = "success_trap") then _that_star.p_problem[_that_planet, _ii] = "meeting_trap";
                        _that_star.p_timer[_that_planet, _ii] = 36;
                        _fprob = _ii;
                    }
                }
            }

            var _rando = choose(1, 2);
            if (_rando = 1) then diplo_text += $"A proposal that needs further consideration and some negotiation.  Meet me at {string(_that_title)} and we shall resolve this.";
            else diplo_text += $"Interesting. I shall be at {string(_that_title)} and, if you are sincere, you will come to me and we can take this proposal to its logical conclusion.";
            scr_event_log("", $"Chaos Lord {string(obj_controller.faction_leader[10])} agrees to meet with you on {string(_that_title)} to discuss an alliance.");
            var _new_event = instance_create(_that_star.x + 16, _that_star.y - 24, obj_star_event);
        }
    }
    else if (_result = "fail") {
        var _rando;
        _rando = choose(1, 2);
        if (_rando = 1) then diplo_text += "I would not assist you in slitting your own throat, it would hardly be worth my effort. Knowing this, why would you expect me to aid you?";
        else diplo_text += "A mouse does not invite himself to the table of a dragon. You should learn from it and, if you work hard, perhaps one day you will be almost as insignificant.";
    } else if (_result = "fail_fallen") {
        var _rando;
        _rando = choose(1, 2);
        if (_rando = 1) then diplo_text += "You must think that the servants of Chaos have no memory and no eyes. I assure we have both and know that you would be useless as an ally.";
        else diplo_text += "You may be unclear on how warfare works; You are my foe, however pathetic you might be, and foes do not enter into alliances.";
    } else if (_result = "fail_angry") {
        var _rando;
        _rando = choose(1, 2);
        if (_rando = 1) then diplo_text += "You have slain my servants, blunted the tools with which I carve my will into the universe and now you believe I will embrace you as an ally? I think not.";
        else {
            diplo_text += "Never forget, never forgive. Whatever else you have done, you have acted against me in the past and I do not forgive such transgressions. Away with you.";
            force_goodbye = 1;
        }
    } else {
        show_debug_message($"scr_diplomacy_chaos_accept_peace(): could not handle result '{_result}'")
    }
}