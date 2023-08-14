if (global.cheat_debug == 1)
{
    var i = 0
    repeat (30)
    {
        i += 1
        if (_message[i] != "")
            show_message(string(_message[i]))
    }
}
