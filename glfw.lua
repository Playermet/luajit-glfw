-----------------------------------------------------------
--  Bind for GLFW v3.1.0
-----------------------------------------------------------
local const = {}

const.version_major    = 3
const.version_minor    = 1
const.version_revision = 0

const.release   = 0
const.press     = 1
const['repeat'] = 2

const.key_unknown = -1

const.key_space         = 32
const.key_apostrophe    = 39
const.key_comma         = 44
const.key_minus         = 45
const.key_period        = 46
const.key_slash         = 47
const.key_0             = 48
const.key_1             = 49
const.key_2             = 50
const.key_3             = 51
const.key_4             = 52
const.key_5             = 53
const.key_6             = 54
const.key_7             = 55
const.key_8             = 56
const.key_9             = 57
const.key_semicolon     = 59
const.key_equal         = 61
const.key_a             = 65
const.key_b             = 66
const.key_c             = 67
const.key_d             = 68
const.key_e             = 69
const.key_f             = 70
const.key_g             = 71
const.key_h             = 72
const.key_i             = 73
const.key_j             = 74
const.key_k             = 75
const.key_l             = 76
const.key_m             = 77
const.key_n             = 78
const.key_o             = 79
const.key_p             = 80
const.key_q             = 81
const.key_r             = 82
const.key_s             = 83
const.key_t             = 84
const.key_u             = 85
const.key_v             = 86
const.key_w             = 87
const.key_x             = 88
const.key_y             = 89
const.key_z             = 90
const.key_left_bracket  = 91
const.key_backslash     = 92
const.key_right_bracket = 93
const.key_grave_accent  = 96
const.key_world_1       = 161
const.key_world_2       = 162

const.key_escape        = 256
const.key_enter         = 257
const.key_tab           = 258
const.key_backspace     = 259
const.key_insert        = 260
const.key_delete        = 261
const.key_right         = 262
const.key_left          = 263
const.key_down          = 264
const.key_up            = 265
const.key_page_up       = 266
const.key_page_down     = 267
const.key_home          = 268
const.key_end           = 269
const.key_caps_lock     = 280
const.key_scroll_lock   = 281
const.key_num_lock      = 282
const.key_print_screen  = 283
const.key_pause         = 284
const.key_f1            = 290
const.key_f2            = 291
const.key_f3            = 292
const.key_f4            = 293
const.key_f5            = 294
const.key_f6            = 295
const.key_f7            = 296
const.key_f8            = 297
const.key_f9            = 298
const.key_f10           = 299
const.key_f11           = 300
const.key_f12           = 301
const.key_f13           = 302
const.key_f14           = 303
const.key_f15           = 304
const.key_f16           = 305
const.key_f17           = 306
const.key_f18           = 307
const.key_f19           = 308
const.key_f20           = 309
const.key_f21           = 310
const.key_f22           = 311
const.key_f23           = 312
const.key_f24           = 313
const.key_f25           = 314
const.key_kp_0          = 320
const.key_kp_1          = 321
const.key_kp_2          = 322
const.key_kp_3          = 323
const.key_kp_4          = 324
const.key_kp_5          = 325
const.key_kp_6          = 326
const.key_kp_7          = 327
const.key_kp_8          = 328
const.key_kp_9          = 329
const.key_kp_decimal    = 330
const.key_kp_divide     = 331
const.key_kp_multiply   = 332
const.key_kp_subtract   = 333
const.key_kp_add        = 334
const.key_kp_enter      = 335
const.key_kp_equal      = 336
const.key_left_shift    = 340
const.key_left_control  = 341
const.key_left_alt      = 342
const.key_left_super    = 343
const.key_right_shift   = 344
const.key_right_control = 345
const.key_right_alt     = 346
const.key_right_super   = 347
const.key_menu          = 348
const.key_last          = const.key_menu

const.mod_shift   = 0x0001
const.mod_control = 0x0002
const.mod_alt     = 0x0004
const.mod_super   = 0x0008

