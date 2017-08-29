-----------------------------------------------------------
--  Binding for GLFW v3.2.0
-----------------------------------------------------------

--[[ LICENSE
  The MIT License (MIT)

  luajit-glfw - GLFW binding for LuaJIT

  Copyright (c) 2016 Playermet

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
]]

local ffi = require 'ffi'

local mod = {} -- Lua module namespace
local aux = {} -- Auxiliary utils

local args -- Arguments for binding
local clib -- C library namespace

local is_luajit = pcall(require, 'jit')


local load_clib, bind_clib -- Forward declaration

local function init(mod, name_or_args)
  if clib ~= nil then
    return mod
  end

  if type(name_or_args) == 'table' then
    args = name_or_args
    args.name = args.name or args[1]
  elseif type(name_or_args) == 'string' then
    args = {}
    args.name = name_or_args
  end

  clib = load_clib()
  bind_clib()

  return mod
end

function load_clib()
  if args.clib ~= nil then
    return args.clib
  end

  if type(args.name) == 'string' then
    if type(args.path) == 'string' then
      return ffi.load(package.searchpath(args.name, args.path))
    else
      return ffi.load(args.name)
    end
  end

  -- If no library or name is provided, we just
  -- assume that the appropriate GLFW libraries
  -- are statically linked to the calling program
  return ffi.C
end

