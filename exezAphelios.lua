if game.local_player.champ_name ~= "Aphelios" then
    return
end

local Aphelios = {}
Aphelios.__index = Aphelios

function Aphelios:new()
    local obj = {}
    setmetatable(obj, Aphelios)
    obj:init()
    return obj
end

function Aphelios:init()
    local LuaVersion = 0.1
	local LuaName = "exezAphelios"
	local lua_file_name = "exezAphelios.lua"
	--local lua_url = "https://raw.githubusercontent.com/exez-42/BruhWalker"
	--local version_url = "https://raw.githubusercontent.com/exez-42/BruhWalker"
    --[[do
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
							console:log("Please Reload via F5!..")
						end
					end)
				end
			end)
		end
		AutoUpdate()
	end]]

    --[[self.myHero = game.local_player
    self.qDelay = nil
    self.aaComplete = false
    self.rTarget = nil
    self.version = 0.4
    self:create_menu()

    client:set_event_callback("on_tick_always", function() self:on_tick_always() end)
    client:set_event_callback("on_post_attack", function(target) self:on_post_attack(target) end)
    client:set_event_callback("on_draw", function() self:on_draw() end)
    if file_manager:file_exists("DynastyOrb.lua") then
        orbwalker:AddCallback("OnAfterAttack", function(target) self:OnAfterAttack(target) end)
    end]]
end