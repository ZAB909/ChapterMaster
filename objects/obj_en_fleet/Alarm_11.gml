
if (action="") and (orbiting!=0){
    orbiting=instance_nearest(x,y,obj_star);
    if (owner!=1) then orbiting.present_fleet[owner]+=1;
}


