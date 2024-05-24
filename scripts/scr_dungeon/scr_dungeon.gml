// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function unit_map_sprite() constructor{
	is_walking = true;
	walking_no=0;
	walk_sprite = spr_mar_walk_body1;
	walk_legs = spr_mar_walk_legs1
	current_x=0;
	current_y=0;
	static draw = function(draw_x, draw_y){
		var xx=draw_x+current_x;
		var yy = current_y +draw_y;
		draw_sprite_ext(walk_sprite, floor(walking_no), xx, yy, 2, 2, 0, c_white, 1);
		draw_sprite_ext(walk_legs,floor(walking_no), xx, yy, 2, 2, 0, c_white, 1);
		if (is_walking){
			walking_no +=0.25;
			if (walking_no==17) then walking_no=0;
		}
	}
	static stop_walking = function(){
		is_walking=false;
		walking_no=0;
	}
}

function unit_dungeon_member(unit) constructor{
	struct = unit;
	actions = 3;
    action_able = true;
    unit_image = unit.draw_unit_image();

    static dungeon_data_panel = function(xx,yy,scale_x=(166/161), scale_y = (271/198)/2){	
    	draw_set_color(c_black);				
    	var unit = struct;
		draw_sprite_ext(spr_new_banner, 0, xx, yy, scale_x, scale_y, 0, c_white, 1);
		draw_set_color(c_green);
		health_bar = 136*(unit.hp()/unit.max_health())+15;
		draw_rectangle(xx+15,yy+15, xx+health_bar, yy+23,0)
		draw_set_color(c_black);
		draw_rectangle(xx+15,yy+15, xx+151, yy+23,1)
		draw_set_color(c_blue);
		for (var a=0;a<actions;a++){
			draw_circle(xx+40 + (a*30), yy+55, 10, 0);
		}
	}
}

