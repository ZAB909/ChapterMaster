function get_diag_string(question, maximum, target1, target2, value, cheat) 
{
    with (obj_popup_dialogue)
        instance_destroy()
    var newpopdialogue = instance_create(650, 326, obj_popup_dialogue)
    newpopdialogue.question = question
    keyboard_string = ""
    newpopdialogue.inputing = ""
    newpopdialogue.maximum = maximum
    newpopdialogue.target = target1
    newpopdialogue.target2 = target2
    newpopdialogue.value_is_string = value
    newpopdialogue.ischeatcode = cheat
}