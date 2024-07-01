enum eTrials{
	BLOODDUEL,
	HUNTING,
	SURVIVAL,
	EXPOSURE,
	KNOWLEDGE,
	CHALLENGE,
	APPRENTICESHIP,
	num
}

function scr_trial_data(){
	var role_data = instance_exists(obj_ini)? obj_ini.role[100] : obj_creation.role[100];
	var data = [
		{
			name : "Blood Duel",
			train_time : {
				base : [24, 48],
			},
			recruit_count_modifier : {
				base : 0.3,
			},
			seed_waste : 0.1,
			long_description :$"THE BLOOD DUEL?  HAT DO I EVEN NEED TO EXPLAIN, CHAPTER MASTER?  ASPIRANTS ENTER.  NEOPHYTES LEAVE.  Those worthy of serving the Emperor are rewarded justly and those merely pretending at glory are lost in the BLOOD AND THUNDER of the dome.  Do not be alarmed at the carnage.  The Apothecarium has become quite adept at rebuilding those fit to serve.  The others are given to the {role_data[Role.TECHMARINE]}s.  The mind is a terrible thing to waste and the Emperor does hate waste.  Not every man is useful as an Astartes but every man is useful.",
		},
		{
			name : "Hunting the Hunter",
			train_time : {
				base : [72, 80],
			},
			exp_bonus : {
				base:[0,0],
				planets : {
					Ice : [7,10],
					Desert : [7,10],
					Death : [7,10]
				}
			},
			long_description :$"To be an Astartes is to be a hunter of xenos, of traitors, of heretics, and of all those that dare defy the Emperor.  What better way to test the worthiness of Aspirants than to have to them hunt the most dangerous predator to be found on their planet?  Such a task requires a combination of wits and cunning, in addition to raw martial skill.  When they have received the blessed geneseed and become full battle brothers, they will hunt across the stars with bolter and chainsword. For now, let them hunt with nothing more than a spear and their wits.",				
		},
		{
			name : "Survival eTrials",
			train_time : {
				base : [72, 80],
			},
			recruit_count_modifier : {
				base : 0.0,
				planets : {
					Ice :0.3,
					Desert : 0.3,
					Death : 0.3,
					Feudal : 0.5
				}
			},
			exp_bonus : {
				base:[0,0],
			},
			long_description :$"To become one of the Imperium’s finest warriors, the Space Marines, is the greatest glory that any human can aspire to. And is glory not worth fighting, bleeding or even dying for? It must be, for whole worlds of ice, ash and sand have buried generations of sons in pursuit of this glory and never once called the price too dear.  To ensure the necessary bloodshed, lies, paranoia and psychosis-inducing drugs have been introduced to .  This trial will seperate the weak from the strong and the chaff from the wheat.",				
		},
		{
			name : "Exposure",
			train_time : {
				base : [72, 80],
				planets : {
					Desert :[36, 60],
					Ice :[36, 60],
					Forge :[36, 60],
					Lava :[36, 60],
					Death :[36, 60],
				}
			},
			exp_bonus : {
				base:[0,0],
				planets : {
					Ice : [2,4],
					Desert : [2,4],
					Death : [2,4],
				}
			},
			long_description :$"Few worlds of the Imperium are free from the adversity of pollution or toxic waste.  Still others are bequeathed with flows of lava and choking atmosphere.  The glory of rising to astartes is only granted to those that can tackle and overcome these dangerous environments.  Aspirants are placed upon the most hellish of planet in the sector, and then expected to traverse the continent with only himself to rely upon.  Those who face the impossible without faltering and survive past the point they should have perished are recovered by {role_data[Role.APOTHECARY]}s, judged worthy of becoming a Neophyte.",						
		},
		{
			name : "Knowledge of self",
			train_time : {
				base : [90, 108],
				planets : {
					shrine :[70, 108],
				}
			},
			exp_bonus : {
				base: [15,25],
				planets : {
					Temperate : [20,35],
				}
			},
			long_description :$"An Aspirant’s spiritual and mental capability is every bit as important as his physical characteristics.  It is wise to impose Trials not upon their body, but on the mind.  Either through psychic powers, chemical agents, or endurance trials, the Aspirant’s willpower is tested.  Those unworthy do not survive the stress and trauma placed upon their hearts- only those whose minds are proven to be unbreakable are welcomed into our ranks.",							
		},
		{
			name : "Combat Challange",
			train_time : {
				base : [66, 80],
				planets : {
					shrine :[70, 108],
				}
			},
			exp_bonus : {
				base: [10,20,0.2],
			},
			long_description :$"What better gauge of an Aspirant than in a duel with our astartes?  Our brother, unarmed and unarmoured, will face against the armed challenger until one cannot continue.  It is impossible for the Aspirant to actually succeed these trials, but demonstrates how far they can possibly go, and allow us to judge him accordingly.  As with most trials the Aspirant’s life is in their own hands.  He who has failed the duel- yet proven himself worthy- is rescued from the jaws of death by {role_data[Role.APOTHECARY]} and allowed to progress to the rank of Neophyte.",				
		},
		{
			name : "Apprenticeship",
			train_time : {
				base : [120, 140],
				planets : {
					shrine :[70, 108],
				}
			},
			exp_bonus : {
				base: [35, 40],
			},
			recruit_count_modifier : {
				base : 0.0,
				planets : {
					Lava :0.3,
				}			
			},
			long_description :$"What better way to cultivate astartes than to raise them from youth?  The capable children of our recruitment targets are apprenticed to our battle brothers.  Beneath their steady guidance the Aspirants spend several years learning the art of the smith.  The most able are judged by our Chapter’s {role_data[Role.APOTHECARY]}s and {role_data[Role.CHAPLAIN]} to deem if they are compatible with gene-seed implantation.  If so, the Aspirant’s trial culminates in hunting and slaying a massive beast.  Only the brightest and bravest are added to our ranks.",									
		},						
	]
	return data;
}
function scr_compile_trial_bonus_string(trial_data){
	var bonus_string = "";
	var  train_time_string = function(tarray){
		return $"{tarray[0]/12} - {tarray[1]/12}" ;
	}
	if (struct_exists(trial_data,"train_time")){
		var train_time_data = trial_data.train_time;
		bonus_string+=$"years training : {train_time_string(train_time_data.base)}";
		if (struct_exists(train_time_data, "planets")){
			var planets = struct_get_names(train_time_data.planets);
			for (var i=0;i<array_length(planets);i++){
				bonus_string += $"   {planets[i]} : {train_time_string(train_time_data.planets[$ planets[i]])}"
			}
		}
	}
	if (struct_exists(trial_data,"recruit_count_modifier")){

	}
	return bonus_string;
}

