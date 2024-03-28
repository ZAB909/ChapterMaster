/// calculate_shadow_color(original_color, shadow_intensity)
/// Returns a shadow color by applying gamma correction to the given RGB color.


function shadow_creator(red,green,blue, shadow,gamma = 2.2){

    var original_color, shadow_intensity;

    // Apply gamma correction to each RGB component
    // You can experiment with different gamma values
    var shadow_color = make_color_rgb(
        power(red / 255, gamma) * 255,
        power(green/ 255, gamma) * 255,
        power(blue / 255, gamma) * 255
    );

    // Darken the color further based on the shadow intensity
    shadow_color = make_color_rgb(
        color_get_red(shadow_color) * shadow,
        color_get_red(shadow_color) * shadow,
        color_get_red(shadow_color) * shadow
    );

    return shadow_color;
}//33,30,132