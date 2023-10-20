/* 
    This function generates a X by Y grid for a planet with all the tile information .
        In here 2 basic structures are created: the hexGrid and the tile_info
        Hex grid is just to have the basic hex map
        All the information regarding the tile and if it has buildings or any other feature is in the tile_info. 
            The names are pretty self explenatory in regards to what each does
*/
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
            tile_info[#infrastructure_level, x, y] = 0; // 0-5 where 0 is non existant and 5 is a developped hive city. 3 Is developped city OR small hive
            tile_info[#buildings, x, y] = ds_list_create();
            tile_info[#barracks, x, y] = false;
            tile_info[#astartes_monastery, x, y] = false;
            tile_info[#terrain_type, x, y] = "grass";
            tile_info[#height, x, y] = 1;
            tile_info[#habitable, x, y] = true;
            tile_info[#radioactive, x, y] = false;
            // TODO continue with the planet generation and types
            // Customize the hex grid based on planet type
            switch (planet_type) {
                var terrain = random(100);
                var infrastructure = 0;
                var infrastructure = 0;
                case "Lava":
                    // Defaults to magma
                    tile_info[#terrain_type, x, y] = "magma";
                    tile_info[#movement_by_land, x, y] = false;
                    tile_info[#habitable, x, y] = false;
                    tile_info[#movement_cost_air, x, y] = 0.5;
                    // Add settlements
                    if(terrain < 15){
                        infrastructure = choose(1,1,1,1,1,2,2,3);
                        tile_info[#settlement, x, y] = true;
                        tile_info[#terrain_type, x, y] = "rock";
                        tile_info[#movement_cost_land, x, y] = 2.5;
                        tile_info[#infrastructure_level, x, y] = infrastructure;
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
                    // Add settlements
                    else if (terrain < 20){
                        infrastructure = choose(1,1,1,1,1,2,2,2,2,3,3);
                        tile_info[#settlement, x, y] = true;
                        tile_info[#movement_cost_land, x, y] = 1.5;
                        tile_info[#infrastructure_level, x, y] = infrastructure;
                    }
                    // Add sand dunes
                    else if (terrain < 50) {
                        tile_info[#terrain_type, x, y] = "sand_dunes";
                        tile_info[#movement_cost_land, x, y] = 1.2;
                        tile_info[#height, x, y] = 2;
                    }
                    break;
                case "Hive":
                    // TODO add nuclear waste
                    // Default is waste lands
                    tile_info[#terrain_type, x, y] = "waste_land";
                    // Add hive city
                    if(terrain < 10){
                        infrastructure = choose(3,3,3,4,4,5);
                        tile_info[#terrain_type, x, y] = "hive_city";
                        tile_info[#settlement, x, y] = true;
                        tile_info[#movement_cost_land, x, y] = 1.5;
                        tile_info[#infrastructure_level, x, y] = infrastructure;
                    }
                    // Add small fort
                    else if (terrain < 20){
                        infrastructure = choose(1,1,1,1,1,2,2,2);
                        tile_info[#fort, x, y] = true;
                        tile_info[#movement_cost_land, x, y] = 1.5;
                        tile_info[#infrastructure_level, x, y] = infrastructure;
                    }
                    // Add mountains
                    else if (terrain < 30) {
                        tile_info[#terrain_type, x, y] = "mountain";
                        tile_info[#movement_cost_land, x, y] = 1.8;
                        tile_info[#movement_cost_air, x, y] = 0.75;
                        tile_info[#height, x, y] = 3;
                    }
                    // Add hills
                    else if (terrain <50) {
                        tile_info[#terrain_type, x, y] = "hills";
                        tile_info[#movement_cost_land, x, y] = 1.3;
                        tile_info[#movement_cost_air, x, y] = 0.5;
                        tile_info[#height, x, y] = 2;
                    }
                    // Add forests
                    else if (terrain <56) {
                        tile_info[#terrain_type, x, y] = "forest";
                        tile_info[#movement_cost_land, x, y] = 1.25;
                    }
                    // Adds oceans
                    else if(terrain < 65){
                        tile_info[#terrain_type, x, y] = "ocean";
                        tile_info[#movement_by_land, x, y] = false;
                        tile_info[#movement_by_sea, x, y] = true;
                        tile_info[#height, x, y] = 0;
                    }
                    // Adds nuclear waste
                    else if (terrain < 70){
                        tile_info[#terrain_type, x, y] = "nuclear_waste";
                        tile_info[#movement_cost_land, x, y] = 5;
                        tile_info[#radioactive, x, y] = true;
                    }
                    break;
                case "Death":
                    // Defaults to tall grass
                    tile_info[#terrain_type, x, y] = "tall_grass";
                    // Add a settlement
                    if (terrain < 10){
                        infrastructure = choose(1,1,1,1,1,2,2);
                        tile_info[#settlement, x, y] = true;
                        tile_info[#movement_cost_land, x, y] = 1.5;
                        tile_info[#infrastructure_level, x, y] = infrastructure;
                    }
                    // Add a mountain
                    else if (terrain < 25) {
                        tile_info[#terrain_type, x, y] = "mountain";
                        tile_info[#movement_cost_land, x, y] = 1.8;
                        tile_info[#movement_cost_air, x, y] = 0.75;
                        tile_info[#height, x, y] = 3;
                    }
                    // Add hills
                    else if (terrain < 35) {
                        tile_info[#terrain_type, x, y] = "hills";
                        tile_info[#movement_cost_land, x, y] = 1.3;
                        tile_info[#movement_cost_air, x, y] = 0.5;
                        tile_info[#height, x, y] = 2;
                    }
                    // Add a jungle
                    else if (terrain < 60) {
                        tile_info[#terrain_type, x, y] = "jungle";
                        tile_info[#movement_cost_land, x, y] = 1.5;
                    }
                    // Add an ocean
                    else if(terrain < 75){
                        tile_info[#terrain_type, x, y] = "ocean";
                        tile_info[#movement_by_land, x, y] = false;
                        tile_info[#movement_by_sea, x, y] = true;
                        tile_info[#height, x, y] = 0;
                    }
                    break;
                case "Agri":
                    // Defaults to plains
                    tile_info[#terrain_type, x, y] = "plains";
                    // Add a settlement
                    if (terrain < 20){
                        infrastructure = choose(1,1,1,1,1,2,2);
                        tile_info[#settlement, x, y] = true;
                        tile_info[#movement_cost_land, x, y] = 1.5;
                        tile_info[#infrastructure_level, x, y] = infrastructure;
                    }
                    // Add a field
                    else if (terrain < 50){
                        tile_info[#terrain_type, x, y] = "field";
                    }
                    break;
                case "Temperate":
                    // Defaults to grass
                    // Add a settlement
                    if (terrain < 20){
                        infrastructure = choose(1,1,1,1,1,2,2,2,2,3,3);
                        tile_info[#settlement, x, y] = true;
                        tile_info[#movement_cost_land, x, y] = 1.5;
                        tile_info[#infrastructure_level, x, y] = infrastructure;
                    }
                    // Add mountains
                    else if (terrain < 30) {
                        tile_info[#terrain_type, x, y] = "mountain";
                        tile_info[#movement_cost_land, x, y] = 1.8;
                        tile_info[#movement_cost_air, x, y] = 0.75;
                        tile_info[#height, x, y] = 3;
                    }
                    // Add hills
                    else if (terrain <50) {
                        tile_info[#terrain_type, x, y] = "hills";
                        tile_info[#movement_cost_land, x, y] = 1.3;
                        tile_info[#movement_cost_air, x, y] = 0.5;
                        tile_info[#height, x, y] = 2;
                    }
                    // Add forests
                    else if (terrain <53) {
                        tile_info[#terrain_type, x, y] = "forest";
                        tile_info[#movement_cost_land, x, y] = 1.25;
                    }
                    // Adds oceans
                    else if(terrain < 65){
                        tile_info[#terrain_type, x, y] = "ocean";
                        tile_info[#movement_by_land, x, y] = false;
                        tile_info[#movement_by_sea, x, y] = true;
                        tile_info[#height, x, y] = 0;
                    }
                    break;
                case "Feudal":
                    // Add a settlement
                    if (terrain < 20){
                        infrastructure = choose(1,1,1,1,1,2,2,2);
                        tile_info[#settlement, x, y] = true;
                        tile_info[#movement_cost_land, x, y] = 1.5;
                        tile_info[#infrastructure_level, x, y] = infrastructure;
                    }
                    // Add mountains
                    else if (terrain < 30) {
                        tile_info[#terrain_type, x, y] = "mountain";
                        tile_info[#movement_cost_land, x, y] = 1.8;
                        tile_info[#movement_cost_air, x, y] = 0.75;
                        tile_info[#height, x, y] = 3;
                    }
                    // Add hills
                    else if (terrain <50) {
                        tile_info[#terrain_type, x, y] = "hills";
                        tile_info[#movement_cost_land, x, y] = 1.3;
                        tile_info[#movement_cost_air, x, y] = 0.5;
                        tile_info[#height, x, y] = 2;
                    }
                    // Add forests
                    else if (terrain < 60) {
                        tile_info[#terrain_type, x, y] = "forest";
                        tile_info[#movement_cost_land, x, y] = 1.25;
                    }
                    // Add a field
                    else if (terrain < 70){
                        tile_info[#terrain_type, x, y] = "field";
                    }
                    // Adds oceans
                    else if(terrain < 80){
                        tile_info[#terrain_type, x, y] = "ocean";
                        tile_info[#movement_by_land, x, y] = false;
                        tile_info[#movement_by_sea, x, y] = true;
                        tile_info[#height, x, y] = 0;
                    }
                    break;
                case "Shrine":
                    // The sororitas temple and such will be handled on the buildings features 
                    //(which nelson already re wrote so just add them features with the checks)
                    // Defaults to plains
                    tile_info[#terrain_type, x, y] = "plains";
                    // Adds settlement
                    if(terrain <10){
                        infrastructure = choose(1,1,1,1,1,2,2,2,3,3);
                        tile_info[#settlement, x, y] = true;
                        tile_info[#movement_cost_land, x, y] = 1.5;
                        tile_info[#infrastructure_level, x, y] = infrastructure;
                    }
                    // Adds a forest
                    else if (terrain < 20) {
                        tile_info[#terrain_type, x, y] = "forest";
                        tile_info[#movement_cost_land, x, y] = 1.25;
                    }
                    // Adds a cementery
                    else if (terrain < 60){
                        tile_info[#terrain_type, x, y] = "cementery";
                    }
                    // Adds an ocean
                    else if (terrain < 70){
                        tile_info[#terrain_type, x, y] = "ocean";
                        tile_info[#movement_by_land, x, y] = false;
                        tile_info[#movement_by_sea, x, y] = true;
                        tile_info[#height, x, y] = 0;
                    }
                    break;
                case "Ice":
                    // Defaults to snow
                    tile_info[#terrain_type, x, y] = "snow";
                    tile_info[#movement_cost_land, x, y] = 1.2;
                    // Add a settlement
                    if(terrain <10){
                        infrastructure = choose(1,1,1,1,1,2,2);
                        tile_info[#settlement, x, y] = true;
                        tile_info[#movement_cost_land, x, y] = 1.5;
                        tile_info[#infrastructure_level, x, y] = infrastructure;
                    }
                    // Add frozen lake
                    else if(terrain<20){
                        tile_info[#terrain_type, x, y] = "frozen_lake";
                        tile_info[#movement_cost_land, x, y] = 1.5;
                        tile_info[#height, x, y] = 0;
                    }
                    // Add forests
                    else if (terrain < 40) {
                        tile_info[#terrain_type, x, y] = "forest";
                        tile_info[#movement_cost_land, x, y] = 1.4;
                    }
                    // Add snowy hills
                    else if (terrain <60) {
                        tile_info[#terrain_type, x, y] = "hills";
                        tile_info[#movement_cost_land, x, y] = 1.3;
                        tile_info[#movement_cost_air, x, y] = 0.5;
                        tile_info[#height, x, y] = 2;
                    }
                    // Add snowy mountains
                    else if (terrain < 70){
                        tile_info[#terrain_type, x, y] = "snow_mountains";
                        tile_info[#movement_cost_land, x, y] = 1.8;
                        tile_info[#movement_cost_air, x, y] = 0.75;
                        tile_info[#height, x, y] = 3;
                    }
                    break;
                case "Dead":
                    // Defaults to asteroid rocks
                    tile_info[#terrain_type, x, y] = "asteroid_rocks";
                    tile_info[#habitable, x, y] = false;
                    // Adds a destroyed city in some areas
                    if (terrain <10){
                        tile_info[#terrain_type, x, y] = "destroyed_city";
                        tile_info[#movement_cost_land, x, y] = 1.5;
                    }
                    // Adds radiation to certain tiles
                    else if (terrain < 15){
                        tile_info[#terrain_type, x, y] = "nuclear_crater";
                        tile_info[#movement_cost_land, x, y] = 5;
                        tile_info[#radioactive, x, y] = true;
                    }
                    break;
            }
        }
    }

    // After generating the entire map, connect the ocean tiles
    connect_ocean_tiles(grid_width, grid_height);

    // Assuming settlements is a list of [x, y] coordinates for all settlements
    for (var i = 0; i < ds_list_size(settlements); i++) {
        var startX = settlements[| i, 0];
        var startY = settlements[| i, 1];
        
        for (var j = 0; j < ds_list_size(settlements); j++) {
            if (i != j) {
                var endX = settlements[| j, 0];
                var endY = settlements[| j, 1];
                find_nearest_settlement(startX, startY, endX, endY);
            }
        }
    }

    // Return both the hex grid and tile_info data structure
    return [hexGrid, tile_info];
}
// TODO change ocean connection to be improved
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

// Find the nearest settlement with infrastructure level difference of 1
function find_nearest_settlement(x, y, targetInfrastructureLevel) {
    var openList = ds_priority_create();
    var closedList = ds_grid_create(grid_width, grid_height);
    var path = ds_list_create();
    var nearestSettlement = null;
    
    // Initialize open list with the current tile
    var currentG = 0;
    var h = 0;
    var f = currentG + h;
    ds_priority_add(openList, currentG, x, y);
    
    while (!ds_priority_empty(openList)) {
        // Get the tile with the lowest F score
        var currentG = ds_priority_delete_min(openList);
        var currentX = ds_priority_find_value(openList, currentG);
        var currentY = ds_priority_find_priority(openList, currentG);
        closedList[currentX, currentY] = 1;
        
        // Add settlement to the list
        if (tile_info[#settlement, currentX, currentY] && (tile_info[#infrastructure_level, currentX, currentY] == targetInfrastructureLevel)) {
            ds_list_add(path, [currentX, currentY]);

            // Check if it's closer than the previous nearest settlement
            if (nearestSettlement == null || neighborG < nearestSettlement.distance) {
                nearestSettlement = {
                    x: currentX,
                    y: currentY,
                    distance: neighborG
                };
            }
            break;
        }
        
        // Explore neighboring tiles
        for (var dir = 0; dir < 6; dir++) {
            var neighborX = currentX + hex_neighbor_x(dir, currentY % 2);
            var neighborY = currentY + hex_neighbor_y(dir, currentY % 2);
            
            if (neighborX >= 0 && neighborX < grid_width && neighborY >= 0 && neighborY < grid_height) {
                if (closedList[neighborX, neighborY] == 0 && tile_info[#movement_by_land, neighborX, neighborY]) {
                    // Calculate G score and H score for the neighbor
                    var neighborG = currentG + tile_info[#movement_cost_land, neighborX, neighborY];
                    var neighborH = distance(neighborX, neighborY, targetX, targetY);
                    var neighborF = neighborG + neighborH;
                    
                    if (!ds_priority_exists(openList, neighborG)) {
                        ds_priority_add(openList, neighborF, neighborX, neighborY);
                        ds_list_add(path, [neighborX, neighborY]);
                    } else if (neighborG < ds_priority_find_priority(openList, neighborF)) {
                        // Update neighbor's G score and F score
                        ds_priority_change_priority(openList, neighborF, neighborX, neighborY);
                    }
                }
            }
        }
    }

    // After the while loop, connect the path to the nearest settlement
    if (nearestSettlement != null) {
        for (var i=0; i < (ds_list_size(path) - 1); i++) {
            var currentTile = ds_list_find_value(path, i);
            var nextTile = ds_list_find_value(path, i + 1);
            connect_tiles_with_roads(currentTile[0], currentTile[1], nextTile[0], nextTile[1]);
        }
    }
    
    ds_priority_destroy(openList);
    ds_grid_destroy(closedList);
}

// Connect two tiles with roads
function connect_tiles_with_roads(x1, y1, x2, y2) {
    var currentX = x1;
    var currentY = y1;
    while (currentX != x2 || currentY != y2) {
        // Implement code to connect the two tiles with roads here.
        tile_info[#roads, currentX, currentY] = true;
        // Move towards the target tile (x2, y2)
        // You need to determine the logic for moving in the right direction.
        // You might use A* or another pathfinding algorithm to find the path.
    }
}

// Calculate the x-coordinate of a neighboring hex tile
function hex_neighbor_x(direction, yOffset) {
    var xOffsets = [1, 1, 0, -1, 0, 1];
    return x + xOffsets[direction];
}

// Calculate the y-coordinate of a neighboring hex tile
function hex_neighbor_y(direction, yOffset) {
    var yOffsets = [-1, 0, 1, 0, -1, -1];
    return y + yOffsets[direction];
}