function set_up_recruitment_view(){
	with (obj_controller){
	    menu=15;
	    onceh=1;
	    cooldown=8000;
	    click=1;
	    recruit_list_pane = new data_slate();
	    recruit_list_pane.inside_method = function(){
	    	yy+40
		    var xx=__view_get( e__VW.XView, 0 )+0;
		    var yy=__view_get( e__VW.YView, 0 )+0;
		    draw_set_font(fnt_40k_30b);
		    draw_set_halign(fa_center);
		    draw_text_transformed(xx + 1262, yy + 70, "Neophytes", 0.6, 0.6, 0);

		    if (recruit_name[0] != "") {
		        draw_set_font(fnt_40k_14);
		        draw_set_halign(fa_left);

		        var t_eta = 0;
		        for (var qp = 0, n = 0; qp < array_length(recruit_name) && n < 36; qp++) {
		            if (recruit_name[qp] != "") {
		                n++;
		                draw_rectangle(xx + 947, yy + 100 + ((n - 1) * 20), xx + 1577, yy + 100 + (n * 20), 1);
		                draw_text(xx + 950, yy + 100 + ((n - 1) * 20), $"Neophyte {recruit_name[qp]}");
		                draw_text(xx + 1200, yy + 100 + ((n - 1) * 20), $"Starting EXP: {recruit_exp[qp]}");
		                draw_text(xx + 1500, yy + 100 + ((n - 1) * 20),$"ETA: {recruit_training[qp] + recruit_distance[qp]}");
		            }
		        }
		    }	
	    }	    
	    left_panel = new data_slate();
	    middle_panel = new data_slate();
	}
}


