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
