// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gauss(base, sd){
    var x1, x2, w;
    do {
        x1 = random(2) - 1;
        x2 = random(2) - 1;
        w = (x1 * x1) + (x2 * x2);
    } until (0 < w and w < 1);
 
    w = sqrt(-2 * ln(w) / w);
    return base + sd * x1 * w;
}

function generate_power_law(bonus, exponent=1){
    var randBonus = bonus * (1 - power(random(1), 1 / (1 + exponent)));
    return randBonus;
}