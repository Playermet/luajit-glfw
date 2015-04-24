-----------------------------------------------------------
--  Binding for GLFW v3.1.1
-----------------------------------------------------------
local ffi = require 'ffi'
local jit = require 'jit'


local const = {}

const.VERSION_MAJOR    = 3
const.VERSION_MINOR    = 1
const.VERSION_REVISION = 0

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

const.FOCUSED      = 0x00020001
const.ICONIFIED    = 0x00020002
const.RESIZABLE    = 0x00020003
const.VISIBLE      = 0x00020004
const.DECORATED    = 0x00020005
const.AUTO_ICONIFY = 0x00020006
const.FLOATING     = 0x00020007

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

const.ARROW_CURSOR     = 0x00036001
const.IBEAM_CURSOR     = 0x00036002
const.CROSSHAIR_CURSOR = 0x00036003
const.HAND_CURSOR      = 0x00036004
const.HRESIZE_CURSOR   = 0x00036005
const.VRESIZE_CURSOR   = 0x00036006

const.CONNECTED    = 0x00040001
const.DISCONNECTED = 0x00040002

const.DONT_CARE = -1


local function get_const(value)
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


local header = [[
  typedef void (*GLFWglproc)(void);

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
  void glfwWindowHint(int target, int hint);
  GLFWwindow* glfwCreateWindow(int width, int height, const char* title, GLFWmonitor* monitor, GLFWwindow* share);
  void glfwDestroyWindow(GLFWwindow* window);
  int glfwWindowShouldClose(GLFWwindow* window);
  void glfwSetWindowShouldClose(GLFWwindow* window, int value);
  void glfwSetWindowTitle(GLFWwindow* window, const char* title);
  void glfwGetWindowPos(GLFWwindow* window, int* xpos, int* ypos);
  void glfwSetWindowPos(GLFWwindow* window, int xpos, int ypos);
  void glfwGetWindowSize(GLFWwindow* window, int* width, int* height);
  void glfwSetWindowSize(GLFWwindow* window, int width, int height);
  void glfwGetFramebufferSize(GLFWwindow* window, int* width, int* height);
  void glfwGetWindowFrameSize(GLFWwindow* window, int* left, int* top, int* right, int* bottom);
  void glfwIconifyWindow(GLFWwindow* window);
  void glfwRestoreWindow(GLFWwindow* window);
  void glfwShowWindow(GLFWwindow* window);
  void glfwHideWindow(GLFWwindow* window);
  GLFWmonitor* glfwGetWindowMonitor(GLFWwindow* window);
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
  void glfwPostEmptyEvent(void);
  int glfwGetInputMode(GLFWwindow* window, int mode);
  void glfwSetInputMode(GLFWwindow* window, int mode, int value);
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
  void glfwSetClipboardString(GLFWwindow* window, const char* string);
  const char* glfwGetClipboardString(GLFWwindow* window);
  double glfwGetTime(void);
  void glfwSetTime(double time);
  void glfwMakeContextCurrent(GLFWwindow* window);
  GLFWwindow* glfwGetCurrentContext(void);
  void glfwSwapBuffers(GLFWwindow* window);
  void glfwSwapInterval(int interval);
  int glfwExtensionSupported(const char* extension);
  GLFWglproc glfwGetProcAddress(const char* procname);
]]


local bind = {}
local aux  = {}
local mod  = {}
local cb   = {}

function mod.Init()
  return bind.glfwInit()
end

function mod.Terminate()
  bind.glfwTerminate()
end

function mod.GetVersion()
  local major = ffi.new('int[1]')
  local minor = ffi.new('int[1]')
  local rev = ffi.new('int[1]')

  bind.glfwGetVersion(major, minor, rev)

  local version = {
    major = major[0],
    minor = minor[0],
    rev = rev[0]
  }

  return version
end

function mod.GetVersionString()
  return ffi.string(bind.glfwGetVersionString())
end

function mod.SetErrorCallback(cbfun)
  cbfun = aux.wrap_cb(cbfun, 'errorfun')
  return bind.glfwSetErrorCallback(cbfun)
end

function mod.GetMonitors()
  local count = ffi.new('int[1]')
  local cmonitors = bind.glfwGetMonitors(count)

  local monitors = {}
  for i = 0, count[0] - 1 do
    table.insert(monitors, cmonitors[i])
  end

  return monitors
