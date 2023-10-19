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
            tile_info[#movement_cost_land, x, y] = 1;
            tile_info[#movement_cost_sea, x, y] = 1;
            tile_info[#movement_cost_air, x, y] = 0.25;
            tile_info[#movement_by_land, x, y] = true;
            tile_info[#movement_by_sea, x, y] = false;
            tile_info[#movement_by_air, x, y] = true;
            tile_info[#roads, x, y] = false;
            tile_info[#settlement, x, y] = false;
            tile_info[#fort, x, y] = false;
            tile_info[#infrastructure_level, x, y] = 0;
            tile_info[#buildings, x, y] = ds_list_create();
            tile_info[#barracks, x, y] = false;
            tile_info[#astartes_monastery, x, y] = false;
            tile_info[#terrain_type, x, y] = "grass";
            tile_info[#height, x, y] = 1;
            // TODO continue with the planet generation and types
            // Customize the hex grid based on planet type
            switch (planet_type) {
                var terrain = random(100);
                case "Lava":
                    // Defaults to magma
                    tile_info[#terrain_type, x, y] = "magma";
                    tile_info[#movement_by_land, x, y] = false;
                    tile_info[#movement_cost_air, x, y] = 0.5;
                    if(terrain < 20){
                        tile_info[#settlement, x, y] = false;
                        tile_info[#movement_cost_land, x, y] = 1.5;
                    }
                    // Adds rocks
                    else if (terrain < 30){
                        tile_info[#terrain_type, x, y] = "rock";
                        tile_info[#movement_cost_land, x, y] = 2;
                    }
                    break;
                case "Desert":
                    // Defaults to sand while on desert planet
                    tile_info[#terrain_type, x, y] = "sand";
                    // Add oasis
                    if (terrain < 5) {
                        tile_info[#terrain_type, x, y] = "oasis";
                        tile_info[#height, x, y] = 0;
                    }
                    // Add sand dunes
                    else if (terrain < 50) {
                        tile_info[#terrain_type, x, y] = "sand_dunes";
                        tile_info[#movement_cost_land, x, y] = 1.2;
                        tile_info[#height, x, y] = 2;
                    }
                    break;
                case "Hive":
                    // Default is waste lands
                    tile_info[#terrain_type, x, y] = "waste_land";
                    // Add hive city
                    if(terrain < 10){
                        tile_info[#terrain_type, x, y] = "hive_city";
                        tile_info[#movement_cost_land, x, y] = 1.5;
                    }
                    // Add mountains
                    else if (terrain < 30) {
                        tile_info[#terrain_type, x, y] = "mountain";
                        tile_info[#movement_cost_land, x, y] = 1.8;
                        tile_info[#movement_cost_air, x, y] = 0.75;
                        tile_info[#height, x, y] = 3;
                    }
                    else if (terrain <50) {
                        tile_info[#terrain_type, x, y] = "hills";
                        tile_info[#movement_cost_land, x, y] = 1.3;
                        tile_info[#movement_cost_air, x, y] = 0.5;
                        tile_info[#height, x, y] = 2;
                    }
                    break;
                case "Death":
                    // Defaults to tall grass
                    tile_info[#terrain_type, x, y] = "tall_grass";
                    // Add a mountain
                    if (terrain < 10) {
                        tile_info[#terrain_type, x, y] = "mountain";
                        tile_info[#movement_cost_land, x, y] = 1.8;
                        tile_info[#movement_cost_air, x, y] = 0.75;
                        tile_info[#height, x, y] = 3;
                    }
                    // Add a jungle
                    else if (terrain < 60) {
                        tile_info[#terrain_type, x, y] = "jungle";
                        tile_info[#movement_cost_land, x, y] = 1.5;
                    }
                    break;
                case "Agri":
                    // Defaults to plains
                    tile_info[#terrain_type, x, y] = "plains";
                    if (terrain < 50){
                        tile_info[#terrain_type, x, y] = "field";
                    }
                    break;
                case "Temperate":
                    // Defaults to grass
                    // Adds oceans
                    if(terrain < 20){
                        tile_info[#terrain_type, x, y] = "ocean";
                        tile_info[#movement_by_land, x, y] = false;
                        tile_info[#movement_by_sea, x, y] = true;
                        tile_info[#height, x, y] = 0;
                    }
                    break;
                case "Feudal":
                    // Add a mountain
                    if (terrain < 20) {
                        tile_info[#terrain_type, x, y] = "mountain";
                        tile_info[#movement_cost_land, x, y] = 1.8;
                        tile_info[#movement_cost_air, x, y] = 0.75;
                        tile_info[#height, x, y] = 3;
                    }
                    // Add a forest
                    else if (terrain < 30) {
                        tile_info[#terrain_type, x, y] = "forest";
                        tile_info[#movement_cost_land, x, y] = 1.25;
                    }
                    break;
                case "Shrine":
                    // Defaults to plains
                    tile_info[#terrain_type, x, y] = "plains";
                    // Adds Sororitas Temples
                    if(terrain <10){
                        tile_info[#terrain_type, x, y] = "sororitas_temple";
                        tile_info[#movement_cost_land, x, y] = 1.1;
                    }
                    break;
                case "Ice":
                    // Defaults to snow
                    tile_info[#terrain_type, x, y] = "snow";
                    tile_info[#movement_cost_land, x, y] = 1.2;
                    // Add frozen lake
                    if(terrain<20){
                        tile_info[#terrain_type, x, y] = "frozen_lake";
                        tile_info[#movement_cost_land, x, y] = 1.5;
                        tile_info[#height, x, y] = 0;
                    }
                    // Add snowy mountains
                    else if (terrain < 40){
                        tile_info[#terrain_type, x, y] = "snow_mountains";
                        tile_info[#movement_cost_land, x, y] = 1.8;
                        tile_info[#movement_cost_air, x, y] = 0.75;
                        tile_info[#height, x, y] = 3;
                    }
                    break;
                case "Dead":
                    // Defaults to asteroid rocks
                    tile_info[#terrain_type, x, y] = "asteroid_rocks";
                    // Adds a destroyed city in some areas
                    if (terrain <10){
                        tile_info[#terrain_type, x, y] = "destroyed_city";
                        tile_info[#movement_cost_land, x, y] = 1.5;
                    }
            }
        }
    }

    // After generating the entire map, connect the ocean tiles
    connect_ocean_tiles(grid_width, grid_height);

    // Return both the hex grid and tile_info data structure
    return [hexGrid, tile_info];
}

// Recursive flood-fill function to connect ocean tiles
function flood_fill(x, y) {
    if (x < 0 || x >= grid_width || y < 0 || y >= grid_height) {
        return;
    }
    
    if (tile_info[#terrain_type, x, y] == "ocean") {
        // Mark the tile as part of the ocean
        tile_info[#ocean, x, y] = true;
        tile_info[#movement_by_land, x, y] = false;
        tile_info[#movement_by_sea, x, y] = true;

        // Recursively call flood_fill on neighboring tiles
        flood_fill(x - 1, y); // Left
        flood_fill(x + 1, y); // Right
        flood_fill(x, y - 1); // Up
        flood_fill(x, y + 1); // Down
    }
}

// Find and connect ocean tiles
function connect_ocean_tiles(grid_width, grid_height){
    for (var x = 0; x < grid_width; x++) {
        for (var y = 0; y < grid_height; y++) {
            if (tile_info[#terrain_type, x, y] == "ocean" && !tile_info[#ocean, x, y]) {
                // If this tile is ocean and not part of the connected ocean, start a flood-fill
                flood_fill(x, y);
            }
        }
    }
}
