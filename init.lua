--- === MinimizeAllWindows ===
---
--- Minimize or maximize all currently open windows with a single keypress.
---
--- Download: [URL]
   
local obj = {}
obj.__index = obj

-- Metadata
obj.name = "MinimizeAllWindows"
obj.version = "1.1"
obj.author = "James Turnbull <james@lovedthanlost.net>"
obj.license = "MIT - https://opensource.org/licenses/MIT"
obj.homepage = "https://github.com/jamtur01/MinimizeAllWindows.spoon"

--- MinimizeAllWindows:bindHotkeys(mapping)
function obj:bindHotkeys(mapping)
    local def = {
        minimize = hs.fnutils.partial(self.minimizeAllWindows, self),
        maximize = hs.fnutils.partial(self.maximizeAllWindows, self),
    }
    hs.spoons.bindHotkeysToSpec(def, mapping)
    return self
end

--- MinimizeAllWindows:minimizeAllWindows()
function obj:minimizeAllWindows()
    local wins = hs.window.allWindows()
    for _, win in ipairs(wins) do
        win:minimize()
    end
end

--- MinimizeAllWindows:maximizeAllWindows()
function obj:maximizeAllWindows()
    local wins = hs.window.allWindows()
    for _, win in ipairs(wins) do
        if win:isMinimized() then
            win:unminimize()
        end
    end
end

return obj
