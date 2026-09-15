function scr_event_log(event_colour, event_text, target = noone) {
    LOGGER.info($"Adding event to log: {event_text}");
    if (instance_exists(obj_event_log)) {
        var new_event = {
            colour: event_colour, // takes green, yellow, red, purple, default GM colorcodes(with c_ prefix), decimal, hexadecimal(with $ prefix, 6 or 8 digits) and CSS(with # prefix)
            turn: obj_controller.turn,
            date: obj_ini.sector_handler.date(),
            text: event_text,
            event_target: target,
        };
        array_insert(obj_event_log.event, 0, new_event);
    }
}