const.mouse_button_1      = 0
const.mouse_button_2      = 1
const.mouse_button_3      = 2
const.mouse_button_4      = 3
const.mouse_button_5      = 4
const.mouse_button_6      = 5
const.mouse_button_7      = 6
const.mouse_button_8      = 7
const.mouse_button_last   = const.mouse_button_8
const.mouse_button_left   = const.mouse_button_1
const.mouse_button_right  = const.mouse_button_2
const.mouse_button_middle = const.mouse_button_3

const.joystick_1    = 0
const.joystick_2    = 1
const.joystick_3    = 2
const.joystick_4    = 3
const.joystick_5    = 4
const.joystick_6    = 5
const.joystick_7    = 6
const.joystick_8    = 7
const.joystick_9    = 8
const.joystick_10   = 9
const.joystick_11   = 10
const.joystick_12   = 11
const.joystick_13   = 12
const.joystick_14   = 13
const.joystick_15   = 14
const.joystick_16   = 15
const.joystick_last = const.joystick_16

const.not_initialized     = 0x00010001
const.no_current_context  = 0x00010002
const.invalid_enum        = 0x00010003
const.invalid_value       = 0x00010004
const.out_of_memory       = 0x00010005
const.api_unavailable     = 0x00010006
const.version_unavailable = 0x00010007
const.platform_error      = 0x00010008
const.format_unavailable  = 0x00010009

const.focused      = 0x00020001
const.iconified    = 0x00020002
const.resizable    = 0x00020003
const.visible      = 0x00020004
const.decorated    = 0x00020005
const.auto_iconify = 0x00020006
const.floating     = 0x00020007

const.red_bits         = 0x00021001
const.green_bits       = 0x00021002
const.blue_bits        = 0x00021003
const.alpha_bits       = 0x00021004
const.depth_bits       = 0x00021005
const.stencil_bits     = 0x00021006
const.accum_red_bits   = 0x00021007
const.accum_green_bits = 0x00021008
const.accum_blue_bits  = 0x00021009
const.accum_alpha_bits = 0x0002100a
const.aux_buffers      = 0x0002100b
const.stereo           = 0x0002100c
const.samples          = 0x0002100d
const.srgb_capable     = 0x0002100e
const.refresh_rate     = 0x0002100f
const.doublebuffer     = 0x00021010

const.client_api               = 0x00022001
const.context_version_major    = 0x00022002
const.context_version_minor    = 0x00022003
const.context_revision         = 0x00022004
const.context_robustness       = 0x00022005
const.opengl_forward_compat    = 0x00022006
const.opengl_debug_context     = 0x00022007
const.opengl_profile           = 0x00022008
const.context_release_behavior = 0x00022009

const.opengl_api    = 0x00030001
const.opengl_es_api = 0x00030002

const.no_robustness         = 0
const.no_reset_notification = 0x00031001
const.lose_context_on_reset = 0x00031002

const.opengl_any_profile    = 0
const.opengl_core_profile   = 0x00032001
const.opengl_compat_profile = 0x00032002

const.cursor               = 0x00033001
const.sticky_keys          = 0x00033002
const.sticky_mouse_buttons = 0x00033003

const.cursor_normal   = 0x00034001
const.cursor_hidden   = 0x00034002
const.cursor_disabled = 0x00034003

const.any_release_behavior   = 0
const.release_behavior_flush = 0x00035001
const.release_behavior_none  = 0x00035002

const.arrow_cursor     = 0x00036001
const.ibeam_cursor     = 0x00036002
const.crosshair_cursor = 0x00036003
const.hand_cursor      = 0x00036004
const.hresize_cursor   = 0x00036005
const.vresize_cursor   = 0x00036006

const.connected    = 0x00040001
const.disconnected = 0x00040002

const.dont_care = -1


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

local ffi = require 'ffi'

local bind = {}
local mod = {}

function mod.init()
  return bind.glfwInit()
end

function mod.terminate()
  bind.glfwTerminate()
end

function mod.get_version()
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

function mod.get_version_string()
  return ffi.string(bind.glfwGetVersionString())
end

function mod.set_error_callback(cbfun)
  return bind.glfwSetErrorCallback(cbfun)
end

function mod.get_monitors()
  local count = ffi.new('int[1]')
  local cmonitors = bind.glfwGetMonitors(count)

  local monitors = {}
  for i = 0, count[0] - 1 do
    table.insert(monitors, cmonitors[i])
  end

  return monitors
