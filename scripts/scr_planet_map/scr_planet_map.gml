// This function generates a X by Y grid for a planet.
function scr_planet_map(planet_type,grid_width, grid_height){

    var hexGrid = ds_grid_create(grid_width, grid_height);
    var tile_info = ds_grid_create(grid_width, grid_height);

    for (var x = 0; x < grid_width; x++) {
        for (var y = 0; y < grid_height; y++) {
            // Calculate the position of each hexagon
            var hex_size = 32; // Size of each hexagon
            var hex_width = hex_size * sqrt(3); // Width of a hexagon
            var hex_height = hex_size * 2; // Height of a hexagon
            var xpos = x * (hex_width * 0.75);
            var ypos = y * (hex_height + (hex_height / 2)) - (x % 2) * (hex_height / 2);

            var monastery_exists = false;

            // Store the hexagon's position and planet type in the hex grid
            ds_grid_set(hexGrid, x, y, [xpos, ypos, planet_type]);
            // TODO continue with the definition of the data structure
            // Initialize tile_info data structure 
            tile_info[#movement_cost, x, y] = 1;
            tile_info[#roads, x, y] = false;
            tile_info[#settlement, x, y] = false;
            tile_info[#fort, x, y] = false;
            tile_info[#infrastructure_level, x, y] = 0;
            tile_info[#buildings, x, y] = ds_list_create();
            tile_info[#barracks, x, y] = false;
            tile_info[#astartes_monastery, x, y] = false;
            // TODO continue with the planet generation and types
            // Customize the hex grid based on planet type
            switch (planet_type) {
                var terrain = random(100);
                case "Lava":
                    // Defaults to magma
                    tile_info[#magma, x, y] = true;
                    // Adds rocks
                    if (terrain < 30){
                        tile_info[#rock, x, y] = true;
                        tile_info[#magma, x, y] = false;
                    }
                    break;
                case "Desert":
                    // Defaults to sand while on desert planet
                    tile_info[#sand, x, y] = true;
                    // Add oasis
                    if (terrain < 5) {
                        tile_info[#oasis, x, y] = true;
                        tile_info[#sand, x, y] = false;
                    }
                    // Add sand dunes
                    else if (terrain < 50) {
                        tile_info[#sand_dunes, x, y] = true;
                        tile_info[#sand, x, y] = false;
                    }
                    break;
                case "Hive":
                    // Default is waste lands
                    tile_info[#waste_land, x, y] = true;
                    // Add hive city
                    if(terrain < 10){
                        tile_info[#hive_city, x, y] = true;
                        tile_info[#waste_land, x, y] = false;
                    }
                    // Add mountains
                    else if (terrain < 20) {
                        tile_info[#mountain, x, y] = true;
                        tile_info[#waste_land, x, y] = false;
                    }
                    break;
                case "Death":
                    // Defaults to tall grass
                    tile_info[#tall_grass, x, y] = true;
                    // Add a mountain
                    if (terrain < 10) {
                        tile_info[#mountain, x, y] = true;
                        tile_info[#tall_grass, x, y] = false;
                    }
                    // Add a jungle
                    else if (terrain < 60) {
                        tile_info[#jungle, x, y] = true;
                        tile_info[#tall_grass, x, y] = false;
                    }
                    break;
                case "Agri":
                    // Defaults to plains
                    tile_info[#plains, x, y] = true;
                    if (terrain < 50){
                        tile_info[#field, x, y] = true;
                        tile_info[#plains, x, y] = false;
                    }
                    break;
                case "Temperate":
                    // Defaults to grass
                    tile_info[#grass, x, y] = true;
                    // Adds oceans
                    if(terrain < 20){
                        tile_info[#ocean, x, y] = true;
                        tile_info[#grass, x, y] = false;
                    }
                    break;
                case "Feudal":
                    tile_info[#grass, x, y] = true;
                    // Add a mountain
                    if (terrain < 20) {
                        tile_info[#mountain, x, y] = true;
                        tile_info[#grass, x, y] = false;
                    }
                    // Add a forest
                    else if (terrain < 30) {
                        tile_info[#forest, x, y] = true;
                        tile_info[#grass, x, y] = false;
                    }
                    break;
                case "Shrine":
                    // Defaults to plains
                    tile_info[#plains, x, y] = true;
                    // Adds Sororitas Temples
                    if(terrain <10){
                        tile_info[#sororitas_temple, x, y] = true;
                        tile_info[#plains, x, y] = false;
                    }
                    break;
                case "Ice":
                    // Defaults to snow
                    tile_info[#snow, x, y] = true;
                    // Add frozen lake
                    if(terrain<20){
                        tile_info[#frozen_lake, x, y] = true;
                        tile_info[#snow, x, y] = false;
                    }
                    // Add snowy mountains
                    else if (terrain < 40){
                        tile_info[#snow_mountains, x, y] = true;
                        tile_info[#snow, x, y] = false;
                    }
                    break;
                case "Dead":
                    // Defaults to asteroid rocks
                    tile_info[#asteroid_rocks, x, y] = true;
                    // Adds a destroyed city in some areas
                    if (terrain <10){
                        tile_info[#destroyed_city, x, y] = true;
                        tile_info[#asteroid_rocks, x, y] = false;
                    }
            }
        }
    }
    // Return both the hex grid and tile_info data structure
    return [hexGrid, tile_info];
}