end

function mod.GetPrimaryMonitor()
  return bind.glfwGetPrimaryMonitor()
end

function mod.GetMonitorPos(monitor)
  local xpos = ffi.new('int[1]')
  local ypos = ffi.new('int[1]')

  bind.glfwGetMonitorPos(monitor, xpos, ypos)

  return xpos[0], ypos[0]
end

function mod.GetMonitorPos(monitor)
  local width = ffi.new('int[1]')
  local height = ffi.new('int[1]')

  bind.glfwGetMonitorPos(monitor, width, height)

  return width[0], height[0]
end

function mod.GetMonitorName(monitor)
  return ffi.string(bind.glfwGetMonitorName(monitor))
end

function mod.SetMonitorCallback(cbfun)
  cbfun = aux.wrap_cb(cbfun, 'monitorfun')
  return bind.glfwSetMonitorCallback(cbfun)
end

function mod.GetVideoModes(monitor)
  local count = ffi.new('int[1]')
  local cmodes = bind.glfwGetVideoModes(monitor, count)

  local modes = {}
  for i = 0, count[0] - 1 do
    table.insert(modes, {
      width       = cmodes[i].width;
      height      = cmodes[i].height;
      redBits     = cmodes[i].redBits;
      greenBits   = cmodes[i].greenBits;
      blueBits    = cmodes[i].blueBits;
      refreshRate = cmodes[i].refreshRate;
    })
  end

  return modes
end

function mod.GetVideoMode(monitor)
  local cmode = bind.glfwGetVideoMode(monitor)

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

function mod.SetGamma(monitor, gamma)
  bind.glfwSetGamma(monitor, gamma)
end

function mod.GetGammaRamp(monitor)
  return bind.glfwGetGammaRamp(monitor)
end

function mod.SetGammaRamp(monitor, ramp)
  bind.glfwSetGammaRamp(monitor, ramp)
end

function mod.DefaultWindowHints()
  bind.glfwDefaultWindowHints()
end

function mod.WindowHint(target, hint)
  bind.glfwWindowHint(get_const(target), get_const(hint))
end

function mod.CreateWindow(width, height, title, monitor, share)
  return bind.glfwCreateWindow(width, height, title, monitor, share)
end

function mod.DestroyWindow(window)
  bind.glfwDestroyWindow(window)
end

function mod.WindowShouldClose(window)
  return bind.glfwWindowShouldClose(window)
end

function mod.SetWindowShouldClose(window, value)
  bind.glfwSetWindowShouldClose(window, value)
end

function mod.SetWindowTitle(window, title)
  bind.glfwSetWindowTitle(window, title)
end

function mod.GetWindowPos(window)
  local xpos = ffi.new('int[1]')
  local ypos = ffi.new('int[1]')

  bind.glfwGetWindowPos(window, xpos, ypos)

  return xpos[0], ypos[0]
end

function mod.SetWindowPos(window, xpos, ypos)
  bind.glfwSetWindowPos(window, xpos, ypos)
end

function mod.GetWindowSize(window)
  local width = ffi.new('int[1]')
  local height = ffi.new('int[1]')

  bind.glfwGetWindowSize(window, width, height)

  return width[0], height[0]
end

function mod.SetWindowSize(window, width, height)
  bind.glfwSetWindowSize(window, width, height)
end

function mod.GetFramebufferSize(window)
  local width = ffi.new('int[1]')
  local height = ffi.new('int[1]')

  bind.glfwGetFramebufferSize(window, width, height)

  return width[0], height[0]
end

function mod.GetWindowFrameSize(window)
  local left = ffi.new('int[1]')
  local top = ffi.new('int[1]')
  local right = ffi.new('int[1]')
  local bottom = ffi.new('int[1]')

  bind.glfwGetWindowFrameSize(window, left, top, right, bottom)

  local out = {
    left   = left[0],
    top    = top[0],
    right  = right[0],
    bottom = bottom[0]
  }

  return out
end

function mod.IconifyWindow(window)
  bind.glfwIconifyWindow(window)
end

function mod.RestoreWindow(window)
  bind.glfwRestoreWindow(window)
end

function mod.ShowWindow(window)
  bind.glfwShowWindow(window)
end