end

function mod.get_primary_monitor()
  return bind.glfwGetPrimaryMonitor()
end

function mod.get_monitor_pos(monitor)
  local xpos = ffi.new('int[1]')
  local ypos = ffi.new('int[1]')

  bind.glfwGetMonitorPos(monitor, xpos, ypos)

  return xpos[0], ypos[0]
end

function mod.get_monitor_physical_size(monitor)
  local width = ffi.new('int[1]')
  local height = ffi.new('int[1]')

  bind.glfwGetMonitorPos(monitor, width, height)

  return width[0], height[0]
end

function mod.get_monitor_name(monitor)
  return ffi.string(bind.glfwGetMonitorName(monitor))
end

function mod.set_monitor_callback(cbfun)
  return bind.glfwSetMonitorCallback(cbfun)
end

function mod.get_video_modes(monitor)
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

function mod.get_video_mode(monitor)
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

function mod.set_gamma(monitor, gamma)
  bind.glfwSetGamma(monitor, gamma)
end

function mod.get_gamma_ramp(monitor)
  return bind.glfwGetGammaRamp(monitor)
end

function mod.set_gamma_ramp(monitor, ramp)
  bind.glfwSetGammaRamp(monitor, ramp)
end

function mod.default_window_hints()
  bind.glfwDefaultWindowHints()
end

function mod.window_hint(target, hint)
  bind.glfwWindowHint(get_const(target), get_const(hint))
end

function mod.create_window(width, height, title, monitor, share)
  return bind.glfwCreateWindow(width, height, title, monitor, share)
end

function mod.destroy_window(window)
  bind.glfwDestroyWindow(window)
end

function mod.window_should_close(window)
  return bind.glfwWindowShouldClose(window)
end

function mod.set_window_should_close(window, value)
  bind.glfwSetWindowShouldClose(window, value)
end

function mod.set_window_title(window, title)
  bind.glfwSetWindowTitle(window, title)
end

function mod.get_window_pos(window)
  local xpos = ffi.new('int[1]')
  local ypos = ffi.new('int[1]')

  bind.glfwGetWindowPos(window, xpos, ypos)

  return xpos[0], ypos[0]
end

function mod.set_window_pos(window, xpos, ypos)
  bind.glfwSetWindowPos(window, xpos, ypos)
end

function mod.get_window_size(window)
  local width = ffi.new('int[1]')
  local height = ffi.new('int[1]')

  bind.glfwGetWindowSize(window, width, height)

  return width[0], height[0]
end

function mod.set_window_size(window, width, height)
  bind.glfwSetWindowSize(window, width, height)
end

function mod.get_framebuffer_size(window)
  local width = ffi.new('int[1]')
  local height = ffi.new('int[1]')

  bind.glfwGetFramebufferSize(window, width, height)

  return width[0], height[0]
end

function mod.get_window_frame_size(window)
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

function mod.iconify_window(window)
  bind.glfwIconifyWindow(window)
end

function mod.restore_window(window)
  bind.glfwRestoreWindow(window)
end

function mod.show_window(window)
  bind.glfwShowWindow(window)
end

function mod.hide_window(window)
  bind.glfwHideWindow(window)
end

function mod.get_window_monitor(window)
  return bind.glfwGetWindowMonitor(window)
end

function mod.get_window_attrib(window, attrib)
  return bind.glfwGetWindowAttrib(window, get_const(attrib))
end

function mod.set_window_user_pointer(window, pointer)
  bind.glfwSetWindowUserPointer(window, pointer)
end

function mod.get_window_user_pointer(window)
  return bind.glfwGetWindowUserPointer(window)
end

function mod.set_window_pos_callback(window, cbfun)
  return bind.glfwSetWindowPosCallback(window, cbfun)
end

function mod.set_window_size_callback(window, cbfun)
  return bind.glfwSetWindowSizeCallback(window, cbfun)
end

function mod.set_window_close_callback(window, cbfun)
  return bind.glfwSetWindowCloseCallback(window, cbfun)
end

function mod.set_window_refresh_callback(window, cbfun)
  return bind.glfwSetWindowRefreshCallback(window, cbfun)
end

