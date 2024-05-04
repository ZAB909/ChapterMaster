enum Colors {
    White,
    Silver,
    Fenrisian_Grey,
    Codex_Grey,
    Dark_Grey,
    Black,
    Red,
    Sanguine,
    Dark_Red,
    Mephiston_Red,
    Orange,
    Brown,
    Bone,
    Yellow,
    Gold,
    Copper,
    Lime,
    Firedrake_Green,
    Caliban_Green,
    Green,
    Dark_Green,
    Cyan,
    Turqoise,
    Light_Blue,
    Blue,
    Enchanted_Blue,
    Ultramarine,
    Purple,
    Pink,
    Grey,
    Light_Caliban_Green,
    Deathwing,
    Dark_Metal,
}

function scr_colors_initialize() {

    var colors_array = [
        ["White", 255, 255, 255],
        ["Silver", 178, 178, 178],
        ["Fenrisian Grey", 144, 155, 183],
        ["Codex Grey", 112, 117, 110],
        ["Dark Grey", 70, 70, 70],
        ["Black", 35, 35, 35],
        ["Red", 200, 0, 0],
        ["Sanguine", 150, 0, 0],
        ["Dark Red", 124, 0, 0],
        ["Mephiston Red", 145, 12, 9],
        ["Orange", 255, 156, 0],
        ["Brown", 112, 66, 0],
        ["Bone", 245, 236, 205],
        ["Yellow", 255, 220, 0],
        ["Gold", 255, 164, 12],
        ["Copper", 166, 129, 0],
        ["Lime", 0, 190, 0],
        ["Firedrake Green", 29, 102, 53],
        ["Caliban Green", 6, 63, 43],
        ["Green", 0, 160, 0],
        ["Dark Green", 0, 70, 0],
        ["Cyan", 0, 228, 255],
        ["Turqoise", 0, 131, 147],
        ["Light Blue", 0, 150, 255],
        ["Blue", 0, 0, 220],
        ["Enchanted Blue", 58, 110, 158],
        ["Ultramarine", 21, 92, 165],
        ["Purple", 117, 0, 217],
        ["Pink", 255, 0, 198],
        ["Grey", 127, 127, 127],
        ["Light Caliban Green", 30, 102, 59],
        ["Deathwing", 238, 204, 163],
        ["Dark Metal", 105, 105, 105],
    ];

    for (var i = 0; i < array_length(colors_array); i++) {
        col[i] = colors_array[i][0];
        col_r[i] = colors_array[i][1];
        col_g[i] = colors_array[i][2];
        col_b[i] = colors_array[i][3];
    }
	global.colors_count = array_length(colors_array);
}