function scr_draw_recruit_advisor(){
   var blurp, eta, va;
    var romanNumerals;
    romanNumerals = scr_roman_numerals();
    var recruitment_rates = [
        "sluggish",
        "slow",
        "moderate",
        "fast",
        "frenetic",
        "hereticly fast"
    ];

    var recruitment_pace = [
        " is currently halted.",
        " is advancing sluggishly.",
        " is advancing slowly.",
        " is advancing moderately fast.",
        " is advancing fast.",
        " is advancing frenetically.",
        " is advancing as fast as possible."
    ];

    var recruitement_rate = [
        "HALTED",
        "SLUGGISH",
        "SLOW",
        "MODERATE",
        "FAST",
        "FRENETIC",
        "MAXIMUM",
    ];
    var xx=__view_get( e__VW.XView, 0 )+0;
    var yy=__view_get( e__VW.YView, 0 )+0;
    blurp = "";
    eta = 0;
    draw_sprite(spr_rock_bg, 0, xx, yy);
    draw_set_alpha(0.75);
    draw_set_color(0);
    draw_rectangle(xx + 326 + 16, yy + 66, xx + 887 + 16, yy + 818, 0);
    draw_set_alpha(1);
    draw_set_color(c_gray);
    draw_rectangle(xx + 326 + 16, yy + 66, xx + 887 + 16, yy + 818, 1);
    draw_line(xx + 326 + 16, yy + 480, xx + 887 + 16, yy + 480);
    draw_set_alpha(0.75);
    draw_set_color(0);
    draw_rectangle(xx + 945, yy + 66, xx + 1580, yy + 818, 0);
    draw_set_alpha(1);
    draw_set_color(c_gray);
    draw_rectangle(xx + 945, yy + 66, xx + 1580, yy + 818, 1);

    if (menu_adept = 0) {
        // draw_sprite(spr_advisors,5,xx+16,yy+43);
        scr_image("advisor", 5, xx + 16, yy + 43, 310, 828);
        draw_set_halign(fa_left);
        draw_set_color(c_gray);
        draw_set_font(fnt_40k_30b);
        draw_text_transformed(xx + 336 + 16, yy + 66, string_hash_to_newline("World " + string(obj_ini.recruiting_name)), 1, 1, 0);
        draw_text_transformed(xx + 336 + 16, yy + 100, string_hash_to_newline("First Sergeant " + string(recruiter_name)), 0.6, 0.6, 0);
        draw_set_font(fnt_40k_14);
    }
    if (menu_adept = 1) {
        // draw_sprite(spr_advisors,0,xx+16,yy+43);
        scr_image("advisor", 0, xx + 16, yy + 43, 310, 828);
        draw_set_halign(fa_left);
        draw_set_color(c_gray);
        draw_set_font(fnt_40k_30b);
        draw_text_transformed(xx + 336 + 16, yy + 40, string_hash_to_newline("World " + string(obj_ini.recruiting_name)), 1, 1, 0);
        draw_text_transformed(xx + 336 + 16, yy + 100, string_hash_to_newline("Adept " + string(obj_controller.adept_name)), 0.6, 0.6, 0);
        draw_set_font(fnt_40k_14);
    }

    if (menu_adept = 0) then blurp = "Hail " + string(obj_ini.name[0, 1]) + "!  You asked for a report?##";

    if (obj_ini.doomed = 0) {
        if (recruits <= 0) and(marines >= 1000) then blurp += "Our Chapter currently has no Neophytes- we are at maximum strength and do not require more marines.  ";
        if (recruits <= 0) and(marines < 1000) and(recruiting = 0) then blurp += "Our Chapter currently has no Neophytes.  Without training more our chapter is doomed to a slow death.";
        if (recruits <= 0) and(marines < 1000) and(recruiting > 0) then blurp += "Our Chapter currently has no Neophytes.  We are doing our utmost best to find suitable recruits.";
        if (recruits = 1) then blurp += $"Our Chapter currently has one recruit being trained.  The Neophyte's name is {recruit_name[0]} and they are scheduled to become a battle brother in " + string(recruit_training[0] + recruit_distance[0]) + " months' time.  ";
        if (recruits > 1) then blurp += $"Our Chapter currently has {recruits} recruits being trained.  {recruit_name[0]} is the next scheduled Neophyte to become a battle brother in " + string(recruit_training[0] + recruit_distance[0]) + " months' time.  ";
        if (gene_seed > 0) {
            if (recruiting = 0) and(marines >= 1000) then blurp += "##Recruitment" + recruitment_rates[recruiting] + ".  You must only give me the word and I can begin further increasing our numbers... though this would violate the Codex Astartes.  ";
            if (recruiting = 0) and(marines < 1000) then blurp += "##Recruitment " + recruitment_rates[recruiting] + ".  You must only give me the word and I can begin further increasing our numbers.  ";

            if (recruiting>0 && recruiting < 3) then blurp += $"##Recruitment {recruitment_rates[recruiting]}.  With an increase of funding I could vastly increase the rate.  ";
            else if (recruiting = 3) then blurp += $"##Recruitment {recruitment_rates[recruiting] }  ";
            else if (recruiting>=4){
                blurp += $"##Recruitment {recruitment_rates[recruiting]}- give me the word when we have enough Neophytes being trained.  ";
            }
        }
    }

    if (obj_ini.doomed = 1) {
        blurp += "Our chapter's mutation currently makes us unable to recruit new Neophytes.  We are doomed to a slowe demise unless the Apothecaries can fix it.##";
    }

    if (gene_seed = 0) {
        blurp += "We have no more gene-seed in our vaults and cannot create more neophytes as a result.  Something must be done, Chapter Master.##";
    }

    if (recruiting > 0) and(string_count("|", obj_controller.recruiting_worlds) = 1) then blurp += "Our Chapter is recruiting from one world- " + string(obj_ini.recruiting_name) + ".  Perhaps we should speak with a planetary governor to acquire another.";
    if (recruiting > 0) and(string_count("|", obj_controller.recruiting_worlds) = 2) then blurp += "Our Chapter is recruiting from two worlds.  Finding recruits is vastly accelerated but incuring more expenses.";
    if (recruiting > 0) and(string_count("|", obj_controller.recruiting_worlds) > 2) then blurp += "Our Chapter is recruiting from several worlds.";



    if (menu_adept = 1) {
        blurp = string_replace(blurp, "Our", "Your");
        blurp = string_replace(blurp, " our", " your");
        blurp = string_replace(blurp, "We", "You");
    }

    draw_text_ext(xx + 336 + 16, yy + 130, string_hash_to_newline(string(blurp)), -1, 536);

    // draw_line(xx+216,yy+252,xx+597,yy+252);draw_line(xx+216,yy+292,xx+597,yy+292);

    var blur = "",
        amo = 0;
    // ** Normal recruiting **
    draw_set_color(16291875);
    if (recruiting = 1) then amo = -2;
    if (recruiting = 2) then amo = -4;
    if (recruiting = 3) then amo = -6;
    if (recruiting = 4) then amo = -8;
    if (recruiting = 5) then amo = -10;
    if (recruiting = 6) then amo = -20;
    amo = amo * (string_count("|", obj_controller.recruiting_worlds));
    if (amo != 0) then draw_sprite(spr_requisition, 0, xx + 336 + 16, yy + 356);
    if (recruiting != 0) then draw_text(xx + 351 + 16, yy + 354, string_hash_to_newline(string(amo)));
    draw_set_color(c_gray);
    if (recruiting >= 0) and(recruiting <= 6) then blur = recruitement_rate[recruiting];
    draw_text(xx + 407, yy + 354, string_hash_to_newline("Space Marine Recruiting: " + string(blur)));
    draw_text(xx + 728, yy + 354, string_hash_to_newline("[-] [+]"));

    amo = 0;
    // ** Apothecary recruitment **
    draw_set_color(16291875);
    if (training_apothecary = 1) then amo = -1;
    if (training_apothecary = 2) then amo = -2;
    if (training_apothecary = 3) then amo = -3;
    if (training_apothecary = 4) then amo = -4;
    if (training_apothecary = 5) then amo = -6;
    if (training_apothecary = 6) then amo = -12;
    if (amo != 0) then draw_sprite(spr_requisition, 0, xx + 336 + 16, yy + 396);
    if (training_apothecary != 0) then draw_text(xx + 351 + 16, yy + 394, string_hash_to_newline(string(amo)));
    draw_set_color(c_gray);
    if (training_apothecary >= 0) and(training_apothecary <= 6) then blur = recruitement_rate[training_apothecary];
    draw_text(xx + 407, yy + 394, string_hash_to_newline("Apothecary Training: " + string(blur)));
    draw_text(xx + 728, yy + 394, string_hash_to_newline("[-] [+]"));

    // TODO implement Spave Wolves and Iron Hands cases
    if (global.chapter_name != "Space Wolves") and(global.chapter_name != "Iron Hands") {
        // ** Chaplain recruitment **
        amo = 0;
        draw_set_color(16291875);
        if (training_chaplain = 1) then amo = -1;
        if (training_chaplain = 2) then amo = -2;
        if (training_chaplain = 3) then amo = -3;
        if (training_chaplain = 4) then amo = -4;
        if (training_chaplain = 5) then amo = -6;
        if (training_chaplain = 6) then amo = -12;
        if (amo != 0) then draw_sprite(spr_requisition, 0, xx + 336 + 16, yy + 416);
        if (training_chaplain != 0) then draw_text(xx + 351 + 16, yy + 414, string_hash_to_newline(string(amo)));
        draw_set_color(c_gray);
        if (training_chaplain >= 0) and(training_chaplain <= 6) then blur = recruitement_rate[training_chaplain];
        draw_text(xx + 407, yy + 414, string_hash_to_newline("Chaplain Training: " + string(blur)));
        draw_text(xx + 728, yy + 414, string_hash_to_newline("[-] [+]"));
    }

    // ** Psyker recruitment **
    amo = 0;
    draw_set_color(16291875);
    if (training_psyker = 1) then amo = -1;
    if (training_psyker = 2) then amo = -2;
    if (training_psyker = 3) then amo = -3;
    if (training_psyker = 4) then amo = -4;
    if (training_psyker = 5) then amo = -6;
    if (training_psyker = 6) then amo = -12;
    if (amo != 0) then draw_sprite(spr_requisition, 0, xx + 336 + 16, yy + 436);
    if (training_psyker != 0) then draw_text(xx + 351 + 16, yy + 434, string_hash_to_newline(string(amo)));
    draw_set_color(c_gray);
    if (training_psyker >= 0) and(training_psyker <= 6) then blur = recruitement_rate[training_psyker];
    draw_text(xx + 407, yy + 434, string_hash_to_newline("Psyker Training: " + string(blur)));
    draw_text(xx + 728, yy + 434, string_hash_to_newline("[-] [+]"));

    // ** Techmarine recruitment **
    amo = 0;
    draw_set_color(16291875);
    if (training_techmarine = 1) then amo = -1;
    if (training_techmarine = 2) then amo = -2;
    if (training_techmarine = 3) then amo = -3;
    if (training_techmarine = 4) then amo = -4;
    if (training_techmarine = 5) then amo = -6;
    if (training_techmarine = 6) then amo = -12;
    if (amo != 0) then draw_sprite(spr_requisition, 0, xx + 336 + 16, yy + 456);
    if (training_techmarine != 0) then draw_text(xx + 351 + 16, yy + 456, string_hash_to_newline(string(amo)));
    draw_set_color(c_gray);
    if (training_techmarine >= 0) and(training_techmarine <= 6) then blur = recruitement_rate[training_techmarine];
    draw_text(xx + 407, yy + 454, $"Techmarine Training: {blur}");
    draw_text(xx + 728, yy + 454, "[-] [+]");

    // ** Neophyte Training types **
    var yyy = 0,
    var trial_data = scr_trial_data();
    var cur_trial = trial_data[recruit_trial];

    draw_set_halign(fa_center);
    draw_set_font(fnt_40k_30b);
    draw_text_transformed(xx + 622, yy + 491, "Aspirant Trial", 0.6, 0.6, 0);
    draw_set_font(fnt_40k_14b);

    draw_text_ext(xx + 622, yy + 522, cur_trial.name, -1, 536);
    draw_set_halign(fa_left);
    draw_set_font(fnt_40k_14);

    yyy = string_height_ext(string_hash_to_newline(cur_trial.long_description), -1, 536) + yy + 545;

    draw_text_ext(xx + 336 + 16, yy + 545, string_hash_to_newline(cur_trial.long_description), -1, 536);
    draw_text_ext(xx + 336 + 16, yy + 565 + string_height_ext(string_hash_to_newline(cur_trial.long_description), -1, 536), string_hash_to_newline(string(scr_compile_trial_bonus_string(cur_trial))), -1, 536);

    draw_sprite(spr_arrow, 0, xx + 494, yy + 515);
    draw_sprite(spr_arrow, 1, xx + 717, yy + 515);
    recruit_list_pane.draw(xx + 940, yy + 66, 0.72);
}

