
use_custom_icon=0;
icon=0;icon_name="";

specials=0;firsts=0;seconds=0;thirds=0;fourths=0;fifths=0;
sixths=0;sevenths=0;eighths=0;ninths=0;tenths=0;commands=0;

heh1=0;heh2=0;

strin="";
strin2="";
tolerant=0;
companies=10;
progenitor=0;

load_to_ships=[2,0,0];
if (instance_exists(obj_creation)){load_to_ships=obj_creation.load_to_ships;}

penitent=0;
penitent_max=0;
penitent_current=0;
penitent_end=0;
man_size=0;

// Equipment- maybe the bikes should go here or something?          yes they should
i=-1;
repeat(200){i+=1;
    equipment[i]="";equipment_type[i]="";equipment_number[i]=0;equipment_condition[i]=100;
    artifact[i]="";artifact_tags[i]="";artifact_identified[i]=0;artifact_condition[i]=100;artifact_loc[i]="";artifact_sid[i]=0;// Over 500 : ship
    // Weapon           Unidentified            
}

var i, v;i=-1;v=0;
repeat(210){i+=1;
    ship[i]="";ship_uid[i]=0;ship_owner[i]=0;ship_class[i]="";ship_size[i]=0;ship_uid[i]=0;
    ship_leadership[i]=0;ship_hp[i]=0;ship_maxhp[i]=0;ship_location[i]="";ship_shields[i]=0;
    ship_conditions[i]="";ship_speed[i]=0;ship_turning[i]=0;
    ship_front_armour[i]=0;ship_other_armour[i]=0;ship_weapons[i]=0;ship_shields[i]=0;
    ship_wep[i,0]="";ship_wep_facing[i,0]="";ship_wep_condition[i,0]="";
    ship_wep[i,1]="";ship_wep_facing[i,1]="";ship_wep_condition[i,1]="";
    ship_wep[i,2]="";ship_wep_facing[i,2]="";ship_wep_condition[i,2]="";
    ship_wep[i,3]="";ship_wep_facing[i,3]="";ship_wep_condition[i,3]="";
    ship_wep[i,4]="";ship_wep_facing[i,4]="";ship_wep_condition[i,4]="";
    ship_wep[i,5]="";ship_wep_facing[i,5]="";ship_wep_condition[i,5]="";
    ship_capacity[i]=0;ship_carrying[i]=0;ship_contents[i]="";ship_turrets[i]=0;
}

var company,v;
company=-1;
repeat(11){
    company+=1;v=-1;// show_message("v company: "+string(company));
    repeat(205){v+=1;// show_message(string(company)+"."+string(v));
        veh_race[company,v]=0;veh_loc[company,v]="";veh_name[company,v]="";veh_role[company,v]="";veh_wep1[company,v]="";veh_wep2[company,v]="";veh_wep3[company,v]="";
        veh_upgrade[company,v]="";veh_acc[company,v]="";veh_hp[company,v]=100;veh_chaos[company,v]=0;veh_pilots[company,v]=0;veh_lid[company,i]=0;veh_wid[company,v]=2;
        veh_uid[company,v]=0;
    }
}

v=0;company=0;
check_number=0;
year_fraction=0;
year=0;
millenium=0;
company_spawn_buffs = [];
role_spawn_buffs ={};

if (instance_exists(obj_creation)) then custom=obj_creation.custom;

if (global.load=0) then scr_initialize_custom();

#region serialization

