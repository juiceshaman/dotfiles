---- remember to store this externally too
--
---- this should make autolaunch at login work
hs.autoLaunch = True

-- some useful key-remapping:
KEYMAP = {
	{'leftCmd', 'j', nil, 'left'},
	{'leftCmd', 'k', nil, 'down'},
	{'leftCmd', 'l', nil, 'right'},
	{'leftCmd', 'i', nil, 'up'},
	{'function', nil, 'leftCmd+leftAlt+leftShift+ctrl'}
}

---- this is the hyper key
--
-- this is the hyper key
local hyper = { "cmd", "alt", "ctrl", "shift" }
-- here i get a reminder notification when config reloaded
hs.hotkey.bind(hyper, "0", function()
  hs.reload()
end)
hs.notify.new({title="Hammerspoon", informativeText="Config loaded"}):send()

-- this reloads the config whenever the files change
function reloadConfig(paths)
    doReload = false
    for _,file in pairs(paths) do
        if file:sub(-4) == ".lua" then
            print("A lua config file changed, reload")
            doReload = true
        end
    end
    if not doReload then
        print("No lua file changed, skipping reload")
        return
    end

    hs.reload()
end
-- this reloads the config whenever the files change

function reloadConfig(paths)
    doReload = false
    for _, file in pairs(paths) do
        if file:sub(-4) ==".lua" then
            print("A lua config changed, reload")
            doReload = true
        end

        if not doReload then
            print("No lua file has changed, skipping reload")
            return
        end
        hs.reload()
    end
end



configFileWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig)
configFileWatcher:start()
--
--
---- this removes animation
hs.window.animationDuration = 0
--
--
------ these are direct apps to open with commands
local applicationHotkeys = {
  t = 'Terminal',
  w = 'Firefox',
  c = 'Calendar',
  e = 'Mail',
  d = 'ChemDraw',
  f = 'Finder',
  r = 'Reminders'}
for key, app in pairs(applicationHotkeys) do
  hs.hotkey.bind(hyper, key,  function()
    hs.application.launchOrFocus(app)
  end)
end
--
hs.loadSpoon("Caffeine")
spoon.Caffeine:start()
--
hs.loadSpoon("ClipboardTool")
spoon.ClipboardTool:start()
--
--Problem with cherry: not in monospace and makes the menu bar wobble :(
--hs.loadSpoon("Cherry")

--spoon.Cherry:start()
--
--
--hs.loadSpoon("EjectMenu")
--spoon.EjectMenu:start()
--
--
hs.loadSpoon("SpeedMenu")
spoon.SpeedMenu:start()
--
--
--hs.loadSpoon("TimeMachineProgress")
--spoon.TimeMachineProgress:start()
--
--
--
--
--
--
----hs.loadSpoon("")
----spoon.Name:start()
----hs.loadSpoon("")
----spoon.Name:start()
----hs.loadSpoon("")
----spoon.Name:start()