function mod.HideWindow(window)
  bind.glfwHideWindow(window)
end

function mod.GetWindowMonitor(window)
  return bind.glfwGetWindowMonitor(window)
end

function mod.GetWindowAttrib(window, attrib)
  return bind.glfwGetWindowAttrib(window, get_const(attrib))
end

function mod.SetWindowUserPointer(window, pointer)
  bind.glfwSetWindowUserPointer(window, pointer)
end

function mod.GetWindowUserPointer(window)
  return bind.glfwGetWindowUserPointer(window)
end

function mod.SetWindowPosCallback(window, cbfun)
  cbfun = aux.wrap_cb(cbfun, 'windowposfun')
  return bind.glfwSetWindowPosCallback(window, cbfun)
end

function mod.SetWindowSizeCallback(window, cbfun)
  cbfun = aux.wrap_cb(cbfun, 'windowsizefun')
  return bind.glfwSetWindowSizeCallback(window, cbfun)
end

function mod.SetWindowCloseCallback(window, cbfun)
  cbfun = aux.wrap_cb(cbfun, 'windowclosefun')
  return bind.glfwSetWindowCloseCallback(window, cbfun)
end

function mod.SetWindowRefreshCallback(window, cbfun)
  cbfun = aux.wrap_cb(cbfun, 'windowrefreshfun')
  return bind.glfwSetWindowRefreshCallback(window, cbfun)
end

function mod.SetWindowFocusCallback(window, cbfun)
  cbfun = aux.wrap_cb(cbfun, 'windowfocusfun')
  return bind.glfwSetWindowFocusCallback(window, cbfun)
end

function mod.SetWindowIconifyCallback(window, cbfun)
  cbfun = aux.wrap_cb(cbfun, 'windowiconifyfun')
  return bind.glfwSetWindowIconifyCallback(window, cbfun)
end

function mod.SetFramebufferSizeCallback(window, cbfun)
  cbfun = aux.wrap_cb(cbfun, 'framebuffersizefun')
  return bind.glfwSetFramebufferSizeCallback(window, cbfun)
end

function mod.PollEvents()
  bind.glfwPollEvents()
end

function mod.WaitEvents()
  bind.glfwWaitEvents()
end

function mod.PostEmptyEvent()
  bind.glfwPostEmptyEvent()
end

function mod.GetInputMode(window, mode)
  return bind.glfwGetInputMode(window, get_const(mode))
end

function mod.SetInputMode(window, mode, value)
  bind.glfwSetInputMode(window, get_const(mode), value)
end

function mod.GetKey(window, key)
  return bind.glfwGetKey(window, get_const(key))
end

function mod.GetMouseButton(window, button)
  return bind.glfwGetMouseButton(window, get_const(button))
end

function mod.GetCursorPos(window)
  local xpos = ffi.new('int[1]')
  local ypos = ffi.new('int[1]')

  bind.glfwGetCursorPos(window, xpos, ypos)

  return xpos[0], ypos[0]
end

function mod.SetCursorPos(window, xpos, ypos)
  bind.glfwSetCursorPos(window, xpos, ypos)
end

function mod.CreateCursor(image, xhot, yhot)
  return bind.glfwCreateCursor(image, xhot, yhot)
end

function mod.CreateStandardCursor(shape)
  return bind.glfwCreateStandardCursor(get_const(shape))
end

function mod.DestroyCursor(cursor)
  bind.glfwDestroyCursor(cursor)
end

function mod.SetCursor(window, cursor)
  bind.glfwSetCursor(window, cursor)
end

function mod.SetKeyCallback(window, cbfun)
  cbfun = aux.wrap_cb(cbfun, 'keyfun')
  return bind.glfwSetKeyCallback(window, cbfun)
end

function mod.SetCharCallback(window, cbfun)
  cbfun = aux.wrap_cb(cbfun, 'charfun')
  return ffi.string(bind.glfwSetCharCallback(window, cbfun))
end

function mod.SetCharModsCallback(window, cbfun)
  cbfun = aux.wrap_cb(cbfun, 'charmodsfun')
  return ffi.string(bind.glfwSetCharModsCallback(window, cbfun))
end

function mod.SetMouseButtonCallback(window, cbfun)
  cbfun = aux.wrap_cb(cbfun, 'mousebuttonfun')
  return bind.glfwSetMouseButtonCallback(window, cbfun)