function mod.set_window_focus_callback(window, cbfun)
  return bind.glfwSetWindowFocusCallback(window, cbfun)
end

function mod.set_window_iconify_callback(window, cbfun)
  return bind.glfwSetWindowIconifyCallback(window, cbfun)
end

function mod.set_framebuffer_size_callback(window, cbfun)
  return bind.glfwSetFramebufferSizeCallback(window, cbfun)
end

function mod.poll_events()
  bind.glfwPollEvents()
end

function mod.wait_events()
  bind.glfwWaitEvents()
end

function mod.post_empty_event()
  bind.glfwPostEmptyEvent()
end

function mod.get_input_mode(window, mode)
  return bind.glfwGetInputMode(window, get_const(mode))
end

function mod.set_input_mode(window, mode, value)
  bind.glfwSetInputMode(window, get_const(mode), value)
end

function mod.get_key(window, key)
  return bind.glfwGetKey(window, get_const(key))
end

function mod.get_mouse_button(window, button)
  return bind.glfwGetMouseButton(window, get_const(button))
end

function mod.get_cursor_pos(window)
  local xpos = ffi.new('int[1]')
  local ypos = ffi.new('int[1]')

  bind.glfwGetCursorPos(window, xpos, ypos)

  return xpos[0], ypos[0]
end

function mod.set_cursor_pos(window, xpos, ypos)
  bind.glfwSetCursorPos(window, xpos, ypos)
end

function mod.create_cursor(image, xhot, yhot)
  return bind.glfwCreateCursor(image, xhot, yhot)
end

function mod.create_standard_cursor(shape)
  return bind.glfwCreateStandardCursor(get_const(shape))
end

function mod.destroy_cursor(cursor)
  bind.glfwDestroyCursor(cursor)
end

function mod.set_cursor(window, cursor)
  bind.glfwSetCursor(window, cursor)
end

function mod.set_key_callback(window, cbfun)
  return bind.glfwSetKeyCallback(window, cbfun)
end

function mod.set_char_callback(window, cbfun)
  return ffi.string(bind.glfwSetCharCallback(window, cbfun))
end

function mod.set_char_mods_callback(window, cbfun)
  return ffi.string(bind.glfwSetCharModsCallback(window, cbfun))
end

function mod.set_mouse_button_callback(window, cbfun)
  return bind.glfwSetMouseButtonCallback(window, cbfun)
end

function mod.set_cursor_pos_callback(window, cbfun)
  return bind.glfwSetCursorPosCallback(window, cbfun)
end

function mod.set_cursor_enter_callback(window, cbfun)
  return bind.glfwSetCursorEnterCallback(window, cbfun)
end

function mod.set_scroll_callback(window, cbfun)
  return bind.glfwSetScrollCallback(window, cbfun)
end

function mod.set_drop_callback(window, cbfun)
  return bind.glfwSetDropCallback(window, cbfun)
end

function mod.joystick_present(joy)
  return bind.glfwJoystickPresent(get_const(joy))
end

function mod.get_joystick_axes(joy)
  local count = ffi.new('int[1]')
  local caxes = bind.glfwGetJoystickAxes(get_const(joy), count)

  local axes = {}
  for i = 0, count[0] - 1 do
    table.insert(axes, caxes[i])
  end

  return axes
end

function mod.get_joystick_buttons(joy)
  local count = ffi.new('int[1]')
  local cbuttons = bind.glfwGetJoystickButtons(get_const(joy), count)

  local buttons = {}
  for i = 0, count[0] - 1 do
    table.insert(buttons, cbuttons[i])
  end

  return buttons
end

function mod.get_joystick_name(joy)
  return ffi.string(bind.glfwGetJoystickName(get_const(joy)))
end

function mod.set_clipboard_string(window, string)
  bind.glfwSetClipboardString(window, string)
end

function mod.get_clipboard_string(window)
  return ffi.string(bind.glfwGetClipboardString(window))
end

function mod.get_time()
  return bind.glfwGetTime()
end

function mod.set_time(time)
  bind.glfwSetTime(time)
end

function mod.make_context_current(window)
  bind.glfwMakeContextCurrent(window)
end

function mod.get_current_context()
  return bind.glfwGetCurrentContext()
end

