if game.local_player.champ_name ~= "Twitch" then
    return
end

local Twitch = {}
Twitch.__index = Twitch

function Twitch:new()
    local obj = {}
    setmetatable(obj, Twitch)
    obj:init()
    return obj
end

function Twitch:init()
    local LuaVersion = 0.1
	local LuaName = "exezAphelios"
	local lua_file_name = "exezAphelios.lua"
	local lua_url = "https://raw.githubusercontent.com/exez-42/BruhWalker/main/exezTwitch.lua"
	local version_url = "https://raw.githubusercontent.com/exez-42/BruhWalker/main/exezTwitch.lua.version.txt"
    do
		local function AutoUpdate()
			http:get_async(version_url, function(success, web_version)
				console:log(LuaName .. ".lua Vers: "..LuaVersion)
				console:log(LuaName .. ".Web Vers: "..tonumber(web_version))
				if tonumber(web_version) == LuaVersion then
					console:log(LuaName .. " Successfully Loaded..")
				else
					http:download_file_async(lua_url, lua_file_name, function(success)
						if success then
							console:log(LuaName .. " Update available..")
							console:log("Please press F5 to reload!")
						end
					end)
				end
			end)
		end
		AutoUpdate()
	end

    self.myHero = game.local_player
    self.version = 0.1
    self:create_menu()

    client:set_event_callback("on_draw", function() self:on_draw() end)
end

function Twitch:create_menu()
    self.twitch_enabled = menu:add_checkbox("Enabled", 1)
    menu:add_label("exezTwitch")

    self.twitch_combo = menu:add_subcategory("Combo", self.twitch_category)
        self.combo_w = menu:add_checkbox("Use [W]", 1)
        self.combo_e = menu:add_checkbox("Use [E]", 1)
        self.w_key = menu:add_keybinder("Semi [W]", string.byte("Y"))

    self.twitch_draw = menu:add_subcategory("Draw Features")
        self.w_draw = menu:add_checkbox("Draw [W] Range", 1)

    menu:add_label("version "..(tostring(self.version)))
end    
