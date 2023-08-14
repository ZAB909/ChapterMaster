function get_diag_string(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script_get_diag_string
{
    with (obj_popup_dialogue)
        instance_destroy()
    var npd = instance_create(650, 326, obj_popup_dialogue)
    npd.question = argument0
    keyboard_string = ""
    npd.inputing = ""
    npd.maximum = argument1
    npd.target = argument2
    npd.target2 = argument3
    npd.value_is_string = argument4
    npd.ischeatcode = argument5
}