end

function mod.SetCursorPosCallback(window, cbfun)
  cbfun = aux.wrap_cb(cbfun, 'cursorposfun')
  return bind.glfwSetCursorPosCallback(window, cbfun)
end

function mod.SetCursorEnterCallback(window, cbfun)
  cbfun = aux.wrap_cb(cbfun, 'cursorenterfun')
  return bind.glfwSetCursorEnterCallback(window, cbfun)
end

function mod.SetScrollCallback(window, cbfun)
  cbfun = aux.wrap_cb(cbfun, 'scrollfun')
  return bind.glfwSetScrollCallback(window, cbfun)
end

function mod.SetDropCallback(window, cbfun)
  cbfun = aux.wrap_cb(cbfun, 'dropfun_raw')
  return bind.glfwSetDropCallback(window, cbfun)
end

function mod.JoystickPresent(joy)
  return bind.glfwJoystickPresent(get_const(joy))
end

function mod.GetJoystickAxes(joy)
  local count = ffi.new('int[1]')
  local caxes = bind.glfwGetJoystickAxes(get_const(joy), count)

  local axes = {}
  for i = 0, count[0] - 1 do
    table.insert(axes, caxes[i])
  end

  return axes
end

function mod.GetJoystickButtons(joy)
  local count = ffi.new('int[1]')
  local cbuttons = bind.glfwGetJoystickButtons(get_const(joy), count)

  local buttons = {}
  for i = 0, count[0] - 1 do
    table.insert(buttons, cbuttons[i])
  end

  return buttons
end

function mod.GetJoystickName(joy)
  return ffi.string(bind.glfwGetJoystickName(get_const(joy)))
end

function mod.SetClipboardString(window, string)
  bind.glfwSetClipboardString(window, string)
end

function mod.GetClipboardString(window)
  return ffi.string(bind.glfwGetClipboardString(window))
end

function mod.GetTime()
  return bind.glfwGetTime()
end

function mod.SetTime(time)
  bind.glfwSetTime(time)
end

function mod.MakeContextCurrent(window)
  bind.glfwMakeContextCurrent(window)
end

function mod.GetCurrentContext()
  return bind.glfwGetCurrentContext()
end

function mod.SwapBuffers(window)
  bind.glfwSwapBuffers(window)
end

function mod.SwapInterval(interval)
  bind.glfwSwapInterval(interval)
end

function mod.ExtensionSupported(extension)
  return bind.glfwExtensionSupported(extension)
end

function mod.GetProcAddress(procname)
  return bind.glfwGetProcAddress(procname)
end


function aux.wrap_cb(cbfun, cbname)
  if type(cbfun) == 'function' then
    return cb[cbname](cbfun)
  end
  return cb
end


cb.errorfun_raw       = 'GLFWerrorfun'
cb.windowposfun       = 'GLFWwindowposfun'
cb.windowsizefun      = 'GLFWwindowsizefun'
cb.windowclosefun     = 'GLFWwindowclosefun'
cb.windowrefreshfun   = 'GLFWwindowrefreshfun'
cb.windowfocusfun     = 'GLFWwindowfocusfun'
cb.windowiconifyfun   = 'GLFWwindowiconifyfun'
cb.framebuffersizefun = 'GLFWframebuffersizefun'
cb.mousebuttonfun     = 'GLFWmousebuttonfun'
cb.cursorposfun       = 'GLFWcursorposfun'
cb.cursorenterfun     = 'GLFWcursorenterfun'
cb.scrollfun          = 'GLFWscrollfun'
cb.keyfun             = 'GLFWkeyfun'
cb.charfun            = 'GLFWcharfun'
cb.charmodsfun        = 'GLFWcharmodsfun'
cb.dropfun_raw        = 'GLFWdropfun'
cb.monitorfun         = 'GLFWmonitorfun'

function cb.errorfun(func)
  return cb.errorfun_raw(function(error, description)
    func(error, ffi.string(description))
  end)
end

