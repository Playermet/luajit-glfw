# Features
 - Full support of 3.1.1 API (except native functions)
```lua
 -- Additional OO style for monitors, windows, and cursors
 glfw.ShowWindow(window)
 -- or
 window:Show()
```
```lua
 -- Constants can be used in two ways
 glfw.GetKey(window, GLFW.KEY_SPACE)
 -- or
 glfw.GetKey(window, 'KEY_SPACE')
```

# Example code
```lua
local glfw = require 'glfw' ('glfw3')

-- Initialize the library
if glfw.Init() == 0 then
  return
end

-- Create a windowed mode window and its OpenGL context
local window = glfw.CreateWindow(640, 480, "Hello World")
if window == 0 then
  glfw.Terminate()
  return
end

-- Make the window's context current
window:MakeContextCurrent()

-- Loop until the user closes the window
while window:ShouldClose() == 0 do
  -- Render here

  -- Swap front and back buffers
  window:SwapBuffers()

  -- Poll for and process events
  glfw.PollEvents()
end

glfw.Terminate()
```

# Differences from the C API
Binding is so close to the original API as possible, but some things still differ.
 1. Names lost 'glfw' prefix.
 2. Arrays of chars replaced by lua string (except joystick buttons).
 3. Arrays of structs and strings replaced by lua tables.
 4. Values returned by reference replaced by returning table or multiple results.
 5. Video mode returned as table. This may change in future if necessary.
 6. Some methods have shortened names.

Examples:
```lua
  local version = glfw.GetVersion()
  print(version.major, version.minor, version.rev)

  local monitors = glfw.GetMonitors()
  for i = 1, #monitors do ... end

  local x,y = glfw.GetMonitorPos(monitor)
  local x,y = monitor:get_pos()

  local w,h = glfw.GetMonitorPhysicalSize(monitor)
  local w,h = monitor:GetPhysicalSize()

  local modes = glfw.GetVideoModes(monitor)
  local modes = monitor:GetVideoModes()
  for i = 1, #modes do ... end

  local mode = glfw.GetVideoMode(monitor)
  local mode = monitor:GetVideoMode()
  for k,v in pairs(mode) do
    print(k,v)
  end

  local x,y = glfw.GetWindowPos(window)
  local x,y = window:GetPos()

  local fsize = glfw.GetWindowFrameSize(window)
  local fsize = window:GetFrameSize()
  print(fsize.left, fsize.top, fsize.right, fsize.bottom)

  local axes = glfw.GetJoystickAxes(joy)
  for i = 1, #axes do ... end

```
