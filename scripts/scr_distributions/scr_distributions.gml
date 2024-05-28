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

function pareto(base, exponent=1){
    return base * (1 - power(random(1), 1 / (1 + exponent)));
}

// function exponent(lambda, base) {
//     var u = random(1);  // Generate a uniform random number between 0 and 1
//     var raw = -log(1 - u) / lambda;  // Generate an exponentially distributed number
//     return base * raw;  // Scale the number by the base value
// }