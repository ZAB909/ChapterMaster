function scr_cheatcode(argument0) {
    var _cheatcode = ""
    var cheatcode_string = ""
    var cheatcode_digits = ""
    cheatcode_m_digits = ""
    var neg = 0
    if (argument0 == "") {
        return;
    }
    cheatcode = argument0
    _cheatcode = cheatcode
    cheatcode_string = string_letters(cheatcode)
    cheatcode_digits = string_digits(cheatcode)
    cheatcode_string = string_lower(cheatcode_string)

    if (cheatcode_digits != "")
        cheatcode_digits = real(cheatcode_digits)
    cheatcode_m_digits = cheatcode_digits
    neg = string_count("-", cheatcode)

    if (neg > 0)
        cheatcode_m_digits = (cheatcode_digits * -1)

    if (cheatcode_digits == "") {
        if (cheatcode_string=="slaughtersong"){
            create_starship_event();
        }
         if (cheatcode_string=="techuprising"){
            var pip = instance_create(0,0,obj_popup);
            pip.title = "Technical Differences!";
            pip.text = "You Recive an Urgent Transmision A serious breakdown in culture has coccured causing believers in tech heresy to demand that they are given preseidence and assurance to continue their practises";
            pip.image = "tech_uprising";
         }
        if (string_count("event", cheatcode_string) >0) {
            if (string_count("crusade", cheatcode_string) >0) {
                show_debug_message("crusading");
                  with(obj_controller){
                    launch_crusade();
                }           
            }else if (string_count("tomb", cheatcode_string) >0){
                show_debug_message("necron_tomb_awaken");
                with(obj_controller){
                    awaken_tomb_event();
                }  
            }else {
                with(obj_controller){
                    scr_random_event(1);
                }
            }
        }
        
        if (cheatcode_string == "infreq" && global.cheat_req == 0) {
            global.cheat_req = 1;
            cheatyface = 1;
            obj_controller.tempRequisition = obj_controller.requisition
            obj_controller.requisition = 51234
        } else if (cheatcode_string == "infreq" && global.cheat_req == 1) {
            global.cheat_req = 0;
            cheatyface = 1;
            obj_controller.requisition = obj_controller.tempRequisition
        } else if (cheatcode_string == "infseed" && global.cheat_gene == 0) {
            global.cheat_gene = 1;
            cheatyface = 1;
            obj_controller.tempGene_seed = obj_controller.gene_seed
            obj_controller.gene_seed = 9999
        } else if (cheatcode_string == "infseed" && global.cheat_gene == 1) {
            global.cheat_gene = 0;
            cheatyface = 1;
            obj_controller.gene_seed = obj_controller.tempGene_seed
        } else if (cheatcode_string == "debug" && global.cheat_debug == 0) {
            global.cheat_debug = 1;
            cheatyface = 1;
        } else if (cheatcode_string == "debug" && global.cheat_debug == 1) {
            global.cheat_debug = 0;
            cheatyface = 1;
        }

        if (cheatcode == "test") {
            cheatyface = 1
            diplomacy = 10.5
            scr_dialogue("test")
        }
    } else if (cheatcode_string == "req" && global.cheat_req == 0) {
        cheatcode_digits = clamp(cheatcode_digits, 0, 100000)
        cheatyface = 1
        obj_controller.requisition = cheatcode_digits
    } else if (cheatcode_string == "seed" && global.cheat_gene == 0) {
        cheatcode_digits = clamp(cheatcode_digits, 0, 9999)
        cheatyface = 1
        obj_controller.gene_seed = cheatcode_digits
    } else if string_count("dep", cheatcode_string) {
        cheatcode_m_digits = clamp(cheatcode_m_digits, -100, 100)

        if (cheatcode_string == "depimp")
            obj_controller.disposition[2] = cheatcode_m_digits
        else if (cheatcode_string == "depmec")
            obj_controller.disposition[3] = cheatcode_m_digits
        else if (cheatcode_string == "depinq")
            obj_controller.disposition[4] = cheatcode_m_digits
        else if (cheatcode_string == "depecc")
            obj_controller.disposition[5] = cheatcode_m_digits
        else if (cheatcode_string == "depeld")
            obj_controller.disposition[6] = cheatcode_m_digits
        else if (cheatcode_string == "depork")
            obj_controller.disposition[7] = cheatcode_m_digits
        else if (cheatcode_string == "deptau")
            obj_controller.disposition[8] = cheatcode_m_digits
        else if (cheatcode_string == "deptyr")
            obj_controller.disposition[9] = cheatcode_m_digits
        else if (cheatcode_string == "depcha")
            obj_controller.disposition[10] = cheatcode_m_digits
        else if (cheatcode_string == "depall") {
            global.cheat_disp = 1
            cheatyface = 1
            obj_controller.disposition[2] = real(cheatcode_m_digits)
            obj_controller.disposition[3] = real(cheatcode_m_digits)
            obj_controller.disposition[4] = real(cheatcode_m_digits)
            obj_controller.disposition[5] = real(cheatcode_m_digits)
            obj_controller.disposition[6] = real(cheatcode_m_digits)
            obj_controller.disposition[7] = real(cheatcode_m_digits)
            obj_controller.disposition[8] = real(cheatcode_m_digits)
            obj_controller.disposition[9] = real(cheatcode_m_digits)
            obj_controller.disposition[10] = real(cheatcode_m_digits)
        }
    }else if (cheatcode_string == "stc") {
        cheatcode_digits = clamp(cheatcode_digits, 0, 100)
        repeat cheatcode_digits
        scr_add_stc_fragment()
    } else if (cheatcode_string == "recruit") {
        var _start_pos = 0
        var length = (array_length(obj_controller.recruit_name) - 1)
        var i = 1
        while (i < length) {
            if (obj_controller.recruit_name[i] == "") {
                _start_pos = i
                break
            } else {
                i++
                continue
            }
        }

        for (i = _start_pos; i < (cheatcode_m_digits + _start_pos); i++) {
            obj_controller.recruit_name[i] = global.name_generator.generate_space_marine_name()
            obj_controller.recruit_exp[i] = 20
            obj_controller.recruit_corruption[i] = 0
            obj_controller.recruit_distance[i] = 0
            obj_controller.recruit_training[i] = 1
        }
        scr_alert("green", "recruitment", (string(cheatcode_m_digits) + "has started training."), 0, 0)
    }
    argument0 = ""
}