function dungeon_struct() constructor{
	unit_data_slate = new data_slate();
	unit_data_slate.individual_view_sequence = 0;
	unit_data_slate.individual_display=-1;
	map_data_slate = new data_slate();
	decision_data_slate = new data_slate();
	dungeon = new dungeon_map_maker();
	enter_sequence_completed=false;
	mission_objectives = [{
		title:"Complete Dungeon", 
		finished:false
	}]
	units_set=false;
	obs_calcs=false;
	members=[];
	mission_log = [];
	current_view = "unit";
	selected_unit = "none";
	action_unit = -1;
	loot = {
		"req" : 0,
	}

	static attempt_solution = function (){
		if (dungeon.solution>-1 && !is_string(selected_unit)){
			var test;
			var mem = members[selected_unit];
			var ob = dungeon.current_obstacle.base_data;
			var solution = ob.solutions[dungeon.solution];
			for (var t = 0; t<array_length(solution.tests);t++){
				test = solution.tests;
				if (struct_exists(test, "modifiers")){
					if (struct_exists(test.modifiers,"weapon")){
						var weapon_mods = test.modifiers.weapon
						if (struct_exists(weapon_mods, "tag")){
							//for (var s=0;s)
						}
					}
				}
			}
		}
	}

	static add_mission_log = function(){
	}
	static calculate_solution_members = function(){
		var mem, unit;
		var obsticle = dungeon.current_obstacle.base_data;
		var solution = obsticle.solutions[dungeon.solution];
		for (var i=0;i<array_length(members);i++){
			mem = members[i];
			mem.action_able = (mem.actions!=0 && mem.struct.hp()>0)
		}
		if (struct_exists(solution, "requirements")){
			var requirements = solution.requirements;
			if (struct_exists(requirements,"weapon")){
				var needed_weapon = requirements.weapon;
				if (struct_exists(needed_weapon, "name")){
					for (var i=0;i<array_length(members);i++){
						if (!members[i].action_able) then continue;
						mem = members[i];
						unit = mem.struct;
						if (!array_contains(needed_weapon.name, unit.weapon_one())&&!array_contains(needed_weapon.name, unit.weapon_two())){
							mem.action_able=false;
						}
					}
				}
				if (struct_exists(needed_weapon, "tag")){
					var _wep1;
					var _wep2;
					for (var i=0;i<array_length(members);i++){
						if (!members[i].action_able) then continue;
						mem = members[i];
						unit = mem.struct;
						_wep1 = unit.get_weapon_one_data();
						_wep2 = unit.get_weapon_two_data();
						if (is_struct(_wep1)){
							if (_wep1.has_tags(needed_weapon.tag)){
								continue;
							}
						}
						if (is_struct(_wep2)){
							if (_wep2.has_tags(needed_weapon.tag)){
								continue;
							}
						}
						mem.action_able=false;
					}
				}
				if (struct_exists(needed_weapon, "tags")){
					var _wep1;
					var _wep2;
					for (var i=0;i<array_length(members);i++){
						if (!members[i].action_able) then continue;
						mem = members[i];
						unit = mem.struct;
						_wep1 = unit.get_weapon_one_data();
						_wep2 = unit.get_weapon_two_data();
						if (is_struct(_wep1)){
							if (_wep1.has_tags_all(needed_weapon.tags)){
								continue;
							}
						}
						if (is_struct(_wep2)){
							if (_wep2.has_tags_all(needed_weapon.tags)){
								continue;
							}
						}
					}					
				}
			}
		}

	}
	unit_data_slate.inside_method = function(){
		selected_unit = "none";
		var unit, mem;
		var xx =unit_data_slate.XX;
		var yy =unit_data_slate.YY;	
		var x_depth=0;
		var y_depth=0;
		var _draw_colour = c_red;
		var mis_obj_cords = draw_unit_buttons([xx+70,yy+70], "Mission Objectives",[1.5,1.5],c_red);
		if (point_and_click(mis_obj_cords)){
			current_view="mission";
		}
		var mission_log_chords = draw_unit_buttons([mis_obj_cords[2]+20,yy+70], "Mission Log",[1.5,1.5],c_red);
		if (point_and_click(mission_log_chords)){
			current_view="log";
		}
		_draw_colour = current_view == "unit"?c_gray:c_red;
		var unit_overviews = draw_unit_buttons([mission_log_chords[2]+20,yy+70], "Unit Overviews",[1.5,1.5],_draw_colour);
		var start_y = unit_overviews[3]+10;
		var start_x =mis_obj_cords[0]+50;
		var health_bar;
		if (current_view=="unit"){
			if (unit_data_slate.individual_display>-1 && (unit_data_slate.individual_view_sequence<21 || unit_data_slate.individual_view_sequence>21)) then unit_data_slate.individual_view_sequence++;
			if (unit_data_slate.individual_view_sequence<11 || unit_data_slate.individual_view_sequence>32){
				var unit_draw = [0,0];
				var banner_x_scale = (166/161);
				var banner_y_scale = (271/198)/2;
				for (var i=0;i<array_length(members);i++){
					draw_set_alpha(1);
					mem = members[i];
					unit = mem.struct;
					unit_draw=[start_x+(170*x_depth),start_y+(250*y_depth)];
					mem.unit_draw=[start_x+(170*x_depth),start_y+(250*y_depth)];
					mem.unit_image.draw(unit_draw[0],unit_draw[1], true);
					//if (selected_unit>-1 && selected_unit != i)
					if (point_in_rectangle(mouse_x, mouse_y, unit_draw[0], unit_draw[1]+21, unit_draw[0]+166,unit_draw[1]+271)){										
						selected_unit=i;
						//unit_data_slate.individual_view_sequence++;
						if (mouse_check_button(mb_left) && unit_data_slate.individual_display ==-1){
							unit_data_slate.individual_display = i;
							unit_data_slate.individual_view_sequence = 0;
							if (dungeon.solution>-1 && mem.action_able){
								action_unit = i;
							}
						}
					};
					x_depth++;
					if (x_depth==4){
						x_depth=0;
						y_depth++;
					}				
				}
				draw_set_color(c_black);
				draw_rectangle(start_x,start_y,start_x+(170*4), start_y+21, 0);
				x_depth=0;
				y_depth=0;
				for (var i=0;i<array_length(members);i++){
					mem = members[i];
					unit = members[i].struct;
					unit_draw=[start_x+(170*x_depth),start_y+(250*y_depth)];
					mem.unit_draw = unit_draw;
					mem.dungeon_data_panel(unit_draw[0], unit_draw[1]+135);
					draw_set_color(c_gray);
					x_depth++;
					if (x_depth==4){
						x_depth=0;
						y_depth++;
					}
					if (dungeon.solution>-1){
						if(!members[i].action_able){
							draw_set_alpha(0.7)
							draw_rectangle(unit_draw[0], unit_draw[1]+21, unit_draw[0]+166,unit_draw[1]+271, 0);
						}
					}
					draw_set_alpha(1)	
					if (unit_data_slate.individual_display>-1 && unit_data_slate.individual_view_sequence<11){
						if (unit_data_slate.individual_display!=i){
							draw_set_color(c_black);
							draw_rectangle(unit_draw[0], unit_draw[1]+21, unit_draw[0]+166,unit_draw[1]+21 + (25*unit_data_slate.individual_view_sequence), 0);
						}					
					} else if (unit_data_slate.individual_view_sequence>32){
						if (unit_data_slate.individual_display!=i){
							draw_set_color(c_black);
							draw_rectangle(unit_draw[0], unit_draw[1]+21, unit_draw[0]+166,unit_draw[1]+21 + (25*(10-(unit_data_slate.individual_view_sequence-32))), 0);
						}						
					}
					if (selected_unit == i && unit_data_slate.individual_view_sequence<11){
						draw_set_color(c_yellow);
						draw_set_alpha(1);
						draw_rectangle(unit_draw[0], unit_draw[1]+21, unit_draw[0]+166, unit_draw[1]+271, 1);
						draw_set_alpha(0.75);
						draw_rectangle(unit_draw[0]-1, unit_draw[1]+20, unit_draw[0]+167, unit_draw[1]+272, 1);
						draw_set_alpha(0.5);
						draw_rectangle(unit_draw[0]-2, unit_draw[1]+19, unit_draw[0]+168, unit_draw[1]+273, 1);
						draw_set_alpha(0.25);
						draw_rectangle(unit_draw[0]-3, unit_draw[1]+18, unit_draw[0]+169, unit_draw[1]+274, 1);
						draw_set_alpha(1);
						draw_set_color(c_black);
						if (unit_data_slate.individual_view_sequence == 10){
							mem = members[unit_data_slate.individual_display];
							mem.current_draw_loc = [unit_draw[0]-xx,unit_draw[1]-yy];
							mem.return_point  = [unit_draw[0]-xx,unit_draw[1]-yy];
							var targ_x = xx+(unit_data_slate.width/2)-133;
							var targ_y = start_y+21;
							var increment_x = (targ_x-unit_draw[0])/10;
							var increment_y = (targ_y-unit_draw[1])/10;
							mem.draw_increments = [increment_x,increment_y];
						}
					}
					if (unit_data_slate.individual_view_sequence==42){
						unit_data_slate.individual_view_sequence=0;
						unit_data_slate.individual_display=-1;
					}		
				}
			} else if (unit_data_slate.individual_view_sequence>10 && unit_data_slate.individual_view_sequence<=20){
				unit = members[unit_data_slate.individual_display].struct;
				mem =  members[unit_data_slate.individual_display];
				mem.current_draw_loc[0] += mem.draw_increments[0];
				mem.current_draw_loc[1] += mem.draw_increments[1];
				unit.unit_image.draw(mem.current_draw_loc[0], mem.current_draw_loc[1], true);
				var seq = (unit_data_slate.individual_view_sequence-10)/10;
				mem.dungeon_data_panel(mem.current_draw_loc[0]+xx+(166*(seq)), mem.current_draw_loc[1]+yy+(135));		
			}else if (unit_data_slate.individual_view_sequence>22 && unit_data_slate.individual_view_sequence<=32){
				unit = members[unit_data_slate.individual_display].struct;
				mem =  members[unit_data_slate.individual_display];
				mem.current_draw_loc[0] -= mem.draw_increments[0];
				mem.current_draw_loc[1] -= mem.draw_increments[1];
				unit.unit_image.draw(mem.current_draw_loc[0], mem.current_draw_loc[1], true);
				var seq = (10-(unit_data_slate.individual_view_sequence-22))/10;
				mem.dungeon_data_panel(mem.current_draw_loc[0]+xx+(166*(seq)), mem.current_draw_loc[1]+yy+(135));						
			}else {
				unit = members[unit_data_slate.individual_display].struct;
				mem =  members[unit_data_slate.individual_display];
				draw_set_color(c_gray);
				unit.unit_image.draw(mem.current_draw_loc[0], mem.current_draw_loc[1], true);
				mem.dungeon_data_panel(mem.current_draw_loc[0]+xx+(166), mem.current_draw_loc[1]+yy+(135));
		        draw_set_color(c_gray);
		        draw_set_halign(fa_center);
		        draw_set_font(fnt_40k_14b);
		        draw_text_transformed(xx+mem.current_draw_loc[0]+100,mem.current_draw_loc[1]+yy-30,string_hash_to_newline(unit.name_role()),1.5,1.5,0);
		        draw_set_halign(fa_left);
				if (point_and_click(draw_unit_buttons([xx+50,mem.current_draw_loc[1]+yy-30],"<----",[1.5,1.5],c_red))){
					unit_data_slate.individual_view_sequence = 22;
				}		        				
				unit.stat_display(false,[xx+130,yy+430]);
			}
		} else if (current_view="mission"){

		}
	}


	map_data_slate.inside_method = function(){
		var xx =map_data_slate.XX;
		var yy =map_data_slate.YY;
		if (enter_sequence_completed || dungeon.solution>-1){		
			if (!is_string(selected_unit)){
				//members[selected_unit].struct.stat_display(true, [xx+20, yy+10]);
				var mem = members[selected_unit];
				var unit = mem.struct;
				draw_set_color(c_red);
				draw_set_halign(fa_center);
				draw_text_transformed(xx+(map_data_slate.width/2), yy+40, "Relevant Data", 2, 2, 0);
				var ob = dungeon.current_obstacle.base_data;
				var stat_data = stat_type_data();
				for (var t=0; t<array_length(ob.tests);t++){
					//if 
				}

			}
		} else {
			var cur_fig;
			if (!units_set){
				unit_count = array_length(members);
				var x_scatter = 0;
				var y_scatter = 0;
				for (var i=0; i <unit_count;i++){
					x_scatter++;
					members[i].map_figure = new unit_map_sprite();
					cur_fig = members[i].map_figure;
					cur_fig.current_x =  70 + (x_scatter*40);
					cur_fig.current_y = 150+(50*y_scatter);
					cur_fig.is_walking =true;
					cur_fig.walking_no = irandom(16);
					if (x_scatter == 4){
						x_scatter = 0.5;
						y_scatter++;
					} else if (x_scatter == 4.5){
						x_scatter = 0;
						y_scatter++;
					}
				}
				units_set=true;
			}
			for (var i=0; i <unit_count;i++){
				cur_fig = members[i].map_figure;
				members[i].struct.set_unit_shader();
				cur_fig.draw(xx,yy);
				shader_reset();
			}
		}

	}
	decision_data_slate.inside_method = function(){
		if (is_struct(dungeon.current_obstacle)){
			xx=decision_data_slate.XX;
			yy = decision_data_slate.YY;
			var ob = dungeon.current_obstacle.base_data;
			if (!dungeon.current_obstacle.overcome){
				draw_set_halign(fa_center);
				draw_text_ext(xx+(decision_data_slate.width/2), yy+40, ob.description, -1, decision_data_slate.width-50);
				solutions_found = 0;
				y_tier=0;
				if (obs_calcs = false){
					for (var i=0;i<array_length(ob.solutions);i++){
						ob.solutions[i].valid=true; 
					}
				}
				if (dungeon.solution==-1){
					var solution_coords;
					for (var i=0;i<array_length(ob.solutions);i++){
						if (ob.solutions[i].valid){
							if (struct_exists(ob.solutions[i],"stat_icon")){
								draw_col = stat_type_data()[ob.solutions[i].stat_icon][1];
							}
							solution_coords = draw_unit_buttons([xx+90+(200*solutions_found), yy+100+(50*y_tier)],ob.solutions[i].name,[1.5,1.5],draw_col);
							if (struct_exists(ob.solutions[i],"stat_icon")){
								draw_set_color(c_gray);
								draw_rectangle(solution_coords[0]-34, solution_coords[1], solution_coords[0], solution_coords[3],0);
								draw_rectangle(solution_coords[2], solution_coords[1], solution_coords[2]+34, solution_coords[3],0);
								draw_stat_icons(ob.solutions[i].stat_icon, solution_coords[0]-33, solution_coords[1]+1);
								draw_stat_icons(ob.solutions[i].stat_icon, solution_coords[2]+1, solution_coords[1]+1);
							}
							if (point_and_click(solution_coords)){
								dungeon.solution = i;
								calculate_solution_members();
							}
							solutions_found++;
							if (solutions_found==3){
								solutions_found=0;
								y_tier++;
							}
						}
					}
				} else {
					var solution = ob.solutions[dungeon.solution];
					draw_text_ext(xx+(decision_data_slate.width/2), yy+70, $"Who will attempt to {solution.description}", -1, decision_data_slate.width-50);
					if(point_and_click(draw_unit_buttons([xx+(decision_data_slate.width/2)-(string_width("Cancel")*1.5), yy+300],"Cancel",[1.5,1.5],c_red))){
						dungeon.solution=-1;
					}					
					if (unit_data_slate.individual_display>-1){
						if (members[unit_data_slate.individual_display].action_able){
							var confirm_coords = draw_unit_buttons([xx+(decision_data_slate.width/2)-(string_width("Confirm Unit")*1.5), yy+150],"Confirm Unit",[1.5,1.5],c_green);
							if(point_and_click(confirm_coords)){
								attempt_solution();
							}
						}
					}
				}
			}
		}
	}
	static draw = function(){
		var xx =__view_get( e__VW.XView, 0 );
		var yy =__view_get( e__VW.YView, 0 );
		unit_data_slate.draw(xx,yy,1.08,1.07);
		map_data_slate.draw(xx+unit_data_slate.width-12,yy,0.81, 0.63);
		decision_data_slate.draw(xx+unit_data_slate.width-12, yy+map_data_slate.height-2,0.81, 0.45);
	}
}
global.obstacles = {
	name : "Blast Door",
	description : "a sturdy blast door stands in the way of your progress",
	solutions : [
		{
			name :"bypass",
			tests :[
				{
					attribute :eStats.technology,
					base : 50,
					modfiers : {
						equipment : [["servo harness", 10]]
					}
				}
			],
			description : "attempt to bypass the door at the control panel",
			stat_icon : eStats.technology
		},
		{
			name :"divine",
			requirements : {
				class:"psyker", 
				skill:"divination",
			},
			tests :[
				{
					attribute :eStats.intelligence,
					base : 40,
					modfiers : {
					}
				}
			],
			description : "attempt to divine the door code",
			stat_icon : eStats.intelligence
		},
		{
			name :"Melta Blast",
			requirements : {
				weapon:{
					tag:["melta"]
				},
			},
			tests :[
				/*{
					attribute : "luck",
					base : 10,
				},*/
				{
					attribute :eStats.ballistic_skill,
					base : 40,
					modifiers : {
						weapon : {
							tag : [["heavy_weapon",20],["pistol",-20]]
						}
					}					
				}				
			],
			description : "Melt the Door with a melta blast",
			stat_icon : eStats.ballistic_skill
		},
		{
			name :"Find Way Round",
			//requirements : ["melta"],
			tests :[
				 /*{
				 	attribute : "luck",
					base : 10,
				},*/
				{
					attribute : eStats.wisdom,
					base : -40,					
				}				
			],
			result_chart : [
				[-60, function(){
					var mem = members[action_unit];
					mem.actions = mem.actions-2<0?mem.actions=0:mem.actions=mem.actions-2;
					var unit = meme.struct;
					var result_text = $"{unit.name_role()} Is able to find what they think is a way around in the form of a small hidden chamber, however upon entering the side chamber another door seals shut leaving them trpped in a dissused control room. It takes several minutes from {unit.name()} to escape by eventually battering the door down";
					var result effects = "{unit.name_role()} looses two action points";
				}]
			],
			classs : ["perception"],
			description : "Try find another way through",
			stat_icon : eStats.wisdom
		}			
	]
}
function dungeon_map_maker() constructor{
	var i;
	rooms = {
		room_type : "enterance",
		obstacles : new obstacle(global.obstacles)
	}
	current_room = rooms;
	current_obstacle = current_room.obstacles;
	solution=-1;
	viable_members=[];
}
function obstacle(bd) constructor{
	base_data = bd;
	overcome=false;
}


