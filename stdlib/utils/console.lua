--Console Code from adil modified for STDlib
local Gui = require("stdlib.gui.gui")

local function create_gui_player(player)
	if player.gui.left.console then player.gui.left.console.destroy() end
	local c=player.gui.left.add{type='frame',name='console',direction='horizontal'}
	local t = c.add{type='textfield',name='console_line'}
  t.style.minimal_width=600
  t.style.maximal_width=600
	c.add{type='button', name='console_enter',caption='<', tooltip="Run Script"}
  c.add{type='button', name='console_clear', caption='C', tooltip="Clear Input"}
  c.add{type='button', name ='console_close', caption="X", tooltip="Close"}
end

--console.create_gui = function(player)
local function create_gui(player)
	--if not sent with a player, then enable for all players?
	if not (player and player.valid) then
		for _, cur_player in pairs(game.players) do
			create_gui_player(cur_player)
		end
	else
		create_gui_player(player)
	end
end

--local second=false
local function handler(event)
	local i=event.element.player_index
	local p=game.players[event.player_index]
	--if second then second=false return end
	local s=p.gui.left.console.console_line.text
	assert(loadstring(s))()
	game.write_file('console.log',s..'\n',true,i)
	--second=true
end
Gui.on_click("console_enter", handler)

local function close(event)
	local p = game.players[event.player_index]
	p.gui.left.console.destroy()
end
Gui.on_click("console_close", close)

local function clear(event)
  local p = game.players[event.player_index]
	p.gui.left.console.console_line.text = ""
end
Gui.on_click("console_clear", clear)


--Fallback interface --just using a require("stdlib.console") will create the console
--interface, only recomended for local testing.
if not remote.interfaces.console then
	remote.add_interface("console", {show = function(player) create_gui(player) end})
end

--return the create_gui function
--remote.add_interface("my_interface", {show=require("stdlib.console")})
return create_gui