function mod.swap_buffers(window)
  bind.glfwSwapBuffers(window)
end

function mod.swap_interval(interval)
  bind.glfwSwapInterval(interval)
end

function mod.extension_supported(extension)
  return bind.glfwExtensionSupported(extension)
end

function mod.get_proc_address(procname)
  return bind.glfwGetProcAddress(procname)
end


monitor_mt = {}
monitor_mt.__index = monitor_mt
monitor_mt.get_pos           = mod.get_monitor_pos
monitor_mt.get_physical_size = mod.get_monitor_physical_size
monitor_mt.get_name          = mod.get_monitor_name
monitor_mt.get_video_modes   = mod.get_video_modes
monitor_mt.get_video_mode    = mod.get_video_mode
monitor_mt.set_gamma         = mod.set_gamma
monitor_mt.get_gamma_ramp    = mod.get_gamma_ramp
monitor_mt.set_gamma_ramp    = mod.set_gamma_ramp

window_mt = {}
window_mt.__index = window_mt
window_mt.destroy                       = mod.destroy_window
window_mt.should_close                  = mod.window_should_close
window_mt.set_should_close              = mod.set_window_should_close
window_mt.set_title                     = mod.set_window_title
window_mt.get_pos                       = mod.get_window_pos
window_mt.set_pos                       = mod.set_window_pos
window_mt.get_size                      = mod.get_window_size
window_mt.set_size                      = mod.set_window_size
window_mt.get_framebuffer_size          = mod.get_framebuffer_size
window_mt.get_frame_size                = mod.get_window_frame_size
window_mt.iconify                       = mod.iconify_window
window_mt.restore                       = mod.restore_window
window_mt.show                          = mod.show_window
window_mt.hide                          = mod.hide_window
window_mt.get_monitor                   = mod.get_window_monitor
window_mt.get_attrib                    = mod.get_window_attrib
window_mt.set_user_pointer              = mod.set_window_user_pointer
window_mt.get_user_pointer              = mod.get_window_user_pointer
window_mt.set_pos_callback              = mod.set_window_pos_callback
window_mt.set_size_callback             = mod.set_window_size_callback
window_mt.set_close_callback            = mod.set_window_close_callback
window_mt.set_refresh_callback          = mod.set_window_refresh_callback
window_mt.set_focus_callback            = mod.set_window_focus_callback
window_mt.set_iconify_callback          = mod.set_window_iconify_callback
window_mt.set_framebuffer_size_callback = mod.set_framebuffer_size_callback
window_mt.get_input_mode                = mod.get_input_mode
window_mt.set_input_mode                = mod.set_input_mode
window_mt.get_key                       = mod.get_key
window_mt.get_mouse_button              = mod.get_mouse_button
window_mt.get_cursor_pos                = mod.get_cursor_pos
window_mt.set_cursor_pos                = mod.set_cursor_pos
window_mt.set_cursor                    = mod.set_cursor
window_mt.set_key_callback              = mod.set_key_callback
window_mt.set_char_callback             = mod.set_char_callback
window_mt.set_char_mods_callback        = mod.set_char_mods_callback
window_mt.set_mouse_button_callback     = mod.set_mouse_button_callback
window_mt.set_cursor_pos_callback       = mod.set_cursor_pos_callback
window_mt.set_cursor_enter_callback     = mod.set_cursor_enter_callback
window_mt.set_scroll_callback           = mod.set_scroll_callback
window_mt.set_drop_callback             = mod.set_drop_callback
window_mt.set_clipboard_string          = mod.set_clipboard_string
window_mt.get_clipboard_string          = mod.get_clipboard_string
window_mt.make_context_current          = mod.make_context_current
window_mt.swap_buffers                  = mod.swap_buffers

cursor_mt = {}
cursor_mt.__index = cursor_mt
cursor_mt.destroy = mod.destroy_cursor


mod.const = const

setmetatable(mod, {
  __call = function(self, name)
    ffi.cdef(header)

    bind = ffi.load(name)

    ffi.metatype('GLFWmonitor', monitor_mt)
    ffi.metatype('GLFWwindow', window_mt)
    ffi.metatype('GLFWcursor', cursor_mt)

    return self
  end
})

return mod
