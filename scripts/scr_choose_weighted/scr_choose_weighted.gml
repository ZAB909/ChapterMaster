/// @function choose_weighted(_choices)
/// @description

function choose_weighted(_choices){
    var total = 0;

    // Calculate the total weight
    for (var i = 0; i < array_length_1d(_choices); i++) {
        total += _choices[i, 1];
    }

    // Choose a random value between 0 and total
    var random_value = random(total);

    // Find the choice that this random value falls into
    for (var i = 0; i < array_length_1d(_choices); i++) {
        if (random_value < _choices[i, 1]) {
            return _choices[i, 0];
        } else {
            random_value -= _choices[i, 1];
        }
    }
}