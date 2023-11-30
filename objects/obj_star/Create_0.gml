// Creates all variables, sets up default variables for different planets and if there is a fleet orbiting a system/planet
craftworld=0;// orbit_angle=0;orbit_radius=0;
space_hulk=0;
old_x=0;
old_y=0;

if (((x>=(room_width-150)) and (y<=450)) or (y<100)) and (global.load==0){// was 300
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
    p_player[run]=0;
    p_lasers[run]=0;
    p_silo[run]=0;
    p_defenses[run]=0;
    p_upgrades[run]=[];
    // v how much of a problem they are from 1-5
    p_orks[run]=0;
    p_tau[run]=0;
    p_eldar[run]=0;
    p_tyranids[run]=0;
    p_traitors[run]=0;
    p_chaos[run]=0;
    p_demons[run]=0;
    p_sisters[run]=0;
    p_necrons[run]=0;
    p_halp[run]=0;
    // current planet heresy
    p_heresy[run]=0;
    p_hurssy[run]=0;
    p_hurssy_time[run]=0;
    p_heresy_secret[run]=0;
    p_influence[run]=0;
    p_raided[run]=0;
    // 
    p_problem[0,run]="";
    p_timer[0,run]=0;
    p_problem[1,run]="";
    p_timer[1,run]=0;
    p_problem[2,run]="";
    p_timer[2,run]=0;
    p_problem[3,run]="";
    p_timer[3,run]=0;
    p_problem[4,run]="";
    p_timer[4,run]=0;
    p_problem[5,run]="";
    p_timer[5,run]=0;
}

system_player_ground_forces = 0;

for(run=8; run<=30; run++){
    present_fleet[run]=0;
}
vision=1;
// present_fleets=0;
// tau_fleets=0;

ai_a=-1;
ai_b=-1;
ai_c=-1;
ai_d=-1;
ai_e=-1;

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


var star_base_ui_elem = new UIElement(sprite_width, sprite_height + 32, eUI_ALIGN_X.x_left, eUI_ALIGN_Y.y_top)
ui_node = new UINode(star_base_ui_elem, x - sprite_xoffset, y - sprite_yoffset)



var system_name_element = new UIElement(string_width(name) + 60, 32, eUI_ALIGN_X.x_center, eUI_ALIGN_Y.y_bottom)
var left_align_element = new UIElement(18, 18, eUI_ALIGN_X.x_left, eUI_ALIGN_Y.y_center)
var right_align_element = new UIElement(18,18, eUI_ALIGN_X.x_right, eUI_ALIGN_Y.y_center)

ui_node.add_element(system_name_element, 0, 0, 0, 0)
	.add_component(UISpriteRendererComponent)
		.set_sprite(spr_p_name_bg)
		.set_callback(function(context) {
			if owner != 1 {
				context.set_color_solid(global.star_name_colors[owner])
			} else {
				var main_color = make_color_rgb(obj_controller.targetR1 *255, obj_controller.targetG1 * 255, obj_controller.targetB1 * 255)
				var pauldron_color = make_color_rgb(obj_controller.targetR3 *255, obj_controller.targetG3 *255, obj_controller.targetB3 *255)
				context.set_vertical_gradient(main_color, pauldron_color)
			}
		})
	.finalize()
	.add_component(UITextRendererComponent)
		.set_color_solid(c_white)
		.set_callback(function(context) {
			context.text = name
			
			var new_w = string_width(name) + 60
			context.set_halign(fa_center)
			context.set_valign(fa_middle)
			context.owner.resize(new_w, 32)
			if owner == 1 {
				var trim_color = make_color_rgb(obj_controller.targetR5 *255, obj_controller.targetG5 *255, obj_controller.targetB5 *255)
				context.set_color_solid(trim_color)
			}
		})
	.finalize()
	.add_element(left_align_element, 0, 0, 0, 0)
		.add_component(UISpriteRendererComponent)
			.set_sprite(spr_planets)
			.set_image_index(9)
			.set_image_speed(0)
			.set_callback(function(context) {
				context.is_canceled = !system_player_ground_forces	
			})
		.finalize()
	.finalize()
	.add_element(right_align_element, 0, 0, 0, 0)
		.add_component(UISpriteRendererComponent)
			.set_callback(function(context) {
				if owner == 1 {
					context.set_sprite(obj_img.creation[1])
					context.set_image_index(obj_ini.icon)
				} else {
					context.set_sprite(obj_img.force[owner])
				}
			})
			.set_image_speed(0)
		.finalize()
	.finalize()