/*{
    name: "Large Crevasse",
    description: "A gaping chasm stretches before you, blocking your path.",
    solutions: [
        {
            name: "Rope Bridge",
            requirements: {
                equipment: ["rope"]
            },
            tests: [
                {
                    attribute: "dexterity",
                    base: 50,
                    modifiers: {
                        equipment: [["climbing harness", 10]]
                    }
                }
            ],
            description: "Attempt to traverse the crevasse by crossing a makeshift rope bridge.",
            stat_icon: "dexterity"
        },
        {
            name: "Leap of Faith",
            tests: [
                {
                    attribute: "strength",
                    base: 40,
                    modifiers: {
                        equipment: [["adrenaline injection", 15]]
                    }
                }
            ],
            description: "Take a daring leap across the crevasse, relying on your strength and agility.",
            stat_icon: "strength"
        },
        {
            name: "Survey",
            requirements: {
                skill: "surveying"
            },
            tests: [
                {
                    attribute: "intelligence",
                    base: 60,
                    modifiers: {}
                }
            ],
            description: "Carefully study the crevasse to find a safe path around or across.",
            stat_icon: "intelligence"
        },
        {
            name: "Create Bridge",
            requirements: {
                skill: "engineering"
            },
            tests: [
                {
                    attribute: "technology",
                    base: 50,
                    modifiers: {}
                }
            ],
            description: "Use engineering skills to construct a sturdy bridge over the crevasse.",
            stat_icon: "technology"
        }
    ]
}


{
    name: "Sentry Gun",
    description: "A menacing sentry gun guards the area, its barrels trained on any intruders.",
    solutions: [
        {
            name: "Disable with Hacking",
            requirements: {
                skill: "hacking"
            },
            tests: [
                {
                    attribute: "technology",
                    base: 60,
                    modifiers: {}
                }
            ],
            description: "Attempt to hack into the sentry gun's control system and disable it remotely.",
            stat_icon: "technology"
        },
        {
            name: "Stealth Approach",
            tests: [
                {
                    attribute: "dexterity",
                    base: 50,
                    modifiers: {
                        equipment: [["stealth suit", 10]]
                    }
                }
            ],
            description: "Sneak past the sentry gun using stealth and agility.",
            stat_icon: "dexterity"
        },
        {
            name: "Distract with Decoy",
            requirements: {
                equipment: ["decoy device"]
            },
            tests: [
                {
                    attribute: "charisma",
                    base: 40,
                    modifiers: {}
                }
            ],
            description: "Deploy a decoy device to draw the sentry gun's attention away from you.",
            stat_icon: "charisma"
        },
        {
            name: "Disarm Manually",
            tests: [
                {
                    attribute: "intelligence",
                    base: 50,
                    modifiers: {
                        equipment: [["toolkit", 10]]
                    }
                }
            ],
            description: "Use your intelligence and tools to disarm the sentry gun manually.",
            stat_icon: "intelligence"
        }
    ]
}

{
    name: "Hidden Passage",
    description: "A secret passage lies concealed somewhere in the vicinity.",
    solutions: [
        {
            name: "Search Intensively",
            tests: [
                {
                    attribute: "intelligence",
                    base: 50,
                    modifiers: {}
                },
                {
                    attribute: "wisdom",
                    base: 40,
                    modifiers: {}
                }
            ],
            description: "Conduct a thorough search, relying on intelligence and wisdom to uncover the hidden passage.",
            stat_icon: "intelligence"
        },
        {
            name: "Listen Carefully",
            tests: [
                {
                    attribute: "wisdom",
                    base: 45,
                    modifiers: {
                        equipment: [["listening device", 10]]
                    }
                },
                {
                    attribute: "luck",
                    base: 50,
                    modifiers: {}
                }
            ],
            description: "Listen attentively for any subtle clues or sounds that may reveal the location of the hidden passage.",
            stat_icon: "wisdom"
        },
        {
            name: "Use Historical Knowledge",
            requirements: {
                skill: "history"
            },
            tests: [
                {
                    attribute: "intelligence",
                    base: 55,
                    modifiers: {}
                }
            ],
            description: "Apply knowledge of historical architecture or secret passages to deduce the likely location of the hidden passage.",
            stat_icon: "intelligence"
        },
        {
            name: "Feel for Drafts",
            tests: [
                {
                    attribute: "dexterity",
                    base: 40,
                    modifiers: {}
                },
                {
                    attribute: "constitution",
                    base: 45,
                    modifiers: {
                        equipment: [["torch", 10]]
                    }
                }
            ],
            description: "Sensitively feel for air currents or drafts that may indicate the presence of a hidden passage.",
            stat_icon: "dexterity"
        }
    ]
}
{
    name: "Sheer Cliff",
    description: "A towering cliff looms before you, its sheer face seemingly insurmountable.",
    solutions: [
        {
            name: "Power Climb",
            requirements: {
                equipment: ["jump pack"]
            },
            tests: [
                {
                    attribute: "strength",
                    base: 60,
                    modifiers: {
                        equipment: [["power armor", 20]]
                    }
                },
                {
                    attribute: "dexterity",
                    base: 50,
                    modifiers: {}
                }
            ],
            description: "Utilize the strength of your power armor and the agility of your jump pack to ascend the cliff with powerful leaps.",
            stat_icon: "strength"
        },
        {
            name: "Tactical Ascend",
            tests: [
                {
                    attribute: "intelligence",
                    base: 55,
                    modifiers: {
                        equipment: [["grapnel launcher", 15]]
                    }
                }
            ],
            description: "Strategically plan your ascent using a grapnel launcher to secure handholds and footholds along the cliff face.",
            stat_icon: "intelligence"
        },
        {
            name: "Mountain Climb",
            requirements: {
                skill: "climbing"
            },
            tests: [
                {
                    attribute: "dexterity",
                    base: 50,
                    modifiers: {}
                },
                {
                    attribute: "constitution",
                    base: 45,
                    modifiers: {
                        equipment: [["climbing harness", 10]]
                    }
                }
            ],
            description: "Apply your skill in climbing along with suitable equipment to scale the cliff using traditional climbing techniques.",
            stat_icon: "dexterity"
        },
        {
            name: "Scout and Scale",
            tests: [
                {
                    attribute: "perception",
                    base: 45,
                    modifiers: {
                        equipment: [["magnoculars", 10]]
                    }
                },
                {
                    attribute: "luck",
                    base: 50,
                    modifiers: {}
                }
            ],
            description: "Scout the cliff for potential weaknesses or pathways and then scale it using quick reactions and luck.",
            stat_icon: "perception"
        }
    ]
}

{
    name: "Hidden Tyranid",
    description: "A deadly Tyranid lurks in the shadows, ready to strike at any moment.",
    solutions: [
        {
            name: "Heightened Awareness",
            tests: [
                {
                    attribute: "perception",
                    base: 55,
                    modifiers: {
                        equipment: [["augmented optics", 15]]
                    }
                },
                {
                    attribute: "intelligence",
                    base: 50,
                    modifiers: {}
                }
            ],
            description: "Maintain heightened awareness and use advanced optics to spot any subtle movements or signs of the hidden Tyranid.",
            stat_icon: "perception"
        },
        {
            name: "Scout and Recon",
            requirements: {
                skill: "scouting"
            },
            tests: [
                {
                    attribute: "perception",
                    base: 50,
                    modifiers: {}
                },
                {
                    attribute: "dexterity",
                    base: 45,
                    modifiers: {
                        equipment: [["camo cloak", 10]]
                    }
                }
            ],
            description: "Send out scouts to recon the area, utilizing camouflage and keen perception to detect the hidden Tyranid.",
            stat_icon: "perception"
        },
        {
            name: "Bait and Ambush",
            tests: [
                {
                    attribute: "charisma",
                    base: 40,
                    modifiers: {}
                },
                {
                    attribute: "intelligence",
                    base: 55,
                    modifiers: {}
                }
            ],
            description: "Set up a bait and ambush strategy, luring out the hidden Tyranid with clever tactics and intelligence.",
            stat_icon: "charisma"
        },
        {
            name: "Biological Detection",
            requirements: {
                skill: "biology"
            },
            tests: [
                {
                    attribute: "intelligence",
                    base: 60,
                    modifiers: {}
                }
            ],
            description: "Utilize knowledge of Tyranid biology to anticipate its behavior and locate its hidden presence.",
            stat_icon: "intelligence"
        }
    ]
}*/