function bind_clib()
  -----------------------------------------------------------
  --  Namespaces
  -----------------------------------------------------------
  local const = {} -- Table for contants
  local funcs = {} -- Table for functions
  local types = {} -- Table for types
  local cbs   = {} -- Table for callbacks

  mod.const = const
  mod.funcs = funcs
  mod.types = types
  mod.cbs   = cbs
  mod.clib  = clib

  -- Access to funcs from module namespace by default
  aux.set_mt_method(mod, '__index', funcs)

  -----------------------------------------------------------
  --  Constants
  -----------------------------------------------------------
  const.VERSION_MAJOR    = 3
  const.VERSION_MINOR    = 2
  const.VERSION_REVISION = 0

  const.TRUE  = 1
  const.FALSE = 0

  const.RELEASE = 0
  const.PRESS   = 1
  const.REPEAT  = 2

  const.KEY_UNKNOWN = -1

  const.KEY_SPACE         = 32
  const.KEY_APOSTROPHE    = 39
  const.KEY_COMMA         = 44
  const.KEY_MINUS         = 45
  const.KEY_PERIOD        = 46
  const.KEY_SLASH         = 47
  const.KEY_0             = 48
  const.KEY_1             = 49
  const.KEY_2             = 50
  const.KEY_3             = 51
  const.KEY_4             = 52
  const.KEY_5             = 53
  const.KEY_6             = 54
  const.KEY_7             = 55
  const.KEY_8             = 56
  const.KEY_9             = 57
  const.KEY_SEMICOLON     = 59
  const.KEY_EQUAL         = 61
  const.KEY_A             = 65
  const.KEY_B             = 66
  const.KEY_C             = 67
  const.KEY_D             = 68
  const.KEY_E             = 69
  const.KEY_F             = 70
  const.KEY_G             = 71
  const.KEY_H             = 72
  const.KEY_I             = 73
  const.KEY_J             = 74
  const.KEY_K             = 75
  const.KEY_L             = 76
  const.KEY_M             = 77
  const.KEY_N             = 78
  const.KEY_O             = 79
  const.KEY_P             = 80
  const.KEY_Q             = 81
  const.KEY_R             = 82
  const.KEY_S             = 83
  const.KEY_T             = 84
  const.KEY_U             = 85
  const.KEY_V             = 86
  const.KEY_W             = 87
  const.KEY_X             = 88
  const.KEY_Y             = 89
  const.KEY_Z             = 90
  const.KEY_LEFT_BRACKET  = 91
  const.KEY_BACKSLASH     = 92
  const.KEY_RIGHT_BRACKET = 93
  const.KEY_GRAVE_ACCENT  = 96
  const.KEY_WORLD_1       = 161
  const.KEY_WORLD_2       = 162

  const.KEY_ESCAPE        = 256
  const.KEY_ENTER         = 257
  const.KEY_TAB           = 258
  const.KEY_BACKSPACE     = 259
  const.KEY_INSERT        = 260
  const.KEY_DELETE        = 261
  const.KEY_RIGHT         = 262
  const.KEY_LEFT          = 263
  const.KEY_DOWN          = 264
  const.KEY_UP            = 265
  const.KEY_PAGE_UP       = 266
  const.KEY_PAGE_DOWN     = 267
  const.KEY_HOME          = 268
  const.KEY_END           = 269
  const.KEY_CAPS_LOCK     = 280
  const.KEY_SCROLL_LOCK   = 281
  const.KEY_NUM_LOCK      = 282
  const.KEY_PRINT_SCREEN  = 283
  const.KEY_PAUSE         = 284
  const.KEY_F1            = 290
  const.KEY_F2            = 291
  const.KEY_F3            = 292
  const.KEY_F4            = 293
  const.KEY_F5            = 294
  const.KEY_F6            = 295
  const.KEY_F7            = 296
  const.KEY_F8            = 297
  const.KEY_F9            = 298
  const.KEY_F10           = 299
  const.KEY_F11           = 300
  const.KEY_F12           = 301
  const.KEY_F13           = 302
  const.KEY_F14           = 303
  const.KEY_F15           = 304
  const.KEY_F16           = 305
  const.KEY_F17           = 306
  const.KEY_F18           = 307
  const.KEY_F19           = 308
  const.KEY_F20           = 309
  const.KEY_F21           = 310
  const.KEY_F22           = 311
  const.KEY_F23           = 312
  const.KEY_F24           = 313
  const.KEY_F25           = 314
  const.KEY_KP_0          = 320
  const.KEY_KP_1          = 321
  const.KEY_KP_2          = 322
  const.KEY_KP_3          = 323
  const.KEY_KP_4          = 324
  const.KEY_KP_5          = 325
  const.KEY_KP_6          = 326
  const.KEY_KP_7          = 327
  const.KEY_KP_8          = 328
  const.KEY_KP_9          = 329
  const.KEY_KP_DECIMAL    = 330
  const.KEY_KP_DIVIDE     = 331
  const.KEY_KP_MULTIPLY   = 332
  const.KEY_KP_SUBTRACT   = 333
  const.KEY_KP_ADD        = 334
  const.KEY_KP_ENTER      = 335
  const.KEY_KP_EQUAL      = 336
  const.KEY_LEFT_SHIFT    = 340
  const.KEY_LEFT_CONTROL  = 341
  const.KEY_LEFT_ALT      = 342
  const.KEY_LEFT_SUPER    = 343
  const.KEY_RIGHT_SHIFT   = 344
  const.KEY_RIGHT_CONTROL = 345
  const.KEY_RIGHT_ALT     = 346
  const.KEY_RIGHT_SUPER   = 347
  const.KEY_MENU          = 348

  const.KEY_LAST          = const.KEY_MENU

  const.MOD_SHIFT   = 0x0001
  const.MOD_CONTROL = 0x0002
  const.MOD_ALT     = 0x0004
  const.MOD_SUPER   = 0x0008

  const.MOUSE_BUTTON_1      = 0
  const.MOUSE_BUTTON_2      = 1
  const.MOUSE_BUTTON_3      = 2
  const.MOUSE_BUTTON_4      = 3
  const.MOUSE_BUTTON_5      = 4
  const.MOUSE_BUTTON_6      = 5
  const.MOUSE_BUTTON_7      = 6
  const.MOUSE_BUTTON_8      = 7
  const.MOUSE_BUTTON_LAST   = const.MOUSE_BUTTON_8
  const.MOUSE_BUTTON_LEFT   = const.MOUSE_BUTTON_1
  const.MOUSE_BUTTON_RIGHT  = const.MOUSE_BUTTON_2
  const.MOUSE_BUTTON_MIDDLE = const.MOUSE_BUTTON_3

  const.JOYSTICK_1    = 0
  const.JOYSTICK_2    = 1
  const.JOYSTICK_3    = 2
  const.JOYSTICK_4    = 3
  const.JOYSTICK_5    = 4
  const.JOYSTICK_6    = 5
  const.JOYSTICK_7    = 6
  const.JOYSTICK_8    = 7
  const.JOYSTICK_9    = 8
  const.JOYSTICK_10   = 9
  const.JOYSTICK_11   = 10
  const.JOYSTICK_12   = 11
  const.JOYSTICK_13   = 12
  const.JOYSTICK_14   = 13
  const.JOYSTICK_15   = 14
  const.JOYSTICK_16   = 15
  const.JOYSTICK_LAST = const.JOYSTICK_16

  const.NOT_INITIALIZED     = 0x00010001
  const.NO_CURRENT_CONTEXT  = 0x00010002
  const.INVALID_ENUM        = 0x00010003
  const.INVALID_VALUE       = 0x00010004
  const.OUT_OF_MEMORY       = 0x00010005
  const.API_UNAVAILABLE     = 0x00010006
  const.VERSION_UNAVAILABLE = 0x00010007
  const.PLATFORM_ERROR      = 0x00010008
  const.FORMAT_UNAVAILABLE  = 0x00010009
  const.NO_WINDOW_CONTEXT   = 0x0001000a

  const.FOCUSED      = 0x00020001
  const.ICONIFIED    = 0x00020002
  const.RESIZABLE    = 0x00020003
  const.VISIBLE      = 0x00020004
  const.DECORATED    = 0x00020005
  const.AUTO_ICONIFY = 0x00020006
  const.FLOATING     = 0x00020007
  const.MAXIMIZED    = 0x00020008

  const.RED_BITS         = 0x00021001
  const.GREEN_BITS       = 0x00021002
  const.BLUE_BITS        = 0x00021003
  const.ALPHA_BITS       = 0x00021004
  const.DEPTH_BITS       = 0x00021005
  const.STENCIL_BITS     = 0x00021006
  const.ACCUM_RED_BITS   = 0x00021007
  const.ACCUM_GREEN_BITS = 0x00021008
  const.ACCUM_BLUE_BITS  = 0x00021009
  const.ACCUM_ALPHA_BITS = 0x0002100a
  const.AUX_BUFFERS      = 0x0002100b
  const.STEREO           = 0x0002100c
  const.SAMPLES          = 0x0002100d
  const.SRGB_CAPABLE     = 0x0002100e
  const.REFRESH_RATE     = 0x0002100f
  const.DOUBLEBUFFER     = 0x00021010

  const.CLIENT_API               = 0x00022001
  const.CONTEXT_VERSION_MAJOR    = 0x00022002
  const.CONTEXT_VERSION_MINOR    = 0x00022003
  const.CONTEXT_REVISION         = 0x00022004
  const.CONTEXT_ROBUSTNESS       = 0x00022005
  const.OPENGL_FORWARD_COMPAT    = 0x00022006
  const.OPENGL_DEBUG_CONTEXT     = 0x00022007
  const.OPENGL_PROFILE           = 0x00022008
  const.CONTEXT_RELEASE_BEHAVIOR = 0x00022009
  const.CONTEXT_NO_ERROR         = 0x0002200a
  const.CONTEXT_CREATION_API     = 0x0002200b

  const.NO_API        = 0
  const.OPENGL_API    = 0x00030001
  const.OPENGL_ES_API = 0x00030002

  const.NO_ROBUSTNESS         = 0
  const.NO_RESET_NOTIFICATION = 0x00031001
  const.LOSE_CONTEXT_ON_RESET = 0x00031002

  const.OPENGL_ANY_PROFILE    = 0
  const.OPENGL_CORE_PROFILE   = 0x00032001
  const.OPENGL_COMPAT_PROFILE = 0x00032002

  const.CURSOR               = 0x00033001
  const.STICKY_KEYS          = 0x00033002
  const.STICKY_MOUSE_BUTTONS = 0x00033003

  const.CURSOR_NORMAL   = 0x00034001
  const.CURSOR_HIDDEN   = 0x00034002
  const.CURSOR_DISABLED = 0x00034003

  const.ANY_RELEASE_BEHAVIOR   = 0
  const.RELEASE_BEHAVIOR_FLUSH = 0x00035001
  const.RELEASE_BEHAVIOR_NONE  = 0x00035002

  const.NATIVE_CONTEXT_API = 0x00036001
  const.EGL_CONTEXT_API    = 0x00036002

  const.ARROW_CURSOR     = 0x00036001
  const.IBEAM_CURSOR     = 0x00036002
  const.CROSSHAIR_CURSOR = 0x00036003
  const.HAND_CURSOR      = 0x00036004
  const.HRESIZE_CURSOR   = 0x00036005
  const.VRESIZE_CURSOR   = 0x00036006

  const.CONNECTED    = 0x00040001
  const.DISCONNECTED = 0x00040002

  const.DONT_CARE = -1

  if not is_luajit then
    const.NULL = ffi.C.NULL
  end

  -----------------------------------------------------------
  --  Headers
  -----------------------------------------------------------
  ffi.cdef [[
    typedef void (*GLFWglproc)(void);
    typedef void (*GLFWvkproc)(void);

    typedef struct GLFWmonitor GLFWmonitor;
    typedef struct GLFWwindow GLFWwindow;
    typedef struct GLFWcursor GLFWcursor;

    typedef void (* GLFWerrorfun)(int,const char*);
    typedef void (* GLFWwindowposfun)(GLFWwindow*,int,int);
    typedef void (* GLFWwindowsizefun)(GLFWwindow*,int,int);
    typedef void (* GLFWwindowclosefun)(GLFWwindow*);
    typedef void (* GLFWwindowrefreshfun)(GLFWwindow*);
    typedef void (* GLFWwindowfocusfun)(GLFWwindow*,int);
    typedef void (* GLFWwindowiconifyfun)(GLFWwindow*,int);
    typedef void (* GLFWframebuffersizefun)(GLFWwindow*,int,int);
    typedef void (* GLFWmousebuttonfun)(GLFWwindow*,int,int,int);
    typedef void (* GLFWcursorposfun)(GLFWwindow*,double,double);
    typedef void (* GLFWcursorenterfun)(GLFWwindow*,int);
    typedef void (* GLFWscrollfun)(GLFWwindow*,double,double);
    typedef void (* GLFWkeyfun)(GLFWwindow*,int,int,int,int);
    typedef void (* GLFWcharfun)(GLFWwindow*,unsigned int);
    typedef void (* GLFWcharmodsfun)(GLFWwindow*,unsigned int,int);
    typedef void (* GLFWdropfun)(GLFWwindow*,int,const char**);
    typedef void (* GLFWmonitorfun)(GLFWmonitor*,int);
    typedef void (* GLFWjoystickfun)(int,int);

    typedef struct GLFWvidmode
    {
      int width;
      int height;
      int redBits;
      int greenBits;
      int blueBits;
      int refreshRate;
    } GLFWvidmode;

    typedef struct GLFWgammaramp
    {
      unsigned short* red;
      unsigned short* green;
      unsigned short* blue;
      unsigned int size;
    } GLFWgammaramp;

    typedef struct GLFWimage
    {
      int width;
      int height;
      unsigned char* pixels;
    } GLFWimage;

    int glfwInit(void);
    void glfwTerminate(void);
    void glfwGetVersion(int* major, int* minor, int* rev);
    const char* glfwGetVersionString(void);
    GLFWerrorfun glfwSetErrorCallback(GLFWerrorfun cbfun);
    GLFWmonitor** glfwGetMonitors(int* count);
    GLFWmonitor* glfwGetPrimaryMonitor(void);
    void glfwGetMonitorPos(GLFWmonitor* monitor, int* xpos, int* ypos);
    void glfwGetMonitorPhysicalSize(GLFWmonitor* monitor, int* widthMM, int* heightMM);
    const char* glfwGetMonitorName(GLFWmonitor* monitor);
    GLFWmonitorfun glfwSetMonitorCallback(GLFWmonitorfun cbfun);
    const GLFWvidmode* glfwGetVideoModes(GLFWmonitor* monitor, int* count);
    const GLFWvidmode* glfwGetVideoMode(GLFWmonitor* monitor);
    void glfwSetGamma(GLFWmonitor* monitor, float gamma);
    const GLFWgammaramp* glfwGetGammaRamp(GLFWmonitor* monitor);
    void glfwSetGammaRamp(GLFWmonitor* monitor, const GLFWgammaramp* ramp);
    void glfwDefaultWindowHints(void);
    void glfwWindowHint(int hint, int value);
    GLFWwindow* glfwCreateWindow(int width, int height, const char* title, GLFWmonitor* monitor, GLFWwindow* share);
    void glfwDestroyWindow(GLFWwindow* window);
    int glfwWindowShouldClose(GLFWwindow* window);
    void glfwSetWindowShouldClose(GLFWwindow* window, int value);
    void glfwSetWindowTitle(GLFWwindow* window, const char* title);
    void glfwSetWindowIcon(GLFWwindow* window, int count, const GLFWimage* images);
    void glfwGetWindowPos(GLFWwindow* window, int* xpos, int* ypos);
    void glfwSetWindowPos(GLFWwindow* window, int xpos, int ypos);
    void glfwGetWindowSize(GLFWwindow* window, int* width, int* height);
    void glfwSetWindowSizeLimits(GLFWwindow* window, int minwidth, int minheight, int maxwidth, int maxheight);
    void glfwSetWindowAspectRatio(GLFWwindow* window, int numer, int denom);
    void glfwSetWindowSize(GLFWwindow* window, int width, int height);
    void glfwGetFramebufferSize(GLFWwindow* window, int* width, int* height);
    void glfwGetWindowFrameSize(GLFWwindow* window, int* left, int* top, int* right, int* bottom);
    void glfwIconifyWindow(GLFWwindow* window);
    void glfwRestoreWindow(GLFWwindow* window);
    void glfwMaximizeWindow(GLFWwindow* window);
    void glfwShowWindow(GLFWwindow* window);
    void glfwHideWindow(GLFWwindow* window);
    void glfwFocusWindow(GLFWwindow* window);
    GLFWmonitor* glfwGetWindowMonitor(GLFWwindow* window);
    void glfwSetWindowMonitor(GLFWwindow* window, GLFWmonitor* monitor, int xpos, int ypos, int width, int height, int refreshRate);
    int glfwGetWindowAttrib(GLFWwindow* window, int attrib);
    void glfwSetWindowUserPointer(GLFWwindow* window, void* pointer);
    void* glfwGetWindowUserPointer(GLFWwindow* window);
    GLFWwindowposfun glfwSetWindowPosCallback(GLFWwindow* window, GLFWwindowposfun cbfun);
    GLFWwindowsizefun glfwSetWindowSizeCallback(GLFWwindow* window, GLFWwindowsizefun cbfun);
    GLFWwindowclosefun glfwSetWindowCloseCallback(GLFWwindow* window, GLFWwindowclosefun cbfun);
    GLFWwindowrefreshfun glfwSetWindowRefreshCallback(GLFWwindow* window, GLFWwindowrefreshfun cbfun);
    GLFWwindowfocusfun glfwSetWindowFocusCallback(GLFWwindow* window, GLFWwindowfocusfun cbfun);
    GLFWwindowiconifyfun glfwSetWindowIconifyCallback(GLFWwindow* window, GLFWwindowiconifyfun cbfun);
    GLFWframebuffersizefun glfwSetFramebufferSizeCallback(GLFWwindow* window, GLFWframebuffersizefun cbfun);
    void glfwPollEvents(void);
    void glfwWaitEvents(void);
    void glfwWaitEventsTimeout(double timeout);
    void glfwPostEmptyEvent(void);
    int glfwGetInputMode(GLFWwindow* window, int mode);
    void glfwSetInputMode(GLFWwindow* window, int mode, int value);
    const char* glfwGetKeyName(int key, int scancode);
    int glfwGetKey(GLFWwindow* window, int key);
    int glfwGetMouseButton(GLFWwindow* window, int button);
    void glfwGetCursorPos(GLFWwindow* window, double* xpos, double* ypos);
    void glfwSetCursorPos(GLFWwindow* window, double xpos, double ypos);
    GLFWcursor* glfwCreateCursor(const GLFWimage* image, int xhot, int yhot);
    GLFWcursor* glfwCreateStandardCursor(int shape);
    void glfwDestroyCursor(GLFWcursor* cursor);
    void glfwSetCursor(GLFWwindow* window, GLFWcursor* cursor);
    GLFWkeyfun glfwSetKeyCallback(GLFWwindow* window, GLFWkeyfun cbfun);
    GLFWcharfun glfwSetCharCallback(GLFWwindow* window, GLFWcharfun cbfun);
    GLFWcharmodsfun glfwSetCharModsCallback(GLFWwindow* window, GLFWcharmodsfun cbfun);
    GLFWmousebuttonfun glfwSetMouseButtonCallback(GLFWwindow* window, GLFWmousebuttonfun cbfun);
    GLFWcursorposfun glfwSetCursorPosCallback(GLFWwindow* window, GLFWcursorposfun cbfun);
    GLFWcursorenterfun glfwSetCursorEnterCallback(GLFWwindow* window, GLFWcursorenterfun cbfun);
    GLFWscrollfun glfwSetScrollCallback(GLFWwindow* window, GLFWscrollfun cbfun);
    GLFWdropfun glfwSetDropCallback(GLFWwindow* window, GLFWdropfun cbfun);
    int glfwJoystickPresent(int joy);
    const float* glfwGetJoystickAxes(int joy, int* count);
    const unsigned char* glfwGetJoystickButtons(int joy, int* count);
    const char* glfwGetJoystickName(int joy);
    GLFWjoystickfun glfwSetJoystickCallback(GLFWjoystickfun cbfun);
    void glfwSetClipboardString(GLFWwindow* window, const char* string);
    const char* glfwGetClipboardString(GLFWwindow* window);
    double glfwGetTime(void);
    void glfwSetTime(double time);
    uint64_t glfwGetTimerValue(void);
    uint64_t glfwGetTimerFrequency(void);
    void glfwMakeContextCurrent(GLFWwindow* window);
    GLFWwindow* glfwGetCurrentContext(void);
    void glfwSwapBuffers(GLFWwindow* window);
    void glfwSwapInterval(int interval);
    int glfwExtensionSupported(const char* extension);
    GLFWglproc glfwGetProcAddress(const char* procname);
  ]]

  if args.bind_vulkan == true then
    ffi.cdef [[
      int glfwVulkanSupported(void);
      const char** glfwGetRequiredInstanceExtensions(uint32_t* count);
      GLFWvkproc glfwGetInstanceProcAddress(VkInstance instance, const char* procname);
      int glfwGetPhysicalDevicePresentationSupport(VkInstance instance, VkPhysicalDevice device, uint32_t queuefamily);
      VkResult glfwCreateWindowSurface(VkInstance instance, GLFWwindow* window, const VkAllocationCallbacks* allocator, VkSurfaceKHR* surface);
    ]]
  end

  -----------------------------------------------------------
  --  Functions wrappers
  -----------------------------------------------------------
  function funcs.Init()
    return clib.glfwInit()
  end

  function funcs.Terminate()
    clib.glfwTerminate()
  end

  function funcs.GetVersion()
    local major = ffi.new('int[1]')
    local minor = ffi.new('int[1]')
    local rev   = ffi.new('int[1]')

    clib.glfwGetVersion(major, minor, rev)

    local version = {
      major = major[0],
      minor = minor[0],
      rev   = rev[0]
    }

    return version
  end

  function funcs.GetVersionString()
    return ffi.string(clib.glfwGetVersionString())
  end

  function funcs.SetErrorCallback(cbfun)
    cbfun = aux.wrap_cb(cbs, cbfun, 'errorfun')
    return clib.glfwSetErrorCallback(cbfun)
  end

  function funcs.GetMonitors(monitors)
    local count = ffi.new('int[1]')
    local cmonitors = clib.glfwGetMonitors(count)

    monitors = monitors or {}
    for i = 1, count do
      monitors[i] = cmonitors[i - 1]
    end

    return monitors
  end

  function funcs.GetPrimaryMonitor()
    return clib.glfwGetPrimaryMonitor()
  end

  function funcs.GetMonitorPos(monitor)
    local xpos = ffi.new('int[1]')
    local ypos = ffi.new('int[1]')

    clib.glfwGetMonitorPos(monitor, xpos, ypos)

    return xpos[0], ypos[0]
  end

  function funcs.GetMonitorPhysicalSize(monitor)
    local width = ffi.new('int[1]')
    local height = ffi.new('int[1]')

    clib.glfwGetMonitorPhysicalSize(monitor, width, height)

    return width[0], height[0]
  end

  function funcs.GetMonitorName(monitor)
    return aux.string_or_nil(clib.glfwGetMonitorName(monitor))
  end

  function funcs.SetMonitorCallback(cbfun)
    cbfun = aux.wrap_cb(cbs, cbfun, 'monitorfun')
    return clib.glfwSetMonitorCallback(cbfun)
  end

  function funcs.GetVideoModes(monitor, modes)
    local count = ffi.new('int[1]')
    local cmodes = clib.glfwGetVideoModes(monitor, count)

    modes = modes or {}
    for i = 0, count - 1 do
      modes[i + 1] = {
        width       = cmodes[i].width;
        height      = cmodes[i].height;
        redBits     = cmodes[i].redBits;
        greenBits   = cmodes[i].greenBits;
        blueBits    = cmodes[i].blueBits;
        refreshRate = cmodes[i].refreshRate;
      }
    end

    return modes
  end

  function funcs.GetVideoMode(monitor)
    local cmode = clib.glfwGetVideoMode(monitor)

    local mode = {
      width       = cmode.width;
      height      = cmode.height;
      redBits     = cmode.redBits;
      greenBits   = cmode.greenBits;
      blueBits    = cmode.blueBits;
      refreshRate = cmode.refreshRate;
    }

    return mode
  end

  function funcs.SetGamma(monitor, gamma)
    clib.glfwSetGamma(monitor, gamma)
  end

  function funcs.GetGammaRamp(monitor)
    return clib.glfwGetGammaRamp(monitor)
  end

  function funcs.SetGammaRamp(monitor, ramp)
    clib.glfwSetGammaRamp(monitor, ramp)
  end

  function funcs.DefaultWindowHints()
    clib.glfwDefaultWindowHints()
  end

  function funcs.WindowHint(hint, value)
    clib.glfwWindowHint(aux.get_const(const, hint), aux.get_const(const, value))
  end

  function funcs.CreateWindow(width, height, title, monitor, share)
    return clib.glfwCreateWindow(width, height, title, monitor, share)
  end

  function funcs.DestroyWindow(window)
    clib.glfwDestroyWindow(window)
  end

  function funcs.WindowShouldClose(window)
    return clib.glfwWindowShouldClose(window)
  end

  function funcs.SetWindowShouldClose(window, value)
    clib.glfwSetWindowShouldClose(window, value)
  end

  function funcs.SetWindowTitle(window, title)
    clib.glfwSetWindowTitle(window, title)
  end

  function funcs.SetWindowIcon(window, images)
    local cimages = ffi.new('GLFWimage[?]', #images)

    for i = 1, #images do
      cimages[i - 1] = images[i]
    end

    clib.glfwSetWindowIcon(window, #images, cimages)
  end

  function funcs.GetWindowPos(window)
    local xpos = ffi.new('int[1]')
    local ypos = ffi.new('int[1]')

    clib.glfwGetWindowPos(window, xpos, ypos)

    return xpos[0], ypos[0]
  end

  function funcs.SetWindowPos(window, xpos, ypos)
    clib.glfwSetWindowPos(window, xpos, ypos)
  end

  function funcs.GetWindowSize(window)
    local width = ffi.new('int[1]')
    local height = ffi.new('int[1]')

    clib.glfwGetWindowSize(window, width, height)

    return width[0], height[0]
  end

  function funcs.SetWindowSizeLimits(window, minwidth, minheight, maxwidth, maxheight)
    clib.glfwSetWindowSizeLimits(window, minwidth, minheight, maxwidth, maxheight)
  end

  function funcs.SetWindowAspectRatio(window, numer, denom)
    clib.glfwSetWindowAspectRatio(window, numer, denom)
  end

  function funcs.SetWindowSize(window, width, height)
    clib.glfwSetWindowSize(window, width, height)
  end

  function funcs.GetFramebufferSize(window)
    local width = ffi.new('int[1]')
    local height = ffi.new('int[1]')

    clib.glfwGetFramebufferSize(window, width, height)

    return width[0], height[0]
  end

  function funcs.GetWindowFrameSize(window, out)
    local left   = ffi.new('int[1]')
    local top    = ffi.new('int[1]')
    local right  = ffi.new('int[1]')
    local bottom = ffi.new('int[1]')

    clib.glfwGetWindowFrameSize(window, left, top, right, bottom)

    out = out or {}
    out.left   = left[0]
    out.top    = top[0]
    out.right  = right[0]
    out.bottom = bottom[0]

    return out
  end

  function funcs.IconifyWindow(window)
    clib.glfwIconifyWindow(window)
  end

  function funcs.RestoreWindow(window)
    clib.glfwRestoreWindow(window)
  end

  function funcs.MaximizeWindow(window)
    clib.glfwMaximizeWindow(window)
  end

  function funcs.ShowWindow(window)
    clib.glfwShowWindow(window)
  end

  function funcs.HideWindow(window)
    clib.glfwHideWindow(window)
  end

  function funcs.FocusWindow(window)
    clib.glfwFocusWindow(window)
  end

  function funcs.GetWindowMonitor(window)
    return clib.glfwGetWindowMonitor(window)
  end

  function funcs.SetWindowMonitor(window, monitor, xpos, ypos, width, height, refreshRate)
    clib.glfwSetWindowMonitor(window, monitor, xpos, ypos, width, height, refreshRate)
  end

  function funcs.GetWindowAttrib(window, attrib)
    return clib.glfwGetWindowAttrib(window, aux.get_const(const, attrib))
  end

  function funcs.SetWindowUserPointer(window, pointer)
    clib.glfwSetWindowUserPointer(window, pointer)
  end

  function funcs.GetWindowUserPointer(window)
    return clib.glfwGetWindowUserPointer(window)
  end

  function funcs.SetWindowPosCallback(window, cbfun)
    cbfun = aux.wrap_cb(cbs, cbfun, 'windowposfun')
    return clib.glfwSetWindowPosCallback(window, cbfun)
  end

  function funcs.SetWindowSizeCallback(window, cbfun)
    cbfun = aux.wrap_cb(cbs, cbfun, 'windowsizefun')
    return clib.glfwSetWindowSizeCallback(window, cbfun)
  end

  function funcs.SetWindowCloseCallback(window, cbfun)
    cbfun = aux.wrap_cb(cbs, cbfun, 'windowclosefun')
    return clib.glfwSetWindowCloseCallback(window, cbfun)
  end

  function funcs.SetWindowRefreshCallback(window, cbfun)
    cbfun = aux.wrap_cb(cbs, cbfun, 'windowrefreshfun')
    return clib.glfwSetWindowRefreshCallback(window, cbfun)
  end

  function funcs.SetWindowFocusCallback(window, cbfun)
    cbfun = aux.wrap_cb(cbs, cbfun, 'windowfocusfun')
    return clib.glfwSetWindowFocusCallback(window, cbfun)
  end

  function funcs.SetWindowIconifyCallback(window, cbfun)
    cbfun = aux.wrap_cb(cbs, cbfun, 'windowiconifyfun')
    return clib.glfwSetWindowIconifyCallback(window, cbfun)
  end

  function funcs.SetFramebufferSizeCallback(window, cbfun)
    cbfun = aux.wrap_cb(cbs, cbfun, 'framebuffersizefun')
    return clib.glfwSetFramebufferSizeCallback(window, cbfun)
  end

  function funcs.PollEvents()
    clib.glfwPollEvents()
  end

  function funcs.WaitEvents()
    clib.glfwWaitEvents()
  end

  function funcs.WaitEventsTimeout(timeout)
    clib.glfwWaitEventsTimeout(timeout)
  end

  function funcs.PostEmptyEvent()
    clib.glfwPostEmptyEvent()
  end

  function funcs.GetInputMode(window, mode)
    return clib.glfwGetInputMode(window, aux.get_const(const, mode))
  end

  function funcs.SetInputMode(window, mode, value)
    clib.glfwSetInputMode(window, aux.get_const(const, mode), value)
  end

  function funcs.GetKeyName(key, scancode)
    return aux.string_or_nil(clib.glfwGetKeyName(key, scancode))
  end

  function funcs.GetKey(window, key)
    return clib.glfwGetKey(window, aux.get_const(const, key))
  end

  function funcs.GetMouseButton(window, button)
    return clib.glfwGetMouseButton(window, aux.get_const(const, button))
  end

  function funcs.GetCursorPos(window)
    local xpos = ffi.new('int[1]')
    local ypos = ffi.new('int[1]')

    clib.glfwGetCursorPos(window, xpos, ypos)

    return xpos[0], ypos[0]
  end

  function funcs.SetCursorPos(window, xpos, ypos)
    clib.glfwSetCursorPos(window, xpos, ypos)
  end

  function funcs.CreateCursor(image, xhot, yhot)
    return clib.glfwCreateCursor(image, xhot, yhot)
  end

  function funcs.CreateStandardCursor(shape)
    return clib.glfwCreateStandardCursor(aux.get_const(const, shape))
  end

  function funcs.DestroyCursor(cursor)
    clib.glfwDestroyCursor(cursor)
  end

  function funcs.SetCursor(window, cursor)
    clib.glfwSetCursor(window, cursor)
  end

  function funcs.SetKeyCallback(window, cbfun)
    cbfun = aux.wrap_cb(cbs, cbfun, 'keyfun')
    return clib.glfwSetKeyCallback(window, cbfun)
  end

  function funcs.SetCharCallback(window, cbfun)
    cbfun = aux.wrap_cb(cbs, cbfun, 'charfun')
    return clib.glfwSetCharCallback(window, cbfun)
  end

  function funcs.SetCharModsCallback(window, cbfun)
    cbfun = aux.wrap_cb(cbs, cbfun, 'charmodsfun')
    return clib.glfwSetCharModsCallback(window, cbfun)
  end

  function funcs.SetMouseButtonCallback(window, cbfun)
    cbfun = aux.wrap_cb(cbs, cbfun, 'mousebuttonfun')
    return clib.glfwSetMouseButtonCallback(window, cbfun)
  end

  function funcs.SetCursorPosCallback(window, cbfun)
    cbfun = aux.wrap_cb(cbs, cbfun, 'cursorposfun')
    return clib.glfwSetCursorPosCallback(window, cbfun)
  end

  function funcs.SetCursorEnterCallback(window, cbfun)
    cbfun = aux.wrap_cb(cbs, cbfun, 'cursorenterfun')
    return clib.glfwSetCursorEnterCallback(window, cbfun)
  end

  function funcs.SetScrollCallback(window, cbfun)
    cbfun = aux.wrap_cb(cbs, cbfun, 'scrollfun')
    return clib.glfwSetScrollCallback(window, cbfun)
  end

  function funcs.SetDropCallback(window, cbfun)
    cbfun = aux.wrap_cb(cbs, cbfun, 'dropfun_raw')
    return clib.glfwSetDropCallback(window, cbfun)
  end

  function funcs.JoystickPresent(joy)
    return clib.glfwJoystickPresent(aux.get_const(const, joy))
  end

  function funcs.GetJoystickAxes(joy, axes)
    local count = ffi.new('int[1]')
    local caxes = clib.glfwGetJoystickAxes(aux.get_const(const, joy), count)

    axes = axes or {}
    for i = 1, count do
      axes[i] = caxes[i - 1]
    end

    return axes
  end

  function funcs.GetJoystickButtons(joy, buttons)
    local count = ffi.new('int[1]')
    local cbuttons = clib.glfwGetJoystickButtons(aux.get_const(const, joy), count)

    buttons = buttons or {}
    for i = 1, count do
      buttons[i] = cbuttons[i - 1]
    end

    return buttons
  end

  function funcs.GetJoystickName(joy)
    return aux.string_or_nil(clib.glfwGetJoystickName(aux.get_const(const, joy)))
  end

  function funcs.SetJoystickCallback(cbfun)
    cbfun = aux.wrap_cb(cbs, cbfun, 'joystickfun')
    return clib.glfwSetJoystickCallback(cbfun)
  end

  function funcs.SetClipboardString(window, string)
    clib.glfwSetClipboardString(window, string)
  end

  function funcs.GetClipboardString(window)
    return aux.string_or_nil(clib.glfwGetClipboardString(window))
  end

  function funcs.GetTime()
    return clib.glfwGetTime()
  end

  function funcs.SetTime(time)
    clib.glfwSetTime(time)
  end

  function funcs.GetTimerValue()
    return clib.glfwGetTimerValue()
  end

  function funcs.GetTimerFrequency()
    return clib.glfwGetTimerFrequency()
  end

  function funcs.MakeContextCurrent(window)
    clib.glfwMakeContextCurrent(window)
  end

  function funcs.GetCurrentContext()
    return clib.glfwGetCurrentContext()
  end

  function funcs.SwapBuffers(window)
    clib.glfwSwapBuffers(window)
  end

  function funcs.SwapInterval(interval)
    clib.glfwSwapInterval(interval)
  end

  function funcs.ExtensionSupported(extension)
    return clib.glfwExtensionSupported(extension)
  end

  function funcs.GetProcAddress(procname)
    return clib.glfwGetProcAddress(procname)
  end

  if args.bind_vulkan == true then
    function funcs.VulkanSupported()
      return clib.glfwVulkanSupported()
    end

    function funcs.GetRequiredInstanceExtensions(extensions)
      local count = ffi.new('uint32_t[1]')
      local cextensions = clib.glfwGetRequiredInstanceExtensions(count)

      extensions = extensions or {}
      for i = 1, count do
        extensions[i] = ffi.string(cextensions[i - 1])
      end

      return extensions
    end

    function funcs.glfwGetInstanceProcAddress(instance, procname)
      return clib.glfwVulkanSupported(instance, procname)
    end

    function funcs.GetPhysicalDevicePresentationSupport(instance, device, queuefamily)
      return clib.glfwGetPhysicalDevicePresentationSupport(instance, device, queuefamily)
    end

    function funcs.CreateWindowSurface(instance, window, allocator, surface)
      return clib.glfwCreateWindowSurface(instance, window, allocator, surface)
    end
  end

  do
    -- Luajit does not allow to call Lua-callbacks
    -- from JIT-compiled C-functions, so we
    -- manually turn off JIT for them
    local is_luajit, jit = pcall(require, 'jit')
    if is_luajit then
      jit.off(funcs.PollEvents)
      jit.off(funcs.WaitEvents)
      jit.off(funcs.WaitEventsTimeout)
    end
  end

  -----------------------------------------------------------
  --  Extra functions
  -----------------------------------------------------------
  function funcs.WindowHints(hints)
    for hint,value in pairs(hints) do
      funcs.WindowHint(hint, value)
    end
  end

  function funcs.CreateImage(width, height)
    local image = ffi.new('GLFWimage')

    -- Allocate pixels if size specified
    if type(width) == 'number' and type(height) == 'number' then
      image.width  = width
      image.height = height
      image.pixels = ffi.new('unsigned char[?]', width * height * 4)
    end

    return image
  end


  -----------------------------------------------------------
  --  Types
  -----------------------------------------------------------
  local monitor_mt           = aux.class()
  monitor_mt.GetPos          = funcs.GetMonitorPos
  monitor_mt.GetPhysicalSize = funcs.GetMonitorPhysicalSize
  monitor_mt.GetName         = funcs.GetMonitorName
  monitor_mt.GetVideoModes   = funcs.GetVideoModes
  monitor_mt.GetVideoMode    = funcs.GetVideoMode
  monitor_mt.SetGamma        = funcs.SetGamma
  monitor_mt.GetGammaRamp    = funcs.GetGammaRamp
  monitor_mt.SetGammaRamp    = funcs.SetGammaRamp

  local window_mt                      = aux.class()
  window_mt.Destroy                    = funcs.DestroyWindow
  window_mt.ShouldClose                = funcs.WindowShouldClose
  window_mt.SetShouldClose             = funcs.SetWindowShouldClose
  window_mt.SetTitle                   = funcs.SetWindowTitle
  window_mt.SetIcon                    = funcs.SetWindowIcon
  window_mt.GetPos                     = funcs.GetWindowPos
  window_mt.SetPos                     = funcs.SetWindowPos
  window_mt.GetSize                    = funcs.GetWindowSize
  window_mt.SetSizeLimits              = funcs.SetWindowSizeLimits
  window_mt.SetAspectRatio             = funcs.SetWindowAspectRatio
  window_mt.SetSize                    = funcs.SetWindowSize
  window_mt.GetFramebufferSize         = funcs.GetFramebufferSize
  window_mt.GetFrameSize               = funcs.GetWindowFrameSize
  window_mt.Iconify                    = funcs.IconifyWindow
  window_mt.Restore                    = funcs.RestoreWindow
  window_mt.Maximize                   = funcs.MaximizeWindow
  window_mt.Show                       = funcs.ShowWindow
  window_mt.Hide                       = funcs.HideWindow
  window_mt.Focus                      = funcs.FocusWindow
  window_mt.GetMonitor                 = funcs.GetWindowMonitor
  window_mt.SetMonitor                 = funcs.SetWindowMonitor
  window_mt.GetAttrib                  = funcs.GetWindowAttrib
  window_mt.SetUserPointer             = funcs.SetWindowUserPointer
  window_mt.GetUserPointer             = funcs.GetWindowUserPointer
  window_mt.SetPosCallback             = funcs.SetWindowPosCallback
  window_mt.SetSizeCallback            = funcs.SetWindowSizeCallback
  window_mt.SetCloseCallback           = funcs.SetWindowCloseCallback
  window_mt.SetRefreshCallback         = funcs.SetWindowRefreshCallback
  window_mt.SetFocusCallback           = funcs.SetWindowFocusCallback
  window_mt.SetIconifyCallback         = funcs.SetWindowIconifyCallback
  window_mt.SetFramebufferSizeCallback = funcs.SetFramebufferSizeCallback
  window_mt.GetInputMode               = funcs.GetInputMode
  window_mt.SetInputMode               = funcs.SetInputMode
  window_mt.GetKey                     = funcs.GetKey
  window_mt.GetMouseButton             = funcs.GetMouseButton
  window_mt.GetCursorPos               = funcs.GetCursorPos
  window_mt.SetCursorPos               = funcs.SetCursorPos
  window_mt.SetCursor                  = funcs.SetCursor
  window_mt.SetKeyCallback             = funcs.SetKeyCallback
  window_mt.SetCharCallback            = funcs.SetCharCallback
  window_mt.SetCharModsCallback        = funcs.SetCharModsCallback
  window_mt.SetMouseButtonCallback     = funcs.SetMouseButtonCallback
  window_mt.SetCursorPosCallback       = funcs.SetCursorPosCallback
  window_mt.SetCursorEnterCallback     = funcs.SetCursorEnterCallback
  window_mt.SetScrollCallback          = funcs.SetScrollCallback
  window_mt.SetDropCallback            = funcs.SetDropCallback
  window_mt.SetClipboardString         = funcs.SetClipboardString
  window_mt.GetClipboardString         = funcs.GetClipboardString
  window_mt.MakeContextCurrent         = funcs.MakeContextCurrent
  window_mt.SwapBuffers                = funcs.SwapBuffers

  local cursor_mt   = aux.class()
  cursor_mt.Destroy = funcs.DestroyCursor

  ffi.metatype('GLFWmonitor', monitor_mt)
  ffi.metatype('GLFWwindow',  window_mt)
  ffi.metatype('GLFWcursor',  cursor_mt)

  types.image = ffi.typeof('GLFWimage')

  -----------------------------------------------------------
  --  Callbacks wrappers
  -----------------------------------------------------------
  cbs.errorfun_raw = ffi.typeof('GLFWerrorfun')
  function cbs.errorfun(func)
    return cbs.errorfun_raw(function(error, description)
      func(error, ffi.string(description))
    end)
  end

  cbs.dropfun_raw = ffi.typeof('GLFWdropfun')
  function cbs.dropfun(func)
    return cbs.dropfun_raw(function(window, count, names)
      local t = {}
      for i = 1, count do
        t[i] = ffi.string(names[i - 1])
      end
      func(window, t)
    end)
  end

  cbs.windowposfun       = ffi.typeof('GLFWwindowposfun')
  cbs.windowsizefun      = ffi.typeof('GLFWwindowsizefun')
  cbs.windowclosefun     = ffi.typeof('GLFWwindowclosefun')
  cbs.windowrefreshfun   = ffi.typeof('GLFWwindowrefreshfun')
  cbs.windowfocusfun     = ffi.typeof('GLFWwindowfocusfun')
  cbs.windowiconifyfun   = ffi.typeof('GLFWwindowiconifyfun')
  cbs.framebuffersizefun = ffi.typeof('GLFWframebuffersizefun')
  cbs.mousebuttonfun     = ffi.typeof('GLFWmousebuttonfun')
  cbs.cursorposfun       = ffi.typeof('GLFWcursorposfun')
  cbs.cursorenterfun     = ffi.typeof('GLFWcursorenterfun')
  cbs.scrollfun          = ffi.typeof('GLFWscrollfun')
  cbs.keyfun             = ffi.typeof('GLFWkeyfun')
  cbs.charfun            = ffi.typeof('GLFWcharfun')
  cbs.charmodsfun        = ffi.typeof('GLFWcharmodsfun')
  cbs.monitorfun         = ffi.typeof('GLFWmonitorfun')
  cbs.joystickfun        = ffi.typeof('GLFWjoystickfun')
end

-----------------------------------------------------------
--  Auxiliary
-----------------------------------------------------------
function aux.get_const(const, value)
  local vtype = type(value)

  if vtype == 'number' then
    return value
  end

  if vtype == 'string' then
    if const[value] then
      return const[value]
    else
      error('unknown const name', 3)
    end
  end

  error('bad const type', 3)
end

function aux.class()
  local class = {}
  class.__index = class
  return class
end

function aux.wrap_cb(cbs, cbfun, cbname)
  if type(cbfun) == 'function' then
    return cbs[cbname](cbfun)
  end
  return cbfun
end

function aux.set_mt_method(t,k,v)
  local mt = getmetatable(t)
  if mt then
    mt[k] = v
  else
    setmetatable(t, { [k] = v })
  end
end

if is_luajit then
  -- LuaJIT way to compare with NULL
  function aux.is_null(ptr)
    return ptr == nil
  end
else
  -- LuaFFI way to compare with NULL
  function aux.is_null(ptr)
    return ptr == ffi.C.NULL
  end
end

function aux.string_or_nil(cstr)
  if not aux.is_null(cstr) then
    return ffi.string(cstr)
  end
  return nil
end


return setmetatable(mod, { __call = init })
