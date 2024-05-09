/// @function choose_weighted(_choices)
/// @description Randomly selects one item from the provided array, taking into account the weight of each item.
/// @param _choices an array of arrays, where each sub array contains two items: the item to be picked and its weight. Example: `[[sword,5], [mace,2]]`.

function choose_weighted(_choices){
    var total = 0;

    // Calculate the total weight
    for (var i = 0; i < array_length(_choices); i++) {
        total += _choices[i, 1];
    }

    // Choose a random value between 0 and total
    var random_value = random(total);

    // Find the choice that this random value falls into
    for (var i = 0; i < array_length(_choices); i++) {
        if (random_value < _choices[i, 1]) {
            return _choices[i, 0];
        } else {
            random_value -= _choices[i, 1];
        }
    }
}