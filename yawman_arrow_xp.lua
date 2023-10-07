function set_axis_assignments()
    set_axis_assignment(0, "Roll", "normal" )
    set_axis_assignment(1, "Pitch", "normal" )
    set_axis_assignment(4, "Yaw", "normal" )
    set_axis_assignment(5, "Throttle", "reverse" )
    set_axis_assignment(6, "Flaps", "normal" )
end 

--[[
You can button_sniffer.lua to find button numbers by pressing them
https://github.com/X-Friese/FlyWithLua/blob/master/FlyWithLua/Internals/button_sniffer.lua

button 0 - POV up 
button 1 - 
button 2 - POV right
button 3 - 
button 4 - POV down
button 5 -  
button 6 - POV left
button 7 - 
button 8 - joystick click 
button 9 - sixpack 1
button 10 - sixpack 2
button 11 - sixpack 3
button 12 - sixpack 4
button 13 - sixpack 5
button 14 - sixpack 6
button 15 - POV center 
button 16 - right bumper (*)
button 17 - dpad center (*) 
button 18 - left bumper (*)
button 19 - rotate wheel down (*)
button 20 - rotate wheel up  (*)
button 21 - dpad up (*)
button 22 - dpad left (*)
button 23 - dpad down (*)
button 24 - dpad right (*)
--]]

POV_UP = 0
POV_RIGHT = 2
POV_DOWN = 4
POV_LEFT = 6
THUMBSTICK_CLK = 8
SIXPACK_1 = 9
SIXPACK_2 = 10
SIXPACK_3 = 11
SIXPACK_4 = 12
SIXPACK_5 = 13
SIXPACK_6 = 14
POV_CENTER = 15
RIGHT_BUMPER = 16
DPAD_CENTER = 17
LEFT_BUMPER = 18
WHEEL_DOWN = 19
WHEEL_UP = 20
DPAD_UP = 21
DPAD_LEFT = 22
DPAD_DOWN = 23
DPAD_RIGHT = 24

function button_event_handler() 
    left_bumper = button(LEFT_BUMPER)
    right_bumper = button(RIGHT_BUMPER)
    
    -- PARKING BRAKES
    -- left and right bumper both pressed 
    if left_bumper and right_bumper then 
        set_button_assignment(RIGHT_BUMPER, "sim/flight_controls/brakes_toggle_max")
    else
        set_button_assignment(RIGHT_BUMPER, "sim/none/none")
    end 
    
    
    if left_bumper then 
        set_button_assignment(0, "sim/flight_controls/flaps_up")
        set_button_assignment(4, "sim/flight_controls/flaps_down") 
    elseif right_bumper_hold then 
        set_button_assignment(0, "sim/general/zoom_in")
        set_button_assignment(4, "sim/general/zoom_out")
    else
        set_button_assignment(0, "sim/flight_controls/pitch_trim_down")
        set_button_assignment(4, "sim/flight_controls/pitch_trim_up")
    end 
    
end 

function set_up_yawman_arrow() 
    clear_all_axis_assignments()
    clear_all_button_assignments()
    set_axis_assignments()
end 

do_every_draw("button_event_handler()")


add_macro("Initialize Arrow Multipress", "set_up_yawman_arrow()")