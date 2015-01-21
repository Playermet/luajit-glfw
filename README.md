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
