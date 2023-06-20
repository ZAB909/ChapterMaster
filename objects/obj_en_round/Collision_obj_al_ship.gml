


var arm;
arm=other.armor_front;

if (arm<dam){
    dam-=arm;
    if (other.shields>0) then other.shields-=dam/2;
    if (other.shields<=0) then other.hp-=dam/2;
}

if (arm>dam) and (other.shields>0) then other.shields-=0.5;
if (arm>dam) and (other.shields<=0) then other.hp-=0.5;

if (sprite_index=spr_torpedo){
    instance_create(x,y,obj_explosion);
}

instance_destroy();

