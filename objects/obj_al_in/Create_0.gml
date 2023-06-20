

image_xscale=0.5;
image_yscale=0.5;
speed=6;

target=0;
shields=0;
owner=0;
hostile=0;

hp=5000;

if (instance_exists(obj_en_in)){
    var n, ins;
    n = floor(random(instance_number(obj_en_in))) // get a random whole number based on obj amount
    ins = instance_find( obj_en_in , n ) // find that n'th instance of that type
    target=ins;
}


if (!instance_exists(obj_en_in)){
    var n, ins;
    n = floor(random(instance_number(obj_en_ship))) // get a random whole number based on obj amount
    ins = instance_find( obj_en_ship , n ) // find that n'th instance of that type
    target=ins;
}

hp=15;

cooldown1=0;
action="close";

alarm[0]=1;

