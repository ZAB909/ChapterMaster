var __b__;
__b__ = action_if_variable(cooldown, 0, 2);
if __b__
{
__b__ = action_if_variable(cooldown, 9000, 1);
if __b__
{
cooldown = 0;
}
}
mouse_left = 0;
__b__ = action_if_variable(scrollbar_engaged, 0, 2);
if __b__
{
scrollbar_engaged = 0;
}
