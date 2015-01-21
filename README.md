# Features
 - Full support of 3.1.0 API (except native functions)
```lua
 -- Optional OO style for monitors, windows, and cursors
 glfw.show_window(window)
 -- or
 window:show()
```
```lua
 -- Constants can be used in two ways
 glfw.get_key(window, glfw.const.key_space)
 -- or
 glfw.get_key(window, 'key_space')
```

# Example code
```lua
local glfw = require 'glfw' ('glfw3')

-- Initialize the library
if glfw.init() == 0 then
	return
end

-- Create a windowed mode window and its OpenGL context
local window = glfw.create_window(640, 480, "Hello World")
if window == 0 then
	glfw.terminate()
end

-- Make the window's context current
window:make_context_current()

-- Loop until the user closes the window
while window:should_close() == 0 do
	-- Render here

	-- Swap front and back buffers
	window:swap_buffers()

	-- Poll for and process events
	glfw.poll_events()
end

glfw.terminate()
```

# Differences from the C API
Bind is so close to the original API as possible, but some things still differ.
 1. Names converted to snake_case and lost 'glfw' prefix as not needed.
 2. Arrays of chars replaced by lua string (except joystick buttons).
 3. Arrays of structs replaced by lua tables.
 4. Values returned by reference replaced by returning table or multiple results.
 5. Some methods have shortened names.
 6. Video mode returned as table. This may change in future if necessary.

Examples:
```lua
  local version = glfw.get_version()
  print(version.major, version.minor, version.rev)

  local monitors = glfw.get_monitors()
  for i = 1, #monitors do ... end

  local x,y = glfw.get_monitor_pos(monitor)
  local x,y = monitor:get_pos()

  local w,h = glfw.get_monitor_physical_size(monitor)
  local w,h = monitor:get_physical_size()

  local modes = glfw.get_video_modes(monitor)
  local modes = monitor:get_video_modes()
  for i = 1, #modes do ... end

  local mode = glfw.get_video_mode(monitor)
  local mode = monitor:get_video_mode()
  for k,v in pairs(mode) do
    print(k,v)
  end

  local x,y = glfw.get_window_pos(window)
  local x,y = window:get_pos()

  local fsize = glfw.get_window_frame_size(window)
  local fsize = window:get_frame_size()
  print(fsize.left, fsize.top, fsize.right, fsize.bottom)

  local axes = glfw.get_joystick_axes(joy)
  for i = 1, #axes do ... end

```
