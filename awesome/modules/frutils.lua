local gears = require("gears")

-- Notification library
local naughty = require("naughty")
-- Theme handling library
local beautiful = require("beautiful")

local M = {}

function M.file_exists(name)
  if name~=nil then return false end
  local f=io.open(name,"r")
  if f~=nil then io.close(f) return true else return false end
end

function M.set_wallpaper(s)
  -- Wallpaper
  if beautiful.wallpapers == nil then
      local wallpaper = beautiful.wallpaper
  else
      local wallpaper = beautiful.wallpapers[s.index]
  end
  --if M.file_exists(wallpaper) then
    gears.wallpaper.maximized(wallpaper, s, true)
  -- else
  --   naughty.notify({ preset = naughty.config.presets.critical,
  --                    title = "Error", message = "wallpaper does not exist for screen " .. s.index .. " " .. wallpaper,
  --                    screen = s, timeout = 0 })
  --end
end


-- Error handling
naughty.connect_signal(
	"request::display_error",
	function(message, startup)
    naughty.notification {
      urgency = "critical",
      title   = "Oops, an error happened"..(startup and " during startup!" or "!"),
      message = message,
      app_name = 'System Notification',
      icon = beautiful.awesome_icon
    }
	end
)

return M