serialize = function() {

    // general data and inits

    var _ini_data = {
        sector_name,
        use_custom_icon,
        progenitor,
        fleet_type,
        tolerant,
        stability,
        purity,
        imperium_disposition,
        advantages: [
            adv[1],
            adv[2],
            adv[3],
            adv[4]
        ],
        disadvantages: [
            dis[1],
            dis[2],
            dis[3],
            dis[4]
        ],
        home_name,
        home_type,
        recruiting_name,
        recruiting_type,
        chapter_name,
        // TODO ? fortress_name,
        flagship_name,
        icon,
        icon_name,
        man_size,
        strin,
        strin2,
        psy_powers,
        companies,
        company_titles: [],
        slave_batches: [],
        battle_cry,
        skin_color,
        master_autarch,
        master_avatar,
        master_farseer,
        master_aspect,
        master_eldar,
        master_eldar_vehicles,
        master_tau,
        master_battlesuits,
        master_kroot,
        master_tau_vehicles,
        master_ork_boyz,
        master_ork_nobz,
        master_ork_warboss,
        master_ork_vehicles,
        master_heretics,
        master_chaos_marines,
        master_lesser_demons,
        master_greater_demons,
        master_chaos_vehicles,
        master_gaunts,
        master_warriors,
        master_carnifex,
        master_synapse,
        master_tyrant,
        master_gene,
        master_necron_overlord,
        master_destroyer,
        master_necron,
        master_wraith,
        master_necron_vehicles,
        master_monolith,
        master_special_killed,
        preomnor,
        voice,
        doomed,
        lyman,
        omophagea,
        ossmodula,
        membrane,
        zygote,
        betchers,
        catalepsean,
        secretions,
        occulobe,
        mucranoid,
        master_name,
        chief_librarian_name,
        high_chaplain_name,
        high_apothecary_name,
        forge_master_name,
        lord_admiral_name,
        equipment: [],
        artifacts: [],
        ships: [],
        vehicles: [],
        marines: [],
        squads: [],
        squad_types,
    };

    // Company titles // TODO add Companies as well?

    for (var i = 0; i <= 20; i++) {

        if (company_title[i] == "") then continue;

        array_push(_ini_data.company_titles,{
            _index: i,
            title: $"{company_title[i]}",
        });
    }

    // Slave batches

    for (var i = 0; i <= 120; i++) {

        if (slave_batch_num[i] == 0) then continue;

        array_push(_ini_data.slave_batches,{
            _index: i,
            amount: slave_batch_num[i],
            eta: slave_batch_eta[i],
        });
    }

    // Equipment

    for (var i = 1; i <= 150; i++) {

        if (equipment[i] == "") then continue;

        array_push(_ini_data.equipment,{
            _index: i,
            name: equipment[i],
            type: equipment_type[i],
            amount: equipment_number[i],
            condition: equipment_condition[i],
        });
    }

    // Artifacts

    for (var i = 1; i <= 150; i++) {

        if (artifact[i] == "") then continue;

        array_push(_ini_data.artifacts,{
            _index: i,
            name: artifact[i],
            tags: artifact_tags[i],
            is_identified: artifact_identified[i],
            condition: artifact_condition[i],
            location: artifact_loc[i],
            sid: artifact_sid[i],
        });
    }

    // Ships

    for (var i = 1; i <= 200; i++) {

        if (ship[i] == "") then continue;

        array_push(_ini_data.ships,{
            _index: i,
            name: ship[i],
            uid: ship_uid[i],
            class: ship_class[i],
            size: ship_size[i],
            leadership: ship_leadership[i],
            hp: ship_hp[i],
            maxhp: ship_maxhp[i],
            location: ship_location[i],
            shields: ship_shields[i],
            conditions: ship_conditions[i],
            speed: ship_speed[i],
            turning: ship_turning[i],
            front_armour: ship_front_armour[i],
            other_armour: ship_other_armour[i],
            weapons_amount: ship_weapons[i],
            weapons: [],
            capacity: ship_capacity[i],
            carrying: ship_carrying[i],
            contents: ship_contents[i],
            turrets: ship_turrets[i],
        });

        // Try add ship weapons
        var _last_pushed_ship = array_last(_ini_data.ships);
        if (_last_pushed_ship.weapons_amount == 0) then continue;

        for (j = 1; j <= 5; j++) {
            if (ship_wep[i][j] == "") then continue;

            array_push(_last_pushed_ship.weapons,{
                _index: j,
                name: ship_wep[i][j],
                facing: ship_wep_facing[i][j],
                condition: ship_wep_condition[i][j],
            });
        }
    }

    // Vehicles

    // I think the below tries to iterate over vehicles backwards
    // TODO but why not forwards?
    var is_iteration_finished = false;
    var company_index = 10;
    var entity_in_company_index = 100;
    var safety_threshold = 1100;
    var iteration = -1;

    while (!is_iteration_finished) {
        iteration++;

        entity_in_company_index--;

        if (entity_in_company_index == 0) {
            // go to next company, this one is fully checked
            entity_in_company_index = 100;
            company_index--;
        }

        if (veh_role[company_index, entity_in_company_index] != "") {
            array_push(_ini_data.vehicles,{
                company_index: company_index,
                entity_in_company_index: entity_in_company_index,
                race: veh_race[company_index][entity_in_company_index], // TODO Got no idea what this does
                location: veh_loc[company_index][entity_in_company_index],
                role: veh_role[company_index][entity_in_company_index],
                lid: veh_lid[company_index][entity_in_company_index], // TODO Got no idea what this does
                uid: veh_uid[company_index][entity_in_company_index], // TODO Got no idea what this does
                wid: veh_wid[company_index][entity_in_company_index], // TODO Got no idea what this does
                weapons: [
                    veh_wep1[company_index][entity_in_company_index],
                    veh_wep2[company_index][entity_in_company_index],
                    veh_wep3[company_index][entity_in_company_index],
                ],
                upgrade: veh_upgrade[company_index][entity_in_company_index],
                accessory: veh_acc[company_index][entity_in_company_index],
                hp: veh_hp[company_index][entity_in_company_index],
                chaos_corruption_level: veh_chaos[company_index][entity_in_company_index],
                pilots: veh_pilots[company_index][entity_in_company_index], // TODO this one looks not fully implemented
            });
        }

        if (company_index == 1 and entity_in_company_index == 1) {
            // At this point all possible vehicles have been checked
            is_iteration_finished = true;
        }

        if (iteration >= safety_threshold) {
            debugl("obj_ini.Serialize(): serializing Vehicles took too long, cancelling...");
            is_iteration_finished = true;
        }

    }

    // Marines

    company_index = 100;
    entity_in_company_index = 1;

    // HQ Marines??
    for (entity_in_company_index = 1; entity_in_company_index <= 30; entity_in_company_index++) {
        if (role[company_index][entity_in_company_index] == "") then continue;

        array_push(_ini_data.marines,{
            company_index: company_index,
            entity_in_company_index: entity_in_company_index,
            race: race[company_index][entity_in_company_index],
            name: name[company_index][entity_in_company_index],
            role: role[company_index][entity_in_company_index],
            weapon_1: wep1[company_index][entity_in_company_index],
            weapon_2: wep2[company_index][entity_in_company_index],
            armour: armour[company_index][entity_in_company_index],
            gear: gear[company_index][entity_in_company_index],
            mobility_item: mobi[company_index][entity_in_company_index],
        });
    }

    // Company Marines?
    for (company_index = 0; company_index <= 10; company_index++) {
        for (entity_in_company_index = 0; entity_in_company_index <= 500; entity_in_company_index++) {

            if (name[company_index][entity_in_company_index] == "") then continue;

            array_push(_ini_data.marines,{
                company_index: company_index,
                entity_in_company_index: entity_in_company_index,
                race: race[company_index][entity_in_company_index],
                location: loc[company_index][entity_in_company_index],
                name: name[company_index][entity_in_company_index],
                role: role[company_index][entity_in_company_index],
                lid: lid[company_index][entity_in_company_index], // TODO Got no idea what this does
                bio: bio[company_index][entity_in_company_index], // TODO Got no idea what this does
                wid: wid[company_index][entity_in_company_index], // TODO Got no idea what this does
                weapon_1: wep1[company_index][entity_in_company_index],
                weapon_2: wep2[company_index][entity_in_company_index],
                armour: armour[company_index][entity_in_company_index],
                gear: gear[company_index][entity_in_company_index],
                mobility_item: mobi[company_index][entity_in_company_index],
                hp: TTRPG[company_index][entity_in_company_index].hp(),
                chaos_corruption_level: chaos[company_index][entity_in_company_index],
                experience: experience[company_index][entity_in_company_index],
                age: age[company_index][entity_in_company_index],
                is_special: spe[company_index][entity_in_company_index], // TODO Got no idea what this does
                god: god[company_index][entity_in_company_index], // TODO Got no idea what this does
            });

            if (is_struct(TTRPG[company_index][entity_in_company_index])) {
                array_last(_ini_data.marines).ttrpg_stats = TTRPG[company_index][entity_in_company_index];
            } else {
                debugl($"obj_ini.Serialize(): Marine [{company_index}][{entity_in_company_index}] has no TTRPG_stats struct, creating blank...");
                array_last(_ini_data.marines).ttrpg_stats = new TTRPG_stats("chapter", company_index, entity_in_company_index, "blank");
            }
        }
    }

    // Squads

    var squad_array_length = array_length(squads);
    if (squad_array_length > 0) {
        for (var i = 0; i < squad_array_length; i++) {
            array_push(_ini_data.squads,squads[i].serialize());
        }
    }

    // TODO what are these 2 loops supposed to represent??

    company_index = 100;
    entity_in_company_index = 0;

    for (entity_in_company_index = 0; entity_in_company_index <= 20; entity_in_company_index++) {

        if (role[company_index][entity_in_company_index] == "") then continue;

        array_push(_ini_data.marines,{
            company_index: company_index,
            entity_in_company_index: entity_in_company_index,
            role: role[company_index][entity_in_company_index],
            weapon_1: wep1[company_index][entity_in_company_index],
            weapon_2: wep2[company_index][entity_in_company_index],
            armour: armour[company_index][entity_in_company_index],
            gear: gear[company_index][entity_in_company_index],
            mobility_item: mobi[company_index][entity_in_company_index],
        });
    }

    company_index = 102;
    entity_in_company_index = 0;

    for (entity_in_company_index = 0; entity_in_company_index <= 20; entity_in_company_index++) {

        if (role[company_index][entity_in_company_index] == "") then continue;

        array_push(_ini_data.marines,{
            company_index: company_index,
            entity_in_company_index: entity_in_company_index,
            role: role[company_index][entity_in_company_index],
            weapon_1: wep1[company_index][entity_in_company_index],
            weapon_2: wep2[company_index][entity_in_company_index],
            armour: armour[company_index][entity_in_company_index],
            gear: gear[company_index][entity_in_company_index],
            mobility_item: mobi[company_index][entity_in_company_index],
        });
    }

    return _ini_data;
}

#endregion serialization