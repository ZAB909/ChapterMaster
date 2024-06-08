enum eDirection{
	east,
	west,
	north,
	south, 
	up, 
	down
}

function dungeon_map_maker(size=10) constructor{

	map_surface = surface_create(600, 600);
	self.size = size;
	static function draw_map(){
		surface_set_target(map_surface);
		draw_clear_alpha(c_black, 0);//RESET surface
		for (var i=0;i<size;i++){
			for (var s=0;s<size;s++){
				rect = [0+(60*i), 0+(60*s),60+(60*i), 60+(60*s)];
			}
			draw_rectangle(rect[0], rect[1], rect[2], rect[3]);
		}
	}

	map = array_create(size, array_create(size, {room_type:"null"}));
	entrance = [0,floor(size)/2];
	static return_room_from_array =function (coords){
		return map[coords[0]][coords[1]];
	}
	static set_room_from_array = function(coords, room_data){
		map[coords[0]][coords[1]] = room_data;
	}
	static fetch_current_room =function (){
		return_room_from_array(current_room);
	};
	static fetch_current_room_neigbour = function (move_direction=eDirection.east){
		var array_edit;
		switch(move_direction){
			case eDirection.east:
				array_edit = [current_room[0]+1, current_room[1]];
				break;
			case eDirection.west:
				array_edit = [current_room[0]-1, current_room[1]];
				break;
			case eDirection.south:
				array_edit = [current_room[0], current_room[1]+1];
				break;
			case eDirection.north:
				array_edit = [current_room[0]+1, current_room[1]-1];
				break;
		}
		return(array_edit);
	};	
	set_room_from_array(entrance, {
		room_type : "enterance",
		obstacles :[ new obstacle(global.obstacles.blast_door)]
	});


	var generation_possible=true;
	var north, south, east, west;


	current_room = entrance;

	passages = [];

	while (generation_possible){
		north=false; south=false; east=false; west=false;
		viable_rooms = [];
		if (current_room[0]<size-1){
			var east_room  = fetch_current_room_neigbour(eDirection.east);
			array_push(viable_rooms, east_room);
		}
		if (current_room[0]>0){
			var west_room  = fetch_current_room_neigbour(eDirection.west);
			array_push(viable_rooms, west_room);
		}
		if (current_room[1]>0){
			var north_room  = fetch_current_room_neigbour(eDirection.north);
			array_push(viable_rooms, north_room);
		}
		if (current_room[1]<size-1){
			var south_room  = fetch_current_room_neigbour(eDirection.south);
			array_push(viable_rooms, south_room);
		}
		build_room = viable_rooms[irandom(array_length(viable_rooms)-1)];
		if (is_array(build_room)){
			array_push(passages, [current_room, build_room]);
			set_room_from_array(build_room, new CreateNewDungeonRoom());
		}
		generation_possible = false;
	}

	current_room = entrance;

	current_obstacle = fetch_current_room().obstacles[0];
	solution=-1;
	viable_members=[];
}

function CreateNewDungeonRoom(pre_data = {}) constructor{
	pre_data_names = struct_get_names(pre_data);
	if (array_contains(pre_data_names, "room_type")){
		room_type = pre_data_names.room_type;
	} else {
		room_type = choose("command", "storage", "munitions", "trade");
	}

	if (array_contains(pre_data_names, "room_size")){
		room_size = pre_data_names.room_size;
	} else {
		room_size = irandom(9)+1;
	}

	if (array_contains(pre_data_names, "obstacles")){
		obstacles = pre_data_names.obstacles;
	} else {
		obstacles = [];
	}
}

function obstacle(bd) constructor{
	base_data = bd;
	overcome=false;
}