function cb.dropfun(func)
  return cb.dropfun_raw(function(window, count, names)
    local t = {}
    for i = 0, count - 1 do
      t[#t + 1] = ffi.string(names[i])
    end
    func(window, t)
  end)
end


monitor_mt = {}
monitor_mt.__index = monitor_mt
monitor_mt.GetPos          = mod.GetMonitorPos
monitor_mt.GetPhysicalSize = mod.GetMonitorPhysicalSize
monitor_mt.GetName         = mod.GetMonitorName
monitor_mt.GetVideoModes   = mod.GetVideoModes
monitor_mt.GetVideoMode    = mod.GetVideoMode
monitor_mt.SetGamma        = mod.SetGamma
monitor_mt.GetGammaRamp    = mod.GetGammaRamp
monitor_mt.SetGammaRamp    = mod.SetGammaRamp

window_mt = {}
window_mt.__index                    = window_mt
window_mt.Destroy                    = mod.DestroyWindow
window_mt.ShouldClose                = mod.WindowShouldClose
window_mt.SetShouldClose             = mod.SetWindowShouldClose
window_mt.SetTitle                   = mod.SetWindowTitle
window_mt.GetPos                     = mod.GetWindowPos
window_mt.SetPos                     = mod.SetWindowPos
window_mt.GetSize                    = mod.GetWindowSize
window_mt.SetSize                    = mod.SetWindowSize
window_mt.GetFramebufferSize         = mod.GetFramebufferSize
window_mt.GetFrameSize               = mod.GetWindowFrameSize
window_mt.Iconify                    = mod.IconifyWindow
window_mt.Restore                    = mod.RestoreWindow
window_mt.Show                       = mod.ShowWindow
window_mt.Hide                       = mod.HideWindow
window_mt.GetMonitor                 = mod.GetWindowMonitor
window_mt.GetAttrib                  = mod.GetWindowAttrib
window_mt.SetUserPointer             = mod.SetWindowUserPointer
window_mt.GetUserPointer             = mod.GetWindowUserPointer
window_mt.SetPosCallback             = mod.SetWindowPosCallback
window_mt.SetSizeCallback            = mod.SetWindowSizeCallback
window_mt.SetCloseCallback           = mod.SetWindowCloseCallback
window_mt.SetRefreshCallback         = mod.SetWindowRefreshCallback
window_mt.SetFocusCallback           = mod.SetWindowFocusCallback
window_mt.SetIconifyCallback         = mod.SetWindowIconifyCallback
window_mt.SetFramebufferSizeCallback = mod.SetFramebufferSizeCallback
window_mt.GetInputMode               = mod.GetInputMode
window_mt.SetInputMode               = mod.SetInputMode
window_mt.GetKey                     = mod.GetKey
window_mt.GetMouseButton             = mod.GetMouseButton
window_mt.GetCursorPos               = mod.GetCursorPos
window_mt.SetCursorPos               = mod.SetCursorPos
window_mt.SetCursor                  = mod.SetCursor
window_mt.SetKeyCallback             = mod.SetKeyCallback
window_mt.SetCharCallback            = mod.SetCharCallback
window_mt.SetCharModsCallback        = mod.SetCharModsCallback
window_mt.SetMouseButtonCallback     = mod.SetMouseButtonCallback
window_mt.SetCursorPosCallback       = mod.SetCursorPosCallback
window_mt.SetCursorEnterCallback     = mod.SetCursorEnterCallback
window_mt.SetScrollCallback          = mod.SetScrollCallback
window_mt.SetDropCallback            = mod.SetDropCallback
window_mt.SetClipboardString         = mod.SetClipboardString
window_mt.GetClipboardString         = mod.GetClipboardString
window_mt.MakeContextCurrent         = mod.MakeContextCurrent
window_mt.SwapBuffers                = mod.SwapBuffers

cursor_mt = {}
cursor_mt.__index = cursor_mt
cursor_mt.Destroy = mod.DestroyCursor


jit.off(mod.PollEvents)
jit.off(mod.WaitEvents)


mod.const = const
mod.cb = cb

local function init(self, name)
  ffi.cdef(header)

  bind = ffi.load(name)

  ffi.metatype('GLFWmonitor', monitor_mt)
  ffi.metatype('GLFWwindow', window_mt)
  ffi.metatype('GLFWcursor', cursor_mt)

  for k,v in pairs(cb) do
    cb[k] = type(v) == 'string' and ffi.typeof(v) or v
  end

  return self
end

return setmetatable(mod, { __call = init })
